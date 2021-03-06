/*
Pregunta
===========================================================================

Para el archivo `data.tsv` compute Calcule la cantidad de registros en que 
aparece cada letra minúscula en la columna 2.

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/
TblPregunta = LOAD 'data.tsv' USING PigStorage('\t')
    AS (
            letra:chararray,
            ConjuntoLetras:chararray,
            lista:int
    );

Columna = FOREACH TblPregunta GENERATE ConjuntoLetras;
columnaSeparada = FOREACH Columna GENERATE FLATTEN(TOKENIZE(ConjuntoLetras)) AS letra;
columnaFiltrada = FILTER columnaSeparada BY (letra MATCHES '.*[a-z].*');
Agrupacion = GROUP columnaFiltrada BY letra;
ContarLetra = FOREACH Agrupacion GENERATE group, COUNT(columnaFiltrada);
STORE ContarLetra INTO 'output' USING PigStorage(',');