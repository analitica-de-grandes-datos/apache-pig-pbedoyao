/*
Pregunta
===========================================================================

Para responder la pregunta use el archivo `data.csv`.

Escriba el código equivalente a la siguiente consulta en SQL.

   SELECT
       color
   FROM 
       u 
   WHERE 
       color 
   LIKE 'b%';

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        /* >>> Escriba su respuesta a partir de este punto <<< */
*/

TblPregunta = LOAD 'data.csv' USING PigStorage(',')
    AS (
            Indice: int,
            Nombre:chararray,
            Apellido:chararray,
            Fecha:chararray,
            Color:chararray,
            Valor:chararray
        );

Columna = FOREACH TblPregunta GENERATE Color;
FiltroColumna = FILTER Columna BY (Color MATCHES '.*^[bB].*'); 
STORE FiltroColumna INTO 'output' USING PigStorage(',');