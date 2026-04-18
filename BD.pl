% BASE DE CONOCIMIENTO

% profesion(Nombre, Afinidades, Antagonias).

profesion(ingenieria_computadores,
    [matematicas, tecnologia, logica, programacion, problemas, trabajo_individual, analisis],
    [personas, trabajo_social, comunicacion_intensa]).

profesion(neurociencia,
    [biologia, investigacion, analisis, ciencia, curiosidad, laboratorio, lectura, cerebro],
    [rutina, negocios, trabajo_repetitivo]).

profesion(medicina,
    [personas, biologia, ayuda, presion, responsabilidad, accion, trabajo_en_equipo],
    [trabajo_individual, computadoras, rutina]).

profesion(derecho,
    [lectura, argumentacion, debate, analisis, comunicacion, justicia],
    [matematicas, tecnologia, laboratorio]).

profesion(arquitectura,
    [creatividad, diseño, visual, planos, construccion, detalle],
    [rutina, trabajo_repetitivo, poca_creatividad]).

profesion(diseño_grafico,
    [creatividad, arte, visual, tecnologia, diseño, innovacion],
    [matematicas, logica, rutina]).

profesion(periodismo,
    [comunicacion, investigacion, escritura, personas, actualidad, campo],
    [matematicas, trabajo_aislado, rutina]).

profesion(educacion,
    [personas, enseñar, paciencia, comunicacion, vocacion, servicio],
    [trabajo_aislado, tecnologia_intensa]).

profesion(ciencias_ambientales,
    [naturaleza, investigacion, campo, sostenibilidad, ciencia, aire_libre],
    [oficina, rutina, trabajo_cerrado]).

profesion(emprendimiento,
    [negocios, liderazgo, riesgo, innovacion, independencia, creatividad],
    [rutina, dependencia, estabilidad]).

profesion(psicologia,
    [personas, empatia, escucha, ayuda, analisis, comportamiento],
    [matematicas, trabajo_aislado]).

profesion(ingenieria_industrial,
    [optimizacion, procesos, logica, organizacion, eficiencia, analisis],
    [creatividad_artistica, improvisacion]).

profesion(contaduria,
    [numeros, organizacion, detalle, finanzas, analisis, responsabilidad],
    [creatividad, riesgo, improvisacion]).

profesion(marketing,
    [creatividad, comunicacion, estrategia, ventas, mercado, innovacion],
    [rutina, trabajo_tecnico_puro]).

profesion(turismo,
    [personas, viajes, comunicacion, cultura, idiomas, servicio],
    [oficina, rutina, trabajo_aislado]).

profesion(gastronomia,
    [creatividad, cocina, sabores, innovacion, detalle, trabajo_manual],
    [oficina, rutina, trabajo_teorico]).

profesion(ingenieria_civil,
    [matematicas, construccion, planos, analisis, fisica, proyectos],
    [trabajo_social, creatividad_artistica]).

profesion(fisica,
    [matematicas, ciencia, investigacion, analisis, teoria, logica, universo],
    [personas, comunicacion_intensa]).

profesion(biologia,
    [naturaleza, ciencia, investigacion, laboratorio, campo],
    [oficina, rutina]).

profesion(enfermeria,
    [personas, ayuda, cuidado, trabajo_en_equipo, vocacion],
    [trabajo_individual, tecnologia_pura]).

% LISTA DE PROFESIONES

lista_profesiones([
    ingenieria_computadores,
    neurociencia,
    medicina,
    derecho,
    arquitectura,
    diseño_grafico,
    periodismo,
    educacion,
    ciencias_ambientales,
    emprendimiento,
    psicologia,
    ingenieria_industrial,
    contaduria,
    marketing,
    turismo,
    gastronomia,
    ingenieria_civil,
    fisica,
    biologia,
    enfermeria
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