--ALTERA LA TABLA PARA QUE SE VERIFIQUE EL EL NOMBRE DE LA CARRERA SEAN SOLAMENTE LETRAS--
ALTER TABLE `registroacademico_f1`.`carrera`
ADD CONSTRAINT `chk_nombre_carrera_formato` CHECK (`nombre` REGEXP '^[a-zA-Z]+$');

--SE CREA EL PROCESO DE VERIFICACION 
DELIMITER $$

CREATE PROCEDURE InsertCarrera(IN id_unidad_academica_param INT, IN nombre_param VARCHAR(100))
BEGIN
    -- Verificar que el nombre de la carrera solo contenga letras y espacios
    IF NOT (nombre_param REGEXP '^[a-zA-Z ]+$') THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El nombre de la carrera debe contener solo letras y espacios';
    ELSE
        -- Verificar si ya existe una carrera con el mismo nombre
        IF EXISTS (SELECT * FROM registroacademico_f1.carrera WHERE nombre = nombre_param) THEN
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'La carrera ya existe';
        ELSE
            -- Insertar la nueva carrera
            INSERT INTO registroacademico_f1.carrera (id_unidad_academica, nombre) VALUES (id_unidad_academica_param, nombre_param);
        END IF;
    END IF;
END$$

DELIMITER ;


--PROBAMOS EL PROCEDIMIENTO
CALL InsertCarrera(1,'Ingeniería Mecanica');



    IF NOT (nombre_p REGEXP '^[a-zA-Z ]+$' || apellido_p REGEXP '^[a-zA-Z ]+$') THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El nombre de la carrera debe contener solo letras y espacios';
    ELSE
        IF NOT (correo_p REGEXP '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$') THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El correco no es válido';
    ELSE
        IF NOT (telefono_p REGEXP '\\d{2,5}$') THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El telefono no es válido';
    ELSE
        -- OTRA VALIDACIÓN

    END IF;


    END IF;




    END IF;

    telefono REGEXP '\\d{2,5}$'


    `correo` REGEXP '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$'