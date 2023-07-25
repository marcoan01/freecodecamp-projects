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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(20) NOT NULL,
    galaxy_type character varying(30),
    distance_from_earth numeric(10,2),
    diameter_kpc numeric(10,2)
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
    name character varying(20) NOT NULL,
    planet_id integer,
    surface_temperature integer,
    orbital_period_in_days integer
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
    name character varying(20) NOT NULL,
    star_id integer,
    has_life boolean,
    age_in_million_years integer
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
    name character varying(20) NOT NULL,
    galaxy_id integer,
    description text,
    spectral_type character varying(5)
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
-- Name: systems; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.systems (
    systems_id integer NOT NULL,
    galaxy_id integer,
    description text,
    name character varying(30) NOT NULL,
    is_habitable boolean
);


ALTER TABLE public.systems OWNER TO freecodecamp;

--
-- Name: systems_system_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.systems_system_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.systems_system_id_seq OWNER TO freecodecamp;

--
-- Name: systems_system_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.systems_system_id_seq OWNED BY public.systems.systems_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

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
-- Name: systems systems_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.systems ALTER COLUMN systems_id SET DEFAULT nextval('public.systems_system_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Andromeda', 'Spiral', 776947.40, 220.00);
INSERT INTO public.galaxy VALUES (2, 'Triangulum', 'Spiral', 919180.80, 70.00);
INSERT INTO public.galaxy VALUES (3, 'Sombrero', 'Spiral', 8888929.60, 50.00);
INSERT INTO public.galaxy VALUES (4, 'Centaurus A', 'Elliptical', 3680750.40, 130.00);
INSERT INTO public.galaxy VALUES (5, 'Whirlpool', 'Spiral', 9512834.40, 60.00);
INSERT INTO public.galaxy VALUES (6, 'Cartwheel', 'Ring', 15340800.00, 150.00);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 1, 130, 1);
INSERT INTO public.moon VALUES (2, 'Io', 2, 130, 1);
INSERT INTO public.moon VALUES (3, 'Europa', 3, 102, 3);
INSERT INTO public.moon VALUES (4, 'Ganymede', 4, 110, 7);
INSERT INTO public.moon VALUES (5, 'Callisto', 5, 134, 16);
INSERT INTO public.moon VALUES (6, 'Titan', 6, 75, 1);
INSERT INTO public.moon VALUES (7, 'Mimas', 7, 64, 1);
INSERT INTO public.moon VALUES (8, 'Iapetus', 8, 79, 79);
INSERT INTO public.moon VALUES (9, 'Phobos', 9, 233, 1);
INSERT INTO public.moon VALUES (10, 'Deimos', 10, 60, 1);
INSERT INTO public.moon VALUES (11, 'Miranda', 11, 60, 1);
INSERT INTO public.moon VALUES (12, 'Titania', 12, 78, 8);
INSERT INTO public.moon VALUES (13, 'Triton', 1, 38, 5);
INSERT INTO public.moon VALUES (14, 'Charon', 2, 33, 6);
INSERT INTO public.moon VALUES (15, 'Phobos 2', 3, 260, 8);
INSERT INTO public.moon VALUES (16, 'mercury moon', 4, 440, 58);
INSERT INTO public.moon VALUES (17, 'venus  moon', 5, 470, 117);
INSERT INTO public.moon VALUES (18, 'Rhea', 6, 99, 4);
INSERT INTO public.moon VALUES (19, 'Ariel', 7, 60, 2);
INSERT INTO public.moon VALUES (20, 'Proteus', 8, 51, 1);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 1, true, 4500);
INSERT INTO public.planet VALUES (2, 'Mars', 1, false, 4600);
INSERT INTO public.planet VALUES (3, 'Venus', 2, false, 4500);
INSERT INTO public.planet VALUES (4, 'Kepler-452b', 2, false, 6000);
INSERT INTO public.planet VALUES (5, 'Proxima CentauriB', 3, false, 6000);
INSERT INTO public.planet VALUES (6, 'TRAPPIST', 3, false, 7600);
INSERT INTO public.planet VALUES (7, 'Gliese 581g', 4, false, 7000);
INSERT INTO public.planet VALUES (8, 'HD 85512b', 4, false, 6000);
INSERT INTO public.planet VALUES (9, 'Tau ceti e', 5, false, 6000);
INSERT INTO public.planet VALUES (10, 'LHS 1140 b', 5, false, 5000);
INSERT INTO public.planet VALUES (11, 'GJ 667Cc', 6, false, 6000);
INSERT INTO public.planet VALUES (12, 'HD 40307 g', 6, false, 8000);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Alpheratz', 1, 'prominent blue subgiant star located in the constallation Andromeda. Also part of the constellation pegasus.', 'B8IV');
INSERT INTO public.star VALUES (2, 'Mothallah', 2, 'yellow subgiant star in the trinagulum constellation. It is one of the brighest stars in the region and can be observed with the naked eye from the earth', 'F6IV');
INSERT INTO public.star VALUES (3, 'Minkar', 3, 'orange giant star situated in the constellation Virgo, near the sombrero galaxy. Its color contrats with the bright galaxy in the night sky', 'K3III');
INSERT INTO public.star VALUES (4, 'Alpha centauri A', 4, 'is the larger and brighter of the two stars in the alpha centaury galaxy. It has a sequence similar to our sun', 'G2V');
INSERT INTO public.star VALUES (5, 'Whirlpool majoris', 5, 'is a hot and massive blue-main sequence star situated in the whirlpool galaxy', 'O9V');
INSERT INTO public.star VALUES (6, 'Cartwheelia', 6, 'is a red giant star located in the cartwheel galaxy. Its location is subject to study by astronomers', 'M6III');


--
-- Data for Name: systems; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.systems VALUES (1, 1, 'it consists of three stars, forming a trinary star system. Proxima centauri is the cloests star to solar system', 'Alpha centauri system', false);
INSERT INTO public.systems VALUES (2, 2, 'nearby single star system with a relatively young sequence star. it has a debris disk, and several exoplanet candidates', 'Epsilon Eridani', true);
INSERT INTO public.systems VALUES (3, 3, 'gnfhsdghsdkghds', 'Vega system', true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


--
-- Name: systems_system_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.systems_system_id_seq', 3, true);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: systems systems_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.systems
    ADD CONSTRAINT systems_pkey PRIMARY KEY (systems_id);


--
-- Name: galaxy unique_galaxy_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT unique_galaxy_id UNIQUE (galaxy_id);


--
-- Name: moon unique_moon_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT unique_moon_id UNIQUE (moon_id);


--
-- Name: planet unique_planet_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT unique_planet_id UNIQUE (planet_id);


--
-- Name: star unique_star_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT unique_star_id UNIQUE (star_id);


--
-- Name: systems unique_systems_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.systems
    ADD CONSTRAINT unique_systems_id UNIQUE (systems_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: systems systems_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.systems
    ADD CONSTRAINT systems_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

