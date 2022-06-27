/*
Pregunta
===========================================================================

Para el archivo `data.csv` escriba una consulta en Pig que genere la 
siguiente salida:

  Vivian@Hamilton
  Karen@Holcomb
  Cody@Garrett
  Roth@Fry
  Zoe@Conway
  Gretchen@Kinney
  Driscoll@Klein
  Karyn@Diaz
  Merritt@Guy
  Kylan@Sexton
  Jordan@Estes
  Hope@Coffey
  Vivian@Crane
  Clio@Noel
  Hope@Silva
  Ayanna@Jarvis
  Chanda@Boyer
  Chadwick@Knight

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

--$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/

TblPregunta = LOAD 'data.tsv' USING PigStorage(',')
    AS (
            Indice: int,
            Nombre:chararray,
            Apellido:chararray,
            Fecha:chararray,
            Color:chararray,
            Valor:chararray
    );

Columnas = FOREACH TblPregunta GENERATE Nombre, Apellido;
Columna = FOREACH Columnas GENERATE CONCAT(Nombre,'@',Apellido);
STORE Columna INTO 'output' USING PigStorage(',');