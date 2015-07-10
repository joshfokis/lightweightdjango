--
-- PostgreSQL database cluster dump
--

-- Started on 2015-07-10 15:02:12

SET default_transaction_read_only = off;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

--
-- Roles
--

CREATE ROLE postgres;
ALTER ROLE postgres WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN REPLICATION PASSWORD 'md5a3556571e93b0d20722ba62be61e8c2d';
CREATE ROLE sprint;
ALTER ROLE sprint WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN REPLICATION PASSWORD 'md579ee3d519091c1b106d4a3d4b0e6ea52' VALID UNTIL 'infinity';






--
-- Database creation
--

CREATE DATABASE "crmeasyDB" WITH TEMPLATE = template0 OWNER = postgres;
CREATE DATABASE scrum WITH TEMPLATE = template0 OWNER = postgres;
REVOKE ALL ON DATABASE template1 FROM PUBLIC;
REVOKE ALL ON DATABASE template1 FROM postgres;
GRANT ALL ON DATABASE template1 TO postgres;
GRANT CONNECT ON DATABASE template1 TO PUBLIC;


\connect "crmeasyDB"

SET default_transaction_read_only = off;

--
-- PostgreSQL database dump
--

-- Dumped from database version 9.4.0
-- Dumped by pg_dump version 9.4.0
-- Started on 2015-07-10 15:02:13

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 191 (class 3079 OID 11855)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2137 (class 0 OID 0)
-- Dependencies: 191
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 179 (class 1259 OID 16427)
-- Name: auth_group; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


ALTER TABLE auth_group OWNER TO postgres;

--
-- TOC entry 178 (class 1259 OID 16425)
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_group_id_seq OWNER TO postgres;

--
-- TOC entry 2138 (class 0 OID 0)
-- Dependencies: 178
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE auth_group_id_seq OWNED BY auth_group.id;


--
-- TOC entry 181 (class 1259 OID 16437)
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE auth_group_permissions OWNER TO postgres;

--
-- TOC entry 180 (class 1259 OID 16435)
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_group_permissions_id_seq OWNER TO postgres;

--
-- TOC entry 2139 (class 0 OID 0)
-- Dependencies: 180
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE auth_group_permissions_id_seq OWNED BY auth_group_permissions.id;


--
-- TOC entry 177 (class 1259 OID 16417)
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE auth_permission (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE auth_permission OWNER TO postgres;

--
-- TOC entry 176 (class 1259 OID 16415)
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_permission_id_seq OWNER TO postgres;

--
-- TOC entry 2140 (class 0 OID 0)
-- Dependencies: 176
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE auth_permission_id_seq OWNED BY auth_permission.id;


--
-- TOC entry 183 (class 1259 OID 16447)
-- Name: auth_user; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone NOT NULL,
    is_superuser boolean NOT NULL,
    username character varying(30) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(30) NOT NULL,
    email character varying(75) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE auth_user OWNER TO postgres;

--
-- TOC entry 185 (class 1259 OID 16457)
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE auth_user_groups OWNER TO postgres;

--
-- TOC entry 184 (class 1259 OID 16455)
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_user_groups_id_seq OWNER TO postgres;

--
-- TOC entry 2141 (class 0 OID 0)
-- Dependencies: 184
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE auth_user_groups_id_seq OWNED BY auth_user_groups.id;


--
-- TOC entry 182 (class 1259 OID 16445)
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE auth_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_user_id_seq OWNER TO postgres;

--
-- TOC entry 2142 (class 0 OID 0)
-- Dependencies: 182
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE auth_user_id_seq OWNED BY auth_user.id;


--
-- TOC entry 187 (class 1259 OID 16467)
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE auth_user_user_permissions OWNER TO postgres;

--
-- TOC entry 186 (class 1259 OID 16465)
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_user_user_permissions_id_seq OWNER TO postgres;

--
-- TOC entry 2143 (class 0 OID 0)
-- Dependencies: 186
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE auth_user_user_permissions_id_seq OWNED BY auth_user_user_permissions.id;


--
-- TOC entry 189 (class 1259 OID 16521)
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE django_admin_log OWNER TO postgres;

--
-- TOC entry 188 (class 1259 OID 16519)
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_admin_log_id_seq OWNER TO postgres;

--
-- TOC entry 2144 (class 0 OID 0)
-- Dependencies: 188
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE django_admin_log_id_seq OWNED BY django_admin_log.id;


--
-- TOC entry 175 (class 1259 OID 16407)
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE django_content_type (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE django_content_type OWNER TO postgres;

--
-- TOC entry 174 (class 1259 OID 16405)
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_content_type_id_seq OWNER TO postgres;

--
-- TOC entry 2145 (class 0 OID 0)
-- Dependencies: 174
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE django_content_type_id_seq OWNED BY django_content_type.id;


--
-- TOC entry 173 (class 1259 OID 16396)
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE django_migrations OWNER TO postgres;

--
-- TOC entry 172 (class 1259 OID 16394)
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_migrations_id_seq OWNER TO postgres;

--
-- TOC entry 2146 (class 0 OID 0)
-- Dependencies: 172
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE django_migrations_id_seq OWNED BY django_migrations.id;


--
-- TOC entry 190 (class 1259 OID 16543)
-- Name: django_session; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE django_session OWNER TO postgres;

--
-- TOC entry 1939 (class 2604 OID 16430)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_group ALTER COLUMN id SET DEFAULT nextval('auth_group_id_seq'::regclass);


--
-- TOC entry 1940 (class 2604 OID 16440)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('auth_group_permissions_id_seq'::regclass);


--
-- TOC entry 1938 (class 2604 OID 16420)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_permission ALTER COLUMN id SET DEFAULT nextval('auth_permission_id_seq'::regclass);


--
-- TOC entry 1941 (class 2604 OID 16450)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user ALTER COLUMN id SET DEFAULT nextval('auth_user_id_seq'::regclass);


--
-- TOC entry 1942 (class 2604 OID 16460)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_groups ALTER COLUMN id SET DEFAULT nextval('auth_user_groups_id_seq'::regclass);


--
-- TOC entry 1943 (class 2604 OID 16470)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('auth_user_user_permissions_id_seq'::regclass);


--
-- TOC entry 1944 (class 2604 OID 16524)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_admin_log ALTER COLUMN id SET DEFAULT nextval('django_admin_log_id_seq'::regclass);


--
-- TOC entry 1937 (class 2604 OID 16410)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_content_type ALTER COLUMN id SET DEFAULT nextval('django_content_type_id_seq'::regclass);


--
-- TOC entry 1936 (class 2604 OID 16399)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_migrations ALTER COLUMN id SET DEFAULT nextval('django_migrations_id_seq'::regclass);


--
-- TOC entry 2118 (class 0 OID 16427)
-- Dependencies: 179
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY auth_group (id, name) FROM stdin;
\.


--
-- TOC entry 2147 (class 0 OID 0)
-- Dependencies: 178
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auth_group_id_seq', 1, false);


--
-- TOC entry 2120 (class 0 OID 16437)
-- Dependencies: 181
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- TOC entry 2148 (class 0 OID 0)
-- Dependencies: 180
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auth_group_permissions_id_seq', 1, false);


--
-- TOC entry 2116 (class 0 OID 16417)
-- Dependencies: 177
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can add permission	2	add_permission
5	Can change permission	2	change_permission
6	Can delete permission	2	delete_permission
7	Can add group	3	add_group
8	Can change group	3	change_group
9	Can delete group	3	delete_group
10	Can add user	4	add_user
11	Can change user	4	change_user
12	Can delete user	4	delete_user
13	Can add content type	5	add_contenttype
14	Can change content type	5	change_contenttype
15	Can delete content type	5	delete_contenttype
16	Can add session	6	add_session
17	Can change session	6	change_session
18	Can delete session	6	delete_session
\.


--
-- TOC entry 2149 (class 0 OID 0)
-- Dependencies: 176
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auth_permission_id_seq', 18, true);


--
-- TOC entry 2122 (class 0 OID 16447)
-- Dependencies: 183
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
1	pbkdf2_sha256$15000$p9qT7vEVqdfc$qGD3RgeG51qFPTixHOVKBMw92/QBm0stycwieERKBhs=	2015-02-03 10:45:04.202-06	t	game			example@example.com	t	t	2015-02-02 14:24:51.139-06
\.


--
-- TOC entry 2124 (class 0 OID 16457)
-- Dependencies: 185
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- TOC entry 2150 (class 0 OID 0)
-- Dependencies: 184
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auth_user_groups_id_seq', 1, false);


--
-- TOC entry 2151 (class 0 OID 0)
-- Dependencies: 182
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auth_user_id_seq', 1, true);


--
-- TOC entry 2126 (class 0 OID 16467)
-- Dependencies: 187
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- TOC entry 2152 (class 0 OID 0)
-- Dependencies: 186
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auth_user_user_permissions_id_seq', 1, false);


--
-- TOC entry 2128 (class 0 OID 16521)
-- Dependencies: 189
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
\.


--
-- TOC entry 2153 (class 0 OID 0)
-- Dependencies: 188
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('django_admin_log_id_seq', 1, false);


--
-- TOC entry 2114 (class 0 OID 16407)
-- Dependencies: 175
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY django_content_type (id, name, app_label, model) FROM stdin;
1	log entry	admin	logentry
2	permission	auth	permission
3	group	auth	group
4	user	auth	user
5	content type	contenttypes	contenttype
6	session	sessions	session
\.


--
-- TOC entry 2154 (class 0 OID 0)
-- Dependencies: 174
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('django_content_type_id_seq', 6, true);


--
-- TOC entry 2112 (class 0 OID 16396)
-- Dependencies: 173
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2015-02-02 14:23:31.076-06
2	auth	0001_initial	2015-02-02 14:23:32.194-06
3	admin	0001_initial	2015-02-02 14:23:32.348-06
4	sessions	0001_initial	2015-02-02 14:23:32.5-06
\.


--
-- TOC entry 2155 (class 0 OID 0)
-- Dependencies: 172
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('django_migrations_id_seq', 4, true);


--
-- TOC entry 2129 (class 0 OID 16543)
-- Dependencies: 190
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY django_session (session_key, session_data, expire_date) FROM stdin;
ve8l02f4z8cvg6cz5s4hyoi32a9ay80j	NTVjZDVhMmM5NmQyZTAyMDQyMGIwNWYwMTU0NGY4NmY0ODQ3NGIxODp7Il9hdXRoX3VzZXJfaGFzaCI6IjM2ODEyMzQzMTI0ZGIxY2QzMWY5NmQ2Y2U0MWM0MzlhYjBjYTkzNjUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjF9	2015-02-17 10:45:04.211-06
\.


--
-- TOC entry 1959 (class 2606 OID 16434)
-- Name: auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- TOC entry 1965 (class 2606 OID 16444)
-- Name: auth_group_permissions_group_id_permission_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_key UNIQUE (group_id, permission_id);


--
-- TOC entry 1967 (class 2606 OID 16442)
-- Name: auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- TOC entry 1961 (class 2606 OID 16432)
-- Name: auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- TOC entry 1954 (class 2606 OID 16424)
-- Name: auth_permission_content_type_id_codename_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_key UNIQUE (content_type_id, codename);


--
-- TOC entry 1956 (class 2606 OID 16422)
-- Name: auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- TOC entry 1976 (class 2606 OID 16462)
-- Name: auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- TOC entry 1978 (class 2606 OID 16464)
-- Name: auth_user_groups_user_id_group_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_key UNIQUE (user_id, group_id);


--
-- TOC entry 1969 (class 2606 OID 16452)
-- Name: auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- TOC entry 1982 (class 2606 OID 16472)
-- Name: auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- TOC entry 1984 (class 2606 OID 16474)
-- Name: auth_user_user_permissions_user_id_permission_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_key UNIQUE (user_id, permission_id);


--
-- TOC entry 1972 (class 2606 OID 16454)
-- Name: auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- TOC entry 1988 (class 2606 OID 16530)
-- Name: django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- TOC entry 1949 (class 2606 OID 16414)
-- Name: django_content_type_app_label_3ec8c61c_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_app_label_3ec8c61c_uniq UNIQUE (app_label, model);


--
-- TOC entry 1951 (class 2606 OID 16412)
-- Name: django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- TOC entry 1947 (class 2606 OID 16404)
-- Name: django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- TOC entry 1991 (class 2606 OID 16550)
-- Name: django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- TOC entry 1957 (class 1259 OID 16481)
-- Name: auth_group_name_331666e8_like; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX auth_group_name_331666e8_like ON auth_group USING btree (name varchar_pattern_ops);


--
-- TOC entry 1962 (class 1259 OID 16492)
-- Name: auth_group_permissions_0e939a4f; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX auth_group_permissions_0e939a4f ON auth_group_permissions USING btree (group_id);


--
-- TOC entry 1963 (class 1259 OID 16493)
-- Name: auth_group_permissions_8373b171; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX auth_group_permissions_8373b171 ON auth_group_permissions USING btree (permission_id);


--
-- TOC entry 1952 (class 1259 OID 16480)
-- Name: auth_permission_417f1b1c; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX auth_permission_417f1b1c ON auth_permission USING btree (content_type_id);


--
-- TOC entry 1973 (class 1259 OID 16506)
-- Name: auth_user_groups_0e939a4f; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX auth_user_groups_0e939a4f ON auth_user_groups USING btree (group_id);


--
-- TOC entry 1974 (class 1259 OID 16505)
-- Name: auth_user_groups_e8701ad4; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX auth_user_groups_e8701ad4 ON auth_user_groups USING btree (user_id);


--
-- TOC entry 1979 (class 1259 OID 16518)
-- Name: auth_user_user_permissions_8373b171; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX auth_user_user_permissions_8373b171 ON auth_user_user_permissions USING btree (permission_id);


--
-- TOC entry 1980 (class 1259 OID 16517)
-- Name: auth_user_user_permissions_e8701ad4; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX auth_user_user_permissions_e8701ad4 ON auth_user_user_permissions USING btree (user_id);


--
-- TOC entry 1970 (class 1259 OID 16494)
-- Name: auth_user_username_94b8aae_like; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX auth_user_username_94b8aae_like ON auth_user USING btree (username varchar_pattern_ops);


--
-- TOC entry 1985 (class 1259 OID 16541)
-- Name: django_admin_log_417f1b1c; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX django_admin_log_417f1b1c ON django_admin_log USING btree (content_type_id);


--
-- TOC entry 1986 (class 1259 OID 16542)
-- Name: django_admin_log_e8701ad4; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX django_admin_log_e8701ad4 ON django_admin_log USING btree (user_id);


--
-- TOC entry 1989 (class 1259 OID 16551)
-- Name: django_session_de54fa62; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX django_session_de54fa62 ON django_session USING btree (expire_date);


--
-- TOC entry 1992 (class 1259 OID 16552)
-- Name: django_session_session_key_630ca218_like; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX django_session_session_key_630ca218_like ON django_session USING btree (session_key varchar_pattern_ops);


--
-- TOC entry 1995 (class 2606 OID 16487)
-- Name: auth_group_permiss_permission_id_23962d04_fk_auth_permission_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permiss_permission_id_23962d04_fk_auth_permission_id FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 1994 (class 2606 OID 16482)
-- Name: auth_group_permissions_group_id_58c48ba9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_58c48ba9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 1993 (class 2606 OID 16475)
-- Name: auth_permiss_content_type_id_51277a81_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permiss_content_type_id_51277a81_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 1997 (class 2606 OID 16500)
-- Name: auth_user_groups_group_id_30a071c9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_30a071c9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 1996 (class 2606 OID 16495)
-- Name: auth_user_groups_user_id_24702650_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_24702650_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 1999 (class 2606 OID 16512)
-- Name: auth_user_user_per_permission_id_3d7071f0_fk_auth_permission_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_per_permission_id_3d7071f0_fk_auth_permission_id FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 1998 (class 2606 OID 16507)
-- Name: auth_user_user_permissions_user_id_7cd7acb6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_7cd7acb6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2000 (class 2606 OID 16531)
-- Name: django_admin_content_type_id_5151027a_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_content_type_id_5151027a_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2001 (class 2606 OID 16536)
-- Name: django_admin_log_user_id_1c5f563_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_1c5f563_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2136 (class 0 OID 0)
-- Dependencies: 5
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2015-07-10 15:02:15

--
-- PostgreSQL database dump complete
--

\connect postgres

SET default_transaction_read_only = off;

--
-- PostgreSQL database dump
--

-- Dumped from database version 9.4.0
-- Dumped by pg_dump version 9.4.0
-- Started on 2015-07-10 15:02:16

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 1990 (class 1262 OID 12135)
-- Dependencies: 1989
-- Name: postgres; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON DATABASE postgres IS 'default administrative connection database';


--
-- TOC entry 173 (class 3079 OID 11855)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 1993 (class 0 OID 0)
-- Dependencies: 173
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- TOC entry 172 (class 3079 OID 16384)
-- Name: adminpack; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS adminpack WITH SCHEMA pg_catalog;


--
-- TOC entry 1994 (class 0 OID 0)
-- Dependencies: 172
-- Name: EXTENSION adminpack; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION adminpack IS 'administrative functions for PostgreSQL';


--
-- TOC entry 1992 (class 0 OID 0)
-- Dependencies: 5
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2015-07-10 15:02:17

--
-- PostgreSQL database dump complete
--

\connect scrum

SET default_transaction_read_only = off;

--
-- PostgreSQL database dump
--

-- Dumped from database version 9.4.0
-- Dumped by pg_dump version 9.4.0
-- Started on 2015-07-10 15:02:17

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 193 (class 3079 OID 11855)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2152 (class 0 OID 0)
-- Dependencies: 193
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 179 (class 1259 OID 24622)
-- Name: auth_group; Type: TABLE; Schema: public; Owner: sprint; Tablespace: 
--

CREATE TABLE auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


ALTER TABLE auth_group OWNER TO sprint;

--
-- TOC entry 178 (class 1259 OID 24620)
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: sprint
--

CREATE SEQUENCE auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_group_id_seq OWNER TO sprint;

--
-- TOC entry 2153 (class 0 OID 0)
-- Dependencies: 178
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sprint
--

ALTER SEQUENCE auth_group_id_seq OWNED BY auth_group.id;


--
-- TOC entry 181 (class 1259 OID 24632)
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: sprint; Tablespace: 
--

CREATE TABLE auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE auth_group_permissions OWNER TO sprint;

--
-- TOC entry 180 (class 1259 OID 24630)
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: sprint
--

CREATE SEQUENCE auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_group_permissions_id_seq OWNER TO sprint;

--
-- TOC entry 2154 (class 0 OID 0)
-- Dependencies: 180
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sprint
--

ALTER SEQUENCE auth_group_permissions_id_seq OWNED BY auth_group_permissions.id;


--
-- TOC entry 177 (class 1259 OID 24612)
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: sprint; Tablespace: 
--

CREATE TABLE auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE auth_permission OWNER TO sprint;

--
-- TOC entry 176 (class 1259 OID 24610)
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: sprint
--

CREATE SEQUENCE auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_permission_id_seq OWNER TO sprint;

--
-- TOC entry 2155 (class 0 OID 0)
-- Dependencies: 176
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sprint
--

ALTER SEQUENCE auth_permission_id_seq OWNED BY auth_permission.id;


--
-- TOC entry 183 (class 1259 OID 24642)
-- Name: auth_user; Type: TABLE; Schema: public; Owner: sprint; Tablespace: 
--

CREATE TABLE auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(30) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(30) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE auth_user OWNER TO sprint;

--
-- TOC entry 185 (class 1259 OID 24652)
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: sprint; Tablespace: 
--

CREATE TABLE auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE auth_user_groups OWNER TO sprint;

--
-- TOC entry 184 (class 1259 OID 24650)
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: sprint
--

CREATE SEQUENCE auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_user_groups_id_seq OWNER TO sprint;

--
-- TOC entry 2156 (class 0 OID 0)
-- Dependencies: 184
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sprint
--

ALTER SEQUENCE auth_user_groups_id_seq OWNED BY auth_user_groups.id;


--
-- TOC entry 182 (class 1259 OID 24640)
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: sprint
--

CREATE SEQUENCE auth_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_user_id_seq OWNER TO sprint;

--
-- TOC entry 2157 (class 0 OID 0)
-- Dependencies: 182
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sprint
--

ALTER SEQUENCE auth_user_id_seq OWNED BY auth_user.id;


--
-- TOC entry 187 (class 1259 OID 24662)
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: sprint; Tablespace: 
--

CREATE TABLE auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE auth_user_user_permissions OWNER TO sprint;

--
-- TOC entry 186 (class 1259 OID 24660)
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: sprint
--

CREATE SEQUENCE auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_user_user_permissions_id_seq OWNER TO sprint;

--
-- TOC entry 2158 (class 0 OID 0)
-- Dependencies: 186
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sprint
--

ALTER SEQUENCE auth_user_user_permissions_id_seq OWNED BY auth_user_user_permissions.id;


--
-- TOC entry 188 (class 1259 OID 24714)
-- Name: authtoken_token; Type: TABLE; Schema: public; Owner: sprint; Tablespace: 
--

CREATE TABLE authtoken_token (
    key character varying(40) NOT NULL,
    created timestamp with time zone NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE authtoken_token OWNER TO sprint;

--
-- TOC entry 190 (class 1259 OID 24729)
-- Name: board_sprint; Type: TABLE; Schema: public; Owner: sprint; Tablespace: 
--

CREATE TABLE board_sprint (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    description text NOT NULL,
    "end" date NOT NULL
);


ALTER TABLE board_sprint OWNER TO sprint;

--
-- TOC entry 189 (class 1259 OID 24727)
-- Name: board_sprint_id_seq; Type: SEQUENCE; Schema: public; Owner: sprint
--

CREATE SEQUENCE board_sprint_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE board_sprint_id_seq OWNER TO sprint;

--
-- TOC entry 2159 (class 0 OID 0)
-- Dependencies: 189
-- Name: board_sprint_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sprint
--

ALTER SEQUENCE board_sprint_id_seq OWNED BY board_sprint.id;


--
-- TOC entry 192 (class 1259 OID 24742)
-- Name: board_task; Type: TABLE; Schema: public; Owner: sprint; Tablespace: 
--

CREATE TABLE board_task (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    description text NOT NULL,
    status smallint NOT NULL,
    "order" smallint NOT NULL,
    started date,
    due date,
    completed date,
    assigned_id integer,
    sprint_id integer
);


ALTER TABLE board_task OWNER TO sprint;

--
-- TOC entry 191 (class 1259 OID 24740)
-- Name: board_task_id_seq; Type: SEQUENCE; Schema: public; Owner: sprint
--

CREATE SEQUENCE board_task_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE board_task_id_seq OWNER TO sprint;

--
-- TOC entry 2160 (class 0 OID 0)
-- Dependencies: 191
-- Name: board_task_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sprint
--

ALTER SEQUENCE board_task_id_seq OWNED BY board_task.id;


--
-- TOC entry 175 (class 1259 OID 24602)
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: sprint; Tablespace: 
--

CREATE TABLE django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE django_content_type OWNER TO sprint;

--
-- TOC entry 174 (class 1259 OID 24600)
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: sprint
--

CREATE SEQUENCE django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_content_type_id_seq OWNER TO sprint;

--
-- TOC entry 2161 (class 0 OID 0)
-- Dependencies: 174
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sprint
--

ALTER SEQUENCE django_content_type_id_seq OWNED BY django_content_type.id;


--
-- TOC entry 173 (class 1259 OID 24591)
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: sprint; Tablespace: 
--

CREATE TABLE django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE django_migrations OWNER TO sprint;

--
-- TOC entry 172 (class 1259 OID 24589)
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: sprint
--

CREATE SEQUENCE django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_migrations_id_seq OWNER TO sprint;

--
-- TOC entry 2162 (class 0 OID 0)
-- Dependencies: 172
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sprint
--

ALTER SEQUENCE django_migrations_id_seq OWNED BY django_migrations.id;


--
-- TOC entry 1946 (class 2604 OID 24625)
-- Name: id; Type: DEFAULT; Schema: public; Owner: sprint
--

ALTER TABLE ONLY auth_group ALTER COLUMN id SET DEFAULT nextval('auth_group_id_seq'::regclass);


--
-- TOC entry 1947 (class 2604 OID 24635)
-- Name: id; Type: DEFAULT; Schema: public; Owner: sprint
--

ALTER TABLE ONLY auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('auth_group_permissions_id_seq'::regclass);


--
-- TOC entry 1945 (class 2604 OID 24615)
-- Name: id; Type: DEFAULT; Schema: public; Owner: sprint
--

ALTER TABLE ONLY auth_permission ALTER COLUMN id SET DEFAULT nextval('auth_permission_id_seq'::regclass);


--
-- TOC entry 1948 (class 2604 OID 24645)
-- Name: id; Type: DEFAULT; Schema: public; Owner: sprint
--

ALTER TABLE ONLY auth_user ALTER COLUMN id SET DEFAULT nextval('auth_user_id_seq'::regclass);


--
-- TOC entry 1949 (class 2604 OID 24655)
-- Name: id; Type: DEFAULT; Schema: public; Owner: sprint
--

ALTER TABLE ONLY auth_user_groups ALTER COLUMN id SET DEFAULT nextval('auth_user_groups_id_seq'::regclass);


--
-- TOC entry 1950 (class 2604 OID 24665)
-- Name: id; Type: DEFAULT; Schema: public; Owner: sprint
--

ALTER TABLE ONLY auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('auth_user_user_permissions_id_seq'::regclass);


--
-- TOC entry 1951 (class 2604 OID 24732)
-- Name: id; Type: DEFAULT; Schema: public; Owner: sprint
--

ALTER TABLE ONLY board_sprint ALTER COLUMN id SET DEFAULT nextval('board_sprint_id_seq'::regclass);


--
-- TOC entry 1952 (class 2604 OID 24745)
-- Name: id; Type: DEFAULT; Schema: public; Owner: sprint
--

ALTER TABLE ONLY board_task ALTER COLUMN id SET DEFAULT nextval('board_task_id_seq'::regclass);


--
-- TOC entry 1944 (class 2604 OID 24605)
-- Name: id; Type: DEFAULT; Schema: public; Owner: sprint
--

ALTER TABLE ONLY django_content_type ALTER COLUMN id SET DEFAULT nextval('django_content_type_id_seq'::regclass);


--
-- TOC entry 1943 (class 2604 OID 24594)
-- Name: id; Type: DEFAULT; Schema: public; Owner: sprint
--

ALTER TABLE ONLY django_migrations ALTER COLUMN id SET DEFAULT nextval('django_migrations_id_seq'::regclass);


--
-- TOC entry 2131 (class 0 OID 24622)
-- Dependencies: 179
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: sprint
--

COPY auth_group (id, name) FROM stdin;
\.


--
-- TOC entry 2163 (class 0 OID 0)
-- Dependencies: 178
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sprint
--

SELECT pg_catalog.setval('auth_group_id_seq', 1, false);


--
-- TOC entry 2133 (class 0 OID 24632)
-- Dependencies: 181
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: sprint
--

COPY auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- TOC entry 2164 (class 0 OID 0)
-- Dependencies: 180
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sprint
--

SELECT pg_catalog.setval('auth_group_permissions_id_seq', 1, false);


--
-- TOC entry 2129 (class 0 OID 24612)
-- Dependencies: 177
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: sprint
--

COPY auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add permission	1	add_permission
2	Can change permission	1	change_permission
3	Can delete permission	1	delete_permission
4	Can add group	2	add_group
5	Can change group	2	change_group
6	Can delete group	2	delete_group
7	Can add user	3	add_user
8	Can change user	3	change_user
9	Can delete user	3	delete_user
10	Can add content type	4	add_contenttype
11	Can change content type	4	change_contenttype
12	Can delete content type	4	delete_contenttype
13	Can add token	5	add_token
14	Can change token	5	change_token
15	Can delete token	5	delete_token
16	Can add sprint	6	add_sprint
17	Can change sprint	6	change_sprint
18	Can delete sprint	6	delete_sprint
19	Can add task	7	add_task
20	Can change task	7	change_task
21	Can delete task	7	delete_task
\.


--
-- TOC entry 2165 (class 0 OID 0)
-- Dependencies: 176
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sprint
--

SELECT pg_catalog.setval('auth_permission_id_seq', 21, true);


--
-- TOC entry 2135 (class 0 OID 24642)
-- Dependencies: 183
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: sprint
--

COPY auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
1	pbkdf2_sha256$20000$0MsqLPw9zsIK$d0Q8rQ2j9L/b/lHBrrwQURQD/KB8EDIeWR5ZPi55Hs4=	\N	t	demo			demo@example.com	t	t	2015-07-01 20:54:26.829756-05
\.


--
-- TOC entry 2137 (class 0 OID 24652)
-- Dependencies: 185
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: sprint
--

COPY auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- TOC entry 2166 (class 0 OID 0)
-- Dependencies: 184
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sprint
--

SELECT pg_catalog.setval('auth_user_groups_id_seq', 1, false);


--
-- TOC entry 2167 (class 0 OID 0)
-- Dependencies: 182
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sprint
--

SELECT pg_catalog.setval('auth_user_id_seq', 2, true);


--
-- TOC entry 2139 (class 0 OID 24662)
-- Dependencies: 187
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: sprint
--

COPY auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- TOC entry 2168 (class 0 OID 0)
-- Dependencies: 186
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sprint
--

SELECT pg_catalog.setval('auth_user_user_permissions_id_seq', 1, false);


--
-- TOC entry 2140 (class 0 OID 24714)
-- Dependencies: 188
-- Data for Name: authtoken_token; Type: TABLE DATA; Schema: public; Owner: sprint
--

COPY authtoken_token (key, created, user_id) FROM stdin;
a33715d2c50facd2707fa60d1be206742dfab9fa	2015-07-03 16:33:48.54551-05	1
\.


--
-- TOC entry 2142 (class 0 OID 24729)
-- Dependencies: 190
-- Data for Name: board_sprint; Type: TABLE DATA; Schema: public; Owner: sprint
--

COPY board_sprint (id, name, description, "end") FROM stdin;
1	something sprint	test	2015-07-14
2	Current Sprint		2015-07-16
3	testing	final testing	2015-07-31
\.


--
-- TOC entry 2169 (class 0 OID 0)
-- Dependencies: 189
-- Name: board_sprint_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sprint
--

SELECT pg_catalog.setval('board_sprint_id_seq', 3, true);


--
-- TOC entry 2144 (class 0 OID 24742)
-- Dependencies: 192
-- Data for Name: board_task; Type: TABLE DATA; Schema: public; Owner: sprint
--

COPY board_task (id, name, description, status, "order", started, due, completed, assigned_id, sprint_id) FROM stdin;
1	first task		2	0	\N	\N	\N	1	1
2	Something Task		2	0	2015-07-02	\N	\N	1	2
\.


--
-- TOC entry 2170 (class 0 OID 0)
-- Dependencies: 191
-- Name: board_task_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sprint
--

SELECT pg_catalog.setval('board_task_id_seq', 2, true);


--
-- TOC entry 2127 (class 0 OID 24602)
-- Dependencies: 175
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: sprint
--

COPY django_content_type (id, app_label, model) FROM stdin;
1	auth	permission
2	auth	group
3	auth	user
4	contenttypes	contenttype
5	authtoken	token
6	board	sprint
7	board	task
\.


--
-- TOC entry 2171 (class 0 OID 0)
-- Dependencies: 174
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sprint
--

SELECT pg_catalog.setval('django_content_type_id_seq', 7, true);


--
-- TOC entry 2125 (class 0 OID 24591)
-- Dependencies: 173
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: sprint
--

COPY django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2015-07-01 20:52:44.227887-05
2	contenttypes	0002_remove_content_type_name	2015-07-01 20:52:44.259889-05
3	auth	0001_initial	2015-07-01 20:52:45.191943-05
4	auth	0002_alter_permission_name_max_length	2015-07-01 20:52:45.238945-05
5	auth	0003_alter_user_email_max_length	2015-07-01 20:52:45.310949-05
6	auth	0004_alter_user_username_opts	2015-07-01 20:52:45.32695-05
7	auth	0005_alter_user_last_login_null	2015-07-01 20:52:45.346951-05
8	auth	0006_require_contenttypes_0002	2015-07-01 20:52:45.348952-05
9	authtoken	0001_initial	2015-07-01 20:52:45.487959-05
10	board	0001_initial	2015-07-01 20:52:45.829979-05
\.


--
-- TOC entry 2172 (class 0 OID 0)
-- Dependencies: 172
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sprint
--

SELECT pg_catalog.setval('django_migrations_id_seq', 10, true);


--
-- TOC entry 1966 (class 2606 OID 24629)
-- Name: auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: sprint; Tablespace: 
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- TOC entry 1972 (class 2606 OID 24639)
-- Name: auth_group_permissions_group_id_permission_id_key; Type: CONSTRAINT; Schema: public; Owner: sprint; Tablespace: 
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_key UNIQUE (group_id, permission_id);


--
-- TOC entry 1974 (class 2606 OID 24637)
-- Name: auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: sprint; Tablespace: 
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- TOC entry 1968 (class 2606 OID 24627)
-- Name: auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: sprint; Tablespace: 
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- TOC entry 1961 (class 2606 OID 24619)
-- Name: auth_permission_content_type_id_codename_key; Type: CONSTRAINT; Schema: public; Owner: sprint; Tablespace: 
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_key UNIQUE (content_type_id, codename);


--
-- TOC entry 1963 (class 2606 OID 24617)
-- Name: auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: sprint; Tablespace: 
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- TOC entry 1983 (class 2606 OID 24657)
-- Name: auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: sprint; Tablespace: 
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- TOC entry 1985 (class 2606 OID 24659)
-- Name: auth_user_groups_user_id_group_id_key; Type: CONSTRAINT; Schema: public; Owner: sprint; Tablespace: 
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_key UNIQUE (user_id, group_id);


--
-- TOC entry 1976 (class 2606 OID 24647)
-- Name: auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: sprint; Tablespace: 
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- TOC entry 1989 (class 2606 OID 24667)
-- Name: auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: sprint; Tablespace: 
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- TOC entry 1991 (class 2606 OID 24669)
-- Name: auth_user_user_permissions_user_id_permission_id_key; Type: CONSTRAINT; Schema: public; Owner: sprint; Tablespace: 
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_key UNIQUE (user_id, permission_id);


--
-- TOC entry 1979 (class 2606 OID 24649)
-- Name: auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: sprint; Tablespace: 
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- TOC entry 1994 (class 2606 OID 24718)
-- Name: authtoken_token_pkey; Type: CONSTRAINT; Schema: public; Owner: sprint; Tablespace: 
--

ALTER TABLE ONLY authtoken_token
    ADD CONSTRAINT authtoken_token_pkey PRIMARY KEY (key);


--
-- TOC entry 1996 (class 2606 OID 24720)
-- Name: authtoken_token_user_id_key; Type: CONSTRAINT; Schema: public; Owner: sprint; Tablespace: 
--

ALTER TABLE ONLY authtoken_token
    ADD CONSTRAINT authtoken_token_user_id_key UNIQUE (user_id);


--
-- TOC entry 1998 (class 2606 OID 24739)
-- Name: board_sprint_end_key; Type: CONSTRAINT; Schema: public; Owner: sprint; Tablespace: 
--

ALTER TABLE ONLY board_sprint
    ADD CONSTRAINT board_sprint_end_key UNIQUE ("end");


--
-- TOC entry 2000 (class 2606 OID 24737)
-- Name: board_sprint_pkey; Type: CONSTRAINT; Schema: public; Owner: sprint; Tablespace: 
--

ALTER TABLE ONLY board_sprint
    ADD CONSTRAINT board_sprint_pkey PRIMARY KEY (id);


--
-- TOC entry 2004 (class 2606 OID 24750)
-- Name: board_task_pkey; Type: CONSTRAINT; Schema: public; Owner: sprint; Tablespace: 
--

ALTER TABLE ONLY board_task
    ADD CONSTRAINT board_task_pkey PRIMARY KEY (id);


--
-- TOC entry 1956 (class 2606 OID 24609)
-- Name: django_content_type_app_label_681114d8_uniq; Type: CONSTRAINT; Schema: public; Owner: sprint; Tablespace: 
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_app_label_681114d8_uniq UNIQUE (app_label, model);


--
-- TOC entry 1958 (class 2606 OID 24607)
-- Name: django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: sprint; Tablespace: 
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- TOC entry 1954 (class 2606 OID 24599)
-- Name: django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: sprint; Tablespace: 
--

ALTER TABLE ONLY django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- TOC entry 1964 (class 1259 OID 24676)
-- Name: auth_group_name_4575b5a7_like; Type: INDEX; Schema: public; Owner: sprint; Tablespace: 
--

CREATE INDEX auth_group_name_4575b5a7_like ON auth_group USING btree (name varchar_pattern_ops);


--
-- TOC entry 1969 (class 1259 OID 24687)
-- Name: auth_group_permissions_0e939a4f; Type: INDEX; Schema: public; Owner: sprint; Tablespace: 
--

CREATE INDEX auth_group_permissions_0e939a4f ON auth_group_permissions USING btree (group_id);


--
-- TOC entry 1970 (class 1259 OID 24688)
-- Name: auth_group_permissions_8373b171; Type: INDEX; Schema: public; Owner: sprint; Tablespace: 
--

CREATE INDEX auth_group_permissions_8373b171 ON auth_group_permissions USING btree (permission_id);


--
-- TOC entry 1959 (class 1259 OID 24675)
-- Name: auth_permission_417f1b1c; Type: INDEX; Schema: public; Owner: sprint; Tablespace: 
--

CREATE INDEX auth_permission_417f1b1c ON auth_permission USING btree (content_type_id);


--
-- TOC entry 1980 (class 1259 OID 24701)
-- Name: auth_user_groups_0e939a4f; Type: INDEX; Schema: public; Owner: sprint; Tablespace: 
--

CREATE INDEX auth_user_groups_0e939a4f ON auth_user_groups USING btree (group_id);


--
-- TOC entry 1981 (class 1259 OID 24700)
-- Name: auth_user_groups_e8701ad4; Type: INDEX; Schema: public; Owner: sprint; Tablespace: 
--

CREATE INDEX auth_user_groups_e8701ad4 ON auth_user_groups USING btree (user_id);


--
-- TOC entry 1986 (class 1259 OID 24713)
-- Name: auth_user_user_permissions_8373b171; Type: INDEX; Schema: public; Owner: sprint; Tablespace: 
--

CREATE INDEX auth_user_user_permissions_8373b171 ON auth_user_user_permissions USING btree (permission_id);


--
-- TOC entry 1987 (class 1259 OID 24712)
-- Name: auth_user_user_permissions_e8701ad4; Type: INDEX; Schema: public; Owner: sprint; Tablespace: 
--

CREATE INDEX auth_user_user_permissions_e8701ad4 ON auth_user_user_permissions USING btree (user_id);


--
-- TOC entry 1977 (class 1259 OID 24689)
-- Name: auth_user_username_2e48a5a7_like; Type: INDEX; Schema: public; Owner: sprint; Tablespace: 
--

CREATE INDEX auth_user_username_2e48a5a7_like ON auth_user USING btree (username varchar_pattern_ops);


--
-- TOC entry 1992 (class 1259 OID 24726)
-- Name: authtoken_token_key_6f26c177_like; Type: INDEX; Schema: public; Owner: sprint; Tablespace: 
--

CREATE INDEX authtoken_token_key_6f26c177_like ON authtoken_token USING btree (key varchar_pattern_ops);


--
-- TOC entry 2001 (class 1259 OID 24761)
-- Name: board_task_353d15b6; Type: INDEX; Schema: public; Owner: sprint; Tablespace: 
--

CREATE INDEX board_task_353d15b6 ON board_task USING btree (assigned_id);


--
-- TOC entry 2002 (class 1259 OID 24762)
-- Name: board_task_b688f27b; Type: INDEX; Schema: public; Owner: sprint; Tablespace: 
--

CREATE INDEX board_task_b688f27b ON board_task USING btree (sprint_id);


--
-- TOC entry 2007 (class 2606 OID 24682)
-- Name: auth_group_permiss_permission_id_38612ab5_fk_auth_permission_id; Type: FK CONSTRAINT; Schema: public; Owner: sprint
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permiss_permission_id_38612ab5_fk_auth_permission_id FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2006 (class 2606 OID 24677)
-- Name: auth_group_permissions_group_id_561ec922_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: sprint
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_561ec922_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2005 (class 2606 OID 24670)
-- Name: auth_permiss_content_type_id_417e2d76_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: sprint
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permiss_content_type_id_417e2d76_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2009 (class 2606 OID 24695)
-- Name: auth_user_groups_group_id_53d93048_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: sprint
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_53d93048_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2008 (class 2606 OID 24690)
-- Name: auth_user_groups_user_id_7eb2cd8f_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: sprint
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_7eb2cd8f_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2011 (class 2606 OID 24707)
-- Name: auth_user_user_per_permission_id_42c62eba_fk_auth_permission_id; Type: FK CONSTRAINT; Schema: public; Owner: sprint
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_per_permission_id_42c62eba_fk_auth_permission_id FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2010 (class 2606 OID 24702)
-- Name: auth_user_user_permissions_user_id_6283f7f0_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: sprint
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_6283f7f0_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2012 (class 2606 OID 24721)
-- Name: authtoken_token_user_id_66dc8b9d_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: sprint
--

ALTER TABLE ONLY authtoken_token
    ADD CONSTRAINT authtoken_token_user_id_66dc8b9d_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2013 (class 2606 OID 24751)
-- Name: board_task_assigned_id_325e8476_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: sprint
--

ALTER TABLE ONLY board_task
    ADD CONSTRAINT board_task_assigned_id_325e8476_fk_auth_user_id FOREIGN KEY (assigned_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2014 (class 2606 OID 24756)
-- Name: board_task_sprint_id_20c22f22_fk_board_sprint_id; Type: FK CONSTRAINT; Schema: public; Owner: sprint
--

ALTER TABLE ONLY board_task
    ADD CONSTRAINT board_task_sprint_id_20c22f22_fk_board_sprint_id FOREIGN KEY (sprint_id) REFERENCES board_sprint(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2151 (class 0 OID 0)
-- Dependencies: 5
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- TOC entry 1609 (class 826 OID 24587)
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: -; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres REVOKE ALL ON TABLES  FROM PUBLIC;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres REVOKE ALL ON TABLES  FROM postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres GRANT ALL ON TABLES  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres GRANT ALL ON TABLES  TO PUBLIC;


-- Completed on 2015-07-10 15:02:18

--
-- PostgreSQL database dump complete
--

\connect template1

SET default_transaction_read_only = off;

--
-- PostgreSQL database dump
--

-- Dumped from database version 9.4.0
-- Dumped by pg_dump version 9.4.0
-- Started on 2015-07-10 15:02:18

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 1989 (class 1262 OID 1)
-- Dependencies: 1988
-- Name: template1; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON DATABASE template1 IS 'default template for new databases';


--
-- TOC entry 172 (class 3079 OID 11855)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 1992 (class 0 OID 0)
-- Dependencies: 172
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- TOC entry 1991 (class 0 OID 0)
-- Dependencies: 5
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2015-07-10 15:02:21

--
-- PostgreSQL database dump complete
--

-- Completed on 2015-07-10 15:02:21

--
-- PostgreSQL database cluster dump complete
--

