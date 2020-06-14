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
-- Name: comment; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE public.comment (
    id integer NOT NULL,
    post_id integer,
    _user_id integer,
    text character varying(1000) NOT NULL,
    create_at timestamp(0) without time zone NOT NULL
);


ALTER TABLE public.comment OWNER TO postgres;

--
-- Name: comment_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.comment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comment_id_seq OWNER TO postgres;

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
-- Name: post; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE public.post (
    id integer NOT NULL,
    title character varying(500) NOT NULL,
    create_at timestamp(0) without time zone NOT NULL,
    text text NOT NULL,
    views integer NOT NULL,
    is_published boolean NOT NULL,
    annotation character varying(500) NOT NULL
);


ALTER TABLE public.post OWNER TO postgres;

--
-- Name: post_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.post_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.post_id_seq OWNER TO postgres;

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
-- Data for Name: comment; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.comment (id, post_id, _user_id, text, create_at) FROM stdin;
3	7	4	Наконец то,  а то невозможно уже дома сидеть...	2020-06-11 10:43:39
4	6	4	Хорошо это или плохо...	2020-06-11 10:44:39
5	6	2	Какая же неразбериха в этом году кругом..	2020-06-11 10:45:58
\.


--
-- Name: comment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.comment_id_seq', 5, true);


--
-- Data for Name: migration_versions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.migration_versions (version, executed_at) FROM stdin;
20200522121426	2020-06-10 12:05:40
20200522162051	2020-06-10 12:05:40
20200522162322	2020-06-10 12:05:40
20200610121045	2020-06-10 12:11:02
20200610121150	2020-06-10 12:11:55
20200610150841	2020-06-10 15:08:59
20200611073307	2020-06-11 07:33:19
\.


--
-- Data for Name: post; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.post (id, title, create_at, text, views, is_published, annotation) FROM stdin;
8	Супруг Елизаветы II принц Филип отмечает 99-летие	2020-06-11 10:41:07	Супруг британской королевы Елизаветы II герцог Эдинбургский Филип 10 июня отмечает 99-летие. Члены королевского семейства поздравили герцога с днем рождения в соцсетях. Отметить праздник среди родных у Филипа не получится из-за режима самоизоляции, связанного с пандемией коронавируса.	0	f	День Рождение мужа Елизаветы II
6	Мишустин утвердил порядок проведения ЕГЭ	2020-06-11 10:37:35	Премьер-министр Михаил Мишустин подписал постановление об особенностях сдачи ЕГЭ в 2020 году, согласно которому все школьники получат аттестаты без сдачи экзаменов.	6	t	ЕГЭ в 2020 году.
7	Собянин отменил пропуска и график прогулок	2020-06-11 10:39:45	С 9 июня в Москве отменяют пропускной режим, а также график прогулок. Об этом сообщил 8 июня мэр города Сергей Собянин.	5	t	Выход из самоизоляции в Москве
9	В Липецке 70% торговцев с рынков приступили к работе	2020-06-11 10:42:31	В результате более 1,5 тыс. предпринимателей – или 70% от общего количества торгующих непроводовольственными товарами на рынках – смогли возобновить деятельность.	1	t	Липецк, рынки постепенно открываются
\.


--
-- Name: post_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.post_id_seq', 9, true);


--
-- Data for Name: user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."user" (id, email, roles, password, name) FROM stdin;
2	user@gmail.com	["ROLE_USER"]	$argon2id$v=19$m=65536,t=4,p=1$sDXObYq2TYCCkEkhQVLpAg$PrIrFsxPAK497KJdPBFhO0TfJCzXpJlUey4QMYzgQh8	User
3	admin@gmail.com	["ROLE_ADMIN"]	$argon2id$v=19$m=65536,t=4,p=1$SNwn1xFDSMlZETlbPr2EmQ$BfVp0cxF4r781HE7EnyeZLNoqiFltI1fCykEyojVWMk	Admin
4	liza@gmail.com	["ROLE_USER"]	$argon2id$v=19$m=65536,t=4,p=1$KhFEUaMEeohBuHKH3Eij+A$w3OlnyJcyUCdo4825RwnGEuUnfjF1Xn2RJYzuYtmas8	liza
\.


--
-- Name: user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_id_seq', 4, true);


--
-- Name: comment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY public.comment
    ADD CONSTRAINT comment_pkey PRIMARY KEY (id);


--
-- Name: migration_versions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY public.migration_versions
    ADD CONSTRAINT migration_versions_pkey PRIMARY KEY (version);


--
-- Name: post_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY public.post
    ADD CONSTRAINT post_pkey PRIMARY KEY (id);


--
-- Name: user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (id);


--
-- Name: idx_9474526c4b89032c; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_9474526c4b89032c ON public.comment USING btree (post_id);


--
-- Name: idx_9474526cd32632e8; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_9474526cd32632e8 ON public.comment USING btree (_user_id);


--
-- Name: uniq_8d93d649e7927c74; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX uniq_8d93d649e7927c74 ON public."user" USING btree (email);


--
-- Name: fk_9474526c4b89032c; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comment
    ADD CONSTRAINT fk_9474526c4b89032c FOREIGN KEY (post_id) REFERENCES public.post(id);


--
-- Name: fk_9474526cd32632e8; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comment
    ADD CONSTRAINT fk_9474526cd32632e8 FOREIGN KEY (_user_id) REFERENCES public."user"(id);


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

