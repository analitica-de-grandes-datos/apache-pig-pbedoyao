/*
Pregunta
===========================================================================

Para el archivo `data.tsv` compute la cantidad de registros por letra de la 
columna 2 y clave de al columna 3; esto es, por ejemplo, la cantidad de 
registros en tienen la letra `b` en la columna 2 y la clave `jjj` en la 
columna 3 es:

  ((b,jjj), 216)

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

Columnas= FOREACH TblPregunta GENERATE FLATTEN(TOKENIZE(ConjuntoLetras, ',')) AS ConjuntoSeparada, FLATTEN(TOKENIZE(lista, ',')) AS listaSeparada;
ColumnasAgrupadas = FOREACH Columnas GENERATE REPLACE(ConjuntoSeparada, '([^a-zA-Z\\s]+)','') AS letra, REPLACE(listaSeparada,'([^a-zA-Z\\s]+)','') AS clave;
ColumnaTupla = FOREACH ColumnasAgrupadas GENERATE TOTUPLE(letra,clave) as tupla; 
ColumnaAgrupada = GROUP ColumnaTupla BY tupla;
CuentaColumna = FOREACH ColumnaAgrupada GENERATE group, COUNT(ColumnaTupla); 
STORE CuentaColumna INTO 'output' USING PigStorage(',');
