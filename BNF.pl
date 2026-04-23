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

% SECCIÓN 3: MAPEO DE TEMAS
% Conecta palabras del usuario con afinidades/antagonias 

% mapeo_tema(+ListaPalabras, -AtomoAfinidad)

% Matematicas
mapeo_tema(matematicas, matematicas).
mapeo_tema(numeros, matematicas).
mapeo_tema(calculo, matematicas).
mapeo_tema(algebra, matematicas).
mapeo_tema(mates, matematicas).
mapeo_tema(aritmetica, matematicas).

% Tecnologia
mapeo_tema(tecnologia, tecnologia).
mapeo_tema(computador, tecnologia).
mapeo_tema(computadora, tecnologia).
mapeo_tema(computadoras, tecnologia).
mapeo_tema(programar, tecnologia).
mapeo_tema(programacion, tecnologia).
mapeo_tema(software, tecnologia).
mapeo_tema(apps, tecnologia).
mapeo_tema(dispositivos, tecnologia).

% Personas / trabajo social
mapeo_tema(personas, personas).
mapeo_tema(gente, personas).
mapeo_tema(humanos, personas).
mapeo_tema(sociedad, personas).
mapeo_tema(interactuar, personas).
mapeo_tema(social, personas).

% Creatividad
mapeo_tema(creatividad, creatividad).
mapeo_tema(crear, creatividad).
mapeo_tema(inventar, creatividad).
mapeo_tema(arte, creatividad).
mapeo_tema(disenar, creatividad).    
mapeo_tema(imaginar, creatividad).
mapeo_tema(innovar, creatividad).

% Investigacion
mapeo_tema(investigacion, investigacion).
mapeo_tema(investigar, investigacion).
mapeo_tema(explorar, investigacion).
mapeo_tema(descubrir, investigacion).
mapeo_tema(ciencia, ciencia).
mapeo_tema(experimentos, laboratorio).
mapeo_tema(laboratorio, laboratorio).

% Comunicacion
mapeo_tema(comunicacion, comunicacion).
mapeo_tema(hablar, comunicacion).
mapeo_tema(expresar, comunicacion).
mapeo_tema(debate, comunicacion).
mapeo_tema(debatir, comunicacion).
mapeo_tema(argumentar, argumentacion).
mapeo_tema(escritura, escritura).
mapeo_tema(escribir, escritura).

% Escucha
mapeo_tema(escuchar, escucha).
mapeo_tema(escucho, escucha).
mapeo_tema(oir, escucha).
mapeo_tema(atender, escucha).
mapeo_tema(escucha, escucha).

% Resolucion de problemas
mapeo_tema(problemas, resolucion_problemas).
mapeo_tema(resolver, resolucion_problemas).
mapeo_tema(solucionar, resolucion_problemas).
mapeo_tema(desafios, resolucion_problemas).
mapeo_tema(retos, resolucion_problemas).
mapeo_tema(logica, logica).

% Trabajo individual vs equipo
mapeo_tema(solo, trabajo_individual).
mapeo_tema(independiente, trabajo_individual).
mapeo_tema(equipo, trabajo_equipo).
mapeo_tema(colaborar, trabajo_equipo).
mapeo_tema(grupo, trabajo_equipo).

% Naturaleza y medio ambiente
mapeo_tema(naturaleza, naturaleza).
mapeo_tema(campo, campo).
mapeo_tema(ambiente, naturaleza).
mapeo_tema(animales, naturaleza).
mapeo_tema(aire, aire_libre).
mapeo_tema(ecologia, naturaleza).

% Analisis
mapeo_tema(analizar, analisis).
mapeo_tema(analisis, analisis).
mapeo_tema(razonar, analisis).
mapeo_tema(pensar, analisis).

% Negocios y emprendimiento
mapeo_tema(negocios, negocios).
mapeo_tema(empresa, negocios).
mapeo_tema(emprender, negocios).
mapeo_tema(liderazgo, liderazgo).
mapeo_tema(liderar, liderazgo).
mapeo_tema(dinero, finanzas).
mapeo_tema(finanzas, finanzas).

% Ayuda y servicio
mapeo_tema(ayudar, ayuda).
mapeo_tema(ayuda, ayuda).
mapeo_tema(servir, servicio).
mapeo_tema(servicio, servicio).
mapeo_tema(cuidar, cuidado).
mapeo_tema(cuidado, cuidado).
mapeo_tema(empatia, empatia).
mapeo_tema(empatico, empatia).

% Biologia y medicina
mapeo_tema(biologia, biologia).
mapeo_tema(cuerpo, biologia).
mapeo_tema(medicina, biologia).
mapeo_tema(cerebro, cerebro).
mapeo_tema(salud, biologia).

