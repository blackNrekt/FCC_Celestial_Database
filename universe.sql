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
    name text NOT NULL,
    abbreviation text,
    meaning text,
    origin text,
    area numeric,
    is_visible boolean,
    description text
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
    name character varying(255) NOT NULL,
    description text,
    has_life boolean,
    is_spiral boolean,
    age_in_a_million_of_years integer,
    planet_types character varying(255),
    distance_from_earth numeric
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
    name character varying(255) NOT NULL,
    planet_id integer NOT NULL,
    diameter numeric NOT NULL,
    gravity numeric NOT NULL,
    distance_from_parent_planet numeric
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
    name character varying(255) NOT NULL,
    star_id integer,
    diameter numeric NOT NULL,
    gravity numeric NOT NULL,
    atmosphere character varying(255),
    number_of_moons integer
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
    name character varying(255) NOT NULL,
    galaxy_id integer NOT NULL,
    mass numeric NOT NULL,
    temperature numeric NOT NULL,
    luminosity numeric NOT NULL,
    spectral_type character varying(255)
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

INSERT INTO public.constellation VALUES (1, 'Orion', 'Ori', 'The Hunter', 'Ancient Mesopotamia', 594, true, 'One of the most recognizable constellation');
INSERT INTO public.constellation VALUES (2, 'Ursa Major', 'UMa', 'The Great Bear', 'Ancient Greece', 1279, true, 'Contains the Big Dipper asterism');
INSERT INTO public.constellation VALUES (3, 'Leo', 'Leo', 'The Lion', 'Ancient Mesopotamia', 947, true, 'One of the zodiac constellations');
INSERT INTO public.constellation VALUES (4, 'Cygnus', 'Cyg', 'The Swan', 'Ancient Greece', 804, true, 'Contains the Northern Cross asterism');
INSERT INTO public.constellation VALUES (5, 'Crux', 'Cru', 'The Southern Cross', 'European explorers', 68, true, 'Prominent constellation in the Southern Hemisphere');



--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Our galaxy', true, true, 14, 'Gas giants, rocky planets', 0);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Our closest galaxy', false, false, 14, 'Gas giants, rocky planets', 25000);
INSERT INTO public.galaxy VALUES (3, 'Triangulum Galaxy', 'A spiral galaxy in the Triangulum Galaxy', false, true, 11, 'Gas giants, rocky planets', 27000);
INSERT INTO public.galaxy VALUES (4, 'Virgo Cluster', 'Closest cluster of galaxies to the Milky Way', false, true, 14, 'Gas Giants, Rocky Planets', 53000000);
INSERT INTO public.galaxy VALUES (5, 'Coma Cluster', 'Large Cluster of Galaxies', false, true, 13, 'Gas giants, Rocky planets', 300000000);
INSERT INTO public.galaxy VALUES (6, 'Fornax Cluster', 'Smaller cluster of galaxies', false, true, 12, 'Gas Giants, Rocky Planets', 64000000);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Ganymede', 1, 5262.4, 1.428, 1070400);
INSERT INTO public.moon VALUES (2, 'Callisto', 1, 4821.6, 1.235, 1882700);
INSERT INTO public.moon VALUES (3, 'Io', 1, 3642, 1.796, 421600);
INSERT INTO public.moon VALUES (4, 'Europa', 1, 3121.6, 1.314, 670900);
INSERT INTO public.moon VALUES (5, 'Titan', 2, 5151, 1.352, 1221850);
INSERT INTO public.moon VALUES (6, 'Rhea', 2, 1527.6, 0.264, 527040);
INSERT INTO public.moon VALUES (7, 'Iapetus', 2, 1469.4, 0.223, 3561300);
INSERT INTO public.moon VALUES (8, 'Dione', 2, 1120.8, 0.23, 377420);
INSERT INTO public.moon VALUES (9, 'Titania', 3, 1577.8, 0.377, 435910);
INSERT INTO public.moon VALUES (10, 'Oberon', 3, 1522.8, 0.346, 584020);
INSERT INTO public.moon VALUES (11, 'Umbriel', 3, 1169.4, 0.233, 265970);
INSERT INTO public.moon VALUES (12, 'Ariel', 3, 1161.6, 0.269, 190900);
INSERT INTO public.moon VALUES (13, 'Triton', 4, 2707.2, 0.779, 354759);
INSERT INTO public.moon VALUES (14, 'Proteus', 4, 198.9, 0.077, 117646);
INSERT INTO public.moon VALUES (15, 'Nereid', 4, 178.2, 0.051, 5513813);
INSERT INTO public.moon VALUES (16, 'Charon', 5, 1212.2, 0.274, 19571);
INSERT INTO public.moon VALUES (17, 'Styx', 5, 10.4, 0.005, 42370);
INSERT INTO public.moon VALUES (18, 'Nix', 5, 46.2, 0.005, 48694);
INSERT INTO public.moon VALUES (19, 'Dysnomia', 6, 700, 0.005, 37350);
INSERT INTO public.moon VALUES (20, 'None', 6, 0, 0, 0);
INSERT INTO public.moon VALUES (21, 'Moon', 1, 3, 1.62, 384400);
INSERT INTO public.moon VALUES (22, 'Phobos', 2, 0.003, 0.0038, 9375);
INSERT INTO public.moon VALUES (23, 'Deimos', 2, 0.002, 0.002, 23460);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 1, 12, 9.81, 'Nitrogen, Oxygen', 1);
INSERT INTO public.planet VALUES (2, 'Venus', 1, 12, 8.87, 'Carbon dioxide', 0);
INSERT INTO public.planet VALUES (3, 'Mars', 1, 6, 3.72, 'Nitrogen, Carbon dioxide', 2);
INSERT INTO public.planet VALUES (4, 'Kepler-186f', 1, 1.2, 1.1, 'Nitrogen, Oxygen', 0);
INSERT INTO public.planet VALUES (5, 'Proxima b', 2, 0.3, 0.9, 'Nitrogen, Oxygen', 0);
INSERT INTO public.planet VALUES (6, '55 Cancri e', 3, 1.5, 1.1, 'Hydrogen Cyanide', 0);
INSERT INTO public.planet VALUES (7, 'GJ 1214 b', 4, 2.7, 1.4, 'Hydrogen, Helium, Methane', 0);
INSERT INTO public.planet VALUES (8, 'HD 189733 b', 5, 2.2, 2.6, 'Nitrogen, Helium, Methane', 0);
INSERT INTO public.planet VALUES (9, 'WASP-43b', 6, 1.9, 2.3, 'Hydrogen, Helium, Water Vapor', 0);
INSERT INTO public.planet VALUES (10, 'HD 209458 b', 1, 1.3, 1.2, 'Hydrogen, Helium, Water Vapor', 0);
INSERT INTO public.planet VALUES (11, 'TrES-4', 1, 1.4, 1.3, 'Its a hot Jupiter', 0);
INSERT INTO public.planet VALUES (12, 'GJ 436 b', 2, 0.4, 1.1, 'Hydrogen, Helium', 0);
INSERT INTO public.planet VALUES (13, 'Jupiter', 1, 139822, 24.79, 'Hydrogen, Helium', 79);
INSERT INTO public.planet VALUES (14, 'Saturn', 1, 116464, 10.44, 'Hydrogen, Helium', 82);
INSERT INTO public.planet VALUES (15, 'Uranus', 1, 50724, 8.87, 'Hydrogen, Helium, Methane', 27);
INSERT INTO public.planet VALUES (16, 'Neptune', 1, 49244, 11.15, 'Hydrogen, Helium, Methane', 14);
INSERT INTO public.planet VALUES (17, 'Pluto', 1, 2376, 0.62, 'Nitrogen, Methane', 5);
INSERT INTO public.planet VALUES (18, 'Eris', 1, 2326, 0.82, 'Methane', 1);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 1989000000000000000000000000000, 5778, 382800000000000000000000000, 'G2v');
INSERT INTO public.star VALUES (2, 'Rigel', 2, 2600000000000000000000000000000, 12000, 57400, 'B8Ia');
INSERT INTO public.star VALUES (3, 'Shaula', 3, 7100000000000000000000000000000, 34000, 30, '09.5Iab');
INSERT INTO public.star VALUES (4, 'SAO 10464', 4, 1989000000000000000000000000000, 5778, 1.00, 'G2V');
INSERT INTO public.star VALUES (5, '4636 A', 5, 1989000000000000000000000000000, 5778, 1.00, 'G2V');
INSERT INTO public.star VALUES (6, 'NGC 1332A', 6, 1989000000000000000000000000000, 5778, 1.00, 'G2V');


--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.constellation_constellation_id_seq', 5, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 23, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 18, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: constellation constellation_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_pkey PRIMARY KEY (constellation_id);


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
-- Name: galaxy name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT name_unique UNIQUE (name);


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
-- Name: moon new_fk_planet_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT new_fk_planet_id FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


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
-- PostgreSQL database dump complete
--

