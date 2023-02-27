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
    url text,
    "shortUrl" text NOT NULL,
    "vistiCount" integer DEFAULT 0 NOT NULL,
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL,
    CONSTRAINT urls_url_check CHECK ((url ~* '^https?://[^\s/$.?#].[^\s]*$'::text))
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


--
-- Data for Name: urls; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.urls VALUES (3, 'fdf899cd-9aaf-4857-b858-6c47f9553331', 'https://img.ibxk.com.br/2022/03/07/07150401099303.jpg', '1fjQR3GA3i3r5vyjnDSHN', 0, '2023-02-27 17:35:12.41928');
INSERT INTO public.urls VALUES (4, 'fdf899cd-9aaf-4857-b858-6c47f9553331', 'https://img.ibxk.com.br/2022/03/07/07150401099303.jpg', 'P_qYObvJFLKQhB5jgqh-v', 0, '2023-02-27 17:36:41.515025');
INSERT INTO public.urls VALUES (5, 'fdf899cd-9aaf-4857-b858-6c47f9553331', 'https://img.ibxk.com.br/2022/03/07/07150401099303.jpg', 'fv9rLHjOaeUT7llMwWlxa', 0, '2023-02-27 17:39:37.103103');
INSERT INTO public.urls VALUES (6, 'fdf899cd-9aaf-4857-b858-6c47f9553331', 'https://img.ibxk.com.br/2022/03/07/07150401099303.jpg', 'IKJiiLOu4QloiVjBaO32S', 0, '2023-02-27 17:40:04.587126');
INSERT INTO public.urls VALUES (7, 'fdf899cd-9aaf-4857-b858-6c47f9553331', 'https://img.ibxk.com.br/2022/03/07/07150401099303.jpg', 'AXKSCvWBJCNYB-46syPk6', 0, '2023-02-27 17:40:35.175035');
INSERT INTO public.urls VALUES (8, 'fdf899cd-9aaf-4857-b858-6c47f9553331', 'https://img.ibxk.com.br/2022/03/07/07150401099303.jpg', 'yS9hrdb-1Qvpsw-gmEbtc', 0, '2023-02-27 17:41:12.091701');
INSERT INTO public.urls VALUES (9, 'fdf899cd-9aaf-4857-b858-6c47f9553331', 'https://img.ibxk.com.br/2022/03/07/07150401099303.jpg', 'G7wCPRD21rg7ruYXinl4b', 0, '2023-02-27 17:41:24.087025');
INSERT INTO public.urls VALUES (10, 'fdf899cd-9aaf-4857-b858-6c47f9553331', 'https://img.ibxk.com.br/2022/03/07/07150401099303.jpg', 'GiOupvT8-pRLrZSE2Wena', 0, '2023-02-27 17:41:39.598952');
INSERT INTO public.urls VALUES (11, 'fdf899cd-9aaf-4857-b858-6c47f9553331', 'https://img.ibxk.com.br/2022/03/07/07150401099303.jpg', 'WiV8jWQS5U-AkPmM6Z_Pz', 0, '2023-02-27 17:41:50.509673');
INSERT INTO public.urls VALUES (12, 'fdf899cd-9aaf-4857-b858-6c47f9553331', 'https://img.ibxk.com.br/2022/03/07/07150401099303.jpg', 'mxovTJnQOishXT7le24jF', 0, '2023-02-27 17:47:16.408307');
INSERT INTO public.urls VALUES (13, 'fdf899cd-9aaf-4857-b858-6c47f9553331', 'http://img.ibxk.com.br/2022/03/07/07150401099303.jpg', 'n8q3CedER5YcKB_rCLgpv', 0, '2023-02-27 17:47:37.463538');


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.users VALUES (1, 'Davi Lucas Macedo', 'alexandre@gmail.com', '$2b$10$jOvU7zZ3MWtyQEW1JooVa.wCllH.QFl58179b9UtXPc7Bk0BeTLIK', 0, '2023-02-27 17:09:59.090377');


--
-- Name: sessions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.sessions_id_seq', 4, true);


--
-- Name: urls_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.urls_id_seq', 13, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.users_id_seq', 1, true);


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

