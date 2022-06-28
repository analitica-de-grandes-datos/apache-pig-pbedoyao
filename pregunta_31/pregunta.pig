/*
Pregunta
===========================================================================

Para responder la pregunta use el archivo `data.csv`.

Cuente la cantidad de personas nacidas por año.

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
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

Columna = FOREACH TblPregunta GENERATE Fecha;
ColumnaAno = GROUP Columna BY GetYear(Fecha);
ContarAno = FOREACH Columnas GENERATE group, COUNT(Columna); 
STORE ContarAno INTO 'output' USING PigStorage(',');

