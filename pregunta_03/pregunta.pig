/*
Pregunta
===========================================================================

Obtenga los cinco (5) valores más pequeños de la 3ra columna.

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/

TblPregunta = LOAD 'data.tsv' USING PigStorage('\t')
    AS (    letra:chararray,
            fecha:chararray,
            valor:int
        );

Valores = FOREACH TblPregunta GENERATE valor;
Ordenado = ORDER Valores BY valor asc;
Top = LIMIT Ordenado 5;
STORE Top INTO 'output' USING PigStorage(',');
