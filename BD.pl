% BASE DE CONOCIMIENTO

% profesion(Nombre, Afinidades, Antagonias).

profesion(ingenieria_computadores,
    [matematicas, tecnologia, logica, programacion, problemas, trabajo_individual, analisis],
    [personas, trabajo_social, comunicacion_intensa]).

profesion(neurociencia,
    [biologia, investigacion, analisis, ciencia, curiosidad, laboratorio, lectura],
    [rutina, negocios, trabajo_repetitivo]).

profesion(medicina,
    [personas, biologia, ayuda, presion, responsabilidad, accion, trabajo_en_equipo],
    [trabajo_individual, computadoras, rutina]).

profesion(derecho,
    [lectura, argumentacion, debate, analisis, comunicacion, justicia],
    [matematicas, tecnologia, laboratorio]).

profesion(arquitectura,
    [creatividad, diseno, visual, planos, construccion, detalle],
    [rutina, trabajo_repetitivo, poca_creatividad]).

profesion(diseno_grafico,
    [creatividad, arte, visual, tecnologia, diseno, innovacion],
    [matematicas, logica, rutina]).

profesion(periodismo,
    [comunicacion, investigacion, escritura, personas, actualidad, campo],
    [matematicas, trabajo_aislado, rutina]).

profesion(educacion,
    [personas, ensenar, paciencia, comunicacion, vocacion, servicio],
    [trabajo_aislado, tecnologia_intensa]).

profesion(ciencias_ambientales,
    [naturaleza, investigacion, campo, sostenibilidad, ciencia, aire_libre],
    [oficina, rutina, trabajo_cerrado]).

profesion(emprendimiento,
    [negocios, liderazgo, riesgo, innovacion, independencia, creatividad],
    [rutina, dependencia, estabilidad]).

% LISTA DE PROFESIONES

lista_profesiones([
    ingenieria_computadores,
    neurociencia,
    medicina,
    derecho,
    arquitectura,
    diseno_grafico,
    periodismo,
    educacion,
    ciencias_ambientales,
    emprendimiento
]).

% REGLAS AUXILIARES

tiene_afinidad(Profesion, Afinidad) :-
    profesion(Profesion, Afinidades, _),
    member(Afinidad, Afinidades).

tiene_antagonia(Profesion, Antagonia) :-
    profesion(Profesion, _, Antagonias),
    member(Antagonia, Antagonias).

obtener_afinidades(Profesion, Afinidades) :-
    profesion(Profesion, Afinidades, _).

obtener_antagonias(Profesion, Antagonias) :-
    profesion(Profesion, _, Antagonias).
