--CREATE USER enallterm PASSWORD '3N4LLT3RM';
--CREATE DATABASE enallterm WITH OWNER = enallterm;


CREATE TABLE "user"(
	id SERIAL NOT NULL,
	uid varchar(256) NOT NULL,
	username varchar(50) NOT NULL,
	email varchar(255) NOT NULL,
	password varchar(256) NOT NULL,
	contact_email integer, --quitar no los tengo contemplados en el diseño de la bd para el sistema 
	contact_phone integer, --quitar
	auth_key varchar(60) NOT NULL,
	status integer DEFAULT 0,
	created_at TIMESTAMP NOT NULL DEFAULT now(),
	update_at TIMESTAMP,
	CONSTRAINT pk_user_id PRIMARY KEY (id),
	CONSTRAINT uk_user_uid UNIQUE (uid),
	CONSTRAINT uk_user_auth_key UNIQUE(auth_key)
);

COMMENT ON TABLE user IS 'Tabla para registrar todos los usuarios del sistema';

CREATE TABLE paises(
	id SERIAL NOT NULL,
	nombre varchar(100) NOT NULL,
	abreviatura varchar(50) NOT NULL,
	CONSTRAINT pk_paises_id PRIMARY KEY (id)
);

COMMENT ON TABLE paises IS 'Tabla de paises';

INSERT INTO paises (nombre, abreviatura) VALUES ('México','Mex.');
INSERT INTO paises (nombre, abreviatura) VALUES ('Colombia','Col.');
INSERT INTO paises (nombre, abreviatura) VALUES ('España','Esp.');
INSERT INTO paises (nombre, abreviatura) VALUES ('Argentina','Ar.');
INSERT INTO paises (nombre, abreviatura) VALUES ('Perú','Pe.');
INSERT INTO paises (nombre, abreviatura) VALUES ('Venezuela','Ven.');
INSERT INTO paises (nombre, abreviatura) VALUES ('Chile','Cl.');
INSERT INTO paises (nombre, abreviatura) VALUES ('Ecuador','Ecu.');
INSERT INTO paises (nombre, abreviatura) VALUES ('Guatemala','Gt.');
INSERT INTO paises (nombre, abreviatura) VALUES ('Cuba','Cub.');
INSERT INTO paises (nombre, abreviatura) VALUES ('Bolivia','Bol.');
INSERT INTO paises (nombre, abreviatura) VALUES ('República Dominicana','Rep. Dom.');
INSERT INTO paises (nombre, abreviatura) VALUES ('Honduras','Hon.');
INSERT INTO paises (nombre, abreviatura) VALUES ('El Salvador','El Salv.');
INSERT INTO paises (nombre, abreviatura) VALUES ('Paraguay','Par.');
INSERT INTO paises (nombre, abreviatura) VALUES ('Uruguay','Uy.');
INSERT INTO paises (nombre, abreviatura) VALUES ('Nicaragua','Nic.');
INSERT INTO paises (nombre, abreviatura) VALUES ('Costa Rica','CR.');
INSERT INTO paises (nombre, abreviatura) VALUES ('Puerto Rico','PR.');
INSERT INTO paises (nombre, abreviatura) VALUES ('Panamá','Pan.');
INSERT INTO paises (nombre, abreviatura) VALUES ('Guinea Ecuatorial','GNQ.');
INSERT INTO paises (nombre, abreviatura) VALUES ('Sahara Occidental','ESH.');


CREATE TABLE areas(
	id SERIAL NOT NULL,
	nombre varchar(250) NOT NULL,
	CONSTRAINT pk_areas_id PRIMARY KEY (id)
);

COMMENT ON TABLE areas IS 'Tabla de áreas del conocimiento';


INSERT INTO areas (nombre) VALUES ('Ciencias Biológicas, Químicas y de la Salud'); --1
INSERT INTO areas (nombre) VALUES ('Ciencias Físico - Matemáticas y de las Ingenierías'); --2
INSERT INTO areas (nombre) VALUES ('Ciencias Sociales');--3
INSERT INTO areas (nombre) VALUES ('Humanidades y de las Artes'); --4


CREATE TABLE subareas(
	id SERIAL NOT NULL,
	id_areas INT NOT NULL,
	nombre varchar(250) NOT NULL,
	CONSTRAINT pk_subareas_id PRIMARY KEY (id),
	CONSTRAINT fk_subareas_id_id_areas FOREIGN KEY(id_areas) REFERENCES areas (id)
		ON UPDATE RESTRICT ON DELETE RESTRICT
);

COMMENT ON TABLE subareas IS 'Tabla de subáreas del conocimiento';

INSERT INTO subareas (id_areas, nombre) VALUES ('1','Biología');
INSERT INTO subareas (id_areas, nombre) VALUES ('1','Química Diagnóstica');
INSERT INTO subareas (id_areas, nombre) VALUES ('1','Ciencia Forense');
INSERT INTO subareas (id_areas, nombre) VALUES ('1','Ciencias Agrogenómicas');
INSERT INTO subareas (id_areas, nombre) VALUES ('1','Ciencias Ambientales');
INSERT INTO subareas (id_areas, nombre) VALUES ('1','Ciencias Genómicas');
INSERT INTO subareas (id_areas, nombre) VALUES ('1','Cirujano Dentista');
INSERT INTO subareas (id_areas, nombre) VALUES ('1','Ecología');
INSERT INTO subareas (id_areas, nombre) VALUES ('1','Enfermería');
INSERT INTO subareas (id_areas, nombre) VALUES ('1','Enfermería y ObstreticiaFarmacia');
INSERT INTO subareas (id_areas, nombre) VALUES ('1','Fisioterapia');
INSERT INTO subareas (id_areas, nombre) VALUES ('1','Ingeniería Agrícola');
INSERT INTO subareas (id_areas, nombre) VALUES ('1','Ingeniería en Alimentos');
INSERT INTO subareas (id_areas, nombre) VALUES ('1','Investigación Biomédica Básica');
INSERT INTO subareas (id_areas, nombre) VALUES ('1','Manejo Sustentable de Zonas Costeras');
INSERT INTO subareas (id_areas, nombre) VALUES ('1','Médico Cirujano');
INSERT INTO subareas (id_areas, nombre) VALUES ('1','Medicina Veterinaria y Zootecnia');
INSERT INTO subareas (id_areas, nombre) VALUES ('1','Neurociencias');
INSERT INTO subareas (id_areas, nombre) VALUES ('1','Nutriología');
INSERT INTO subareas (id_areas, nombre) VALUES ('1','Odontología');
INSERT INTO subareas (id_areas, nombre) VALUES ('1','Optometría');
INSERT INTO subareas (id_areas, nombre) VALUES ('1','Psicología');
INSERT INTO subareas (id_areas, nombre) VALUES ('1','Química');
INSERT INTO subareas (id_areas, nombre) VALUES ('1','Química de Alimentos');
INSERT INTO subareas (id_areas, nombre) VALUES ('1','Química Farmaceútico Biológica');
INSERT INTO subareas (id_areas, nombre) VALUES ('1','Química Industrial');

INSERT INTO subareas (id_areas, nombre) VALUES ('2','Actuaría');
INSERT INTO subareas (id_areas, nombre) VALUES ('2','Arquitectura');
INSERT INTO subareas (id_areas, nombre) VALUES ('2','Arquitectura del Paisaje');
INSERT INTO subareas (id_areas, nombre) VALUES ('2','Ciencia de Materiales Sustentables');
INSERT INTO subareas (id_areas, nombre) VALUES ('2','Ciencias de la Computación');
INSERT INTO subareas (id_areas, nombre) VALUES ('2','Ciencias de la Tierra');
INSERT INTO subareas (id_areas, nombre) VALUES ('2','Diseño Industrial');
INSERT INTO subareas (id_areas, nombre) VALUES ('2','Física');
INSERT INTO subareas (id_areas, nombre) VALUES ('2','Física Biomédica');
INSERT INTO subareas (id_areas, nombre) VALUES ('2','Geociencias');
INSERT INTO subareas (id_areas, nombre) VALUES ('2','Ingeniería Ambiental');
INSERT INTO subareas (id_areas, nombre) VALUES ('2','Ingeniería Civil');
INSERT INTO subareas (id_areas, nombre) VALUES ('2','Ingeniería de Minas y Metalúrgia');
INSERT INTO subareas (id_areas, nombre) VALUES ('2','Ingeniería Eléctrica Electrónica');
INSERT INTO subareas (id_areas, nombre) VALUES ('2','Ingeniería en Computación');
INSERT INTO subareas (id_areas, nombre) VALUES ('2','Ingeniería en Energías Renovables');
INSERT INTO subareas (id_areas, nombre) VALUES ('2','Ingeniería en Sistemas Biomédicos');
INSERT INTO subareas (id_areas, nombre) VALUES ('2','Ingeniería en Telecomunicaciones');
INSERT INTO subareas (id_areas, nombre) VALUES ('2','Ingeniería en Telecomunicaciones, Sistemas y Electrónica');
INSERT INTO subareas (id_areas, nombre) VALUES ('2','Ingeniería Geofísica');
INSERT INTO subareas (id_areas, nombre) VALUES ('2','Ingeniería Geológica');
INSERT INTO subareas (id_areas, nombre) VALUES ('2','Ingeniería Geomática');
INSERT INTO subareas (id_areas, nombre) VALUES ('2','Ingeniería Industrial');
INSERT INTO subareas (id_areas, nombre) VALUES ('2','Ingeniería Mecánica');
INSERT INTO subareas (id_areas, nombre) VALUES ('2','Ingeniería Mecánica Eléctrica');
INSERT INTO subareas (id_areas, nombre) VALUES ('2','Ingeniería Mecatrónica');
INSERT INTO subareas (id_areas, nombre) VALUES ('2','Ingeniería Petrolera');
INSERT INTO subareas (id_areas, nombre) VALUES ('2','Ingeniería Química');
INSERT INTO subareas (id_areas, nombre) VALUES ('2','Ingeniería Química Metalúrgica');
INSERT INTO subareas (id_areas, nombre) VALUES ('2','Matemáticas');
INSERT INTO subareas (id_areas, nombre) VALUES ('2','Matemáticas Aplicadas');
INSERT INTO subareas (id_areas, nombre) VALUES ('2','Matemáticas Aplicadas y Computación');
INSERT INTO subareas (id_areas, nombre) VALUES ('2','Nanotecnología');
INSERT INTO subareas (id_areas, nombre) VALUES ('2','Tecnología');
INSERT INTO subareas (id_areas, nombre) VALUES ('2','Tecnologías para la Información en Ciencias');
INSERT INTO subareas (id_areas, nombre) VALUES ('2','Urbanismo');

INSERT INTO subareas (id_areas, nombre) VALUES ('3','Administración Agropecuaria');
INSERT INTO subareas (id_areas, nombre) VALUES ('3','Administración');
INSERT INTO subareas (id_areas, nombre) VALUES ('3','Antropología');
INSERT INTO subareas (id_areas, nombre) VALUES ('3','Ciencias de la Comunicación');
INSERT INTO subareas (id_areas, nombre) VALUES ('3','Comunicación y Periodismo');
INSERT INTO subareas (id_areas, nombre) VALUES ('3','Contaduría');
INSERT INTO subareas (id_areas, nombre) VALUES ('3','Derecho');
INSERT INTO subareas (id_areas, nombre) VALUES ('3','Desarrollo Comunitario para el Envejecimiento');
INSERT INTO subareas (id_areas, nombre) VALUES ('3','Desarrollo Territorial');
INSERT INTO subareas (id_areas, nombre) VALUES ('3','Economía');
INSERT INTO subareas (id_areas, nombre) VALUES ('3','Economía Industrial');
INSERT INTO subareas (id_areas, nombre) VALUES ('3','Estudios Sociales y Gestión Local');
INSERT INTO subareas (id_areas, nombre) VALUES ('3','Geografía Aplicada');
INSERT INTO subareas (id_areas, nombre) VALUES ('3','Geografía');
INSERT INTO subareas (id_areas, nombre) VALUES ('3','Informática');
INSERT INTO subareas (id_areas, nombre) VALUES ('3','Negocios Internacionales');
INSERT INTO subareas (id_areas, nombre) VALUES ('3','Planificación para el Desarrollo Agropecuario');
INSERT INTO subareas (id_areas, nombre) VALUES ('3','Relaciones Internacionales');
INSERT INTO subareas (id_areas, nombre) VALUES ('3','Sociología');
INSERT INTO subareas (id_areas, nombre) VALUES ('3','Trabajo Social');

INSERT INTO subareas (id_areas, nombre) VALUES ('4','Administración de Archivos y Gestión Documental');
INSERT INTO subareas (id_areas, nombre) VALUES ('4','Arte y Diseño');
INSERT INTO subareas (id_areas, nombre) VALUES ('4','Artes Visuales');
INSERT INTO subareas (id_areas, nombre) VALUES ('4','Bibliotecología y Estudios de la Información');
INSERT INTO subareas (id_areas, nombre) VALUES ('4','Cinematografía');
INSERT INTO subareas (id_areas, nombre) VALUES ('4','Desarrollo y Gestión Interculturales');
INSERT INTO subareas (id_areas, nombre) VALUES ('4','Diseño Gráfico');
INSERT INTO subareas (id_areas, nombre) VALUES ('4','Diseño y Comunicación Visual');
INSERT INTO subareas (id_areas, nombre) VALUES ('4','Enseñanza de (Alemán) (Español) (Francés) (Inglés) (Italiano) Como Lengua Extranjera');
INSERT INTO subareas (id_areas, nombre) VALUES ('4','Enseñanza de Inglés');
INSERT INTO subareas (id_areas, nombre) VALUES ('4','Estudios Latinoamericanos');
INSERT INTO subareas (id_areas, nombre) VALUES ('4','Etnomusicología');
INSERT INTO subareas (id_areas, nombre) VALUES ('4','Filosofía');
INSERT INTO subareas (id_areas, nombre) VALUES ('4','Geohistoria');
INSERT INTO subareas (id_areas, nombre) VALUES ('4','Historia');
INSERT INTO subareas (id_areas, nombre) VALUES ('4','Historia del Arte');
INSERT INTO subareas (id_areas, nombre) VALUES ('4','Lengua y Literaturas Hispánicas');
INSERT INTO subareas (id_areas, nombre) VALUES ('4','Lengua y Literaturas Modernas (Letras Alemanas, Francesas, Inglesas, Italianas o Portuguesas) ');
INSERT INTO subareas (id_areas, nombre) VALUES ('4','Letras Clásicas');
INSERT INTO subareas (id_areas, nombre) VALUES ('4','Lingüística Aplicada');
INSERT INTO subareas (id_areas, nombre) VALUES ('4','Literatura Dramática y Teatro');
INSERT INTO subareas (id_areas, nombre) VALUES ('4','Literatura Intercultural');
INSERT INTO subareas (id_areas, nombre) VALUES ('4','Música - Canto');
INSERT INTO subareas (id_areas, nombre) VALUES ('4','Música - Composición');
INSERT INTO subareas (id_areas, nombre) VALUES ('4','Música - Educación Musical');
INSERT INTO subareas (id_areas, nombre) VALUES ('4','Música - Instrumentista');
INSERT INTO subareas (id_areas, nombre) VALUES ('4','Música - Piano');
INSERT INTO subareas (id_areas, nombre) VALUES ('4','Música y Tecnología Artística');
INSERT INTO subareas (id_areas, nombre) VALUES ('4','Pedagogía');
INSERT INTO subareas (id_areas, nombre) VALUES ('4','Teatro y Actuación');
INSERT INTO subareas (id_areas, nombre) VALUES ('4','Traducción');