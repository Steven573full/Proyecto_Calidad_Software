drop schema pruebas;
CREATE SCHEMA `pruebas` DEFAULT CHARACTER SET utf8mb4 ;
use pruebas;
CREATE TABLE `pruebas`.`persona` (
`id` INT NOT NULL AUTO_INCREMENT,
`nombre` VARCHAR(20) NULL,
`apellidos` VARCHAR(30) NULL,
`email` VARCHAR(20) NULL,
`telefono` VARCHAR(15) NULL,
PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

INSERT INTO `pruebas`.`persona` (`nombre`, `apellidos`, `email`, `telefono`) VALUES ('Juan', 'Mena Contreras', 'jmena@gmail.com', '4565-8989');
INSERT INTO `pruebas`.`persona` (`nombre`, `apellidos`, `email`, `telefono`) VALUES ('Rebeca', 'Arguedas Alfaro', 'rarguedas@gmail.com', '5689-8484');

CREATE TABLE `pruebas`.`persona1` (
`id` INT NOT NULL AUTO_INCREMENT,
`nombre` VARCHAR(20) NULL,
`apellidos` VARCHAR(30) NULL,
`email` VARCHAR(20) NULL,
`telefono` VARCHAR(15) NULL,
PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

INSERT INTO `pruebas`.`persona1` (`nombre`, `apellidos`, `email`, `telefono`) VALUES ('Juan', 'Mena Contreras', 'jmena@gmail.com', '4565-8989');
INSERT INTO `pruebas`.`persona1` (`nombre`, `apellidos`, `email`, `telefono`) VALUES ('Rebeca', 'Arguedas Alfaro', 'rarguedas@gmail.com', '5689-8484');

CREATE TABLE `pruebas`.`evento` (
`id` INT NOT NULL AUTO_INCREMENT,
`nombre` VARCHAR(20) NULL,
`fecha` VARCHAR(30) NULL,
`descripcion` VARCHAR(40) NULL,
PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;
INSERT INTO `pruebas`.`evento` (`nombre`, `fecha`, `descripcion`) VALUES ('Playa Ballena', '11-9-2022', 'Limpieza de playa');
INSERT INTO `pruebas`.`evento` (`nombre`, `fecha`, `descripcion`) VALUES ('Río Celeste', '11-9-2022', 'Limpieza de río');

CREATE TABLE `pruebas`.`domicilio` (
`id` INT NOT NULL AUTO_INCREMENT,
`detalle` VARCHAR(20) NULL,
`distrito` VARCHAR(20) NULL,
`canton` VARCHAR(20) NULL,
PRIMARY KEY (`id`));
CREATE TABLE `pruebas`.`contacto` (
`id` INT NOT NULL AUTO_INCREMENT,
`telefono` VARCHAR(15) NULL,
`email` VARCHAR(25) NULL,
PRIMARY KEY (`id`));
CREATE TABLE `pruebas`.`voluntario` (
`id` INT NOT NULL AUTO_INCREMENT,
`id_domicilio` INT NULL,
`id_contacto` INT NULL,
`nombre` VARCHAR(20) NULL,
`apellidos` VARCHAR(25) NULL,
PRIMARY KEY (`id`),
INDEX `fk_voluntario_domicilio_idx` (`id_domicilio` ASC) VISIBLE,
INDEX `fk_voluntario_contacto_idx` (`id_contacto` ASC) VISIBLE,
CONSTRAINT `fk_voluntario_domicilio`
FOREIGN KEY (`id_domicilio`)
REFERENCES `pruebas`.`domicilio` (`id`)
ON DELETE NO ACTION
ON UPDATE NO ACTION,
CONSTRAINT `fk_voluntario_contacto`
FOREIGN KEY (`id_contacto`)
REFERENCES `pruebas`.`contacto` (`id`)
ON DELETE NO ACTION
ON UPDATE NO ACTION);
CREATE TABLE `pruebas`.`actividad` (
`id` INT NOT NULL AUTO_INCREMENT,
`descripcion` VARCHAR(45) NULL,
`fecha` DATE NULL,
PRIMARY KEY (`id`));

CREATE TABLE `pruebas`.`asignacion` (
`id` INT NOT NULL AUTO_INCREMENT,
`id_voluntario` INT NULL,
`id_actividad` INT NULL,
`horas` INT NULL,
PRIMARY KEY (`id`),
INDEX `fk_asignacion_actividad_idx` (`id_actividad` ASC) VISIBLE,
INDEX `fk_asignacion_voluntario_idx` (`id_voluntario` ASC) VISIBLE,
CONSTRAINT `fk_asignacion_actividad`
FOREIGN KEY (`id_actividad`)
REFERENCES `pruebas`.`actividad` (`id`)
ON DELETE NO ACTION
ON UPDATE NO ACTION,
CONSTRAINT `fk_asignacion_voluntario`
FOREIGN KEY (`id_voluntario`)
REFERENCES `pruebas`.`voluntario` (`id`)
ON DELETE NO ACTION
ON UPDATE NO ACTION);

INSERT INTO pruebas.actividad (descripcion, fecha) VALUES ('Grumming Callejero', '2021-11-15');
INSERT INTO pruebas.actividad (descripcion, fecha) VALUES ('Chepito se baña', '2021-11-25');
INSERT INTO pruebas.actividad (descripcion, fecha) VALUES ('Castración gratuita', '2021-12-20');

INSERT INTO pruebas.contacto (telefono, email) VALUES ('2524-4454', 'jperez@gmail.com');
INSERT INTO pruebas.contacto (telefono, email) VALUES ('2425-5444', 'aquiros@gmail.com');
INSERT INTO pruebas.contacto (telefono, email) VALUES ('4425-2454', 'kmena@gmail.com');

INSERT INTO pruebas.domicilio (detalle, distrito, canton) VALUES ('Barrio La Granja', 'San Pedro', 'Montes de Oca');
INSERT INTO pruebas.domicilio (detalle, distrito, canton) VALUES ('Frente Café De Nena', 'Platanillo', 'Guadalupe');
INSERT INTO pruebas.domicilio (detalle, distrito, canton) VALUES ('Contiguo Aserradero', 'Dulce Nombre', 'Coronado');

/*Los siguientes valores podrian ser diferentes... según el id generado para cada registro de las tablas anteriores anterior*/

INSERT INTO pruebas.voluntario (id_domicilio, id_contacto, nombre, apellidos) VALUES ('1', '1', 'Juan', 'Perez');
INSERT INTO pruebas.voluntario (id_domicilio, id_contacto, nombre, apellidos) VALUES ('2', '2', 'Adrian', 'Quiros');
INSERT INTO pruebas.voluntario (id_domicilio, id_contacto, nombre, apellidos) VALUES ('3', '3', 'Karol', 'Mena');
INSERT INTO pruebas.asignacion (id_voluntario, id_actividad, horas) VALUES ('1', '1', '1');
INSERT INTO pruebas.asignacion (id_voluntario, id_actividad, horas) VALUES ('1', '2', '4');
INSERT INTO pruebas.asignacion (id_voluntario, id_actividad, horas) VALUES ('1', '3', '2');
INSERT INTO pruebas.asignacion (id_voluntario, id_actividad, horas) VALUES ('2', '2', '5');
INSERT INTO pruebas.asignacion (id_voluntario, id_actividad, horas) VALUES ('2', '3', '1');
INSERT INTO pruebas.asignacion (id_voluntario, id_actividad, horas) VALUES ('3', '1', '2');
INSERT INTO pruebas.asignacion (id_voluntario, id_actividad, horas) VALUES ('3', '3', '4');