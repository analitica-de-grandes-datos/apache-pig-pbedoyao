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