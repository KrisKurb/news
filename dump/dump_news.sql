--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: migration_versions; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE public.migration_versions (
    version character varying(14) NOT NULL,
    executed_at timestamp(0) without time zone NOT NULL
);


ALTER TABLE public.migration_versions OWNER TO postgres;

--
-- Name: COLUMN migration_versions.executed_at; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.migration_versions.executed_at IS '(DC2Type:datetime_immutable)';


--
-- Name: user; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE public."user" (
    id integer NOT NULL,
    email character varying(180) NOT NULL,
    roles json NOT NULL,
    password character varying(255) NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public."user" OWNER TO postgres;

--
-- Name: user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_id_seq OWNER TO postgres;

--
-- Data for Name: migration_versions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.migration_versions (version, executed_at) FROM stdin;
20200522121426	2020-05-22 12:28:28
20200522162051	2020-05-22 16:21:13
20200522162322	2020-05-22 16:23:34
\.


--
-- Data for Name: user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."user" (id, email, roles, password, name) FROM stdin;
1	admin@gmail.com	["ROLE_ADMIN"]	$argon2id$v=19$m=65536,t=4,p=1$jDAoZG+/wiMIWteGKU0i3Q$FfcvI/vgK0WwynnQmbyVIRf0h4kmt5PEz+DWj0t7Wo8	Admin
2	user@gmail.com	["ROLE_USER"]	$argon2id$v=19$m=65536,t=4,p=1$aCZjOQJ0eT5vmXpQnutEJQ$j4ijbj+mmlv+CrTMRdzIbZw0gnWryYpwKD6E3qrjmhI	User
3	kristina@gmail.com	[]	$argon2id$v=19$m=65536,t=4,p=1$9Y2nLb7xlC+OFjKzKAhv/A$5ng+ojEI6dIMhRFfrsFI9SeBxypPCT3b8JuazTm0xnw	kristina
\.


--
-- Name: user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_id_seq', 3, true);


--
-- Name: migration_versions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY public.migration_versions
    ADD CONSTRAINT migration_versions_pkey PRIMARY KEY (version);


--
-- Name: user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (id);


--
-- Name: uniq_8d93d649e7927c74; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX uniq_8d93d649e7927c74 ON public."user" USING btree (email);


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

