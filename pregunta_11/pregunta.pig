/*
Pregunta
===========================================================================

Para responder la pregunta use el archivo `data.csv`.

Escriba el código que genere la siguiente salida.

   Boyer,BOYER,boyer
   Coffey,COFFEY,coffey
   Conway,CONWAY,conway
   Crane,CRANE,crane
   Diaz,DIAZ,diaz
   Estes,ESTES,estes
   Fry,FRY,fry
   Garrett,GARRETT,garrett
   Guy,GUY,guy
   Hamilton,HAMILTON,hamilton
   Holcomb,HOLCOMB,holcomb
   Jarvis,JARVIS,jarvis
   Kinney,KINNEY,kinney
   Klein,KLEIN,klein
   Knight,KNIGHT,knight
   Noel,NOEL,noel
   Sexton,SEXTON,sexton
   Silva,SILVA,silva

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

Columnas = FOREACH TblPregunta GENERATE Apellido , UPPER(Apellido) AS Mayuscula, LOWER(Apellido) AS Minuscula;
ColumnasOrdenada = ORDER Columnas BY Apellido, Mayuscula, Minuscula asc; 
STORE ColumnasOrdenada INTO 'output' USING PigStorage(',');