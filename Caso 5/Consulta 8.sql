/*Dar el nombre del estudiante nombre de la carrera, promedio y número de créditos
ganados, para los estudiantes que han cerrado en alguna carrera, estén inscritos en
ella o no.*/

CREATE VIEW estudiante_creditos AS
SELECT estudiante.carne, estudiante.nombre, sum(curso.creditos) as total_creditos  FROM estudiante
INNER JOIN asignacion as a
ON estudiante.carne = a.id_estudiante
INNER JOIN acta_nota as an
ON an.id_asignacion = a.id
INNER JOIN aprobacion_curso as ac
ON ac.acta_nota_codigo = an.id
INNER JOIN seccion as sec
ON a.id_seccion = sec.id
INNER JOIN curso
ON sec.id_curso = curso.id
WHERE ac.aprobado = true
GROUP BY estudiante.carne
;



select estudiante.carne, estudiante.nombre, estudiante_creditos.total_creditos, carrera.nombre, promedio_estudiante.promedio
from estudiante
INNER JOIN inscripcion
ON estudiante.carne = inscripcion.id_estudiante
INNER JOIN pensum
ON inscripcion.id_pensum = pensum.id
INNER JOIN carrera
ON pensum.id_carrera = carrera.id
INNER JOIN estudiante_creditos
ON estudiante.carne = estudiante_creditos.carne
INNER JOIN promedio_estudiante 
ON estudiante.carne = promedio_estudiante.carne
WHERE estudiante_creditos.total_creditos >= pensum.creditos_cierre
;
/*MODIFICAR EL CODIGO DE LA CARRERA POR EL VERDADERO CODIGO DE INGENIERIA EN SISTEMAS*/