--
-- PostgreSQL database dump
--

 CREATE ROLE juego;
 ALTER ROLE juego WITH SUPERUSER NOINHERIT NOCREATEROLE CREATEDB LOGIN PASSWORD '1234';

-- Dumped from database version 12.9 (Ubuntu 12.9-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-0ubuntu0.20.04.1)

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
-- Name: adminpack; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS adminpack WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION adminpack; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION adminpack IS 'administrative functions for PostgreSQL';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: tjugador; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tjugador (
    njugador integer NOT NULL,
    djugador character(20) NOT NULL,
    nivel integer NOT NULL,
    puntaje integer NOT NULL
);


ALTER TABLE public.tjugador OWNER TO postgres;

--
-- Name: tjugador_njugador_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tjugador_njugador_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tjugador_njugador_seq OWNER TO postgres;

--
-- Name: tjugador_njugador_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tjugador_njugador_seq OWNED BY public.tjugador.njugador;


--
-- Name: tpregunta; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tpregunta (
    npregunta integer NOT NULL,
    dpregunta character(200) NOT NULL,
    nivel integer NOT NULL,
    categoria character(50) NOT NULL,
    ncategoria integer
);


ALTER TABLE public.tpregunta OWNER TO postgres;

--
-- Name: tpregunta_npregunta_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tpregunta_npregunta_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tpregunta_npregunta_seq OWNER TO postgres;

--
-- Name: tpregunta_npregunta_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tpregunta_npregunta_seq OWNED BY public.tpregunta.npregunta;


--
-- Name: trespuestas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.trespuestas (
    nrespuesta integer NOT NULL,
    npregunta integer NOT NULL,
    drespuesta character(50) NOT NULL,
    correcta character(1) NOT NULL
);


ALTER TABLE public.trespuestas OWNER TO postgres;

--
-- Name: trespuestas_nrespuesta_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.trespuestas_nrespuesta_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.trespuestas_nrespuesta_seq OWNER TO postgres;

--
-- Name: trespuestas_nrespuesta_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.trespuestas_nrespuesta_seq OWNED BY public.trespuestas.nrespuesta;


--
-- Name: tjugador njugador; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tjugador ALTER COLUMN njugador SET DEFAULT nextval('public.tjugador_njugador_seq'::regclass);


--
-- Name: tpregunta npregunta; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tpregunta ALTER COLUMN npregunta SET DEFAULT nextval('public.tpregunta_npregunta_seq'::regclass);


--
-- Name: trespuestas nrespuesta; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.trespuestas ALTER COLUMN nrespuesta SET DEFAULT nextval('public.trespuestas_nrespuesta_seq'::regclass);


--
-- Data for Name: tjugador; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tjugador (njugador, djugador, nivel, puntaje) FROM stdin;
\.


--
-- Data for Name: tpregunta; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tpregunta (npregunta, dpregunta, nivel, categoria, ncategoria) FROM stdin;
1	Cual es la Capital de Colombia?                                                                                                                                                                         	1	GEOGRAFIA                                         	1
2	Cual es el rio mas caudaloso del mundo?                                                                                                                                                                 	2	GEOGRAFIA                                         	1
3	Que pais esta entre Peru y Colombia?                                                                                                                                                                    	3	GEOGRAFIA                                         	1
4	En que hemisferio se encuentra Jamaica?                                                                                                                                                                 	4	GEOGRAFIA                                         	1
5	En que pais se habla magyar?                                                                                                                                                                            	5	GEOGRAFIA                                         	1
6	Quien descubrio America?                                                                                                                                                                                	1	HISTORIA                                          	2
7	Quien Liberto America?                                                                                                                                                                                  	2	HISTORIA                                          	2
8	En que año llego el hombre a la Luna?                                                                                                                                                                   	3	HISTORIA                                          	2
9	Como se conoce a la policia italiana                                                                                                                                                                    	4	HISTORIA                                          	2
11	Cual es el pajaro simbolo de la paz?                                                                                                                                                                    	1	CIENCIA Y NATURALEZA                              	3
13	A que le tiene miedo una persona que sufre de vertigo?                                                                                                                                                  	3	CIENCIA Y NATURALEZA                              	3
14	Como se llama la ciencia que estudia la sangre?                                                                                                                                                         	4	CIENCIA Y NATURALEZA                              	3
15	Que fabrico Alessandro Volta, por primera vez, en 1800?                                                                                                                                                 	5	CIENCIA Y NATURALEZA                              	3
16	Que pieza de ajedrez puede hacer un movimiento en forma de L?                                                                                                                                           	1	DEPORTES Y PASATIEMPOS                            	4
17	Cuantos jugadores tiene un equipo de voleibol?                                                                                                                                                          	2	DEPORTES Y PASATIEMPOS                            	4
18	En que pais se encuentra el circuito de Le Mans?                                                                                                                                                        	3	DEPORTES Y PASATIEMPOS                            	4
19	Donde se invento el Ping-Pong?                                                                                                                                                                          	4	DEPORTES Y PASATIEMPOS                            	4
20	Como se llamaba Muhammad Ali antes de adoptar este nombre?                                                                                                                                              	5	DEPORTES Y PASATIEMPOS                            	4
21	Cuales son los colores primarios?                                                                                                                                                                       	1	CULTURA GENERAL                                   	5
22	Que serie de Netflix habla sobre la vida del narcotraficante Pablo Escobar Gaviria?                                                                                                                     	2	CULTURA GENERAL                                   	5
23	Cuales son los colores de los cinco anillos olimpicos?                                                                                                                                                  	3	CULTURA GENERAL                                   	5
24	Cuál fue la primera película de Disney?                                                                                                                                                                 	4	CULTURA GENERAL                                   	5
25	Cuál es el país más pequeño del mundo?                                                                                                                                                                  	5	CULTURA GENERAL                                   	5
10	Quien era el emperador de Roma cuando murio Jesus                                                                                                                                                       	5	HISTORIA                                          	2
12	Como se llaman las celulas nerviosas?                                                                                                                                                                   	2	CIENCIA Y NATURALEZA                              	3
\.


--
-- Data for Name: trespuestas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.trespuestas (nrespuesta, npregunta, drespuesta, correcta) FROM stdin;
1	1	Bogota                                            	1
2	1	Caracas                                           	0
3	1	La Paz                                            	0
4	1	Lima                                              	0
5	2	El Amazonas                                       	1
6	2	El Sena                                           	0
7	2	Ganges                                            	0
8	2	Tamesis                                           	0
9	3	Ecuador                                           	1
10	3	Venezuela                                         	0
11	3	Bolivia                                           	0
12	3	Paraguay                                          	0
13	4	Norte                                             	1
14	4	Sur                                               	0
15	4	Este                                              	0
16	4	Oeste                                             	0
17	5	Hungria                                           	1
18	5	Ucrania                                           	0
19	5	Polonia                                           	0
20	5	Austria                                           	0
21	6	Cristobal Colon                                   	1
22	6	Los Vikingos                                      	0
24	6	Rodrigo de Triana                                 	0
25	7	Simon Bolivar                                     	1
26	7	Antonio Nariño                                    	0
27	7	Francisco de Paula Santader                       	0
28	7	Antonio Jose de Sucre                             	0
29	8	1969                                              	1
30	8	1967                                              	0
31	8	1970                                              	0
32	8	1959                                              	0
33	9	Carabinieri                                       	1
34	9	Police                                            	0
35	9	Policia                                           	0
36	9	Pacos                                             	0
37	10	Tiberio                                           	1
38	10	Julio Cesar                                       	0
39	10	Marco Aurelio                                     	0
40	10	Neron                                             	0
41	11	La Paloma                                         	1
42	11	El cuervo                                         	0
43	11	El pato                                           	0
44	11	La gallina                                        	0
45	12	Neuronas                                          	1
46	12	Globulos                                          	0
47	12	Epiteliares                                       	0
48	12	Linfositos                                        	0
49	13	A las alturas                                     	1
50	13	A los exteriores                                  	0
51	13	A los sitios cerrados                             	0
52	13	A los perros                                      	0
53	14	Hematologia                                       	1
54	14	Biologia                                          	0
55	14	Bioanalisis                                       	0
56	14	Bioanalista                                       	0
57	15	La Pila                                           	1
58	15	La bombilla                                       	0
59	15	El telegrafo                                      	0
60	15	La electricidad                                   	0
61	16	El Caballo                                        	1
62	16	La Torre                                          	0
63	16	El Peon                                           	0
64	16	La Reina                                          	0
65	17	6                                                 	1
66	17	5                                                 	0
67	17	10                                                	0
68	17	4                                                 	0
69	18	Francia                                           	1
70	18	Inglaterra                                        	0
71	18	Italia                                            	0
72	18	Alemania                                          	0
73	19	Inglaterra                                        	1
74	19	China                                             	0
75	19	Japon                                             	0
76	19	Corea                                             	0
77	20	Cassius Clay                                      	1
78	20	Sugar Ray Leonard                                 	0
79	20	Roberto Duran                                     	0
80	20	Rocky Marciano                                    	0
81	21	Amarillo, Azul y Rojo                             	1
82	21	Rojo, Verde, Azul                                 	0
83	21	Blanco y Negro                                    	0
84	21	Los del Arcoiris                                  	0
85	22	Narcos                                            	1
86	22	Pablo                                             	0
87	22	EScobar                                           	0
88	22	El Patron del mal                                 	0
89	23	Amarillo, azul, negro, rojo y verde               	1
90	23	Amarillo, azul y rojo                             	0
91	23	Naranja, Azul, verde, Amarillo                    	0
92	23	Amarillo, azul, negro, blanco y verde             	0
93	24	Blancanieves                                      	1
94	24	Fantasia                                          	0
95	24	Pinocho                                           	0
96	24	Dumbo                                             	0
97	25	El Vaticano                                       	1
98	25	Monaco                                            	0
99	25	Maldivas                                          	0
100	25	Malta                                             	0
23	6	Americo Vespucio                                  	0
\.


--
-- Name: tjugador_njugador_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tjugador_njugador_seq', 1, false);


--
-- Name: tpregunta_npregunta_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tpregunta_npregunta_seq', 1, false);


--
-- Name: trespuestas_nrespuesta_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.trespuestas_nrespuesta_seq', 1, false);


--
-- PostgreSQL database dump complete
--

