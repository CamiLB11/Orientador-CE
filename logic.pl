:- module(logic, [iniciar/0]).

:- use_module(bnf).
:- consult('BD.pl').

% variables dinamicas


:- dynamic respuesta_usuario/2.


% Inicio


iniciar :-
    retractall(respuesta_usuario(_,_,_)),
    writeln('=== SISTEMA VOCACIONAL INTELIGENTE ==='),
    writeln('Responde libremente (ej: "me encanta la tecnologia", "odio las matematicas")'),
    nl,
    hacer_preguntas,
    generar_recomendacion.

%Flujo de preguntas

hacer_preguntas :-
    lista_preguntas(Ps),
    hacer_lista_preguntas(Ps).

lista_preguntas([
    '¿Te gustan las matematicas?',
    '¿Te interesa la tecnologia?',
    '¿Te gusta trabajar con personas?',
    '¿Te gusta la creatividad o el arte?',
    '¿Te interesa la investigacion?',
    '¿Te gusta ayudar a otros?',
    '¿Te gusta liderar grupos?',
    '¿Prefieres trabajar en equipo?',
    '¿Te gusta la naturaleza o el aire libre?',
    '¿Te interesan los negocios o emprender?',
    '¿Te gusta analizar problemas?',
    '¿Te gusta comunicar ideas (hablar o escribir)?',
    '¿Prefieres trabajar solo?',
    '¿Te gusta resolver desafios?',
    '¿Te interesa la ciencia o experimentos?'
]).

hacer_lista_preguntas([]).
hacer_lista_preguntas([P|T]) :-
    preguntar(P),
    hacer_lista_preguntas(T).

preguntar(Pregunta) :-
    writeln(Pregunta),
    leer_y_procesar_respuesta(Tema, Intencion, Peso),
    guardar_respuesta(Tema, Intencion, Peso),
    nl.

leer_y_procesar_respuesta(Tema, Intencion, Peso) :-
    read_line_to_string(user_input, Input),
    bnf:parsear_respuesta(Input, Intencion0, Tema0),

    ( Tema0 = ninguno ->
        writeln('No entendi bien tu respuesta, intenta explicarlo de otra forma.'),
        leer_y_procesar_respuesta(Tema, Intencion, Peso)

    ; Intencion0 = no_entendido ->
        writeln('No logre identificar si es positivo o negativo, intenta de nuevo.'),
        leer_y_procesar_respuesta(Tema, Intencion, Peso)

    ; calcular_peso(Input, Intencion0, Peso),
      Tema = Tema0,
      Intencion = Intencion0
    ).


% Se calcula cuanto pesa cada afirmacion o negacion

calcular_peso(Input, afirmativo, Peso) :-
    string_lower(Input, L),
    ( sub_string(L, _, _, _, "encanta") -> Peso = 3
    ; sub_string(L, _, _, _, "amo") -> Peso = 3
    ; sub_string(L, _, _, _, "mucho") -> Peso = 3
    ; sub_string(L, _, _, _, "gusta") -> Peso = 2
    ; Peso = 1 ).

calcular_peso(Input, negativo, Peso) :-
    string_lower(Input, L),
    ( sub_string(L, _, _, _, "odio") -> Peso = -3
    ; sub_string(L, _, _, _, "detesto") -> Peso = -3
    ; sub_string(L, _, _, _, "no") -> Peso = -2
    ; Peso = -1 ).

calcular_peso(_, _, 0).


guardar_respuesta(Tema, _, _) :-
    Tema = ninguno, !.

guardar_respuesta(Tema, Intencion, Peso) :-
    assertz(respuesta_usuario(Tema, Intencion, Peso)).


%Suma de puntajes

puntaje_profesion(Profesion, PuntajeFinal) :-
    obtener_afinidades(Profesion, Afinidades),
    obtener_antagonias(Profesion, Antagonias),

    puntaje_afinidades(Afinidades, P1),
    puntaje_antagonias(Antagonias, P2),

    length(Afinidades, NA),
    length(Antagonias, NN),
    Total is NA + NN + 1,

    PuntajeFinal is (P1 + P2) / Total.

% Afinidades suman
puntaje_afinidades([], 0).
puntaje_afinidades([A|T], Puntaje) :-
    findall(P, respuesta_usuario(A, _, P), Lista),
    sum_list(Lista, Suma),
    puntaje_afinidades(T, R),
    Puntaje is Suma + R.

% Antagonias penalizan fuerte
puntaje_antagonias([], 0).
puntaje_antagonias([A|T], Puntaje) :-
    findall(P, respuesta_usuario(A, _, P), Lista),
    sum_list(Lista, Suma),
    Penalizacion is -2 * Suma,
    puntaje_antagonias(T, R),
    Puntaje is Penalizacion + R.

% Se genera la recomendacion 


generar_recomendacion :-
    lista_profesiones(Lista),
    evaluar_profesiones(Lista, Resultados),
    sort(2, @>=, Resultados, Ordenados),
    mostrar_top3(Ordenados).

evaluar_profesiones([], []).
evaluar_profesiones([P|T], [(P, Puntaje)|R]) :-
    puntaje_profesion(P, Puntaje),
    evaluar_profesiones(T, R).


% Se hace un top 3 de carreras
mostrar_top3([A,B,C|_]) :-
    nl,
    writeln('=== MEJORES OPCIONES ==='),
    mostrar(A),
    mostrar(B),
    mostrar(C).

mostrar((Profesion, Puntaje)) :-
    format('~w -> Puntaje: ~2f~n', [Profesion, Puntaje]),
    explicar_recomendacion(Profesion),
    nl.



% Recomendaciones

explicar_recomendacion(Profesion) :-
    obtener_afinidades(Profesion, Afinidades),
    writeln('Coincidencias con tus intereses:'),
    mostrar_coincidencias(Afinidades).

mostrar_coincidencias([]).
mostrar_coincidencias([A|T]) :-
    ( respuesta_usuario(A, _, P), P > 0
        -> format('- ~w~n', [A])
        ; true ),
    mostrar_coincidencias(T).