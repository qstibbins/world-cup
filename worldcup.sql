--
-- PostgreSQL database dump
--

-- Dumped from database version 16.2 (Postgres.app)
-- Dumped by pg_dump version 16.2

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
-- Name: games; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.games (
    game_id integer NOT NULL,
    year integer NOT NULL,
    round character varying NOT NULL,
    winner_id integer NOT NULL,
    opponent_id integer NOT NULL,
    winner_goals integer NOT NULL,
    opponent_goals integer NOT NULL
);


--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;


--
-- Name: teams; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.teams (
    team_id integer NOT NULL,
    name text NOT NULL
);


--
-- Name: teams_team_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.teams_team_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: teams_team_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.teams_team_id_seq OWNED BY public.teams.team_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: teams team_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.teams ALTER COLUMN team_id SET DEFAULT nextval('public.teams_team_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.games (game_id, year, round, winner_id, opponent_id, winner_goals, opponent_goals) FROM stdin;
36	2018	Final	31	32	4	2
37	2018	Third Place	33	34	2	0
38	2018	Semi-Final	32	34	2	1
39	2018	Semi-Final	31	33	1	0
40	2018	Quarter-Final	32	35	3	2
41	2018	Quarter-Final	34	36	2	0
42	2018	Quarter-Final	33	37	2	1
43	2018	Quarter-Final	31	38	2	0
44	2018	Eighth-Final	34	39	2	1
45	2018	Eighth-Final	36	40	1	0
46	2018	Eighth-Final	33	41	3	2
47	2018	Eighth-Final	37	42	2	0
48	2018	Eighth-Final	32	43	2	1
49	2018	Eighth-Final	35	44	2	1
50	2018	Eighth-Final	38	45	2	1
51	2018	Eighth-Final	31	46	4	3
52	2014	Final	47	46	1	0
53	2014	Third Place	48	37	3	0
54	2014	Semi-Final	46	48	1	0
55	2014	Semi-Final	47	37	7	1
56	2014	Quarter-Final	48	49	1	0
57	2014	Quarter-Final	46	33	1	0
58	2014	Quarter-Final	37	39	2	1
59	2014	Quarter-Final	47	31	1	0
60	2014	Eighth-Final	37	50	2	1
61	2014	Eighth-Final	39	38	2	0
62	2014	Eighth-Final	31	51	2	0
63	2014	Eighth-Final	47	52	2	1
64	2014	Eighth-Final	48	42	2	1
65	2014	Eighth-Final	49	53	2	1
66	2014	Eighth-Final	46	40	1	0
67	2014	Eighth-Final	33	54	2	1
\.


--
-- Data for Name: teams; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.teams (team_id, name) FROM stdin;
31	France
32	Croatia
33	Belgium
34	England
35	Russia
36	Sweden
37	Brazil
38	Uruguay
39	Colombia
40	Switzerland
41	Japan
42	Mexico
43	Denmark
44	Spain
45	Portugal
46	Argentina
47	Germany
48	Netherlands
49	Costa Rica
50	Chile
51	Nigeria
52	Algeria
53	Greece
54	United States
\.


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.games_game_id_seq', 67, true);


--
-- Name: teams_team_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.teams_team_id_seq', 54, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: teams teams_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_name_key UNIQUE (name);


--
-- Name: teams teams_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_pkey PRIMARY KEY (team_id);


--
-- Name: games games_opponent_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_opponent_id_fkey FOREIGN KEY (opponent_id) REFERENCES public.teams(team_id);


--
-- Name: games games_winner_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_winner_id_fkey FOREIGN KEY (winner_id) REFERENCES public.teams(team_id);


--
-- PostgreSQL database dump complete
--

