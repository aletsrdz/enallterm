--
-- PostgreSQL database dump
--

-- Dumped from database version 10.10 (Ubuntu 10.10-0ubuntu0.18.04.1)
-- Dumped by pg_dump version 10.10 (Ubuntu 10.10-0ubuntu0.18.04.1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: areas; Type: TABLE; Schema: public; Owner: enallterm
--

CREATE TABLE public.areas (
    id integer NOT NULL,
    nombre character varying(250) NOT NULL
);


ALTER TABLE public.areas OWNER TO enallterm;

--
-- Name: TABLE areas; Type: COMMENT; Schema: public; Owner: enallterm
--

COMMENT ON TABLE public.areas IS 'Tabla de áreas del conocimiento';


--
-- Name: areas_id_seq; Type: SEQUENCE; Schema: public; Owner: enallterm
--

CREATE SEQUENCE public.areas_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.areas_id_seq OWNER TO enallterm;

--
-- Name: areas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: enallterm
--

ALTER SEQUENCE public.areas_id_seq OWNED BY public.areas.id;


--
-- Name: auth_assignment; Type: TABLE; Schema: public; Owner: enallterm
--

CREATE TABLE public.auth_assignment (
    item_name character varying(64) NOT NULL,
    user_id character varying(64) NOT NULL,
    created_at integer
);


ALTER TABLE public.auth_assignment OWNER TO enallterm;

--
-- Name: auth_item; Type: TABLE; Schema: public; Owner: enallterm
--

CREATE TABLE public.auth_item (
    name character varying(64) NOT NULL,
    type smallint NOT NULL,
    description text,
    rule_name character varying(64),
    data bytea,
    created_at integer,
    updated_at integer
);


ALTER TABLE public.auth_item OWNER TO enallterm;

--
-- Name: auth_item_child; Type: TABLE; Schema: public; Owner: enallterm
--

CREATE TABLE public.auth_item_child (
    parent character varying(64) NOT NULL,
    child character varying(64) NOT NULL
);


ALTER TABLE public.auth_item_child OWNER TO enallterm;

--
-- Name: auth_rule; Type: TABLE; Schema: public; Owner: enallterm
--

CREATE TABLE public.auth_rule (
    name character varying(64) NOT NULL,
    data bytea,
    created_at integer,
    updated_at integer
);


ALTER TABLE public.auth_rule OWNER TO enallterm;

--
-- Name: autor; Type: TABLE; Schema: public; Owner: enallterm
--

CREATE TABLE public.autor (
    id integer NOT NULL,
    ficha_terminologica_id integer NOT NULL,
    user_id integer NOT NULL,
    nombre character varying(255),
    apaterno character varying(255),
    amaterno character varying(255),
    inscrito_id integer
);


ALTER TABLE public.autor OWNER TO enallterm;

--
-- Name: autor_id_seq; Type: SEQUENCE; Schema: public; Owner: enallterm
--

CREATE SEQUENCE public.autor_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.autor_id_seq OWNER TO enallterm;

--
-- Name: autor_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: enallterm
--

ALTER SEQUENCE public.autor_id_seq OWNED BY public.autor.id;


--
-- Name: equipo; Type: TABLE; Schema: public; Owner: enallterm
--

CREATE TABLE public.equipo (
    id integer NOT NULL,
    nombre character varying(100) NOT NULL,
    grupo_id integer NOT NULL
);


ALTER TABLE public.equipo OWNER TO enallterm;

--
-- Name: equipo_id_seq; Type: SEQUENCE; Schema: public; Owner: enallterm
--

CREATE SEQUENCE public.equipo_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.equipo_id_seq OWNER TO enallterm;

--
-- Name: equipo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: enallterm
--

ALTER SEQUENCE public.equipo_id_seq OWNED BY public.equipo.id;


--
-- Name: ficha_terminologica; Type: TABLE; Schema: public; Owner: enallterm
--

CREATE TABLE public.ficha_terminologica (
    id integer NOT NULL,
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
    url_imagen character varying(255),
    url_video character varying(255),
    url_sonido character varying(255),
    create_at timestamp without time zone DEFAULT now() NOT NULL,
    update_at timestamp without time zone
);


ALTER TABLE public.ficha_terminologica OWNER TO enallterm;

--
-- Name: ficha_terminologica_id_seq; Type: SEQUENCE; Schema: public; Owner: enallterm
--

CREATE SEQUENCE public.ficha_terminologica_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ficha_terminologica_id_seq OWNER TO enallterm;

--
-- Name: ficha_terminologica_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: enallterm
--

ALTER SEQUENCE public.ficha_terminologica_id_seq OWNED BY public.ficha_terminologica.id;


--
-- Name: grupo; Type: TABLE; Schema: public; Owner: enallterm
--

CREATE TABLE public.grupo (
    id integer NOT NULL,
    nombre character varying(100) NOT NULL,
    materia_id integer NOT NULL
);


ALTER TABLE public.grupo OWNER TO enallterm;

--
-- Name: TABLE grupo; Type: COMMENT; Schema: public; Owner: enallterm
--

COMMENT ON TABLE public.grupo IS 'Tabla de para guardar los autores de las fichas terminológicas';


--
-- Name: grupo_id_seq; Type: SEQUENCE; Schema: public; Owner: enallterm
--

CREATE SEQUENCE public.grupo_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.grupo_id_seq OWNER TO enallterm;

--
-- Name: grupo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: enallterm
--

ALTER SEQUENCE public.grupo_id_seq OWNED BY public.grupo.id;


--
-- Name: inscrito; Type: TABLE; Schema: public; Owner: enallterm
--

CREATE TABLE public.inscrito (
    id integer NOT NULL,
    user_id integer NOT NULL,
    materia_id integer NOT NULL,
    grupo_id integer NOT NULL,
    equipo_id integer NOT NULL
);


ALTER TABLE public.inscrito OWNER TO enallterm;

--
-- Name: inscrito_id_seq; Type: SEQUENCE; Schema: public; Owner: enallterm
--

CREATE SEQUENCE public.inscrito_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.inscrito_id_seq OWNER TO enallterm;

--
-- Name: inscrito_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: enallterm
--

ALTER SEQUENCE public.inscrito_id_seq OWNED BY public.inscrito.id;


--
-- Name: materia; Type: TABLE; Schema: public; Owner: enallterm
--

CREATE TABLE public.materia (
    id integer NOT NULL,
    nombre character varying(100) NOT NULL
);


ALTER TABLE public.materia OWNER TO enallterm;

--
-- Name: TABLE materia; Type: COMMENT; Schema: public; Owner: enallterm
--

COMMENT ON TABLE public.materia IS 'Tabla de materia';


--
-- Name: materia_id_seq; Type: SEQUENCE; Schema: public; Owner: enallterm
--

CREATE SEQUENCE public.materia_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.materia_id_seq OWNER TO enallterm;

--
-- Name: materia_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: enallterm
--

ALTER SEQUENCE public.materia_id_seq OWNED BY public.materia.id;


--
-- Name: migration; Type: TABLE; Schema: public; Owner: enallterm
--

CREATE TABLE public.migration (
    version character varying(180) NOT NULL,
    apply_time integer
);


ALTER TABLE public.migration OWNER TO enallterm;

--
-- Name: paises; Type: TABLE; Schema: public; Owner: enallterm
--

CREATE TABLE public.paises (
    id integer NOT NULL,
    nombre character varying(100) NOT NULL,
    abreviatura character varying(50) NOT NULL
);


ALTER TABLE public.paises OWNER TO enallterm;

--
-- Name: TABLE paises; Type: COMMENT; Schema: public; Owner: enallterm
--

COMMENT ON TABLE public.paises IS 'Tabla de áreas del conocimiento';


--
-- Name: paises_id_seq; Type: SEQUENCE; Schema: public; Owner: enallterm
--

CREATE SEQUENCE public.paises_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.paises_id_seq OWNER TO enallterm;

--
-- Name: paises_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: enallterm
--

ALTER SEQUENCE public.paises_id_seq OWNED BY public.paises.id;


--
-- Name: subareas; Type: TABLE; Schema: public; Owner: enallterm
--

CREATE TABLE public.subareas (
    id integer NOT NULL,
    areas_id integer NOT NULL,
    nombre character varying(250) NOT NULL
);


ALTER TABLE public.subareas OWNER TO enallterm;

--
-- Name: TABLE subareas; Type: COMMENT; Schema: public; Owner: enallterm
--

COMMENT ON TABLE public.subareas IS 'Tabla de subáreas del conocimiento';


--
-- Name: subareas_id_seq; Type: SEQUENCE; Schema: public; Owner: enallterm
--

CREATE SEQUENCE public.subareas_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.subareas_id_seq OWNER TO enallterm;

--
-- Name: subareas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: enallterm
--

ALTER SEQUENCE public.subareas_id_seq OWNED BY public.subareas.id;


--
-- Name: user; Type: TABLE; Schema: public; Owner: enallterm
--

CREATE TABLE public."user" (
    id integer NOT NULL,
    uid character varying(256) NOT NULL,
    username character varying(50) NOT NULL,
    email character varying(255) NOT NULL,
    password character varying(256) NOT NULL,
    contact_email integer,
    contact_phone integer,
    status integer DEFAULT 0,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    update_at timestamp without time zone,
    auth_key character varying(60) NOT NULL
);


ALTER TABLE public."user" OWNER TO enallterm;

--
-- Name: user_id_seq; Type: SEQUENCE; Schema: public; Owner: enallterm
--

CREATE SEQUENCE public.user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_id_seq OWNER TO enallterm;

--
-- Name: user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: enallterm
--

ALTER SEQUENCE public.user_id_seq OWNED BY public."user".id;


--
-- Name: areas id; Type: DEFAULT; Schema: public; Owner: enallterm
--

ALTER TABLE ONLY public.areas ALTER COLUMN id SET DEFAULT nextval('public.areas_id_seq'::regclass);


--
-- Name: autor id; Type: DEFAULT; Schema: public; Owner: enallterm
--

ALTER TABLE ONLY public.autor ALTER COLUMN id SET DEFAULT nextval('public.autor_id_seq'::regclass);


--
-- Name: equipo id; Type: DEFAULT; Schema: public; Owner: enallterm
--

ALTER TABLE ONLY public.equipo ALTER COLUMN id SET DEFAULT nextval('public.equipo_id_seq'::regclass);


--
-- Name: ficha_terminologica id; Type: DEFAULT; Schema: public; Owner: enallterm
--

ALTER TABLE ONLY public.ficha_terminologica ALTER COLUMN id SET DEFAULT nextval('public.ficha_terminologica_id_seq'::regclass);


--
-- Name: grupo id; Type: DEFAULT; Schema: public; Owner: enallterm
--

ALTER TABLE ONLY public.grupo ALTER COLUMN id SET DEFAULT nextval('public.grupo_id_seq'::regclass);


--
-- Name: inscrito id; Type: DEFAULT; Schema: public; Owner: enallterm
--

ALTER TABLE ONLY public.inscrito ALTER COLUMN id SET DEFAULT nextval('public.inscrito_id_seq'::regclass);


--
-- Name: materia id; Type: DEFAULT; Schema: public; Owner: enallterm
--

ALTER TABLE ONLY public.materia ALTER COLUMN id SET DEFAULT nextval('public.materia_id_seq'::regclass);


--
-- Name: paises id; Type: DEFAULT; Schema: public; Owner: enallterm
--

ALTER TABLE ONLY public.paises ALTER COLUMN id SET DEFAULT nextval('public.paises_id_seq'::regclass);


--
-- Name: subareas id; Type: DEFAULT; Schema: public; Owner: enallterm
--

ALTER TABLE ONLY public.subareas ALTER COLUMN id SET DEFAULT nextval('public.subareas_id_seq'::regclass);


--
-- Name: user id; Type: DEFAULT; Schema: public; Owner: enallterm
--

ALTER TABLE ONLY public."user" ALTER COLUMN id SET DEFAULT nextval('public.user_id_seq'::regclass);


--
-- Data for Name: areas; Type: TABLE DATA; Schema: public; Owner: enallterm
--

COPY public.areas (id, nombre) FROM stdin;
1	Ciencias Biológicas, Químicas y de la Salud
2	Ciencias Físico - Matemáticas y de las Ingenierías
3	Ciencias Sociales
4	Humanidades y de las Artes
\.


--
-- Data for Name: auth_assignment; Type: TABLE DATA; Schema: public; Owner: enallterm
--

COPY public.auth_assignment (item_name, user_id, created_at) FROM stdin;
super	4	1572279332
admin	5	1572279332
admin	6	1572279332
author	13	1572279332
author	14	1572279332
author	15	1572279332
author	16	1572279332
author	17	1572279332
author	18	1572279332
author	19	1572279332
author	20	1572279332
author	21	1572279332
author	22	1572279332
\.


--
-- Data for Name: auth_item; Type: TABLE DATA; Schema: public; Owner: enallterm
--

COPY public.auth_item (name, type, description, rule_name, data, created_at, updated_at) FROM stdin;
createPais	2	Crear pais	\N	\N	1572279331	1572279331
updatePais	2	Actualizar pais	\N	\N	1572279331	1572279331
deletePais	2	Borrar pais	\N	\N	1572279331	1572279331
readPais	2	Leer pais	\N	\N	1572279331	1572279331
createAreas	2	Crear Areas	\N	\N	1572279331	1572279331
updateAreas	2	Actualizar Areas	\N	\N	1572279331	1572279331
deleteAreas	2	Borrar Areas	\N	\N	1572279331	1572279331
readAreas	2	Leer Areas	\N	\N	1572279331	1572279331
createSubareas	2	Crear Subareas	\N	\N	1572279331	1572279331
updateSubareas	2	Actualizar Subareas	\N	\N	1572279331	1572279331
deleteSubareas	2	Borrar Subareas	\N	\N	1572279331	1572279331
readSubareas	2	Leer Subareas	\N	\N	1572279331	1572279331
super	1	\N	\N	\N	1572279331	1572279331
admin	1	\N	\N	\N	1572279331	1572279331
createuser	2	Crear usuarios del sistema	\N	\N	1572279331	1572279331
updateuser	2	Editar usuarios del sistema	\N	\N	1572279331	1572279331
deleteuser	2	Eliminar usuarios del sistema	\N	\N	1572279331	1572279331
viewuser	2	Ver usuarios del sistema	\N	\N	1572279331	1572279331
createMateria	2	\N	\N	\N	1572279331	1572279331
updateMateria	2	\N	\N	\N	1572279331	1572279331
deleteMateria	2	\N	\N	\N	1572279331	1572279331
viewMateria	2	Ver materia	\N	\N	1572279331	1572279331
createGrupo	2	\N	\N	\N	1572279331	1572279331
updateGrupo	2	\N	\N	\N	1572279331	1572279331
deleteGrupo	2	\N	\N	\N	1572279331	1572279331
viewGrupo	2	Ver Grupo	\N	\N	1572279331	1572279331
createEquipo	2	\N	\N	\N	1572279331	1572279331
updateEquipo	2	\N	\N	\N	1572279331	1572279331
deleteEquipo	2	\N	\N	\N	1572279331	1572279331
viewEquipo	2	Ver Equipo	\N	\N	1572279331	1572279331
author	1	\N	\N	\N	1572279331	1572279331
createProfile	2	\N	\N	\N	1572279332	1572279332
readProfile	2	\N	\N	\N	1572279332	1572279332
createFichaTerminologica	2	\N	\N	\N	1572279332	1572279332
updateFichaTerminologica	2	\N	\N	\N	1572279332	1572279332
deleteFichaTerminologica	2	\N	\N	\N	1572279332	1572279332
viewFichaTerminologica	2	\N	\N	\N	1572279332	1572279332
guest	1	\N	\N	\N	1572279332	1572279332
viewBusqueda	2	Leer Busqueda	\N	\N	1572279332	1572279332
viewAbout	2	Leer About	\N	\N	1572279332	1572279332
viewInicio	2	Leer Inicio	\N	\N	1572279332	1572279332
viewContact	2	Leer Contacto	\N	\N	1572279332	1572279332
viewRegister	2	Leer Registrar	\N	\N	1572279332	1572279332
\.


--
-- Data for Name: auth_item_child; Type: TABLE DATA; Schema: public; Owner: enallterm
--

COPY public.auth_item_child (parent, child) FROM stdin;
super	deletePais
super	deleteAreas
super	deleteSubareas
super	admin
admin	createPais
admin	updatePais
admin	readPais
admin	createAreas
admin	updateAreas
admin	readAreas
admin	createSubareas
admin	updateSubareas
admin	readSubareas
admin	createuser
admin	updateuser
admin	deleteuser
admin	viewuser
admin	createMateria
admin	updateMateria
super	deleteMateria
admin	viewMateria
admin	createGrupo
admin	updateGrupo
super	deleteGrupo
admin	viewGrupo
admin	createEquipo
admin	updateEquipo
super	deleteEquipo
admin	viewEquipo
author	createProfile
author	readProfile
author	createFichaTerminologica
author	updateFichaTerminologica
author	deleteFichaTerminologica
author	viewFichaTerminologica
admin	author
guest	viewBusqueda
guest	viewAbout
guest	viewInicio
guest	viewContact
guest	viewRegister
author	guest
\.


--
-- Data for Name: auth_rule; Type: TABLE DATA; Schema: public; Owner: enallterm
--

COPY public.auth_rule (name, data, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: autor; Type: TABLE DATA; Schema: public; Owner: enallterm
--

COPY public.autor (id, ficha_terminologica_id, user_id, nombre, apaterno, amaterno, inscrito_id) FROM stdin;
\.


--
-- Data for Name: equipo; Type: TABLE DATA; Schema: public; Owner: enallterm
--

COPY public.equipo (id, nombre, grupo_id) FROM stdin;
1	azul	1
2	amrillo	1
3	rojo	1
4	tigre	6
5	delfin	6
6	ave	6
\.


--
-- Data for Name: ficha_terminologica; Type: TABLE DATA; Schema: public; Owner: enallterm
--

COPY public.ficha_terminologica (id, area_id, subarea_id, pais_id, temino_origen, termino_meta, definicion_origen, definicion_meta, fuente_origen, fuente_meta, contexto_origen, contexto_meta, no_recomendado, notas_fichat, url_imagen, url_video, url_sonido, create_at, update_at) FROM stdin;
22	1	1	1	adfasdf	asdfasd	<p>asdfasd</p>	<p>asdfasd</p>	asdfasdf	asdfas	<p>asdfasf</p>	<p>asdfasd</p>	asdfasd	<p>asdfasd</p>	vivianaINE.png			2019-10-29 12:21:50.152541	\N
23	1	1	1	Prueba 1	Prueba 1	<p>Prueba 1</p>	<p>Prueba 1</p>	Prueba 1	Prueba 1	<p>Prueba 1</p>	<p>Prueba 1</p>	Prueba 1	<p>Prueba 1</p>	abril2019_II.png			2019-10-29 12:51:30.650543	\N
\.


--
-- Data for Name: grupo; Type: TABLE DATA; Schema: public; Owner: enallterm
--

COPY public.grupo (id, nombre, materia_id) FROM stdin;
1	DTJ01	1
2	DTJ02	1
3	DTJ03	1
4	TT01	6
5	TT02	6
6	TT03	6
\.


--
-- Data for Name: inscrito; Type: TABLE DATA; Schema: public; Owner: enallterm
--

COPY public.inscrito (id, user_id, materia_id, grupo_id, equipo_id) FROM stdin;
1	13	6	1	1
2	14	6	1	1
3	15	6	1	2
4	16	6	1	2
5	17	6	1	3
6	18	1	1	4
7	19	1	1	4
8	20	1	1	5
9	22	1	1	5
10	21	1	1	6
\.


--
-- Data for Name: materia; Type: TABLE DATA; Schema: public; Owner: enallterm
--

COPY public.materia (id, nombre) FROM stdin;
1	Diplomado en traducción juridica
2	Iniciación a la Traducción
3	Traducción de Textos Generales B-A (Inglés-Español)
4	Traducción de Textos de Ciencias Sociales y Humanidades B-A (Inglés-Español)
5	Traducción de Textos Generales C-A
6	Terminología para Traductores
7	Traducción de Textos Literarios B-A (Inglés-Español)
8	Traducción de Textos de Ciencias Sociales y Humanidades C-A
\.


--
-- Data for Name: migration; Type: TABLE DATA; Schema: public; Owner: enallterm
--

COPY public.migration (version, apply_time) FROM stdin;
m000000_000000_base	1569944265
m140506_102106_rbac_init	1571331962
m170907_052038_rbac_add_index_on_auth_assignment_user_id	1571331962
m180523_151638_rbac_updates_indexes_without_prefix	1571331962
\.


--
-- Data for Name: paises; Type: TABLE DATA; Schema: public; Owner: enallterm
--

COPY public.paises (id, nombre, abreviatura) FROM stdin;
1	México	Mex.
2	Colombia	Col.
3	España	Esp.
4	Argentina	Ar.
5	Perú	Pe.
6	Venezuela	Ven.
7	Chile	Cl.
8	Ecuador	Ecu.
9	Guatemala	Gt.
10	Cuba	Cub.
11	Bolivia	Bol.
12	República Dominicana	Rep. Dom.
13	Honduras	Hon.
14	El Salvador	El Salv.
15	Paraguay	Par.
16	Uruguay	Uy.
17	Nicaragua	Nic.
18	Costa Rica	CR.
19	Puerto Rico	PR.
20	Panamá	Pan.
21	Guinea Ecuatorial	GNQ.
22	Sahara Occidental	ESH.
\.


--
-- Data for Name: subareas; Type: TABLE DATA; Schema: public; Owner: enallterm
--

COPY public.subareas (id, areas_id, nombre) FROM stdin;
1	1	Biología
2	1	Química Diagnóstica
3	1	Ciencia Forense
4	1	Ciencias Agrogenómicas
5	1	Ciencias Ambientales
6	1	Ciencias Genómicas
7	1	Cirujano Dentista
8	1	Ecología
9	1	Enfermería
10	1	Enfermería y ObstreticiaFarmacia
11	1	Fisioterapia
12	1	Ingeniería Agrícola
13	1	Ingeniería en Alimentos
14	1	Investigación Biomédica Básica
15	1	Manejo Sustentable de Zonas Costeras
16	1	Médico Cirujano
17	1	Medicina Veterinaria y Zootecnia
18	1	Neurociencias
19	1	Nutriología
20	1	Odontología
21	1	Optometría
22	1	Psicología
23	1	Química
24	1	Química de Alimentos
25	1	Química Farmaceútico Biológica
26	1	Química Industrial
27	2	Actuaría
28	2	Arquitectura
29	2	Arquitectura del Paisaje
30	2	Ciencia de Materiales Sustentables
31	2	Ciencias de la Computación
32	2	Ciencias de la Tierra
33	2	Diseño Industrial
34	2	Física
35	2	Física Biomédica
36	2	Geociencias
37	2	Ingeniería Ambiental
38	2	Ingeniería Civil
39	2	Ingeniería de Minas y Metalúrgia
40	2	Ingeniería Eléctrica Electrónica
41	2	Ingeniería en Computación
42	2	Ingeniería en Energías Renovables
43	2	Ingeniería en Sistemas Biomédicos
44	2	Ingeniería en Telecomunicaciones
45	2	Ingeniería en Telecomunicaciones, Sistemas y Electrónica
46	2	Ingeniería Geofísica
47	2	Ingeniería Geológica
48	2	Ingeniería Geomática
49	2	Ingeniería Industrial
50	2	Ingeniería Mecánica
51	2	Ingeniería Mecánica Eléctrica
52	2	Ingeniería Mecatrónica
53	2	Ingeniería Petrolera
54	2	Ingeniería Química
55	2	Ingeniería Química Metalúrgica
56	2	Matemáticas
57	2	Matemáticas Aplicadas
58	2	Matemáticas Aplicadas y Computación
59	2	Nanotecnología
60	2	Tecnología
61	2	Tecnologías para la Información en Ciencias
62	2	Urbanismo
63	3	Administración Agropecuaria
64	3	Administración
65	3	Antropología
66	3	Ciencias de la Comunicación
67	3	Comunicación y Periodismo
68	3	Contaduría
69	3	Derecho
70	3	Desarrollo Comunitario para el Envejecimiento
71	3	Desarrollo Territorial
72	3	Economía
73	3	Economía Industrial
74	3	Estudios Sociales y Gestión Local
75	3	Geografía Aplicada
76	3	Geografía
77	3	Informática
78	3	Negocios Internacionales
79	3	Planificación para el Desarrollo Agropecuario
80	3	Relaciones Internacionales
81	3	Sociología
82	3	Trabajo Social
83	4	Administración de Archivos y Gestión Documental
84	4	Arte y Diseño
85	4	Artes Visuales
86	4	Bibliotecología y Estudios de la Información
87	4	Cinematografía
88	4	Desarrollo y Gestión Interculturales
89	4	Diseño Gráfico
90	4	Diseño y Comunicación Visual
91	4	Enseñanza de (Alemán) (Español) (Francés) (Inglés) (Italiano) Como Lengua Extranjera
92	4	Enseñanza de Inglés
93	4	Estudios Latinoamericanos
94	4	Etnomusicología
95	4	Filosofía
96	4	Geohistoria
97	4	Historia
98	4	Historia del Arte
99	4	Lengua y Literaturas Hispánicas
100	4	Lengua y Literaturas Modernas (Letras Alemanas, Francesas, Inglesas, Italianas o Portuguesas) 
101	4	Letras Clásicas
102	4	Lingüística Aplicada
103	4	Literatura Dramática y Teatro
104	4	Literatura Intercultural
105	4	Música - Canto
106	4	Música - Composición
107	4	Música - Educación Musical
108	4	Música - Instrumentista
109	4	Música - Piano
110	4	Música y Tecnología Artística
111	4	Pedagogía
112	4	Teatro y Actuación
113	4	Traducción
\.


--
-- Data for Name: user; Type: TABLE DATA; Schema: public; Owner: enallterm
--

COPY public."user" (id, uid, username, email, password, contact_email, contact_phone, status, created_at, update_at, auth_key) FROM stdin;
11	$2y$13$uidBm6k41r.XF1pOrGikmureybRbBC5mJ9JtbMhTeHJj/oyXcfpJy	lingüísta2	lingüísta2@gmail.com	$2y$13$QhFFnE/34YlZXG1HblutTO1jdlayRcPqzcxgIioxxYnMoysBTd9Qy	\N	\N	1	2019-10-17 10:42:13.657389	2019-10-17 10:42:13.657389	1d1H8NsBQxqYj0m0rIn69t_98x5_EBxCk9yg7YPaDUyD2cG9eUVv4x4nQsM0
5	$2y$13$49DVvUp1o7GV7nTPMOJJgu6pe1BEOmROY74yf2B.WxXMwLCMtOq6a	tere	tere@enallt.unam.mx	$2y$13$TPjbC7AhCwtih..RYFrZSu0C6Z9LxwfEIlL38gTgzw042crkPn5Iy	\N	\N	1	2019-10-17 10:22:20.946685	2019-10-17 10:22:54.284843	32fn5nLI6ZQZcrEFfTqK8BFDyHZnNz-rl-MLsCgWtjrIo4OpG4XGtBHrrO82
6	$2y$13$di0RT7iK3QKeFkSh5L8PEO5N14vMRiAtB8w/MveRTGtHNHEpQLMGK	iona	iona@enallt.unam.mx	$2y$13$XoOWGMLM3tNwb5hnT8YlNu8Cv8ChAGA4u.uMGc2iFk5C/YYFhxFY2	\N	\N	1	2019-10-17 10:35:31.146473	2019-10-17 10:35:42.674486	eaRR1KHwDzxKHzyticYb16ek4P6u__JfqHAo_yehcm0PBc2hprw0Z_JN7Eg_
7	$2y$13$WLjseNbKYNuEemPSXh77b.rUn2nFg8jdYgS/SRMqN1h25PhMDqXqW	experto1	experto1@gmail.com	$2y$13$MF7TVW8UeKlzTk0giPEhb.jC/3xk5E.cFbh.sLrFW4yNqfBY6r0.i	\N	\N	1	2019-10-17 10:37:03.33043	2019-10-17 10:37:15.634164	TsNNwkbnk6X_t7VCQ82AQ87ydMTDGKkSYo5dIF_yxNRGEOdmRxeUk5xcDYwx
8	$2y$13$UGRgtvBO0c2ctFREFPQkC.iD7CCc2X6/DHyDJzp6uu7SwBAYNQgH6	experto2	experto2@gmail.com	$2y$13$MEkrlxY2s3b2kODcHgMVe.96rqm99uHK0XduxfSPB4vjIC55tOzn2	\N	\N	1	2019-10-17 10:38:17.989294	2019-10-17 10:38:27.969711	bgdhHJca3OXFdDkW2w3gBHqkcfWmEtgKYI5DCayxl_YNoyoJQoYmmDRQN732
9	$2y$13$kjTaUEVACPokpDmZM9j0qOiEHq6Zcl.E.RD6hKiSVlXxj10mTbrWG	experto3	experto3@gmail.com	$2y$13$glppZTpoVN7N.Tm.0S/Tze1IRJgPomwvkJr92HmQWPIz8pXFmk3CO	\N	\N	1	2019-10-17 10:39:57.364927	2019-10-17 10:40:06.426635	raZI5qxcpD4G3hEsBnqt9RVN7GnKo5PEdocZtd5zpF3AaOAIAIvOWQBM7E0v
22	$2y$13$7ZpoEMTpFWO9a2mJX6ts8eg9J9eGClZaYh4bAs.QkfiZCGB030IOO	alumno10	alumno10@gmail.com	$2y$13$K4eOjCXQh0RcdKIlgc6cxO4JIjTOc0n6yI1br.DBlBUuGiqmGx34q	\N	\N	1	2019-10-23 12:11:15.276495	2019-10-23 12:11:15.276495	HLAgU9Jg4fGJh2iy-UDLNXBIqTqX6Jmh5M6xEiIWvw8hprxvPdLMkcj0dNKd
18	$2y$13$F6kdP1h/yZ3rMUk/a.MqcOC./GqMbZw8MMhA5x9rM8oRCwnIuWU/q	alumno6	alumno6@gmail.com	$2y$13$Rk73QpDqWE5Yqfr2kjeAXe9U5P.uyA5nF8umMYR67ozBJBOWn2YA6	\N	\N	1	2019-10-17 10:54:22.141131	2019-10-17 10:55:24.509722	nUPE_fPTf2sbzDlO6UZGn2g6z1Eg7vzhWwiM5_8e8QIVUA_v66C3a9NkiRA_
10	$2y$13$m.jEnvuXrc/btgaBzVba6O9bC8VwBbcs/YZluDobeU0fdQ33UZcdq	lingüísta1	lingüísta1@gmail.com	$2y$13$nEkztY4Xu1RF/wzE1DNWne1k7EC5leTozMIFXGwN0F6qviQSh.93G	\N	\N	1	2019-10-17 10:41:12.937028	2019-10-17 10:41:12.937028	ecDURZtiel3r1P5yv3IoyHP0sTWbTd4veFmuW8aHcemniQpKMJGcezKWKS75
17	$2y$13$b/1OxnCOKiRSGAGW0yT41.KTGzgq1pLxqfWNXVaJ9PldWT3DCJune	alumno5	alumno5@gmail.com	$2y$13$CBs1DTPxutIWNXlyG3t9RuJJ4P.76H42PSHtqQYxWJpMUJAZ/tZ12	\N	\N	1	2019-10-17 10:53:24.177036	2019-10-17 10:55:49.699101	NWhrLShIap_rFDNyC0XZsUwmcyL70j50k2WvoPOVfIjecfd1b0wI8y-HvEz0
12	$2y$13$.AqNXPRlj1GbKfvH3fjWMuFFaIQ2TTPkPKijBGaKgqgQlyz62gFMe	lingüísta2	lingüísta2@gmail.com	$2y$13$SmrlE9IgpUnV7iAmmDwTRelC8QKgtL7OSaoLsSjFm2G0uKureye0m	\N	\N	1	2019-10-17 10:47:50.62149	2019-10-17 10:47:50.62149	uM8_NXQ8b0HnCJmKo7QALU-wCMTjawvFOJM9IDEnl1nl-P_8BIxRwnxH_k99
16	$2y$13$nbn/HdDMfNi3diRUWysfGuTCRuGm39y0N19kL7PWcWXgT7fQK.fU6	alumno4	alumno4@gmail.com	$2y$13$aID.PIz5cp9VLbeDrA53k.R0AqpdV3hCqgV7wD9EWXQk/o7fn7gVm	\N	\N	1	2019-10-17 10:52:43.977362	2019-10-17 10:56:10.011661	C4wh0q5omBYFb9RmI3OoYR3NRbfqswfiJOsYvC1PcpYbgUi6u838L-UbRo3L
15	$2y$13$iuAWgj6mi4rkCbKEd93S4.DF.K01OGgrZjZ/6YO//ZTk0fg9imouO	alumno3	alumno3@gmail.com	$2y$13$56CS4u1U1aWaKjHSJDQqbuhWf4AcG1x5qRdNJy4lT.YqgAalL6lTe	\N	\N	1	2019-10-17 10:51:45.980709	2019-10-17 10:56:32.295502	tIHu0lyRetksN05dBJ0MolTJy3pDgWbYGOSoUiYh-5fXlt6Cwe2H6GNaLuQz
13	$2y$13$2eRRThvMP02jCVh/ireOROvXdWHwSEDReMP1Aqea0UYR5GdnrGrUe	alumno1	alumno1@gmail.com	$2y$13$cAPEyYmIytuEkLyDJE8FFu.1ARrdM1ALQ1QS6TFYl2I1PklnNsiFW	\N	\N	1	2019-10-17 10:49:39.547314	2019-10-17 10:49:39.547314	LRKfLbj_Cu9UGP4K9EgvAd2OAEsMrLpBEOlC6h-oqq5NMb-QJ7shLz_b6bAA
14	$2y$13$J9ucWPnkOlYO6v5eAVu4je0GbxMlLC4mi5Fz1zuBtwAiFSJL.Otse	alumno2	alumno2@gmail.com	$2y$13$f2eXrZyx/23ndJXuqg/ZNuVJctAhImBstHWzaSUc5akW2YQ0urueK	\N	\N	1	2019-10-17 10:50:38.889751	2019-10-17 10:50:38.889751	obJ48q2PX0GD_B8p5azjbuQ_qaGwu0JmHJDhCUcRrPPbMSirHLxCAKg_RFLu
4	$2y$13$FQlDyhSwRYXGt.4jE12jLu8orxb5cccQvT00ZTdYZ.A.Ii2rN.2Yu	alexrdz	alexrdzallende@gmail.com	$2y$13$6nRaWfJfSr.a0n.NSy4ovOPWlfc8IYJwiZI5BClPjS61nykcjYzqK	\N	\N	1	2019-10-17 10:20:49.479493	2019-10-17 10:21:03.450739	D3qkWLo8hQ-oOwXvsJe5BfM-IIGWg5ua-npY4mPXytSvEORJoGU4WHlq82m5
20	$2y$13$TSqYwPax0QKbqjTcQSY5iu3N2qJVprPmK2QGQGYK6NJ4EIsj0rAG.	alumno8	alumno8@gmail.com	$2y$13$/fdjFqn9SIaakYonBKnynOtXO1t2cmnkm5JTzK8rvNPuHrPZA9Tze	\N	\N	1	2019-10-23 12:03:40.759394	2019-10-23 12:04:26.143039	4k1sM_hNrGKx4YBHL8macDrFtDqpjFtRVDsNqssvy1MJHPV-lFc8fhJaxyod
19	$2y$13$2yFUMt3x9S119RzgGXB7ueCzI6uBU24FSq4naXVo9yfBvR1K/2Wc.	alumno7	alumno7@gmail.com	$2y$13$zKv5JwuV7QVrGfuP5fHR8uSJZQG6iQV8VbWyiNS7xPXTKpIHDT1tG	\N	\N	1	2019-10-17 10:57:11.191783	2019-10-17 11:02:46.008294	fUjJlHWwa7SIu84YUPFNVF4-mXRrIg5HASniXdVUBLg-s6zVPp4-cSCEbBSg
21	$2y$13$aDOmWf6zKhqe6vco9M2BHuJlO3xLqtQb0Zr/o6KCnuCPRfDjBPNfu	alumno9	alumno9@gmail.com	$2y$13$0xYyB.NQ8M9x6XepX4j1VOGQafxaPCdim9Xb0lPax4YJ76mfvkcUe	\N	\N	1	2019-10-23 12:06:36.756193	2019-10-23 12:06:36.756193	V5hHlZ_95WlJThEtWsO2kx3X0L9MScI_Nf4g8_wCAS2mZkyfJNGFbW1ItjxO
\.


--
-- Name: areas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: enallterm
--

SELECT pg_catalog.setval('public.areas_id_seq', 4, true);


--
-- Name: autor_id_seq; Type: SEQUENCE SET; Schema: public; Owner: enallterm
--

SELECT pg_catalog.setval('public.autor_id_seq', 1, false);


--
-- Name: equipo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: enallterm
--

SELECT pg_catalog.setval('public.equipo_id_seq', 6, true);


--
-- Name: ficha_terminologica_id_seq; Type: SEQUENCE SET; Schema: public; Owner: enallterm
--

SELECT pg_catalog.setval('public.ficha_terminologica_id_seq', 23, true);


--
-- Name: grupo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: enallterm
--

SELECT pg_catalog.setval('public.grupo_id_seq', 6, true);


--
-- Name: inscrito_id_seq; Type: SEQUENCE SET; Schema: public; Owner: enallterm
--

SELECT pg_catalog.setval('public.inscrito_id_seq', 10, true);


--
-- Name: materia_id_seq; Type: SEQUENCE SET; Schema: public; Owner: enallterm
--

SELECT pg_catalog.setval('public.materia_id_seq', 8, true);


--
-- Name: paises_id_seq; Type: SEQUENCE SET; Schema: public; Owner: enallterm
--

SELECT pg_catalog.setval('public.paises_id_seq', 22, true);


--
-- Name: subareas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: enallterm
--

SELECT pg_catalog.setval('public.subareas_id_seq', 113, true);


--
-- Name: user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: enallterm
--

SELECT pg_catalog.setval('public.user_id_seq', 22, true);


--
-- Name: auth_assignment auth_assignment_pkey; Type: CONSTRAINT; Schema: public; Owner: enallterm
--

ALTER TABLE ONLY public.auth_assignment
    ADD CONSTRAINT auth_assignment_pkey PRIMARY KEY (item_name, user_id);


--
-- Name: auth_item_child auth_item_child_pkey; Type: CONSTRAINT; Schema: public; Owner: enallterm
--

ALTER TABLE ONLY public.auth_item_child
    ADD CONSTRAINT auth_item_child_pkey PRIMARY KEY (parent, child);


--
-- Name: auth_item auth_item_pkey; Type: CONSTRAINT; Schema: public; Owner: enallterm
--

ALTER TABLE ONLY public.auth_item
    ADD CONSTRAINT auth_item_pkey PRIMARY KEY (name);


--
-- Name: auth_rule auth_rule_pkey; Type: CONSTRAINT; Schema: public; Owner: enallterm
--

ALTER TABLE ONLY public.auth_rule
    ADD CONSTRAINT auth_rule_pkey PRIMARY KEY (name);


--
-- Name: migration migration_pkey; Type: CONSTRAINT; Schema: public; Owner: enallterm
--

ALTER TABLE ONLY public.migration
    ADD CONSTRAINT migration_pkey PRIMARY KEY (version);


--
-- Name: areas pk_areas_id; Type: CONSTRAINT; Schema: public; Owner: enallterm
--

ALTER TABLE ONLY public.areas
    ADD CONSTRAINT pk_areas_id PRIMARY KEY (id);


--
-- Name: autor pk_autor_id; Type: CONSTRAINT; Schema: public; Owner: enallterm
--

ALTER TABLE ONLY public.autor
    ADD CONSTRAINT pk_autor_id PRIMARY KEY (id);


--
-- Name: equipo pk_equipo_id; Type: CONSTRAINT; Schema: public; Owner: enallterm
--

ALTER TABLE ONLY public.equipo
    ADD CONSTRAINT pk_equipo_id PRIMARY KEY (id);


--
-- Name: ficha_terminologica pk_ficha_terminologica_id; Type: CONSTRAINT; Schema: public; Owner: enallterm
--

ALTER TABLE ONLY public.ficha_terminologica
    ADD CONSTRAINT pk_ficha_terminologica_id PRIMARY KEY (id);


--
-- Name: grupo pk_grupo_id; Type: CONSTRAINT; Schema: public; Owner: enallterm
--

ALTER TABLE ONLY public.grupo
    ADD CONSTRAINT pk_grupo_id PRIMARY KEY (id);


--
-- Name: inscrito pk_inscrito_id; Type: CONSTRAINT; Schema: public; Owner: enallterm
--

ALTER TABLE ONLY public.inscrito
    ADD CONSTRAINT pk_inscrito_id PRIMARY KEY (id);


--
-- Name: materia pk_materia_id; Type: CONSTRAINT; Schema: public; Owner: enallterm
--

ALTER TABLE ONLY public.materia
    ADD CONSTRAINT pk_materia_id PRIMARY KEY (id);


--
-- Name: paises pk_paises_id; Type: CONSTRAINT; Schema: public; Owner: enallterm
--

ALTER TABLE ONLY public.paises
    ADD CONSTRAINT pk_paises_id PRIMARY KEY (id);


--
-- Name: subareas pk_subareas_id; Type: CONSTRAINT; Schema: public; Owner: enallterm
--

ALTER TABLE ONLY public.subareas
    ADD CONSTRAINT pk_subareas_id PRIMARY KEY (id);


--
-- Name: user pk_user_id; Type: CONSTRAINT; Schema: public; Owner: enallterm
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT pk_user_id PRIMARY KEY (id);


--
-- Name: autor uk_autor_fichaterminologica_id_user_id; Type: CONSTRAINT; Schema: public; Owner: enallterm
--

ALTER TABLE ONLY public.autor
    ADD CONSTRAINT uk_autor_fichaterminologica_id_user_id UNIQUE (ficha_terminologica_id, user_id);


--
-- Name: inscrito uk_inscrito_user_id_materia_id; Type: CONSTRAINT; Schema: public; Owner: enallterm
--

ALTER TABLE ONLY public.inscrito
    ADD CONSTRAINT uk_inscrito_user_id_materia_id UNIQUE (user_id, materia_id);


--
-- Name: user uk_user_auth_key; Type: CONSTRAINT; Schema: public; Owner: enallterm
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT uk_user_auth_key UNIQUE (auth_key);


--
-- Name: user uk_user_uid; Type: CONSTRAINT; Schema: public; Owner: enallterm
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT uk_user_uid UNIQUE (uid);


--
-- Name: idx-auth_assignment-user_id; Type: INDEX; Schema: public; Owner: enallterm
--

CREATE INDEX "idx-auth_assignment-user_id" ON public.auth_assignment USING btree (user_id);


--
-- Name: idx-auth_item-type; Type: INDEX; Schema: public; Owner: enallterm
--

CREATE INDEX "idx-auth_item-type" ON public.auth_item USING btree (type);


--
-- Name: auth_assignment auth_assignment_item_name_fkey; Type: FK CONSTRAINT; Schema: public; Owner: enallterm
--

ALTER TABLE ONLY public.auth_assignment
    ADD CONSTRAINT auth_assignment_item_name_fkey FOREIGN KEY (item_name) REFERENCES public.auth_item(name) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: auth_item_child auth_item_child_child_fkey; Type: FK CONSTRAINT; Schema: public; Owner: enallterm
--

ALTER TABLE ONLY public.auth_item_child
    ADD CONSTRAINT auth_item_child_child_fkey FOREIGN KEY (child) REFERENCES public.auth_item(name) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: auth_item_child auth_item_child_parent_fkey; Type: FK CONSTRAINT; Schema: public; Owner: enallterm
--

ALTER TABLE ONLY public.auth_item_child
    ADD CONSTRAINT auth_item_child_parent_fkey FOREIGN KEY (parent) REFERENCES public.auth_item(name) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: auth_item auth_item_rule_name_fkey; Type: FK CONSTRAINT; Schema: public; Owner: enallterm
--

ALTER TABLE ONLY public.auth_item
    ADD CONSTRAINT auth_item_rule_name_fkey FOREIGN KEY (rule_name) REFERENCES public.auth_rule(name) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: autor fk_autor_id_ficha_termininologica; Type: FK CONSTRAINT; Schema: public; Owner: enallterm
--

ALTER TABLE ONLY public.autor
    ADD CONSTRAINT fk_autor_id_ficha_termininologica FOREIGN KEY (ficha_terminologica_id) REFERENCES public.ficha_terminologica(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: autor fk_autor_inscrito_id; Type: FK CONSTRAINT; Schema: public; Owner: enallterm
--

ALTER TABLE ONLY public.autor
    ADD CONSTRAINT fk_autor_inscrito_id FOREIGN KEY (inscrito_id) REFERENCES public.inscrito(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: autor fk_autor_user_id; Type: FK CONSTRAINT; Schema: public; Owner: enallterm
--

ALTER TABLE ONLY public.autor
    ADD CONSTRAINT fk_autor_user_id FOREIGN KEY (user_id) REFERENCES public."user"(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: equipo fk_equipo_grupo_id; Type: FK CONSTRAINT; Schema: public; Owner: enallterm
--

ALTER TABLE ONLY public.equipo
    ADD CONSTRAINT fk_equipo_grupo_id FOREIGN KEY (grupo_id) REFERENCES public.grupo(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: ficha_terminologica fk_ficha_terminologica_area_id; Type: FK CONSTRAINT; Schema: public; Owner: enallterm
--

ALTER TABLE ONLY public.ficha_terminologica
    ADD CONSTRAINT fk_ficha_terminologica_area_id FOREIGN KEY (area_id) REFERENCES public.areas(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: ficha_terminologica fk_ficha_terminologica_pais_id; Type: FK CONSTRAINT; Schema: public; Owner: enallterm
--

ALTER TABLE ONLY public.ficha_terminologica
    ADD CONSTRAINT fk_ficha_terminologica_pais_id FOREIGN KEY (pais_id) REFERENCES public.paises(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: ficha_terminologica fk_ficha_terminologica_subarea_id; Type: FK CONSTRAINT; Schema: public; Owner: enallterm
--

ALTER TABLE ONLY public.ficha_terminologica
    ADD CONSTRAINT fk_ficha_terminologica_subarea_id FOREIGN KEY (area_id) REFERENCES public.subareas(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: grupo fk_grupo_materia_id; Type: FK CONSTRAINT; Schema: public; Owner: enallterm
--

ALTER TABLE ONLY public.grupo
    ADD CONSTRAINT fk_grupo_materia_id FOREIGN KEY (materia_id) REFERENCES public.materia(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: inscrito fk_inscrito_equipo_id; Type: FK CONSTRAINT; Schema: public; Owner: enallterm
--

ALTER TABLE ONLY public.inscrito
    ADD CONSTRAINT fk_inscrito_equipo_id FOREIGN KEY (equipo_id) REFERENCES public.equipo(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: inscrito fk_inscrito_grupo_id; Type: FK CONSTRAINT; Schema: public; Owner: enallterm
--

ALTER TABLE ONLY public.inscrito
    ADD CONSTRAINT fk_inscrito_grupo_id FOREIGN KEY (grupo_id) REFERENCES public.grupo(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: inscrito fk_inscrito_materia_id; Type: FK CONSTRAINT; Schema: public; Owner: enallterm
--

ALTER TABLE ONLY public.inscrito
    ADD CONSTRAINT fk_inscrito_materia_id FOREIGN KEY (materia_id) REFERENCES public.materia(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: inscrito fk_inscrito_user_id; Type: FK CONSTRAINT; Schema: public; Owner: enallterm
--

ALTER TABLE ONLY public.inscrito
    ADD CONSTRAINT fk_inscrito_user_id FOREIGN KEY (user_id) REFERENCES public."user"(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: subareas fk_subareas_areas_id; Type: FK CONSTRAINT; Schema: public; Owner: enallterm
--

ALTER TABLE ONLY public.subareas
    ADD CONSTRAINT fk_subareas_areas_id FOREIGN KEY (areas_id) REFERENCES public.areas(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- PostgreSQL database dump complete
--

