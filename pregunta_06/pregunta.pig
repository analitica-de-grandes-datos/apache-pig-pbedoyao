/*
Pregunta
===========================================================================

Para el archivo `data.tsv` Calcule la cantidad de registros por clave de la 
columna 3. En otras palabras, cuántos registros hay que tengan la clave 
`aaa`?

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

Columna = FOREACH TblPregunta GENERATE lista;
ColumnaSeparada = FOREACH Columna GENERATE FLATTEN(TOKENIZE(lista)) AS letra;
ColumnaFiltrada = FOREACH ColumnaSeparada GENERATE REPLACE (letra,'([^a-zA-Z\\s]+)','') as letra;
Agrupacion = GROUP ColumnaFiltrada BY letra;
ContarLetra = FOREACH Agrupacion GENERATE group, COUNT(ColumnaFiltrada);
STORE ContarLetra INTO 'output' USING PigStorage(',');