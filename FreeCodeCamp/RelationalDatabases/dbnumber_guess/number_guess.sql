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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    user_id integer NOT NULL,
    number_of_guesses integer NOT NULL
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    name character varying(22) NOT NULL
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (25, 346);
INSERT INTO public.games VALUES (25, 599);
INSERT INTO public.games VALUES (26, 817);
INSERT INTO public.games VALUES (26, 27);
INSERT INTO public.games VALUES (25, 801);
INSERT INTO public.games VALUES (25, 649);
INSERT INTO public.games VALUES (25, 245);
INSERT INTO public.games VALUES (27, 45);
INSERT INTO public.games VALUES (27, 612);
INSERT INTO public.games VALUES (28, 704);
INSERT INTO public.games VALUES (28, 198);
INSERT INTO public.games VALUES (27, 450);
INSERT INTO public.games VALUES (27, 387);
INSERT INTO public.games VALUES (27, 903);
INSERT INTO public.games VALUES (29, 752);
INSERT INTO public.games VALUES (29, 947);
INSERT INTO public.games VALUES (30, 443);
INSERT INTO public.games VALUES (30, 860);
INSERT INTO public.games VALUES (29, 687);
INSERT INTO public.games VALUES (29, 825);
INSERT INTO public.games VALUES (29, 637);
INSERT INTO public.games VALUES (31, 348);
INSERT INTO public.games VALUES (31, 961);
INSERT INTO public.games VALUES (32, 459);
INSERT INTO public.games VALUES (32, 717);
INSERT INTO public.games VALUES (31, 554);
INSERT INTO public.games VALUES (31, 852);
INSERT INTO public.games VALUES (31, 786);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (25, 'user_1718648942814');
INSERT INTO public.users VALUES (26, 'user_1718648942813');
INSERT INTO public.users VALUES (27, 'user_1718649110853');
INSERT INTO public.users VALUES (28, 'user_1718649110852');
INSERT INTO public.users VALUES (29, 'user_1718649463928');
INSERT INTO public.users VALUES (30, 'user_1718649463927');
INSERT INTO public.users VALUES (31, 'user_1718649534062');
INSERT INTO public.users VALUES (32, 'user_1718649534061');


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 32, true);


--
-- Name: users users_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_name_key UNIQUE (name);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: games games_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- PostgreSQL database dump complete
--

