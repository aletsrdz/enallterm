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

SET default_tablespace = '';

SET default_with_oids = false;

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
-- Name: user id; Type: DEFAULT; Schema: public; Owner: enallterm
--

ALTER TABLE ONLY public."user" ALTER COLUMN id SET DEFAULT nextval('public.user_id_seq'::regclass);


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
18	$2y$13$F6kdP1h/yZ3rMUk/a.MqcOC./GqMbZw8MMhA5x9rM8oRCwnIuWU/q	alumno6	alumno6@gmail.com	$2y$13$Rk73QpDqWE5Yqfr2kjeAXe9U5P.uyA5nF8umMYR67ozBJBOWn2YA6	\N	\N	1	2019-10-17 10:54:22.141131	2019-10-17 10:55:24.509722	nUPE_fPTf2sbzDlO6UZGn2g6z1Eg7vzhWwiM5_8e8QIVUA_v66C3a9NkiRA_
10	$2y$13$m.jEnvuXrc/btgaBzVba6O9bC8VwBbcs/YZluDobeU0fdQ33UZcdq	lingüísta1	lingüísta1@gmail.com	$2y$13$nEkztY4Xu1RF/wzE1DNWne1k7EC5leTozMIFXGwN0F6qviQSh.93G	\N	\N	1	2019-10-17 10:41:12.937028	2019-10-17 10:41:12.937028	ecDURZtiel3r1P5yv3IoyHP0sTWbTd4veFmuW8aHcemniQpKMJGcezKWKS75
17	$2y$13$b/1OxnCOKiRSGAGW0yT41.KTGzgq1pLxqfWNXVaJ9PldWT3DCJune	alumno5	alumno5@gmail.com	$2y$13$CBs1DTPxutIWNXlyG3t9RuJJ4P.76H42PSHtqQYxWJpMUJAZ/tZ12	\N	\N	1	2019-10-17 10:53:24.177036	2019-10-17 10:55:49.699101	NWhrLShIap_rFDNyC0XZsUwmcyL70j50k2WvoPOVfIjecfd1b0wI8y-HvEz0
12	$2y$13$.AqNXPRlj1GbKfvH3fjWMuFFaIQ2TTPkPKijBGaKgqgQlyz62gFMe	lingüísta2	lingüísta2@gmail.com	$2y$13$SmrlE9IgpUnV7iAmmDwTRelC8QKgtL7OSaoLsSjFm2G0uKureye0m	\N	\N	1	2019-10-17 10:47:50.62149	2019-10-17 10:47:50.62149	uM8_NXQ8b0HnCJmKo7QALU-wCMTjawvFOJM9IDEnl1nl-P_8BIxRwnxH_k99
16	$2y$13$nbn/HdDMfNi3diRUWysfGuTCRuGm39y0N19kL7PWcWXgT7fQK.fU6	alumno4	alumno4@gmail.com	$2y$13$aID.PIz5cp9VLbeDrA53k.R0AqpdV3hCqgV7wD9EWXQk/o7fn7gVm	\N	\N	1	2019-10-17 10:52:43.977362	2019-10-17 10:56:10.011661	C4wh0q5omBYFb9RmI3OoYR3NRbfqswfiJOsYvC1PcpYbgUi6u838L-UbRo3L
15	$2y$13$iuAWgj6mi4rkCbKEd93S4.DF.K01OGgrZjZ/6YO//ZTk0fg9imouO	alumno3	alumno3@gmail.com	$2y$13$56CS4u1U1aWaKjHSJDQqbuhWf4AcG1x5qRdNJy4lT.YqgAalL6lTe	\N	\N	1	2019-10-17 10:51:45.980709	2019-10-17 10:56:32.295502	tIHu0lyRetksN05dBJ0MolTJy3pDgWbYGOSoUiYh-5fXlt6Cwe2H6GNaLuQz
13	$2y$13$2eRRThvMP02jCVh/ireOROvXdWHwSEDReMP1Aqea0UYR5GdnrGrUe	alumno1	alumno1@gmail.com	$2y$13$cAPEyYmIytuEkLyDJE8FFu.1ARrdM1ALQ1QS6TFYl2I1PklnNsiFW	\N	\N	1	2019-10-17 10:49:39.547314	2019-10-17 10:49:39.547314	LRKfLbj_Cu9UGP4K9EgvAd2OAEsMrLpBEOlC6h-oqq5NMb-QJ7shLz_b6bAA
14	$2y$13$J9ucWPnkOlYO6v5eAVu4je0GbxMlLC4mi5Fz1zuBtwAiFSJL.Otse	alumno2	alumno2@gmail.com	$2y$13$f2eXrZyx/23ndJXuqg/ZNuVJctAhImBstHWzaSUc5akW2YQ0urueK	\N	\N	1	2019-10-17 10:50:38.889751	2019-10-17 10:50:38.889751	obJ48q2PX0GD_B8p5azjbuQ_qaGwu0JmHJDhCUcRrPPbMSirHLxCAKg_RFLu
4	$2y$13$FQlDyhSwRYXGt.4jE12jLu8orxb5cccQvT00ZTdYZ.A.Ii2rN.2Yu	alexrdz	alexrdzallende@gmail.com	$2y$13$6nRaWfJfSr.a0n.NSy4ovOPWlfc8IYJwiZI5BClPjS61nykcjYzqK	\N	\N	1	2019-10-17 10:20:49.479493	2019-10-17 10:21:03.450739	D3qkWLo8hQ-oOwXvsJe5BfM-IIGWg5ua-npY4mPXytSvEORJoGU4WHlq82m5
19	$2y$13$2yFUMt3x9S119RzgGXB7ueCzI6uBU24FSq4naXVo9yfBvR1K/2Wc.	alumno7	alumno7@gmail.com	$2y$13$zKv5JwuV7QVrGfuP5fHR8uSJZQG6iQV8VbWyiNS7xPXTKpIHDT1tG	\N	\N	1	2019-10-17 10:57:11.191783	2019-10-17 11:02:46.008294	fUjJlHWwa7SIu84YUPFNVF4-mXRrIg5HASniXdVUBLg-s6zVPp4-cSCEbBSg
\.


--
-- Name: user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: enallterm
--

SELECT pg_catalog.setval('public.user_id_seq', 19, true);


--
-- Name: user pk_user_id; Type: CONSTRAINT; Schema: public; Owner: enallterm
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT pk_user_id PRIMARY KEY (id);


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
-- PostgreSQL database dump complete
--

