--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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

SET default_table_access_method = heap;

--
-- Name: add_planet_info; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.add_planet_info (
    add_planet_info_id integer NOT NULL,
    name character varying(40) NOT NULL,
    is_interesting boolean NOT NULL
);


ALTER TABLE public.add_planet_info OWNER TO freecodecamp;

--
-- Name: add_planet_info_add_planet_info_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.add_planet_info_add_planet_info_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.add_planet_info_add_planet_info_id_seq OWNER TO freecodecamp;

--
-- Name: add_planet_info_add_planet_info_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.add_planet_info_add_planet_info_id_seq OWNED BY public.add_planet_info.add_planet_info_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(40) NOT NULL,
    age integer,
    has_life boolean,
    description text
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    planet_id integer,
    name character varying(40) NOT NULL,
    description text,
    size numeric(10,3) NOT NULL
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(40) NOT NULL,
    gravity numeric(4,1),
    star_id integer,
    description text
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(40) NOT NULL,
    has_water boolean,
    position_galaxy integer,
    galaxy_id integer,
    description text
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: add_planet_info add_planet_info_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.add_planet_info ALTER COLUMN add_planet_info_id SET DEFAULT nextval('public.add_planet_info_add_planet_info_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: add_planet_info; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.add_planet_info VALUES (1, 'the big one', true);
INSERT INTO public.add_planet_info VALUES (2, 'the medium one', true);
INSERT INTO public.add_planet_info VALUES (3, 'the tiny', true);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Via lactea', 123123, true, 'The galaxy we are in I think');
INSERT INTO public.galaxy VALUES (3, 'Not much of a space guy', 13000, false, 'Cold and spooky');
INSERT INTO public.galaxy VALUES (4, 'The imaginary galaxy', 323212, false, 'The imaginary galaxy where dreams come true');
INSERT INTO public.galaxy VALUES (5, 'Far far away', 9999999, true, 'A distant galaxy with unknown mysteries');
INSERT INTO public.galaxy VALUES (6, 'The boring one', 4352, false, 'The Unknown Galaxy');
INSERT INTO public.galaxy VALUES (7, 'The last Galaxy', 1, true, 'Finally');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (20, 1, 'Luna', 'Earth''s only natural satellite', 1737.100);
INSERT INTO public.moon VALUES (21, 3, 'Phobos', 'Mars''s larger moon', 11.266);
INSERT INTO public.moon VALUES (22, 3, 'Deimos', 'Mars''s smaller moon', 6.200);
INSERT INTO public.moon VALUES (23, 5, 'Io', 'Jupiter''s volcanic moon', 1821.600);
INSERT INTO public.moon VALUES (24, 5, 'Europa', 'Jupiter''s icy moon', 1560.800);
INSERT INTO public.moon VALUES (25, 5, 'Ganymede', 'Jupiter''s largest moon', 2634.100);
INSERT INTO public.moon VALUES (26, 5, 'Callisto', 'Jupiter''s heavily cratered moon', 2410.300);
INSERT INTO public.moon VALUES (27, 6, 'Mimas', 'Saturn''s small, icy moon', 198.200);
INSERT INTO public.moon VALUES (28, 6, 'Enceladus', 'Saturn''s active, icy moon', 252.100);
INSERT INTO public.moon VALUES (29, 6, 'Tethys', 'Saturn''s mid-sized, icy moon', 531.100);
INSERT INTO public.moon VALUES (30, 6, 'Dione', 'Saturn''s heavily cratered moon', 561.400);
INSERT INTO public.moon VALUES (31, 6, 'Rhea', 'Saturn''s second largest moon', 763.800);
INSERT INTO public.moon VALUES (32, 6, 'Titan', 'Saturn''s largest moon, has an atmosphere', 2575.000);
INSERT INTO public.moon VALUES (33, 6, 'Iapetus', 'Saturn''s third largest moon', 735.600);
INSERT INTO public.moon VALUES (34, 8, 'Titania', 'Uranus''s largest moon', 788.900);
INSERT INTO public.moon VALUES (35, 8, 'Oberon', 'Uranus''s second largest moon', 761.400);
INSERT INTO public.moon VALUES (36, 9, 'Triton', 'Neptune''s largest moon', 1353.400);
INSERT INTO public.moon VALUES (37, 9, 'Proteus', 'Neptune''s second largest moon', 210.000);
INSERT INTO public.moon VALUES (38, 9, 'Nereid', 'Neptune''s third largest moon', 170.000);
INSERT INTO public.moon VALUES (39, NULL, 'Unknown Moon', 'Unknown moon', 1200.000);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 9.8, 1, 'Our home');
INSERT INTO public.planet VALUES (2, 'Mars', 3.7, 2, 'The red one');
INSERT INTO public.planet VALUES (3, 'Jupiter', 24.8, 3, 'Big Core');
INSERT INTO public.planet VALUES (5, 'Uranus', 0.0, 3, 'The Ice Giant');
INSERT INTO public.planet VALUES (6, 'Saturn', 5.0, 2, 'The Ringed Planet');
INSERT INTO public.planet VALUES (8, 'Mercury', 3.7, 7, 'Freedy Mercury?');
INSERT INTO public.planet VALUES (9, 'Neptune', 11.2, 7, 'The Blue Giant');
INSERT INTO public.planet VALUES (10, 'Venus', 8.9, 8, 'The Morning Star');
INSERT INTO public.planet VALUES (14, 'Pluto', 0.6, 5, 'Dwarf Planet');
INSERT INTO public.planet VALUES (15, 'Pluto II', 0.3, 5, 'Smaller Dwarf Planet');
INSERT INTO public.planet VALUES (16, 'Pluto III', 0.1, 5, 'The Tiniest Dwarf Planet');
INSERT INTO public.planet VALUES (17, 'Pluto IV', 0.2, 5, 'The Almost Not a Planet');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', true, 1, 1, 'Our Star');
INSERT INTO public.star VALUES (2, 'Aldebaran', false, 2, 1, 'The Eye of Taurus');
INSERT INTO public.star VALUES (3, 'Polaris', true, 3, 2, 'The North Star');
INSERT INTO public.star VALUES (4, 'Betelgeuse', false, 4, 3, 'The Giant Red Star');
INSERT INTO public.star VALUES (5, 'Antares', false, 5, 4, 'The Rival of Mars');
INSERT INTO public.star VALUES (6, 'Sirius', true, 6, 5, 'The Dog Star');
INSERT INTO public.star VALUES (7, 'Vega', true, 7, 6, 'The Lyra');
INSERT INTO public.star VALUES (8, 'Arcturus', false, 8, 7, 'The Bear Watcher');
INSERT INTO public.star VALUES (9, 'Rigel', false, 9, 8, 'The Blue SuperGiant');
INSERT INTO public.star VALUES (10, 'Canopus', false, 10, 9, 'The Great Star');


--
-- Name: add_planet_info_add_planet_info_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.add_planet_info_add_planet_info_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 7, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 39, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 17, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 10, true);


--
-- Name: add_planet_info add_planet_info_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.add_planet_info
    ADD CONSTRAINT add_planet_info_name_key UNIQUE (name);


--
-- Name: add_planet_info add_planet_info_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.add_planet_info
    ADD CONSTRAINT add_planet_info_pkey PRIMARY KEY (add_planet_info_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_key UNIQUE (name, planet_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- PostgreSQL database dump complete
--



