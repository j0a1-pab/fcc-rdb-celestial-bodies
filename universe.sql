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
-- Name: constellation; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.constellation (
    constellation_id integer NOT NULL,
    name character varying(32) NOT NULL,
    english_name text,
    visible_from_the_northern_hemisphere boolean NOT NULL,
    visible_from_the_southern_hemisphere boolean NOT NULL
);


ALTER TABLE public.constellation OWNER TO freecodecamp;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.constellation_constellation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.constellation_constellation_id_seq OWNER TO freecodecamp;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.constellation_constellation_id_seq OWNED BY public.constellation.constellation_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(64) NOT NULL,
    type character varying(128),
    age_in_millions_of_years integer,
    distance_from_earth_in_ly bigint,
    constellation_id integer
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
    name character varying(64) NOT NULL,
    type character varying(128),
    age_in_millions_of_years integer,
    distance_from_earth_in_ly numeric(11,10),
    planet_id integer
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
    name character varying(64) NOT NULL,
    type character varying(128),
    age_in_millions_of_years integer,
    distance_from_earth_in_ly bigint,
    star_id integer
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
    name character varying(64) NOT NULL,
    type character varying(128),
    age_in_millions_of_years integer,
    distance_from_earth_in_ly bigint,
    galaxy_id integer,
    constellation_id integer
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
-- Name: constellation constellation_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation ALTER COLUMN constellation_id SET DEFAULT nextval('public.constellation_constellation_id_seq'::regclass);


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
-- Data for Name: constellation; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.constellation VALUES (1, 'andromeda', 'the chained maiden', true, false);
INSERT INTO public.constellation VALUES (2, 'ursa major', 'the great bear', true, false);
INSERT INTO public.constellation VALUES (3, 'canes venatici', 'the hunting dogs', true, false);
INSERT INTO public.constellation VALUES (4, 'fornax', 'the furnace', false, true);
INSERT INTO public.constellation VALUES (5, 'cygnus', 'the swan', true, false);
INSERT INTO public.constellation VALUES (6, 'centaurus', 'the centaur', false, true);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'milky way', 'barred spyral', 13500, 0, NULL);
INSERT INTO public.galaxy VALUES (2, 'andromeda', 'barred spyral', 10000, 2500000, 1);
INSERT INTO public.galaxy VALUES (3, 'YGKOW G1', 'giant elliptical - cD', NULL, 4000000000, 2);
INSERT INTO public.galaxy VALUES (4, 'whirlpool', 'grand design spiral - interacting with NGC 5195', 400, 23160000, 3);
INSERT INTO public.galaxy VALUES (5, 'helmi stream', 'initially a dwarf galaxy, absorbed by the milky way 6-9 billion years ago', NULL, 2000, 4);
INSERT INTO public.galaxy VALUES (6, 'cygnus A', 'radio', NULL, 760000000, 5);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'moon', 'terrestrial', 4550, 0.0000000423, 1);
INSERT INTO public.moon VALUES (2, 'phobos', 'small, irregularly shaped rubble pile', 2700, 0.0000000000, 10);
INSERT INTO public.moon VALUES (3, 'deimos', 'small, irregularly shaped rubble pile', 2700, 0.0000000000, 10);
INSERT INTO public.moon VALUES (4, 'io', 'big, spheric, high density, high geological activity', 2700, 0.0000000000, 11);
INSERT INTO public.moon VALUES (5, 'europa', 'smaller than earth s moon, spheric, made of silicate rock and ice', 1000, 0.0000000000, 11);
INSERT INTO public.moon VALUES (6, 'ganymede', 'largest and most massive moon of the solar system', 1000, 0.0000000000, 11);
INSERT INTO public.moon VALUES (7, 'callisto', 'low density, remote tidally locked orbit', 1000, 0.0000000000, 11);
INSERT INTO public.moon VALUES (8, 'mimas', 'smallest astronomical object known to be round', NULL, NULL, 12);
INSERT INTO public.moon VALUES (9, 'enceladus', 'covered inn ice, thus highly reflective', NULL, NULL, 12);
INSERT INTO public.moon VALUES (10, 'tethys', 'lowest density of all major moons of the solar system', NULL, NULL, 12);
INSERT INTO public.moon VALUES (11, 'dione', 'more massive than all known moons smaller than itself, has two trojan moons: helene and polydeuces', NULL, NULL, 12);
INSERT INTO public.moon VALUES (12, 'rhea', 'smallest body in the solar system with confirmed hydrostatic equilibrium', NULL, NULL, 12);
INSERT INTO public.moon VALUES (13, 'titan', 'largest moon of saturn and second of the solar system', NULL, NULL, 12);
INSERT INTO public.moon VALUES (14, 'iapetus', 'distinctively bicolor', NULL, NULL, 12);
INSERT INTO public.moon VALUES (15, 'miranda', 'extreme varied topography', NULL, NULL, 13);
INSERT INTO public.moon VALUES (16, 'ariel', 'signs of recent geological activity due to tidal heating', NULL, NULL, 13);
INSERT INTO public.moon VALUES (17, 'umbriel', 'darkest surface among uranian moons', NULL, NULL, 13);
INSERT INTO public.moon VALUES (18, 'titania', NULL, NULL, NULL, 13);
INSERT INTO public.moon VALUES (19, 'oberon', NULL, NULL, NULL, 13);
INSERT INTO public.moon VALUES (20, 'triton', NULL, NULL, NULL, 14);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'earth', 'terrestrial', 4543, 0, 1);
INSERT INTO public.planet VALUES (2, 'PA-99-N2', 'theoretical - microlensing event', NULL, 2185247, 2);
INSERT INTO public.planet VALUES (3, 'unnamed twin quasar microlens planet', 'theoretical - microlensing event', NULL, 4000000000, 3);
INSERT INTO public.planet VALUES (4, 'M51-ULS-1b', 'theoretical - eclipse of the x-ray source', NULL, 23000000, 4);
INSERT INTO public.planet VALUES (5, 'HIP 13044 b', 'refuted - miscalculations', NULL, NULL, 5);
INSERT INTO public.planet VALUES (6, 'proxima centauri b', 'terrestrial or ice giant', NULL, 4, 6);
INSERT INTO public.planet VALUES (7, 'proxima centauri d', 'sub-earth', NULL, 4, 6);
INSERT INTO public.planet VALUES (8, 'mercury', 'terrestrial', 4500, 0, 1);
INSERT INTO public.planet VALUES (9, 'venus', 'terrestrial', 4500, 0, 1);
INSERT INTO public.planet VALUES (10, 'mars', 'terrestrial', 4500, 0, 1);
INSERT INTO public.planet VALUES (11, 'jupiter', 'gas giant', 4500, 0, 1);
INSERT INTO public.planet VALUES (12, 'saturn', 'gas giant', 4500, 0, 1);
INSERT INTO public.planet VALUES (13, 'uranus', 'ice giant', 4500, 0, 1);
INSERT INTO public.planet VALUES (14, 'neptune', 'ice giant', 4500, 0, 1);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'sun', 'G-type main sequence - "yellow dwarf"', 4600, 0, 1, NULL);
INSERT INTO public.star VALUES (2, 'MEGA-ML 7', 'theoretical - microlensing event', NULL, 2185247, 2, 1);
INSERT INTO public.star VALUES (3, 'unnamed twin quasar microlens star', 'theoretical - microlensing event', NULL, 4000000000, 3, 2);
INSERT INTO public.star VALUES (4, 'M51-ULS-1', 'high mass x-ray binary', NULL, 23000000, 4, 3);
INSERT INTO public.star VALUES (5, 'HIP 13044', 'red horizontal branch', 9000, 2300, 5, 4);
INSERT INTO public.star VALUES (6, 'proxima centauri', 'red dwarf', 4850, 4, 1, 6);


--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.constellation_constellation_id_seq', 6, true);


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

SELECT pg_catalog.setval('public.planet_planet_id_seq', 43, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: constellation constellation_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_name_key UNIQUE (name);


--
-- Name: constellation constellation_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_pkey PRIMARY KEY (constellation_id);


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
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


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
-- Name: galaxy galaxy_constellation_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_constellation_id_fkey FOREIGN KEY (constellation_id) REFERENCES public.constellation(constellation_id);


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
-- Name: star star_constellation_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_constellation_id_fkey FOREIGN KEY (constellation_id) REFERENCES public.constellation(constellation_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--


