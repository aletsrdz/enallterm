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
	areas_id INT NOT NULL,
	nombre varchar(250) NOT NULL,
	CONSTRAINT pk_subareas_id PRIMARY KEY (id),
	CONSTRAINT fk_subareas_areas_id FOREIGN KEY(areas_id) REFERENCES areas (id)
		ON UPDATE RESTRICT ON DELETE RESTRICT
);

COMMENT ON TABLE subareas IS 'Tabla de subáreas del conocimiento';

INSERT INTO subareas (areas_id, nombre) VALUES ('1','Biología');
INSERT INTO subareas (areas_id, nombre) VALUES ('1','Química Diagnóstica');
INSERT INTO subareas (areas_id, nombre) VALUES ('1','Ciencia Forense');
INSERT INTO subareas (areas_id, nombre) VALUES ('1','Ciencias Agrogenómicas');
INSERT INTO subareas (areas_id, nombre) VALUES ('1','Ciencias Ambientales');
INSERT INTO subareas (areas_id, nombre) VALUES ('1','Ciencias Genómicas');
INSERT INTO subareas (areas_id, nombre) VALUES ('1','Cirujano Dentista');
INSERT INTO subareas (areas_id, nombre) VALUES ('1','Ecología');
INSERT INTO subareas (areas_id, nombre) VALUES ('1','Enfermería');
INSERT INTO subareas (areas_id, nombre) VALUES ('1','Enfermería y ObstreticiaFarmacia');
INSERT INTO subareas (areas_id, nombre) VALUES ('1','Fisioterapia');
INSERT INTO subareas (areas_id, nombre) VALUES ('1','Ingeniería Agrícola');
INSERT INTO subareas (areas_id, nombre) VALUES ('1','Ingeniería en Alimentos');
INSERT INTO subareas (areas_id, nombre) VALUES ('1','Investigación Biomédica Básica');
INSERT INTO subareas (areas_id, nombre) VALUES ('1','Manejo Sustentable de Zonas Costeras');
INSERT INTO subareas (areas_id, nombre) VALUES ('1','Médico Cirujano');
INSERT INTO subareas (areas_id, nombre) VALUES ('1','Medicina Veterinaria y Zootecnia');
INSERT INTO subareas (areas_id, nombre) VALUES ('1','Neurociencias');
INSERT INTO subareas (areas_id, nombre) VALUES ('1','Nutriología');
INSERT INTO subareas (areas_id, nombre) VALUES ('1','Odontología');
INSERT INTO subareas (areas_id, nombre) VALUES ('1','Optometría');
INSERT INTO subareas (areas_id, nombre) VALUES ('1','Psicología');
INSERT INTO subareas (areas_id, nombre) VALUES ('1','Química');
INSERT INTO subareas (areas_id, nombre) VALUES ('1','Química de Alimentos');
INSERT INTO subareas (areas_id, nombre) VALUES ('1','Química Farmaceútico Biológica');
INSERT INTO subareas (areas_id, nombre) VALUES ('1','Química Industrial');

INSERT INTO subareas (areas_id, nombre) VALUES ('2','Actuaría');
INSERT INTO subareas (areas_id, nombre) VALUES ('2','Arquitectura');
INSERT INTO subareas (areas_id, nombre) VALUES ('2','Arquitectura del Paisaje');
INSERT INTO subareas (areas_id, nombre) VALUES ('2','Ciencia de Materiales Sustentables');
INSERT INTO subareas (areas_id, nombre) VALUES ('2','Ciencias de la Computación');
INSERT INTO subareas (areas_id, nombre) VALUES ('2','Ciencias de la Tierra');
INSERT INTO subareas (areas_id, nombre) VALUES ('2','Diseño Industrial');
INSERT INTO subareas (areas_id, nombre) VALUES ('2','Física');
INSERT INTO subareas (areas_id, nombre) VALUES ('2','Física Biomédica');
INSERT INTO subareas (areas_id, nombre) VALUES ('2','Geociencias');
INSERT INTO subareas (areas_id, nombre) VALUES ('2','Ingeniería Ambiental');
INSERT INTO subareas (areas_id, nombre) VALUES ('2','Ingeniería Civil');
INSERT INTO subareas (areas_id, nombre) VALUES ('2','Ingeniería de Minas y Metalúrgia');
INSERT INTO subareas (areas_id, nombre) VALUES ('2','Ingeniería Eléctrica Electrónica');
INSERT INTO subareas (areas_id, nombre) VALUES ('2','Ingeniería en Computación');
INSERT INTO subareas (areas_id, nombre) VALUES ('2','Ingeniería en Energías Renovables');
INSERT INTO subareas (areas_id, nombre) VALUES ('2','Ingeniería en Sistemas Biomédicos');
INSERT INTO subareas (areas_id, nombre) VALUES ('2','Ingeniería en Telecomunicaciones');
INSERT INTO subareas (areas_id, nombre) VALUES ('2','Ingeniería en Telecomunicaciones, Sistemas y Electrónica');
INSERT INTO subareas (areas_id, nombre) VALUES ('2','Ingeniería Geofísica');
INSERT INTO subareas (areas_id, nombre) VALUES ('2','Ingeniería Geológica');
INSERT INTO subareas (areas_id, nombre) VALUES ('2','Ingeniería Geomática');
INSERT INTO subareas (areas_id, nombre) VALUES ('2','Ingeniería Industrial');
INSERT INTO subareas (areas_id, nombre) VALUES ('2','Ingeniería Mecánica');
INSERT INTO subareas (areas_id, nombre) VALUES ('2','Ingeniería Mecánica Eléctrica');
INSERT INTO subareas (areas_id, nombre) VALUES ('2','Ingeniería Mecatrónica');
INSERT INTO subareas (areas_id, nombre) VALUES ('2','Ingeniería Petrolera');
INSERT INTO subareas (areas_id, nombre) VALUES ('2','Ingeniería Química');
INSERT INTO subareas (areas_id, nombre) VALUES ('2','Ingeniería Química Metalúrgica');
INSERT INTO subareas (areas_id, nombre) VALUES ('2','Matemáticas');
INSERT INTO subareas (areas_id, nombre) VALUES ('2','Matemáticas Aplicadas');
INSERT INTO subareas (areas_id, nombre) VALUES ('2','Matemáticas Aplicadas y Computación');
INSERT INTO subareas (areas_id, nombre) VALUES ('2','Nanotecnología');
INSERT INTO subareas (areas_id, nombre) VALUES ('2','Tecnología');
INSERT INTO subareas (areas_id, nombre) VALUES ('2','Tecnologías para la Información en Ciencias');
INSERT INTO subareas (areas_id, nombre) VALUES ('2','Urbanismo');

INSERT INTO subareas (areas_id, nombre) VALUES ('3','Administración Agropecuaria');
INSERT INTO subareas (areas_id, nombre) VALUES ('3','Administración');
INSERT INTO subareas (areas_id, nombre) VALUES ('3','Antropología');
INSERT INTO subareas (areas_id, nombre) VALUES ('3','Ciencias de la Comunicación');
INSERT INTO subareas (areas_id, nombre) VALUES ('3','Comunicación y Periodismo');
INSERT INTO subareas (areas_id, nombre) VALUES ('3','Contaduría');
INSERT INTO subareas (areas_id, nombre) VALUES ('3','Derecho');
INSERT INTO subareas (areas_id, nombre) VALUES ('3','Desarrollo Comunitario para el Envejecimiento');
INSERT INTO subareas (areas_id, nombre) VALUES ('3','Desarrollo Territorial');
INSERT INTO subareas (areas_id, nombre) VALUES ('3','Economía');
INSERT INTO subareas (areas_id, nombre) VALUES ('3','Economía Industrial');
INSERT INTO subareas (areas_id, nombre) VALUES ('3','Estudios Sociales y Gestión Local');
INSERT INTO subareas (areas_id, nombre) VALUES ('3','Geografía Aplicada');
INSERT INTO subareas (areas_id, nombre) VALUES ('3','Geografía');
INSERT INTO subareas (areas_id, nombre) VALUES ('3','Informática');
INSERT INTO subareas (areas_id, nombre) VALUES ('3','Negocios Internacionales');
INSERT INTO subareas (areas_id, nombre) VALUES ('3','Planificación para el Desarrollo Agropecuario');
INSERT INTO subareas (areas_id, nombre) VALUES ('3','Relaciones Internacionales');
INSERT INTO subareas (areas_id, nombre) VALUES ('3','Sociología');
INSERT INTO subareas (areas_id, nombre) VALUES ('3','Trabajo Social');

INSERT INTO subareas (areas_id, nombre) VALUES ('4','Administración de Archivos y Gestión Documental');
INSERT INTO subareas (areas_id, nombre) VALUES ('4','Arte y Diseño');
INSERT INTO subareas (areas_id, nombre) VALUES ('4','Artes Visuales');
INSERT INTO subareas (areas_id, nombre) VALUES ('4','Bibliotecología y Estudios de la Información');
INSERT INTO subareas (areas_id, nombre) VALUES ('4','Cinematografía');
INSERT INTO subareas (areas_id, nombre) VALUES ('4','Desarrollo y Gestión Interculturales');
INSERT INTO subareas (areas_id, nombre) VALUES ('4','Diseño Gráfico');
INSERT INTO subareas (areas_id, nombre) VALUES ('4','Diseño y Comunicación Visual');
INSERT INTO subareas (areas_id, nombre) VALUES ('4','Enseñanza de (Alemán) (Español) (Francés) (Inglés) (Italiano) Como Lengua Extranjera');
INSERT INTO subareas (areas_id, nombre) VALUES ('4','Enseñanza de Inglés');
INSERT INTO subareas (areas_id, nombre) VALUES ('4','Estudios Latinoamericanos');
INSERT INTO subareas (areas_id, nombre) VALUES ('4','Etnomusicología');
INSERT INTO subareas (areas_id, nombre) VALUES ('4','Filosofía');
INSERT INTO subareas (areas_id, nombre) VALUES ('4','Geohistoria');
INSERT INTO subareas (areas_id, nombre) VALUES ('4','Historia');
INSERT INTO subareas (areas_id, nombre) VALUES ('4','Historia del Arte');
INSERT INTO subareas (areas_id, nombre) VALUES ('4','Lengua y Literaturas Hispánicas');
INSERT INTO subareas (areas_id, nombre) VALUES ('4','Lengua y Literaturas Modernas (Letras Alemanas, Francesas, Inglesas, Italianas o Portuguesas) ');
INSERT INTO subareas (areas_id, nombre) VALUES ('4','Letras Clásicas');
INSERT INTO subareas (areas_id, nombre) VALUES ('4','Lingüística Aplicada');
INSERT INTO subareas (areas_id, nombre) VALUES ('4','Literatura Dramática y Teatro');
INSERT INTO subareas (areas_id, nombre) VALUES ('4','Literatura Intercultural');
INSERT INTO subareas (areas_id, nombre) VALUES ('4','Música - Canto');
INSERT INTO subareas (areas_id, nombre) VALUES ('4','Música - Composición');
INSERT INTO subareas (areas_id, nombre) VALUES ('4','Música - Educación Musical');
INSERT INTO subareas (areas_id, nombre) VALUES ('4','Música - Instrumentista');
INSERT INTO subareas (areas_id, nombre) VALUES ('4','Música - Piano');
INSERT INTO subareas (areas_id, nombre) VALUES ('4','Música y Tecnología Artística');
INSERT INTO subareas (areas_id, nombre) VALUES ('4','Pedagogía');
INSERT INTO subareas (areas_id, nombre) VALUES ('4','Teatro y Actuación');
INSERT INTO subareas (areas_id, nombre) VALUES ('4','Traducción');



CREATE TABLE materia(
	id SERIAL NOT NULL,
	nombre varchar(100) NOT NULL,	
	CONSTRAINT pk_materia_id PRIMARY KEY (id)
);


COMMENT ON TABLE materia IS 'Tabla de materia';

INSERT INTO materia (nombre) VALUES ('Diplomado en traducción juridica');
INSERT INTO materia (nombre) VALUES ('Iniciación a la Traducción');
INSERT INTO materia (nombre) VALUES ('Traducción de Textos Generales B-A (Inglés-Español)');
INSERT INTO materia (nombre) VALUES ('Traducción de Textos de Ciencias Sociales y Humanidades B-A (Inglés-Español)');
INSERT INTO materia (nombre) VALUES ('Traducción de Textos Generales C-A');
INSERT INTO materia (nombre) VALUES ('Terminología para Traductores');
INSERT INTO materia (nombre) VALUES ('Traducción de Textos Literarios B-A (Inglés-Español)');
INSERT INTO materia (nombre) VALUES ('Traducción de Textos de Ciencias Sociales y Humanidades C-A');

CREATE TABLE grupo(
	id SERIAL NOT NULL,
	nombre varchar(100) NOT NULL,
	materia_id integer NOT NULL,
	CONSTRAINT pk_grupo_id PRIMARY KEY (id),
	CONSTRAINT fk_grupo_materia_id FOREIGN KEY (materia_id) REFERENCES materia
		ON UPDATE RESTRICT ON DELETE RESTRICT
);

COMMENT ON TABLE grupo IS 'Tabla de grupo';

INSERT INTO grupo (nombre,materia_id) VALUES ('DTJ01', 1);
INSERT INTO grupo (nombre,materia_id) VALUES ('DTJ02', 1);
INSERT INTO grupo (nombre,materia_id) VALUES ('DTJ03', 1);
INSERT INTO grupo (nombre,materia_id) VALUES ('TT01', 6);
INSERT INTO grupo (nombre,materia_id) VALUES ('TT02', 6);
INSERT INTO grupo (nombre,materia_id) VALUES ('TT03', 6);

CREATE TABLE equipo(
	id SERIAL NOT NULL,
	nombre varchar(100) NOT NULL,
	grupo_id integer NOT NULL,
	CONSTRAINT pk_equipo_id PRIMARY KEY (id),
	CONSTRAINT fk_equipo_grupo_id FOREIGN KEY (grupo_id) REFERENCES grupo
		ON UPDATE RESTRICT ON DELETE RESTRICT
);

COMMENT ON TABLE grupo IS 'Tabla de equipo';

INSERT INTO equipo (nombre, grupo_id) VALUES ('azul', 1);
INSERT INTO equipo (nombre, grupo_id) VALUES ('amrillo', 1);
INSERT INTO equipo (nombre, grupo_id) VALUES ('rojo', 1);
INSERT INTO equipo (nombre, grupo_id) VALUES ('tigre', 6);
INSERT INTO equipo (nombre, grupo_id) VALUES ('delfin', 6);
INSERT INTO equipo (nombre, grupo_id) VALUES ('ave', 6);


CREATE TABLE inscrito(
	id SERIAL NOT NULL,
	user_id integer NOT NULL,
	materia_id integer NOT NULL,
	grupo_id integer NOT NULL,
	equipo_id integer NOT NULL,
	CONSTRAINT pk_inscrito_id PRIMARY KEY (id),
	CONSTRAINT uk_inscrito_user_id_materia_id UNIQUE (user_id, materia_id),
	CONSTRAINT fk_inscrito_user_id FOREIGN KEY (user_id) REFERENCES "user" 
		ON UPDATE RESTRICT ON DELETE RESTRICT,
	CONSTRAINT fk_inscrito_materia_id FOREIGN KEY (materia_id) REFERENCES materia
		ON UPDATE RESTRICT ON DELETE RESTRICT,
	CONSTRAINT fk_inscrito_grupo_id FOREIGN KEY (grupo_id) REFERENCES grupo
		ON UPDATE RESTRICT ON DELETE RESTRICT,
	CONSTRAINT fk_inscrito_equipo_id FOREIGN KEY (equipo_id) REFERENCES equipo
		ON UPDATE RESTRICT ON DELETE RESTRICT	
);

COMMENT ON TABLE grupo IS 'Tabla de alumno inscritos en materia, grupo y equpo';

INSERT INTO inscrito (user_id, materia_id, grupo_id, equipo_id) VALUES (13, 6,1,1); --alumno1
INSERT INTO inscrito (user_id, materia_id, grupo_id, equipo_id) VALUES (14, 6,1,1); --alumno2
INSERT INTO inscrito (user_id, materia_id, grupo_id, equipo_id) VALUES (15, 6,1,2); --alumno3
INSERT INTO inscrito (user_id, materia_id, grupo_id, equipo_id) VALUES (16, 6,1,2); --alumno4
INSERT INTO inscrito (user_id, materia_id, grupo_id, equipo_id) VALUES (17, 6,1,3); --alumno5
INSERT INTO inscrito (user_id, materia_id, grupo_id, equipo_id) VALUES (18, 1,1,4); --alumno6
INSERT INTO inscrito (user_id, materia_id, grupo_id, equipo_id) VALUES (19, 1,1,4); --alumno7
INSERT INTO inscrito (user_id, materia_id, grupo_id, equipo_id) VALUES (20, 1,1,5); --alumno8
INSERT INTO inscrito (user_id, materia_id, grupo_id, equipo_id) VALUES (22, 1,1,5); --alumno9
INSERT INTO inscrito (user_id, materia_id, grupo_id, equipo_id) VALUES (21, 1,1,6); --alumno10


CREATE TABLE ficha_terminologica(
	id SERIAL NOT NULL,
	area_id integer,
	subarea_id integer,
	pais_id integer,
	temino_origen text NOT NULL,
	termino_meta text NOT NULL,
	definicion_origen text NOT NULL,
	definicion_meta text NOT NULL,
	fuente_origen text,
	fuente_meta text,
	contexto_origen text,
	contexto_meta text,
	no_recomendado text,
	notas_fichat text,
	url_imagen varchar(255),
	url_video varchar(255),
	url_sonido varchar(255),
	create_at TIMESTAMP NOT NULL DEFAULT NOW(),
	update_at TIMESTAMP,
	CONSTRAINT pk_ficha_terminologica_id PRIMARY KEY (id),
	CONSTRAINT fk_ficha_terminologica_area_id FOREIGN KEY (area_id) REFERENCES areas
		ON UPDATE RESTRICT ON DELETE RESTRICT,
	CONSTRAINT fk_ficha_terminologica_subarea_id FOREIGN KEY (area_id) REFERENCES subareas
		ON UPDATE RESTRICT ON DELETE RESTRICT,
	CONSTRAINT fk_ficha_terminologica_pais_id FOREIGN KEY (pais_id) REFERENCES paises
		ON UPDATE RESTRICT ON DELETE RESTRICT
);

COMMENT ON TABLE grupo IS 'Tabla de para guardar las fichas terminológicas de los alumnos';


CREATE TABLE autor(
	id SERIAL NOT NULL,
	ficha_terminologica_id integer NOT NULL,
	user_id integer NOT NULL,
	nombre varchar(255),
	apaterno varchar(255),
	amaterno varchar(255),
	inscrito_id integer,
	CONSTRAINT pk_autor_id PRIMARY KEY(id),
	CONSTRAINT fk_autor_id_ficha_termininologica FOREIGN KEY (ficha_terminologica_id) REFERENCES ficha_terminologica
		ON UPDATE RESTRICT ON DELETE RESTRICT,
	CONSTRAINT fk_autor_user_id FOREIGN KEY (user_id) REFERENCES "user"
		ON UPDATE RESTRICT ON DELETE RESTRICT,
	CONSTRAINT uk_autor_fichaterminologica_id_user_id UNIQUE (ficha_terminologica_id, user_id),
	CONSTRAINT fk_autor_inscrito_id FOREIGN KEY(inscrito_id) REFERENCES inscrito
		ON UPDATE RESTRICT ON DELETE RESTRICT
);


COMMENT ON TABLE grupo IS 'Tabla de para guardar los autores de las fichas terminológicas';
