--
-- PostgreSQL database dump
--

\restrict E26kG7Zf7mSIoLIRCdpqNJCrzSshgF7fZj4afvTTSCnG6Cd7M8x4bEXDd6r8CQ8

-- Dumped from database version 16.14 (Debian 16.14-1.pgdg13+1)
-- Dumped by pg_dump version 18.4 (Ubuntu 18.4-0ubuntu0.26.04.1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: content; Type: SCHEMA; Schema: -; Owner: pchelin
--

CREATE SCHEMA content;


ALTER SCHEMA content OWNER TO pchelin;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: film_work; Type: TABLE; Schema: content; Owner: pchelin
--

CREATE TABLE content.film_work (
    id uuid NOT NULL,
    title text NOT NULL,
    description text,
    creation_date date,
    rating double precision,
    type text NOT NULL,
    created timestamp with time zone,
    modified timestamp with time zone
);


ALTER TABLE content.film_work OWNER TO pchelin;

--
-- Name: genre; Type: TABLE; Schema: content; Owner: pchelin
--

CREATE TABLE content.genre (
    id uuid NOT NULL,
    name text NOT NULL,
    description text NOT NULL,
    created timestamp with time zone,
    modified timestamp with time zone
);


ALTER TABLE content.genre OWNER TO pchelin;

--
-- Name: genre_film_work; Type: TABLE; Schema: content; Owner: pchelin
--

CREATE TABLE content.genre_film_work (
    id uuid NOT NULL,
    genre_id uuid,
    film_work_id uuid,
    created timestamp with time zone
);


ALTER TABLE content.genre_film_work OWNER TO pchelin;

--
-- Name: person; Type: TABLE; Schema: content; Owner: pchelin
--

CREATE TABLE content.person (
    id uuid NOT NULL,
    full_name text NOT NULL,
    created timestamp with time zone,
    modified timestamp with time zone
);


ALTER TABLE content.person OWNER TO pchelin;

--
-- Name: person_film_work; Type: TABLE; Schema: content; Owner: pchelin
--

CREATE TABLE content.person_film_work (
    id uuid NOT NULL,
    person_id uuid,
    film_work_id uuid,
    role text,
    created timestamp with time zone
);


ALTER TABLE content.person_film_work OWNER TO pchelin;

--
-- Data for Name: film_work; Type: TABLE DATA; Schema: content; Owner: pchelin
--

COPY content.film_work (id, title, description, creation_date, rating, type, created, modified) FROM stdin;
\.


--
-- Data for Name: genre; Type: TABLE DATA; Schema: content; Owner: pchelin
--

COPY content.genre (id, name, description, created, modified) FROM stdin;
\.


--
-- Data for Name: genre_film_work; Type: TABLE DATA; Schema: content; Owner: pchelin
--

COPY content.genre_film_work (id, genre_id, film_work_id, created) FROM stdin;
\.


--
-- Data for Name: person; Type: TABLE DATA; Schema: content; Owner: pchelin
--

COPY content.person (id, full_name, created, modified) FROM stdin;
\.


--
-- Data for Name: person_film_work; Type: TABLE DATA; Schema: content; Owner: pchelin
--

COPY content.person_film_work (id, person_id, film_work_id, role, created) FROM stdin;
\.


--
-- Name: film_work film_work_pkey; Type: CONSTRAINT; Schema: content; Owner: pchelin
--

ALTER TABLE ONLY content.film_work
    ADD CONSTRAINT film_work_pkey PRIMARY KEY (id);


--
-- Name: genre_film_work genre_film_work_pkey; Type: CONSTRAINT; Schema: content; Owner: pchelin
--

ALTER TABLE ONLY content.genre_film_work
    ADD CONSTRAINT genre_film_work_pkey PRIMARY KEY (id);


--
-- Name: genre genre_pkey; Type: CONSTRAINT; Schema: content; Owner: pchelin
--

ALTER TABLE ONLY content.genre
    ADD CONSTRAINT genre_pkey PRIMARY KEY (id);


--
-- Name: person_film_work person_film_work_pkey; Type: CONSTRAINT; Schema: content; Owner: pchelin
--

ALTER TABLE ONLY content.person_film_work
    ADD CONSTRAINT person_film_work_pkey PRIMARY KEY (id);


--
-- Name: person person_pkey; Type: CONSTRAINT; Schema: content; Owner: pchelin
--

ALTER TABLE ONLY content.person
    ADD CONSTRAINT person_pkey PRIMARY KEY (id);


--
-- Name: genre_film_work genre_film_work_film_work_id_fkey; Type: FK CONSTRAINT; Schema: content; Owner: pchelin
--

ALTER TABLE ONLY content.genre_film_work
    ADD CONSTRAINT genre_film_work_film_work_id_fkey FOREIGN KEY (film_work_id) REFERENCES content.film_work(id);


--
-- Name: genre_film_work genre_film_work_genre_id_fkey; Type: FK CONSTRAINT; Schema: content; Owner: pchelin
--

ALTER TABLE ONLY content.genre_film_work
    ADD CONSTRAINT genre_film_work_genre_id_fkey FOREIGN KEY (genre_id) REFERENCES content.genre(id);


--
-- Name: person_film_work person_film_work_film_work_id_fkey; Type: FK CONSTRAINT; Schema: content; Owner: pchelin
--

ALTER TABLE ONLY content.person_film_work
    ADD CONSTRAINT person_film_work_film_work_id_fkey FOREIGN KEY (film_work_id) REFERENCES content.film_work(id);


--
-- Name: person_film_work person_film_work_person_id_fkey; Type: FK CONSTRAINT; Schema: content; Owner: pchelin
--

ALTER TABLE ONLY content.person_film_work
    ADD CONSTRAINT person_film_work_person_id_fkey FOREIGN KEY (person_id) REFERENCES content.person(id);


--
-- PostgreSQL database dump complete
--

\unrestrict E26kG7Zf7mSIoLIRCdpqNJCrzSshgF7fZj4afvTTSCnG6Cd7M8x4bEXDd6r8CQ8

