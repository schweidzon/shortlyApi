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
    user_id integer NOT NULL,
    url text NOT NULL,
    "shortUrl" text NOT NULL,
    "visitCount" integer DEFAULT 0 NOT NULL,
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL
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
INSERT INTO public.sessions VALUES (16, 11, 'c8c88a59-be66-4e84-a049-8dd99a83dc5b', '2023-02-27 20:56:11.252614');
INSERT INTO public.sessions VALUES (17, 12, '639f8003-1235-4f5f-b191-ba5d77b65407', '2023-02-27 21:42:17.668772');
INSERT INTO public.sessions VALUES (18, 12, '42484a11-212c-43ed-bf23-6ea986e18bbb', '2023-02-27 22:15:06.88467');
INSERT INTO public.sessions VALUES (19, 12, '5f507cf5-8054-4b83-b274-a4644a84b0c2', '2023-02-27 22:15:36.250676');
INSERT INTO public.sessions VALUES (20, 11, 'cd476154-75cf-4e2b-9adb-9e7056ab5fcb', '2023-02-27 22:15:58.923511');
INSERT INTO public.sessions VALUES (21, 11, '3a99a02d-48f3-4b1f-9ae7-4e27fbc9fccb', '2023-02-28 08:05:49.517011');
INSERT INTO public.sessions VALUES (22, 11, '7e02ef0f-7393-42c3-bc87-46261d045f5d', '2023-02-28 08:10:24.205549');
INSERT INTO public.sessions VALUES (23, 11, '5fabc680-183e-45e3-a407-c12d4a029f11', '2023-02-28 08:11:56.722335');
INSERT INTO public.sessions VALUES (24, 11, 'd0794f79-9a5e-4063-94e3-a9200c5f5d56', '2023-02-28 08:12:35.740458');
INSERT INTO public.sessions VALUES (25, 11, '793d4e78-42cb-4519-bb0d-869580577402', '2023-02-28 08:15:23.560269');
INSERT INTO public.sessions VALUES (26, 11, 'f76ce712-e7e4-465e-b1c8-19268ab089a1', '2023-02-28 08:17:26.751854');
INSERT INTO public.sessions VALUES (27, 11, '04f923b3-4561-48c3-bf73-d4d58f77f98e', '2023-02-28 08:19:22.043965');
INSERT INTO public.sessions VALUES (28, 13, 'a9a3434a-cb2e-435d-a36b-f40fb7308b2b', '2023-02-28 08:31:29.78585');
INSERT INTO public.sessions VALUES (29, 13, '36913552-9aab-4353-b8c9-301028102b50', '2023-02-28 08:59:01.408603');


--
-- Data for Name: urls; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.urls VALUES (4, 13, 'http://img.ibxk.com.br/2022/03/07/07150401099303.jpg', 'tMiOtUAT', 0, '2023-02-28 09:05:34.663249');
INSERT INTO public.urls VALUES (6, 13, 'http://img.ibxk.com.br/2022/03/07/07150401099303.jpg', 'SzrULmWo', 0, '2023-02-28 09:05:35.748634');
INSERT INTO public.urls VALUES (7, 13, 'http://img.ibxk.com.br/2022/03/07/07150401099303.jpg', 'WrvfJD-1', 0, '2023-02-28 09:05:35.910392');
INSERT INTO public.urls VALUES (8, 13, 'http://img.ibxk.com.br/2022/03/07/07150401099303.jpg', 'OPU3z8Aa', 0, '2023-02-28 09:09:26.40864');
INSERT INTO public.urls VALUES (9, 13, 'http://img.ibxk.com.br/2022/03/07/07150401099303.jpg', '_paMiiI7', 0, '2023-02-28 09:09:26.993886');
INSERT INTO public.urls VALUES (10, 13, 'http://img.ibxk.com.br/2022/03/07/07150401099303.jpg', 'ffJgfWX1', 0, '2023-02-28 09:09:27.590024');


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.users VALUES (1, 'Davi Lucas Macedo', 'alexandre@gmail.com', '$2b$10$jOvU7zZ3MWtyQEW1JooVa.wCllH.QFl58179b9UtXPc7Bk0BeTLIK', 0, '2023-02-27 17:09:59.090377');
INSERT INTO public.users VALUES (2, 'Davi Lucas Macedo', 'alexandree@gmail.com', '$2b$10$k9PFM8g04aIzciAMcJWd1OXeLejeKlFFvEQbL3x1fdUZ/q6kGqZxa', 0, '2023-02-27 17:58:55.229279');
INSERT INTO public.users VALUES (3, 'Davi Lucas Macedo', 'alexandree2@gmail.com', '$2b$10$FUe7heInH1wJnKtzYgOHTugzDgBIyvhuiEmbDcgBdP9yYKa8uosCm', 0, '2023-02-27 18:00:01.294043');
INSERT INTO public.users VALUES (4, 'Felícia Martins', 'yago_moraes@live.com', '$2b$10$hlZhfD4EkYgpMRkQTPy5UujDxkpNqcX4ftbZm3dzL9xCjTezxPnqK', 0, '2023-02-27 18:02:17.557946');
INSERT INTO public.users VALUES (5, 'Silas Reis ', 'oflia_franco13@hotmail.com', '$2b$10$oJbWYzKcA33bh74Q/FXxWO1ZrAqNuBpjRYWIk.VhpMxDqJ9RtOzV6', 0, '2023-02-27 18:20:50.551998');
INSERT INTO public.users VALUES (6, 'Silas Reis ', 'rato123@hotmail.com', '$2b$10$tjqprN4ROFgndy/BHAU68uMiCxL2QLKkVdqNnQ/URu6/GevekL.OW', 0, '2023-02-27 18:23:16.665263');
INSERT INTO public.users VALUES (7, 'Alice Saraiva', 'pedrohenrique_silva@bol.com.br', '$2b$10$VA9hrZik0DCQnt4y.ngQPeFd536YY9DsY6KtczeBQfrVsRJDNeSPu', 0, '2023-02-27 18:38:51.356452');
INSERT INTO public.users VALUES (8, 'Alice Saraiva', 'pedrohenrique.silva@bol.com.br', '$2b$10$dCsQmJmF90t.ZgMv7heWROPWy5ci2at4Ujmvm5FwO1niUNNPGgih2', 0, '2023-02-27 18:47:16.840869');
INSERT INTO public.users VALUES (11, 'danniel', 'dannielsch@gmail.com', '$2b$10$toc30eGLeD7DULcE99Im5O61fQscvj81d/OBHZwWNTATB7eVxNXPO', 0, '2023-02-27 20:55:32.834641');
INSERT INTO public.users VALUES (12, 'danniel', 'dannielsch2@gmail.com', '$2b$10$p/Jj0VUscTA71DhnRZHWxuS.JD8dfz/7TzCOEoR0705kYKVinFeLW', 0, '2023-02-27 21:42:08.33581');
INSERT INTO public.users VALUES (13, 'danniell', 'dannielsch3@gmail.com', '$2b$10$sCV9UO3U4wgbipMD/VpYfuuobzdjma.QItK5c79H74P0e0gpVYHfe', 3, '2023-02-28 08:31:22.500132');


--
-- Name: sessions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.sessions_id_seq', 29, true);


--
-- Name: urls_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.urls_id_seq', 10, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.users_id_seq', 13, true);


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

