:- module(bnf, [parsear_respuesta/3]).


% SECCIÓN 1: TOKENIZADOR
% Convierte una cadena de texto en lista de atomos en minuscula

% tokenizar(+OracionString, -Tokens)
% Divide la oracion en palabras y las convierte a atomos
tokenizar(OracionStr, Tokens) :-
    string_lower(OracionStr, Lower),
    split_string(Lower, " .,!?;:¿¡", " ", Parts),
    exclude(=(""), Parts, Filtered),
    maplist(atom_string, Tokens, Filtered).


% SECCIÓN 2: Diccionarios de palabras

% Pronombres
pronombre(yo).
pronombre(el).
pronombre(ella).
pronombre(nosotros).

% Determinantes
determinante(el).
determinante(la).
determinante(los).
determinante(las).
determinante(un).
determinante(una).
determinante(mucho).
determinante(mucha).
determinante(muy).
determinante(bastante).
determinante(demasiado).
determinante(poco).
determinante(poca).

% Verbos copulativos y auxiliares
verbo_auxiliar(soy).
verbo_auxiliar(soy).
verbo_auxiliar(es).
verbo_auxiliar(estoy).
verbo_auxiliar(me).
verbo_auxiliar(me).
verbo_auxiliar(nos).
verbo_auxiliar(tengo).

% Palabras de negacion
palabra_negacion(no).
palabra_negacion(nunca).
palabra_negacion(jamas).
palabra_negacion(tampoco).
palabra_negacion(para_nada).
palabra_negacion(ni).

% Verbos con carga afirmativa fuerte
verbo_afirmativo(amo).
verbo_afirmativo(adoro).
verbo_afirmativo(disfruto).
verbo_afirmativo(encanta).
verbo_afirmativo(gusta).
verbo_afirmativo(fascina).
verbo_afirmativo(interesa).
verbo_afirmativo(apasiona).
verbo_afirmativo(prefiero).
verbo_afirmativo(quiero).
verbo_afirmativo(me).     
verbo_afirmativo(habil).  
verbo_afirmativo(bueno).  

% Verbos con carga negativa fuerte
verbo_negativo(odio).
verbo_negativo(detesto).
verbo_negativo(aborrezo).
verbo_negativo(evito).
verbo_negativo(molesta).
verbo_negativo(aburre).
verbo_negativo(disgusta).
verbo_negativo(cansa).

% Palabras de cantidad/intensidad 
intensificador(mucho).
intensificador(mucha).
intensificador(muy).
intensificador(bastante).
intensificador(demasiado).
intensificador(poco).      
intensificador(poca).
intensificador(tanto).

