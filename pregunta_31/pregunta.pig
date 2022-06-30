/*
Pregunta
===========================================================================

Para responder la pregunta use el archivo `data.csv`.

Cuente la cantidad de personas nacidas por año.

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local

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

Columna = GROUP TblPregunta BY GetYear(Fecha);
ContarColumna = FOREACH Columna GENERATE group, COUNT(TblPregunta); 
STORE ContarColumna INTO 'output' USING PigStorage(',');