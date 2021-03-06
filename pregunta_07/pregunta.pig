/*
Pregunta
===========================================================================

Para el archivo `data.tsv` genere una tabla que contenga la primera columna,
la cantidad de elementos en la columna 2 y la cantidad de elementos en la 
columna 3 separados por coma. La tabla debe estar ordenada por las 
columnas 1, 2 y 3.

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/

TblPregunta = LOAD 'data.tsv' USING PigStorage('\t')
    AS (
            letra:chararray,
            ConjuntoLetras:chararray,
            lista:chararray
    );

Columnas = FOREACH TblPregunta GENERATE letra, TOKENIZE(ConjuntoLetras,',') AS ConjuntoSeparada, TOKENIZE(lista,',') AS listaSeparada;
ColumnasAgrupadas = FOREACH Columnas GENERATE letra, COUNT(ConjuntoSeparada) AS CuentaConjuntoSeparada, COUNT(listaSeparada) AS cuentalistaSeparada;
ColumnasOrdenadas = ORDER ColumnasAgrupadas BY letra, CuentaConjuntoSeparada, cuentalistaSeparada asc;
STORE ColumnasOrdenadas INTO 'output' USING PigStorage(',');