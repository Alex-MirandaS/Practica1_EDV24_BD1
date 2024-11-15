/*Para un estudiante determinado que, ha cerrado en alguna carrera, dar el nombre
de los estudiantes que llevaron con él todos los cursos.*/

CREATE VIEW estudiante_curso AS
SELECT e.carne, e.nombre AS estudiante, c.id AS curso_id, c.nombre AS curso, s.id AS seccion_id, s.seccion FROM estudiante AS e
INNER JOIN asignacion AS a
ON a.id_estudiante = e.carne 
INNER JOIN seccion AS s
ON a.id_seccion = s.id 
INNER JOIN curso AS c
ON s.id_curso = c.id
WHERE e.carne = ""

CREATE VIEW estudiantes_curso AS
SELECT e.carne, e.nombre AS estudiante, s.id AS seccion_id FROM estudiante AS e
INNER JOIN asignacion AS a
ON a.id_estudiante = e.carne 
INNER JOIN seccion AS s
ON a.id_seccion = s.id 
INNER JOIN curso AS c
ON s.id_curso = c.id
WHERE e.carne != ""


SELECT * FROM estudiante_curso AS ec
INNER JOIN estudiantes_curso AS esc
ON ec.seccion_id = esc.seccion_id


DELIMITER //
CREATE TRIGGER INS_BITACORA
BEFORE INSERT ON tabla
FOR EACH ROW
BEGIN 
    INSERT INTO bitacora(accion, fecha)
    VALUES (CONCAT('Se creó el departamento: ', NEW.nombre))/*NEW.atributo hace referencia al registro evaluado, si es un anterior se pone OLD*/
END

DELIMITER $$
/*VERIFICAR SI YA SE AGREGÓ UNA CARRERA*/
CREATE TRIGGER insertar_carrera
BEFORE INSERT ON carrera
FOR EACH ROW
BEGIN
    -- Verificar si ya existe un registro con el mismo id_empleado y nombre
    IF EXISTS (
        SELECT 1
        FROM carrera
        WHERE id = NEW.id
          AND nombre = NEW.nombre/*Eliminar*/
    ) THEN
        -- Generar un error si ya existe el registro
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Registro duplicado: el id_curso y el nombre ya existen';
    END IF;
END$$

DELIMITER ;












