/*
Pregunta
===========================================================================

Para responder la pregunta use el archivo `data.csv`.

Genere una relación con el apellido y su longitud. Ordene por longitud y 
por apellido. Obtenga la siguiente salida.

  Hamilton,8
  Garrett,7
  Holcomb,7
  Coffey,6
  Conway,6

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

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
Columna = FOREACH Columnas GENERATE Nombre, SIZE(Nombre) AS tamano;
ColumnasOrdenadas = ORDER Columnas BY Nombre asc;
ColumnasTop = LIMIT Columnas 5;
STORE ColumnasTop INTO 'output' USING PigStorage(',');
