--
-- PostgreSQL database dump
--

-- Dumped from database version 10.10 (Ubuntu 10.10-0ubuntu0.18.04.1)
-- Dumped by pg_dump version 10.10 (Ubuntu 10.10-0ubuntu0.18.04.1)

-- Started on 2019-10-17 11:30:06 CDT

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
-- TOC entry 1 (class 3079 OID 13081)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 3007 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 199 (class 1259 OID 42004)
-- Name: areas; Type: TABLE; Schema: public; Owner: enallterm
--

CREATE TABLE public.areas (
    id integer NOT NULL,
    nombre character varying(250) NOT NULL
);


ALTER TABLE public.areas OWNER TO enallterm;

--
-- TOC entry 3008 (class 0 OID 0)
-- Dependencies: 199
-- Name: TABLE areas; Type: COMMENT; Schema: public; Owner: enallterm
--

COMMENT ON TABLE public.areas IS 'Tabla de áreas del conocimiento';


--
-- TOC entry 198 (class 1259 OID 42002)
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
-- TOC entry 3009 (class 0 OID 0)
-- Dependencies: 198
-- Name: areas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: enallterm
--

ALTER SEQUENCE public.areas_id_seq OWNED BY public.areas.id;


--
-- TOC entry 202 (class 1259 OID 42023)
-- Name: migration; Type: TABLE; Schema: public; Owner: enallterm
--

CREATE TABLE public.migration (
    version character varying(180) NOT NULL,
    apply_time integer
);


ALTER TABLE public.migration OWNER TO enallterm;

--
-- TOC entry 197 (class 1259 OID 41996)
-- Name: paises; Type: TABLE; Schema: public; Owner: enallterm
--

CREATE TABLE public.paises (
    id integer NOT NULL,
    nombre character varying(100) NOT NULL,
    abreviatura character varying(50) NOT NULL
);


ALTER TABLE public.paises OWNER TO enallterm;

--
-- TOC entry 3010 (class 0 OID 0)
-- Dependencies: 197
-- Name: TABLE paises; Type: COMMENT; Schema: public; Owner: enallterm
--

COMMENT ON TABLE public.paises IS 'Tabla de áreas del conocimiento';


--
-- TOC entry 196 (class 1259 OID 41994)
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
-- TOC entry 3011 (class 0 OID 0)
-- Dependencies: 196
-- Name: paises_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: enallterm
--

ALTER SEQUENCE public.paises_id_seq OWNED BY public.paises.id;


--
-- TOC entry 201 (class 1259 OID 42012)
-- Name: subareas; Type: TABLE; Schema: public; Owner: enallterm
--

CREATE TABLE public.subareas (
    id integer NOT NULL,
    id_areas integer NOT NULL,
    nombre character varying(250) NOT NULL
);


ALTER TABLE public.subareas OWNER TO enallterm;

--
-- TOC entry 3012 (class 0 OID 0)
-- Dependencies: 201
-- Name: TABLE subareas; Type: COMMENT; Schema: public; Owner: enallterm
--

COMMENT ON TABLE public.subareas IS 'Tabla de subáreas del conocimiento';


--
-- TOC entry 200 (class 1259 OID 42010)
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
-- TOC entry 3013 (class 0 OID 0)
-- Dependencies: 200
-- Name: subareas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: enallterm
--

ALTER SEQUENCE public.subareas_id_seq OWNED BY public.subareas.id;


--
-- TOC entry 204 (class 1259 OID 50252)
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
-- TOC entry 203 (class 1259 OID 50250)
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
-- TOC entry 3014 (class 0 OID 0)
-- Dependencies: 203
-- Name: user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: enallterm
--

ALTER SEQUENCE public.user_id_seq OWNED BY public."user".id;


--
-- TOC entry 2850 (class 2604 OID 42007)
-- Name: areas id; Type: DEFAULT; Schema: public; Owner: enallterm
--

ALTER TABLE ONLY public.areas ALTER COLUMN id SET DEFAULT nextval('public.areas_id_seq'::regclass);


--
-- TOC entry 2849 (class 2604 OID 41999)
-- Name: paises id; Type: DEFAULT; Schema: public; Owner: enallterm
--

ALTER TABLE ONLY public.paises ALTER COLUMN id SET DEFAULT nextval('public.paises_id_seq'::regclass);


--
-- TOC entry 2851 (class 2604 OID 42015)
-- Name: subareas id; Type: DEFAULT; Schema: public; Owner: enallterm
--

ALTER TABLE ONLY public.subareas ALTER COLUMN id SET DEFAULT nextval('public.subareas_id_seq'::regclass);


--
-- TOC entry 2852 (class 2604 OID 50255)
-- Name: user id; Type: DEFAULT; Schema: public; Owner: enallterm
--

ALTER TABLE ONLY public."user" ALTER COLUMN id SET DEFAULT nextval('public.user_id_seq'::regclass);


--
-- TOC entry 2994 (class 0 OID 42004)
-- Dependencies: 199
-- Data for Name: areas; Type: TABLE DATA; Schema: public; Owner: enallterm
--

COPY public.areas (id, nombre) FROM stdin;
1	Ciencias Biológicas, Químicas y de la Salud
2	Ciencias Físico - Matemáticas y de las Ingenierías
3	Ciencias Sociales
4	Humanidades y de las Artes
\.


--
-- TOC entry 2997 (class 0 OID 42023)
-- Dependencies: 202
-- Data for Name: migration; Type: TABLE DATA; Schema: public; Owner: enallterm
--

COPY public.migration (version, apply_time) FROM stdin;
m000000_000000_base	1569944265
\.


--
-- TOC entry 2992 (class 0 OID 41996)
-- Dependencies: 197
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
-- TOC entry 2996 (class 0 OID 42012)
-- Dependencies: 201
-- Data for Name: subareas; Type: TABLE DATA; Schema: public; Owner: enallterm
--

COPY public.subareas (id, id_areas, nombre) FROM stdin;
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
-- TOC entry 2999 (class 0 OID 50252)
-- Dependencies: 204
-- Data for Name: user; Type: TABLE DATA; Schema: public; Owner: enallterm
--

COPY public."user" (id, uid, username, email, password, contact_email, contact_phone, status, created_at, update_at, auth_key) FROM stdin;
11	$2y$13$uidBm6k41r.XF1pOrGikmureybRbBC5mJ9JtbMhTeHJj/oyXcfpJy	lingüísta2	lingüísta2@gmail.com	$2y$13$QhFFnE/34YlZXG1HblutTO1jdlayRcPqzcxgIioxxYnMoysBTd9Qy	\N	\N	1	2019-10-17 10:42:13.657389	2019-10-17 10:42:13.657389	1d1H8NsBQxqYj0m0rIn69t_98x5_EBxCk9yg7YPaDUyD2cG9eUVv4x4nQsM0
4	$2y$13$FQlDyhSwRYXGt.4jE12jLu8orxb5cccQvT00ZTdYZ.A.Ii2rN.2Yu	alexrdz	alexrdzallende@gmail.com	$2y$13$7khqD.Gr/HT2KcBtjQjI0OLvt2m2lzHxpBUDtuWBxvfNP37.BlV76	\N	\N	1	2019-10-17 10:20:49.479493	2019-10-17 10:21:03.450739	D3qkWLo8hQ-oOwXvsJe5BfM-IIGWg5ua-npY4mPXytSvEORJoGU4WHlq82m5
5	$2y$13$49DVvUp1o7GV7nTPMOJJgu6pe1BEOmROY74yf2B.WxXMwLCMtOq6a	tere	tere@enallt.unam.mx	$2y$13$TPjbC7AhCwtih..RYFrZSu0C6Z9LxwfEIlL38gTgzw042crkPn5Iy	\N	\N	1	2019-10-17 10:22:20.946685	2019-10-17 10:22:54.284843	32fn5nLI6ZQZcrEFfTqK8BFDyHZnNz-rl-MLsCgWtjrIo4OpG4XGtBHrrO82
6	$2y$13$di0RT7iK3QKeFkSh5L8PEO5N14vMRiAtB8w/MveRTGtHNHEpQLMGK	iona	iona@enallt.unam.mx	$2y$13$XoOWGMLM3tNwb5hnT8YlNu8Cv8ChAGA4u.uMGc2iFk5C/YYFhxFY2	\N	\N	1	2019-10-17 10:35:31.146473	2019-10-17 10:35:42.674486	eaRR1KHwDzxKHzyticYb16ek4P6u__JfqHAo_yehcm0PBc2hprw0Z_JN7Eg_
7	$2y$13$WLjseNbKYNuEemPSXh77b.rUn2nFg8jdYgS/SRMqN1h25PhMDqXqW	experto1	experto1@gmail.com	$2y$13$MF7TVW8UeKlzTk0giPEhb.jC/3xk5E.cFbh.sLrFW4yNqfBY6r0.i	\N	\N	1	2019-10-17 10:37:03.33043	2019-10-17 10:37:15.634164	TsNNwkbnk6X_t7VCQ82AQ87ydMTDGKkSYo5dIF_yxNRGEOdmRxeUk5xcDYwx
8	$2y$13$UGRgtvBO0c2ctFREFPQkC.iD7CCc2X6/DHyDJzp6uu7SwBAYNQgH6	experto2	experto2@gmail.com	$2y$13$MEkrlxY2s3b2kODcHgMVe.96rqm99uHK0XduxfSPB4vjIC55tOzn2	\N	\N	1	2019-10-17 10:38:17.989294	2019-10-17 10:38:27.969711	bgdhHJca3OXFdDkW2w3gBHqkcfWmEtgKYI5DCayxl_YNoyoJQoYmmDRQN732
9	$2y$13$kjTaUEVACPokpDmZM9j0qOiEHq6Zcl.E.RD6hKiSVlXxj10mTbrWG	experto3	experto3@gmail.com	$2y$13$glppZTpoVN7N.Tm.0S/Tze1IRJgPomwvkJr92HmQWPIz8pXFmk3CO	\N	\N	1	2019-10-17 10:39:57.364927	2019-10-17 10:40:06.426635	raZI5qxcpD4G3hEsBnqt9RVN7GnKo5PEdocZtd5zpF3AaOAIAIvOWQBM7E0v
18	$2y$13$F6kdP1h/yZ3rMUk/a.MqcOC./GqMbZw8MMhA5x9rM8oRCwnIuWU/q	alumno6	alumno6@gmail.com	$2y$13$Rk73QpDqWE5Yqfr2kjeAXe9U5P.uyA5nF8umMYR67ozBJBOWn2YA6	\N	\N	1	2019-10-17 10:54:22.141131	2019-10-17 10:55:24.509722	nUPE_fPTf2sbzDlO6UZGn2g6z1Eg7vzhWwiM5_8e8QIVUA_v66C3a9NkiRA_
10	$2y$13$m.jEnvuXrc/btgaBzVba6O9bC8VwBbcs/YZluDobeU0fdQ33UZcdq	lingüísta1	lingüísta1@gmail.com	$2y$13$nEkztY4Xu1RF/wzE1DNWne1k7EC5leTozMIFXGwN0F6qviQSh.93G	\N	\N	1	2019-10-17 10:41:12.937028	2019-10-17 10:41:12.937028	ecDURZtiel3r1P5yv3IoyHP0sTWbTd4veFmuW8aHcemniQpKMJGcezKWKS75
17	$2y$13$b/1OxnCOKiRSGAGW0yT41.KTGzgq1pLxqfWNXVaJ9PldWT3DCJune	alumno5	alumno5@gmail.com	$2y$13$CBs1DTPxutIWNXlyG3t9RuJJ4P.76H42PSHtqQYxWJpMUJAZ/tZ12	\N	\N	1	2019-10-17 10:53:24.177036	2019-10-17 10:55:49.699101	NWhrLShIap_rFDNyC0XZsUwmcyL70j50k2WvoPOVfIjecfd1b0wI8y-HvEz0
12	$2y$13$.AqNXPRlj1GbKfvH3fjWMuFFaIQ2TTPkPKijBGaKgqgQlyz62gFMe	lingüísta2	lingüísta2@gmail.com	$2y$13$SmrlE9IgpUnV7iAmmDwTRelC8QKgtL7OSaoLsSjFm2G0uKureye0m	\N	\N	1	2019-10-17 10:47:50.62149	2019-10-17 10:47:50.62149	uM8_NXQ8b0HnCJmKo7QALU-wCMTjawvFOJM9IDEnl1nl-P_8BIxRwnxH_k99
16	$2y$13$nbn/HdDMfNi3diRUWysfGuTCRuGm39y0N19kL7PWcWXgT7fQK.fU6	alumno4	alumno4@gmail.com	$2y$13$aID.PIz5cp9VLbeDrA53k.R0AqpdV3hCqgV7wD9EWXQk/o7fn7gVm	\N	\N	1	2019-10-17 10:52:43.977362	2019-10-17 10:56:10.011661	C4wh0q5omBYFb9RmI3OoYR3NRbfqswfiJOsYvC1PcpYbgUi6u838L-UbRo3L
15	$2y$13$iuAWgj6mi4rkCbKEd93S4.DF.K01OGgrZjZ/6YO//ZTk0fg9imouO	alumno3	alumno3@gmail.com	$2y$13$56CS4u1U1aWaKjHSJDQqbuhWf4AcG1x5qRdNJy4lT.YqgAalL6lTe	\N	\N	1	2019-10-17 10:51:45.980709	2019-10-17 10:56:32.295502	tIHu0lyRetksN05dBJ0MolTJy3pDgWbYGOSoUiYh-5fXlt6Cwe2H6GNaLuQz
13	$2y$13$2eRRThvMP02jCVh/ireOROvXdWHwSEDReMP1Aqea0UYR5GdnrGrUe	alumno1	alumno1@gmail.com	$2y$13$cAPEyYmIytuEkLyDJE8FFu.1ARrdM1ALQ1QS6TFYl2I1PklnNsiFW	\N	\N	1	2019-10-17 10:49:39.547314	2019-10-17 10:49:39.547314	LRKfLbj_Cu9UGP4K9EgvAd2OAEsMrLpBEOlC6h-oqq5NMb-QJ7shLz_b6bAA
14	$2y$13$J9ucWPnkOlYO6v5eAVu4je0GbxMlLC4mi5Fz1zuBtwAiFSJL.Otse	alumno2	alumno2@gmail.com	$2y$13$f2eXrZyx/23ndJXuqg/ZNuVJctAhImBstHWzaSUc5akW2YQ0urueK	\N	\N	1	2019-10-17 10:50:38.889751	2019-10-17 10:50:38.889751	obJ48q2PX0GD_B8p5azjbuQ_qaGwu0JmHJDhCUcRrPPbMSirHLxCAKg_RFLu
19	$2y$13$2yFUMt3x9S119RzgGXB7ueCzI6uBU24FSq4naXVo9yfBvR1K/2Wc.	alumno7	alumno7@gmail.com	$2y$13$zKv5JwuV7QVrGfuP5fHR8uSJZQG6iQV8VbWyiNS7xPXTKpIHDT1tG	\N	\N	1	2019-10-17 10:57:11.191783	2019-10-17 11:02:46.008294	fUjJlHWwa7SIu84YUPFNVF4-mXRrIg5HASniXdVUBLg-s6zVPp4-cSCEbBSg
\.


--
-- TOC entry 3015 (class 0 OID 0)
-- Dependencies: 198
-- Name: areas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: enallterm
--

SELECT pg_catalog.setval('public.areas_id_seq', 4, true);


--
-- TOC entry 3016 (class 0 OID 0)
-- Dependencies: 196
-- Name: paises_id_seq; Type: SEQUENCE SET; Schema: public; Owner: enallterm
--

SELECT pg_catalog.setval('public.paises_id_seq', 22, true);


--
-- TOC entry 3017 (class 0 OID 0)
-- Dependencies: 200
-- Name: subareas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: enallterm
--

SELECT pg_catalog.setval('public.subareas_id_seq', 113, true);


--
-- TOC entry 3018 (class 0 OID 0)
-- Dependencies: 203
-- Name: user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: enallterm
--

SELECT pg_catalog.setval('public.user_id_seq', 19, true);


--
-- TOC entry 2862 (class 2606 OID 42027)
-- Name: migration migration_pkey; Type: CONSTRAINT; Schema: public; Owner: enallterm
--

ALTER TABLE ONLY public.migration
    ADD CONSTRAINT migration_pkey PRIMARY KEY (version);


--
-- TOC entry 2858 (class 2606 OID 42009)
-- Name: areas pk_areas_id; Type: CONSTRAINT; Schema: public; Owner: enallterm
--

ALTER TABLE ONLY public.areas
    ADD CONSTRAINT pk_areas_id PRIMARY KEY (id);


--
-- TOC entry 2856 (class 2606 OID 42001)
-- Name: paises pk_paises_id; Type: CONSTRAINT; Schema: public; Owner: enallterm
--

ALTER TABLE ONLY public.paises
    ADD CONSTRAINT pk_paises_id PRIMARY KEY (id);


--
-- TOC entry 2860 (class 2606 OID 42017)
-- Name: subareas pk_subareas_id; Type: CONSTRAINT; Schema: public; Owner: enallterm
--

ALTER TABLE ONLY public.subareas
    ADD CONSTRAINT pk_subareas_id PRIMARY KEY (id);


--
-- TOC entry 2864 (class 2606 OID 50262)
-- Name: user pk_user_id; Type: CONSTRAINT; Schema: public; Owner: enallterm
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT pk_user_id PRIMARY KEY (id);


--
-- TOC entry 2866 (class 2606 OID 50266)
-- Name: user uk_user_auth_key; Type: CONSTRAINT; Schema: public; Owner: enallterm
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT uk_user_auth_key UNIQUE (auth_key);


--
-- TOC entry 2868 (class 2606 OID 50264)
-- Name: user uk_user_uid; Type: CONSTRAINT; Schema: public; Owner: enallterm
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT uk_user_uid UNIQUE (uid);


--
-- TOC entry 2869 (class 2606 OID 42018)
-- Name: subareas fk_subareas_id_id_areas; Type: FK CONSTRAINT; Schema: public; Owner: enallterm
--

ALTER TABLE ONLY public.subareas
    ADD CONSTRAINT fk_subareas_id_id_areas FOREIGN KEY (id_areas) REFERENCES public.areas(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


-- Completed on 2019-10-17 11:30:09 CDT

--
-- PostgreSQL database dump complete
--

