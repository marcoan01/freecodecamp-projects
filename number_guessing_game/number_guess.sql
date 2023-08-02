--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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
-- Name: player; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.player (
    player_id integer NOT NULL,
    username character varying(22) NOT NULL,
    games_played integer,
    best_game integer
);


ALTER TABLE public.player OWNER TO freecodecamp;

--
-- Name: player_player_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.player_player_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.player_player_id_seq OWNER TO freecodecamp;

--
-- Name: player_player_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.player_player_id_seq OWNED BY public.player.player_id;


--
-- Name: player player_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.player ALTER COLUMN player_id SET DEFAULT nextval('public.player_player_id_seq'::regclass);


--
-- Data for Name: player; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.player VALUES (1, 'marco', 4, 17);
INSERT INTO public.player VALUES (2, 'MARCO', 0, 0);
INSERT INTO public.player VALUES (3, 'user_1690947641690', 0, 0);
INSERT INTO public.player VALUES (4, 'user_1690947641689', 0, 0);
INSERT INTO public.player VALUES (5, 'user_1690947702956', 0, 0);
INSERT INTO public.player VALUES (6, 'user_1690947702955', 0, 0);
INSERT INTO public.player VALUES (7, 'user_1690947727669', 0, 0);
INSERT INTO public.player VALUES (8, 'user_1690947727668', 0, 0);
INSERT INTO public.player VALUES (9, 'user_1690947742329', 0, 0);
INSERT INTO public.player VALUES (10, 'user_1690947742328', 0, 0);
INSERT INTO public.player VALUES (11, 'user_1690947798978', 0, 0);
INSERT INTO public.player VALUES (12, 'user_1690947798977', 0, 0);
INSERT INTO public.player VALUES (13, 'user_1690947814271', 0, 0);
INSERT INTO public.player VALUES (14, 'user_1690947814270', 0, 0);
INSERT INTO public.player VALUES (15, 'user_1690947876830', 0, 0);
INSERT INTO public.player VALUES (16, 'user_1690947876829', 0, 0);
INSERT INTO public.player VALUES (17, 'user_1690947958199', 0, 0);
INSERT INTO public.player VALUES (18, 'user_1690947958198', 0, 0);
INSERT INTO public.player VALUES (19, 'user_1690947986246', 0, 0);
INSERT INTO public.player VALUES (20, 'user_1690947986245', 0, 0);
INSERT INTO public.player VALUES (21, 'user_1690948015164', 0, 0);
INSERT INTO public.player VALUES (22, 'user_1690948015163', 0, 0);


--
-- Name: player_player_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.player_player_id_seq', 22, true);


--
-- Name: player player_username_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.player
    ADD CONSTRAINT player_username_key UNIQUE (username);


--
-- PostgreSQL database dump complete
--

