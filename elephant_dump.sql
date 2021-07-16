--
-- PostgreSQL database dump
--

-- Dumped from database version 12.5 (Ubuntu 12.5-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.5 (Ubuntu 12.5-0ubuntu0.20.04.1)

SET statement_timeout = 0;
SET lock_timeout = 0;
-- SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

-- SET default_table_access_method = heap;

--
-- Name: active_storage_attachments; Type: TABLE; Schema: public; Owner: elephant
--

CREATE TABLE public.active_storage_attachments (
    id bigint NOT NULL,
    name character varying NOT NULL,
    record_type character varying NOT NULL,
    record_id bigint NOT NULL,
    blob_id bigint NOT NULL,
    created_at timestamp without time zone NOT NULL
);


ALTER TABLE public.active_storage_attachments OWNER TO elephant;

--
-- Name: active_storage_attachments_id_seq; Type: SEQUENCE; Schema: public; Owner: elephant
--

CREATE SEQUENCE public.active_storage_attachments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.active_storage_attachments_id_seq OWNER TO elephant;

--
-- Name: active_storage_attachments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: elephant
--

ALTER SEQUENCE public.active_storage_attachments_id_seq OWNED BY public.active_storage_attachments.id;


--
-- Name: active_storage_blobs; Type: TABLE; Schema: public; Owner: elephant
--

CREATE TABLE public.active_storage_blobs (
    id bigint NOT NULL,
    key character varying NOT NULL,
    filename character varying NOT NULL,
    content_type character varying,
    metadata text,
    byte_size bigint NOT NULL,
    checksum character varying NOT NULL,
    created_at timestamp without time zone NOT NULL
);


ALTER TABLE public.active_storage_blobs OWNER TO elephant;

--
-- Name: active_storage_blobs_id_seq; Type: SEQUENCE; Schema: public; Owner: elephant
--

CREATE SEQUENCE public.active_storage_blobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.active_storage_blobs_id_seq OWNER TO elephant;

--
-- Name: active_storage_blobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: elephant
--

ALTER SEQUENCE public.active_storage_blobs_id_seq OWNED BY public.active_storage_blobs.id;


--
-- Name: addresses; Type: TABLE; Schema: public; Owner: elephant
--

CREATE TABLE public.addresses (
    id bigint NOT NULL,
    cep character varying,
    number integer,
    street character varying,
    city character varying,
    uf character varying,
    user_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    complement character varying,
    neighborhood character varying
);


ALTER TABLE public.addresses OWNER TO elephant;

--
-- Name: addresses_id_seq; Type: SEQUENCE; Schema: public; Owner: elephant
--

CREATE SEQUENCE public.addresses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.addresses_id_seq OWNER TO elephant;

--
-- Name: addresses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: elephant
--

ALTER SEQUENCE public.addresses_id_seq OWNED BY public.addresses.id;


--
-- Name: admins; Type: TABLE; Schema: public; Owner: elephant
--

CREATE TABLE public.admins (
    id bigint NOT NULL,
    email character varying DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying,
    reset_password_sent_at timestamp without time zone,
    remember_created_at timestamp without time zone,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.admins OWNER TO elephant;

--
-- Name: admins_id_seq; Type: SEQUENCE; Schema: public; Owner: elephant
--

CREATE SEQUENCE public.admins_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.admins_id_seq OWNER TO elephant;

--
-- Name: admins_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: elephant
--

ALTER SEQUENCE public.admins_id_seq OWNED BY public.admins.id;


--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: elephant
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.ar_internal_metadata OWNER TO elephant;

--
-- Name: atestados; Type: TABLE; Schema: public; Owner: elephant
--

CREATE TABLE public.atestados (
    id bigint NOT NULL,
    text character varying,
    cidade character varying,
    crp character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    patient_id bigint
);


ALTER TABLE public.atestados OWNER TO elephant;

--
-- Name: atestados_id_seq; Type: SEQUENCE; Schema: public; Owner: elephant
--

CREATE SEQUENCE public.atestados_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.atestados_id_seq OWNER TO elephant;

--
-- Name: atestados_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: elephant
--

ALTER SEQUENCE public.atestados_id_seq OWNED BY public.atestados.id;


--
-- Name: configs; Type: TABLE; Schema: public; Owner: elephant
--

CREATE TABLE public.configs (
    id bigint NOT NULL,
    name character varying,
    value character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.configs OWNER TO elephant;

--
-- Name: configs_id_seq; Type: SEQUENCE; Schema: public; Owner: elephant
--

CREATE SEQUENCE public.configs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.configs_id_seq OWNER TO elephant;

--
-- Name: configs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: elephant
--

ALTER SEQUENCE public.configs_id_seq OWNED BY public.configs.id;


--
-- Name: declaracoes; Type: TABLE; Schema: public; Owner: elephant
--

CREATE TABLE public.declaracoes (
    id bigint NOT NULL,
    crp character varying,
    text character varying,
    city character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    patient_id bigint
);


ALTER TABLE public.declaracoes OWNER TO elephant;

--
-- Name: declaracoes_id_seq; Type: SEQUENCE; Schema: public; Owner: elephant
--

CREATE SEQUENCE public.declaracoes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.declaracoes_id_seq OWNER TO elephant;

--
-- Name: declaracoes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: elephant
--

ALTER SEQUENCE public.declaracoes_id_seq OWNED BY public.declaracoes.id;


--
-- Name: forms; Type: TABLE; Schema: public; Owner: elephant
--

CREATE TABLE public.forms (
    id bigint NOT NULL,
    patient_id bigint,
    personal_moment character varying,
    profissional_moment character varying,
    interests character varying,
    conclusions character varying,
    intelectual_map character varying[] DEFAULT '{}'::character varying[],
    personalities_characteristics character varying[] DEFAULT '{}'::character varying[],
    facilities character varying[] DEFAULT '{}'::character varying[],
    dificulties character varying[] DEFAULT '{}'::character varying[],
    psicological_concepts integer[] DEFAULT '{}'::integer[],
    performance_diagnostic character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.forms OWNER TO elephant;

--
-- Name: forms_id_seq; Type: SEQUENCE; Schema: public; Owner: elephant
--

CREATE SEQUENCE public.forms_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.forms_id_seq OWNER TO elephant;

--
-- Name: forms_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: elephant
--

ALTER SEQUENCE public.forms_id_seq OWNED BY public.forms.id;


--
-- Name: formularios; Type: TABLE; Schema: public; Owner: elephant
--

CREATE TABLE public.formularios (
    id bigint NOT NULL,
    content json,
    kind character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    patient_id bigint,
    identifier integer
);


ALTER TABLE public.formularios OWNER TO elephant;

--
-- Name: formularios_id_seq; Type: SEQUENCE; Schema: public; Owner: elephant
--

CREATE SEQUENCE public.formularios_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.formularios_id_seq OWNER TO elephant;

--
-- Name: formularios_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: elephant
--

ALTER SEQUENCE public.formularios_id_seq OWNED BY public.formularios.id;


--
-- Name: graficos; Type: TABLE; Schema: public; Owner: elephant
--

CREATE TABLE public.graficos (
    id bigint NOT NULL,
    data json,
    kind character varying DEFAULT 'bar'::character varying,
    title character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    laudo_id bigint,
    image character varying
);


ALTER TABLE public.graficos OWNER TO elephant;

--
-- Name: graficos_id_seq; Type: SEQUENCE; Schema: public; Owner: elephant
--

CREATE SEQUENCE public.graficos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.graficos_id_seq OWNER TO elephant;

--
-- Name: graficos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: elephant
--

ALTER SEQUENCE public.graficos_id_seq OWNED BY public.graficos.id;


--
-- Name: laudos; Type: TABLE; Schema: public; Owner: elephant
--

CREATE TABLE public.laudos (
    id bigint NOT NULL,
    crp character varying,
    solicitante character varying,
    description character varying,
    procedure character varying,
    analysis character varying,
    conclusion character varying,
    "references" character varying,
    kind character varying DEFAULT 'psicologico'::character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    patient_id bigint
);


ALTER TABLE public.laudos OWNER TO elephant;

--
-- Name: laudos_id_seq; Type: SEQUENCE; Schema: public; Owner: elephant
--

CREATE SEQUENCE public.laudos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.laudos_id_seq OWNER TO elephant;

--
-- Name: laudos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: elephant
--

ALTER SEQUENCE public.laudos_id_seq OWNED BY public.laudos.id;


--
-- Name: notifications; Type: TABLE; Schema: public; Owner: elephant
--

CREATE TABLE public.notifications (
    id bigint NOT NULL,
    status integer DEFAULT 0,
    data character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.notifications OWNER TO elephant;

--
-- Name: notifications_id_seq; Type: SEQUENCE; Schema: public; Owner: elephant
--

CREATE SEQUENCE public.notifications_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.notifications_id_seq OWNER TO elephant;

--
-- Name: notifications_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: elephant
--

ALTER SEQUENCE public.notifications_id_seq OWNED BY public.notifications.id;


--
-- Name: office_visits; Type: TABLE; Schema: public; Owner: elephant
--

CREATE TABLE public.office_visits (
    id bigint NOT NULL,
    patient_id bigint,
    date date,
    hour character varying,
    description character varying,
    value double precision,
    documents json,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.office_visits OWNER TO elephant;

--
-- Name: office_visits_id_seq; Type: SEQUENCE; Schema: public; Owner: elephant
--

CREATE SEQUENCE public.office_visits_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.office_visits_id_seq OWNER TO elephant;

--
-- Name: office_visits_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: elephant
--

ALTER SEQUENCE public.office_visits_id_seq OWNED BY public.office_visits.id;


--
-- Name: parcels; Type: TABLE; Schema: public; Owner: elephant
--

CREATE TABLE public.parcels (
    id bigint NOT NULL,
    office_visit_id bigint,
    value double precision,
    observation character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.parcels OWNER TO elephant;

--
-- Name: parcels_id_seq; Type: SEQUENCE; Schema: public; Owner: elephant
--

CREATE SEQUENCE public.parcels_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.parcels_id_seq OWNER TO elephant;

--
-- Name: parcels_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: elephant
--

ALTER SEQUENCE public.parcels_id_seq OWNED BY public.parcels.id;


--
-- Name: pareceres; Type: TABLE; Schema: public; Owner: elephant
--

CREATE TABLE public.pareceres (
    id bigint NOT NULL,
    crp character varying,
    created_at timestamp without time zone NOT NULL,
    description character varying,
    analysis character varying,
    conclusion character varying,
    "references" character varying,
    updated_at timestamp without time zone NOT NULL,
    patient_id bigint
);


ALTER TABLE public.pareceres OWNER TO elephant;

--
-- Name: pareceres_id_seq; Type: SEQUENCE; Schema: public; Owner: elephant
--

CREATE SEQUENCE public.pareceres_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pareceres_id_seq OWNER TO elephant;

--
-- Name: pareceres_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: elephant
--

ALTER SEQUENCE public.pareceres_id_seq OWNED BY public.pareceres.id;


--
-- Name: patients; Type: TABLE; Schema: public; Owner: elephant
--

CREATE TABLE public.patients (
    id bigint NOT NULL,
    user_id bigint,
    avatar json,
    name character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    code character varying,
    birth_date date,
    gender integer,
    phone character varying,
    relative_phone character varying,
    profession character varying,
    cpf character varying,
    naturalidade character varying,
    address_id bigint
);


ALTER TABLE public.patients OWNER TO elephant;

--
-- Name: patients_id_seq; Type: SEQUENCE; Schema: public; Owner: elephant
--

CREATE SEQUENCE public.patients_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.patients_id_seq OWNER TO elephant;

--
-- Name: patients_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: elephant
--

ALTER SEQUENCE public.patients_id_seq OWNED BY public.patients.id;


--
-- Name: relatorios; Type: TABLE; Schema: public; Owner: elephant
--

CREATE TABLE public.relatorios (
    id bigint NOT NULL,
    crp character varying,
    atendido character varying,
    solicitante character varying,
    description character varying,
    procedure character varying,
    analysis character varying,
    conclusion character varying,
    goal character varying,
    kind character varying DEFAULT 'psicologico'::character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    patient_id bigint
);


ALTER TABLE public.relatorios OWNER TO elephant;

--
-- Name: relatorios_id_seq; Type: SEQUENCE; Schema: public; Owner: elephant
--

CREATE SEQUENCE public.relatorios_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.relatorios_id_seq OWNER TO elephant;

--
-- Name: relatorios_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: elephant
--

ALTER SEQUENCE public.relatorios_id_seq OWNED BY public.relatorios.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: elephant
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO elephant;

--
-- Name: subscriptions; Type: TABLE; Schema: public; Owner: elephant
--

CREATE TABLE public.subscriptions (
    id bigint NOT NULL,
    status integer,
    mercado_pago_id character varying,
    user_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    pag_seguro_id character varying
);


ALTER TABLE public.subscriptions OWNER TO elephant;

--
-- Name: subscriptions_id_seq; Type: SEQUENCE; Schema: public; Owner: elephant
--

CREATE SEQUENCE public.subscriptions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.subscriptions_id_seq OWNER TO elephant;

--
-- Name: subscriptions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: elephant
--

ALTER SEQUENCE public.subscriptions_id_seq OWNED BY public.subscriptions.id;


--
-- Name: user_preferences; Type: TABLE; Schema: public; Owner: elephant
--

CREATE TABLE public.user_preferences (
    id bigint NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    user_id bigint
);


ALTER TABLE public.user_preferences OWNER TO elephant;

--
-- Name: user_preferences_id_seq; Type: SEQUENCE; Schema: public; Owner: elephant
--

CREATE SEQUENCE public.user_preferences_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_preferences_id_seq OWNER TO elephant;

--
-- Name: user_preferences_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: elephant
--

ALTER SEQUENCE public.user_preferences_id_seq OWNED BY public.user_preferences.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: elephant
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    email character varying DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying,
    reset_password_sent_at timestamp without time zone,
    remember_created_at timestamp without time zone,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    mercado_pago_id character varying,
    document_number character varying,
    document_type character varying DEFAULT 'CPF'::character varying,
    phone character varying,
    first_name character varying,
    last_name character varying,
    birth_date date,
    terms_of_service boolean DEFAULT false NOT NULL
);


ALTER TABLE public.users OWNER TO elephant;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: elephant
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO elephant;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: elephant
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: active_storage_attachments id; Type: DEFAULT; Schema: public; Owner: elephant
--

ALTER TABLE ONLY public.active_storage_attachments ALTER COLUMN id SET DEFAULT nextval('public.active_storage_attachments_id_seq'::regclass);


--
-- Name: active_storage_blobs id; Type: DEFAULT; Schema: public; Owner: elephant
--

ALTER TABLE ONLY public.active_storage_blobs ALTER COLUMN id SET DEFAULT nextval('public.active_storage_blobs_id_seq'::regclass);


--
-- Name: addresses id; Type: DEFAULT; Schema: public; Owner: elephant
--

ALTER TABLE ONLY public.addresses ALTER COLUMN id SET DEFAULT nextval('public.addresses_id_seq'::regclass);


--
-- Name: admins id; Type: DEFAULT; Schema: public; Owner: elephant
--

ALTER TABLE ONLY public.admins ALTER COLUMN id SET DEFAULT nextval('public.admins_id_seq'::regclass);


--
-- Name: atestados id; Type: DEFAULT; Schema: public; Owner: elephant
--

ALTER TABLE ONLY public.atestados ALTER COLUMN id SET DEFAULT nextval('public.atestados_id_seq'::regclass);


--
-- Name: configs id; Type: DEFAULT; Schema: public; Owner: elephant
--

ALTER TABLE ONLY public.configs ALTER COLUMN id SET DEFAULT nextval('public.configs_id_seq'::regclass);


--
-- Name: declaracoes id; Type: DEFAULT; Schema: public; Owner: elephant
--

ALTER TABLE ONLY public.declaracoes ALTER COLUMN id SET DEFAULT nextval('public.declaracoes_id_seq'::regclass);


--
-- Name: forms id; Type: DEFAULT; Schema: public; Owner: elephant
--

ALTER TABLE ONLY public.forms ALTER COLUMN id SET DEFAULT nextval('public.forms_id_seq'::regclass);


--
-- Name: formularios id; Type: DEFAULT; Schema: public; Owner: elephant
--

ALTER TABLE ONLY public.formularios ALTER COLUMN id SET DEFAULT nextval('public.formularios_id_seq'::regclass);


--
-- Name: graficos id; Type: DEFAULT; Schema: public; Owner: elephant
--

ALTER TABLE ONLY public.graficos ALTER COLUMN id SET DEFAULT nextval('public.graficos_id_seq'::regclass);


--
-- Name: laudos id; Type: DEFAULT; Schema: public; Owner: elephant
--

ALTER TABLE ONLY public.laudos ALTER COLUMN id SET DEFAULT nextval('public.laudos_id_seq'::regclass);


--
-- Name: notifications id; Type: DEFAULT; Schema: public; Owner: elephant
--

ALTER TABLE ONLY public.notifications ALTER COLUMN id SET DEFAULT nextval('public.notifications_id_seq'::regclass);


--
-- Name: office_visits id; Type: DEFAULT; Schema: public; Owner: elephant
--

ALTER TABLE ONLY public.office_visits ALTER COLUMN id SET DEFAULT nextval('public.office_visits_id_seq'::regclass);


--
-- Name: parcels id; Type: DEFAULT; Schema: public; Owner: elephant
--

ALTER TABLE ONLY public.parcels ALTER COLUMN id SET DEFAULT nextval('public.parcels_id_seq'::regclass);


--
-- Name: pareceres id; Type: DEFAULT; Schema: public; Owner: elephant
--

ALTER TABLE ONLY public.pareceres ALTER COLUMN id SET DEFAULT nextval('public.pareceres_id_seq'::regclass);


--
-- Name: patients id; Type: DEFAULT; Schema: public; Owner: elephant
--

ALTER TABLE ONLY public.patients ALTER COLUMN id SET DEFAULT nextval('public.patients_id_seq'::regclass);


--
-- Name: relatorios id; Type: DEFAULT; Schema: public; Owner: elephant
--

ALTER TABLE ONLY public.relatorios ALTER COLUMN id SET DEFAULT nextval('public.relatorios_id_seq'::regclass);


--
-- Name: subscriptions id; Type: DEFAULT; Schema: public; Owner: elephant
--

ALTER TABLE ONLY public.subscriptions ALTER COLUMN id SET DEFAULT nextval('public.subscriptions_id_seq'::regclass);


--
-- Name: user_preferences id; Type: DEFAULT; Schema: public; Owner: elephant
--

ALTER TABLE ONLY public.user_preferences ALTER COLUMN id SET DEFAULT nextval('public.user_preferences_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: elephant
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: active_storage_attachments; Type: TABLE DATA; Schema: public; Owner: elephant
--

COPY public.active_storage_attachments (id, name, record_type, record_id, blob_id, created_at) FROM stdin;
1	papel_timbrado	UserPreference	3	1	2021-01-23 03:12:20.469742
2	papel_timbrado	UserPreference	6	2	2021-01-23 03:14:17.957568
3	papel_timbrado	UserPreference	10	3	2021-01-23 03:22:36.99196
4	papel_timbrado	UserPreference	14	4	2021-01-23 03:23:10.881642
5	papel_timbrado	UserPreference	18	5	2021-01-23 03:24:48.065728
16	papel_timbrado	UserPreference	24	16	2021-01-23 19:36:33.729212
28	papel_timbrado	UserPreference	37	28	2021-01-25 14:50:21.053304
34	papel_timbrado	UserPreference	23	34	2021-01-28 14:49:41.863658
46	papel_timbrado	UserPreference	36	46	2021-02-03 13:28:30.154169
48	papel_timbrado	UserPreference	42	48	2021-02-04 00:46:06.773421
49	papel_timbrado	UserPreference	40	49	2021-02-05 16:40:03.845609
50	papel_timbrado	UserPreference	38	50	2021-02-05 18:20:12.530934
\.


--
-- Data for Name: active_storage_blobs; Type: TABLE DATA; Schema: public; Owner: elephant
--

COPY public.active_storage_blobs (id, key, filename, content_type, metadata, byte_size, checksum, created_at) FROM stdin;
1	RJNKWtqz6HkErNGGXVddcoWk	timbrado2.png	image/png	{"identified":true,"width":595,"height":841,"analyzed":true}	36017	/fcdrpAqoZ80L4aB7U/E7g==	2021-01-23 03:12:20.127474
2	2eAT3Zkoig1haBNfa5Ce7CeN	timbrado2.png	image/png	{"identified":true,"width":595,"height":841,"analyzed":true}	36017	/fcdrpAqoZ80L4aB7U/E7g==	2021-01-23 03:14:17.955022
3	ewjujJxpr6aqxN8pRLMjb2Bd	timbrado2.png	image/png	{"identified":true,"width":595,"height":841,"analyzed":true}	36017	/fcdrpAqoZ80L4aB7U/E7g==	2021-01-23 03:22:36.97631
4	krHHzJursfd3782pFQ8gNQGy	timbrado2.png	image/png	{"identified":true,"width":595,"height":841,"analyzed":true}	36017	/fcdrpAqoZ80L4aB7U/E7g==	2021-01-23 03:23:10.87993
5	pr7Jx3U5YAs3AYmpkZCMC4Xt	timbrado2.png	image/png	{"identified":true,"width":595,"height":841,"analyzed":true}	36017	/fcdrpAqoZ80L4aB7U/E7g==	2021-01-23 03:24:48.063543
21	Abdnt6xpwVfPSJF7tQd2oUFH	lanches.png	image/png	{"identified":true,"width":549,"height":595,"analyzed":true}	207781	wXdy6Q6hpj4KjTlEs/P5rg==	2021-01-25 13:36:21.61433
34	gkNWDPoGpNf6dqma8RbVKh67	Verde-Azulado e Branco Cabeça de Urso Caridade Papel Timbrado (2).jpg	image/jpeg	{"identified":true,"width":3535,"height":5000,"analyzed":true}	346756	eYvP91Y4j2ZsyoicW7Pjow==	2021-01-28 14:49:41.858818
16	cRzHavcJeab28E92tnu34wTZ	4CF27C55-7C30-44EC-8469-3E8415B00C68.jpeg	image/jpeg	{"identified":true,"width":1280,"height":793,"analyzed":true}	55040	GoLexau6CW2sgQ2yv5BIMg==	2021-01-23 19:36:33.725648
17	GTGhvFKBXrANh6NmpAWYFdHg	FOD.png	image/png	{"identified":true,"width":2121,"height":3000,"analyzed":true}	193065	+nX5QbvZ7b8sfDL93gZJcw==	2021-01-23 21:17:51.754499
18	xXVQct9o8xQ58hWQVmn33Q6a	Verde-Azulado e Branco Cabeça de Urso Caridade Papel Timbrado (1).png	image/png	{"identified":true,"width":2121,"height":3000,"analyzed":true}	187672	narTtdngRo/d6Encilo9oQ==	2021-01-23 21:20:44.039672
35	w9FGD9q2yajZBHYfE6qHyokS	Verde-Azulado e Branco Cabeça de Urso Caridade Papel Timbrado (2).jpg	image/jpeg	{"identified":true,"width":3535,"height":5000,"analyzed":true}	346756	eYvP91Y4j2ZsyoicW7Pjow==	2021-01-29 17:23:00.416135
36	Tu8neycQdER8fS5WCoUjhJGT	Verde-Azulado e Branco Cabeça de Urso Caridade Papel Timbrado (2).jpg	image/jpeg	{"identified":true,"width":3535,"height":5000,"analyzed":true}	346756	eYvP91Y4j2ZsyoicW7Pjow==	2021-01-29 17:25:53.120923
25	EupYWvGr4XKGB5fwZhKbbL1L	test.png	image/png	{"identified":true,"width":1190,"height":1684,"analyzed":true}	9098	682WqjvVE1jQTARF7IOUhg==	2021-01-25 14:20:19.077697
28	kkfhvzuh7zvnMcLhmVrCWdxd	Cinza Linhas Formas Geométricas Arquitetura Empresa EUA Papel Timbrado (1).png	image/png	{"identified":true,"width":1545,"height":2000,"analyzed":true}	34830	fQvTuVOi5/nV0FqlbEyM8g==	2021-01-25 14:50:21.04139
31	cbzjucNLPyUvpkVNyGxwrbDS	Verde-Azulado e Branco Cabeça de Urso Caridade Papel Timbrado (1).png	image/png	{"identified":true,"width":2828,"height":4000,"analyzed":true}	496215	iRjh5p4mrLa7e8rtzGeNfg==	2021-01-28 03:23:46.069699
38	fPvGGgKneE47aBXPZsFBjqCB	Verde-Azulado e Branco Cabeça de Urso Caridade Papel Timbrado (2).jpg	image/jpeg	{"identified":true,"width":3535,"height":5000,"analyzed":true}	346756	eYvP91Y4j2ZsyoicW7Pjow==	2021-01-29 17:58:30.713181
40	EJ42CL15axrmgSP6pYCJkoZZ	Verde-Azulado e Branco Cabeça de Urso Caridade Papel Timbrado (2).jpg	image/jpeg	{"identified":true,"width":3535,"height":5000,"analyzed":true}	346756	eYvP91Y4j2ZsyoicW7Pjow==	2021-01-29 18:10:22.524899
42	tVLYKpAtYM6zvtrGUgJnAYr6	Verde-Azulado e Branco Cabeça de Urso Caridade Papel Timbrado (2).jpg	image/jpeg	{"identified":true,"width":3535,"height":5000,"analyzed":true}	346756	eYvP91Y4j2ZsyoicW7Pjow==	2021-01-29 18:54:52.006344
46	tLDsy7JUVKfNUXysMGTbX1wC	letterhead.jpg	image/jpeg	{"identified":true,"width":580,"height":740,"analyzed":true}	11415	gE9LNioDrI0NtKRz8Ey/vg==	2021-02-03 13:28:30.146428
48	QhBw1b3gi8XmGdWWMbDiJKnF	Pastel Folhas Desenhadas à Mão Artista Papel Timbrado.jpg	image/jpeg	{"identified":true,"width":1414,"height":2000,"analyzed":true}	179555	1skZhub4puk5mKFTQYI0Dw==	2021-02-04 00:46:06.765731
49	WWA2qMYUfcYizQZRjdVnfsLq	tais machado 2 (7).png	image/png	{"identified":true,"width":3236,"height":1419,"analyzed":true}	654946	4NHxlc0aiw2HFNJW4cthUQ==	2021-02-05 16:40:03.832645
50	3xbbRnK3kF3TaDtRd6giLKGv	Design sem nome (1).png	image/png	{"identified":true,"width":2828,"height":4000,"analyzed":true}	229792	P1hQ4f9ygH7/rrm9VASEyA==	2021-02-05 18:20:12.522812
\.


--
-- Data for Name: addresses; Type: TABLE DATA; Schema: public; Owner: elephant
--

COPY public.addresses (id, cep, number, street, city, uf, user_id, created_at, updated_at, complement, neighborhood) FROM stdin;
1	28180-000	1	Beira da linha	Campos dos Goytacazes	RJ	1	2021-01-15 01:03:54.907906	2021-01-15 01:03:54.907906	casa	Outeiro
2	28180-000	1	Beira da linha	Campos dos Goytacazes	RJ	2	2021-01-15 16:59:54.634775	2021-01-15 16:59:54.634775	casa	Outeiro
3	28035-005	22	Rua Visconde de Inhaúma, 22	Campos dos Goytacazes	RJ	3	2021-01-18 12:50:54.816402	2021-01-18 12:50:54.816402	Apto 1404	Parque Tamandaré
4	03062-000	123	Rua Herval	Acrelândia	AC	4	2021-01-19 18:21:45.247367	2021-01-19 18:21:45.247367	casa	belem
5	28180-000	1	Beira da linha	Campos dos Goytacazes	RJ	5	2021-01-21 01:13:32.973934	2021-01-21 01:13:32.973934	casa	Outeiro
6	28080-000	70	Av. Francisco Lamego	Campos dos Goytacazes	RJ	6	2021-01-23 14:22:51.270437	2021-01-23 14:22:51.270437	Apto 207	Jardim Carioca
7	28030-395	266	Teixeira de Freitas	Campos dos Goytacazes	RJ	7	2021-01-23 15:40:06.207204	2021-01-23 15:40:06.207204	Bl 3, Ap 1503	Parque São Caetano 
8	28035-005	22	Rua Visconde de Inhaúma, 22, Apto 1404	Acrelândia	AC	8	2021-01-23 17:28:25.168388	2021-01-23 17:28:25.168388	Apto 1404	Parque Tamandaré
9	31060-090	80	Rua Conceição do Pará 80	Belo Horizonte	MG	9	2021-01-23 18:12:50.35483	2021-01-23 18:12:50.35483	Apt 204 bloco A	Santa Inês
10	29030-395	266	Teixeira de Freitas 	Campos dos Goytacazes	RJ	\N	2021-01-23 18:42:23.654476	2021-01-23 18:42:23.654476	Bl 3 Ap 1503	266
11	28022-150	484	Professora Maria Benedita Gouveia 484	Campos dos Goytacazes	RJ	10	2021-01-23 21:16:57.709419	2021-01-23 21:16:57.709419	Casa 1	Parque Imperial
12	28080-000	70	Avenida Francisco Lamego	Campos dos Goytacazes	RJ	\N	2021-01-25 12:48:58.65678	2021-01-25 12:48:58.65678	bloco 2 apto 207	Jardim Carioca 
13	28035-005	98	Rua Visconde de Inhaúma	Acrelândia	AC	\N	2021-01-25 14:36:59.592352	2021-01-25 14:36:59.592352	kkol09	wejmbsl
14	93510-335	401	Maurício Cardoso 	Novo Hamburgo	RS	11	2021-01-26 16:12:57.126405	2021-01-26 16:12:57.126405	1601	Centro 
15	28022-250	484	Rua Professora Maria Benedita Gouveia 484	Campos dos Goytacazes	RJ	\N	2021-01-26 17:04:29.648627	2021-01-26 17:04:29.648627	CASA	PARQUE IMPERIAL
16	20540-001	455	RUA BARÃO DE MESQUITA	Rio de Janeiro	RJ	12	2021-01-26 17:48:22.809934	2021-01-26 17:48:22.809934	602	Tijuca
18	28030-035	270	Avenida Nilo pe~çanho	Campos dos Goytacazes	RJ	\N	2021-01-27 13:52:31.9879	2021-01-27 13:52:31.9879	Altos	Santo Amaro
19	28035-641	377	Gil De gois 377	Campos dos Goytacazes	RJ	13	2021-01-27 17:31:01.740849	2021-01-27 17:31:01.740849	Casa	Centro
20	28035-005	56	saAFSA	Acrelândia	AC	\N	2021-01-27 18:21:44.298654	2021-01-27 18:21:44.298654	Apto 1404	ARASF
17	0-000	2	Rua Genaro Silveira da Conceição	Campos dos Goytacazes	RJ	\N	2021-01-26 19:30:53.442575	2021-01-28 14:55:28.609774	Apto 16	Parque Silveira Jardim
21	00000-000	2	Rua sem nome	Carauari	AM	\N	2021-01-28 14:57:45.855158	2021-01-28 14:57:45.855158	Apto 16	Sem nome
22	00000-000	2	Rua Silveira Silveirado	Campos dos Goytacazes	RJ	\N	2021-01-29 16:52:43.210605	2021-01-29 16:52:43.210605	Apto 1404	Parque Sebastião Rodrigues
23	00000-000	2	Rua não existe	Cachoeiras de Macacu	RJ	\N	2021-01-29 16:59:51.022097	2021-01-29 16:59:51.022097	apto 15	Parque não existe
24	28035-212	340	Rua Barão da Lagoa Dourada, 340	Campos dos Goytacazes	RJ	14	2021-01-31 19:28:44.932531	2021-01-31 19:28:44.932531	apto 402	centro
25	-	1	nao existe	Campos dos Goytacazes	RJ	\N	2021-01-31 19:44:29.692083	2021-01-31 19:44:29.692083	n	n
26	91720-130	184	Av Arnaldo Bohrer	Acrelândia	AC	15	2021-01-31 21:45:43.184496	2021-01-31 21:45:43.184496	Casa 3	Teresópolis 
27	28035-005	5	qualquer	Acrelândia	AC	16	2021-01-31 23:24:32.558504	2021-01-31 23:24:32.558504	5	ahuad
28	28051-265	233	Ramiro Braga	Campos dos Goytacazes	RJ	17	2021-02-02 15:19:47.355984	2021-02-02 15:19:47.355984		Parque Leopoldina
29	28030-395	266	Rua Teixeira de Freitas	Campos dos Goytacazes	RJ	\N	2021-02-02 20:17:42.636383	2021-02-02 20:17:42.636383		sao caetano
30	78551-445	17	Projetada 22	Sinop	MT	18	2021-02-02 22:03:27.887899	2021-02-02 22:03:27.887899		Gente feliz
31	78455-555	1	projetada22	Sinop	MT	19	2021-02-02 22:39:45.208184	2021-02-02 22:39:45.208184		gente feliz
32	28015-190	74	Rua Osvaldo Tavares 	Angra dos Reis	RJ	\N	2021-02-03 11:44:38.905424	2021-02-03 11:44:38.905424		Flamboyan
33	28035-005	1	Rua Visconde de Inhaúma, 22	Acrelândia	AC	\N	2021-02-03 13:34:57.773214	2021-02-03 13:34:57.773214	Apto 1404	Parque Tamandaré
34	28055-160	102	Waldemar Prata	Campos dos Goytacazes	RJ	20	2021-02-03 14:20:02.606748	2021-02-03 14:20:02.606748	ap. 301	Parque Corrientes
35	28035-005	90	Rua Visconde de Inhaúma	Acrelândia	AC	\N	2021-02-03 15:45:54.527706	2021-02-03 15:45:54.527706		fewf
36	41710-000	22	Professor Pinto de Aguiar N22	Salvador	BA	21	2021-02-03 18:25:22.920355	2021-02-03 18:25:22.920355	Casa	Boca do Rio
37	69053-130	12	Rua Acre	Manaus	AM	22	2021-02-03 23:25:16.693707	2021-02-03 23:25:16.693707	CEMOM - Sala 109	Nossa Senhora das Graças
38	17580-000	250	Embaixador Macedo soares	Pompéia	SP	23	2021-02-04 00:26:16.607553	2021-02-04 00:26:16.607553	Forum	Centro
39	28400-000	194	Major Vicente	São Fidélis	RJ	24	2021-02-04 00:28:52.725913	2021-02-04 00:28:52.725913		centro
40	28400-000	18	Prof Maria Inácia	São Fidélis	RJ	\N	2021-02-04 00:34:21.995131	2021-02-04 00:34:21.995131	casa 5	Coroados
41	90035-001	630	Ramiro Barcelos 	Porto Alegre	RS	25	2021-02-04 01:09:12.438571	2021-02-04 01:09:12.438571	Sala 1208	Floresta
42	32070-350	120	Senhorinha Gomes Martins	Contagem	MG	26	2021-02-04 01:36:03.569202	2021-02-04 01:36:03.569202	casa	Tropical
43	17580-000	250	Embaixador Macedo soares	Pompéia	SP	28	2021-02-05 14:06:04.68734	2021-02-05 14:06:04.68734	Forum	Centro
\.


--
-- Data for Name: admins; Type: TABLE DATA; Schema: public; Owner: elephant
--

COPY public.admins (id, email, encrypted_password, reset_password_token, reset_password_sent_at, remember_created_at, created_at, updated_at) FROM stdin;
1	giancarloiff@gmail.com	$2a$11$QRfrMqAViOhhrbToMLAdyO6hpM9MDF9T/RC/XsGa0qK9o7tNTJlIe	\N	\N	2021-01-23 16:05:08.51608	2021-01-14 22:11:35.732612	2021-01-23 16:05:08.517163
2	caiomoura9@hotmail.com	$2a$11$wKV7fLS1I6y1UB61kfh83erCF/K.wDIof9akSFlR85hurBnek/NfK	\N	\N	\N	2021-01-23 13:47:57.599703	2021-01-31 19:48:47.640626
\.


--
-- Data for Name: ar_internal_metadata; Type: TABLE DATA; Schema: public; Owner: elephant
--

COPY public.ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
environment	production	2021-01-14 21:33:32.702184	2021-01-14 21:33:32.702184
\.


--
-- Data for Name: atestados; Type: TABLE DATA; Schema: public; Owner: elephant
--

COPY public.atestados (id, text, cidade, crp, created_at, updated_at, patient_id) FROM stdin;
1	O paciente....	Campos dos Goytacazes 	0543797	2021-01-23 19:28:25.854094	2021-01-23 19:28:25.854094	6
4	reff	cq	12	2021-01-25 19:45:19.525286	2021-01-25 19:45:19.525286	5
7	Declaro que o paciente encontra-se depressivo.	Campos dos Goytacazes, RJ	0117777333	2021-02-03 00:35:53.975913	2021-02-03 00:35:53.975913	20
8	Teste de texto	Campos do Goytacazes	0000-5	2021-02-03 13:15:51.025592	2021-02-03 13:15:51.025592	1
9	Atesto, para os devidos fins, que o paciente Bernardo Eccard compareceu ao atendimento no dia 03/02/2021	São Fidélis	05/42152	2021-02-04 00:35:38.151394	2021-02-04 00:35:38.151394	30
\.


--
-- Data for Name: configs; Type: TABLE DATA; Schema: public; Owner: elephant
--

COPY public.configs (id, name, value, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: declaracoes; Type: TABLE DATA; Schema: public; Owner: elephant
--

COPY public.declaracoes (id, crp, text, city, created_at, updated_at, patient_id) FROM stdin;
2	00000-5	Declaro, para os devidos fins que o paciente Bruno Nascimento compareceu para acompanhamento psicológicos nos últimos 3 meses, às quartas-feiras no horário de 18:00 horas.	Campos dos Goytacazes	2021-01-23 17:49:44.170554	2021-01-23 17:49:44.170554	5
3	05/42152	Declaro, para os devidos fins, que o paciente Bernardo Eccard encontra-se em acompanhamento psicológico semanal, para tratar dos sintomas compatíveis com Transtorno de Ansiedade - CID 10 F41.1	São Fidélis	2021-02-04 00:47:55.509657	2021-02-04 00:47:55.509657	30
4	sdd	sdadsssssssssssssssss	sdsd	2021-02-05 18:21:18.598774	2021-02-05 18:21:18.598774	24
\.


--
-- Data for Name: forms; Type: TABLE DATA; Schema: public; Owner: elephant
--

COPY public.forms (id, patient_id, personal_moment, profissional_moment, interests, conclusions, intelectual_map, personalities_characteristics, facilities, dificulties, psicological_concepts, performance_diagnostic, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: formularios; Type: TABLE DATA; Schema: public; Owner: elephant
--

COPY public.formularios (id, content, kind, created_at, updated_at, patient_id, identifier) FROM stdin;
2	"{\\"\\":null,\\"identidade\\":\\"Mairkon...\\",\\"religiao\\":\\"Católico\\",\\"escolaridade\\":\\"nivel superior completo\\",\\"filhos_nome_idade_e_sexo\\":\\"2\\",\\"estado_civil\\":\\"Casado\\",\\"conjuge_nome_idade_profissao_escolaridade\\":\\"Sananda\\",\\"queixa_principal\\":\\"Ansiedade\\",\\"possibilidade_de_horarios\\":\\"manhã\\",\\"fez_terapia_anteriormente?_citar_qual_e_quando\\":\\"sim\\",\\"expectativas_e_objetivos_do_paciente\\":\\".....\\",\\"sintomas_apresentados\\":\\"sudorese....\\",\\"doencas_fisicas\\":\\"não\\",\\"estressores_psicossociais\\":\\"trabalho\\",\\"funcionamento_global\\":\\"prejudicado\\",\\"conceituacao_psicologica_do_caso\\":\\"......\\",\\"transtornos_psiquiatricos_anteriores\\":\\"nao\\",\\"transtornos_psiquiatricos_familiares\\":\\"nao\\",\\"doencas_importantes_que_teve\\":\\"nao\\",\\"medicacao_que_esta_tomando\\":\\"nao\\",\\"medicacao_alternativa_chas_compostos_etc\\":\\"\\",\\"aplicacao_de_testes?_se_sim_qual_e_resultado\\":\\"não\\",\\"quando_se_iniciou\\":\\"2 meses\\",\\"eventos_traumaticos_de_vida\\":\\"nao\\",\\"eventosfatores_que_precipitam_ou_agravam_crises\\":\\"nao\\",\\"uso_de_drogas\\":\\"\\",\\"tentativa_de_suicidio\\":\\"\\",\\"focos_de_intervencao_psicoterapica\\":\\"\\",\\"conjuje\\":\\"bom\\",\\"mae\\":\\"bom\\",\\"pai\\":\\"bom\\",\\"irmaos\\":\\"\\",\\"filhos\\":\\"\\",\\"outros_importantes\\":\\"\\",\\"observacoes_sobre_dinâmica_familiar_atual\\":\\"\\",\\"gravidez_planejada_ou_nao_parto_intercorrencias_obstetricas\\":\\"\\",\\"amamentacao\\":\\"\\",\\"treinamento_de_higiene\\":\\"\\",\\"estressores_na_infância_crises\\":\\"\\",\\"outros_transtornos_infantis_sono_alimentacao_psicomotor_gagueira_tiques_sonambulismo_aprendizagem\\":\\"\\",\\"outros_comentarios\\":\\"\\",\\"experiencias_afetivas_marcantes\\":\\"\\",\\"experiencias_sexuais_marcantes\\":\\"\\",\\"independencia_primeiros_empregos\\":\\"\\",\\"circulo_de_amizades\\":\\"\\",\\"relacionamento_com_parceiro\\":\\"\\",\\"vida_sexual_atual\\":\\"\\",\\"situacao_financeira\\":\\"\\",\\"abortos_espontâneosprovocados\\":\\"\\",\\"apoio_social_disponivel\\":\\"\\",\\"outros_transtornos_atuais_sono_alimentacao_tiquesetc\\":\\"\\",\\"principais_lazeres_vida_social\\":\\"\\",\\"observacao_e_linguagem_nao_verbal_do_paciente\\":\\"\\",\\"profissional\\":\\"\\",\\"encaminhamentos_feitos\\":\\"\\",\\"terapeutica_utilizada_prescricao_de_exercicios_leituras_relaxamento_etc\\":\\"\\"}"	Anamnese Adulto	2021-01-25 17:32:17.240799	2021-01-25 17:32:17.240799	6	1
3	"{\\"\\":null,\\"data_inicial\\":\\"2010-12-01\\",\\"data_termino\\":\\"2020-09-22\\",\\"nome_pai\\":\\".....\\",\\"profissao_pai\\":\\".....\\",\\"escolaridade_pai\\":\\"\\",\\"nome_mae\\":\\"\\",\\"profissao_mae\\":\\"\\",\\"escolaridade_mae\\":\\"\\",\\"divorciados\\":\\"0\\",\\"quantidade_irmaos\\":\\"\\",\\"nome_escola\\":\\"\\",\\"turma_escola\\":\\"\\",\\"serie_escola\\":\\",,,,,\\",\\"nome_professor\\":\\"\\",\\"telefone_escola\\":\\"\\",\\"natural\\":\\"1\\",\\"natural_obs\\":\\"\\",\\"pre_natal\\":\\"1\\",\\"gravidez_planejada\\":\\"1\\",\\"problema_gravidez\\":\\"1\\",\\"problema_pressao\\":null,\\"problema_queda\\":null,\\"problema_infeccao\\":null,\\"problema_sangue\\":null,\\"problema_aborto\\":null,\\"problema_fumo\\":null,\\"problema_alcool\\":null,\\"problema_droga\\":null,\\"problema_medicamento\\":null,\\"problema_obs\\":\\"\\",\\"nasceu_em_casa\\":\\"1\\",\\"parto_normal\\":null,\\"cesariana\\":null,\\"forceps\\":null,\\"precisou_oxigenio\\":null,\\"prematuro\\":null,\\"a_termo\\":null,\\"demorou_para_chorar\\":null,\\"incubadora\\":null,\\"parto_obs\\":\\"\\",\\"peso\\":\\"\\",\\"altura\\":\\"\\",\\"problemas_depois_nascimento\\":\\"1\\",\\"problemas_depois_nascimento_obs\\":\\"\\",\\"peito_exclusivo\\":\\"\\",\\"peito_complemento\\":\\"\\",\\"mamadeira\\":\\"\\",\\"sopa_frutas\\":\\"\\",\\"mudanca_alimentacao\\":\\"\\",\\"onde_faz_alimentacao\\":\\"\\",\\"chupeta\\":\\"1\\",\\"chupeta_retirada\\":\\"\\",\\"dedo\\":\\"0\\",\\"dedo_retirada\\":\\"\\",\\"calmo\\":\\"true\\",\\"agitado\\":null,\\"dificuldade_sono\\":\\"true\\",\\"acorda_a_noite\\":null,\\"horario_sono\\":\\"1\\",\\"fala_sono\\":\\"1\\",\\"sentou\\":\\"\\",\\"engatinhou\\":\\"\\",\\"andou\\":\\"\\",\\"falou\\":\\"\\",\\"falou_frase\\":\\"\\",\\"fralda_dia\\":\\"\\",\\"fralda_noite\\":\\"\\",\\"equilibro\\":\\"1\\",\\"dor_ouvido\\":null,\\"infeccao\\":null,\\"convulsao\\":null,\\"meningite\\":null,\\"pneumonia\\":null,\\"cirurgia\\":null,\\"internações\\":null,\\"asma_bronquite\\":null,\\"saude_obs\\":\\"\\",\\"saude_tratamento\\":\\"\\",\\"saude_vacinas\\":\\"1\\",\\"saude_aprendizagem\\":\\"\\",\\"saude_psiquiatrico\\":\\"\\",\\"saude_psiquiatrico_quais\\":\\"\\",\\"pre_escola\\":\\"1\\",\\"repetencia\\":\\"1\\",\\"repetencia_quando\\":\\"\\",\\"escolas_frequentadas\\":\\"\\",\\"desempenho_matematica\\":\\"i\\",\\"desempenho_historia\\":\\"i\\",\\"desempenho_portugues\\":\\"i\\",\\"desempenho_ciencias\\":\\"i\\",\\"desempenho_outras\\":\\"i\\",\\"problemas_desempenho_escolar\\":\\"\\",\\"esportes_preferidos\\":\\"\\",\\"brincadeiras_preferidos\\":\\"\\",\\"grupo_extra_curricular\\":\\"\\",\\"atividade_extra_curricular\\":\\"\\",\\"amigos\\":\\"\\",\\"saidas\\":\\"\\",\\"comparado_irmaos\\":\\"p\\",\\"comparado_outras\\":\\"p\\",\\"comparado_pais\\":\\"p\\",\\"comparado_sozinho\\":\\"p\\",\\"comparado_grupo\\":\\"p\\",\\"maiores_preocupacoes\\":\\"\\",\\"qualidades_obs\\":\\"\\",\\"comportamento_calmo\\":\\"0\\",\\"comportamento_agitado\\":\\"0\\",\\"comportamento_sem_concentracao\\":\\"0\\",\\"comportamento_nao_termina\\":\\"0\\",\\"comportamento_sem_prazer\\":\\"0\\",\\"comportamento_convencido\\":\\"0\\",\\"comportamento_dependente\\":\\"0\\",\\"comportamento_obsessivo\\":\\"0\\",\\"comportamento_obsessivo_obs\\":\\"\\",\\"queixa_se_de_solidao\\":\\"1\\",\\"parece_confuso\\":\\"1\\",\\"chora_muito\\":\\"0\\",\\"fica_no_mundo_da_lua\\":\\"2\\",\\"machuca_se_de_proposito_ou_ja_tentou_suicidio\\":\\"0\\",\\"exige_que_prestem_atencao_nele_destroi_as_propriascoisas\\":\\"0\\",\\"e_desobediente_em_casa\\":\\"0\\",\\"e_desobediente_na_escola\\":\\"0\\",\\"e_dificil_para_comer\\":\\"0\\",\\"nao_se_da_bem_com_outras_criancas\\":\\"0\\",\\"nao_demonstra_arrependimento\\":\\"0\\",\\"fica_com_ciumes_facilmente\\":\\"0\\",\\"desrespeita_regras\\":\\"1\\",\\"tem_medo_de_certos_animais_situacoes_e_lugares_nao_incluir_a_escola\\":\\"0\\",\\"tem_medo_de_certos_animais_situacoes_e_lugares_nao_incluir_a_escola_obs\\":\\"\\",\\"tem_medo_da_escola\\":\\"0\\",\\"tem_medo_da_escola_obs\\":\\"\\",\\"tem_medo_de_pensar_ou_de_fazer_algo_destrutivo_contra_si_ou_outros\\":\\"0\\",\\"tem_mania_de_perfeicao_de_fazer_tudo_certo\\":\\"0\\",\\"acha_que_ninguem_gosta_dele\\":\\"0\\",\\"acha_que_os_outros_o_perseguem\\":\\"0\\",\\"sente_se_desvalorizado_inferior\\":\\"0\\",\\"machuca_se_com_freqüencia__sofre_muitos_acidentes\\":\\"0\\",\\"entra_em_muitas_brigas\\":\\"0\\",\\"e_alvo_de_gozacao_com_freqüencia\\":\\"0\\",\\"anda_em_mas_companhias\\":\\"0\\",\\"escuta_sons_ou_vozes_que_nao_existem\\":\\"0\\",\\"e_impulsivo_nao_consegue_se_controlar\\":\\"0\\",\\"prefere_ficar_sozinho\\":\\"0\\",\\"mente_ou_engana_os_outros\\":\\"0\\",\\"roi_unhas\\":\\"0\\",\\"e_nervoso_ou_tenso\\":\\"0\\",\\"tem_tique_nervosococoetes\\":\\"0\\",\\"tem_tique_nervosococoetes_obs\\":\\"\\",\\"tem_pesadelos\\":\\"0\\",\\"as_outras_criancas_nao_gostam_dele\\":\\"0\\",\\"tem_prisao_de_ventre\\":\\"0\\",\\"e_apreensivo_aflito_ou_ansioso_demais\\":\\"0\\",\\"tem_tonturas\\":\\"0\\",\\"sente_se_excessivamente_culpado\\":\\"0\\",\\"come_exageradamente\\":\\"0\\",\\"sente_se_cansado_demais_sem_motivo\\":\\"0\\",\\"esta_gordo_demais\\":\\"0\\",\\"na_sua_opiniao_apresenta_problemas_fisicos_por_nervoso_s_causa_medica\\":\\"0\\",\\"dores_de_cabeca\\":\\"0\\",\\"nauseas_enjoos\\":\\"0\\",\\"problemas_com_os_olhos_que_nao_desaparecem_com_o_uso_de_oculosdescreva\\":\\"0\\",\\"problemas_com_os_olhos_que_nao_desaparecem_com_o_uso_de_oculosdescreva_obs\\":\\"\\",\\"problemas_de_pele\\":\\"0\\",\\"dores_de_estomagobarriga\\":\\"0\\",\\"vomitos\\":\\"0\\",\\"outras_queixasdores\\":\\"0\\",\\"comportamento_muito_sexualizado\\":\\"0\\",\\"tem_problemas_sexuais\\":\\"0\\",\\"tem_problemas_sexuais_obs\\":\\"\\",\\"possui_problema_de_coordenacao_motoradesajeitado_ou_desastrado\\":\\"0\\",\\"prefere_conviver_com_criancas_mais_velhas\\":\\"0\\",\\"recusa_se_a_falar\\":\\"0\\",\\"repete_certos_atos_varias_vezes_compulsoes\\":\\"0\\",\\"repete_certos_atos_varias_vezes_compulsoes_obs\\":\\"\\",\\"fica_sem_jeito_na_frente_dos_outros_com_facilidade_preocupado_com_o_que_as_pessoas_possam_achardele\\":\\"0\\",\\"poe_fogo_nas_coisas\\":\\"0\\",\\"fica_se_mostrando_ou_fazendo_palhacadas\\":\\"0\\",\\"e_muito_timido\\":\\"0\\",\\"dorme_menos_que_a_maioria_das_criancas\\":\\"0\\",\\"dorme_mais_que_a_maioria_das_criancas\\":\\"0\\",\\"dorme_mais_que_a_maioria_das_criancas_obs\\":\\"\\",\\"tem_problemas_na_fala\\":\\"0\\",\\"tem_problemas_na_fala_obs\\":\\"\\",\\"fica_com_o_olhar_parado\\":\\"0\\",\\"rouba_em_casa\\":\\"0\\",\\"rouba_fora_de_casa\\":\\"0\\",\\"junta_coisas_que_nao_precisa_e_que_nao_servem_para_nada\\":\\"0\\",\\"junta_coisas_que_nao_precisa_e_que_nao_servem_para_nada_obs\\":\\"\\",\\"tem_comportamento_estranho\\":\\"0\\",\\"tem_comportamento_estranho_obs\\":\\"\\",\\"tem_ideias_estranhas\\":\\"0\\",\\"tem_ideias_estranhas_obs\\":\\"\\",\\"e_mal_humorado_irrita_se_com_facilidade\\":\\"0\\",\\"tem_mudancas_repentinas_de_humor_ou_sentimentos\\":\\"0\\",\\"e_desconfiado\\":\\"0\\",\\"xinga_ou_fala_palavroes\\":\\"0\\",\\"fala_que_vai_se_matar\\":\\"0\\",\\"fala_demais\\":\\"0\\",\\"gosta_de_gozar_os_outros\\":\\"0\\",\\"tem_acessos_de_raiva\\":\\"0\\",\\"ameaca_as_pessoas\\":\\"0\\",\\"fuma\\":\\"0\\",\\"mata_aula\\":\\"0\\",\\"bebe\\":\\"0\\",\\"usa_drogas\\":\\"0\\",\\"e_pouco_ativo_falta_lhe_energia\\":\\"0\\",\\"e_infeliz_triste_ou_deprimido\\":\\"0\\",\\"e_barulhento_demais_destroi_ou_estraga_coisas_publicas\\":\\"0\\",\\"faz_xixi_na_cama\\":\\"0\\",\\"faz_manha\\":\\"0\\",\\"gostaria_de_ser_do_sexo_oposto\\":\\"0\\",\\"outros_problemas_obs\\":\\"\\"}"	Anamnese Infantil	2021-01-25 17:38:23.812126	2021-01-25 17:38:23.812126	6	0
4	"{\\"\\":null,\\"identidade\\":\\"Leandro \\",\\"religiao\\":\\"Cristão\\",\\"escolaridade\\":\\"nivel superior incompleto\\",\\"filhos_nome_idade_e_sexo\\":\\"não\\",\\"estado_civil\\":\\"solteiro\\",\\"conjuge_nome_idade_profissao_escolaridade\\":\\"namora (Ana Luiza)\\",\\"queixa_principal\\":\\"TDAH -DISFUNCIONALIDADE GLOBAL\\",\\"possibilidade_de_horarios\\":\\"MANHÃ\\",\\"fez_terapia_anteriormente?_citar_qual_e_quando\\":\\"SIM, TCC, POR UM ANO\\",\\"expectativas_e_objetivos_do_paciente\\":\\"TENTAR RESOLVER MAIS A QUESTÃO DA IMPULSIVIDADE...\\",\\"sintomas_apresentados\\":\\"TDAH - TODAS AS CARACTERÍSTICAS\\",\\"doencas_fisicas\\":\\"\\",\\"estressores_psicossociais\\":\\"\\",\\"funcionamento_global\\":\\"\\",\\"conceituacao_psicologica_do_caso\\":\\"\\",\\"transtornos_psiquiatricos_anteriores\\":\\"\\",\\"transtornos_psiquiatricos_familiares\\":\\"PRIMO TDAH\\",\\"doencas_importantes_que_teve\\":\\"\\",\\"medicacao_que_esta_tomando\\":\\"CONCERTA 36 Mg\\",\\"medicacao_alternativa_chas_compostos_etc\\":\\"\\",\\"aplicacao_de_testes?_se_sim_qual_e_resultado\\":\\"Avalição neuropsicologica realizada em 2019\\",\\"quando_se_iniciou\\":\\"Desde a infância\\",\\"eventos_traumaticos_de_vida\\":\\"\\",\\"eventosfatores_que_precipitam_ou_agravam_crises\\":\\"\\",\\"uso_de_drogas\\":\\"Ilicita nâo. Alcool socialmente\\",\\"tentativa_de_suicidio\\":\\"nâo\\",\\"focos_de_intervencao_psicoterapica\\":\\"\\",\\"conjuje\\":\\"muito bom, tranquilo\\",\\"mae\\":\\"Leandra - ótimo\\",\\"pai\\":\\"Cleber - ótimo\\",\\"irmaos\\":\\"filho único\\",\\"filhos\\":\\"\\",\\"outros_importantes\\":\\"\\",\\"observacoes_sobre_dinâmica_familiar_atual\\":\\"Convívio tranquilo\\",\\"gravidez_planejada_ou_nao_parto_intercorrencias_obstetricas\\":\\"\\",\\"amamentacao\\":\\"\\",\\"treinamento_de_higiene\\":\\"\\",\\"estressores_na_infância_crises\\":\\"\\",\\"outros_transtornos_infantis_sono_alimentacao_psicomotor_gagueira_tiques_sonambulismo_aprendizagem\\":\\"\\",\\"outros_comentarios\\":\\"Que mais impactou foi a escola (sempre o ultimo a acabar, muitas dificuldades). \\\\r\\\\nNunca teve problema de fazer amizade\\",\\"experiencias_afetivas_marcantes\\":\\"Foi um período bom...\\",\\"experiencias_sexuais_marcantes\\":\\"Não\\",\\"independencia_primeiros_empregos\\":\\"não\\",\\"circulo_de_amizades\\":\\"\\",\\"relacionamento_com_parceiro\\":\\"\\",\\"vida_sexual_atual\\":\\"Ativa\\",\\"situacao_financeira\\":\\"Dependente dos pais\\\\r\\\\nBico na pizzaria dos pais\\",\\"abortos_espontâneosprovocados\\":\\"\\",\\"apoio_social_disponivel\\":\\"\\",\\"outros_transtornos_atuais_sono_alimentacao_tiquesetc\\":\\"Alimentação boa\\\\r\\\\nSono - demora para pegar no sono, mas quando dorme é tranquilo\\",\\"principais_lazeres_vida_social\\":\\"Faz atividade física, música e desnho\\",\\"observacao_e_linguagem_nao_verbal_do_paciente\\":\\"Boa\\",\\"profissional\\":\\"\\",\\"encaminhamentos_feitos\\":\\"\\",\\"terapeutica_utilizada_prescricao_de_exercicios_leituras_relaxamento_etc\\":\\"\\"}"	Anamnese Adulto	2021-01-27 14:18:15.928644	2021-01-27 14:18:15.928644	10	1
5	"{\\"\\":null,\\"data_inicial\\":\\"2021-01-29\\",\\"data_termino\\":\\"2021-01-29\\",\\"nome_pai\\":\\"Jorge Luiz\\",\\"profissao_pai\\":\\"Técnico de Segurança\\",\\"escolaridade_pai\\":\\"Superior\\",\\"nome_mae\\":\\"Rita de Cássia\\",\\"profissao_mae\\":\\"Professora\\",\\"escolaridade_mae\\":\\"Superior\\",\\"divorciados\\":\\"0\\",\\"quantidade_irmaos\\":\\"1\\",\\"nome_escola\\":\\"Salesiano\\",\\"turma_escola\\":\\"C\\",\\"serie_escola\\":\\"3º\\",\\"nome_professor\\":\\"Ricardo\\",\\"telefone_escola\\":\\"(22) 27232524\\",\\"natural\\":\\"1\\",\\"natural_obs\\":\\"\\",\\"pre_natal\\":\\"1\\",\\"gravidez_planejada\\":\\"1\\",\\"problema_gravidez\\":\\"1\\",\\"problema_pressao\\":\\"true\\",\\"problema_queda\\":\\"true\\",\\"problema_infeccao\\":\\"true\\",\\"problema_sangue\\":\\"true\\",\\"problema_aborto\\":\\"true\\",\\"problema_fumo\\":null,\\"problema_alcool\\":\\"true\\",\\"problema_droga\\":\\"true\\",\\"problema_medicamento\\":\\"true\\",\\"problema_obs\\":\\"Teste\\",\\"nasceu_em_casa\\":\\"1\\",\\"parto_normal\\":\\"true\\",\\"cesariana\\":null,\\"forceps\\":\\"true\\",\\"precisou_oxigenio\\":null,\\"prematuro\\":\\"true\\",\\"a_termo\\":null,\\"demorou_para_chorar\\":\\"true\\",\\"incubadora\\":null,\\"parto_obs\\":\\"Qualquer coisa\\",\\"peso\\":\\"56\\",\\"altura\\":\\"157\\",\\"problemas_depois_nascimento\\":\\"1\\",\\"problemas_depois_nascimento_obs\\":\\"Respiratório\\",\\"peito_exclusivo\\":\\"5\\",\\"peito_complemento\\":\\"6\\",\\"mamadeira\\":\\"8\\",\\"sopa_frutas\\":\\"14\\",\\"mudanca_alimentacao\\":\\"Péssima\\",\\"onde_faz_alimentacao\\":\\"Cozinha\\",\\"chupeta\\":\\"1\\",\\"chupeta_retirada\\":\\"2\\",\\"dedo\\":\\"1\\",\\"dedo_retirada\\":\\"4\\",\\"calmo\\":\\"true\\",\\"agitado\\":null,\\"dificuldade_sono\\":\\"true\\",\\"acorda_a_noite\\":\\"true\\",\\"horario_sono\\":\\"1\\",\\"fala_sono\\":\\"0\\",\\"sentou\\":\\"5\\",\\"engatinhou\\":\\"7\\",\\"andou\\":\\"6\\",\\"falou\\":\\"4\\",\\"falou_frase\\":\\"2\\",\\"fralda_dia\\":\\"4\\",\\"fralda_noite\\":\\"6\\",\\"equilibro\\":\\"1\\",\\"dor_ouvido\\":null,\\"infeccao\\":\\"true\\",\\"convulsao\\":null,\\"meningite\\":null,\\"pneumonia\\":\\"true\\",\\"cirurgia\\":null,\\"internações\\":\\"true\\",\\"asma_bronquite\\":\\"true\\",\\"saude_obs\\":\\"Qualquer Coisa\\",\\"saude_tratamento\\":\\"Não\\",\\"saude_vacinas\\":\\"1\\",\\"saude_aprendizagem\\":\\"Não\\",\\"saude_psiquiatrico\\":\\"Sim, todos\\",\\"saude_psiquiatrico_quais\\":\\"Pai, mãe, irmão, avó. avô, tio, tia\\",\\"pre_escola\\":\\"1\\",\\"repetencia\\":\\"1\\",\\"repetencia_quando\\":\\"4\\",\\"escolas_frequentadas\\":\\"5\\",\\"desempenho_matematica\\":\\"=\\",\\"desempenho_historia\\":\\"i\\",\\"desempenho_portugues\\":\\"i\\",\\"desempenho_ciencias\\":\\"i\\",\\"desempenho_outras\\":\\"i\\",\\"problemas_desempenho_escolar\\":\\"4\\",\\"esportes_preferidos\\":\\"Futebol\\",\\"brincadeiras_preferidos\\":\\"Amarelinha e bola\\",\\"grupo_extra_curricular\\":\\"\\",\\"atividade_extra_curricular\\":\\"\\",\\"amigos\\":\\"\\",\\"saidas\\":\\"\\",\\"comparado_irmaos\\":\\"p\\",\\"comparado_outras\\":\\"p\\",\\"comparado_pais\\":\\"p\\",\\"comparado_sozinho\\":\\"p\\",\\"comparado_grupo\\":\\"p\\",\\"maiores_preocupacoes\\":\\"\\",\\"qualidades_obs\\":\\"\\",\\"comportamento_calmo\\":\\"0\\",\\"comportamento_agitado\\":\\"0\\",\\"comportamento_sem_concentracao\\":\\"0\\",\\"comportamento_nao_termina\\":\\"0\\",\\"comportamento_sem_prazer\\":\\"0\\",\\"comportamento_convencido\\":\\"0\\",\\"comportamento_dependente\\":\\"0\\",\\"comportamento_obsessivo\\":\\"0\\",\\"comportamento_obsessivo_obs\\":\\"\\",\\"queixa_se_de_solidao\\":\\"0\\",\\"parece_confuso\\":\\"0\\",\\"chora_muito\\":\\"0\\",\\"fica_no_mundo_da_lua\\":\\"0\\",\\"machuca_se_de_proposito_ou_ja_tentou_suicidio\\":\\"0\\",\\"exige_que_prestem_atencao_nele_destroi_as_propriascoisas\\":\\"0\\",\\"e_desobediente_em_casa\\":\\"0\\",\\"e_desobediente_na_escola\\":\\"0\\",\\"e_dificil_para_comer\\":\\"0\\",\\"nao_se_da_bem_com_outras_criancas\\":\\"0\\",\\"nao_demonstra_arrependimento\\":\\"0\\",\\"fica_com_ciumes_facilmente\\":\\"0\\",\\"desrespeita_regras\\":\\"0\\",\\"tem_medo_de_certos_animais_situacoes_e_lugares_nao_incluir_a_escola\\":\\"0\\",\\"tem_medo_de_certos_animais_situacoes_e_lugares_nao_incluir_a_escola_obs\\":\\"\\",\\"tem_medo_da_escola\\":\\"0\\",\\"tem_medo_da_escola_obs\\":\\"\\",\\"tem_medo_de_pensar_ou_de_fazer_algo_destrutivo_contra_si_ou_outros\\":\\"0\\",\\"tem_mania_de_perfeicao_de_fazer_tudo_certo\\":\\"0\\",\\"acha_que_ninguem_gosta_dele\\":\\"0\\",\\"acha_que_os_outros_o_perseguem\\":\\"0\\",\\"sente_se_desvalorizado_inferior\\":\\"0\\",\\"machuca_se_com_freqüencia__sofre_muitos_acidentes\\":\\"0\\",\\"entra_em_muitas_brigas\\":\\"0\\",\\"e_alvo_de_gozacao_com_freqüencia\\":\\"0\\",\\"anda_em_mas_companhias\\":\\"0\\",\\"escuta_sons_ou_vozes_que_nao_existem\\":\\"0\\",\\"e_impulsivo_nao_consegue_se_controlar\\":\\"0\\",\\"prefere_ficar_sozinho\\":\\"0\\",\\"mente_ou_engana_os_outros\\":\\"0\\",\\"roi_unhas\\":\\"0\\",\\"e_nervoso_ou_tenso\\":\\"0\\",\\"tem_tique_nervosococoetes\\":\\"0\\",\\"tem_tique_nervosococoetes_obs\\":\\"\\",\\"tem_pesadelos\\":\\"0\\",\\"as_outras_criancas_nao_gostam_dele\\":\\"0\\",\\"tem_prisao_de_ventre\\":\\"0\\",\\"e_apreensivo_aflito_ou_ansioso_demais\\":\\"0\\",\\"tem_tonturas\\":\\"0\\",\\"sente_se_excessivamente_culpado\\":\\"0\\",\\"come_exageradamente\\":\\"0\\",\\"sente_se_cansado_demais_sem_motivo\\":\\"0\\",\\"esta_gordo_demais\\":\\"0\\",\\"na_sua_opiniao_apresenta_problemas_fisicos_por_nervoso_s_causa_medica\\":\\"0\\",\\"dores_de_cabeca\\":\\"0\\",\\"nauseas_enjoos\\":\\"0\\",\\"problemas_com_os_olhos_que_nao_desaparecem_com_o_uso_de_oculosdescreva\\":\\"0\\",\\"problemas_com_os_olhos_que_nao_desaparecem_com_o_uso_de_oculosdescreva_obs\\":\\"\\",\\"problemas_de_pele\\":\\"0\\",\\"dores_de_estomagobarriga\\":\\"0\\",\\"vomitos\\":\\"0\\",\\"outras_queixasdores\\":\\"0\\",\\"comportamento_muito_sexualizado\\":\\"0\\",\\"tem_problemas_sexuais\\":\\"0\\",\\"tem_problemas_sexuais_obs\\":\\"\\",\\"possui_problema_de_coordenacao_motoradesajeitado_ou_desastrado\\":\\"0\\",\\"prefere_conviver_com_criancas_mais_velhas\\":\\"0\\",\\"recusa_se_a_falar\\":\\"0\\",\\"repete_certos_atos_varias_vezes_compulsoes\\":\\"0\\",\\"repete_certos_atos_varias_vezes_compulsoes_obs\\":\\"\\",\\"fica_sem_jeito_na_frente_dos_outros_com_facilidade_preocupado_com_o_que_as_pessoas_possam_achardele\\":\\"0\\",\\"poe_fogo_nas_coisas\\":\\"0\\",\\"fica_se_mostrando_ou_fazendo_palhacadas\\":\\"0\\",\\"e_muito_timido\\":\\"0\\",\\"dorme_menos_que_a_maioria_das_criancas\\":\\"0\\",\\"dorme_mais_que_a_maioria_das_criancas\\":\\"0\\",\\"dorme_mais_que_a_maioria_das_criancas_obs\\":\\"\\",\\"tem_problemas_na_fala\\":\\"0\\",\\"tem_problemas_na_fala_obs\\":\\"\\",\\"fica_com_o_olhar_parado\\":\\"0\\",\\"rouba_em_casa\\":\\"0\\",\\"rouba_fora_de_casa\\":\\"0\\",\\"junta_coisas_que_nao_precisa_e_que_nao_servem_para_nada\\":\\"0\\",\\"junta_coisas_que_nao_precisa_e_que_nao_servem_para_nada_obs\\":\\"\\",\\"tem_comportamento_estranho\\":\\"0\\",\\"tem_comportamento_estranho_obs\\":\\"\\",\\"tem_ideias_estranhas\\":\\"0\\",\\"tem_ideias_estranhas_obs\\":\\"\\",\\"e_mal_humorado_irrita_se_com_facilidade\\":\\"0\\",\\"tem_mudancas_repentinas_de_humor_ou_sentimentos\\":\\"0\\",\\"e_desconfiado\\":\\"0\\",\\"xinga_ou_fala_palavroes\\":\\"0\\",\\"fala_que_vai_se_matar\\":\\"0\\",\\"fala_demais\\":\\"0\\",\\"gosta_de_gozar_os_outros\\":\\"0\\",\\"tem_acessos_de_raiva\\":\\"0\\",\\"ameaca_as_pessoas\\":\\"0\\",\\"fuma\\":\\"0\\",\\"mata_aula\\":\\"0\\",\\"bebe\\":\\"0\\",\\"usa_drogas\\":\\"0\\",\\"e_pouco_ativo_falta_lhe_energia\\":\\"0\\",\\"e_infeliz_triste_ou_deprimido\\":\\"0\\",\\"e_barulhento_demais_destroi_ou_estraga_coisas_publicas\\":\\"0\\",\\"faz_xixi_na_cama\\":\\"0\\",\\"faz_manha\\":\\"0\\",\\"gostaria_de_ser_do_sexo_oposto\\":\\"0\\",\\"outros_problemas_obs\\":\\"\\"}"	Anamnese Infantil	2021-01-28 17:50:42.079111	2021-01-28 17:50:42.079111	5	0
6	"{\\"\\":null,\\"data_inicial\\":\\"2021-02-03\\",\\"data_termino\\":\\"\\",\\"nome_pai\\":\\"Marco Aurelio Chalita de Mendonça Filho\\",\\"profissao_pai\\":\\"Empresário\\",\\"escolaridade_pai\\":\\"Pós graduando\\",\\"nome_mae\\":\\"Cynthia Andrade Porto Chalita\\",\\"profissao_mae\\":\\"Enfermeira\\",\\"escolaridade_mae\\":\\"Pós graduação\\",\\"divorciados\\":\\"0\\",\\"quantidade_irmaos\\":\\"1\\",\\"nome_escola\\":\\"Alpha\\",\\"turma_escola\\":\\"3* ano\\",\\"serie_escola\\":\\"3*\\",\\"nome_professor\\":\\"Livia\\",\\"telefone_escola\\":\\"(22) 999047253\\",\\"natural\\":\\"1\\",\\"natural_obs\\":\\"\\",\\"pre_natal\\":\\"1\\",\\"gravidez_planejada\\":\\"1\\",\\"problema_gravidez\\":\\"0\\",\\"problema_pressao\\":null,\\"problema_queda\\":null,\\"problema_infeccao\\":null,\\"problema_sangue\\":null,\\"problema_aborto\\":null,\\"problema_fumo\\":null,\\"problema_alcool\\":null,\\"problema_droga\\":null,\\"problema_medicamento\\":null,\\"problema_obs\\":\\"\\",\\"nasceu_em_casa\\":\\"1\\",\\"parto_normal\\":null,\\"cesariana\\":\\"true\\",\\"forceps\\":null,\\"precisou_oxigenio\\":null,\\"prematuro\\":null,\\"a_termo\\":null,\\"demorou_para_chorar\\":null,\\"incubadora\\":null,\\"parto_obs\\":\\"Tranquila sem intercorrências\\",\\"peso\\":\\"\\",\\"altura\\":\\"49\\",\\"problemas_depois_nascimento\\":\\"0\\",\\"problemas_depois_nascimento_obs\\":\\"\\",\\"peito_exclusivo\\":\\"3\\",\\"peito_complemento\\":\\"\\",\\"mamadeira\\":\\"2\\",\\"sopa_frutas\\":\\"\\",\\"mudanca_alimentacao\\":\\"ele mamou ate os 2 anos. A aceitação foi boa\\",\\"onde_faz_alimentacao\\":\\"na mesa da sala, acompanhado com o telefone\\",\\"chupeta\\":\\"1\\",\\"chupeta_retirada\\":\\"03\\",\\"dedo\\":\\"0\\",\\"dedo_retirada\\":\\"\\",\\"calmo\\":\\"true\\",\\"agitado\\":null,\\"dificuldade_sono\\":null,\\"acorda_a_noite\\":null,\\"horario_sono\\":\\"1\\",\\"fala_sono\\":\\"0\\",\\"sentou\\":\\"\\",\\"engatinhou\\":\\"\\",\\"andou\\":\\"\\",\\"falou\\":\\"\\",\\"falou_frase\\":\\"\\",\\"fralda_dia\\":\\"\\",\\"fralda_noite\\":\\"\\",\\"equilibro\\":\\"1\\",\\"dor_ouvido\\":null,\\"infeccao\\":null,\\"convulsao\\":null,\\"meningite\\":null,\\"pneumonia\\":null,\\"cirurgia\\":null,\\"internações\\":null,\\"asma_bronquite\\":null,\\"saude_obs\\":\\"o desenvolvimento foi dentro do esperado\\",\\"saude_tratamento\\":\\"Psicopedagoga (Karla Freire)\\",\\"saude_vacinas\\":\\"1\\",\\"saude_aprendizagem\\":\\"O irmão \\",\\"saude_psiquiatrico\\":\\"Não\\",\\"saude_psiquiatrico_quais\\":\\"Dislexia\\",\\"pre_escola\\":\\"1\\",\\"repetencia\\":\\"0\\",\\"repetencia_quando\\":\\"\\",\\"escolas_frequentadas\\":\\"3\\",\\"desempenho_matematica\\":\\"i\\",\\"desempenho_historia\\":\\"i\\",\\"desempenho_portugues\\":\\"i\\",\\"desempenho_ciencias\\":\\"i\\",\\"desempenho_outras\\":\\"i\\",\\"problemas_desempenho_escolar\\":\\"Desde bem novinho. O processo a alfabetização foi regulada.\\\\r\\\\nEle ja tem professor particular na casa há 3 anos.\\",\\"esportes_preferidos\\":\\"Futebol\\",\\"brincadeiras_preferidos\\":\\"Antes gostava de carrinho. hoje le gosta e telefone...\\",\\"grupo_extra_curricular\\":\\"\\",\\"atividade_extra_curricular\\":\\"\\",\\"amigos\\":\\"\\",\\"saidas\\":\\"\\",\\"comparado_irmaos\\":\\"p\\",\\"comparado_outras\\":\\"p\\",\\"comparado_pais\\":\\"p\\",\\"comparado_sozinho\\":\\"p\\",\\"comparado_grupo\\":\\"p\\",\\"maiores_preocupacoes\\":\\"\\",\\"qualidades_obs\\":\\"Tem bom relacionamento com o irmão e com os colegas.\\\\r\\\\nO ambiente familiar é tranquilo.\\",\\"comportamento_calmo\\":\\"0\\",\\"comportamento_agitado\\":\\"0\\",\\"comportamento_sem_concentracao\\":\\"0\\",\\"comportamento_nao_termina\\":\\"0\\",\\"comportamento_sem_prazer\\":\\"0\\",\\"comportamento_convencido\\":\\"0\\",\\"comportamento_dependente\\":\\"0\\",\\"comportamento_obsessivo\\":\\"0\\",\\"comportamento_obsessivo_obs\\":\\"\\",\\"queixa_se_de_solidao\\":\\"0\\",\\"parece_confuso\\":\\"0\\",\\"chora_muito\\":\\"0\\",\\"fica_no_mundo_da_lua\\":\\"0\\",\\"machuca_se_de_proposito_ou_ja_tentou_suicidio\\":\\"0\\",\\"exige_que_prestem_atencao_nele_destroi_as_propriascoisas\\":\\"0\\",\\"e_desobediente_em_casa\\":\\"0\\",\\"e_desobediente_na_escola\\":\\"0\\",\\"e_dificil_para_comer\\":\\"0\\",\\"nao_se_da_bem_com_outras_criancas\\":\\"0\\",\\"nao_demonstra_arrependimento\\":\\"0\\",\\"fica_com_ciumes_facilmente\\":\\"0\\",\\"desrespeita_regras\\":\\"0\\",\\"tem_medo_de_certos_animais_situacoes_e_lugares_nao_incluir_a_escola\\":\\"0\\",\\"tem_medo_de_certos_animais_situacoes_e_lugares_nao_incluir_a_escola_obs\\":\\"\\",\\"tem_medo_da_escola\\":\\"0\\",\\"tem_medo_da_escola_obs\\":\\"\\",\\"tem_medo_de_pensar_ou_de_fazer_algo_destrutivo_contra_si_ou_outros\\":\\"0\\",\\"tem_mania_de_perfeicao_de_fazer_tudo_certo\\":\\"0\\",\\"acha_que_ninguem_gosta_dele\\":\\"0\\",\\"acha_que_os_outros_o_perseguem\\":\\"0\\",\\"sente_se_desvalorizado_inferior\\":\\"0\\",\\"machuca_se_com_freqüencia__sofre_muitos_acidentes\\":\\"0\\",\\"entra_em_muitas_brigas\\":\\"0\\",\\"e_alvo_de_gozacao_com_freqüencia\\":\\"0\\",\\"anda_em_mas_companhias\\":\\"0\\",\\"escuta_sons_ou_vozes_que_nao_existem\\":\\"0\\",\\"e_impulsivo_nao_consegue_se_controlar\\":\\"0\\",\\"prefere_ficar_sozinho\\":\\"0\\",\\"mente_ou_engana_os_outros\\":\\"0\\",\\"roi_unhas\\":\\"0\\",\\"e_nervoso_ou_tenso\\":\\"0\\",\\"tem_tique_nervosococoetes\\":\\"0\\",\\"tem_tique_nervosococoetes_obs\\":\\"\\",\\"tem_pesadelos\\":\\"0\\",\\"as_outras_criancas_nao_gostam_dele\\":\\"0\\",\\"tem_prisao_de_ventre\\":\\"0\\",\\"e_apreensivo_aflito_ou_ansioso_demais\\":\\"0\\",\\"tem_tonturas\\":\\"0\\",\\"sente_se_excessivamente_culpado\\":\\"0\\",\\"come_exageradamente\\":\\"0\\",\\"sente_se_cansado_demais_sem_motivo\\":\\"0\\",\\"esta_gordo_demais\\":\\"0\\",\\"na_sua_opiniao_apresenta_problemas_fisicos_por_nervoso_s_causa_medica\\":\\"0\\",\\"dores_de_cabeca\\":\\"0\\",\\"nauseas_enjoos\\":\\"0\\",\\"problemas_com_os_olhos_que_nao_desaparecem_com_o_uso_de_oculosdescreva\\":\\"0\\",\\"problemas_com_os_olhos_que_nao_desaparecem_com_o_uso_de_oculosdescreva_obs\\":\\"\\",\\"problemas_de_pele\\":\\"0\\",\\"dores_de_estomagobarriga\\":\\"0\\",\\"vomitos\\":\\"0\\",\\"outras_queixasdores\\":\\"0\\",\\"comportamento_muito_sexualizado\\":\\"0\\",\\"tem_problemas_sexuais\\":\\"0\\",\\"tem_problemas_sexuais_obs\\":\\"\\",\\"possui_problema_de_coordenacao_motoradesajeitado_ou_desastrado\\":\\"0\\",\\"prefere_conviver_com_criancas_mais_velhas\\":\\"0\\",\\"recusa_se_a_falar\\":\\"0\\",\\"repete_certos_atos_varias_vezes_compulsoes\\":\\"0\\",\\"repete_certos_atos_varias_vezes_compulsoes_obs\\":\\"\\",\\"fica_sem_jeito_na_frente_dos_outros_com_facilidade_preocupado_com_o_que_as_pessoas_possam_achardele\\":\\"0\\",\\"poe_fogo_nas_coisas\\":\\"0\\",\\"fica_se_mostrando_ou_fazendo_palhacadas\\":\\"0\\",\\"e_muito_timido\\":\\"0\\",\\"dorme_menos_que_a_maioria_das_criancas\\":\\"0\\",\\"dorme_mais_que_a_maioria_das_criancas\\":\\"0\\",\\"dorme_mais_que_a_maioria_das_criancas_obs\\":\\"\\",\\"tem_problemas_na_fala\\":\\"0\\",\\"tem_problemas_na_fala_obs\\":\\"\\",\\"fica_com_o_olhar_parado\\":\\"0\\",\\"rouba_em_casa\\":\\"0\\",\\"rouba_fora_de_casa\\":\\"0\\",\\"junta_coisas_que_nao_precisa_e_que_nao_servem_para_nada\\":\\"0\\",\\"junta_coisas_que_nao_precisa_e_que_nao_servem_para_nada_obs\\":\\"\\",\\"tem_comportamento_estranho\\":\\"0\\",\\"tem_comportamento_estranho_obs\\":\\"\\",\\"tem_ideias_estranhas\\":\\"0\\",\\"tem_ideias_estranhas_obs\\":\\"\\",\\"e_mal_humorado_irrita_se_com_facilidade\\":\\"0\\",\\"tem_mudancas_repentinas_de_humor_ou_sentimentos\\":\\"0\\",\\"e_desconfiado\\":\\"0\\",\\"xinga_ou_fala_palavroes\\":\\"0\\",\\"fala_que_vai_se_matar\\":\\"0\\",\\"fala_demais\\":\\"0\\",\\"gosta_de_gozar_os_outros\\":\\"0\\",\\"tem_acessos_de_raiva\\":\\"0\\",\\"ameaca_as_pessoas\\":\\"0\\",\\"fuma\\":\\"0\\",\\"mata_aula\\":\\"0\\",\\"bebe\\":\\"0\\",\\"usa_drogas\\":\\"0\\",\\"e_pouco_ativo_falta_lhe_energia\\":\\"0\\",\\"e_infeliz_triste_ou_deprimido\\":\\"0\\",\\"e_barulhento_demais_destroi_ou_estraga_coisas_publicas\\":\\"0\\",\\"faz_xixi_na_cama\\":\\"0\\",\\"faz_manha\\":\\"0\\",\\"gostaria_de_ser_do_sexo_oposto\\":\\"0\\",\\"outros_problemas_obs\\":\\"\\"}"	Anamnese Infantil	2021-02-03 12:31:30.256231	2021-02-03 12:31:30.256231	22	0
7	"{\\"\\":null,\\"identidade\\":\\"000000000000000000\\",\\"religiao\\":\\"cat\\",\\"escolaridade\\":\\"2\\",\\"filhos_nome_idade_e_sexo\\":\\"2\\",\\"estado_civil\\":\\"casado\\",\\"conjuge_nome_idade_profissao_escolaridade\\":\\"\\",\\"queixa_principal\\":\\"\\",\\"possibilidade_de_horarios\\":\\"\\",\\"fez_terapia_anteriormente?_citar_qual_e_quando\\":\\"\\",\\"expectativas_e_objetivos_do_paciente\\":\\"\\",\\"sintomas_apresentados\\":\\"\\",\\"doencas_fisicas\\":\\"\\",\\"estressores_psicossociais\\":\\"\\",\\"funcionamento_global\\":\\"\\",\\"conceituacao_psicologica_do_caso\\":\\"\\",\\"transtornos_psiquiatricos_anteriores\\":\\"\\",\\"transtornos_psiquiatricos_familiares\\":\\"\\",\\"doencas_importantes_que_teve\\":\\"\\",\\"medicacao_que_esta_tomando\\":\\"\\",\\"medicacao_alternativa_chas_compostos_etc\\":\\"\\",\\"aplicacao_de_testes?_se_sim_qual_e_resultado\\":\\"\\",\\"quando_se_iniciou\\":\\"\\",\\"eventos_traumaticos_de_vida\\":\\"\\",\\"eventosfatores_que_precipitam_ou_agravam_crises\\":\\"\\",\\"uso_de_drogas\\":\\"\\",\\"tentativa_de_suicidio\\":\\"\\",\\"focos_de_intervencao_psicoterapica\\":\\"\\",\\"conjuje\\":\\"\\",\\"mae\\":\\"\\",\\"pai\\":\\"\\",\\"irmaos\\":\\"\\",\\"filhos\\":\\"\\",\\"outros_importantes\\":\\"\\",\\"observacoes_sobre_dinâmica_familiar_atual\\":\\"\\",\\"gravidez_planejada_ou_nao_parto_intercorrencias_obstetricas\\":\\"\\",\\"amamentacao\\":\\"\\",\\"treinamento_de_higiene\\":\\"\\",\\"estressores_na_infância_crises\\":\\"\\",\\"outros_transtornos_infantis_sono_alimentacao_psicomotor_gagueira_tiques_sonambulismo_aprendizagem\\":\\"\\",\\"outros_comentarios\\":\\"\\",\\"experiencias_afetivas_marcantes\\":\\"\\",\\"experiencias_sexuais_marcantes\\":\\"\\",\\"independencia_primeiros_empregos\\":\\"\\",\\"circulo_de_amizades\\":\\"\\",\\"relacionamento_com_parceiro\\":\\"\\",\\"vida_sexual_atual\\":\\"\\",\\"situacao_financeira\\":\\"\\",\\"abortos_espontâneosprovocados\\":\\"\\",\\"apoio_social_disponivel\\":\\"\\",\\"outros_transtornos_atuais_sono_alimentacao_tiquesetc\\":\\"\\",\\"principais_lazeres_vida_social\\":\\"\\",\\"observacao_e_linguagem_nao_verbal_do_paciente\\":\\"\\",\\"profissional\\":\\"\\",\\"encaminhamentos_feitos\\":\\"\\",\\"terapeutica_utilizada_prescricao_de_exercicios_leituras_relaxamento_etc\\":\\"\\"}"	Anamnese Adulto	2021-02-06 19:15:16.276118	2021-02-06 19:15:16.276118	49	1
8	"{\\"\\":null,\\"identidade\\":\\"000000000000000000\\",\\"religiao\\":\\"cat\\",\\"escolaridade\\":\\"2\\",\\"filhos_nome_idade_e_sexo\\":\\"2\\",\\"estado_civil\\":\\"casado\\",\\"conjuge_nome_idade_profissao_escolaridade\\":\\"\\",\\"queixa_principal\\":\\"\\",\\"possibilidade_de_horarios\\":\\"\\",\\"fez_terapia_anteriormente?_citar_qual_e_quando\\":\\"\\",\\"expectativas_e_objetivos_do_paciente\\":\\"\\",\\"sintomas_apresentados\\":\\"\\",\\"doencas_fisicas\\":\\"\\",\\"estressores_psicossociais\\":\\"\\",\\"funcionamento_global\\":\\"\\",\\"conceituacao_psicologica_do_caso\\":\\"\\",\\"transtornos_psiquiatricos_anteriores\\":\\"\\",\\"transtornos_psiquiatricos_familiares\\":\\"\\",\\"doencas_importantes_que_teve\\":\\"\\",\\"medicacao_que_esta_tomando\\":\\"\\",\\"medicacao_alternativa_chas_compostos_etc\\":\\"\\",\\"aplicacao_de_testes?_se_sim_qual_e_resultado\\":\\"\\",\\"quando_se_iniciou\\":\\"\\",\\"eventos_traumaticos_de_vida\\":\\"\\",\\"eventosfatores_que_precipitam_ou_agravam_crises\\":\\"\\",\\"uso_de_drogas\\":\\"\\",\\"tentativa_de_suicidio\\":\\"\\",\\"focos_de_intervencao_psicoterapica\\":\\"\\",\\"conjuje\\":\\"\\",\\"mae\\":\\"\\",\\"pai\\":\\"\\",\\"irmaos\\":\\"\\",\\"filhos\\":\\"\\",\\"outros_importantes\\":\\"\\",\\"observacoes_sobre_dinâmica_familiar_atual\\":\\"\\",\\"gravidez_planejada_ou_nao_parto_intercorrencias_obstetricas\\":\\"\\",\\"amamentacao\\":\\"\\",\\"treinamento_de_higiene\\":\\"\\",\\"estressores_na_infância_crises\\":\\"\\",\\"outros_transtornos_infantis_sono_alimentacao_psicomotor_gagueira_tiques_sonambulismo_aprendizagem\\":\\"\\",\\"outros_comentarios\\":\\"\\",\\"experiencias_afetivas_marcantes\\":\\"\\",\\"experiencias_sexuais_marcantes\\":\\"\\",\\"independencia_primeiros_empregos\\":\\"\\",\\"circulo_de_amizades\\":\\"\\",\\"relacionamento_com_parceiro\\":\\"\\",\\"vida_sexual_atual\\":\\"\\",\\"situacao_financeira\\":\\"\\",\\"abortos_espontâneosprovocados\\":\\"\\",\\"apoio_social_disponivel\\":\\"\\",\\"outros_transtornos_atuais_sono_alimentacao_tiquesetc\\":\\"\\",\\"principais_lazeres_vida_social\\":\\"\\",\\"observacao_e_linguagem_nao_verbal_do_paciente\\":\\"\\",\\"profissional\\":\\"\\",\\"encaminhamentos_feitos\\":\\"\\",\\"terapeutica_utilizada_prescricao_de_exercicios_leituras_relaxamento_etc\\":\\"\\"}"	Anamnese Adulto	2021-02-06 19:18:16.696341	2021-02-06 19:18:16.696341	49	1
9	"{\\"\\":null,\\"data_inicial\\":\\"2021-02-06\\",\\"data_termino\\":\\"2021-02-06\\",\\"nome_pai\\":\\"teste\\",\\"profissao_pai\\":\\"teste\\",\\"escolaridade_pai\\":\\"teste\\",\\"nome_mae\\":\\"\\",\\"profissao_mae\\":\\"\\",\\"escolaridade_mae\\":\\"\\",\\"divorciados\\":\\"1\\",\\"quantidade_irmaos\\":\\"1\\",\\"nome_escola\\":\\"\\",\\"turma_escola\\":\\"\\",\\"serie_escola\\":\\"\\",\\"nome_professor\\":\\"teste\\",\\"telefone_escola\\":\\"\\",\\"natural\\":\\"0\\",\\"natural_obs\\":\\"\\",\\"pre_natal\\":\\"1\\",\\"gravidez_planejada\\":\\"1\\",\\"problema_gravidez\\":\\"1\\",\\"problema_pressao\\":null,\\"problema_queda\\":null,\\"problema_infeccao\\":null,\\"problema_sangue\\":null,\\"problema_aborto\\":null,\\"problema_fumo\\":null,\\"problema_alcool\\":null,\\"problema_droga\\":null,\\"problema_medicamento\\":null,\\"problema_obs\\":\\"\\",\\"nasceu_em_casa\\":\\"1\\",\\"parto_normal\\":null,\\"cesariana\\":null,\\"forceps\\":null,\\"precisou_oxigenio\\":null,\\"prematuro\\":null,\\"a_termo\\":null,\\"demorou_para_chorar\\":null,\\"incubadora\\":null,\\"parto_obs\\":\\"\\",\\"peso\\":\\"\\",\\"altura\\":\\"\\",\\"problemas_depois_nascimento\\":\\"1\\",\\"problemas_depois_nascimento_obs\\":\\"\\",\\"peito_exclusivo\\":\\"\\",\\"peito_complemento\\":\\"\\",\\"mamadeira\\":\\"\\",\\"sopa_frutas\\":\\"\\",\\"mudanca_alimentacao\\":\\"\\",\\"onde_faz_alimentacao\\":\\"\\",\\"chupeta\\":\\"1\\",\\"chupeta_retirada\\":\\"\\",\\"dedo\\":\\"1\\",\\"dedo_retirada\\":\\"\\",\\"calmo\\":null,\\"agitado\\":null,\\"dificuldade_sono\\":null,\\"acorda_a_noite\\":null,\\"horario_sono\\":\\"1\\",\\"fala_sono\\":\\"1\\",\\"sentou\\":\\"\\",\\"engatinhou\\":\\"\\",\\"andou\\":\\"\\",\\"falou\\":\\"\\",\\"falou_frase\\":\\"\\",\\"fralda_dia\\":\\"\\",\\"fralda_noite\\":\\"\\",\\"equilibro\\":\\"1\\",\\"dor_ouvido\\":null,\\"infeccao\\":null,\\"convulsao\\":null,\\"meningite\\":null,\\"pneumonia\\":null,\\"cirurgia\\":null,\\"internações\\":null,\\"asma_bronquite\\":null,\\"saude_obs\\":\\"\\",\\"saude_tratamento\\":\\"\\",\\"saude_vacinas\\":\\"1\\",\\"saude_aprendizagem\\":\\"\\",\\"saude_psiquiatrico\\":\\"\\",\\"saude_psiquiatrico_quais\\":\\"\\",\\"pre_escola\\":\\"1\\",\\"repetencia\\":\\"1\\",\\"repetencia_quando\\":\\"\\",\\"escolas_frequentadas\\":\\"\\",\\"desempenho_matematica\\":\\"i\\",\\"desempenho_historia\\":\\"i\\",\\"desempenho_portugues\\":\\"i\\",\\"desempenho_ciencias\\":\\"i\\",\\"desempenho_outras\\":\\"i\\",\\"problemas_desempenho_escolar\\":\\"\\",\\"esportes_preferidos\\":\\"\\",\\"brincadeiras_preferidos\\":\\"\\",\\"grupo_extra_curricular\\":\\"\\",\\"atividade_extra_curricular\\":\\"\\",\\"amigos\\":\\"\\",\\"saidas\\":\\"\\",\\"comparado_irmaos\\":\\"p\\",\\"comparado_outras\\":\\"p\\",\\"comparado_pais\\":\\"p\\",\\"comparado_sozinho\\":\\"p\\",\\"comparado_grupo\\":\\"p\\",\\"maiores_preocupacoes\\":\\"\\",\\"qualidades_obs\\":\\"\\",\\"comportamento_calmo\\":\\"0\\",\\"comportamento_agitado\\":\\"0\\",\\"comportamento_sem_concentracao\\":\\"0\\",\\"comportamento_nao_termina\\":\\"0\\",\\"comportamento_sem_prazer\\":\\"0\\",\\"comportamento_convencido\\":\\"0\\",\\"comportamento_dependente\\":\\"0\\",\\"comportamento_obsessivo\\":\\"0\\",\\"comportamento_obsessivo_obs\\":\\"\\",\\"queixa_se_de_solidao\\":\\"0\\",\\"parece_confuso\\":\\"0\\",\\"chora_muito\\":\\"0\\",\\"fica_no_mundo_da_lua\\":\\"0\\",\\"machuca_se_de_proposito_ou_ja_tentou_suicidio\\":\\"0\\",\\"exige_que_prestem_atencao_nele_destroi_as_propriascoisas\\":\\"0\\",\\"e_desobediente_em_casa\\":\\"0\\",\\"e_desobediente_na_escola\\":\\"0\\",\\"e_dificil_para_comer\\":\\"0\\",\\"nao_se_da_bem_com_outras_criancas\\":\\"0\\",\\"nao_demonstra_arrependimento\\":\\"0\\",\\"fica_com_ciumes_facilmente\\":\\"0\\",\\"desrespeita_regras\\":\\"0\\",\\"tem_medo_de_certos_animais_situacoes_e_lugares_nao_incluir_a_escola\\":\\"0\\",\\"tem_medo_de_certos_animais_situacoes_e_lugares_nao_incluir_a_escola_obs\\":\\"\\",\\"tem_medo_da_escola\\":\\"0\\",\\"tem_medo_da_escola_obs\\":\\"\\",\\"tem_medo_de_pensar_ou_de_fazer_algo_destrutivo_contra_si_ou_outros\\":\\"0\\",\\"tem_mania_de_perfeicao_de_fazer_tudo_certo\\":\\"0\\",\\"acha_que_ninguem_gosta_dele\\":\\"0\\",\\"acha_que_os_outros_o_perseguem\\":\\"0\\",\\"sente_se_desvalorizado_inferior\\":\\"0\\",\\"machuca_se_com_freqüencia__sofre_muitos_acidentes\\":\\"0\\",\\"entra_em_muitas_brigas\\":\\"0\\",\\"e_alvo_de_gozacao_com_freqüencia\\":\\"0\\",\\"anda_em_mas_companhias\\":\\"0\\",\\"escuta_sons_ou_vozes_que_nao_existem\\":\\"0\\",\\"e_impulsivo_nao_consegue_se_controlar\\":\\"0\\",\\"prefere_ficar_sozinho\\":\\"0\\",\\"mente_ou_engana_os_outros\\":\\"0\\",\\"roi_unhas\\":\\"0\\",\\"e_nervoso_ou_tenso\\":\\"0\\",\\"tem_tique_nervosococoetes\\":\\"0\\",\\"tem_tique_nervosococoetes_obs\\":\\"\\",\\"tem_pesadelos\\":\\"0\\",\\"as_outras_criancas_nao_gostam_dele\\":\\"0\\",\\"tem_prisao_de_ventre\\":\\"0\\",\\"e_apreensivo_aflito_ou_ansioso_demais\\":\\"0\\",\\"tem_tonturas\\":\\"0\\",\\"sente_se_excessivamente_culpado\\":\\"0\\",\\"come_exageradamente\\":\\"0\\",\\"sente_se_cansado_demais_sem_motivo\\":\\"0\\",\\"esta_gordo_demais\\":\\"0\\",\\"na_sua_opiniao_apresenta_problemas_fisicos_por_nervoso_s_causa_medica\\":\\"0\\",\\"dores_de_cabeca\\":\\"0\\",\\"nauseas_enjoos\\":\\"0\\",\\"problemas_com_os_olhos_que_nao_desaparecem_com_o_uso_de_oculosdescreva\\":\\"0\\",\\"problemas_com_os_olhos_que_nao_desaparecem_com_o_uso_de_oculosdescreva_obs\\":\\"\\",\\"problemas_de_pele\\":\\"0\\",\\"dores_de_estomagobarriga\\":\\"0\\",\\"vomitos\\":\\"0\\",\\"outras_queixasdores\\":\\"0\\",\\"comportamento_muito_sexualizado\\":\\"0\\",\\"tem_problemas_sexuais\\":\\"0\\",\\"tem_problemas_sexuais_obs\\":\\"\\",\\"possui_problema_de_coordenacao_motoradesajeitado_ou_desastrado\\":\\"0\\",\\"prefere_conviver_com_criancas_mais_velhas\\":\\"0\\",\\"recusa_se_a_falar\\":\\"0\\",\\"repete_certos_atos_varias_vezes_compulsoes\\":\\"0\\",\\"repete_certos_atos_varias_vezes_compulsoes_obs\\":\\"\\",\\"fica_sem_jeito_na_frente_dos_outros_com_facilidade_preocupado_com_o_que_as_pessoas_possam_achardele\\":\\"0\\",\\"poe_fogo_nas_coisas\\":\\"0\\",\\"fica_se_mostrando_ou_fazendo_palhacadas\\":\\"0\\",\\"e_muito_timido\\":\\"0\\",\\"dorme_menos_que_a_maioria_das_criancas\\":\\"0\\",\\"dorme_mais_que_a_maioria_das_criancas\\":\\"0\\",\\"dorme_mais_que_a_maioria_das_criancas_obs\\":\\"\\",\\"tem_problemas_na_fala\\":\\"0\\",\\"tem_problemas_na_fala_obs\\":\\"\\",\\"fica_com_o_olhar_parado\\":\\"0\\",\\"rouba_em_casa\\":\\"0\\",\\"rouba_fora_de_casa\\":\\"0\\",\\"junta_coisas_que_nao_precisa_e_que_nao_servem_para_nada\\":\\"0\\",\\"junta_coisas_que_nao_precisa_e_que_nao_servem_para_nada_obs\\":\\"\\",\\"tem_comportamento_estranho\\":\\"0\\",\\"tem_comportamento_estranho_obs\\":\\"\\",\\"tem_ideias_estranhas\\":\\"0\\",\\"tem_ideias_estranhas_obs\\":\\"\\",\\"e_mal_humorado_irrita_se_com_facilidade\\":\\"0\\",\\"tem_mudancas_repentinas_de_humor_ou_sentimentos\\":\\"0\\",\\"e_desconfiado\\":\\"0\\",\\"xinga_ou_fala_palavroes\\":\\"0\\",\\"fala_que_vai_se_matar\\":\\"0\\",\\"fala_demais\\":\\"0\\",\\"gosta_de_gozar_os_outros\\":\\"0\\",\\"tem_acessos_de_raiva\\":\\"0\\",\\"ameaca_as_pessoas\\":\\"0\\",\\"fuma\\":\\"0\\",\\"mata_aula\\":\\"0\\",\\"bebe\\":\\"0\\",\\"usa_drogas\\":\\"0\\",\\"e_pouco_ativo_falta_lhe_energia\\":\\"0\\",\\"e_infeliz_triste_ou_deprimido\\":\\"0\\",\\"e_barulhento_demais_destroi_ou_estraga_coisas_publicas\\":\\"0\\",\\"faz_xixi_na_cama\\":\\"0\\",\\"faz_manha\\":\\"0\\",\\"gostaria_de_ser_do_sexo_oposto\\":\\"0\\",\\"outros_problemas_obs\\":\\"\\"}"	Anamnese Infantil	2021-02-06 19:22:01.579601	2021-02-06 19:22:01.579601	49	0
\.


--
-- Data for Name: graficos; Type: TABLE DATA; Schema: public; Owner: elephant
--

COPY public.graficos (id, data, kind, title, created_at, updated_at, laudo_id, image) FROM stdin;
1	"{\\"0\\":{\\"label\\":\\"Coluna 1\\",\\"backgroundColor\\":\\"#708090\\",\\"borderColor\\":\\"#708090\\",\\"data\\":[\\"10\\"],\\"index\\":0},\\"1\\":{\\"label\\":\\"Coluna 2\\",\\"backgroundColor\\":\\"#708090\\",\\"borderColor\\":\\"#708090\\",\\"data\\":[\\"20\\"],\\"index\\":1},\\"2\\":{\\"label\\":\\"Coluna 3\\",\\"backgroundColor\\":\\"#708090\\",\\"borderColor\\":\\"#708090\\",\\"data\\":[\\"30\\"],\\"index\\":2}}"	Barra	teste	2021-01-23 04:04:18.178249	2021-01-24 00:40:42.513609	1	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
2	"{\\"data\\":[98,89],\\"backgroundColor\\":[\\"#708090\\",\\"#708090\\"],\\"label\\":\\"\\",\\"labels\\":[\\"QI\\",\\"Raciocínio verbal\\"]}"	Pizza	Wais 	2021-01-23 18:45:42.069554	2021-01-25 13:50:54.270333	2	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kLV+5Q3RtHBe28zuKhJmBXoioQX6diOla7DW6a6RDLsB87eR5XD24HAm36k91lF9xf9bAbfd0OkabL+ub1itX/2lavnPfgykaxukIYAAAgg4BAjKHSgkIYAAAlEBtUo7g3IFoiPspsdo2ei8nliyTmWc/coVzDu3Ga6v4PhWzV+rcbZG12DPRf+HxmM2btxoAXx2P/TD1O3kKNeKcWnqntKwatWqL6je9oxya7Fvev66Y70lSvuDfE7WE1cGO/JJQgABBBDIU6AlNwLluWmKIYAAAgi0VkBdRjqq5doeyXioAuV9NT9P81N33nnn6Xfcccfm1m4/1/rXX3/93ipzpPrO76/pfqrDJs0vVD0WqbvKeNdNrrm2ST4CCCCAAAIIIIAAAggggAACCCCAAAIIIIAAAggggAACCCCAAAIIIIAAAggggAACCCCAAAIIIIAAAggggAACCCCAAAIIIIAAAggggAACCCCAAAIIIIAAAggggAACCCCAAAIIIIAAAggggAACCCCAAAIIIIAAAggggAACCCCAAAIIIIAAAggggAACCCCAAAIIIIAAAggggAACCCCAAAIIIIAAAggggAACCCCAAAIIIIAAAggggAACCCCAAAIIIIAAAggggAACCCCAAAIIIIAAAggggAACCCCAAAIIIIAAAggggAACCCCAAAIIIIAAAggggAACCCCAAAIIIIAAAggggAACCCCAAAIIIIAAAggggAACCCCAAAIIIIAAAggggAACCCCAAAIIIIAAAggggAACCCCAAAIIIIAAAggggAACCCCAAAIIIIAAAggggAACCCCAAAIIIIAAAggggAACCCCAAAIIIIAAAggggAACCCCAAAIIIIAAAggggAACCCCAAAIIIIAAAggggAACCCCAAAIIIIAAAggggAACCCCAAAIIIIAAAggggAACCCCAAAIIIIAAAggggAACCCCAAAIIIIAAAggggAACCCCAAAIIIIAAAggggAACCCCAAAIIIIAAAggggAACCCCAAAIIIIAAAggggAACCCCAAAIIIIAAAggggAACCCCAAAIIIIAAAggggAACCCCAAAIIIIAAAggggAACCCCAAAIIIIAAAggggAACCCCAAAIIIIAAAggggAACCCCAAAIIIIAAAggggAACCCCAAAIIIIAAAggggAACCCCAAAIIIIAAAggggAACCCCAAAIIIIAAAggggAACCCCAAAIIIIAAAggggAACCCCAAAIIIIAAAggggAACCCCAAAIIIIAAAggggAACCCCAAAIIIIAAAggggAACCCCAAAIIIIAAAggggAACCCCAAAIIIIAAAggggAACCCCAAAIIIIAAAggggAACCCCAAAIIIIAAAggggAACCCCAAAIIIIAAAggggAACCCCAAAIIIIAAAggggAACCCCAAAIIIIAAAggggAACCCCAAAIIIIAAAggggAACCCCAAAIIIIAAAggggAACCCCAAAIIIIAAAggggAACCCCAAAIIIIAAAggggAACCCCAAAIIIIAAAggggAACCCCAAAIIIIAAAggggAACCCCAAAIIIIAAAggggAACCCCAAAIIIIAAAggggAACCCCAAAIIIIAAAggggAACCCCAAAIIINBMoF2zlCpN2LZt2xM6tMOr9PA4LL/AFe3atZvhzybHJaDXy0FKf8aVR1pVC8zV6+W/qvoIOTgEEEAgoQIdElqvtqjW8dqojQy1JbBzbR1u0Y62s7Z0WtG2xoYqRWC3Sqko9UQAAQSqTWCnajsgjgcBBBBAAAEEEEAAgUoTICivtDNGfRFAAAEEEEAAAQSqToCgvOpOKQeEAAIIIIAAAgggUGkCBOWVdsaoLwIIIIAAAggggEDVCdTSjZ7Ok/fwUy8HK+pWO/NIrByBr15+SbBHj90rp8IVWtOVq9cGDz7Rt0JrT7VDge677xpcdcWl4SJTBJoJXH755Z169OjxqJ7GE978O3e//fa78dZbb21oVpgEBBAoikDNB+WLl9UFi5euKAomGymfQH19+d4n9Ca109y5c/fdaaed9tMb2N4a10pi0S677LLw9ttv31g+leLvuaGhMZi3aGnxN8wWSyqwacuWku6PnVWeQM+ePb+rR6NertEqv0bXt/8hIK+880iNK0ug5oPyyjpd1DZJAtdcc815eqP68sKFC/+rQ4cOe2bXbf369Q3XXXfdG1u3bn2yW7duj+UToH/ta1/buVOnTk+F21KAf/vdd9/9RrjMFIGkC9xwww2HNTY2/q2Qeur/fJnKz9BrZXr79u2H/POf/1xQyPpJKnvttddeqeO5wuqkgPaZe++994Ek1S+fulx//fUH6Fz8JF22XsfxWZ2TCfmsW2iZavAq9JhLWV6+N+r/8ZL0Ph++5557+pRy/7n2xfnP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
5	"{\\"data\\":[40,84,70],\\"backgroundColor\\":[\\"#25ef57\\",\\"#5a0abd\\",\\"#ea4710\\"],\\"label\\":\\"\\",\\"labels\\":[\\"Ansiedade\\",\\"Comunicação\\",\\"Sociabilidade\\"]}"	Pizza	WISC	2021-01-25 02:45:18.45331	2021-01-25 18:39:23.170008	5	iVBORw0KGgoAAAANSUhEUgAAAhMAAAITCAYAAAC9o54kAAAgAElEQVR4XuydB3iUxfbG37PpjQ6KiCBYQFAUlY6AICAgKkUUsVIUFVQEKYL12gDFDoK9XMXu33JFBcu9NlSsICqiFCsQ0nt2/s982Q2bJUCSbfN93zuPeYjZb2bO+Z3J5t1pR8BCAiRAAiRAAiRAAiEQkBDqsioJkAAJkAAJkAAJgGKCg4AESIAESIAESCAkAhQTIeFjZRIgARIgARIgAYoJjgESIAESIAESIIGQCFBMhISPlUmABEiABEiABCgmOAZIgARIgARIgARCIkAxERI+ViYBEiABEiABEqCY4BggARIgARIgARIIiQDFREj4WJkESIAESIAESIBigmOABEiABEiABEggJAIUEyHhY2USIAESIAESIAGKCY4BEnA4gYsvvriF1+v9GMAnS5cuPVO7O2nSpGcBjAGwPOhn3QEMUko9pJ9LTk4ecu+99+ZMmTKlXlFR0Zsi0lP/XCn1kf81/f8BfRzkw5mt21m6dOlnDsdL90iABABep81RQAJOJ+AXAn5xoP8NEAabPR5Pj4SEhFz9M/1aXFzcmPLy8uWBYmLixInXish4/Wx5eXk3EXlBKXXdsmXLbpw0aVJXACsAvOUXJr7nb1BKjVq2bNmLTmdM/0jA7QQ4M+H2EUD/XUHANxMxWM8W+BzWf/zrA7BmEPw/U0rdmZycfJdfWPhnH/wzGdWJA99r3bXQWLJkye+uAEonSYAEqhCgmOCAIAEXEJg4ceJI32zCKAAdRGSanlkQET17cCeAtf7Xk5OT39mTmPAtcVgzEkHLG5VLKC7ASRdJgASCCFBMcEiQgAsI+JcitHAQkSOUUgcqpSZ6PJ639F4KpdQ6LTD0LEVSUtIPwWKimj0R1vKIRhe8H8MFOOkiCZAAxQTHAAm4j4BfDCiltohIS/9mTP8Shf65pqKXNfS/wWLCTyxg46b+0XKPx3MVxYT7xhM9JoFgApyZ4JggAZcQCBQC/r0P/o2SPgTWyY7gDZv6NEcgokBhosVHcXHxUgDcM+GScUQ3SaA6AhQTHBck4BICAcKh8thmwEmM+v7TGcFiorS0NEPPPujZCy0e/P8fMLvB0xwuGUN0kwT2RIBigmODBFxCIGATZuUdEQF7IfTJDuteiOpmJgJFh8ZVg3sm9DM8FuqSsUU3SYBigmOABEiABEiABEggJAIUEyHhY2USIAESIAESIAGKCY4BEiABEiABEiCBkAhQTISEj5VJgARIgARIgAQoJjgGSIAESIAESIAEQiJAMRESPlYmARIgARIgARKgmOAYIAESIAESIAESCIkAxURI+FiZBEiABEiABEiAYoJjgARIgARIgARIICQCFBMh4WNlEiABEiABEiABigmOARIgARIgARIggZAIUEyEhI+VSYAESIAESIAEKCY4BkiABEiABEiABEIiQDEREj5WJgESIAESIAESoJjgGCABEiABEiABEgiJAMVESPhYmQRIgARIgARIgGKCY4AESIAESIAESCAkAhQTIeFjZRIgARIgARIgAYoJjgESIAESIAESIIGQCFBMhISPlUmABEiABEiABCgmOAZIgARIgARIgARCIkAxERI+ViYBEiABEiABEqCYCPMYUEr1AnBOmJuNSHMiclFEGrZ5o0qpmwE0sYEbm0TkFhvYaTsTlVKHA5hmB8P5e2yHKDnfRoqJMMfYJyb+G+ZmI9Hc/0SkdyQatnubPjExxwZ+XEMxAVx88cUtvF7vx0qpLR6P5wal1JVJSUln3nvvvTl1jaFPTKyva/0o1vtRRNpFsT92RQLVEqCYCPPA8IuJL8t+xCslH4a59fA0d1PqRN3QXsXElClT6hUVFb0pIluXLl16Zig9T5o06Vml1Lply5bdWNN2Jk6ceC2AgcnJyUNq+kch4I/KtGXLlr1Y076Cn/OLieeu/wW5O0rr2kzE6jU5KAWnzmil29+jmAiIX0+fIZs9Hk+PJUuW/B4xw/bRsN8mAItCiU9wNxMnThwJoAOAtSLyglLqutqMterM9ouJ8q0bUPDifbFCttd+My6/S7++RzExadKkrgBWAKivH1RKfVSb36fgzmvye+yLxZXV9eOvn5ycfJd+b9HjwNfHbs8HjJW3axNL3b+I3BnrsW7kgImwURQTYQYcKCbOyrsuzK2H3tyx8YfjmfQb9ikm/G8K+sG4uLgx0f4jZIqYeHXBptChh7mFM65vu1cxUZ0Q5Jts7YIQKCYyJxxfu8pReDruwEPQ6KHP9ygm/EJCKTXeL9x8f8wPDEVQ7Mu1vYkJf92aiEqKiX2RNu91iokwx8QpYsL3xvO8iIwOnFXw/VG63oetI4BsAIOWLl36WdAnocCfV85MBD1T5dOyr+0X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
8	"{\\"data\\":[\\"10\\",\\"4\\",\\"6\\"],\\"backgroundColor\\":[\\"#d53454\\",\\"#708090\\",\\"#ffe642\\"],\\"label\\":\\"\\",\\"labels\\":[\\"Teste 1\\",\\"Teste 2\\",\\"Teste 3\\"]}"	Pizza	Teste	2021-01-29 19:01:09.227144	2021-01-29 19:06:30.519475	8	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
10	"{}"	Barra		2021-02-05 20:32:19.123753	2021-02-05 20:32:19.123753	10	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
\.


--
-- Data for Name: laudos; Type: TABLE DATA; Schema: public; Owner: elephant
--

COPY public.laudos (id, crp, solicitante, description, procedure, analysis, conclusion, "references", kind, created_at, updated_at, patient_id) FROM stdin;
1	asd	asdasd	asd	asd	asd	asd	asd	Psicológico	2021-01-23 04:04:18.175016	2021-01-23 04:04:18.175016	1
2	0543797	Sananda	Ansiedade	Wais\r\n	De acordo com a...	Mairkon...	@sananda_lopes_neuropsicologa	Psicológico	2021-01-23 18:45:42.065691	2021-01-23 18:45:42.065691	6
5	4645465	Governo 	Elefante é o termo genérico e popular pelo qual são denominados os membros da família Elephantidae, um grupo de mamíferos proboscídeos elefantídeos, de grande porte, do qual há três espécies no mundo atual, duas africanas e uma asiática. Há ainda os mamutes, hoje extintos.	A avaliação consistiu na aplicação de uma série de instrumentos\r\nneuropsicológicos visando a análise de habilidades intelectuais e\r\naspectos cognitivos.\r\nOs instrumentos utilizados foram:\r\n• Entrevistas com responsáveis;\r\n• Escala de inteligência Wechsler para crianças (WISC – IV);\r\n• Bateria Psicológica para Avaliação da Atenção (BPA);\r\n• Figuras complexas de Rey;\r\n• Escala de Avaliação de Comportamentos Infanto-juvenis no\r\nTranstorno de Déficit de Atenção / Hiperatividade em Ambiente\r\nFamiliar, versão para pais. (ETDAH – Pais)	Elefante é o termo genérico e popular pelo qual são denominados os membros da família Elephantidae, um grupo de mamíferos proboscídeos elefantídeos, de grande porte, do qual há três espécies no mundo atual, duas africanas e uma asiática. Há ainda os mamutes, hoje extintos.	Elefante é o termo genérico e popular pelo qual são denominados os membros da família Elephantidae, um grupo de mamíferos proboscídeos elefantídeos, de grande porte, do qual há três espécies no mundo atual, duas africanas e uma asiática. Há ainda os mamutes, hoje extintos.	Elefante é o termo genérico e popular pelo qual são denominados os membros da família Elephantidae, um grupo de mamíferos proboscídeos elefantídeos, de grande porte, do qual há três espécies no mundo atual, duas africanas e uma asiática. Há ainda os mamutes, hoje extintos.	Neuropsicológico	2021-01-25 02:45:18.450168	2021-01-25 18:37:29.302251	5
8	4645465	Anônimo	Teste Teste Teste Teste Teste Teste Teste Teste Teste Teste Teste Teste Teste Teste Teste Teste Teste Teste Teste Teste Teste Teste Teste Teste Teste Teste Teste Teste Teste Teste Teste Teste Teste Teste Teste 	Teste Teste Teste Teste Teste Teste Teste Teste Teste Teste Teste Teste Teste Teste Teste Teste Teste Teste Teste Teste Teste Teste Teste Teste Teste Teste Teste Teste Teste Teste Teste Teste Teste Teste Teste Teste Teste Teste Teste Teste Teste Teste Teste Teste Teste Teste Teste Teste Teste Teste Teste Teste Teste Teste Teste Teste Teste Teste Teste Teste Teste Teste Teste Teste Teste Teste Teste Teste Teste Teste Teste Teste Teste Teste Teste Teste Teste Teste Teste Teste Teste Teste Teste Teste Teste Teste Teste Teste	Teste Teste Teste Teste Teste Teste Teste Teste Teste Teste Teste Teste Teste Teste Teste Teste Teste Teste Teste Teste Teste Teste Teste Teste Teste Teste Teste Teste Teste Teste Teste Teste Teste Teste Teste 	Teste Teste Teste Teste Teste Teste Teste Teste Teste Teste Teste Teste Teste Teste Teste Teste Teste Teste Teste Teste Teste Teste Teste Teste Teste Teste Teste Teste Teste Teste Teste Teste Teste Teste Teste 	Teste Teste Teste Teste Teste Teste Teste Teste Teste Teste Teste Teste Teste Teste Teste Teste Teste Teste Teste Teste Teste Teste Teste Teste Teste Teste Teste Teste Teste Teste Teste Teste Teste Teste Teste 	Neuropsicológico	2021-01-29 19:01:09.225103	2021-01-29 19:06:30.517634	14
10	0000-5	Anônimo	De uma forma geral, a avaliação psicológica pode ser definida como um conjunto de técnicas e procedimentos que tem o objetivo de verificar determinadas características psicológicas de uma pessoa, sendo o psicólogo o único profissional habilitado por lei para exercer esta função (CFP 007/2003).	De uma forma geral, a avaliação psicológica pode ser definida como um conjunto de técnicas e procedimentos que tem o objetivo de verificar determinadas características psicológicas de uma pessoa, sendo o psicólogo o único profissional habilitado por lei para exercer esta função (CFP 007/2003).	De uma forma geral, a avaliação psicológica pode ser definida como um conjunto de técnicas e procedimentos que tem o objetivo de verificar determinadas características psicológicas de uma pessoa, sendo o psicólogo o único profissional habilitado por lei para exercer esta função (CFP 007/2003).	De uma forma geral, a avaliação psicológica pode ser definida como um conjunto de técnicas e procedimentos que tem o objetivo de verificar determinadas características psicológicas de uma pessoa, sendo o psicólogo o único profissional habilitado por lei para exercer esta função (CFP 007/2003).	De uma forma geral, a avaliação psicológica pode ser definida como um conjunto de técnicas e procedimentos que tem o objetivo de verificar determinadas características psicológicas de uma pessoa, sendo o psicólogo o único profissional habilitado por lei para exercer esta função (CFP 007/2003).	Psicológico	2021-02-05 20:32:19.118899	2021-02-05 20:32:19.118899	14
\.


--
-- Data for Name: notifications; Type: TABLE DATA; Schema: public; Owner: elephant
--

COPY public.notifications (id, status, data, created_at, updated_at) FROM stdin;
3	0	{"notificationCode":"DF7988-EE90F490F476-04448A3FA6DF-664CF0","notificationType":"preApproval","controller":"notifications","action":"create"}	2021-01-15 00:30:42.721676	2021-01-15 00:30:42.721676
4	2	{"notificationCode":"B580CD-91B343B3431E-A004564FB2AF-C374F9","notificationType":"preApproval","controller":"notifications","action":"create"}	2021-01-15 11:21:50.528542	2021-01-15 11:21:57.582634
5	2	{"notificationCode":"067694-5838063806FE-C0048FBFA49E-80A96B","notificationType":"preApproval","controller":"notifications","action":"create"}	2021-01-15 11:22:11.230735	2021-01-15 11:22:18.121788
6	2	{"notificationCode":"2E1CDA-1FF449F4498D-ADD4371F9E78-F92700","notificationType":"preApproval","controller":"notifications","action":"create"}	2021-01-15 15:36:58.832887	2021-01-15 15:37:05.933799
7	2	{"notificationCode":"BB0568-4E77097709D1-7884E69FA4CE-C8C8EF","notificationType":"preApproval","controller":"notifications","action":"create"}	2021-01-15 17:06:58.773662	2021-01-15 17:07:05.777518
8	2	{"notificationCode":"6C7BA3-3EE355E355C0-E004A07F9C80-A3D912","notificationType":"transaction","controller":"notifications","action":"create"}	2021-01-16 15:10:31.500661	2021-01-16 15:10:31.541407
9	2	{"notificationCode":"67297A-EA109C109C17-7FF4B10FA380-2B50F9","notificationType":"preApproval","controller":"notifications","action":"create"}	2021-01-22 18:49:52.881685	2021-01-22 18:49:59.142085
10	2	{"notificationCode":"5BBD03-DD03550355A0-3994AFCF93B7-7403C2","notificationType":"preApproval","controller":"notifications","action":"create"}	2021-01-22 19:34:36.596092	2021-01-22 19:34:43.408219
11	2	{"notificationCode":"6F40BD-57E5D8E5D893-7554414FBE74-9DFDC4","notificationType":"preApproval","controller":"notifications","action":"create"}	2021-01-22 19:35:47.190432	2021-01-22 19:35:53.210362
12	2	{"notificationCode":"185911-CFB8F1B8F169-E224FFCF9041-754DE1","notificationType":"transaction","controller":"notifications","action":"create"}	2021-01-23 14:46:39.902848	2021-01-23 14:46:39.966393
13	2	{"notificationCode":"1A42A8-8070AE70AEB7-3DD481BFB687-96C651","notificationType":"preApproval","controller":"notifications","action":"create"}	2021-01-23 14:46:40.68053	2021-01-23 14:46:41.351395
14	2	{"notificationCode":"185911-CFB8F1B8F169-E224FFCF9041-754DE1","notificationType":"transaction","controller":"notifications","action":"create"}	2021-01-23 17:15:27.889811	2021-01-23 17:15:27.924037
15	2	{"notificationCode":"185911-CFB8F1B8F169-E224FFCF9041-754DE1","notificationType":"transaction","controller":"notifications","action":"create"}	2021-01-23 19:15:45.285472	2021-01-23 19:15:45.31956
16	2	{"notificationCode":"185911-CFB8F1B8F169-E224FFCF9041-754DE1","notificationType":"transaction","controller":"notifications","action":"create"}	2021-01-23 21:16:09.038165	2021-01-23 21:16:09.206247
17	2	{"notificationCode":"185911-CFB8F1B8F169-E224FFCF9041-754DE1","notificationType":"transaction","controller":"notifications","action":"create"}	2021-01-23 23:16:32.792485	2021-01-23 23:16:32.828848
18	2	{"notificationCode":"185911-CFB8F1B8F169-E224FFCF9041-754DE1","notificationType":"transaction","controller":"notifications","action":"create"}	2021-01-24 01:20:04.965622	2021-01-24 01:20:05.215303
19	2	{"notificationCode":"99B8FA-70E92EE92E04-8224FDEF86DF-2958DA","notificationType":"transaction","controller":"notifications","action":"create"}	2021-01-29 15:03:26.032134	2021-01-29 15:03:26.077981
20	2	{"notificationCode":"93D220-1EE4B8E4B814-71143B5FB5F9-86D825","notificationType":"preApproval","controller":"notifications","action":"create"}	2021-01-29 15:06:41.397559	2021-01-29 15:06:42.288637
21	2	{"notificationCode":"E2B39C-59199D199D7B-B884D77FA61F-113B36","notificationType":"preApproval","controller":"notifications","action":"create"}	2021-01-29 15:08:06.426121	2021-01-29 15:08:07.311473
22	2	{"notificationCode":"ADE5E0-FBAE4CAE4CDB-8114193FA21C-E41B8F","notificationType":"transaction","controller":"notifications","action":"create"}	2021-01-29 15:10:04.055845	2021-01-29 15:10:04.068695
23	2	{"notificationCode":"ADE5E0-FBAE4CAE4CDB-8114193FA21C-E41B8F","notificationType":"transaction","controller":"notifications","action":"create"}	2021-01-29 17:15:53.778443	2021-01-29 17:15:53.803973
24	2	{"notificationCode":"ADE5E0-FBAE4CAE4CDB-8114193FA21C-E41B8F","notificationType":"transaction","controller":"notifications","action":"create"}	2021-01-29 19:16:20.362851	2021-01-29 19:16:20.39156
25	2	{"notificationCode":"ADE5E0-FBAE4CAE4CDB-8114193FA21C-E41B8F","notificationType":"transaction","controller":"notifications","action":"create"}	2021-01-29 23:15:17.001349	2021-01-29 23:15:17.0266
26	2	{"notificationCode":"ADE5E0-FBAE4CAE4CDB-8114193FA21C-E41B8F","notificationType":"transaction","controller":"notifications","action":"create"}	2021-01-30 03:15:13.046361	2021-01-30 03:15:13.072328
27	2	{"notificationCode":"270AEC-B17E787E78A6-5CC4C1EF87D5-924C59","notificationType":"transaction","controller":"notifications","action":"create"}	2021-01-30 04:53:03.546207	2021-01-30 04:53:03.571872
28	2	{"notificationCode":"ADE5E0-FBAE4CAE4CDB-8114193FA21C-E41B8F","notificationType":"transaction","controller":"notifications","action":"create"}	2021-01-30 05:21:50.961358	2021-01-30 05:21:51.004572
29	2	{"notificationCode":"270AEC-B17E787E78A6-5CC4C1EF87D5-924C59","notificationType":"transaction","controller":"notifications","action":"create"}	2021-01-30 07:16:03.503558	2021-01-30 07:16:03.527758
30	2	{"notificationCode":"270AEC-B17E787E78A6-5CC4C1EF87D5-924C59","notificationType":"transaction","controller":"notifications","action":"create"}	2021-01-30 09:15:54.487121	2021-01-30 09:15:54.515665
31	2	{"notificationCode":"270AEC-B17E787E78A6-5CC4C1EF87D5-924C59","notificationType":"transaction","controller":"notifications","action":"create"}	2021-01-30 11:16:37.935519	2021-01-30 11:16:37.96204
32	2	{"notificationCode":"270AEC-B17E787E78A6-5CC4C1EF87D5-924C59","notificationType":"transaction","controller":"notifications","action":"create"}	2021-01-30 13:17:45.461652	2021-01-30 13:17:45.494193
33	2	{"notificationCode":"270AEC-B17E787E78A6-5CC4C1EF87D5-924C59","notificationType":"transaction","controller":"notifications","action":"create"}	2021-01-30 15:18:58.15286	2021-01-30 15:18:58.176511
34	2	{"notificationCode":"409A96-DF7BD07BD054-2FF45C5FBA6D-FF48CE","notificationType":"transaction","controller":"notifications","action":"create"}	2021-01-31 23:07:13.921708	2021-01-31 23:07:13.950474
35	2	{"notificationCode":"41F70D-BC2CDA2CDA74-B994B28F9EC0-2DB281","notificationType":"preApproval","controller":"notifications","action":"create"}	2021-01-31 23:07:14.316885	2021-01-31 23:07:14.9833
36	2	{"notificationCode":"4A4FBF-71122E122E15-51144D4FA3F6-85FDC2","notificationType":"transaction","controller":"notifications","action":"create"}	2021-01-31 23:07:16.314394	2021-01-31 23:07:16.324473
37	2	{"notificationCode":"C22A78-3406B406B45D-8DD49E9F96C5-8D9262","notificationType":"preApproval","controller":"notifications","action":"create"}	2021-01-31 23:09:58.07194	2021-01-31 23:09:58.747767
38	2	{"notificationCode":"BDC273-69BC23BC23AB-C334BEEFA6A8-8A0593","notificationType":"transaction","controller":"notifications","action":"create"}	2021-01-31 23:26:19.963511	2021-01-31 23:26:19.987746
39	2	{"notificationCode":"BF8D53-177150715049-83347F2FAFE6-04D175","notificationType":"preApproval","controller":"notifications","action":"create"}	2021-01-31 23:26:20.38422	2021-01-31 23:26:21.119301
40	2	{"notificationCode":"C73A7F-A4676167612A-A994260FAD75-D73E0C","notificationType":"transaction","controller":"notifications","action":"create"}	2021-01-31 23:26:21.851318	2021-01-31 23:26:21.860927
41	2	{"notificationCode":"66939F-118450845041-3BB4B94F925E-6ECBAA","notificationType":"preApproval","controller":"notifications","action":"create"}	2021-01-31 23:31:25.167266	2021-01-31 23:31:26.007858
42	2	{"notificationCode":"4A4FBF-71122E122E15-51144D4FA3F6-85FDC2","notificationType":"transaction","controller":"notifications","action":"create"}	2021-02-01 01:15:28.264227	2021-02-01 01:15:28.293499
43	2	{"notificationCode":"C73A7F-A4676167612A-A994260FAD75-D73E0C","notificationType":"transaction","controller":"notifications","action":"create"}	2021-02-01 01:16:22.564142	2021-02-01 01:16:22.574657
44	2	{"notificationCode":"4A4FBF-71122E122E15-51144D4FA3F6-85FDC2","notificationType":"transaction","controller":"notifications","action":"create"}	2021-02-01 03:15:39.315785	2021-02-01 03:15:39.344485
45	2	{"notificationCode":"C73A7F-A4676167612A-A994260FAD75-D73E0C","notificationType":"transaction","controller":"notifications","action":"create"}	2021-02-01 03:15:58.829548	2021-02-01 03:15:58.841665
46	2	{"notificationCode":"4A4FBF-71122E122E15-51144D4FA3F6-85FDC2","notificationType":"transaction","controller":"notifications","action":"create"}	2021-02-01 05:21:03.668965	2021-02-01 05:21:03.692855
47	2	{"notificationCode":"C73A7F-A4676167612A-A994260FAD75-D73E0C","notificationType":"transaction","controller":"notifications","action":"create"}	2021-02-01 05:21:06.134841	2021-02-01 05:21:06.147001
48	2	{"notificationCode":"4A4FBF-71122E122E15-51144D4FA3F6-85FDC2","notificationType":"transaction","controller":"notifications","action":"create"}	2021-02-01 07:20:10.93827	2021-02-01 07:20:10.961531
49	2	{"notificationCode":"C73A7F-A4676167612A-A994260FAD75-D73E0C","notificationType":"transaction","controller":"notifications","action":"create"}	2021-02-01 07:20:12.729672	2021-02-01 07:20:12.73901
50	2	{"notificationCode":"4A4FBF-71122E122E15-51144D4FA3F6-85FDC2","notificationType":"transaction","controller":"notifications","action":"create"}	2021-02-01 09:19:22.558303	2021-02-01 09:19:22.586763
51	2	{"notificationCode":"C73A7F-A4676167612A-A994260FAD75-D73E0C","notificationType":"transaction","controller":"notifications","action":"create"}	2021-02-01 11:15:29.072863	2021-02-01 11:15:29.095697
53	2	{"notificationCode":"D00E44-EE5ABA5ABA93-4004FD5FBDF2-451148","notificationType":"transaction","controller":"notifications","action":"create"}	2021-02-01 21:10:34.681782	2021-02-01 21:10:34.705471
54	2	{"notificationCode":"D3B5E4-B09372937275-56647B2F9D63-CCC6BC","notificationType":"transaction","controller":"notifications","action":"create"}	2021-02-01 21:10:35.025191	2021-02-01 21:10:35.035206
52	2	{"notificationCode":"CF9135-3C0FA10FA197-AAA4852F8807-BE03CE","notificationType":"preApproval","controller":"notifications","action":"create"}	2021-02-01 21:10:34.409978	2021-02-01 21:10:35.085992
55	2	{"notificationCode":"D3FC61-8098AE98AE86-1AA4A0BFB853-84616F","notificationType":"transaction","controller":"notifications","action":"create"}	2021-02-01 21:10:35.354422	2021-02-01 21:10:35.366946
56	2	{"notificationCode":"D536AF-B5609E609E49-2BB475FF8733-DE58ED","notificationType":"preApproval","controller":"notifications","action":"create"}	2021-02-01 21:10:35.92186	2021-02-01 21:10:36.618298
57	2	{"notificationCode":"D796F7-D6607A607AA1-F114066F9471-BF2548","notificationType":"preApproval","controller":"notifications","action":"create"}	2021-02-01 21:10:36.364364	2021-02-01 21:10:37.012033
58	2	{"notificationCode":"DE0297-27DC61DC612F-E4441E7F956A-60ADB5","notificationType":"transaction","controller":"notifications","action":"create"}	2021-02-01 21:10:37.660292	2021-02-01 21:10:37.670164
59	2	{"notificationCode":"E294CD-B1CD53CD5341-1334888F8C36-44525D","notificationType":"transaction","controller":"notifications","action":"create"}	2021-02-01 21:10:38.853081	2021-02-01 21:10:38.862453
62	2	{"notificationCode":"DE0297-27DC61DC612F-E4441E7F956A-60ADB5","notificationType":"transaction","controller":"notifications","action":"create"}	2021-02-01 23:15:51.339522	2021-02-01 23:15:51.484342
61	2	{"notificationCode":"E294CD-B1CD53CD5341-1334888F8C36-44525D","notificationType":"transaction","controller":"notifications","action":"create"}	2021-02-01 23:15:51.33537	2021-02-01 23:15:51.491153
60	2	{"notificationCode":"D00E44-EE5ABA5ABA93-4004FD5FBDF2-451148","notificationType":"transaction","controller":"notifications","action":"create"}	2021-02-01 23:15:51.304628	2021-02-01 23:15:51.493664
63	2	{"notificationCode":"FC9F36-05C13BC13B00-FDD4322FB41C-8C9281","notificationType":"preApproval","controller":"notifications","action":"create"}	2021-02-01 23:57:53.13905	2021-02-01 23:57:53.942796
66	2	{"notificationCode":"D00E44-EE5ABA5ABA93-4004FD5FBDF2-451148","notificationType":"transaction","controller":"notifications","action":"create"}	2021-02-02 01:15:55.427055	2021-02-02 01:15:55.471714
65	2	{"notificationCode":"E294CD-B1CD53CD5341-1334888F8C36-44525D","notificationType":"transaction","controller":"notifications","action":"create"}	2021-02-02 01:15:55.425601	2021-02-02 01:15:55.473944
64	2	{"notificationCode":"DE0297-27DC61DC612F-E4441E7F956A-60ADB5","notificationType":"transaction","controller":"notifications","action":"create"}	2021-02-02 01:15:55.422473	2021-02-02 01:15:55.479283
67	2	{"notificationCode":"D00E44-EE5ABA5ABA93-4004FD5FBDF2-451148","notificationType":"transaction","controller":"notifications","action":"create"}	2021-02-02 03:16:14.62721	2021-02-02 03:16:14.670667
68	2	{"notificationCode":"DE0297-27DC61DC612F-E4441E7F956A-60ADB5","notificationType":"transaction","controller":"notifications","action":"create"}	2021-02-02 03:16:14.64188	2021-02-02 03:16:14.676666
69	2	{"notificationCode":"E294CD-B1CD53CD5341-1334888F8C36-44525D","notificationType":"transaction","controller":"notifications","action":"create"}	2021-02-02 03:16:14.758147	2021-02-02 03:16:14.771307
70	2	{"notificationCode":"DE0297-27DC61DC612F-E4441E7F956A-60ADB5","notificationType":"transaction","controller":"notifications","action":"create"}	2021-02-02 05:20:14.073846	2021-02-02 05:20:14.10843
71	2	{"notificationCode":"E294CD-B1CD53CD5341-1334888F8C36-44525D","notificationType":"transaction","controller":"notifications","action":"create"}	2021-02-02 05:20:14.163934	2021-02-02 05:20:14.176562
72	2	{"notificationCode":"D00E44-EE5ABA5ABA93-4004FD5FBDF2-451148","notificationType":"transaction","controller":"notifications","action":"create"}	2021-02-02 05:20:14.284394	2021-02-02 05:20:14.29674
73	2	{"notificationCode":"DE0297-27DC61DC612F-E4441E7F956A-60ADB5","notificationType":"transaction","controller":"notifications","action":"create"}	2021-02-02 07:24:40.258895	2021-02-02 07:24:40.298392
74	2	{"notificationCode":"D00E44-EE5ABA5ABA93-4004FD5FBDF2-451148","notificationType":"transaction","controller":"notifications","action":"create"}	2021-02-02 07:24:40.326862	2021-02-02 07:24:40.339229
75	2	{"notificationCode":"E294CD-B1CD53CD5341-1334888F8C36-44525D","notificationType":"transaction","controller":"notifications","action":"create"}	2021-02-02 07:24:40.343095	2021-02-02 07:24:40.353778
76	2	{"notificationCode":"4CA30D-F69AED9AED5A-AFF4D78F93F3-8E8CE2","notificationType":"preApproval","controller":"notifications","action":"create"}	2021-02-02 16:34:22.503356	2021-02-02 16:34:23.225742
77	2	{"notificationCode":"1667FB-E9823E823E1F-41149D5FAA28-205863","notificationType":"preApproval","controller":"notifications","action":"create"}	2021-02-02 22:05:05.992542	2021-02-02 22:05:06.759166
78	2	{"notificationCode":"3FD6BE-C8B30CB30C33-4994FE4FB154-426CAE","notificationType":"preApproval","controller":"notifications","action":"create"}	2021-02-02 22:05:15.896068	2021-02-02 22:05:16.565293
79	2	{"notificationCode":"A4A3B7-D796A896A8FF-E4445A6FA058-0354FF","notificationType":"transaction","controller":"notifications","action":"create"}	2021-02-02 22:10:04.237213	2021-02-02 22:10:04.248747
80	2	{"notificationCode":"D10E9B-8E99A599A5C5-69946F5FB542-A8524E","notificationType":"transaction","controller":"notifications","action":"create"}	2021-02-02 22:10:15.567182	2021-02-02 22:10:15.582557
81	2	{"notificationCode":"A4A3B7-D796A896A8FF-E4445A6FA058-0354FF","notificationType":"transaction","controller":"notifications","action":"create"}	2021-02-02 23:18:25.255145	2021-02-02 23:18:25.305958
82	2	{"notificationCode":"D10E9B-8E99A599A5C5-69946F5FB542-A8524E","notificationType":"transaction","controller":"notifications","action":"create"}	2021-02-02 23:18:25.274107	2021-02-02 23:18:25.332301
83	2	{"notificationCode":"A4A3B7-D796A896A8FF-E4445A6FA058-0354FF","notificationType":"transaction","controller":"notifications","action":"create"}	2021-02-03 01:17:18.490556	2021-02-03 01:17:18.527919
84	2	{"notificationCode":"D10E9B-8E99A599A5C5-69946F5FB542-A8524E","notificationType":"transaction","controller":"notifications","action":"create"}	2021-02-03 01:17:18.586285	2021-02-03 01:17:18.601147
85	2	{"notificationCode":"A4A3B7-D796A896A8FF-E4445A6FA058-0354FF","notificationType":"transaction","controller":"notifications","action":"create"}	2021-02-03 03:18:19.094261	2021-02-03 03:18:19.130612
86	2	{"notificationCode":"D10E9B-8E99A599A5C5-69946F5FB542-A8524E","notificationType":"transaction","controller":"notifications","action":"create"}	2021-02-03 03:18:19.129785	2021-02-03 03:18:19.166035
87	2	{"notificationCode":"A4A3B7-D796A896A8FF-E4445A6FA058-0354FF","notificationType":"transaction","controller":"notifications","action":"create"}	2021-02-03 05:20:39.180107	2021-02-03 05:20:39.228083
88	2	{"notificationCode":"D10E9B-8E99A599A5C5-69946F5FB542-A8524E","notificationType":"transaction","controller":"notifications","action":"create"}	2021-02-03 05:20:39.225185	2021-02-03 05:20:39.266487
89	2	{"notificationCode":"D10E9B-8E99A599A5C5-69946F5FB542-A8524E","notificationType":"transaction","controller":"notifications","action":"create"}	2021-02-03 07:24:17.142186	2021-02-03 07:24:17.185541
90	2	{"notificationCode":"A4A3B7-D796A896A8FF-E4445A6FA058-0354FF","notificationType":"transaction","controller":"notifications","action":"create"}	2021-02-03 07:24:17.154818	2021-02-03 07:24:17.195128
91	2	{"notificationCode":"EEA76D-BB28492849CC-B114470FB267-D48C03","notificationType":"transaction","controller":"notifications","action":"create"}	2021-02-03 23:35:11.679386	2021-02-03 23:35:11.714678
92	2	{"notificationCode":"F0736A-3AEB46EB4680-4FF4BCEFAEDF-3B1961","notificationType":"preApproval","controller":"notifications","action":"create"}	2021-02-03 23:35:12.196326	2021-02-03 23:35:12.909289
93	2	{"notificationCode":"F9D9F8-441038103892-8DD4F3DFAAD3-3DF2D7","notificationType":"transaction","controller":"notifications","action":"create"}	2021-02-03 23:35:14.599164	2021-02-03 23:35:14.612607
94	2	{"notificationCode":"5CA185-6B962E962E81-6224F1FFB965-EF5EF7","notificationType":"preApproval","controller":"notifications","action":"create"}	2021-02-03 23:41:07.379075	2021-02-03 23:41:08.080445
95	2	{"notificationCode":"6F8CE5-DD9614961414-2444721FAE70-C96672","notificationType":"transaction","controller":"notifications","action":"create"}	2021-02-04 00:30:21.341183	2021-02-04 00:30:21.383813
96	2	{"notificationCode":"72A887-7973327332AB-A77487CFA211-0750F2","notificationType":"preApproval","controller":"notifications","action":"create"}	2021-02-04 00:30:22.23438	2021-02-04 00:30:22.895557
97	2	{"notificationCode":"7C522E-8154C654C69B-1EE45C7F892B-4A8F1A","notificationType":"transaction","controller":"notifications","action":"create"}	2021-02-04 00:30:24.746497	2021-02-04 00:30:24.763786
98	2	{"notificationCode":"2A8646-2A2B482B4837-7DD48DCFBBFF-30012B","notificationType":"preApproval","controller":"notifications","action":"create"}	2021-02-04 00:57:22.144837	2021-02-04 00:57:22.948044
99	2	{"notificationCode":"F9D9F8-441038103892-8DD4F3DFAAD3-3DF2D7","notificationType":"transaction","controller":"notifications","action":"create"}	2021-02-04 01:17:55.134962	2021-02-04 01:17:55.186239
100	2	{"notificationCode":"7C522E-8154C654C69B-1EE45C7F892B-4A8F1A","notificationType":"transaction","controller":"notifications","action":"create"}	2021-02-04 01:18:31.705546	2021-02-04 01:18:31.718832
101	2	{"notificationCode":"2CECAF-39B4ACB4AC1F-89942F2F9766-4C1DF9","notificationType":"transaction","controller":"notifications","action":"create"}	2021-02-04 01:37:47.451151	2021-02-04 01:37:47.487408
102	2	{"notificationCode":"2E00CA-D869766976F8-BFF4AB4FBDA2-631F9C","notificationType":"preApproval","controller":"notifications","action":"create"}	2021-02-04 01:37:47.692613	2021-02-04 01:37:48.425722
103	2	{"notificationCode":"388D5C-7DAC13AC132C-AFF44A1FAD70-0D5D80","notificationType":"transaction","controller":"notifications","action":"create"}	2021-02-04 01:37:50.032021	2021-02-04 01:37:50.046173
104	2	{"notificationCode":"C707EB-B5D763D76390-33342F8FA7F9-25D9B0","notificationType":"preApproval","controller":"notifications","action":"create"}	2021-02-04 02:04:39.96588	2021-02-04 02:04:40.666826
105	2	{"notificationCode":"F9D9F8-441038103892-8DD4F3DFAAD3-3DF2D7","notificationType":"transaction","controller":"notifications","action":"create"}	2021-02-04 03:17:11.017454	2021-02-04 03:17:11.055066
106	2	{"notificationCode":"388D5C-7DAC13AC132C-AFF44A1FAD70-0D5D80","notificationType":"transaction","controller":"notifications","action":"create"}	2021-02-04 03:17:46.288327	2021-02-04 03:17:46.297758
107	2	{"notificationCode":"7C522E-8154C654C69B-1EE45C7F892B-4A8F1A","notificationType":"transaction","controller":"notifications","action":"create"}	2021-02-04 03:18:44.999067	2021-02-04 03:18:45.011821
108	2	{"notificationCode":"388D5C-7DAC13AC132C-AFF44A1FAD70-0D5D80","notificationType":"transaction","controller":"notifications","action":"create"}	2021-02-04 05:16:47.948604	2021-02-04 05:16:47.990631
109	2	{"notificationCode":"F9D9F8-441038103892-8DD4F3DFAAD3-3DF2D7","notificationType":"transaction","controller":"notifications","action":"create"}	2021-02-04 05:22:00.492778	2021-02-04 05:22:00.507542
110	2	{"notificationCode":"7C522E-8154C654C69B-1EE45C7F892B-4A8F1A","notificationType":"transaction","controller":"notifications","action":"create"}	2021-02-04 05:22:26.301165	2021-02-04 05:22:26.322477
111	2	{"notificationCode":"388D5C-7DAC13AC132C-AFF44A1FAD70-0D5D80","notificationType":"transaction","controller":"notifications","action":"create"}	2021-02-04 07:22:14.09413	2021-02-04 07:22:14.136968
112	2	{"notificationCode":"F9D9F8-441038103892-8DD4F3DFAAD3-3DF2D7","notificationType":"transaction","controller":"notifications","action":"create"}	2021-02-04 07:23:34.387082	2021-02-04 07:23:34.400442
113	2	{"notificationCode":"7C522E-8154C654C69B-1EE45C7F892B-4A8F1A","notificationType":"transaction","controller":"notifications","action":"create"}	2021-02-04 07:23:58.840771	2021-02-04 07:23:58.856486
114	2	{"notificationCode":"388D5C-7DAC13AC132C-AFF44A1FAD70-0D5D80","notificationType":"transaction","controller":"notifications","action":"create"}	2021-02-04 09:21:35.99892	2021-02-04 09:21:36.036006
115	2	{"notificationCode":"F9D9F8-441038103892-8DD4F3DFAAD3-3DF2D7","notificationType":"transaction","controller":"notifications","action":"create"}	2021-02-04 09:23:00.976951	2021-02-04 09:23:00.992955
116	2	{"notificationCode":"7C522E-8154C654C69B-1EE45C7F892B-4A8F1A","notificationType":"transaction","controller":"notifications","action":"create"}	2021-02-04 09:23:23.444148	2021-02-04 09:23:23.456083
117	2	{"notificationCode":"388D5C-7DAC13AC132C-AFF44A1FAD70-0D5D80","notificationType":"transaction","controller":"notifications","action":"create"}	2021-02-04 11:18:59.699767	2021-02-04 11:18:59.739189
118	2	{"notificationCode":"E148A8-93D9E3D9E34B-1DD4F34FA49A-8380C1","notificationType":"transaction","controller":"notifications","action":"create"}	2021-02-04 22:16:06.314838	2021-02-04 22:16:06.349986
119	2	{"notificationCode":"E37E03-FCBF90BF9099-8AA41E9F8263-83C383","notificationType":"transaction","controller":"notifications","action":"create"}	2021-02-04 22:16:06.822824	2021-02-04 22:16:06.83714
120	2	{"notificationCode":"E148A8-93D9E3D9E34B-1DD4F34FA49A-8380C1","notificationType":"transaction","controller":"notifications","action":"create"}	2021-02-04 23:20:20.855495	2021-02-04 23:20:20.90276
121	2	{"notificationCode":"E37E03-FCBF90BF9099-8AA41E9F8263-83C383","notificationType":"transaction","controller":"notifications","action":"create"}	2021-02-04 23:20:21.002752	2021-02-04 23:20:21.016177
122	2	{"notificationCode":"E148A8-93D9E3D9E34B-1DD4F34FA49A-8380C1","notificationType":"transaction","controller":"notifications","action":"create"}	2021-02-05 03:15:46.251954	2021-02-05 03:15:46.28872
123	2	{"notificationCode":"E37E03-FCBF90BF9099-8AA41E9F8263-83C383","notificationType":"transaction","controller":"notifications","action":"create"}	2021-02-05 03:15:46.628832	2021-02-05 03:15:46.643293
124	2	{"notificationCode":"E148A8-93D9E3D9E34B-1DD4F34FA49A-8380C1","notificationType":"transaction","controller":"notifications","action":"create"}	2021-02-05 05:16:21.082709	2021-02-05 05:16:21.126523
125	2	{"notificationCode":"E37E03-FCBF90BF9099-8AA41E9F8263-83C383","notificationType":"transaction","controller":"notifications","action":"create"}	2021-02-05 05:16:21.453176	2021-02-05 05:16:21.464968
127	2	{"notificationCode":"E37E03-FCBF90BF9099-8AA41E9F8263-83C383","notificationType":"transaction","controller":"notifications","action":"create"}	2021-02-05 07:16:12.929538	2021-02-05 07:16:12.974152
126	2	{"notificationCode":"E148A8-93D9E3D9E34B-1DD4F34FA49A-8380C1","notificationType":"transaction","controller":"notifications","action":"create"}	2021-02-05 07:16:12.927608	2021-02-05 07:16:12.997126
128	2	{"notificationCode":"E148A8-93D9E3D9E34B-1DD4F34FA49A-8380C1","notificationType":"transaction","controller":"notifications","action":"create"}	2021-02-05 11:15:25.450867	2021-02-05 11:15:25.497195
129	2	{"notificationCode":"E37E03-FCBF90BF9099-8AA41E9F8263-83C383","notificationType":"transaction","controller":"notifications","action":"create"}	2021-02-05 11:15:25.831432	2021-02-05 11:15:25.845148
130	2	{"notificationCode":"CCF9A6-C388FC88FCEC-E7748E3F9A55-E4B338","notificationType":"transaction","controller":"notifications","action":"create"}	2021-02-05 14:07:22.745235	2021-02-05 14:07:22.787965
131	2	{"notificationCode":"CEDFB7-F234CF34CFAF-A224311FB8C6-41CFB9","notificationType":"preApproval","controller":"notifications","action":"create"}	2021-02-05 14:07:23.052707	2021-02-05 14:07:23.739744
132	2	{"notificationCode":"D8D605-9A6EDB6EDB9C-1774D02F8218-667DCC","notificationType":"transaction","controller":"notifications","action":"create"}	2021-02-05 14:07:25.208306	2021-02-05 14:07:25.221256
133	2	{"notificationCode":"ED6639-27EE1AEE1A5F-3FF4307F9BFD-EA1C91","notificationType":"preApproval","controller":"notifications","action":"create"}	2021-02-05 14:31:32.896837	2021-02-05 14:31:33.610328
134	2	{"notificationCode":"D8D605-9A6EDB6EDB9C-1774D02F8218-667DCC","notificationType":"transaction","controller":"notifications","action":"create"}	2021-02-05 15:23:05.37009	2021-02-05 15:23:05.411161
135	2	{"notificationCode":"D8D605-9A6EDB6EDB9C-1774D02F8218-667DCC","notificationType":"transaction","controller":"notifications","action":"create"}	2021-02-05 17:20:23.569744	2021-02-05 17:20:23.610997
136	2	{"notificationCode":"D8D605-9A6EDB6EDB9C-1774D02F8218-667DCC","notificationType":"transaction","controller":"notifications","action":"create"}	2021-02-05 19:19:40.484451	2021-02-05 19:19:40.527555
137	2	{"notificationCode":"D8D605-9A6EDB6EDB9C-1774D02F8218-667DCC","notificationType":"transaction","controller":"notifications","action":"create"}	2021-02-05 23:15:37.354322	2021-02-05 23:15:37.399231
138	2	{"notificationCode":"D8D605-9A6EDB6EDB9C-1774D02F8218-667DCC","notificationType":"transaction","controller":"notifications","action":"create"}	2021-02-06 01:16:10.179263	2021-02-06 01:16:10.216561
139	2	{"notificationCode":"1A8E0D-D59823982325-6444840FB880-CB8B9A","notificationType":"transaction","controller":"notifications","action":"create"}	2021-02-06 05:01:11.517107	2021-02-06 05:01:11.563486
140	2	{"notificationCode":"1A8E0D-D59823982325-6444840FB880-CB8B9A","notificationType":"transaction","controller":"notifications","action":"create"}	2021-02-06 07:15:50.390485	2021-02-06 07:15:50.433301
141	2	{"notificationCode":"1A8E0D-D59823982325-6444840FB880-CB8B9A","notificationType":"transaction","controller":"notifications","action":"create"}	2021-02-06 09:16:05.85202	2021-02-06 09:16:05.888844
142	2	{"notificationCode":"1A8E0D-D59823982325-6444840FB880-CB8B9A","notificationType":"transaction","controller":"notifications","action":"create"}	2021-02-06 11:16:58.78044	2021-02-06 11:16:58.816936
143	2	{"notificationCode":"1A8E0D-D59823982325-6444840FB880-CB8B9A","notificationType":"transaction","controller":"notifications","action":"create"}	2021-02-06 13:18:20.302786	2021-02-06 13:18:20.340304
144	2	{"notificationCode":"1A8E0D-D59823982325-6444840FB880-CB8B9A","notificationType":"transaction","controller":"notifications","action":"create"}	2021-02-06 15:20:39.910695	2021-02-06 15:20:39.946197
145	2	{"notificationCode":"93BDFA-814CC44CC4FF-61149CBFA4EF-ECD7DD","notificationType":"transaction","controller":"notifications","action":"create"}	2021-02-06 19:00:33.836715	2021-02-06 19:00:33.879286
146	2	{"notificationCode":"9B3A6F-0D187D187D41-E554E02F8324-AF55AA","notificationType":"preApproval","controller":"notifications","action":"create"}	2021-02-06 19:00:35.60197	2021-02-06 19:00:36.499509
147	2	{"notificationCode":"A58653-73CC4CCC4C4C-2BB4F3DFB56C-703991","notificationType":"transaction","controller":"notifications","action":"create"}	2021-02-06 19:00:38.262301	2021-02-06 19:00:38.275575
\.


--
-- Data for Name: office_visits; Type: TABLE DATA; Schema: public; Owner: elephant
--

COPY public.office_visits (id, patient_id, date, hour, description, value, documents, created_at, updated_at) FROM stdin;
1	1	2021-01-22	13:00	\N	\N	\N	2021-01-21 14:58:49.257489	2021-01-21 14:58:49.257489
20	5	2021-02-13	18:00	O paciente apresente desorientação e dificuldades para se orientar temporalmente.	25	\N	2021-01-22 01:40:09.580438	2021-01-25 20:34:28.43084
192	17	2021-02-09	09:00	\N	\N	\N	2021-02-02 23:05:01.919814	2021-02-02 23:05:01.919814
193	17	2021-02-16	09:00	\N	\N	\N	2021-02-02 23:05:01.926721	2021-02-02 23:05:01.926721
194	17	2021-02-23	09:00	\N	\N	\N	2021-02-02 23:05:01.932796	2021-02-02 23:05:01.932796
195	17	2021-03-02	09:00	\N	\N	\N	2021-02-02 23:05:01.942465	2021-02-02 23:05:01.942465
196	17	2021-03-09	09:00	\N	\N	\N	2021-02-02 23:05:01.949963	2021-02-02 23:05:01.949963
197	17	2021-03-16	09:00	\N	\N	\N	2021-02-02 23:05:01.956613	2021-02-02 23:05:01.956613
198	17	2021-03-23	09:00	\N	\N	\N	2021-02-02 23:05:01.963152	2021-02-02 23:05:01.963152
199	17	2021-03-30	09:00	\N	\N	\N	2021-02-02 23:05:01.969434	2021-02-02 23:05:01.969434
200	17	2021-04-06	09:00	\N	\N	\N	2021-02-02 23:05:01.976312	2021-02-02 23:05:01.976312
201	17	2021-04-13	09:00	\N	\N	\N	2021-02-02 23:05:01.983969	2021-02-02 23:05:01.983969
202	17	2021-04-20	09:00	\N	\N	\N	2021-02-02 23:05:01.990846	2021-02-02 23:05:01.990846
203	17	2021-04-27	09:00	\N	\N	\N	2021-02-02 23:05:01.997745	2021-02-02 23:05:01.997745
204	17	2021-05-04	09:00	\N	\N	\N	2021-02-02 23:05:02.003666	2021-02-02 23:05:02.003666
205	17	2021-05-11	09:00	\N	\N	\N	2021-02-02 23:05:02.009664	2021-02-02 23:05:02.009664
206	17	2021-05-18	09:00	\N	\N	\N	2021-02-02 23:05:02.018981	2021-02-02 23:05:02.018981
207	17	2021-05-25	09:00	\N	\N	\N	2021-02-02 23:05:02.027771	2021-02-02 23:05:02.027771
208	17	2021-06-01	09:00	\N	\N	\N	2021-02-02 23:05:02.036006	2021-02-02 23:05:02.036006
191	17	2021-02-02	09:00	40, 00 R$ FOI PAGO PELA LOCAÇÃO DA SALA!\r\n\r\nTOTALIZANDO COMO LUCRO:160,00 R$	200	\N	2021-02-02 23:05:01.909396	2021-02-02 23:07:01.725413
294	28	2020-02-03	19:00	\N	\N	\N	2021-02-03 15:46:46.197759	2021-02-03 15:46:46.197759
295	28	2020-02-10	19:00	\N	\N	\N	2021-02-03 15:46:46.202618	2021-02-03 15:46:46.202618
296	28	2020-02-17	19:00	\N	\N	\N	2021-02-03 15:46:46.207661	2021-02-03 15:46:46.207661
297	28	2020-02-24	19:00	\N	\N	\N	2021-02-03 15:46:46.212381	2021-02-03 15:46:46.212381
298	28	2020-03-02	19:00	\N	\N	\N	2021-02-03 15:46:46.217287	2021-02-03 15:46:46.217287
299	28	2020-03-09	19:00	\N	\N	\N	2021-02-03 15:46:46.222511	2021-02-03 15:46:46.222511
300	28	2020-03-16	19:00	\N	\N	\N	2021-02-03 15:46:46.227574	2021-02-03 15:46:46.227574
301	28	2020-03-23	19:00	\N	\N	\N	2021-02-03 15:46:46.232547	2021-02-03 15:46:46.232547
302	28	2020-03-30	19:00	\N	\N	\N	2021-02-03 15:46:46.237326	2021-02-03 15:46:46.237326
303	28	2020-04-06	19:00	\N	\N	\N	2021-02-03 15:46:46.242041	2021-02-03 15:46:46.242041
304	28	2020-04-13	19:00	\N	\N	\N	2021-02-03 15:46:46.246921	2021-02-03 15:46:46.246921
305	28	2020-04-20	19:00	\N	\N	\N	2021-02-03 15:46:46.251473	2021-02-03 15:46:46.251473
306	28	2020-04-27	19:00	\N	\N	\N	2021-02-03 15:46:46.256142	2021-02-03 15:46:46.256142
307	28	2020-05-04	19:00	\N	\N	\N	2021-02-03 15:46:46.260807	2021-02-03 15:46:46.260807
308	28	2020-05-11	19:00	\N	\N	\N	2021-02-03 15:46:46.265816	2021-02-03 15:46:46.265816
309	28	2020-05-18	19:00	\N	\N	\N	2021-02-03 15:46:46.271135	2021-02-03 15:46:46.271135
310	28	2020-05-25	19:00	\N	\N	\N	2021-02-03 15:46:46.276295	2021-02-03 15:46:46.276295
311	28	2020-06-01	19:00		50	\N	2021-02-03 15:46:46.281185	2021-02-03 15:47:08.080473
185	14	2021-02-11	15:00	\N	\N	\N	2021-01-29 17:00:59.884483	2021-02-01 17:24:43.544397
181	5	2021-02-13	20:00	\N	\N	\N	2021-01-28 14:59:27.299673	2021-01-28 14:59:27.299673
182	12	2021-02-13	14:00	\N	\N	\N	2021-01-28 15:00:54.218024	2021-01-28 15:00:54.218024
183	12	2021-02-13	10:00	\N	\N	\N	2021-01-28 15:01:36.216376	2021-01-28 15:01:36.216376
186	14	2021-02-19	15:00	\N	\N	\N	2021-01-29 17:00:59.887123	2021-01-29 17:00:59.887123
187	14	2021-02-26	15:00	\N	\N	\N	2021-01-29 17:00:59.889852	2021-01-29 17:00:59.889852
184	14	2021-02-05	15:00	O paciente iniciou o atendimento queixando-se de dificuldades para dormir.	50	\N	2021-01-29 17:00:59.881129	2021-01-29 17:19:14.329494
189	15	2021-02-03	14:20		\N	\N	2021-01-31 19:47:34.786128	2021-01-31 19:48:30.583792
237	24	2021-02-11	18:00		50	\N	2021-02-03 13:52:37.701668	2021-02-03 13:56:20.683422
238	24	2021-02-18	18:00		50	\N	2021-02-03 13:52:37.70698	2021-02-03 13:56:25.766704
239	24	2021-02-25	18:00		50	\N	2021-02-03 13:52:37.713158	2021-02-03 13:56:59.766313
236	24	2021-02-05	18:00	Foi tratada questões relacionadas a ansiedade.	50	\N	2021-02-03 13:52:37.696083	2021-02-03 14:11:54.45367
\.


--
-- Data for Name: parcels; Type: TABLE DATA; Schema: public; Owner: elephant
--

COPY public.parcels (id, office_visit_id, value, observation, created_at, updated_at) FROM stdin;
1	22	50		2021-01-25 14:40:11.672503	2021-01-25 14:40:11.672503
2	20	25		2021-01-25 20:34:47.707191	2021-01-25 20:34:47.707191
3	159	70		2021-01-26 17:14:35.196262	2021-01-26 17:14:35.196262
8	184	25	O paciente ficou de pagar a 2ª parcela na próxima consulta.	2021-01-29 17:19:53.589117	2021-01-29 17:19:53.589117
9	191	160	PAGO EM 02/02/2021	2021-02-02 23:08:45.843798	2021-02-02 23:08:45.843798
10	209	100	kk	2021-02-03 00:01:16.219643	2021-02-03 00:01:16.219643
11	227	100	lll	2021-02-03 13:44:23.011008	2021-02-03 13:44:23.011008
13	237	50		2021-02-03 13:56:41.639541	2021-02-03 13:56:41.639541
14	238	50		2021-02-03 13:56:50.394263	2021-02-03 13:56:50.394263
15	239	50		2021-02-03 13:57:03.998999	2021-02-03 13:57:03.998999
17	236	20		2021-02-03 14:13:12.673184	2021-02-03 14:13:12.673184
18	236	30		2021-02-03 14:13:28.558743	2021-02-03 14:13:28.558743
19	240	100	,,,	2021-02-03 14:16:28.887798	2021-02-03 14:16:28.887798
20	258	100	kkkkkkkkkkk	2021-02-03 14:20:20.460486	2021-02-03 14:20:20.460486
21	276	100	000	2021-02-03 14:23:05.213625	2021-02-03 14:23:05.213625
22	311	50		2021-02-03 15:47:15.835286	2021-02-03 15:47:15.835286
23	298	50		2021-02-03 15:47:40.241578	2021-02-03 15:47:40.241578
\.


--
-- Data for Name: pareceres; Type: TABLE DATA; Schema: public; Owner: elephant
--

COPY public.pareceres (id, crp, created_at, description, analysis, conclusion, "references", updated_at, patient_id) FROM stdin;
\.


--
-- Data for Name: patients; Type: TABLE DATA; Schema: public; Owner: elephant
--

COPY public.patients (id, user_id, avatar, name, created_at, updated_at, code, birth_date, gender, phone, relative_phone, profession, cpf, naturalidade, address_id) FROM stdin;
6	7	\N	Mairkon Almeida Soared	2021-01-23 18:42:23.657396	2021-01-23 18:42:23.657396	Bernanda1328	1983-12-02	1	(22) 981251900	(22) 998026037	Fisioteraeuta 	105.108.827-57	Brasileiro 	10
10	7	\N	Leandro Ribeiro Pedra	2021-01-27 13:52:31.989524	2021-01-27 13:52:31.989524	Bernanda1328	2001-01-18	1	(22) 999374604	() 	Estudante Ed Física	195.585.857-85	Campos dos Goytacazes	18
5	3	"portrait-young-man-smiling.jpg"	Caio Lopes de Castro Barreto	2021-01-22 01:38:52.400625	2021-01-28 14:55:28.611788	353636	1997-03-05	1	(22) 123456789	(22) 123456789	Jardineiro	000.000.000-0	Brasileira	17
12	3	"professional-smiling-woman.jpg"	Jéssica Marlone Jackson	2021-01-28 14:57:45.857266	2021-01-28 14:57:45.857266	353636	1997-10-04	2	(22) 123456789	(22) 123456789	Empresária	000.000.000-00	Brasileira	21
14	8	\N	Ricardo Moura da Silva	2021-01-29 16:59:51.023728	2021-01-29 16:59:51.023728	353636	1997-10-04	1	(22) 999999999	(22) 999999999	Engenheiro	000.000.000-00	Brasileira	23
15	14	\N	caio moura vieira de souza	2021-01-31 19:44:29.693776	2021-01-31 19:44:29.693776	harmonia	1997-10-04	1	(22) 997665669	(26) 11	00000psi		brasileiro	25
16	7	\N	Silvane Pereira de Oliveira	2021-02-02 20:17:42.640806	2021-02-02 20:17:42.640806	●●●●●●	1986-12-10	2	(22) 999992845	(22) 999992845	Psicóloga	121.742.837-27	Brasil	29
17	19	\N	ANA KAROLINY	2021-02-02 22:48:28.616121	2021-02-02 23:01:32.963823	●●●●●●●●	\N	2	(66) 992442277	(22) 12	GAROTA ACOMPANHANTE			\N
18	5	\N	Teste	2021-02-02 23:58:35.255487	2021-02-02 23:58:35.255487	●●●	\N	0						\N
20	5	\N	Teste Novo	2021-02-03 00:31:07.895114	2021-02-03 00:31:07.895114	●●●	\N	0						\N
45	28	\N	Karla ( João  Gabriel)	2021-02-05 14:21:23.705229	2021-02-05 14:21:23.705229	2727	\N	0						\N
1	5	"ENDERECOS.png"	Joãozinho	2021-01-21 14:58:06.99688	2021-02-03 01:34:16.325465	321	1998-05-23	1	(22) 992046966	(22) 999999999	Programador			\N
46	28	\N	Julia Andrade ( Yuri)	2021-02-05 14:22:16.788592	2021-02-05 14:22:16.788592	2727	\N	0	(14) 997268601					\N
22	7	\N	Miguel Chalita de mendonça de Andrade Porto	2021-02-03 11:44:38.908854	2021-02-03 11:44:38.908854	222815	2013-04-24	1	(22) 999027570	(22) 999027570	Estudante	173.501.497-43	Campos dos Goytaczes	32
47	19	\N	DANIELE PAULA TERRES BOMM	2021-02-05 16:22:18.800444	2021-02-05 16:22:18.800444	22121995	1985-07-17	2	(66) 997178375		ENFERMEIRA	049.167.319-13	MEDIANEIRA-PR	\N
24	8	\N	Amaro Campos	2021-02-03 13:34:57.776587	2021-02-03 13:34:57.776587	353636	\N	1	(22) 997665669	(22) 123456789	Estudante	000.000.000-00	Brasileira	33
28	6	\N	Ninna	2021-02-03 15:45:54.531837	2021-02-03 15:45:54.531837	00	\N	0				000.000.000-00		35
29	22	\N	ISABELLE	2021-02-03 23:37:34.419844	2021-02-03 23:37:34.419844	1234	\N	2						\N
30	24	\N	Bernardo Eccard	2021-02-04 00:34:21.998033	2021-02-04 00:34:21.998033	250809	2009-08-25	1	(22) 998729263		estudante			40
33	5	\N	123	2021-02-05 00:02:44.300179	2021-02-05 00:02:44.300179	123	\N	0						\N
34	28	\N	Neia responsável...Henrique 	2021-02-05 14:10:11.873738	2021-02-05 14:10:11.873738	2727	\N	1			Autônoma			\N
35	28	\N	Franciele Cristina Gregório  da Silva (Samuel) 7 anos	2021-02-05 14:11:31.631823	2021-02-05 14:11:31.631823	2727	\N	1						\N
36	28	\N	Vitoria ( Matheus)	2021-02-05 14:12:49.382407	2021-02-05 14:12:49.382407	2727	\N	1						\N
37	28	\N	Maria Cecília ( Ana Eliza 	2021-02-05 14:14:14.91444	2021-02-05 14:14:14.91444	2727	\N	2						\N
38	28	\N	Juliana ( Júlia)	2021-02-05 14:15:03.933408	2021-02-05 14:15:03.933408	2727	\N	2						\N
39	28	\N	Nayara ( Hellena) 	2021-02-05 14:15:52.518718	2021-02-05 14:15:52.518718	2727	\N	0						\N
40	28	\N	Jorselei ( Cecília)	2021-02-05 14:16:44.707289	2021-02-05 14:16:44.707289	2727	\N	2						\N
41	28	\N	Cristina ( Luiz Otávio)	2021-02-05 14:17:25.063084	2021-02-05 14:17:25.063084	2727	\N	0						\N
42	28	\N	Elaine Cristina da Silva ( Vicente Aguiar da Silva)	2021-02-05 14:18:21.865618	2021-02-05 14:18:21.865618	2727	\N	0						\N
43	28	\N	Pamela ( Pedro)	2021-02-05 14:19:35.217954	2021-02-05 14:19:35.217954	2727	\N	1						\N
44	28	\N	Naiellen ( Bernardo)	2021-02-05 14:20:24.670628	2021-02-05 14:20:24.670628	2727	\N	0						\N
49	26	\N	Ana Beatriz	2021-02-06 19:03:33.205456	2021-02-06 19:03:33.205456	8	\N	0		() 				\N
50	26	\N	Juliana Aguiar	2021-02-06 19:04:09.655674	2021-02-06 19:04:09.655674	8	\N	2		() 				\N
51	26	\N	Gabriel	2021-02-06 19:04:29.364964	2021-02-06 19:04:29.364964	8	\N	1		() 				\N
52	26	\N	Liliane	2021-02-06 19:04:43.64513	2021-02-06 19:04:43.64513	8	\N	0		() 				\N
53	26	\N	Ezequiel José	2021-02-06 19:05:03.822696	2021-02-06 19:05:03.822696	8	\N	0		() 				\N
54	26	\N	Livia Joviano	2021-02-06 19:05:25.644362	2021-02-06 19:05:25.644362	8	\N	2		() 				\N
\.


--
-- Data for Name: relatorios; Type: TABLE DATA; Schema: public; Owner: elephant
--

COPY public.relatorios (id, crp, atendido, solicitante, description, procedure, analysis, conclusion, goal, kind, created_at, updated_at, patient_id) FROM stdin;
1	0543797	Mairkon Almeida Soares	Sananda	Encontra-se...	BSI	O paciente...	De acordo...	Tratamento 	Psicológico	2021-01-23 19:21:03.693011	2021-01-23 19:21:03.693011	6
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: elephant
--

COPY public.schema_migrations (version) FROM stdin;
20200221174604
20200221175141
20200221175650
20200221180432
20200329025218
20200329030212
20200329031031
20200329203843
20201219164545
20201219171616
20201219171846
20201219174443
20201219183819
20201224001951
20201225125843
20201226144016
20210107163917
20210109100840
20210109104852
20210109110644
20210112014817
20210118151358
20210118153605
20210119033707
20210119034421
20210119034715
20210119034836
20210119040440
20210119040510
20210119040625
20210119040915
20210119041141
20210119041222
20210119042009
20210119042135
20210119042226
20210120015438
20210120231233
20210120231331
20210120232911
20210121003036
20210121144053
20210121144127
20210121144222
20210121181738
20210121222131
20210121223449
20210121224552
20210121225539
20210121232135
20210122000655
20210122003830
20210122013252
20210122133742
20210122134032
20210122134059
20210122142351
20210122144832
20210122145845
20210122150129
20210122150232
20210123033315
20210123192445
20210123194819
20210123235110
20210125141053
\.


--
-- Data for Name: subscriptions; Type: TABLE DATA; Schema: public; Owner: elephant
--

COPY public.subscriptions (id, status, mercado_pago_id, user_id, created_at, updated_at, pag_seguro_id) FROM stdin;
1	1	\N	1	2021-01-15 01:05:37.95342	2021-01-15 15:37:05.928596	74D59CFCA1A155B114478FA2838F399F
2	1	\N	2	2021-01-15 17:05:13.850403	2021-01-15 17:07:05.773689	FA854B70FFFF1D6994B6DFBA0440CF15
5	0	\N	7	2021-01-23 16:11:11.106054	2021-01-23 16:11:11.106054	\N
6	0	\N	6	2021-01-23 17:07:25.286807	2021-01-23 17:07:25.286807	\N
7	0	\N	7	2021-01-23 17:13:08.699778	2021-01-23 17:13:08.699778	\N
9	0	\N	10	2021-01-25 21:29:58.318087	2021-01-25 21:29:58.318087	\N
10	0	\N	9	2021-01-25 21:30:09.789663	2021-01-25 21:30:09.789663	\N
11	0	\N	12	2021-01-26 17:59:17.149848	2021-01-26 17:59:17.149848	\N
12	0	\N	11	2021-01-26 17:59:34.837136	2021-01-26 17:59:34.837136	\N
13	0	\N	13	2021-01-27 17:35:00.871209	2021-01-27 17:35:00.871209	\N
15	0	\N	3	2021-01-29 15:12:07.509052	2021-01-29 15:12:07.509052	\N
4	0	\N	3	2021-01-21 15:47:55.672995	2021-01-29 15:13:26.403888	716BCBB53838394114AA8FBAE18D0F1A
16	0	\N	14	2021-01-31 19:32:47.001442	2021-01-31 19:32:47.001442	\N
20	0	\N	8	2021-02-01 17:06:47.489425	2021-02-01 17:06:47.489425	\N
21	0	\N	15	2021-02-01 21:10:31.912487	2021-02-01 21:10:31.912487	C1EEB8E46E6E3A8DD472DFA3C7C0121A
24	0	\N	15	2021-02-02 00:10:18.492318	2021-02-02 00:10:18.492318	\N
22	0	\N	15	2021-02-01 21:10:32.626128	2021-02-02 00:11:42.05134	C22C2C532626BF9774104FA604855AC0
23	0	\N	15	2021-02-01 21:10:33.406447	2021-02-02 00:11:54.391472	C683BE9FEBEB6B1114FBFF96F13DAB62
27	0	\N	19	2021-02-02 22:40:35.38108	2021-02-02 22:40:35.38108	\N
28	0	\N	5	2021-02-02 23:57:19.871493	2021-02-02 23:57:19.871493	\N
29	0	\N	20	2021-02-03 14:21:41.073968	2021-02-03 14:21:41.073968	\N
33	1	\N	28	2021-02-05 14:07:18.024142	2021-02-05 14:31:33.603939	B47734982F2FCC05540A1F82CFC274E8
34	0	\N	26	2021-02-06 19:00:30.422387	2021-02-06 19:00:30.422387	832CF638D3D31BDFF42C5F88D590CEAF
\.


--
-- Data for Name: user_preferences; Type: TABLE DATA; Schema: public; Owner: elephant
--

COPY public.user_preferences (id, created_at, updated_at, user_id) FROM stdin;
24	2021-01-23 19:32:44.362272	2021-01-25 14:19:57.314257	7
37	2021-01-25 14:30:17.921589	2021-01-25 14:50:21.05756	6
23	2021-01-23 04:39:42.506988	2021-01-28 14:49:41.866108	3
39	2021-01-31 22:20:52.670874	2021-01-31 22:20:52.670874	15
36	2021-01-25 14:20:11.008575	2021-02-03 13:28:30.157211	5
41	2021-02-03 23:35:47.478868	2021-02-03 23:35:47.478868	22
42	2021-02-04 00:31:41.223711	2021-02-04 00:46:06.776652	24
43	2021-02-04 01:41:47.745204	2021-02-04 01:41:47.745204	26
44	2021-02-05 14:25:05.622219	2021-02-05 14:25:05.622219	28
40	2021-02-02 22:50:39.893133	2021-02-05 16:40:03.850199	19
38	2021-01-29 17:20:54.41323	2021-02-05 18:20:12.534484	8
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: elephant
--

COPY public.users (id, email, encrypted_password, reset_password_token, reset_password_sent_at, remember_created_at, created_at, updated_at, mercado_pago_id, document_number, document_type, phone, first_name, last_name, birth_date, terms_of_service) FROM stdin;
1	c78205037536392400729@sandbox.pagseguro.com.br	$2a$11$Fzkryoe9f0Z1VJgXf8qKQ.EvR52DvhcveW9s7UdZPuKNVCT.iqTOS	\N	\N	\N	2021-01-15 01:03:54.904432	2021-01-15 01:03:54.904432	\N	11111111111	CPF	22999999999	Gian	Rocha	1998-05-23	f
2	cancel@sandbox.pagseguro.com.br	$2a$11$gvowOYh2rCpwJeo8.Z9Tk.Cfj/0ApIF9qcvTGkV10CLSsDFmNXC7.	\N	\N	\N	2021-01-15 16:59:54.632212	2021-01-15 17:03:53.193255	\N	11111111111	CPF	22999999999	Cancel	Client	1998-05-23	f
15	ana.borgerth@gmail.com	$2a$11$g3JSyUZngrcTqCmIz.glyeLz.Kj0DD04OrkqSzOTU8mYm37rLRwS6	\N	\N	2021-01-31 22:20:25.787167	2021-01-31 21:45:43.18255	2021-01-31 22:20:25.788175	\N	70888817053	CPF	51999130989	Ana Carolina	Borgerth	1973-04-29	t
4	rcordeiro@uolinc.com	$2a$11$0N4JGZy/mBJrfN4CQ5wTReeOjk.A9L2c.yymEd04JJYpre976XNyG	\N	\N	\N	2021-01-19 18:21:45.244568	2021-01-19 18:21:45.244568	\N	95072354008	CPF	11974956557	rebeka	pagseguro	1998-05-23	f
6	mariannabarreto2605@gmail.com	$2a$11$wx6MZNnYJBhaOJWBo71/muh/RVKQqycNwGTfUW9Yhl2EL5ALYafku	\N	\N	\N	2021-01-23 14:22:51.267541	2021-01-31 22:47:06.054918	\N	13430461731	CPF	2297360936	Marianna	Barreto	1998-05-26	f
16	patriciadominguesdecastro@gmail.com	$2a$11$fB1aVFIImr65P6xKIk9kHe25/d3uGNfx6fNYppP79Cs8B9WPrZaJa	\N	\N	\N	2021-01-31 23:24:32.556622	2021-01-31 23:24:32.556622	\N	04201408752	CPF	22997143534	Patricia 	Domingues de Castro Barreto	1974-05-09	t
17	psicsil@hotamil.com	$2a$11$VZs3xEkJqqgeK768fLIc3.HIpjYGyPt2Es8ntUNRjPBP/ArZtCHMi	\N	\N	\N	2021-02-02 15:19:47.351505	2021-02-02 15:19:47.351505	\N	06952989765	CPF	22998241019	Silvia	Nascimento Ribeiro	1976-08-17	t
18	psicologataismachado@gmail.com	$2a$11$YssNJbEwWWHLpr3cOiHvZOJ51Pv/J2.beTh1wVBPGLMEMTanHj7QK	\N	\N	\N	2021-02-02 22:03:27.882606	2021-02-02 22:03:27.882606	\N	05963359112	CPF	66996241813	Taís 	Machado	1995-12-22	t
19	thaismachadosnp@gmail.com	$2a$11$ZGM12ZUZ140YDOx3AuTxOeMTknJ89NCMt1F7wxsJZuC8PoewUcVr6	\N	\N	\N	2021-02-02 22:39:45.205492	2021-02-02 22:39:45.205492	\N	05963359112	CPF	66996241813	Taís	machado soares	1995-12-22	t
5	giancarloiff@gmail.com	$2a$11$o704gTYv2zPBxl5LLZRG9eBkzECJbWbZt1SITxR4u4VTYb3.IrIhC	\N	\N	2021-02-03 00:28:27.832829	2021-01-21 01:13:32.970825	2021-02-03 00:28:27.834592	\N	17475108740	CPF	22992046966	Giancarlo	Rocha	1998-05-23	f
20	amarovs@gmail.com	$2a$11$DZaedDWejhyOEpGT7UTYnObPJzECbyGQXz59HXmxWZPFpdiSgAx/.	\N	\N	\N	2021-02-03 14:20:02.603288	2021-02-03 14:20:02.603288	\N	10193151723	CPF	22998393393	Amaro Victor	da Silva	1985-05-31	t
8	aplicativoelephant@gmail.com	$2a$11$xG4gtQ2iJMYnkmLLOa3KzOUJzqzY/A69X8aJ/hkVnke8vg.CV2cWy	\N	\N	\N	2021-01-23 17:28:25.166522	2021-01-23 17:28:25.166522	\N	17022527792	CPF	22997665669	Administrador	Teste	1997-10-04	f
9	talitapupo@outlook.com	$2a$11$7bLb2gB4Zgyj5clkpuNY1.xA8l7c77SnklPpqWOx2VXXaJchD4LeS	\N	\N	\N	2021-01-23 18:12:50.351859	2021-01-23 18:12:50.351859	\N	01623667607	CPF	31991542265	Talita 	Pupo Cruz	1987-11-24	f
21	jonatastourinho@gmail.com	$2a$11$f6i8ViXRAf0cFwuLAFbCROOEsGYXP004mqZVU44YC8RaW8z4nXBVy	\N	\N	\N	2021-02-03 18:25:22.915838	2021-02-03 18:25:22.915838	\N	04945197547	CPF	71981924306	Jonatas	Tourinho 	1992-02-19	t
7	sanandaneuropsi@gmail.com	$2a$11$a9kh7BY5Mde2tPQPO.J3VeGUMGhG1aqS2DUzZaDZCbMYDjD/i0Mrq	\N	\N	2021-01-23 18:38:33.218372	2021-01-23 15:40:06.204678	2021-01-23 19:32:44.371092	\N	11335117750	CPF	22981251900	Sananda	Lopes	1984-11-28	f
22	julie.almeida.amaral@gmail.com	$2a$11$X5NbP23hI4xBIhovRuIp/.FAlQN8I7a136OCs.xzai5qxndGaZz.2	\N	\N	\N	2021-02-03 23:25:16.69094	2021-02-03 23:25:16.69094	\N	44527969234	CPF	92988432006	Julie Almeida Gurgel do Amaral	Julie	1974-04-11	t
10	psicologaflavialongo@gmail.com	$2a$11$.imRI7nqkNSSA15fNY3JTOh9.6guJvtCQAUClCiwoFmMUD8E9O0hm	\N	\N	\N	2021-01-23 21:16:57.706672	2021-01-23 21:16:57.706672	\N	05433317765	CPF	22999647613	Flávia	De Azevedo Longo	1989-04-01	f
23	juliamarianaalvesbarros@hotmail.com	$2a$11$49UaTqwiusX0IPr/KYoY3./TTDD1.Fjd0JM9Ok0OLWbVyeDj3xQ26	\N	\N	\N	2021-02-04 00:26:16.603714	2021-02-04 00:26:16.603714	\N	43386828841	CPF	14998648241	Julia mariana 	Barros Bezerra	1995-12-27	t
24	tamiliseccard@gmail.com	$2a$11$Q7Ddd4Blfehr.eip/amIouyMjlG1lV7fWP/0Do0H.TM/YO2oW5.hq	\N	\N	\N	2021-02-04 00:28:52.72146	2021-02-04 00:28:52.72146	\N	11885305770	CPF	22998729263	tamilis	eccard	1987-08-18	t
25	raisa.s.nascimento@gmail.com	$2a$11$nDFl72RT2nxQuns6V2Fuue.LyS7MYX5WoM3bVMXPXoifWqqrMgjke	\N	\N	\N	2021-02-04 01:09:12.435969	2021-02-04 01:09:12.435969	\N	02804185079	CPF	51995177996	Raísa 	Da Silva do nascimento	1991-11-03	t
3	caiomoura9@hotmail.com	$2a$11$eDo0wI2AX3dIMhfyoco8v.mtHYoj0fBzqo6c1YhB.dB9tem5LT7oy	\N	\N	\N	2021-01-18 12:50:54.813595	2021-01-25 13:26:22.817387	\N	17022527792	CPF	22997665669	Caio	Moura	1997-10-04	f
11	marinagusmao@hotmail.com	$2a$11$ZhbyH7wpwCKdA9ptR1Vm8OZKP5sToa64B8ToLSqAv5oG55OokvOzm	\N	\N	\N	2021-01-26 16:12:57.121338	2021-01-26 16:12:57.121338	\N	88981754004	CPF	51981149751	Marina	Caminha	1975-10-12	t
12	fernanda.perez@magopsi.com.br	$2a$11$neX0PtB9l8ejku56vbrFxOm.zRtNK4QQHRRh6YPGVCCJlNayFh67u	\N	\N	\N	2021-01-26 17:48:22.808058	2021-01-26 17:48:22.808058	\N	99382806091	CPF	21983854278	Fernanda	Severo Perez Soares	1980-10-26	t
13	davilouback87@gmail.com	$2a$11$laWgCyI9jWTvyX4PT8ZI/u847GUTn8EpiOX71RtcGH4GsgNVUfjD.	\N	\N	\N	2021-01-27 17:31:01.735983	2021-01-27 17:31:01.735983	\N	17154540737	CPF	22997046535	Davi	Louback	1996-11-08	t
14	valrms@yahoo.com.br	$2a$11$tMpAdtI.D7iEY1B3pD69ae6YvhkwJAkjtMVsrIAPrgCmWLUVVEZsa	\N	\N	\N	2021-01-31 19:28:44.929761	2021-01-31 19:28:44.929761	\N	01754312721	CPF	22998158711	Valéria Rangel	Sales	1971-11-26	t
28	psicologa_juliabarrosbezerra@outlook.com	$2a$11$VgqTDYgQNXB8HSOyZwWnkuoOIUwmEahaCvtffqAN7.1YobGfhGZcK	\N	\N	\N	2021-02-05 14:06:04.682918	2021-02-05 14:06:04.682918	\N	43386828841	CPF	14998648242	Julia Mariana 	Alves Barros bezerra	1995-12-27	t
26	psicologa.anapaulaferreira@gmail.com	$2a$11$.OpV.9D/Qnn4AmCZuG1wT.Zv7sUvhK.fCNbgw.Jl4grSVEggsnN.G	\N	\N	2021-02-06 18:58:29.269012	2021-02-04 01:36:03.565581	2021-02-06 18:58:29.270512	\N	07223530650	CPF	31995380185	Ana Paula de Oliveira e Silva 	Ferreira	1983-12-16	t
\.


--
-- Name: active_storage_attachments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: elephant
--

SELECT pg_catalog.setval('public.active_storage_attachments_id_seq', 50, true);


--
-- Name: active_storage_blobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: elephant
--

SELECT pg_catalog.setval('public.active_storage_blobs_id_seq', 50, true);


--
-- Name: addresses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: elephant
--

SELECT pg_catalog.setval('public.addresses_id_seq', 43, true);


--
-- Name: admins_id_seq; Type: SEQUENCE SET; Schema: public; Owner: elephant
--

SELECT pg_catalog.setval('public.admins_id_seq', 2, true);


--
-- Name: atestados_id_seq; Type: SEQUENCE SET; Schema: public; Owner: elephant
--

SELECT pg_catalog.setval('public.atestados_id_seq', 10, true);


--
-- Name: configs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: elephant
--

SELECT pg_catalog.setval('public.configs_id_seq', 1, false);


--
-- Name: declaracoes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: elephant
--

SELECT pg_catalog.setval('public.declaracoes_id_seq', 4, true);


--
-- Name: forms_id_seq; Type: SEQUENCE SET; Schema: public; Owner: elephant
--

SELECT pg_catalog.setval('public.forms_id_seq', 1, false);


--
-- Name: formularios_id_seq; Type: SEQUENCE SET; Schema: public; Owner: elephant
--

SELECT pg_catalog.setval('public.formularios_id_seq', 9, true);


--
-- Name: graficos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: elephant
--

SELECT pg_catalog.setval('public.graficos_id_seq', 10, true);


--
-- Name: laudos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: elephant
--

SELECT pg_catalog.setval('public.laudos_id_seq', 10, true);


--
-- Name: notifications_id_seq; Type: SEQUENCE SET; Schema: public; Owner: elephant
--

SELECT pg_catalog.setval('public.notifications_id_seq', 147, true);


--
-- Name: office_visits_id_seq; Type: SEQUENCE SET; Schema: public; Owner: elephant
--

SELECT pg_catalog.setval('public.office_visits_id_seq', 360, true);


--
-- Name: parcels_id_seq; Type: SEQUENCE SET; Schema: public; Owner: elephant
--

SELECT pg_catalog.setval('public.parcels_id_seq', 26, true);


--
-- Name: pareceres_id_seq; Type: SEQUENCE SET; Schema: public; Owner: elephant
--

SELECT pg_catalog.setval('public.pareceres_id_seq', 1, true);


--
-- Name: patients_id_seq; Type: SEQUENCE SET; Schema: public; Owner: elephant
--

SELECT pg_catalog.setval('public.patients_id_seq', 54, true);


--
-- Name: relatorios_id_seq; Type: SEQUENCE SET; Schema: public; Owner: elephant
--

SELECT pg_catalog.setval('public.relatorios_id_seq', 1, true);


--
-- Name: subscriptions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: elephant
--

SELECT pg_catalog.setval('public.subscriptions_id_seq', 34, true);


--
-- Name: user_preferences_id_seq; Type: SEQUENCE SET; Schema: public; Owner: elephant
--

SELECT pg_catalog.setval('public.user_preferences_id_seq', 44, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: elephant
--

SELECT pg_catalog.setval('public.users_id_seq', 28, true);


--
-- Name: active_storage_attachments active_storage_attachments_pkey; Type: CONSTRAINT; Schema: public; Owner: elephant
--

ALTER TABLE ONLY public.active_storage_attachments
    ADD CONSTRAINT active_storage_attachments_pkey PRIMARY KEY (id);


--
-- Name: active_storage_blobs active_storage_blobs_pkey; Type: CONSTRAINT; Schema: public; Owner: elephant
--

ALTER TABLE ONLY public.active_storage_blobs
    ADD CONSTRAINT active_storage_blobs_pkey PRIMARY KEY (id);


--
-- Name: addresses addresses_pkey; Type: CONSTRAINT; Schema: public; Owner: elephant
--

ALTER TABLE ONLY public.addresses
    ADD CONSTRAINT addresses_pkey PRIMARY KEY (id);


--
-- Name: admins admins_pkey; Type: CONSTRAINT; Schema: public; Owner: elephant
--

ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_pkey PRIMARY KEY (id);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: elephant
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: atestados atestados_pkey; Type: CONSTRAINT; Schema: public; Owner: elephant
--

ALTER TABLE ONLY public.atestados
    ADD CONSTRAINT atestados_pkey PRIMARY KEY (id);


--
-- Name: configs configs_pkey; Type: CONSTRAINT; Schema: public; Owner: elephant
--

ALTER TABLE ONLY public.configs
    ADD CONSTRAINT configs_pkey PRIMARY KEY (id);


--
-- Name: declaracoes declaracoes_pkey; Type: CONSTRAINT; Schema: public; Owner: elephant
--

ALTER TABLE ONLY public.declaracoes
    ADD CONSTRAINT declaracoes_pkey PRIMARY KEY (id);


--
-- Name: forms forms_pkey; Type: CONSTRAINT; Schema: public; Owner: elephant
--

ALTER TABLE ONLY public.forms
    ADD CONSTRAINT forms_pkey PRIMARY KEY (id);


--
-- Name: formularios formularios_pkey; Type: CONSTRAINT; Schema: public; Owner: elephant
--

ALTER TABLE ONLY public.formularios
    ADD CONSTRAINT formularios_pkey PRIMARY KEY (id);


--
-- Name: graficos graficos_pkey; Type: CONSTRAINT; Schema: public; Owner: elephant
--

ALTER TABLE ONLY public.graficos
    ADD CONSTRAINT graficos_pkey PRIMARY KEY (id);


--
-- Name: laudos laudos_pkey; Type: CONSTRAINT; Schema: public; Owner: elephant
--

ALTER TABLE ONLY public.laudos
    ADD CONSTRAINT laudos_pkey PRIMARY KEY (id);


--
-- Name: notifications notifications_pkey; Type: CONSTRAINT; Schema: public; Owner: elephant
--

ALTER TABLE ONLY public.notifications
    ADD CONSTRAINT notifications_pkey PRIMARY KEY (id);


--
-- Name: office_visits office_visits_pkey; Type: CONSTRAINT; Schema: public; Owner: elephant
--

ALTER TABLE ONLY public.office_visits
    ADD CONSTRAINT office_visits_pkey PRIMARY KEY (id);


--
-- Name: parcels parcels_pkey; Type: CONSTRAINT; Schema: public; Owner: elephant
--

ALTER TABLE ONLY public.parcels
    ADD CONSTRAINT parcels_pkey PRIMARY KEY (id);


--
-- Name: pareceres pareceres_pkey; Type: CONSTRAINT; Schema: public; Owner: elephant
--

ALTER TABLE ONLY public.pareceres
    ADD CONSTRAINT pareceres_pkey PRIMARY KEY (id);


--
-- Name: patients patients_pkey; Type: CONSTRAINT; Schema: public; Owner: elephant
--

ALTER TABLE ONLY public.patients
    ADD CONSTRAINT patients_pkey PRIMARY KEY (id);


--
-- Name: relatorios relatorios_pkey; Type: CONSTRAINT; Schema: public; Owner: elephant
--

ALTER TABLE ONLY public.relatorios
    ADD CONSTRAINT relatorios_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: elephant
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: subscriptions subscriptions_pkey; Type: CONSTRAINT; Schema: public; Owner: elephant
--

ALTER TABLE ONLY public.subscriptions
    ADD CONSTRAINT subscriptions_pkey PRIMARY KEY (id);


--
-- Name: user_preferences user_preferences_pkey; Type: CONSTRAINT; Schema: public; Owner: elephant
--

ALTER TABLE ONLY public.user_preferences
    ADD CONSTRAINT user_preferences_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: elephant
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: index_active_storage_attachments_on_blob_id; Type: INDEX; Schema: public; Owner: elephant
--

CREATE INDEX index_active_storage_attachments_on_blob_id ON public.active_storage_attachments USING btree (blob_id);


--
-- Name: index_active_storage_attachments_uniqueness; Type: INDEX; Schema: public; Owner: elephant
--

CREATE UNIQUE INDEX index_active_storage_attachments_uniqueness ON public.active_storage_attachments USING btree (record_type, record_id, name, blob_id);


--
-- Name: index_active_storage_blobs_on_key; Type: INDEX; Schema: public; Owner: elephant
--

CREATE UNIQUE INDEX index_active_storage_blobs_on_key ON public.active_storage_blobs USING btree (key);


--
-- Name: index_addresses_on_user_id; Type: INDEX; Schema: public; Owner: elephant
--

CREATE INDEX index_addresses_on_user_id ON public.addresses USING btree (user_id);


--
-- Name: index_admins_on_email; Type: INDEX; Schema: public; Owner: elephant
--

CREATE UNIQUE INDEX index_admins_on_email ON public.admins USING btree (email);


--
-- Name: index_admins_on_reset_password_token; Type: INDEX; Schema: public; Owner: elephant
--

CREATE UNIQUE INDEX index_admins_on_reset_password_token ON public.admins USING btree (reset_password_token);


--
-- Name: index_atestados_on_patient_id; Type: INDEX; Schema: public; Owner: elephant
--

CREATE INDEX index_atestados_on_patient_id ON public.atestados USING btree (patient_id);


--
-- Name: index_declaracoes_on_patient_id; Type: INDEX; Schema: public; Owner: elephant
--

CREATE INDEX index_declaracoes_on_patient_id ON public.declaracoes USING btree (patient_id);


--
-- Name: index_forms_on_patient_id; Type: INDEX; Schema: public; Owner: elephant
--

CREATE INDEX index_forms_on_patient_id ON public.forms USING btree (patient_id);


--
-- Name: index_formularios_on_patient_id; Type: INDEX; Schema: public; Owner: elephant
--

CREATE INDEX index_formularios_on_patient_id ON public.formularios USING btree (patient_id);


--
-- Name: index_graficos_on_laudo_id; Type: INDEX; Schema: public; Owner: elephant
--

CREATE INDEX index_graficos_on_laudo_id ON public.graficos USING btree (laudo_id);


--
-- Name: index_laudos_on_patient_id; Type: INDEX; Schema: public; Owner: elephant
--

CREATE INDEX index_laudos_on_patient_id ON public.laudos USING btree (patient_id);


--
-- Name: index_office_visits_on_patient_id; Type: INDEX; Schema: public; Owner: elephant
--

CREATE INDEX index_office_visits_on_patient_id ON public.office_visits USING btree (patient_id);


--
-- Name: index_parcels_on_office_visit_id; Type: INDEX; Schema: public; Owner: elephant
--

CREATE INDEX index_parcels_on_office_visit_id ON public.parcels USING btree (office_visit_id);


--
-- Name: index_pareceres_on_patient_id; Type: INDEX; Schema: public; Owner: elephant
--

CREATE INDEX index_pareceres_on_patient_id ON public.pareceres USING btree (patient_id);


--
-- Name: index_patients_on_address_id; Type: INDEX; Schema: public; Owner: elephant
--

CREATE INDEX index_patients_on_address_id ON public.patients USING btree (address_id);


--
-- Name: index_patients_on_user_id; Type: INDEX; Schema: public; Owner: elephant
--

CREATE INDEX index_patients_on_user_id ON public.patients USING btree (user_id);


--
-- Name: index_relatorios_on_patient_id; Type: INDEX; Schema: public; Owner: elephant
--

CREATE INDEX index_relatorios_on_patient_id ON public.relatorios USING btree (patient_id);


--
-- Name: index_subscriptions_on_user_id; Type: INDEX; Schema: public; Owner: elephant
--

CREATE INDEX index_subscriptions_on_user_id ON public.subscriptions USING btree (user_id);


--
-- Name: index_user_preferences_on_user_id; Type: INDEX; Schema: public; Owner: elephant
--

CREATE INDEX index_user_preferences_on_user_id ON public.user_preferences USING btree (user_id);


--
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: elephant
--

CREATE UNIQUE INDEX index_users_on_email ON public.users USING btree (email);


--
-- Name: index_users_on_reset_password_token; Type: INDEX; Schema: public; Owner: elephant
--

CREATE UNIQUE INDEX index_users_on_reset_password_token ON public.users USING btree (reset_password_token);


--
-- Name: office_visits fk_rails_10b327ec9b; Type: FK CONSTRAINT; Schema: public; Owner: elephant
--

ALTER TABLE ONLY public.office_visits
    ADD CONSTRAINT fk_rails_10b327ec9b FOREIGN KEY (patient_id) REFERENCES public.patients(id);


--
-- Name: pareceres fk_rails_174b1b2540; Type: FK CONSTRAINT; Schema: public; Owner: elephant
--

ALTER TABLE ONLY public.pareceres
    ADD CONSTRAINT fk_rails_174b1b2540 FOREIGN KEY (patient_id) REFERENCES public.patients(id);


--
-- Name: atestados fk_rails_1ffd23d847; Type: FK CONSTRAINT; Schema: public; Owner: elephant
--

ALTER TABLE ONLY public.atestados
    ADD CONSTRAINT fk_rails_1ffd23d847 FOREIGN KEY (patient_id) REFERENCES public.patients(id);


--
-- Name: declaracoes fk_rails_34e252d954; Type: FK CONSTRAINT; Schema: public; Owner: elephant
--

ALTER TABLE ONLY public.declaracoes
    ADD CONSTRAINT fk_rails_34e252d954 FOREIGN KEY (patient_id) REFERENCES public.patients(id);


--
-- Name: patients fk_rails_39783febcc; Type: FK CONSTRAINT; Schema: public; Owner: elephant
--

ALTER TABLE ONLY public.patients
    ADD CONSTRAINT fk_rails_39783febcc FOREIGN KEY (address_id) REFERENCES public.addresses(id);


--
-- Name: laudos fk_rails_3bf37c02ff; Type: FK CONSTRAINT; Schema: public; Owner: elephant
--

ALTER TABLE ONLY public.laudos
    ADD CONSTRAINT fk_rails_3bf37c02ff FOREIGN KEY (patient_id) REFERENCES public.patients(id);


--
-- Name: addresses fk_rails_48c9e0c5a2; Type: FK CONSTRAINT; Schema: public; Owner: elephant
--

ALTER TABLE ONLY public.addresses
    ADD CONSTRAINT fk_rails_48c9e0c5a2 FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: formularios fk_rails_6e9b962998; Type: FK CONSTRAINT; Schema: public; Owner: elephant
--

ALTER TABLE ONLY public.formularios
    ADD CONSTRAINT fk_rails_6e9b962998 FOREIGN KEY (patient_id) REFERENCES public.patients(id);


--
-- Name: graficos fk_rails_73d7cca728; Type: FK CONSTRAINT; Schema: public; Owner: elephant
--

ALTER TABLE ONLY public.graficos
    ADD CONSTRAINT fk_rails_73d7cca728 FOREIGN KEY (laudo_id) REFERENCES public.laudos(id) ON DELETE CASCADE;


--
-- Name: subscriptions fk_rails_933bdff476; Type: FK CONSTRAINT; Schema: public; Owner: elephant
--

ALTER TABLE ONLY public.subscriptions
    ADD CONSTRAINT fk_rails_933bdff476 FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: user_preferences fk_rails_a69bfcfd81; Type: FK CONSTRAINT; Schema: public; Owner: elephant
--

ALTER TABLE ONLY public.user_preferences
    ADD CONSTRAINT fk_rails_a69bfcfd81 FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: active_storage_attachments fk_rails_c3b3935057; Type: FK CONSTRAINT; Schema: public; Owner: elephant
--

ALTER TABLE ONLY public.active_storage_attachments
    ADD CONSTRAINT fk_rails_c3b3935057 FOREIGN KEY (blob_id) REFERENCES public.active_storage_blobs(id);


--
-- Name: relatorios fk_rails_fb702e5cec; Type: FK CONSTRAINT; Schema: public; Owner: elephant
--

ALTER TABLE ONLY public.relatorios
    ADD CONSTRAINT fk_rails_fb702e5cec FOREIGN KEY (patient_id) REFERENCES public.patients(id);


--
-- PostgreSQL database dump complete
--

