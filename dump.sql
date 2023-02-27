--
-- PostgreSQL database dump
--

-- Dumped from database version 14.6 (Ubuntu 14.6-0ubuntu0.22.04.1)
-- Dumped by pg_dump version 14.6 (Ubuntu 14.6-0ubuntu0.22.04.1)

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
-- Name: sessions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.sessions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    token text NOT NULL,
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL
);


--
-- Name: sessions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.sessions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: sessions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.sessions_id_seq OWNED BY public.sessions.id;


--
-- Name: urls; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.urls (
    id integer NOT NULL,
    user_token text NOT NULL,
    url text NOT NULL,
    "shortUrl" text NOT NULL,
    "vistiCount" integer DEFAULT 0 NOT NULL,
    "createdAt" timestamp without time zone
);


--
-- Name: urls_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.urls_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: urls_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.urls_id_seq OWNED BY public.urls.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    email character varying(320) NOT NULL,
    password character varying(60) NOT NULL,
    "linksCount" integer DEFAULT 0 NOT NULL,
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL
);


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: sessions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions ALTER COLUMN id SET DEFAULT nextval('public.sessions_id_seq'::regclass);


--
-- Name: urls id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.urls ALTER COLUMN id SET DEFAULT nextval('public.urls_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: sessions; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.sessions VALUES (1, 1, '5580a6d8-14fb-46c3-b0b8-e3aaad859950', '2023-02-27 17:10:00.905198');
INSERT INTO public.sessions VALUES (2, 1, '5e5b9073-1671-4c5f-acda-1fae0f4238d0', '2023-02-27 17:10:47.332529');
INSERT INTO public.sessions VALUES (3, 1, 'cdb45a4f-610b-4662-b934-5078d50f424e', '2023-02-27 17:12:16.93009');
INSERT INTO public.sessions VALUES (4, 1, 'fdf899cd-9aaf-4857-b858-6c47f9553331', '2023-02-27 17:12:59.549907');
INSERT INTO public.sessions VALUES (5, 5, '50a6d5c4-02fa-44c5-8b92-7af00674404c', '2023-02-27 18:21:14.824198');
INSERT INTO public.sessions VALUES (6, 5, '49c0efba-34d0-4921-a3e3-fa4868562a32', '2023-02-27 18:21:20.411654');
INSERT INTO public.sessions VALUES (7, 5, 'ce2f439d-7ffd-40b0-9667-32e2b0f76b4e', '2023-02-27 18:21:27.31643');
INSERT INTO public.sessions VALUES (8, 5, '6d30b2e8-1bbc-42df-ae03-b1715a02b944', '2023-02-27 18:21:50.183445');
INSERT INTO public.sessions VALUES (9, 5, 'bbab6fea-283d-4f02-b262-e519f6b15315', '2023-02-27 18:22:48.374884');
INSERT INTO public.sessions VALUES (10, 5, 'a4292d47-c5fb-4cad-b79e-1316878722c3', '2023-02-27 18:22:52.258144');
INSERT INTO public.sessions VALUES (11, 5, 'aa295e61-ee46-4446-bbc4-9767110795b5', '2023-02-27 18:22:55.729659');
INSERT INTO public.sessions VALUES (12, 6, 'd0202c3a-aa9c-4a2e-8a9e-7ca4ac42c7bf', '2023-02-27 18:23:23.015434');
INSERT INTO public.sessions VALUES (13, 6, '12173ccf-40e7-4555-a592-73b53a9ec7ec', '2023-02-27 18:23:32.8862');
INSERT INTO public.sessions VALUES (14, 6, 'b803bcdf-5705-457e-95d3-cfc824c3b2d6', '2023-02-27 18:23:36.055916');
INSERT INTO public.sessions VALUES (15, 6, '0e9e0ce5-e170-49a8-a8c5-696668b30c7e', '2023-02-27 18:23:41.586342');


--
-- Data for Name: urls; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.users VALUES (1, 'Davi Lucas Macedo', 'alexandre@gmail.com', '$2b$10$jOvU7zZ3MWtyQEW1JooVa.wCllH.QFl58179b9UtXPc7Bk0BeTLIK', 0, '2023-02-27 17:09:59.090377');
INSERT INTO public.users VALUES (2, 'Davi Lucas Macedo', 'alexandree@gmail.com', '$2b$10$k9PFM8g04aIzciAMcJWd1OXeLejeKlFFvEQbL3x1fdUZ/q6kGqZxa', 0, '2023-02-27 17:58:55.229279');
INSERT INTO public.users VALUES (3, 'Davi Lucas Macedo', 'alexandree2@gmail.com', '$2b$10$FUe7heInH1wJnKtzYgOHTugzDgBIyvhuiEmbDcgBdP9yYKa8uosCm', 0, '2023-02-27 18:00:01.294043');
INSERT INTO public.users VALUES (4, 'Felícia Martins', 'yago_moraes@live.com', '$2b$10$hlZhfD4EkYgpMRkQTPy5UujDxkpNqcX4ftbZm3dzL9xCjTezxPnqK', 0, '2023-02-27 18:02:17.557946');
INSERT INTO public.users VALUES (5, 'Silas Reis ', 'oflia_franco13@hotmail.com', '$2b$10$oJbWYzKcA33bh74Q/FXxWO1ZrAqNuBpjRYWIk.VhpMxDqJ9RtOzV6', 0, '2023-02-27 18:20:50.551998');
INSERT INTO public.users VALUES (6, 'Silas Reis ', 'rato123@hotmail.com', '$2b$10$tjqprN4ROFgndy/BHAU68uMiCxL2QLKkVdqNnQ/URu6/GevekL.OW', 0, '2023-02-27 18:23:16.665263');


--
-- Name: sessions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.sessions_id_seq', 15, true);


--
-- Name: urls_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.urls_id_seq', 1, false);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.users_id_seq', 6, true);


--
-- Name: sessions sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id);


--
-- Name: sessions sessions_token_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_token_key UNIQUE (token);


--
-- Name: urls urls_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.urls
    ADD CONSTRAINT urls_pkey PRIMARY KEY (id);


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: sessions sessions_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- PostgreSQL database dump complete
--

