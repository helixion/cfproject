--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
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


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: class_powers; Type: TABLE; Schema: public; Owner: h3lix0; Tablespace: 
--

CREATE TABLE class_powers (
    class_id integer,
    power_id integer
);


ALTER TABLE class_powers OWNER TO h3lix0;

--
-- Name: class_races; Type: TABLE; Schema: public; Owner: h3lix0; Tablespace: 
--

CREATE TABLE class_races (
    class_id integer,
    race_id integer
);


ALTER TABLE class_races OWNER TO h3lix0;

--
-- Name: class_tags; Type: TABLE; Schema: public; Owner: h3lix0; Tablespace: 
--

CREATE TABLE class_tags (
    class_id integer,
    tag_id integer
);


ALTER TABLE class_tags OWNER TO h3lix0;

--
-- Name: classes; Type: TABLE; Schema: public; Owner: h3lix0; Tablespace: 
--

CREATE TABLE classes (
    id integer NOT NULL,
    data_type character varying(255),
    slug character varying(255),
    name character varying(255),
    icon character varying(255),
    description text,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    icon_svg character varying(255),
    lore text,
    class_type character varying(255),
    abbreviation character varying(255)
);


ALTER TABLE classes OWNER TO h3lix0;

--
-- Name: classes_id_seq; Type: SEQUENCE; Schema: public; Owner: h3lix0
--

CREATE SEQUENCE classes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE classes_id_seq OWNER TO h3lix0;

--
-- Name: classes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: h3lix0
--

ALTER SEQUENCE classes_id_seq OWNED BY classes.id;


--
-- Name: combos; Type: TABLE; Schema: public; Owner: h3lix0; Tablespace: 
--

CREATE TABLE combos (
    parent_power_id integer,
    child_power_id integer
);


ALTER TABLE combos OWNER TO h3lix0;

--
-- Name: discipline_classes; Type: TABLE; Schema: public; Owner: h3lix0; Tablespace: 
--

CREATE TABLE discipline_classes (
    discipline_id integer,
    class_id integer
);


ALTER TABLE discipline_classes OWNER TO h3lix0;

--
-- Name: discipline_powers; Type: TABLE; Schema: public; Owner: h3lix0; Tablespace: 
--

CREATE TABLE discipline_powers (
    discipline_id integer,
    power_id integer
);


ALTER TABLE discipline_powers OWNER TO h3lix0;

--
-- Name: discipline_tags; Type: TABLE; Schema: public; Owner: h3lix0; Tablespace: 
--

CREATE TABLE discipline_tags (
    discipline_id integer,
    tag_id integer
);


ALTER TABLE discipline_tags OWNER TO h3lix0;

--
-- Name: discipline_types; Type: TABLE; Schema: public; Owner: h3lix0; Tablespace: 
--

CREATE TABLE discipline_types (
    id integer NOT NULL,
    type_name character varying(255),
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);


ALTER TABLE discipline_types OWNER TO h3lix0;

--
-- Name: discipline_types_id_seq; Type: SEQUENCE; Schema: public; Owner: h3lix0
--

CREATE SEQUENCE discipline_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE discipline_types_id_seq OWNER TO h3lix0;

--
-- Name: discipline_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: h3lix0
--

ALTER SEQUENCE discipline_types_id_seq OWNED BY discipline_types.id;


--
-- Name: disciplines; Type: TABLE; Schema: public; Owner: h3lix0; Tablespace: 
--

CREATE TABLE disciplines (
    id integer NOT NULL,
    data_type character varying(255),
    slug character varying(255),
    name character varying(255),
    discipline_type character varying(255),
    icon character varying(255),
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    icon_svg character varying(255),
    description text,
    lore text,
    attributes json
);


ALTER TABLE disciplines OWNER TO h3lix0;

--
-- Name: disciplines_id_seq; Type: SEQUENCE; Schema: public; Owner: h3lix0
--

CREATE SEQUENCE disciplines_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE disciplines_id_seq OWNER TO h3lix0;

--
-- Name: disciplines_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: h3lix0
--

ALTER SEQUENCE disciplines_id_seq OWNED BY disciplines.id;


--
-- Name: knex_migrations; Type: TABLE; Schema: public; Owner: h3lix0; Tablespace: 
--

CREATE TABLE knex_migrations (
    id integer NOT NULL,
    name character varying(255),
    batch integer,
    migration_time timestamp with time zone
);


ALTER TABLE knex_migrations OWNER TO h3lix0;

--
-- Name: knex_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: h3lix0
--

CREATE SEQUENCE knex_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE knex_migrations_id_seq OWNER TO h3lix0;

--
-- Name: knex_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: h3lix0
--

ALTER SEQUENCE knex_migrations_id_seq OWNED BY knex_migrations.id;


--
-- Name: knex_migrations_lock; Type: TABLE; Schema: public; Owner: h3lix0; Tablespace: 
--

CREATE TABLE knex_migrations_lock (
    is_locked integer
);


ALTER TABLE knex_migrations_lock OWNER TO h3lix0;

--
-- Name: power_tags; Type: TABLE; Schema: public; Owner: h3lix0; Tablespace: 
--

CREATE TABLE power_tags (
    power_id integer,
    tag_id integer
);


ALTER TABLE power_tags OWNER TO h3lix0;

--
-- Name: powers; Type: TABLE; Schema: public; Owner: h3lix0; Tablespace: 
--

CREATE TABLE powers (
    id integer NOT NULL,
    slug character varying(255),
    data_type character varying(255),
    description text,
    icon character varying(255),
    type character varying(255),
    cast_type character varying(255),
    resource_type character varying(255),
    resource_cost integer,
    targeting character varying(255),
    duration integer,
    max_targets integer,
    range integer,
    min_damage integer,
    max_damage integer,
    is_combo_child boolean DEFAULT false,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    name character varying(255),
    icon_svg character varying(255),
    cooldown integer
);


ALTER TABLE powers OWNER TO h3lix0;

--
-- Name: powers_id_seq; Type: SEQUENCE; Schema: public; Owner: h3lix0
--

CREATE SEQUENCE powers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE powers_id_seq OWNER TO h3lix0;

--
-- Name: powers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: h3lix0
--

ALTER SEQUENCE powers_id_seq OWNED BY powers.id;


--
-- Name: race_disciplines; Type: TABLE; Schema: public; Owner: h3lix0; Tablespace: 
--

CREATE TABLE race_disciplines (
    race_id integer,
    discipline_id integer
);


ALTER TABLE race_disciplines OWNER TO h3lix0;

--
-- Name: race_tags; Type: TABLE; Schema: public; Owner: h3lix0; Tablespace: 
--

CREATE TABLE race_tags (
    race_id integer,
    tag_id integer
);


ALTER TABLE race_tags OWNER TO h3lix0;

--
-- Name: races; Type: TABLE; Schema: public; Owner: h3lix0; Tablespace: 
--

CREATE TABLE races (
    id integer NOT NULL,
    data_type character varying(255),
    slug character varying(255),
    name character varying(255),
    description text,
    icon character varying(255),
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    icon_svg character varying(255)
);


ALTER TABLE races OWNER TO h3lix0;

--
-- Name: races_id_seq; Type: SEQUENCE; Schema: public; Owner: h3lix0
--

CREATE SEQUENCE races_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE races_id_seq OWNER TO h3lix0;

--
-- Name: races_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: h3lix0
--

ALTER SEQUENCE races_id_seq OWNED BY races.id;


--
-- Name: statistics; Type: TABLE; Schema: public; Owner: h3lix0; Tablespace: 
--

CREATE TABLE statistics (
    id integer NOT NULL,
    type character varying(255)
);


ALTER TABLE statistics OWNER TO h3lix0;

--
-- Name: statistics_id_seq; Type: SEQUENCE; Schema: public; Owner: h3lix0
--

CREATE SEQUENCE statistics_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE statistics_id_seq OWNER TO h3lix0;

--
-- Name: statistics_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: h3lix0
--

ALTER SEQUENCE statistics_id_seq OWNED BY statistics.id;


--
-- Name: tags; Type: TABLE; Schema: public; Owner: h3lix0; Tablespace: 
--

CREATE TABLE tags (
    id integer NOT NULL,
    tag character varying(255)
);


ALTER TABLE tags OWNER TO h3lix0;

--
-- Name: tags_id_seq; Type: SEQUENCE; Schema: public; Owner: h3lix0
--

CREATE SEQUENCE tags_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE tags_id_seq OWNER TO h3lix0;

--
-- Name: tags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: h3lix0
--

ALTER SEQUENCE tags_id_seq OWNED BY tags.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: h3lix0
--

ALTER TABLE ONLY classes ALTER COLUMN id SET DEFAULT nextval('classes_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: h3lix0
--

ALTER TABLE ONLY discipline_types ALTER COLUMN id SET DEFAULT nextval('discipline_types_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: h3lix0
--

ALTER TABLE ONLY disciplines ALTER COLUMN id SET DEFAULT nextval('disciplines_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: h3lix0
--

ALTER TABLE ONLY knex_migrations ALTER COLUMN id SET DEFAULT nextval('knex_migrations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: h3lix0
--

ALTER TABLE ONLY powers ALTER COLUMN id SET DEFAULT nextval('powers_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: h3lix0
--

ALTER TABLE ONLY races ALTER COLUMN id SET DEFAULT nextval('races_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: h3lix0
--

ALTER TABLE ONLY statistics ALTER COLUMN id SET DEFAULT nextval('statistics_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: h3lix0
--

ALTER TABLE ONLY tags ALTER COLUMN id SET DEFAULT nextval('tags_id_seq'::regclass);


--
-- Data for Name: class_powers; Type: TABLE DATA; Schema: public; Owner: h3lix0
--

COPY class_powers (class_id, power_id) FROM stdin;
1	2
11	3
5	7
8	9
2	11
2	15
3	18
9	19
3	24
5	26
10	27
3	28
10	30
5	33
11	34
10	37
10	41
4	45
5	48
9	50
3	52
5	53
3	54
3	57
1	61
4	64
11	66
2	67
11	69
5	70
3	71
11	72
11	74
5	75
5	78
9	79
2	80
2	82
1	83
2	85
3	86
4	88
8	89
1	91
11	92
9	93
11	95
1	96
11	97
8	98
1	99
5	106
11	110
9	111
11	113
5	114
4	115
5	116
3	119
9	123
9	124
5	127
3	132
1	133
8	134
8	136
3	138
1	139
10	140
9	142
1	145
11	147
1	150
9	154
5	156
1	158
9	159
3	163
5	168
1	170
5	171
5	174
3	176
4	177
9	178
5	179
11	180
9	181
5	185
4	186
4	187
8	188
8	191
4	193
11	194
5	196
10	203
1	204
1	209
4	210
8	212
2	213
11	214
4	215
10	217
11	220
5	222
10	223
1	226
5	230
2	232
8	237
10	238
9	239
11	240
2	245
10	251
11	254
8	256
4	261
10	262
4	263
9	264
9	265
4	267
2	269
8	274
4	276
5	279
8	280
8	282
3	283
11	285
9	286
11	287
8	288
10	289
1	291
10	293
3	298
2	299
3	300
2	301
8	302
10	304
11	308
11	311
4	315
11	319
10	320
2	329
3	330
2	333
4	334
10	335
10	340
3	347
2	350
8	352
9	354
4	356
11	358
4	359
1	360
2	361
11	363
8	369
11	371
4	372
11	373
5	374
5	377
10	378
8	379
4	380
10	381
10	382
5	384
11	387
11	388
11	390
3	393
2	394
\.


--
-- Data for Name: class_races; Type: TABLE DATA; Schema: public; Owner: h3lix0
--

COPY class_races (class_id, race_id) FROM stdin;
\.


--
-- Data for Name: class_tags; Type: TABLE DATA; Schema: public; Owner: h3lix0
--

COPY class_tags (class_id, tag_id) FROM stdin;
\.


--
-- Data for Name: classes; Type: TABLE DATA; Schema: public; Owner: h3lix0
--

COPY classes (id, data_type, slug, name, icon, description, created_at, updated_at, icon_svg, lore, class_type, abbreviation) FROM stdin;
3	class	myrmidon	Myrmidon	/assets/images/classes/myrmidon.png		2017-07-09 23:57:34.398-05	2017-07-09 23:57:34.398-05	/assets/svgs/classes/myrmidon.svg	\N	Melee	MYRM
10	class	knight	Knight	/assets/images/classes/knight.png		2017-07-09 23:57:34.399-05	2017-07-09 23:57:34.399-05	/assets/svgs/classes/knight.svg	\N	Melee	KNGT
2	class	cleric	Cleric	/assets/images/classes/cleric.png		2017-07-09 23:57:34.398-05	2017-07-09 23:57:34.398-05	/assets/svgs/classes/cleric.svg	\N	Melee	CLER
11	class	ranger	Ranger	/assets/images/classes/ranger.png		2017-07-09 23:57:34.399-05	2017-07-09 23:57:34.399-05	/assets/svgs/classes/ranger.svg	\N	Hybrid	RNGR
6	class	assassin	Assassin	/assets/images/classes/assassin.png		2017-07-09 23:57:34.399-05	2017-07-09 23:57:34.399-05	/assets/svgs/classes/assassin.svg	\N	Melee	ASSN
5	class	druid	Druid	/assets/images/classes/druid.png		2017-07-09 23:57:34.399-05	2017-07-09 23:57:34.399-05	/assets/svgs/classes/druid.svg	\N	Ranged	DRUD
8	class	duelist	Duelist	/assets/images/classes/duelist.png		2017-07-09 23:57:34.399-05	2017-07-09 23:57:34.399-05	/assets/svgs/classes/duelist.svg	\N	Hybrid	DUEL
9	class	templar	Templar	/assets/images/classes/templar.png		2017-07-09 23:57:34.399-05	2017-07-09 23:57:34.399-05	/assets/svgs/classes/templar.svg	\N	Melee	TMPR
4	class	champion	Champion	/assets/images/classes/champion.png		2017-07-09 23:57:34.398-05	2017-07-09 23:57:34.398-05	/assets/svgs/classes/champion.svg	\N	Melee	CHMP
1	class	confessor	Confessor	/assets/images/classes/confessor.png		2017-07-09 23:57:34.398-05	2017-07-09 23:57:34.398-05	/assets/svgs/classes/confessor.svg	\N	Ranged	CONF
7	class	frostweaver	Frostweaver	/assets/images/classes/frostweaver.png		2017-07-09 23:57:34.399-05	2017-07-09 23:57:34.399-05	/assets/svgs/classes/frostweaver.svg	\N	Ranged	FRTW
\.


--
-- Name: classes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: h3lix0
--

SELECT pg_catalog.setval('classes_id_seq', 11, true);


--
-- Data for Name: combos; Type: TABLE DATA; Schema: public; Owner: h3lix0
--

COPY combos (parent_power_id, child_power_id) FROM stdin;
4	6
179	7
10	8
49	14
238	30
37	37
14	42
380	45
222	48
70	53
52	54
56	59
359	64
62	65
69	66
361	67
393	71
319	72
92	74
53	78
264	79
76	84
24	86
68	87
139	91
178	93
110	95
158	99
74	110
315	115
181	123
222	127
163	132
96	133
24	138
293	140
139	145
390	147
145	150
123	159
283	163
141	164
157	172
137	173
52	176
210	177
171	179
334	186
115	187
217	203
91	204
99	209
254	214
227	216
319	220
168	222
30	223
231	224
79	239
216	244
311	254
79	265
359	276
273	281
257	284
30	289
275	292
307	297
350	301
288	302
309	326
348	327
361	333
238	335
382	340
213	361
113	363
302	369
373	371
287	373
193	380
279	384
18	393
\.


--
-- Data for Name: discipline_classes; Type: TABLE DATA; Schema: public; Owner: h3lix0
--

COPY discipline_classes (discipline_id, class_id) FROM stdin;
1	6
1	4
1	2
1	1
1	5
1	7
1	10
1	3
1	11
1	9
2	6
2	4
2	2
2	1
2	5
2	8
2	7
2	10
2	3
2	11
2	9
3	6
3	4
3	2
3	1
3	5
3	7
3	10
3	3
3	11
3	9
4	6
4	4
4	2
4	1
4	5
4	8
4	7
4	10
4	3
4	11
4	9
5	6
5	4
5	8
5	10
5	3
5	11
5	9
6	6
6	8
6	11
7	6
7	8
7	11
8	6
8	4
8	2
8	1
8	5
8	8
8	7
8	10
8	3
8	11
8	9
9	6
9	4
9	2
9	1
9	5
9	8
9	7
9	10
9	3
9	11
9	9
10	6
10	4
10	8
10	10
10	3
10	11
10	9
11	6
11	4
11	2
11	1
11	5
11	8
11	7
11	10
11	3
11	11
11	9
12	6
12	4
12	2
12	1
12	5
12	8
12	7
12	10
12	3
12	11
12	9
13	6
13	4
13	2
13	1
13	5
13	8
13	7
13	10
13	3
13	11
13	9
14	6
14	4
14	2
14	1
14	5
14	8
14	7
14	10
14	3
14	11
14	9
15	6
15	4
15	2
15	1
15	5
15	7
15	10
15	3
15	11
15	9
16	6
16	4
16	2
16	1
16	5
16	8
16	7
16	10
16	3
16	11
16	9
17	6
17	4
17	2
17	1
17	5
17	8
17	7
17	10
17	3
17	11
17	9
18	6
18	10
18	3
18	11
19	6
19	4
19	2
19	1
19	5
19	8
19	7
19	10
19	3
19	11
19	9
20	6
20	4
20	2
20	1
20	5
20	8
20	7
20	10
20	3
20	11
20	9
21	2
21	5
21	10
22	6
22	4
22	2
22	1
22	5
22	8
22	7
22	10
22	3
22	11
22	9
23	4
24	4
25	1
25	7
26	1
26	9
27	6
27	4
27	2
27	1
27	5
27	8
27	7
27	10
27	3
27	11
27	9
28	6
28	4
28	2
28	1
28	5
28	8
28	7
28	10
28	3
28	11
28	9
29	6
29	4
29	2
29	1
29	5
29	7
29	10
29	3
29	11
29	9
30	6
30	4
30	2
30	1
30	5
30	8
30	7
30	10
30	3
30	11
30	9
31	6
31	4
31	2
31	1
31	5
31	7
31	10
31	3
31	11
32	6
32	2
32	10
32	3
32	11
33	6
33	8
33	11
34	6
34	4
34	2
34	1
34	5
34	8
34	7
34	10
34	3
34	11
34	9
35	6
35	4
35	2
35	1
35	5
35	8
35	7
35	10
35	3
35	11
35	9
36	6
36	4
36	2
36	10
36	3
36	11
36	9
37	4
38	6
38	8
38	11
39	6
39	4
39	2
39	1
39	5
39	8
39	7
39	10
39	3
39	11
39	9
40	8
41	6
41	4
41	2
41	1
41	5
41	8
41	7
41	10
41	3
41	11
41	9
42	2
42	5
42	10
43	6
43	4
43	8
43	10
43	3
43	11
43	9
44	6
44	4
44	2
44	1
44	5
44	8
44	7
44	10
44	3
44	11
44	9
45	6
45	4
45	2
45	1
45	5
45	8
45	7
45	10
45	3
45	11
45	9
46	1
47	6
47	4
47	2
47	1
47	8
47	10
47	3
47	11
47	9
48	6
48	4
48	2
48	1
48	5
48	8
48	7
48	10
48	3
48	11
48	9
49	6
49	4
49	2
49	1
49	5
49	8
49	7
49	10
49	3
49	11
49	9
50	6
50	4
50	2
50	1
50	5
50	8
50	7
50	10
50	3
50	11
50	9
51	6
51	10
51	11
52	5
53	6
53	8
53	11
54	6
54	4
54	2
54	1
54	5
54	8
54	7
54	10
54	3
54	11
54	9
55	6
55	4
55	2
55	1
55	5
55	8
55	7
55	10
55	3
55	11
55	9
56	2
56	5
56	10
57	6
57	4
57	2
57	1
57	5
57	8
57	7
57	10
57	3
57	11
57	9
58	6
58	4
58	2
58	1
58	5
58	8
58	7
58	10
58	3
58	11
58	9
59	6
59	4
59	2
59	1
59	5
59	8
59	7
59	10
59	3
59	11
59	9
60	6
60	2
60	10
60	3
60	11
61	6
61	4
61	2
61	1
61	5
61	8
61	7
61	10
61	3
61	11
61	9
62	6
62	4
62	2
62	1
62	5
62	8
62	7
62	10
62	3
62	11
62	9
63	6
63	4
63	2
63	1
63	5
63	7
63	10
63	3
63	11
63	9
64	6
64	4
64	2
64	1
64	5
64	8
64	7
64	10
64	3
64	11
64	9
65	5
66	6
66	4
66	2
66	1
66	5
66	8
66	7
66	10
66	3
66	11
66	9
67	6
67	4
67	2
67	1
67	5
67	8
67	7
67	10
67	3
67	11
67	9
68	6
68	4
68	2
68	1
68	5
68	8
68	7
68	10
68	3
68	11
68	9
69	6
69	4
69	2
69	1
69	5
69	8
69	7
69	10
69	3
69	11
69	9
70	6
70	4
70	2
70	1
70	5
70	8
70	7
70	10
70	3
70	11
70	9
71	6
71	4
71	2
71	1
71	5
71	8
71	7
71	10
71	3
71	11
71	9
72	6
72	4
72	2
72	1
72	5
72	8
72	7
72	10
72	3
72	11
72	9
73	6
73	4
73	2
73	1
73	5
73	8
73	7
73	10
73	3
73	11
73	9
74	6
74	4
74	2
74	1
74	5
74	8
74	7
74	10
74	3
74	11
74	9
75	6
75	4
75	2
75	1
75	5
75	8
75	7
75	10
75	3
75	11
75	9
76	6
76	4
76	2
76	1
76	5
76	8
76	7
76	10
76	3
76	11
76	9
77	6
77	4
77	2
77	1
77	5
77	8
77	7
77	10
77	3
77	11
77	9
78	6
78	8
78	11
79	6
79	4
79	2
79	1
79	5
79	8
79	7
79	10
79	3
79	11
79	9
80	2
80	5
80	10
81	6
81	4
81	2
81	1
81	5
81	8
81	7
81	10
81	3
81	11
81	9
82	6
82	4
82	2
82	1
82	5
82	8
82	7
82	10
82	3
82	11
82	9
\.


--
-- Data for Name: discipline_powers; Type: TABLE DATA; Schema: public; Owner: h3lix0
--

COPY discipline_powers (discipline_id, power_id) FROM stdin;
76	1
1	4
8	5
23	10
8	12
54	13
54	16
72	17
36	20
21	21
56	22
58	23
20	25
18	29
15	31
60	32
20	35
30	36
14	38
5	39
81	40
46	43
4	44
40	46
7	47
5	49
40	51
65	55
33	56
10	58
76	60
60	62
6	63
53	68
51	73
33	76
73	77
82	81
75	90
16	94
82	100
9	101
5	103
69	104
16	105
45	107
81	108
13	109
20	112
73	117
18	118
24	120
64	121
8	122
46	125
22	126
70	128
23	129
2	130
33	131
27	135
36	137
30	141
19	143
63	144
8	146
19	148
42	149
52	151
56	152
31	153
81	155
18	157
57	160
51	161
11	162
27	165
70	166
11	167
17	169
70	175
38	182
63	183
25	184
65	189
3	190
71	192
56	195
20	197
23	198
10	199
82	200
41	201
6	202
80	205
25	206
68	207
72	208
35	211
25	218
25	219
29	221
39	225
40	227
44	228
43	229
43	231
29	233
43	234
6	235
72	236
40	241
26	242
49	243
67	246
23	247
46	248
16	249
63	250
1	252
81	253
39	255
60	257
37	258
58	259
50	260
21	266
39	268
5	270
78	271
74	272
21	273
51	275
27	277
32	278
43	290
37	294
52	295
69	296
52	303
11	305
34	306
53	307
32	309
7	310
7	312
47	313
39	314
70	316
19	317
75	318
45	321
52	322
52	323
69	324
53	325
77	328
6	331
75	332
79	336
72	337
54	338
64	339
58	341
65	342
82	343
36	344
59	345
63	346
10	348
45	349
11	351
45	353
76	355
19	357
75	362
62	364
32	365
30	366
36	367
64	368
56	370
66	375
42	376
58	383
73	385
61	386
73	389
48	391
29	392
\.


--
-- Data for Name: discipline_tags; Type: TABLE DATA; Schema: public; Owner: h3lix0
--

COPY discipline_tags (discipline_id, tag_id) FROM stdin;
\.


--
-- Data for Name: discipline_types; Type: TABLE DATA; Schema: public; Owner: h3lix0
--

COPY discipline_types (id, type_name, created_at, updated_at) FROM stdin;
1	Major	2017-07-26 13:09:30.984-05	2017-07-26 13:09:30.984-05
2	Minor	2017-07-26 13:09:30.984-05	2017-07-26 13:09:30.984-05
3	Weapon	2017-07-26 13:09:30.984-05	2017-07-26 13:09:30.984-05
4	Racial	2017-07-26 13:09:30.984-05	2017-07-26 13:09:30.984-05
\.


--
-- Name: discipline_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: h3lix0
--

SELECT pg_catalog.setval('discipline_types_id_seq', 4, true);


--
-- Data for Name: disciplines; Type: TABLE DATA; Schema: public; Owner: h3lix0
--

COPY disciplines (id, data_type, slug, name, discipline_type, icon, created_at, updated_at, icon_svg, description, lore, attributes) FROM stdin;
11	discipline	bard	Bard	Major	/assets/images/disciplines/bard.png	2017-07-20 20:40:07.069-05	2017-07-20 20:40:07.069-05	/assets/svgs/disciplines/bard.svg	Bards are quick to jump in with a motivating song or a tune that is sweet and spiriting. The knowledge behind the power of song is a key element; music can provide a restorative feeling and can guard even the weariest of spirits. The importance of an encore is also truly unique to a bard - always leave them wanting more...	\N	{"stats":[{"name":"Elemental Mitigation","value":3.75}],"equips":[],"slots_granted":[],"slots_removed":[],"tray_granted":"","tray_removed":""}
13	discipline	explosive-thorns	Explosive Thorns	Minor	/assets/images/disciplines/explosive-thorns.png	2017-07-20 20:40:07.069-05	2017-07-20 20:40:07.069-05	/assets/svgs/disciplines/explosive-thorns.svg	There are very few problems that cannot be solved through a suitable application of explosive thorns.	\N	{"stats":[],"equips":[],"slots_granted":[],"slots_removed":[],"tray_granted":"","tray_removed":""}
14	discipline	burning-hatred	Burning Hatred	Minor	/assets/images/disciplines/burning-hatred.png	2017-07-20 20:40:07.069-05	2017-07-20 20:40:07.069-05	/assets/svgs/disciplines/burning-hatred.svg	For generations the Fae have purged males of their species in the service of the greater good. Mothers cling to this belief as they administer The Farewell Kiss, and yet there are those who don't believe. Some other reason compells them.	\N	{"stats":[],"equips":[],"slots_granted":[],"slots_removed":[],"tray_granted":"","tray_removed":""}
15	discipline	blood-pact	Blood Pact	Minor	/assets/images/disciplines/blood-pact.png	2017-07-20 20:40:07.069-05	2017-07-20 20:40:07.069-05	/assets/svgs/disciplines/blood-pact.svg	Quid pro quo.	\N	{"stats":[],"equips":[],"slots_granted":[],"slots_removed":[],"tray_granted":"","tray_removed":""}
16	discipline	firewalker	Firewalker	Major	/assets/images/disciplines/firewalker.png	2017-07-20 20:40:07.069-05	2017-07-20 20:40:07.069-05	/assets/svgs/disciplines/firewalker.svg	Fire management has been a basic aspect of advanced life, but only a select few are able to manipulate and mitigate the flames with true power. Absorbing and reflecting the blaze allows the Firewalker to manage fire as a benefit rather than a hindrance.	\N	{"stats":[{"name":"Resistance: Fire","value":6.25}],"equips":[],"slots_granted":[],"slots_removed":[],"tray_granted":"","tray_removed":""}
17	discipline	last-resort	Last Resort	Minor	/assets/images/disciplines/last-resort.png	2017-07-20 20:40:07.069-05	2017-07-20 20:40:07.069-05	/assets/svgs/disciplines/last-resort.svg	Let's test your threshold of pain and let's see how long you last.	\N	{"stats":[],"equips":[],"slots_granted":[],"slots_removed":[],"tray_granted":"","tray_removed":""}
12	discipline	fashion-statement	Fashion Statement	Minor	/assets/images/disciplines/fashion-statement.png	2017-07-20 20:40:07.069-05	2017-07-20 20:40:07.069-05	/assets/svgs/disciplines/fashion-statement.svg	I pity the fool	\N	{"stats":[{"name":"Stealth","value":-25}],"equips":[],"slots_granted":["Amulet Slot","Amulet Slot"],"slots_removed":[],"tray_granted":"","tray_removed":""}
81	discipline	troubadour	Troubadour	Major	/assets/images/disciplines/troubadour.png	2017-07-20 20:40:07.069-05	2017-07-20 20:40:07.069-05	/assets/svgs/disciplines/troubadour.svg	A lyrical poet with a heavy output of vocal assault, the troubadour is one fierce vocalist. The importance of song and rhythms are what set the Troubadour apart from any other lyrical counterpart and can make a great addition to any party.	\N	{"stats":[{"name":"Organic Mitigation","value":3.75}],"equips":[],"slots_granted":[],"slots_removed":[],"tray_granted":"","tray_removed":""}
22	discipline	dig-in	Dig In!	Minor	/assets/images/disciplines/dig-in.png	2017-07-20 20:40:07.069-05	2017-07-20 20:40:07.069-05	/assets/svgs/disciplines/dig-in.svg	Stay strong and make them wonder how you're still standing.	\N	{"stats":[],"equips":[],"slots_granted":[],"slots_removed":[],"tray_granted":"","tray_removed":""}
23	discipline	destroyer	Destroyer	Major	/assets/images/disciplines/destroyer.png	2017-07-20 20:40:07.069-05	2017-07-20 20:40:07.069-05	/assets/svgs/disciplines/destroyer.svg	The beauty of chaos and destruction can only be seen by the few who allow themselves to succumb to the their rage.  Through the channeling of rage and devastation the ability to maintain a relentless and frightening vitality occurs.  Destroyers embrace their destructive ways and are often granted exceptional and frightening abilities in combat.	\N	{"stats":[{"name":"Max Rage","value":8.75}],"equips":[],"slots_granted":[],"slots_removed":[],"tray_granted":"","tray_removed":""}
21	discipline	master-of-shields	Master of Shields	Weapon	/assets/images/disciplines/master-of-shields.png	2017-07-20 20:40:07.069-05	2017-07-20 20:40:07.069-05	/assets/svgs/disciplines/master-of-shields.svg	The mighty shield is a versatile form of weaponry that can act as a protector and an antagonizer.  Made of the sturdiest of wood or metals in different sizes and shapes, the shield acts as a protector, a reflector of damage and light, and also deflecting big hits with little cost to stamina.  When paired with another weapon the combination is an unstoppable force on the battlefield.	\N	{"stats":[{"name":"Damage Bonus: Crushing","value":6}],"equips":["Small Bucklers"],"slots_granted":["Off-hand Weapon Slot"],"slots_removed":[],"tray_granted":"","tray_removed":""}
24	discipline	furious	Furious	Minor	/assets/images/disciplines/furious.png	2017-07-20 20:40:07.069-05	2017-07-20 20:40:07.069-05	/assets/svgs/disciplines/furious.svg	Until you learn to master your rage, your rage will become your master.	\N	{"stats":[],"equips":[],"slots_granted":[],"slots_removed":[],"tray_granted":"","tray_removed":""}
59	discipline	thornshield	Thornshield	Minor	/assets/images/disciplines/thornshield.png	2017-07-20 20:40:07.069-05	2017-07-20 20:40:07.069-05	/assets/svgs/disciplines/thornshield.svg	The Elken tend to view Thorns as a minor annoyance, a garnish, or something to eat around as they devour their victims.	\N	{"stats":[],"equips":[],"slots_granted":[],"slots_removed":[],"tray_granted":"","tray_removed":""}
82	discipline	underdog	Underdog	Major	/assets/images/disciplines/underdog.png	2017-07-20 20:40:07.069-05	2017-07-20 20:40:07.069-05	/assets/svgs/disciplines/underdog.svg	It has been said repeatedly throughout time that the outcome of a match can rarely be predicted. No matter how many times an underdog gets knocked down they are determined to get back up and back into the fray. Remember, its not the size of the dog in the fight!	\N	{"stats":[],"equips":[],"slots_granted":[],"slots_removed":[],"tray_granted":"","tray_removed":""}
38	discipline	found-resources	Found Resources	Minor	/assets/images/disciplines/found-resources.png	2017-07-20 20:40:07.069-05	2017-07-20 20:40:07.069-05	/assets/svgs/disciplines/found-resources.svg	Many experience bad luck that is associated with enormous winnings; this is oft to be thought of as the law of found resources at work.	\N	{"stats":[],"equips":[],"slots_granted":[],"slots_removed":[],"tray_granted":"","tray_removed":""}
39	discipline	field-surgeon	Field Surgeon	Major	/assets/images/disciplines/field-surgeon.png	2017-07-20 20:40:07.069-05	2017-07-20 20:40:07.069-05	/assets/svgs/disciplines/field-surgeon.svg	Field Surgeons are the first to act in the event of a combat disaster. Quick to rescue, triage and rehabilitate, these selfless Field Surgeons are your one-stop shop for quick remedies to get you back in the action. Disclaimer, use as directed and be sure to follow up with a real physician. Satisfaction is not guaranteed and once payment has been processed there are no refunds.	\N	{"stats":[{"name":"Healing Modifier","value":6.25}],"equips":[],"slots_granted":[],"slots_removed":[],"tray_granted":"","tray_removed":""}
34	discipline	punch-drunk	Punch Drunk	Minor	/assets/images/disciplines/punch-drunk.png	2017-07-20 20:40:07.069-05	2017-07-20 20:40:07.069-05	/assets/svgs/disciplines/punch-drunk.svg	Take a beating and keep on hitting!	\N	{"stats":[],"equips":[],"slots_granted":[],"slots_removed":[],"tray_granted":"","tray_removed":""}
40	discipline	master-of-pistols	Master of Pistols	Weapon	/assets/images/disciplines/master-of-pistols.png	2017-07-20 20:40:07.069-05	2017-07-20 20:40:07.069-05	/assets/svgs/disciplines/master-of-pistols.svg	Meticulously engineered with the finest of steel by the most savvy of Guineceans, the pistol is an unparalleled form of arms. Many argue the use of firearms lack proficiency, but that is untrue; in order to take full advantage of rapid fire the wielder must be steady with aim, firmly planted, and quick to react.	\N	{"stats":[{"name":"Damage Bonus: Crushing","value":6},{"name":"Distance Bonus","value":10}],"equips":[],"slots_granted":[],"slots_removed":[],"tray_granted":"","tray_removed":""}
41	discipline	matching-leather	Matching Leather	Minor	/assets/images/disciplines/matching-leather.png	2017-07-20 20:40:07.069-05	2017-07-20 20:40:07.069-05	/assets/svgs/disciplines/matching-leather.svg	Making a statement doesn't always mean having to give up functionality, or those well worn leather boots.	\N	{"stats":[],"equips":[],"slots_granted":[],"slots_removed":[],"tray_granted":"","tray_removed":""}
42	discipline	secutor	Secutor	Major	/assets/images/disciplines/secutor.png	2017-07-20 20:40:07.069-05	2017-07-20 20:40:07.069-05	/assets/svgs/disciplines/secutor.svg	Often heavily armored and accompanied with a shield, secutors are known for their solid stance and the ability to cooperate as a unit. Blessed with the essence of Arkon, Secutors also provide additional blocking protection and assist in anti-blinding by utilizing some of the power of the sun.	\N	{"stats":[{"name":"Physical Mitigations","value":3.75},{"name":"Blocking Efficiency","value":-0.5}],"equips":["Tower Shields","Small Bucklers"],"slots_granted":["Off-hand Weapon Slot"],"slots_removed":[],"tray_granted":"","tray_removed":""}
43	discipline	poisoner	Poisoner	Major	/assets/images/disciplines/poisoner.png	2017-07-20 20:40:07.069-05	2017-07-20 20:40:07.069-05	/assets/svgs/disciplines/poisoner.svg	A method of punishment often used by the Gods of Chaos, poison is the most inconspicuous and often underappreciated form of punishment. From the depths o the shadows to the dining halls of kings and queens poison takes many forms with the intention to finish off a target swiftly and with minimal retaliation.	\N	{"stats":[{"name":"Armor Pentration: Poison","value":6.25}],"equips":[],"slots_granted":[],"slots_removed":[],"tray_granted":"","tray_removed":""}
44	discipline	matching-plate	Matching Plate	Minor	/assets/images/disciplines/matching-plate.png	2017-07-20 20:40:07.069-05	2017-07-20 20:40:07.069-05	/assets/svgs/disciplines/matching-plate.svg	Don't let anyone ever dull your sparkle.	\N	{"stats":[],"equips":[],"slots_granted":[],"slots_removed":[],"tray_granted":"","tray_removed":""}
49	discipline	prickly-skin	Prickly Skin	Minor	/assets/images/disciplines/prickly-skin.png	2017-07-20 20:40:07.069-05	2017-07-20 20:40:07.069-05	/assets/svgs/disciplines/prickly-skin.svg	Not all skin conditions are detrimental.	\N	{"stats":[],"equips":[],"slots_granted":[],"slots_removed":[],"tray_granted":"","tray_removed":""}
51	discipline	master-of-swords	Master of Swords	Weapon	/assets/images/disciplines/master-of-swords.png	2017-07-20 20:40:07.069-05	2017-07-20 20:40:07.069-05	/assets/svgs/disciplines/master-of-swords.svg	The most legendary of arms, the sword is often the default weapon of combatants.  No matter the form, the wat of the sword often yields great results in the development of the wielder; the addition of beneficial applications along with the added bonus of resource gain stimulation aid in the prosperity of the brandisher.  With a slight of hand and a bit of practice those who follow the way will profit greatly in and out of combat.	\N	{"stats":[{"name":"Damage Bonus: Slashing","value":6}],"equips":[],"slots_granted":[],"slots_removed":[],"tray_granted":"","tray_removed":""}
58	discipline	militant-mage	Militant Mage	Major	/assets/images/disciplines/militant-mage.png	2017-07-20 20:40:07.069-05	2017-07-20 20:40:07.069-05	/assets/svgs/disciplines/militant-mage.svg	Militant Mages are known for their overzealous nature and the ability to pursue their cause even during the most strenuous of moments.  Much like Hero, Militant Mages are known to only have the idea of battle and combat on their minds; utilizing slashing attacks and Warping Metal are all characteristic attributes that help spread awareness to their cause.	\N	{"stats":[{"name":"Mitigation: Slashing","value":6.25}],"equips":[],"slots_granted":[],"slots_removed":[],"tray_granted":"","tray_removed":""}
48	discipline	uniform-mail	Uniform Mail	Minor	/assets/images/disciplines/uniform-mail.png	2017-07-20 20:40:07.069-05	2017-07-20 20:40:07.069-05	/assets/svgs/disciplines/uniform-mail.svg	The inhabitants of the Dyling Lands have little time to worry about appearances, yet Guinecean's always seem poised to strut at a fashion show.	\N	{"stats":[],"equips":[],"slots_granted":[],"slots_removed":[],"tray_granted":"","tray_removed":""}
50	discipline	protective-thorns	Protective Thorns	Minor	/assets/images/disciplines/protective-thorns.png	2017-07-20 20:40:07.069-05	2017-07-20 20:40:07.069-05	/assets/svgs/disciplines/protective-thorns.svg	We are here to laugh at the odds and live our lives so well that Death will tremble to take us.	\N	{"stats":[],"equips":[],"slots_granted":[],"slots_removed":[],"tray_granted":"","tray_removed":""}
54	discipline	standard-bearer	Standard Bearer	Major	/assets/images/disciplines/standard-bearer.png	2017-07-20 20:40:07.069-05	2017-07-20 20:40:07.069-05	/assets/svgs/disciplines/standard-bearer.svg	A Standard Bearer is a member of a combat group that is responsible for carrying a distinctive mark, often times a flag, as a rallying sign. The added motivation a standard can bring is substantial enough to excite and inspire even the most fatigued of allies while acting as a waypoint for those in their company.	\N	{"stats":[{"name":"Physical Mitigation","value":3.75}],"equips":[],"slots_granted":[],"slots_removed":[],"tray_granted":"","tray_removed":""}
61	discipline	twisting	Twisting	Minor	/assets/images/disciplines/twisting.png	2017-07-20 20:40:07.069-05	2017-07-20 20:40:07.069-05	/assets/svgs/disciplines/twisting.svg	Not for the faint of wrist.	\N	{"stats":[],"equips":[],"slots_granted":[],"slots_removed":[],"tray_granted":"","tray_removed":""}
62	discipline	uniform-leather	Uniform Leather	Minor	/assets/images/disciplines/uniform-leather.png	2017-07-20 20:40:07.069-05	2017-07-20 20:40:07.069-05	/assets/svgs/disciplines/uniform-leather.svg	You may not always feel like you are your best, but at least you're well dressed.	\N	{"stats":[],"equips":[],"slots_granted":[],"slots_removed":[],"tray_granted":"","tray_removed":""}
69	discipline	rune-caster	Rune Caster	Major	/assets/images/disciplines/rune-caster.png	2017-07-20 20:40:07.069-05	2017-07-20 20:40:07.069-05	/assets/svgs/disciplines/rune-caster.svg	Deciphering and utilizing the secret mysteries of runes is a tricky and sometimes difficult endeavor. Rune Casters have been known to look to Illara as the creator and keeper of rune knowledge. Those who are in tune and can decipher the arcane runes are granted many advantages in the form of shields, fortifications and sanctuary, in and out of combat.	\N	{"stats":[{"name":"Physical Mitigation","value":3.75}],"equips":[],"slots_granted":[],"slots_removed":[],"tray_granted":"","tray_removed":""}
70	discipline	mole-hunter	Mole Hunter	Major	/assets/images/disciplines/mole-hunter.png	2017-07-20 20:40:07.069-05	2017-07-20 20:40:07.069-05	/assets/svgs/disciplines/mole-hunter.svg	A heightened sense of awareness has often been compared to paranoia, but on the battlefield it is the ultimate key to fending off unexpected attacks. Those who are cloaked in the shadows are more exposed and more vulnerable when a Mole Hunter is present. Whacking moles and stealthers eventually becomes an easy game of Hide and Seek.	\N	{"stats":[{"name":"Perception","value":20},{"name":"Dodge Regen Tick Rate","value":-0.01}],"equips":[],"slots_granted":[],"slots_removed":[],"tray_granted":"","tray_removed":""}
72	discipline	scarecrow	Scarecrow	Major	/assets/images/disciplines/scarecrow.png	2017-07-20 20:40:07.069-05	2017-07-20 20:40:07.069-05	/assets/svgs/disciplines/scarecrow.svg	One of the most prevalent icons of horror is the scarecrow. Often rudimentary and crude in apperance with an accompanied aura of terror, the scarecrow is often more terrifying in apperance than character, but that doesn't change the fact that they often cause shudders and shivers. Along with the sense of foreboding they can also cause even the most brutal of attackers to be stunned with fright.	\N	{"stats":[{"name":"Resistance: Piercing","value":6.25}],"equips":[],"slots_granted":[],"slots_removed":[],"tray_granted":"","tray_removed":""}
71	discipline	overwhelming-odds	Overwhelming Odds	Minor	/assets/images/disciplines/overwhelming-odds.png	2017-07-20 20:40:07.069-05	2017-07-20 20:40:07.069-05	/assets/svgs/disciplines/overwhelming-odds.svg	For an immortal there is no surrender, no mercy asked, none given.  With the rules of battle as such, they fight no matter the odds.	\N	{"stats":[],"equips":[],"slots_granted":[],"slots_removed":[],"tray_granted":"","tray_removed":""}
1	discipline	adjudicator	Adjudicator	Major	/assets/images/disciplines/adjudicator.png	2017-07-20 20:40:07.069-05	2017-07-20 20:40:07.069-05	/assets/svgs/disciplines/adjudicator.svg	An Adjudicator is often synonymous with a mediator or judge and most associated with the Church of Arkon. The importance of banishing sin with fire the truest form of retribution against the guilty and can only be performed by the most devote of disciples.	\N	{"stats":[{"name":"Damage Bonus: Crushing","value":6.25}],"equips":[],"slots_granted":[],"slots_removed":[],"tray_granted":"","tray_removed":""}
2	discipline	glass-cannon	Glass Cannon	Minor	/assets/images/disciplines/glass-cannon.png	2017-07-20 20:40:07.069-05	2017-07-20 20:40:07.069-05	/assets/svgs/disciplines/glass-cannon.svg	Makes no sense. At all.	\N	{"stats":[],"equips":[],"slots_granted":[],"slots_removed":[],"tray_granted":"","tray_removed":""}
3	discipline	armor-of-faith	Armor of Faith	Minor	/assets/images/disciplines/armor-of-faith.png	2017-07-20 20:40:07.069-05	2017-07-20 20:40:07.069-05	/assets/svgs/disciplines/armor-of-faith.svg	The Book of Justice is often the only armor a follower of Arkon carries.	\N	{"stats":[],"equips":[],"slots_granted":[],"slots_removed":[],"tray_granted":"","tray_removed":""}
4	discipline	careless-whisper	Careless Whisper	Minor	/assets/images/disciplines/careless-whisper.png	2017-07-20 20:40:07.069-05	2017-07-20 20:40:07.069-05	/assets/svgs/disciplines/careless-whisper.svg	There's no comfort in the truth, Pain is all you'll find.	\N	{"stats":[],"equips":[],"slots_granted":[],"slots_removed":[],"tray_granted":"","tray_removed":""}
5	discipline	blade-master	Blade Master	Major	/assets/images/disciplines/blade-master.png	2017-07-20 20:40:07.069-05	2017-07-20 20:40:07.069-05	/assets/svgs/disciplines/blade-master.svg	The blade takes shape in many forms: swords, daggers, and knives, all of which are quite lethal.  Blade Masters often seek prayer with Maeve, The Goddess of War, and are quick to force their enemies to pay a toll with their blood.  Whether it is a backstab, a sword fight, or the toss of a knife, the blade craves the blood of the enemy as much as the wielder craves victory.	\N	{"stats":[{"name":"Armor Penetration: Slashing","value":6.25}],"equips":[],"slots_granted":[],"slots_removed":[],"tray_granted":"","tray_removed":""}
6	discipline	agent-provocateur	Agent Provocateur	Major	/assets/images/disciplines/agent-provocateur.png	2017-07-20 20:40:07.069-05	2017-07-20 20:40:07.069-05	/assets/svgs/disciplines/agent-provocateur.svg	Agent Provocateurs are sneaky, well-hidden, and difficult to track. Sometimes they drop caltrops, sometimes they prefer a stink bomb, but no matter the method of deceit the intent is always done with mischief and stealth in mind.	\N	{"stats":[{"name":"Stealth","value":6.25}],"equips":[],"slots_granted":[],"slots_removed":[],"tray_granted":"","tray_removed":""}
8	discipline	banshee	Banshee	Major	/assets/images/disciplines/banshee.png	2017-07-20 20:40:07.069-05	2017-07-20 20:40:07.069-05	/assets/svgs/disciplines/banshee.svg	An ambassador of death, The Banshee is most known for a distinguished wail that can cause fear and sometimes paralysis in some. A haunting presence along with the ability to conjure a ghost army are all aspects that accompany an angel of death.	\N	{"stats":[{"name":"Damage Modifier","value":6.25}],"equips":[],"slots_granted":[],"slots_removed":[],"tray_granted":"","tray_removed":""}
66	discipline	uniform-plate	Uniform Plate	Minor	/assets/images/disciplines/uniform-plate.png	2017-07-20 20:40:07.069-05	2017-07-20 20:40:07.069-05	/assets/svgs/disciplines/uniform-plate.svg	Some prefer to armour themselves in cloth and leather, but the more dignified and sturdy combatant prefer a bit more shine.	\N	{"stats":[],"equips":[],"slots_granted":[],"slots_removed":[],"tray_granted":"","tray_removed":""}
76	discipline	reality-warper	Reality Warper	Major	/assets/images/disciplines/reality-warper.png	2017-07-20 20:40:07.069-05	2017-07-20 20:40:07.069-05	/assets/svgs/disciplines/reality-warper.svg	Exploiting and bending reality is an aspect only a select few can possess. Manipulating time, altering the ability to heal and influencing incoming and outgoing damage are all features onle a warper of reality can master. For them, reality is just a suggestion.	\N	{"stats":[{"name":"Damage Modifier","value":3.75}],"equips":[],"slots_granted":[],"slots_removed":[],"tray_granted":"","tray_removed":""}
9	discipline	finish-him	Finish Him	Minor	/assets/images/disciplines/finish-him.png	2017-07-20 20:40:07.069-05	2017-07-20 20:40:07.069-05	/assets/svgs/disciplines/finish-him.svg	The Church of Arkon is said to have flawless methods of finishing their ennemies.	\N	{"stats":[],"equips":[],"slots_granted":[],"slots_removed":[],"tray_granted":"","tray_removed":""}
10	discipline	knife-grinder	Knife Grinder	Major	/assets/images/disciplines/knife-grinder.png	2017-07-20 20:40:07.069-05	2017-07-20 20:40:07.069-05	/assets/svgs/disciplines/knife-grinder.svg	The art of bleeding a target is one that only a few can accomplish proficiently.  Followers of Maeve have known for years how important the blade is in combat.  With proper training and practice knife grinding can be the determining factor in a victory or a loss.	\N	{"stats":[{"name":"Damage Bonus: Slashing","value":6.25}],"equips":[],"slots_granted":[],"slots_removed":[],"tray_granted":"","tray_removed":""}
31	discipline	eminently-punchable	Eminently Punchable	Minor	/assets/images/disciplines/eminently-punchable.png	2017-07-20 20:40:07.069-05	2017-07-20 20:40:07.069-05	/assets/svgs/disciplines/eminently-punchable.svg	Minotaur's demonstrate combat prowess through headbutting each other with enough force to knock each off their feed. This of course enrages them, which leads to more headbutting, which enrages them even further, and so on.	\N	{"stats":[],"equips":[],"slots_granted":[],"slots_removed":[],"tray_granted":"","tray_removed":""}
26	discipline	mortal-sin	Mortal Sin	Minor	/assets/images/disciplines/mortal-sin.png	2017-07-20 20:40:07.069-05	2017-07-20 20:40:07.069-05	/assets/svgs/disciplines/mortal-sin.svg	Peccata mortalia.  Without remorse a sinner will continue to burn with punishment.	\N	{"stats":[],"equips":[],"slots_granted":[],"slots_removed":[],"tray_granted":"","tray_removed":""}
35	discipline	peripheral-vision	Peripheral Vision	Minor	/assets/images/disciplines/peripheral-vision.png	2017-07-20 20:40:07.069-05	2017-07-20 20:40:07.069-05	/assets/svgs/disciplines/peripheral-vision.svg	Through my peripheral I see ya scheming.	\N	{"stats":[{"name":"Peripheral Vision","value":1.15}],"equips":[],"slots_granted":[],"slots_removed":[],"tray_granted":"","tray_removed":""}
55	discipline	sustaining-note	Sustaining Note	Minor	/assets/images/disciplines/sustaining-note.png	2017-07-20 20:40:07.069-05	2017-07-20 20:40:07.069-05	/assets/svgs/disciplines/sustaining-note.svg	Sometimes the wrists just need a break.	\N	{"stats":[{"name":"Song Duration","value":6}],"equips":[],"slots_granted":[],"slots_removed":[],"tray_granted":"","tray_removed":""}
18	discipline	master-of-axes	Master of Axes	Weapon	/assets/images/disciplines/master-of-axes.png	2017-07-20 20:40:07.069-05	2017-07-20 20:40:07.069-05	/assets/svgs/disciplines/master-of-axes.svg	The battle axe has been a common element in many a skirmish for all ancient cultures; its versatility and ease of use has lead many to embrace it as a primary weapon of cohice.  With the ability to break through armor with a quickness and an opportunity to cleave those who stand in the way, the axe has proven itself as a multifunctional and berserker-style armament.	\N	{"stats":[{"name":"Damage Bonus: Slashing","value":6}],"equips":[],"slots_granted":[],"slots_removed":[],"tray_granted":"","tray_removed":""}
28	discipline	hand-of-glory	Hand of Glory	Minor	/assets/images/disciplines/hand-of-glory.png	2017-07-20 20:40:07.069-05	2017-07-20 20:40:07.069-05	/assets/svgs/disciplines/hand-of-glory.svg	Cut from the body of a criminal on the gibbet; pickled in salt, and the urine of man, woman, dog, horse and mare; smoked with herbs and hay for a month; hung on an oak tree for three nights running, laid at a crossroads, and finally hung on a church door for one night.  Now worn around your neck for an extra ring slot.	\N	{"stats":[{"name":"Perception","value":5}],"equips":[],"slots_granted":["Ring Slot"],"slots_removed":[],"tray_granted":"","tray_removed":""}
37	discipline	runescarred-gladiator	Runescarred Gladiator	Major	/assets/images/disciplines/runescarred-gladiator.png	2017-07-20 20:40:07.069-05	2017-07-20 20:40:07.069-05	/assets/svgs/disciplines/runescarred-gladiator.svg	Blood is used in rune making as a magical property of life essence and sacrifice. The ultimate sacrifice for rune crafting is scarring runes into the flesh, which only the most devote are brave enough to do. Exchanging small spaces in the flesh to fill with runes grants them unyielding power and a continued devotion to self-sacrificing for the sake of combat.	\N	{"stats":[{"name":"Max Rage","value":10},{"name":"Enhanced Catch Your Breath","value":80}],"equips":[],"slots_granted":[],"slots_removed":[],"tray_granted":"","tray_removed":""}
47	discipline	spirit-whip	Spirit Whip	Minor	/assets/images/disciplines/spirit-whip.png	2017-07-20 20:40:07.069-05	2017-07-20 20:40:07.069-05	/assets/svgs/disciplines/spirit-whip.svg	Crack that whip and give the past the slip.  It's not too late... To spirit whip it!	\N	{"stats":[],"equips":[],"slots_granted":[],"slots_removed":[],"tray_granted":"","tray_removed":""}
57	discipline	minor-accompaniment	Minor Accompaniment	Minor	/assets/images/disciplines/minor-accompaniment.png	2017-07-20 20:40:07.069-05	2017-07-20 20:40:07.069-05	/assets/svgs/disciplines/minor-accompaniment.svg	Bach up and compose yourself!	\N	{"stats":[],"equips":[],"slots_granted":[],"slots_removed":[],"tray_granted":"","tray_removed":""}
68	discipline	matching-mail	Matching Mail	Minor	/assets/images/disciplines/matching-mail.png	2017-07-20 20:40:07.069-05	2017-07-20 20:40:07.069-05	/assets/svgs/disciplines/matching-mail.svg	You've got mail!	\N	{"stats":[],"equips":[],"slots_granted":[],"slots_removed":[],"tray_granted":"","tray_removed":""}
78	discipline	shadows-caress	Shadows Caress	Minor	/assets/images/disciplines/shadows-caress.png	2017-07-20 20:40:07.069-05	2017-07-20 20:40:07.069-05	/assets/svgs/disciplines/shadows-caress.svg	The shadow's are said to wrap around those who frequent them like a soothing blanket, diminishing their wounds.  Unless of course that blanket is a dagger.  And that dagger is aimed at your heart.	\N	{"stats":[],"equips":[],"slots_granted":[],"slots_removed":[],"tray_granted":"","tray_removed":""}
19	discipline	escape-artist	Escape Artist	Major	/assets/images/disciplines/escape-artist.png	2017-07-20 20:40:07.069-05	2017-07-20 20:40:07.069-05	/assets/svgs/disciplines/escape-artist.svg	Escapology is an artform that is still shrouded in mystery. An escapologist will quickly learn the ability to break free from mobility limitations allowing avoidance of even the most obnoxious of crowd control methods. While it may seem easy to the escapist, onlookers and enemies will beg to know the secrets of escape, but a magician never reveals their methods.	\N	{"stats":[],"equips":[],"slots_granted":[],"slots_removed":[],"tray_granted":"","tray_removed":""}
29	discipline	pixie	Pixie	Major	/assets/images/disciplines/pixie.png	2017-07-20 20:40:07.069-05	2017-07-20 20:40:07.069-05	/assets/svgs/disciplines/pixie.svg	Mischievious, energetic, and jovial in nature, Pixies are known to be an asset to their allies and a pesky nuisance to their enemies.  A bit of the essence of Cybele lives in each Pixie as they offer an ally a quick fix, use their magic dust to assist in healing, and can use their conjury to also alter the size and intimidation of a foe with true ease.	\N	{"stats":[{"name":"Healing Modifier","value":6.25}],"equips":[],"slots_granted":[],"slots_removed":[],"tray_granted":"","tray_removed":""}
30	discipline	dryad	Dryad	Major	/assets/images/disciplines/dryad.png	2017-07-20 20:40:07.069-05	2017-07-20 20:40:07.069-05	/assets/svgs/disciplines/dryad.svg	Arboreal energy exists in ways that can only be harnessed by the most insightful of nature enthusiasts.  Utilizing the power of trees assists with quick healing efforts that cannot be surpassed.  Dryads are quite in tune with nature and are quick to offer a helpful blast of leaves to the face.	\N	{"stats":[{"name":"Healing Modifier","value":6.25},{"name":"Enhanced Druid Orbs","value":90}],"equips":[],"slots_granted":[],"slots_removed":[],"tray_granted":"","tray_removed":""}
20	discipline	friar	Friar	Major	/assets/images/disciplines/friar.png	2017-07-20 20:40:07.069-05	2017-07-20 20:40:07.069-05	/assets/svgs/disciplines/friar.svg	Friars of the Church of Arkon provide the community with a unique service that no other can provide.  Friars willingly listen and pardon the sins of the people with an undaunting zeal; no sin is too great, for they have heard them all and they are eager to hear more.  Their unyielding dedication to their trade provides many in their company with benefits in health and the avoidance of sin while also providing the Friars with a few extra perks.	\N	{"stats":[{"name":"Final Healing Modifier","value":0.063}],"equips":[],"slots_granted":[],"slots_removed":[],"tray_granted":"","tray_removed":""}
60	discipline	master-of-hammers	Master of Hammers	Weapon	/assets/images/disciplines/master-of-hammers.png	2017-07-20 20:40:07.069-05	2017-07-20 20:40:07.069-05	/assets/svgs/disciplines/master-of-hammers.svg	The war hammer is a heavy piece of weaponry meant for close-combat with the intent of piercing through heavy armor.  Similar to a mace, the war hammer requires dexterity and strength to wield, but once a crow masters the war hammer it'll leave many pleading the phrase 'Please Hammer, Don't Hurt 'Em!'.	\N	{"stats":[{"name":"Damage Bonus: Crushing","value":6}],"equips":[],"slots_granted":[],"slots_removed":[],"tray_granted":"","tray_removed":""}
25	discipline	master-of-focus	Master of Focus	Weapon	/assets/images/disciplines/master-of-focus.png	2017-07-20 20:40:07.069-05	2017-07-20 20:40:07.069-05	/assets/svgs/disciplines/master-of-focus.svg	The ultimate power of focus allows for an expansion of one's own capability.  With fixation and intent, the power of the mind allows for the ultimate weapon to take form.  Novas, piercing orbs, and revenge are just a few of the aspects of concentration a master can wield.	\N	{"stats":[{"name":"Damage Bonus: Fire","value":6},{"name":"Damage Bonus: Ice","value":6}],"equips":[],"slots_granted":[],"slots_removed":[],"tray_granted":"","tray_removed":""}
65	discipline	master-of-scimitars	Master of Scimitars	Weapon	/assets/images/disciplines/master-of-scimitars.png	2017-07-20 20:40:07.069-05	2017-07-20 20:40:07.069-05	/assets/svgs/disciplines/master-of-scimitars.svg	The curved sword may look quite different from the more common design, but it is just as lethal.  Most often seen in use during mounted combat, the scimitar is lighter and made for quick swipes with an emphasis on harvesting the power of lightning.	\N	{"stats":[{"name":"Damage Bonus: Electricity","value":6}],"equips":["Small Bucklers","Mystical Scimitars"],"slots_granted":["Off-hand Weapon Slot"],"slots_removed":[],"tray_granted":"","tray_removed":"Life Tray"}
75	discipline	shield-breaker	Shield Breaker	Major	/assets/images/disciplines/shield-breaker.png	2017-07-20 20:40:07.069-05	2017-07-20 20:40:07.069-05	/assets/svgs/disciplines/shield-breaker.svg	A shield is a mighty piece of weaponry and armor that is often difficult to bypass, but a Shield Breaker has the ability to plow through such armament with ease. Breaking barriers and exposing weakness are just a few attributes they are privy to adding another layer of complexity to combat.	\N	{"stats":[{"name":"Armor Penetration: Slashing","value":3.75},{"name":"Armor Penetration: Crushing","value":3.75},{"name":"Armor Penetration: Piercing","value":3.75}],"equips":[],"slots_granted":[],"slots_removed":[],"tray_granted":"","tray_removed":""}
27	discipline	illusionist	Illusionist	Major	/assets/images/disciplines/illusionist.png	2017-07-20 20:40:07.069-05	2017-07-20 20:40:07.069-05	/assets/svgs/disciplines/illusionist.svg	An Illusionist alters the perception of those within their proximity which allows for easier deception and confusion. With the assistance of a magic weapon and the finest of accoutrements an Illusionist maintains a dapper appearance while also being a worth adversary in combat.	\N	{"stats":[{"name":"Perception","value":20}],"equips":[],"slots_granted":[],"slots_removed":[],"tray_granted":"","tray_removed":""}
36	discipline	holy-avenger	Holy Avenger	Major	/assets/images/disciplines/holy-avenger.png	2017-07-20 20:40:07.069-05	2017-07-20 20:40:07.069-05	/assets/svgs/disciplines/holy-avenger.svg	Tapping into your motivation and channeling it into your current situation is key; no one else is an in tune with their surroundings as that of the Holy Avenger.  The opposition may consider you a scene-stealing hack but you know your methods are far more superior to others.  Always remember the battle chant of your brethren: never give up, never surrender!	\N	{"stats":[{"name":"Damage Bonus: Crushing","value":6.25}],"equips":[],"slots_granted":[],"slots_removed":[],"tray_granted":"","tray_removed":""}
46	discipline	master-of-arcane	Master of Arcane	Weapon	/assets/images/disciplines/master-of-arcane.png	2017-07-20 20:40:07.069-05	2017-07-20 20:40:07.069-05	/assets/svgs/disciplines/master-of-arcane.svg	Tomes contain some of the most ancient and arcane knowledge with their pages.  The most prominent scholars have often kept their secrets hidden in mystical grimoires granting only the most intellectual and zealous as capable of understanding the insight contained within the bindings.  From the brandishing of fire, to the process of redemption, only the most skillful of masters can attain full concentration.	\N	{"stats":[{"name":"Damage Bonus: Fire","value":6}],"equips":[],"slots_granted":[],"slots_removed":[],"tray_granted":"","tray_removed":""}
56	discipline	shield-fighter	Shield Fighter	Major	/assets/images/disciplines/shield-fighter.png	2017-07-20 20:40:07.069-05	2017-07-20 20:40:07.069-05	/assets/svgs/disciplines/shield-fighter.svg	Strength is not the only deciding factor in the heat of battle. Endurance, stamina, and tenacious spirit are necessary aspects of combat survival, and the addition of a shield can help increase the heartiness of the fighter. Shield Fighters are quick to utilize their armament by blocking blows, richocheting strikes, and the avoidance of massive damage. Fortitude, patience, and a defensive stance are what define a true Shield Fighter.	\N	{"stats":[{"name":"Armor Penetration: Crushing","value":6.25}],"equips":["Small Bucklers"],"slots_granted":["Off-hand Weapon Slot"],"slots_removed":[],"tray_granted":"","tray_removed":""}
67	discipline	pound-of-flesh	Pound of Flesh	Minor	/assets/images/disciplines/pound-of-flesh.png	2017-07-20 20:40:07.069-05	2017-07-20 20:40:07.069-05	/assets/svgs/disciplines/pound-of-flesh.svg	Take then thy bond, take thou thy pound of flesh.	\N	{"stats":[],"equips":[],"slots_granted":[],"slots_removed":[],"tray_granted":"","tray_removed":""}
32	discipline	master-of-maces	Master of Maces	Weapon	/assets/images/disciplines/master-of-maces.png	2017-07-20 20:40:07.069-05	2017-07-20 20:40:07.069-05	/assets/svgs/disciplines/master-of-maces.svg	Created from the most durable of metals and woods the mace is as varied a weapon as those who use it.  Heavy, obtuse, and often times strenuous to use, only those who can proficiently brandish the blunt force of maces successfully can attain the title of a Master.	\N	{"stats":[{"name":"Damage Bonus: Crushing","value":6}],"equips":[],"slots_granted":[],"slots_removed":[],"tray_granted":"","tray_removed":""}
52	discipline	master-of-mystical-staves	Master of Mystical Staves	Weapon	/assets/images/disciplines/master-of-mystical-staves.png	2017-07-20 20:40:07.069-05	2017-07-20 20:40:07.069-05	/assets/svgs/disciplines/master-of-mystical-staves.svg	Crafted with care and the utmost consideration for personalization, the Mystical Stave is one of the most unique items used for magical and combative purposes.  A key element for rooting the enemy, enchantment, and conjuration, the stave can also be used similar to a polearm in close-quarters combat.	\N	{"stats":[{"name":"Damage Bonus: Electricity","value":6}],"equips":[],"slots_granted":[],"slots_removed":[],"tray_granted":"","tray_removed":""}
63	discipline	mudman	Mudman	Major	/assets/images/disciplines/mudman.png	2017-07-20 20:40:07.069-05	2017-07-20 20:40:07.069-05	/assets/svgs/disciplines/mudman.svg	The addition of muddy skin and a marshy body creates a vile combatant that can withstand even the heartiest hits.  Mudmen become one with the muck and can also spread their dirt and odors to enemies.  The addition of sacred mud and gunk add to the ability to self heal creating one sticky and tough fighter.	\N	{"stats":[],"equips":[],"slots_granted":[],"slots_removed":[],"tray_granted":"","tray_removed":""}
7	discipline	black-mask	Black Mask	Major	/assets/images/disciplines/black-mask.png	2017-07-20 20:40:07.069-05	2017-07-20 20:40:07.069-05	/assets/svgs/disciplines/black-mask.svg	Black Masks are masters of disguise.  Despite the rumors they are not a group of heartless and evil killers, but rather cunning and sly assassins.  They are employed by all that request their blade, even those who seek revenge from previous errands.	\N	{"stats":[{"name":"Stealth","value":6.25}],"equips":[],"slots_granted":[],"slots_removed":[],"tray_granted":"","tray_removed":""}
53	discipline	master-of-daggers	Master of Daggers	Weapon	/assets/images/disciplines/master-of-daggers.png	2017-07-20 20:40:07.069-05	2017-07-20 20:40:07.069-05	/assets/svgs/disciplines/master-of-daggers.svg	No matter the material, be it flint, ivory, bone, or metal, the lethalness of the dagger remains intact.  With a blade smaller than most typical swords and commonly used in close-quarters combat, the dagger is an exceptional tool that requires finesse, quickness, and dexterity in order to properly sap and steal health from a target.	\N	{"stats":[{"name":"Damage Bonus: Piercing","value":6}],"equips":[],"slots_granted":[],"slots_removed":[],"tray_granted":"","tray_removed":""}
74	discipline	resolution	Resolution	Minor	/assets/images/disciplines/resolution.png	2017-07-20 20:40:07.069-05	2017-07-20 20:40:07.069-05	/assets/svgs/disciplines/resolution.svg	Only fools dream of immortality.  To feel the death of every body, the pain of every new form.  There must be some way to break this never ending cycle!  Or does that miserable statue which towers over every rebirth only serve to remind all Crows that if Hero couldn't break the cycle, no one can?	\N	{"stats":[],"equips":[],"slots_granted":[],"slots_removed":[],"tray_granted":"","tray_removed":""}
33	discipline	master-of-rapiers	Master of Rapiers	Weapon	/assets/images/disciplines/master-of-rapiers.png	2017-07-20 20:40:07.069-05	2017-07-20 20:40:07.069-05	/assets/svgs/disciplines/master-of-rapiers.svg	Long, slender, lithe, and featherweight, the rapier is no typical sabre.  With an ornate hilt and made of the lightest of metals the intent of its design is quite clear; to jab and thrust quickly, efficiently, and with full force while also hindering and slowing the opponent.	\N	{"stats":[{"name":"Damage Bonus: Piercing","value":6}],"equips":[],"slots_granted":[],"slots_removed":[],"tray_granted":"","tray_removed":""}
45	discipline	juggernaut	Juggernaut	Major	/assets/images/disciplines/juggernaut.png	2017-07-20 20:40:07.069-05	2017-07-20 20:40:07.069-05	/assets/svgs/disciplines/juggernaut.svg	No other form of combatant is built to last as much as that of a Juggernaut which is due to extreme endurance and spite. Mercilessness, ruthlessness and resiliency are also defining characteristics that attribute to the robust nature of an unstoppable fighter whose impact will be felt repeatedly.	\N	{"stats":[],"equips":[],"slots_granted":[],"slots_removed":[],"tray_granted":"","tray_removed":""}
73	discipline	plague-lord	Plague Lord	Major	/assets/images/disciplines/plague-lord.png	2017-07-20 20:40:07.069-05	2017-07-20 20:40:07.069-05	/assets/svgs/disciplines/plague-lord.svg	As a host of the most noxious of contaminants your popularity may ebb and flow as you infect your enemies. The odors and muck you may leave behind will help remind those of your legacy as a plague bearer and a master of the rank andf oul making you one highly feared adversary.	\N	{"stats":[],"equips":[],"slots_granted":[],"slots_removed":[],"tray_granted":"","tray_removed":""}
77	discipline	sparring	Sparring	Minor	/assets/images/disciplines/sparring.png	2017-07-20 20:40:07.069-05	2017-07-20 20:40:07.069-05	/assets/svgs/disciplines/sparring.svg	It's the thrill of the fight and rising up to the challenge of your rival.	\N	{"stats":[],"equips":[],"slots_granted":[],"slots_removed":[],"tray_granted":"","tray_removed":""}
79	discipline	sturdy	Sturdy	Minor	/assets/images/disciplines/sturdy.png	2017-07-20 20:40:07.069-05	2017-07-20 20:40:07.069-05	/assets/svgs/disciplines/sturdy.svg	The only thing said to unsettle a Stoneborn, is the sight of an immortal summoning a Runestone Hammer...	\N	{"stats":[],"equips":[],"slots_granted":[],"slots_removed":[],"tray_granted":"","tray_removed":""}
80	discipline	shield-whiz	Shield Whiz	Minor	/assets/images/disciplines/shield-whiz.png	2017-07-20 20:40:07.069-05	2017-07-20 20:40:07.069-05	/assets/svgs/disciplines/shield-whiz.svg	Throwing a shield is geometry in its most challenging form; a science of precise angles and forces, not to mention a goddamn massive arm.	\N	{"stats":[{"name":"Shield Throw: Bonus Ricochets","value":1},{"name":"Shield Throw: Falloff Bonus","value":0.06}],"equips":[],"slots_granted":[],"slots_removed":[],"tray_granted":"","tray_removed":""}
64	discipline	naiad	Naiad	Major	/assets/images/disciplines/naiad.png	2017-07-20 20:40:07.069-05	2017-07-20 20:40:07.069-05	/assets/svgs/disciplines/naiad.svg	Naiads, or Water Spirits, are in tune with the ebb and flow of fresh waters and the possibility of its power. They often take comfort in the flowing of water and view it as a source of life. Water Spirits help alleviate pain and harm while also extinguishing even the most volatile of infernos, after all Water Beats Fire!	\N	{"stats":[{"name":"Healing Modifier","value":6.25}],"equips":[],"slots_granted":[],"slots_removed":[],"tray_granted":"","tray_removed":""}
\.


--
-- Name: disciplines_id_seq; Type: SEQUENCE SET; Schema: public; Owner: h3lix0
--

SELECT pg_catalog.setval('disciplines_id_seq', 82, true);


--
-- Data for Name: knex_migrations; Type: TABLE DATA; Schema: public; Owner: h3lix0
--

COPY knex_migrations (id, name, batch, migration_time) FROM stdin;
1	20170702110020_power-and-combo-tables.js	1	2017-07-03 12:27:47.972-05
2	20170703181612_power_tags.js	2	2017-07-03 18:19:35.589-05
3	20170703203913_powers-name.js	3	2017-07-03 20:41:07.605-05
4	20170703204216_races-race-disciplines-race-classes.js	4	2017-07-03 21:41:04.748-05
5	20170707171028_add_icon_svg.js	5	2017-07-07 17:14:04.072-05
6	20170707193536_add-cooldown-to-powers.js	6	2017-07-07 19:37:37.399-05
7	20170707195332_change-range-to-float.js	7	2017-07-07 19:59:43.017-05
8	20170707235556_change_to_decimal.js	8	2017-07-07 23:57:44.248-05
9	20170707235946_change_back_to_integer.js	9	2017-07-08 00:00:15.476-05
10	20170708002544_change_desc_to_text.js	10	2017-07-08 00:26:25.501-05
11	20170708003459_change.js	11	2017-07-08 00:36:48.558-05
12	20170709172301_change_grants_to_extra.js	12	2017-07-09 17:25:38.321-05
13	20170709172735_change_desc_to_text_for_disciplines.js	13	2017-07-09 17:35:01.693-05
14	20170709234819_add_lore_and_class_type_to_classes.js	14	2017-07-09 23:52:38.89-05
15	20170718101159_add_lore_to_disciplines_add_class_abbreviation.js	15	2017-07-18 10:16:09.015-05
16	20170725175039_change_extra_disciplines_column.js	16	2017-07-25 17:53:58.152-05
17	20170725175532_add_attributes_to_disciplines.js	17	2017-07-25 18:00:09.192-05
18	20170725203723_discipline_types.js	18	2017-07-25 20:42:47.949-05
19	20170729000547_create_statistics_table.js	19	2017-07-29 00:08:34.322-05
\.


--
-- Name: knex_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: h3lix0
--

SELECT pg_catalog.setval('knex_migrations_id_seq', 19, true);


--
-- Data for Name: knex_migrations_lock; Type: TABLE DATA; Schema: public; Owner: h3lix0
--

COPY knex_migrations_lock (is_locked) FROM stdin;
0
\.


--
-- Data for Name: power_tags; Type: TABLE DATA; Schema: public; Owner: h3lix0
--

COPY power_tags (power_id, tag_id) FROM stdin;
\.


--
-- Data for Name: powers; Type: TABLE DATA; Schema: public; Owner: h3lix0
--

COPY powers (id, slug, data_type, description, icon, type, cast_type, resource_type, resource_cost, targeting, duration, max_targets, range, min_damage, max_damage, is_combo_child, created_at, updated_at, name, icon_svg, cooldown) FROM stdin;
4	adjudicate	power	Smash an enemy for 68-92 + 80% Weapon Damage.	/assets/images/powers/adjudicate.png	Melee Attack	Instant	Universal	10	Cone	0	1	5	\N	\N	f	2017-07-08 19:23:47.86-05	2017-07-08 19:23:47.86-05	Adjudicate	/assets/svgs/powers/adjudicate.svg	9
5	angel-of-death	power	Deal 30% more Damage to enemies below 30% Health.	/assets/images/powers/angel-of-death.png	Passive	Passive	Universal	0	Self	0	1	0	\N	\N	f	2017-07-08 19:23:47.86-05	2017-07-08 19:23:47.86-05	Angel of Death	/assets/svgs/powers/angel-of-death.svg	0
6	adjudicate-2	power	Judge an enemy inflicting 76-103 + 90% Holy Weapon Damage and cannot be imitgated normally.	/assets/images/powers/adjudicate-2.png	Melee Attack	Instant	Universal	10	Cone	0	1	5	\N	\N	t	2017-07-08 19:23:47.86-05	2017-07-08 19:23:47.86-05	Adjudicate 2	/assets/svgs/powers/adjudicate-2.svg	9
7	aurora-emitter	power	Strike enemies with lightning in an area for 79 - 119 damage. Enemies are left electrified and will inflict and additional 27 to 40 + #weapon_damage_2_value#% Weapon Damage over 15 seconds to nearby friendlies.	/assets/images/powers/aurora-emitter.png	Ranged Attack	Instant	Essence	77	Sphere	15	5	35	\N	\N	t	2017-07-08 19:23:47.86-05	2017-07-08 19:23:47.86-05	Aurora Emitter	/assets/svgs/powers/aurora-emitter.svg	24
8	aegis-of-salvation-2	power	Attack causing 76 - 103 + 89% Weapon Damage and applies a barrier to you.  When it is removed you recover 10% to 15% to your Health	/assets/images/powers/aegis-of-salvation-2.png	Buff	Instant	Universal	10	Cone	0	1	5	\N	\N	t	2017-07-08 19:23:47.86-05	2017-07-08 19:23:47.86-05	Aegis of Salvation 2	/assets/svgs/powers/aegis-of-salvation-2.svg	23
9	ambush	power	Leap out of your Burrow performing a deadly surpise attack for 82 - 123 + 102% Weapon Damage and generating two Pips. If AMBUSH hits an Exposed enemy while they attack or use an ability they are knocked down, take additional damage and you earn additional Pips.	/assets/images/powers/ambush.png	Crowd Control Self	Instant	Pip	0	Cone	0	1	5	\N	\N	f	2017-07-08 19:23:47.86-05	2017-07-08 19:23:47.86-05	Ambush	/assets/svgs/powers/ambush.svg	9
14	blood-strike-2	power	Slash enemies for 51 - 69 + 60% Weapon Damage.	/assets/images/powers/blood-strike-2.png	Melee Attack	Instant	Universal	12	Cone	0	5	5	\N	\N	t	2017-07-08 19:23:47.86-05	2017-07-08 19:23:47.86-05	Blood Strike 2	/assets/svgs/powers/blood-strike-2.svg	5
15	battle-cry	power	Removes all movement impairing effects. Increases group movement speed by 10%.	/assets/images/powers/battle-cry.png	Buff	Instant	N/A	12	Group	0	5	2	\N	\N	f	2017-07-08 19:23:47.86-05	2017-07-08 19:23:47.86-05	Battle Cry	/assets/svgs/powers/battle-cry.svg	45
16	bearers-insignia	power	Increase your Out of Combat Regeneration by 10.	/assets/images/powers/bearers-insignia.png	Passive	Passive	Universal	0	Self	0	1	0	\N	\N	f	2017-07-08 19:23:47.86-05	2017-07-08 19:23:47.86-05	Bearers Insignia	/assets/svgs/powers/bearers-insignia.svg	0
17	aura-of-terror	power	Surround yourself with a chilling aura of palpable fear that automatically reveals Stealthed enemies.  Enemies who remain nearby for too long are Suppressed and then afflicted with Frostbite.	/assets/images/powers/aura-of-terror.png	Debuff	Instant	Universal	16	Self	15	0	0	\N	\N	f	2017-07-08 19:23:47.86-05	2017-07-08 19:23:47.86-05	Aura of Terror	/assets/svgs/powers/aura-of-terror.svg	30
18	arcing-slash	power	Slash upward violently inflicting 41 - 50 + 46% Weapon Damage.	/assets/images/powers/arcing-slash.png	Melee Attack	Instant	Fury	16	Cone	0	5	5	\N	\N	f	2017-07-08 19:23:47.86-05	2017-07-08 19:23:47.86-05	Arcing Slash	/assets/svgs/powers/arcing-slash.svg	0
19	censure	power	Lunge forward with a sword strike stunning an enemy and causing 100 - 149 + 124% Weapon Damage.	/assets/images/powers/censure.png	Non-Aggressive	Instant	Pips	0	Self	0	1	0	\N	\N	f	2017-07-08 19:23:47.86-05	2017-07-08 19:23:47.86-05	Censure	/assets/svgs/powers/censure.svg	9
20	battle-chant	power	Summon spinning hammers lasting 12 seconds to damage nearby enemies for 85 - 115 + 100% Weapon Damage.	/assets/images/powers/battle-chant.png	Melee Attack	Instant	Universal	12	Self	12	0	5	\N	\N	f	2017-07-08 19:23:47.86-05	2017-07-08 19:23:47.86-05	Battle Chant	/assets/svgs/powers/battle-chant.svg	24
21	basic-block	power	Raise your shield Blocking attacks, reducing damage and preventing crowd control effects.	/assets/images/powers/basic-block.png	Buff	Instant	Universal	12	Self	0	0	0	\N	\N	f	2017-07-08 19:23:47.86-05	2017-07-08 19:23:47.86-05	Basic Block	/assets/svgs/powers/basic-block.svg	0
22	brutal-slam	power	Strike with your shield for 113 - 153 + 133% Weapon Damage and lower their Physical Armor by 20.	/assets/images/powers/brutal-slam.png	Debuff	Instant	Universal	16	Cone	0	5	5	\N	\N	f	2017-07-08 19:23:47.86-05	2017-07-08 19:23:47.86-05	Brutal Slam	/assets/svgs/powers/brutal-slam.svg	45
24	bloodied-swipe	power	Leap forward striking twice for 39 - 48 + 43% Weapon Damage.	/assets/images/powers/bloodied-swipe.png	Melee Attack	Instant	Fury	16	Cone	0	1	5	\N	\N	f	2017-07-08 19:23:47.86-05	2017-07-08 19:23:47.86-05	Bloodied Swipe	/assets/svgs/powers/bloodied-swipe.svg	0
27	chain-attack	power	Throw a chain forward, applying a large pulling force to any enemy causing 130 - 176 + 153% and dazing the target for 4 seconds.	/assets/images/powers/chain-attack.png	Crowd Control	Instant	Stamina	25	Reticle	0	1	30	\N	\N	f	2017-07-08 19:23:47.86-05	2017-07-08 19:23:47.86-05	Chain Attack	/assets/svgs/powers/chain-attack.svg	24
28	berserk	power	Overcome with bloodlust you continually recover all lost Health for 20 seconds. When the effect ends your suffer Berserk Crash and all recovered Health is lost again. The Scent of Blood reduces Health loss from Berserk Crash. Health loss is prevented altogether while Raging.	/assets/images/powers/berserk.png	Transformation	Instant	Fury	56	Self	20	1	30	\N	\N	f	2017-07-08 19:23:47.86-05	2017-07-08 19:23:47.86-05	Berserk	/assets/svgs/powers/berserk.svg	20
34	barrage	power	Shoot 6 volley of arrows at a ground location, dealing 30 - 40 + 35% Weapon Damage per volley, up to 5 targets within 8m.	/assets/images/powers/barrage.png	Ranged Attack	Ground Aimed	Energy	6	Area	0	5	35	\N	\N	f	2017-07-08 19:23:47.86-05	2017-07-08 19:23:47.86-05	Barrage	/assets/svgs/powers/barrage.svg	9
35	chain-heal	power	Heals a targeted ally for 158 - 193 + 175% Weapon Damage, then jumps to heal a nearby ally. Chain Heal will jump to as many as 2 with healing reduced by 30% each jump.	/assets/images/powers/chain-heal.png	Buff	Instant	Universal	22	Ray	0	2	35	\N	\N	f	2017-07-08 19:23:47.86-05	2017-07-08 19:23:47.86-05	Chain Heal	/assets/svgs/powers/chain-heal.svg	9
36	blast-of-leaves	power	Blasts Leaves to all allies in front of you healing for 102 - 138 + 120% Weapon Damage multiple times per second.	/assets/images/powers/blast-of-leaves.png	Buff	Instant	Universal	70	Rectangle	0	5	7	\N	\N	f	2017-07-08 19:23:47.86-05	2017-07-08 19:23:47.86-05	Blast of Leaves	/assets/svgs/powers/blast-of-leaves.svg	20
37	bloodstone-spin	power	A basic attack slashing spinning in front of you for 88 - 119 + 103% Weapon Damage and reducing movement speed by 50%. Scoring three or more consecutive basic attack hits activates SHIELD BASH.	/assets/images/powers/bloodstone-spin.png	Melee Attack	Instant	Stamina	0	Cone	0	1	5	\N	\N	t	2017-07-08 19:23:47.86-05	2017-07-08 19:23:47.86-05	Bloodstone Spin	/assets/svgs/powers/bloodstone-spin.svg	0
38	burning-hatred	power	Seethe with anger as your damaging attacks periodically create a Fae Wisp, consumable only by you, restoring 252 - 308 + 280% Weapon Damage.	/assets/images/powers/burning-hatred.png	Passive	Passive	Universal	0	Self	0	1	0	\N	\N	f	2017-07-08 19:23:47.861-05	2017-07-08 19:23:47.861-05	Burning Hatred	/assets/svgs/powers/burning-hatred.svg	0
39	blood-price	power	Extract Blood Orbs from your enemies as you attack.  Picking up Blood Orbs heals you for 113 - 153 + 133% Weapon Damage and increases your Attack Power by 150 for 15 seconds.	/assets/images/powers/blood-price.png	Passive	Passive	Universal	0	Self	15	0	0	\N	\N	f	2017-07-08 19:23:47.861-05	2017-07-08 19:23:47.861-05	Blood Price	/assets/svgs/powers/blood-price.svg	0
40	consonant-chains	power	Damages a targeted enemy for 227 - 307 + 267% Weapon Damage, then jumps to damage a nearby enemy. Consonant Chains will jump to as many as 5 additional targets with damage reduced by 30% each jump. Targets hit will sugger a Movement Speed reduction. Type 1 Song.	/assets/images/powers/consonant-chains.png	Debuff	Toggle	Universal	32	Ray	12	5	20	\N	\N	f	2017-07-08 19:23:47.861-05	2017-07-08 19:23:47.861-05	Consonant Chains	/assets/svgs/powers/consonant-chains.svg	6
41	block	power	Raise your shield Blocking attacks, reducing damage and preventing crowd control effects.  Enemies striking you with Elemental attacks take 100% Weapon Damage in return. Increases damage by 15% for 5 seconds for each 150 damage taken while Blocking.  Taking more that 150 damage while Blocking activates SHIELD BASH and increases damage by 15% for 5 second for each 150 damage taken while Blocking.	/assets/images/powers/block.png	Crowd Control Self	Hold Channeled	Stamina	0	Self	5	1	5	\N	\N	f	2017-07-08 19:23:47.861-05	2017-07-08 19:23:47.861-05	Block	/assets/svgs/powers/block.svg	0
42	blood-strike-3	power	Attack multiple enemies for 58 - 78 + 68% Weapon Damage and causing them to Bleed for 50 - 75 + 6% Weapon Damage per tick.	/assets/images/powers/blood-strike-3.png	Debuff	Instant	Universal	12	Cone	0	5	5	\N	\N	t	2017-07-08 19:23:47.861-05	2017-07-08 19:23:47.861-05	Blood Strike 3	/assets/svgs/powers/blood-strike-3.svg	24
47	call-darkness	power	Coming Soon	/assets/images/powers/call-darkness.png	Ranged Attack		Universal	0		0	0	0	\N	\N	f	2017-07-08 19:23:47.861-05	2017-07-08 19:23:47.861-05	Call Darkness	/assets/svgs/powers/call-darkness.svg	0
48	contain-essence	power	Raise your Life affinity reducing your Essence Gain by 35% for 45 seconds.	/assets/images/powers/contain-essence.png	Buff	Instant	Essence	26	Self	45	1	0	\N	\N	t	2017-07-08 19:23:47.861-05	2017-07-08 19:23:47.861-05	Contain Essence	/assets/svgs/powers/contain-essence.svg	5
49	blood-strike	power	Slash enemies for 45 - 60 + 53% Weapon Damage.	/assets/images/powers/blood-strike.png	Melee Attack	Instant	Universal	12	Cone	0	5	5	\N	\N	f	2017-07-08 19:23:47.861-05	2017-07-08 19:23:47.861-05	Blood Strike	/assets/svgs/powers/blood-strike.svg	9
50	brilliance	power	Shine with golden light briefly becoming invulnerable, increasing your maximum Health for 20 seconds as well as blinding and damaging nearby enemies for 107 - 160 + 133% Fire Weapon Damage.	/assets/images/powers/brilliance.png	Ultimate	Instant	Pips	0	Sphere	0	5	0	\N	\N	f	2017-07-08 19:23:47.861-05	2017-07-08 19:23:47.861-05	Brilliance	/assets/svgs/powers/brilliance.svg	5
54	charge	power	Charge toward your target inflicting 72 - 88 + 80% Weapon Damage.	/assets/images/powers/charge.png	Melee Attack	Instant	Fury	13	Reticle	0	1	30	\N	\N	t	2017-07-08 19:23:47.868-05	2017-07-08 19:23:47.868-05	Charge	/assets/svgs/powers/charge.svg	0
55	call-storm	power	Call lightning to strike a target stunning them and causing 60 - 90 + 75% Electric Weapon Damage.  Afterward they suffer Severe Electrocution taking 17 - 25 + 2% Electric Weapon Damage per tick.	/assets/images/powers/call-storm.png	Debuff	Instant	Universal	12	Ray	0	5	35	\N	\N	f	2017-07-08 19:23:47.869-05	2017-07-08 19:23:47.869-05	Call Storm	/assets/svgs/powers/call-storm.svg	30
56	critical-slice	power	Slice an enemy for 77 - 105 + 91% Weapon Damage.	/assets/images/powers/critical-slice.png	Melee Attack	Instant	Universal	11	Cone	0	1	5	\N	\N	f	2017-07-08 19:23:47.869-05	2017-07-08 19:23:47.869-05	Critical Slice	/assets/svgs/powers/critical-slice.svg	9
57	bull-rush	power	Charge forward dragging enemies along with you and causing 82 - 100 + 91% Weapon Damage. Enemies are flung into the air if the attack is over 65% charged.	/assets/images/powers/bull-rush.png	Crowd Control	Hold Channeled	Fury	33	Rectangle	0	3	7	\N	\N	f	2017-07-08 19:23:47.869-05	2017-07-08 19:23:47.869-05	Bull Rush	/assets/svgs/powers/bull-rush.svg	9
58	cauterize	power	Remove Bleeding effects.	/assets/images/powers/cauterize.png	Buff	Instant	Universal	10	Self	0	0	0	\N	\N	f	2017-07-08 19:23:47.869-05	2017-07-08 19:23:47.869-05	Cauterize	/assets/svgs/powers/cauterize.svg	9
59	critical-slice-2	power	Gain the advantage over an enemy increasing your Critical Hit Damage and causing 94 - 127 + 111% Weapon Damage.	/assets/images/powers/critical-slice-2.png	Buff	Instant	Universal	12	Cone	15	1	5	\N	\N	t	2017-07-08 19:23:47.869-05	2017-07-08 19:23:47.869-05	Critical Slice 2	/assets/svgs/powers/critical-slice-2.svg	23
60	crazy-pills	power	Increases Attack Power the lower your resource is.	/assets/images/powers/crazy-pills.png	Passive	Passive	Universal	0	Self	0	1	0	\N	\N	f	2017-07-08 19:23:47.869-05	2017-07-08 19:23:47.869-05	Crazy Pills	/assets/svgs/powers/crazy-pills.svg	0
61	condemnation	power	Condemns all targets in front of you dealing 14 -21 + 17% Weapon Damage multiple times per second. If the targets are under the effect of Sin they take increased damage per stack of Sin to a maximum of 18 - 23 + 23% Weapon Damage.	/assets/images/powers/condemnation.png	Melee Attack	Hold Channeled	Mana	20	Rectangle	0	5	7	\N	\N	f	2017-07-08 19:23:47.869-05	2017-07-08 19:23:47.869-05	Condemnation	/assets/svgs/powers/condemnation.svg	9
62	clobber	power	Smash an enemy for 68 - 92 + 80% Weapon Damage.	/assets/images/powers/clobber.png	Melee Attack	Instant	Universal	10	Cone	0	1	5	\N	\N	f	2017-07-08 19:23:47.869-05	2017-07-08 19:23:47.869-05	Clobber	/assets/svgs/powers/clobber.svg	9
63	caltrops	power	Harass enemies for 15 seconds covering the targeted area with dangerous caltrops, reducing Piercing Armor and Slowing them while maintaining Stealth.	/assets/images/powers/caltrops.png	Crowd Control	Ground Aimed	Universal	13	Area	15	5	35	\N	\N	f	2017-07-08 19:23:47.869-05	2017-07-08 19:23:47.869-05	Caltrops	/assets/svgs/powers/caltrops.svg	24
64	disarming-shout	power	Suppress enemies, disabling their powers for 6 seconds. Deals 140 - 190 + 165% Weapon Damage.	/assets/images/powers/disarming-shout.png	Crowd Control	Instant	Rage	14	Cone	0	1	5	\N	\N	t	2017-07-08 19:23:47.869-05	2017-07-08 19:23:47.869-05	Disarming Shout	/assets/svgs/powers/disarming-shout.svg	30
65	clobber-2	power	Bash an enemy Dazing them and inflicting 76 - 103 + 90% Weapon Damage.	/assets/images/powers/clobber-2.png	Crowd Control	Instant	Universal	10	Cone	0	1	5	\N	\N	t	2017-07-08 19:23:47.869-05	2017-07-08 19:23:47.869-05	Clobber 2	/assets/svgs/powers/clobber-2.svg	24
66	cross-slash-2	power	Slash in front of you for 86 - 117 + 101% Weapon Damage. Applies a Moderate Bleed effect.	/assets/images/powers/cross-slash-2.png	Debuff	Instant	Energy	34	Cone	0	1	5	\N	\N	t	2017-07-08 19:23:47.869-05	2017-07-08 19:23:47.869-05	Cross Slash 2	/assets/svgs/powers/cross-slash-2.svg	0
74	dagger-spin-2	power	Spin in place and deal 46 - 62 + 54% Weapon Damage around you. Also increases your Lifesteal Bonus by 60% while executing this power.	/assets/images/powers/dagger-spin-2.png	Melee Attack	Instant	Energy	34	Sphere	0	5	6	\N	\N	t	2017-07-08 19:23:47.869-05	2017-07-08 19:23:47.869-05	Dagger Spin 2	/assets/svgs/powers/dagger-spin-2.svg	5
75	essence-scram	power	Become invulnerable while you channel. While in the Life tray you lose 5% Essence and inflict 40 to 60 every 0.25 seconds.  While in the Death tray heal 1500 Health every .025 seconds while pushing enemies away every 1 second, and if you successfully channel the max duration gain the Power of Death which grants 30% Bonuse Damage for 30 seconds.	/assets/images/powers/essence-scram.png	Ultimate	Channeled	Essence	26	Self	7	1	5	\N	\N	f	2017-07-08 19:23:47.869-05	2017-07-08 19:23:47.869-05	Essence Scram	/assets/svgs/powers/essence-scram.svg	180
76	cut-and-thrust	power	Stab an enemy twice for 70 - 95 + 82% Weapon Damage.	/assets/images/powers/cut-and-thrust.png	Melee Attack	Instant	Universal	10	Cone	0	1	5	\N	\N	f	2017-07-08 19:23:47.869-05	2017-07-08 19:23:47.869-05	Cut and Thrust	/assets/svgs/powers/cut-and-thrust.svg	5
77	decay	power	Infect an enemy with a Disease and reduce Healing Received.  If Decay hits an Exposed enemy while they attack or use an ability, they are knocked down and take additional damage.	/assets/images/powers/decay.png	Debuff	Charged	Universal	13	Ray	0	1	30	\N	\N	f	2017-07-08 19:23:47.869-05	2017-07-08 19:23:47.869-05	Decay	/assets/svgs/powers/decay.svg	45
78	coalesce-nature	power	Manifest an Orb at your targeted location that allies or you may use to heal 216 to 264 + 240% Weapon Damage as well as restoring resources for allies.	/assets/images/powers/coalesce-nature.png	Non-Aggressive	Instant	Essence	0	Area	0	1	0	\N	\N	t	2017-07-08 19:23:47.869-05	2017-07-08 19:23:47.869-05	Coalesce Nature	/assets/svgs/powers/coalesce-nature.svg	0
79	castigate	power	Slash multiple enemies for 61 - 92 + 76% Weapon Damage.	/assets/images/powers/castigate.png	Melee Attack	Instant	Pips	0	Cone	0	5	5	\N	\N	t	2017-07-08 19:23:47.869-05	2017-07-08 19:23:47.869-05	Castigate	/assets/svgs/powers/castigate.svg	0
80	dodge-cleric	power	Charge in the current WASD direction dealing for 41 - 50 Damage + 46% Weapon Damage.	/assets/images/powers/dodge-cleric.png	Non-Aggressive	Instant	N/A	0	Rectangle	0	5	6	\N	\N	f	2017-07-08 19:23:47.869-05	2017-07-08 19:23:47.869-05	Dodge (Cleric)	/assets/svgs/powers/dodge-cleric.svg	0
81	deadly-retaliation	power	Jump to your feet dealing 113-153 + 133% Weapon Damage to nearby enemies. This attack is a guaranteed Critical Hit.	/assets/images/powers/deadly-retaliation.png	Debuff	Instant	Universal	16	Cone	0	5	5	\N	\N	f	2017-07-08 19:23:47.869-05	2017-07-08 19:23:47.869-05	Deadly Retaliation	/assets/svgs/powers/deadly-retaliation.svg	0
82	discipling-strikes	power	Strike in front of you for 126 - 154 + 150% Weapon Damage, snaring the enemy if you hit.	/assets/images/powers/discipling-strikes.png	Melee Attack	Instant	N/A	0	Cone	0	1	5	\N	\N	f	2017-07-08 19:23:47.869-05	2017-07-08 19:23:47.869-05	Discipling Strikes	/assets/svgs/powers/discipling-strikes.svg	0
84	cut-and-thrust-2	power	Penetrate an enemy's Block or Parry Stunning them and inflicting 70 - 95 + 83% Weapon Damage.	/assets/images/powers/cut-and-thrust-2.png	Debuff	Instant	Universal	10	Cone	0	1	5	\N	\N	t	2017-07-08 19:23:47.869-05	2017-07-08 19:23:47.869-05	Cut and Thrust 2	/assets/svgs/powers/cut-and-thrust-2.svg	9
85	eternal-rage	power	Instantly generates 35 Rage while allies recover their native resource over time. Allies and you also heal for 158 - 193 + 175% Weapon Damage 2 times over 5 seconds.	/assets/images/powers/eternal-rage.png	Buff	Instant	N/A	29	Group	5	5	2	\N	\N	f	2017-07-08 19:23:47.869-05	2017-07-08 19:23:47.869-05	Eternal Rage	/assets/svgs/powers/eternal-rage.svg	23
86	colossus-smash	power	Leap into the air and strike with both axes stunning nearby enemies and causing 165 - 201 + 183% Weapon Damage.	/assets/images/powers/colossus-smash.png	Crowd Control	Instant	Fury	31	Cone	0	1	6	\N	\N	t	2017-07-08 19:23:47.869-05	2017-07-08 19:23:47.869-05	Colossus Smash	/assets/svgs/powers/colossus-smash.svg	9
87	crippling-stab-2	power	Traumatize an enemy increasing their cooldown times and causing 49 - 67 + 58% Weapon Damage.	/assets/images/powers/crippling-stab-2.png	Buff	Instant	Universal	6	Cone	15	1	5	\N	\N	t	2017-07-08 19:23:47.869-05	2017-07-08 19:23:47.869-05	Crippling Stab 2	/assets/svgs/powers/crippling-stab-2.svg	30
88	dodge-roll	power	Roll quickly in the current WASD direction.	/assets/images/powers/dodge-roll.png	Non-Aggressive	Instant	Rage	0	Self	0	1	0	\N	\N	f	2017-07-08 19:23:47.869-05	2017-07-08 19:23:47.869-05	Dodge Roll	/assets/svgs/powers/dodge-roll.svg	0
89	dodge-duelist	power	Leap away from danger using your WASD direction.	/assets/images/powers/dodge-duelist.png	Non-Aggressive	Instant	Pip	0	Self	0	1	5	\N	\N	f	2017-07-08 19:23:47.869-05	2017-07-08 19:23:47.869-05	Dodge (Duelist)	/assets/svgs/powers/dodge-duelist.svg	0
94	conduction	power	Increase your Attack Power for 30 seconds when damaged by Fire.	/assets/images/powers/conduction.png	Passive	Passive	Universal	0	Self	0	1	0	\N	\N	f	2017-07-08 19:23:47.869-05	2017-07-08 19:23:47.869-05	Conduction	/assets/svgs/powers/conduction.svg	0
95	dagger-spin-4	power	Spin in place and deal 57 - 77 + 67% Weapon Damage around you. Also increases your Lifesteal Bonus by 60% while executing this power.	/assets/images/powers/dagger-spin-4.png	Melee Attack	Instant	Energy	34	Sphere	0	5	6	\N	\N	t	2017-07-08 19:23:47.869-05	2017-07-08 19:23:47.869-05	Dagger Spin 4	/assets/svgs/powers/dagger-spin-4.svg	5
96	flames-of-truth	power	Applies Flames of Truth to your reticle target, damaging them for 17 - 26. After 10 seconds Flames of Truth explodes dealing 93 - 140 + 117% Weapon Damage as Fire Damage in a 4m radius.	/assets/images/powers/flames-of-truth.png	Ranged Attack	Instant	Mana	70	Sphere	0	1	40	\N	\N	f	2017-07-08 19:23:47.869-05	2017-07-08 19:23:47.869-05	Flames of Truth	/assets/svgs/powers/flames-of-truth.svg	9
97	explosive-trap	power	Place an explosive trap at your feet which explodes when an enemy approaches it dealing 57 - 77 + 67% Weapon Damage as Fire Damage. Knocks Up all hit. Trap will exist for 60 seconds.	/assets/images/powers/explosive-trap.png	Melee Attack	Instant	Energy	47	Area	0	5	0	\N	\N	f	2017-07-08 19:23:47.869-05	2017-07-08 19:23:47.869-05	Explosive Trap	/assets/svgs/powers/explosive-trap.svg	24
98	flintlock-shot	power	Shoot for 107 - 160 + 134% Weapon Damage and generating two Pips. If FLINTLOCK SHOT hits and Exposed enemy while they attack or use an ability they are knocked down, and take additional damage and you generate an additional Pip.	/assets/images/powers/flintlock-shot.png	Ranged Attack	Instant	Pip	0	Cone	0	1	15	\N	\N	f	2017-07-08 19:23:47.869-05	2017-07-08 19:23:47.869-05	Flintlock Shot	/assets/svgs/powers/flintlock-shot.svg	9
99	fireball-2	power	Shoots a fireball towards your reticle that explodes for 48 - 72 + 60% Weapon Damage as Fire Damage. Applies Sin to anyone damaged.	/assets/images/powers/fireball-2.png	Ranged Attack	Instant	Mana	0	Reticle	0	1	25	\N	\N	t	2017-07-08 19:23:47.869-05	2017-07-08 19:23:47.869-05	Fireball 2	/assets/svgs/powers/fireball-2.svg	0
101	executioner	power	Increase the damage of Execution abilities.	/assets/images/powers/executioner.png	Passive	Passive	Universal	0	Self	0	1	0	\N	\N	f	2017-07-08 19:23:47.87-05	2017-07-08 19:23:47.87-05	Executioner	/assets/svgs/powers/executioner.svg	0
104	fortification	power	Aid group members and yourself increasing Health by 1000.	/assets/images/powers/fortification.png	Buff	Instant	Universal	12	Group	30	5	0	\N	\N	f	2017-07-08 19:23:47.87-05	2017-07-08 19:23:47.87-05	Fortification	/assets/svgs/powers/fortification.svg	45
105	fire-eater	power	Absorb heat from incoming Fire damage attacks to heal for 125% of Fire damage inflicted.	/assets/images/powers/fire-eater.png	Buff	Instant	Universal	15	Self	0	1	0	\N	\N	f	2017-07-08 19:23:47.87-05	2017-07-08 19:23:47.87-05	Fire Eater	/assets/svgs/powers/fire-eater.svg	45
106	forest-whispers	power	While in Life Power Tray, when your Health drops below 20% gain 90% Slashing, Crushing and Piercing mitigation for 20 seconds. While in Death Tray, each Druid Power executed has a chance to make your next Druid Power cost zero essence.	/assets/images/powers/forest-whispers.png	Passive	Passive	Essence	26	Self	20	1	5	\N	\N	f	2017-07-08 19:23:47.87-05	2017-07-08 19:23:47.87-05	Forest Whispers	/assets/svgs/powers/forest-whispers.svg	0
107	furious-retaliate	power	Recover immediately from Knockdown and Stun effects inflicting 113 - 153 + 133% Weapon Damage. Furious Retaliate also increases your Resolve, reducing the duration of subsequent Control Effects or triggering temporary immunity to Control Effects.	/assets/images/powers/furious-retaliate.png	Debuff	Instant	Universal	16	Sphere	0	5	5	\N	\N	f	2017-07-08 19:23:47.87-05	2017-07-08 19:23:47.87-05	Furious Retaliate	/assets/svgs/powers/furious-retaliate.svg	15
108	dirge-of-dissonance	power	Sing for 12 seconds, affecting up to 5 enemies within 10m. Deals 100 - 150 + 12% Weapon Damage every 3 seconds. Type 3 Song.	/assets/images/powers/dirge-of-dissonance.png	Melee Attack	Toggle	Universal	32	Point Blank Area	12	5	10	\N	\N	f	2017-07-08 19:23:47.87-05	2017-07-08 19:23:47.87-05	Dirge of Dissonance	/assets/svgs/powers/dirge-of-dissonance.svg	1
109	explosive-thorns	power	Stretch the effectiveness of Thorns with a chance to cause additional damage to up to five nearby ennemies whenever you are damaged while a Thorns effect is active.	/assets/images/powers/explosive-thorns.png	Passive	Passive	Universal	0	Self	0	1	0	\N	\N	f	2017-07-08 19:23:47.87-05	2017-07-08 19:23:47.87-05	Explosive Thorns	/assets/svgs/powers/explosive-thorns.svg	0
110	dagger-spin-3	power	Spin in place and deal 52 - 70 + 61% Weapon Damage around you. Also increases your Lifesteal Bonus by 60% while executing this power.	/assets/images/powers/dagger-spin-3.png	Melee Attack	Instant	Energy	34	Sphere	0	5	6	\N	\N	t	2017-07-08 19:23:47.87-05	2017-07-08 19:23:47.87-05	Dagger Spin 3	/assets/svgs/powers/dagger-spin-3.svg	5
114	gaeas-wail	power	Unleash a bear spirit at the enemy causing 168 - 252 + 210% and an addtional 133 - 200 over 12 seconds The attack may chain to two additional enemies.	/assets/images/powers/gaeas-wail.png	Ranged Attack	Charged	Essence	105	Reticle	12	3	0	\N	\N	f	2017-07-08 19:23:47.87-05	2017-07-08 19:23:47.87-05	Gaea's Wail	/assets/svgs/powers/gaeas-wail.svg	45
115	giant-smash	power	Strike in front of you for 102 - 138 + 120% Weapon Damage, generating 4 Rage if you hit.	/assets/images/powers/giant-smash.png	Melee Attack	Instant	Rage	0	Cone	0	1	5	\N	\N	t	2017-07-08 19:23:47.87-05	2017-07-08 19:23:47.87-05	Giant Smash	/assets/svgs/powers/giant-smash.svg	0
116	dissipate	power	Ride the wind and Blink 18m away.	/assets/images/powers/dissipate.png	Non-Aggressive	Instant	Essence	0	Self	0	1	0	\N	\N	f	2017-07-08 19:23:47.87-05	2017-07-08 19:23:47.87-05	Dissipate	/assets/svgs/powers/dissipate.svg	0
117	festering-wounds	power	Plague an enemy with Disease and for 30 seconds any Heal ability they use leaves them in an Exposed state.	/assets/images/powers/festering-wounds.png	Debuff	Charged	Universal	13	Ray	0	1	30	\N	\N	f	2017-07-08 19:23:47.87-05	2017-07-08 19:23:47.87-05	Festering Wounds	/assets/svgs/powers/festering-wounds.svg	45
118	demolish-armor	power	Demolish an enemy's Physical armor causing 120 - 163 + 142% Weapon Damage.	/assets/images/powers/demolish-armor.png	Debuff	Instant	Universal	17	Cone	15	1	0	\N	\N	f	2017-07-08 19:23:47.87-05	2017-07-08 19:23:47.87-05	Demolish Armor	/assets/svgs/powers/demolish-armor.svg	23
119	dodge-myrmidon	power	Leap away causing 71 - 87 + 79% Weapon Damage to nearby enemies where you land.	/assets/images/powers/dodge-myrmidon.png	Non-Aggressive	Instant	Fury	0	Sphere	0	5	4	\N	\N	f	2017-07-08 19:23:47.871-05	2017-07-08 19:23:47.871-05	Dodge (Myrmidon)	/assets/svgs/powers/dodge-myrmidon.svg	0
123	great-swing-2	power	Attack for 58 - 87 + 73% Weapon Damage.	/assets/images/powers/great-swing-2.png	Melee Attack	Instant	Pips	0	Cone	0	1	5	\N	\N	t	2017-07-08 19:23:47.871-05	2017-07-08 19:23:47.871-05	Great Swing 2	/assets/svgs/powers/great-swing-2.svg	0
124	divine-light	power	Declare hallowed ground draining your of Righteousness to purify the area while also earning Righteousness for each enemy standing within the field every four seconds. Enemies within the field periodically suffer 168 - 252 + 210% Fire Weapon Damage.  Allies and your are healed for 168 - 252 + 210% Weapon Damage while you have Righteousness remaining.	/assets/images/powers/divine-light.png	Debuff	Instant	Pips	1	Area	12	5	0	\N	\N	f	2017-07-08 19:23:47.871-05	2017-07-08 19:23:47.871-05	Divine Light	/assets/svgs/powers/divine-light.svg	23
125	firewall	power	Summon a raging inferno to slow and damage any enemies for 30 - 40 + 35% Fire Weapon Damage.	/assets/images/powers/firewall.png	Debuff	Instant	Universal	16	Rectangle	0	5	10	\N	\N	f	2017-07-08 19:23:47.871-05	2017-07-08 19:23:47.871-05	Firewall	/assets/svgs/powers/firewall.svg	9
126	dig-in	power	When dropping below 25% Health you become immune to being Critically Hit.	/assets/images/powers/dig-in.png	Passive	Passive	Universal	0	Self	0	1	0	\N	\N	f	2017-07-08 19:23:47.871-05	2017-07-08 19:23:47.871-05	Dig In	/assets/svgs/powers/dig-in.svg	0
127	empower	power	Embrace Death increasing your Essence Gain by 35% for 45 seconds.	/assets/images/powers/empower.png	Buff	Instant	Essence	35	Self	45	1	0	\N	\N	t	2017-07-08 19:23:47.871-05	2017-07-08 19:23:47.871-05	Empower	/assets/svgs/powers/empower.svg	5
128	get-em	power	Stop an enemy in its tracks causing 85 - 115 + 100% Weapon Damage and Rooting them. If Get 'Em hits an Exposed enemy while they attack or use an ability, they are knocked down and take additional damage.	/assets/images/powers/get-em.png	Debuff	Instant	Universal	12	Cone	0	1	35	\N	\N	f	2017-07-08 19:23:47.871-05	2017-07-08 19:23:47.871-05	Get Em	/assets/svgs/powers/get-em.svg	24
129	frighten	power	Shout at an enemy inflicting 91 - 123 + 107% Weapon Damage and reducing their damage bonus.	/assets/images/powers/frighten.png	Debuff	Instant	Universal	13	Cone	0	1	5	\N	\N	f	2017-07-08 19:23:47.871-05	2017-07-08 19:23:47.871-05	Frighten	/assets/svgs/powers/frighten.svg	23
130	glass-cannon	power	Increase your Damage Bonus while increasing the damage you take.	/assets/images/powers/glass-cannon.png	Passive	Passive	Universal	0	Self	0	1	0	\N	\N	f	2017-07-08 19:23:47.871-05	2017-07-08 19:23:47.871-05	Glass Cannon	/assets/svgs/powers/glass-cannon.svg	0
131	hamstring	power	Your last basic attack will cripple an enemy, applying a Movement Debuff.	/assets/images/powers/hamstring.png	Passive	Passive	Universal	0	Self	0	0	0	\N	\N	f	2017-07-08 19:23:47.872-05	2017-07-08 19:23:47.872-05	Hamstring	/assets/svgs/powers/hamstring.svg	0
132	double-slash	power	Attack with both weapon simultaneously for 13 - 16 damage, causing your target to Bleed for 18 - 24 + #weapon_damage_2_values#% Weapon Damage.	/assets/images/powers/double-slash.png	Debuff	Instant	Fury	20	Cone	0	1	5	\N	\N	t	2017-07-08 19:23:47.872-05	2017-07-08 19:23:47.872-05	Double Slash	/assets/svgs/powers/double-slash.svg	0
243	prickly-skin	power	Increase your Bonus Thorns 10.	/assets/images/powers/prickly-skin.png	Passive	Passive	Universal	0	Self	0	0	0	\N	\N	f	2017-07-08 19:23:47.877-05	2017-07-08 19:23:47.877-05	Prickly Skin	/assets/svgs/powers/prickly-skin.svg	0
136	impale	power	A devastating stab to the vitals inflicting instant damage and causing your target to bleed for #N/A - #N/A + #N/A% Weapon Damage until the target is either fully healed or they drop below a certain health threshold. Effects scale with Pips spend. 1 Pip: 125 - 188 and Bleed until under 90% Health. 2 Pips: 250 - 376 and Bleed until under 80% Health. 3 Pips: 375 - 564 and Bleed until under 70% Health. 4 Pips: 500 - 762 and Bleed until under 60% Health. 5 Pips: 625 - 940 and Bleed until under 50% Health.	/assets/images/powers/impale.png	Debuff	Instant	Pip	1	Cone	0	1	5	\N	\N	f	2017-07-08 19:23:47.872-05	2017-07-08 19:23:47.872-05	Impale	/assets/svgs/powers/impale.svg	9
137	grabthars-hammer	power	Smite an enemy for 91 - 124 + 108% Weapon Damage.	/assets/images/powers/grabthars-hammer.png	Melee Attack	Instant	Universal	11	Cone	0	1	5	\N	\N	f	2017-07-08 19:23:47.873-05	2017-07-08 19:23:47.873-05	Grabthars Hammer	/assets/svgs/powers/grabthars-hammer.svg	9
143	free-action	power	Liberate group members and yourself gaining immunity to Movement Crowd Control effects for 5 seconds.	/assets/images/powers/free-action.png	Buff	Instant	Universal	16	Group	5	5	0	\N	\N	f	2017-07-08 19:23:47.873-05	2017-07-08 19:23:47.873-05	Free Action	/assets/svgs/powers/free-action.svg	45
144	marshy-body	power	Cover yourself with a boggy enchantment that increase your Crushing Armor by 0.2 for each point of Stamina.	/assets/images/powers/marshy-body.png	Passive	Passive	Universal	0	Self	0	0	0	\N	\N	f	2017-07-08 19:23:47.873-05	2017-07-08 19:23:47.873-05	Marshy Body	/assets/svgs/powers/marshy-body.svg	0
145	hellfire-aura	power	Consumes your Hellfire Shield and surrounds you in a pulsing Hellfire Aura which damages all players within 4m of you every second for 15 - 18 Weapon Damage.	/assets/images/powers/hellfire-aura.png	Buff	Instant	Mana	80	Sphere	10	5	3	\N	\N	t	2017-07-08 19:23:47.873-05	2017-07-08 19:23:47.873-05	Hellfire Aura	/assets/svgs/powers/hellfire-aura.svg	24
146	haunt	power	Haunt 3 enemies, reflecting 35% of their attack damage as Nature damage (max 1050) and healing you for 35% of damage taken.	/assets/images/powers/haunt.png	Debuff	Instant	Universal	14	Cone	20	3	5	\N	\N	f	2017-07-08 19:23:47.873-05	2017-07-08 19:23:47.873-05	Haunt	/assets/svgs/powers/haunt.svg	23
147	laceration	power	Slash in front of you for 93 - 126 + 110% Weapon Damage. Applies a Weapon Break which reduces all damage by 20% for 15 seconds.	/assets/images/powers/laceration.png	Debuff	Instant	Energy	34	Cone	0	1	5	\N	\N	t	2017-07-08 19:23:47.873-05	2017-07-08 19:23:47.873-05	Laceration	/assets/svgs/powers/laceration.svg	23
148	escapology	power	Formulate your escape plan increasing your Resolve by 33% reducting Crowd Control durations and making it more likely that Crowd Control immunity triggers after being the victim of multiple Control effects.	/assets/images/powers/escapology.png	Passive	Passive	Universal	0	Self	0	1	0	\N	\N	f	2017-07-08 19:23:47.873-05	2017-07-08 19:23:47.873-05	Escapology	/assets/svgs/powers/escapology.svg	0
149	form-up	power	Coming Soon	/assets/images/powers/form-up.png	Buff		Universal	16		0	0	5	\N	\N	f	2017-07-08 19:23:47.873-05	2017-07-08 19:23:47.873-05	Form Up	/assets/svgs/powers/form-up.svg	30
150	fire-tornados	power	Consumes your Hellfire Aura and launches 2 Hellfire Tornados forward which pull nearby object into them and damages them for 105 - 157 + 131% Weapon Damage as Fire Damage. Each tornado last 15 seconds.	/assets/images/powers/fire-tornados.png	Ranged Attack	Instant	Mana	120	Sphere	0	5	3	\N	\N	t	2017-07-08 19:23:47.873-05	2017-07-08 19:23:47.873-05	Fire Tornados	/assets/svgs/powers/fire-tornados.svg	30
151	grasping-roots	power	Command nature to envelope enemies in the targeted area rooting them in place and inflicting 50 - 75 + 63% Nature Weapon Damage.	/assets/images/powers/grasping-roots.png	Debuff	Ground Aimed	Universal	16	Area	0	5	7	\N	\N	f	2017-07-08 19:23:47.873-05	2017-07-08 19:23:47.873-05	Grasping Roots	/assets/svgs/powers/grasping-roots.svg	24
152	mighty-shield-slam	power	Deliver a shield attack using all your might to consume all Stamina and scale damage with stamina spent.  MIGHTY SHIELD SLAM inflicts 32 Damage Bonus per Stamina spent + 97% Crushing Weapon Damage to multiple enemies, pushing them back.  While charging the attack you are considered Blocking.  The attack is guaranteed to crit when more than 2/3rds charged.	/assets/images/powers/mighty-shield-slam.png	Debuff	Charged	Universal	22	Cone	0	3	7	\N	\N	f	2017-07-08 19:23:47.873-05	2017-07-08 19:23:47.873-05	Mighty Shield Slam	/assets/svgs/powers/mighty-shield-slam.svg	24
156	faerie-fire	power	Engulf an enemy in Faerie Fire reducing Slashing, Piercing and Crushing armor and causing 44 - 67 Nature damage + 6% Weapon Damage over 12 seconds.	/assets/images/powers/faerie-fire.png	Debuff	Instant	Essence	50	Reticle	12	1	35	\N	\N	f	2017-07-08 19:23:47.873-05	2017-07-08 19:23:47.873-05	Faerie Fire	/assets/svgs/powers/faerie-fire.svg	45
157	furious-slash	power	Hack at an enemy for 110 - 149 + 129% Weapon Damage.	/assets/images/powers/furious-slash.png	Melee Attack	Instant	Universal	16	Cone	0	1	0	\N	\N	f	2017-07-08 19:23:47.873-05	2017-07-08 19:23:47.873-05	Furious Slash	/assets/svgs/powers/furious-slash.svg	9
158	fireball	power	Shoots a fireball towards your reticle that explodes for 37 - 55 + 46% Weapon Damage as Fire Damage. Applies Sin to anyone damaged.	/assets/images/powers/fireball.png	Ranged Attack	Instant	Mana	0	Reticle	0	1	25	\N	\N	f	2017-07-08 19:23:47.873-05	2017-07-08 19:23:47.873-05	Fireball	/assets/svgs/powers/fireball.svg	0
163	left-slash	power	Attack with your left weapon for 8 - 9 + 9% Weapon Damage.	/assets/images/powers/left-slash.png	Melee Attack	Instant	Fury	19	Cone	0	1	5	\N	\N	t	2017-07-08 19:23:47.873-05	2017-07-08 19:23:47.873-05	Left Slash	/assets/svgs/powers/left-slash.svg	0
164	form-life-2	power	Manifest an Orb at your targeted location that allies or you may use to heal 97 to 119 + 108% Weapon Damage.	/assets/images/powers/form-life-2.png	Non-Aggressive	Instant	Universal	0	Area	0	1	35	\N	\N	t	2017-07-08 19:23:47.873-05	2017-07-08 19:23:47.873-05	Form Life 2	/assets/svgs/powers/form-life-2.svg	0
165	glamour-weapon	power	Add a Glamour to your weapon increasing Maximum Weapon Damage by 50 for 30 seconds.	/assets/images/powers/glamour-weapon.png	Buff	Instant	Universal	16	Self	180	1	0	\N	\N	f	2017-07-08 19:23:47.873-05	2017-07-08 19:23:47.873-05	Glamour Weapon	/assets/svgs/powers/glamour-weapon.svg	23
166	flare	power	Deploy a flare revealing any Stealth users entering the area. Stealth users revealed in this way are Exposed, take 170 - 230 + 200% Fire Weapon Damage and begin Burning.	/assets/images/powers/flare.png	Debuff	Instant	Universal	16	Cone	0	5	50	\N	\N	f	2017-07-08 19:23:47.873-05	2017-07-08 19:23:47.873-05	Flare	/assets/svgs/powers/flare.svg	23
167	guardian-rhythms	power	Reduces the groups Damage Taken by 15% for 12 seconds. Type 2 Song.	/assets/images/powers/guardian-rhythms.png	Buff	Toggle	Universal	0	Group	12	5	0	\N	\N	f	2017-07-08 19:23:47.873-05	2017-07-08 19:23:47.873-05	Guardian Rhythms	/assets/svgs/powers/guardian-rhythms.svg	1
168	natures-grace	power	Increase Healing by 10% for 45 seconds.	/assets/images/powers/natures-grace.png	Buff	Instant	Essence	22	Self	45	5	0	\N	\N	f	2017-07-08 19:23:47.873-05	2017-07-08 19:23:47.873-05	Nature's Grace	/assets/svgs/powers/natures-grace.svg	68
169	last-resort	power	Put it all on the line increasing your critical hit chance by 50% when your Health drops below 25%	/assets/images/powers/last-resort.png	Passive	Passive	Universal	0	Self	15	0	0	\N	\N	f	2017-07-08 19:23:47.873-05	2017-07-08 19:23:47.873-05	Last Resort	/assets/svgs/powers/last-resort.svg	0
170	immolation	power	Blinds up to 8 nearby enemies while rendering you immune to physics impulses and damage effects. Remove all movement impairments.	/assets/images/powers/immolation.png	Ultimate	Instant	Mana	0	Sphere	0	0	0	\N	\N	f	2017-07-08 19:23:47.873-05	2017-07-08 19:23:47.873-05	Immolation	/assets/svgs/powers/immolation.svg	0
171	lightning-burst	power	Blast enemies with lightning for 110 - 165 + 138% Weapon Damage.	/assets/images/powers/lightning-burst.png	Ranged Attack	Instant	Essence	68	Ray	0	5	35	\N	\N	f	2017-07-08 19:23:47.873-05	2017-07-08 19:23:47.873-05	Lightning Burst	/assets/svgs/powers/lightning-burst.svg	9
172	furious-slash-2	power	Slash furiously at an enemy for 113 - 152 + 132% Weapon Damage while reducing your short and long cooldown times.	/assets/images/powers/furious-slash-2.png	Buff	Instant	Universal	13	Cone	15	1	0	\N	\N	t	2017-07-08 19:23:47.873-05	2017-07-08 19:23:47.873-05	Furious Slash 2	/assets/svgs/powers/furious-slash-2.svg	23
173	grabthars-hammer-2	power	Smash an enemy, stunning them for 106 - 143 + 124% Weapon Damage.	/assets/images/powers/grabthars-hammer-2.png	Debuff	Instant	Universal	12	Cone	0	1	5	\N	\N	t	2017-07-08 19:23:47.873-05	2017-07-08 19:23:47.873-05	Grabthars Hammer 2	/assets/svgs/powers/grabthars-hammer-2.svg	30
174	focused-spark	power	Channel lightning at your target for 64 - 96 + 80% Weapon Damage. Striking with FOCUSED SPARK, three times in sucession triggers Spark Focus, increasing your Critial Hit Chance by 100% for 9 seconds or until your next hit.	/assets/images/powers/focused-spark.png	Ranged Attack	Channeled	Essence	28	Reticle	0	1	30	\N	\N	f	2017-07-08 19:23:47.873-05	2017-07-08 19:23:47.873-05	Focused Spark	/assets/svgs/powers/focused-spark.svg	0
175	heads-up	power	Increase the Perception of group members and yourself by 25 for 30 seconds and removes the Exposed state.	/assets/images/powers/heads-up.png	Buff	Instant	Universal	12	Group	30	5	0	\N	\N	f	2017-07-08 19:23:47.873-05	2017-07-08 19:23:47.873-05	Heads Up	/assets/svgs/powers/heads-up.svg	68
183	jelly-skin	power	Protect yourself with skin like rubber granting you a barrier with immunity to Crushing damage.	/assets/images/powers/jelly-skin.png	Buff	Instant	Universal	16	Self	15	0	0	\N	\N	f	2017-07-08 19:23:47.874-05	2017-07-08 19:23:47.874-05	Jelly Skin	/assets/svgs/powers/jelly-skin.svg	45
184	nova	power	Draw enemies toward you repeatedly inflicting 2 - 3 + 2% Weapon Damage.	/assets/images/powers/nova.png	Debuff	Instant	Universal	1	Area	0	5	15	\N	\N	f	2017-07-08 19:23:47.874-05	2017-07-08 19:23:47.874-05	Nova	/assets/svgs/powers/nova.svg	9
185	leeching-seed	power	Cause an enemy to become lethargic increasing all Power colldowns and reducing their movement speed for 8 seconds.	/assets/images/powers/leeching-seed.png	Debuff	Instant	Essence	35	Area	8	1	0	\N	\N	f	2017-07-08 19:23:47.874-05	2017-07-08 19:23:47.874-05	Leeching Seed	/assets/svgs/powers/leeching-seed.svg	30
186	kick-sand	power	Kick sand at nearby enemies, blinding them for 4 seconds while dealing 151 - 205 + 178% Weapon Damage.	/assets/images/powers/kick-sand.png	Crowd Control	Instant	Rage	14	Cone	0	1	5	\N	\N	t	2017-07-08 19:23:47.874-05	2017-07-08 19:23:47.874-05	Kick Sand	/assets/svgs/powers/kick-sand.svg	30
187	massive-smash	power	Strike in front of you for 152 - 206 + 179% Weapon Damage, generating 4 Rage if you hit. Applies Mortal Strike to all hit, which reduces the effectiveness of any Healing that target receives by 25% for 15 seconds.	/assets/images/powers/massive-smash.png	Debuff	Instant	Rage	0	Cone	15	1	5	\N	\N	t	2017-07-08 19:23:47.874-05	2017-07-08 19:23:47.874-05	Massive Smash	/assets/svgs/powers/massive-smash.svg	0
188	go-for-broke	power	Leap from your Burrow with full commitment, unleashing a deadly hail of gunfire assaulting up to three targets in a cone multiple times for 39 - 58 + 48% Weapon Damage before returning to your burrow again if you can avoid damage. Striking Exposed targets causes a guaranteed critical hit.	/assets/images/powers/go-for-broke.png	Ranged Attack	Channeled	Pip	0	Cone	0	3	15	\N	\N	f	2017-07-08 19:23:47.874-05	2017-07-08 19:23:47.874-05	Go For Broke	/assets/svgs/powers/go-for-broke.svg	9
189	grounding	power	Protect group members and yourself with increased Electricity Armor.	/assets/images/powers/grounding.png	Buff	Instant	Universal	16	Group	0	5	0	\N	\N	f	2017-07-08 19:23:47.874-05	2017-07-08 19:23:47.874-05	Grounding	/assets/svgs/powers/grounding.svg	45
190	illusionary-armor	power	Conjure an illusion effective enough to reduce incoming damage by 20% for 20 seconds.	/assets/images/powers/illusionary-armor.png	Buff	Instant	Universal	16	Self	20	1	0	\N	\N	f	2017-07-08 19:23:47.874-05	2017-07-08 19:23:47.874-05	Illusionary Armor	/assets/svgs/powers/illusionary-armor.svg	45
191	leave-burrow	power	Leave your Burrow, becoming fully visible and switching to your normal power tray.	/assets/images/powers/leave-burrow.png	Transformation	Instant	Pip	0	Self	0	1	0	\N	\N	f	2017-07-08 19:23:47.874-05	2017-07-08 19:23:47.874-05	Leave Burrow	/assets/svgs/powers/leave-burrow.svg	0
193	massive-cleave	power	Strike in front of you for 142 - 192 - 167% Weapon Damage.	/assets/images/powers/massive-cleave.png	Melee Attack	Instant	Rage	15	Cone	0	1	5	\N	\N	f	2017-07-08 19:23:47.874-05	2017-07-08 19:23:47.874-05	Massive Cleave	/assets/svgs/powers/massive-cleave.svg	9
194	launch-explosive-trap	power	Shoot an explosive trap at a ground location, which explodes when an enemy approaches it dealing 46 - 62 + 54% Weapon Damage as Fire Damage. Knocks Up all hit. Trap will exist for 60 seconds.	/assets/images/powers/launch-explosive-trap.png	Ranged Attack	Ground Aimed	Energy	0	Area	0	5	0	\N	\N	f	2017-07-08 19:23:47.874-05	2017-07-08 19:23:47.874-05	Launch Explosive Trap	/assets/svgs/powers/launch-explosive-trap.svg	24
195	molon-labe	power	Block high damage attacks with reduced cost and a 5% increase in bonus damage for 2 additional seconds.	/assets/images/powers/molon-labe.png	Passive	Passive	Universal	0	Self	0	0	0	\N	\N	f	2017-07-08 19:23:47.874-05	2017-07-08 19:23:47.874-05	Molon Labe	/assets/svgs/powers/molon-labe.svg	0
196	healing-rain	power	Blanket the targeted area with Life energy, instantly healing 27 to 33 + 30% Weapon Damage. This Power generates a High amount of Essence	/assets/images/powers/healing-rain.png	Non-Aggressive	Instant	Essence	96	Area	0	5	0	\N	\N	f	2017-07-08 19:23:47.874-05	2017-07-08 19:23:47.874-05	Healing Rain	/assets/svgs/powers/healing-rain.svg	0
197	indulgence	power	Indulgence Cleanse yourself and become immune to Sin for 30 seconds.	/assets/images/powers/indulgence.png	Buff	Instant	Universal	12	Self	30	1	0	\N	\N	f	2017-07-08 19:23:47.874-05	2017-07-08 19:23:47.874-05	Indulgence	/assets/svgs/powers/indulgence.svg	45
198	insanity	power	Bolster your combat prowess increasing your Health maximum by 17.5 for each point of current Rage.	/assets/images/powers/insanity.png	Buff	Instant	Universal	12	Self	0	3	12	\N	\N	f	2017-07-08 19:23:47.874-05	2017-07-08 19:23:47.874-05	Insanity	/assets/svgs/powers/insanity.svg	45
203	oath-of-will	power	Vowing never to surrender, you recover 36 Stamina over 3 seconds.	/assets/images/powers/oath-of-will.png	Non-Aggressive	Instant	Stamina	0	Cone	0	1	0	\N	\N	t	2017-07-08 19:23:47.874-05	2017-07-08 19:23:47.874-05	Oath of Will	/assets/svgs/powers/oath-of-will.svg	23
204	hellfire-blast	power	Damages all players in front of you who were hit by the Hellfire Wave for 76 - 114 + 95% Weapon Damage, and knocks them briefly into the air.	/assets/images/powers/hellfire-blast.png	Ranged Attack	Instant	Mana	80	Rectange	0	5	30	\N	\N	t	2017-07-08 19:23:47.874-05	2017-07-08 19:23:47.874-05	Hellfire Blast	/assets/svgs/powers/hellfire-blast.svg	30
205	infinite-angles	power	Shield Throws now apply a movement speed reduction to all targets hit.	/assets/images/powers/infinite-angles.png	Passive		Universal	0	Self	0	0	0	\N	\N	f	2017-07-08 19:23:47.876-05	2017-07-08 19:23:47.876-05	Infinite Angles	/assets/svgs/powers/infinite-angles.svg	0
206	mind-revenge	power	Empower your barriers to explode when they expire causing nearby enemies to suffer 56 - 84 + 70% Weapon Damage.	/assets/images/powers/mind-revenge.png	Passive	Passive	Universal	0	Self	0	0	0	\N	\N	f	2017-07-08 19:23:47.876-05	2017-07-08 19:23:47.876-05	Mind Revenge	/assets/svgs/powers/mind-revenge.svg	0
207	matching-mail	power	Increase your Support Power by 350 when wearing a full set of Mail armor.	/assets/images/powers/matching-mail.png	Passive	Passive	Universal	0	Self	0	0	0	\N	\N	f	2017-07-08 19:23:47.876-05	2017-07-08 19:23:47.876-05	Matching Mail	/assets/svgs/powers/matching-mail.svg	0
208	pin-cushion	power	Gain a Piercing damage immune Barrier for 15 seconds.	/assets/images/powers/pin-cushion.png	Buff	Instant	Universal	16	Self	15	0	0	\N	\N	f	2017-07-08 19:23:47.876-05	2017-07-08 19:23:47.876-05	Pin Cushion	/assets/svgs/powers/pin-cushion.svg	45
209	multi-fireball	power	Shoots 3 fireballs towards your reticle that explodes for 35 - 53 + 44% Weapon Damage as Fire Damage. Applies Sin to anyone damaged.	/assets/images/powers/multi-fireball.png	Ranged Attack	Instant	Mana	0	Reticle	0	1	25	\N	\N	t	2017-07-08 19:23:47.876-05	2017-07-08 19:23:47.876-05	Multi-Fireball	/assets/svgs/powers/multi-fireball.svg	0
213	no-quarter	power	Swipe in front of you for 94 - 115 + 105 Weapon Damage.	/assets/images/powers/no-quarter.png	Melee Attack	Instant	N/A	10	Cone	0	1	6	\N	\N	f	2017-07-08 19:23:47.876-05	2017-07-08 19:23:47.876-05	No Quarter	/assets/svgs/powers/no-quarter.svg	5
214	multi-purpose-shot	power	Shoot and arrow towards your reticle that deals 227 - 307 + 267% Weapon Damage and apply additional effects when using exotic arrows. Check your arrow's description for details on additional effects.	/assets/images/powers/multi-purpose-shot.png	Ranged Attack	Charged	Energy	0	Reticle	0	1	40	\N	\N	t	2017-07-08 19:23:47.876-05	2017-07-08 19:23:47.876-05	Multi-Purpose Shot	/assets/svgs/powers/multi-purpose-shot.svg	0
215	neck-breaker	power	Leap straight up. When you land, Knock Down all enemies in the area dealing 288 - 389 + 339% Weapon Damage as Crushing Damage.	/assets/images/powers/neck-breaker.png	Ultimate	Instant	Rage	0	Sphere	0	5	0	\N	\N	f	2017-07-08 19:23:47.876-05	2017-07-08 19:23:47.876-05	Neck Breaker	/assets/svgs/powers/neck-breaker.svg	5
216	pistol-shot-2	power	Shoot an enemy for 85 - 127 + 106% Weapon Damage while generating a Pip with a chance to reset the cooldown of Rapid Fire.	/assets/images/powers/pistol-shot-2.png	Ranged Attack	Instant	Universal	21	Ray	0	1	15	\N	\N	t	2017-07-08 19:23:47.876-05	2017-07-08 19:23:47.876-05	Pistol Shot 2	/assets/svgs/powers/pistol-shot-2.svg	0
217	noble-blood	power	Shout and deal 60 - 81 + 70% Weapon Damage to enemies in a sphere around you. If any enemy is hit, you gain an Absorption Barrier for 12 seconds.	/assets/images/powers/noble-blood.png	Buff	Instant	Stamina	22	Cone	0	1	5	\N	\N	f	2017-07-08 19:23:47.876-05	2017-07-08 19:23:47.876-05	Noble Blood	/assets/svgs/powers/noble-blood.svg	23
218	mana-shield	power	Surround yourself with a protective barrier that drains your mana as it prevents damage as well as increasing your Damage Bonus by 5% for 15 seconds.	/assets/images/powers/mana-shield.png	Buff	Instant	Universal	16	Self	15	5	0	\N	\N	f	2017-07-08 19:23:47.876-05	2017-07-08 19:23:47.876-05	Mana Shield	/assets/svgs/powers/mana-shield.svg	23
219	piercing-orb	power	Conjure a slow moving doom-filled projectile that passes through enemies to damage them repeatedly for 53 - 80 + 67% Piercing Weapon Damage.	/assets/images/powers/piercing-orb.png	Ranged Attack	Instant	Universal	8	Reticle	0	5	35	\N	\N	f	2017-07-08 19:23:47.876-05	2017-07-08 19:23:47.876-05	Piercing Orb	/assets/svgs/powers/piercing-orb.svg	9
220	jab	power	Slash in front of you, critically striking for 118 - 160 + 139% Weapon Damage.	/assets/images/powers/jab.png	Melee Attack	Instant	Energy	47	Cone	0	1	5	\N	\N	t	2017-07-08 19:23:47.876-05	2017-07-08 19:23:47.876-05	Jab	/assets/svgs/powers/jab.svg	9
224	poisoned-blade-2	power	Attack for 86 - 117 + 101% Weapon Damage and cause the enemy to become Poisoned taking 8 - 9 + 1% Weapon Damage per tick.	/assets/images/powers/poisoned-blade-2.png	Debuff	Instant	Universal	10	Cone	0	1	5	\N	\N	t	2017-07-08 19:23:47.877-05	2017-07-08 19:23:47.877-05	Poisoned Blade 2	/assets/svgs/powers/poisoned-blade-2.svg	9
225	noble-purpose	power	Inspire yourself, taking stock of your life saving endeavors and recover Resource for every 10000 Health you restore.	/assets/images/powers/noble-purpose.png	Passive	Passive	Universal	0	Self	0	1	0	\N	\N	f	2017-07-08 19:23:47.877-05	2017-07-08 19:23:47.877-05	Noble Purpose	/assets/svgs/powers/noble-purpose.svg	0
226	meteor-purge	power	Creates a Meteor which damages all enemies in 5m for 101 - 151 + 126% Weapon Damage when it explodes. Charges over 66% apply Black Mantle to all targets hit, which absorbs all incoming Healing until 5000 points of Health are healed of it expires after 30 seconds.	/assets/images/powers/meteor-purge.png	Ranged Attack	Charged	Mana	145	Reticle	30	5	5	\N	\N	f	2017-07-08 19:23:47.877-05	2017-07-08 19:23:47.877-05	Meteor Purge	/assets/svgs/powers/meteor-purge.svg	45
227	pistol-shot	power	Shoot an enemy for 35 - 52 + 43% Weapon Damage while generating a Pip with a chance to reset the cooldown of Rapid Fire.	/assets/images/powers/pistol-shot.png	Ranged Attack	Instant	Universal	9	Ray	0	1	15	\N	\N	f	2017-07-08 19:23:47.877-05	2017-07-08 19:23:47.877-05	Pistol Shot	/assets/svgs/powers/pistol-shot.svg	9
233	pixie-dust	power	Blanket the targeted area with Pixie Dust, increasing Incoming Healing by 25% for 25 seconds.	/assets/images/powers/pixie-dust.png	Buff	Instant	Universal	14	Area	25	5	5	\N	\N	f	2017-07-08 19:23:47.877-05	2017-07-08 19:23:47.877-05	Pixie Dust	/assets/svgs/powers/pixie-dust.svg	45
234	mithradatism	power	Remove all Poison effects from yourself.	/assets/images/powers/mithradatism.png	Buff	Instant	Universal	16	Self	0	0	0	\N	\N	f	2017-07-08 19:23:47.877-05	2017-07-08 19:23:47.877-05	Mithradatism	/assets/svgs/powers/mithradatism.svg	9
235	preparation	power	Plan your next attack when entering Stealth immediately recovering a pip if you don't have one and periodically gaining additional Pips every 30 seconds as you maintain Stealth.	/assets/images/powers/preparation.png	Passive	Passive	Universal	0	Self	30	1	0	\N	\N	f	2017-07-08 19:23:47.877-05	2017-07-08 19:23:47.877-05	Preparation	/assets/svgs/powers/preparation.svg	0
236	needlin-haystack	power	Cover your body with sharp needle-like straws increasing your Piercing Armor by 25.  Piercing attacks reflect 133% weapon damage and cause Severe Bleeding.	/assets/images/powers/needlin-haystack.png	Buff	Instant	Universal	16	Self	15	0	0	\N	\N	f	2017-07-08 19:23:47.877-05	2017-07-08 19:23:47.877-05	Needlin Haystack	/assets/svgs/powers/needlin-haystack.svg	24
237	recon	power	Carefully studying a target from the comfort of your Burrow, you apply the Exposed debuff to reveal weaknesses you and other specialists may capitalize on.	/assets/images/powers/recon.png	Debuff	Instant	Pip	0	Ray	0	1	0	\N	\N	f	2017-07-08 19:23:47.877-05	2017-07-08 19:23:47.877-05	Recon	/assets/svgs/powers/recon.svg	0
238	onslaught	power	Attack in front of you twice for 62 - 84 + 73% Weapon Damage each strike.	/assets/images/powers/onslaught.png	Melee Attack	Instant	Stamina	12	Cone	0	1	5	\N	\N	f	2017-07-08 19:23:47.877-05	2017-07-08 19:23:47.877-05	Onslaught	/assets/svgs/powers/onslaught.svg	5
239	radiant-sweep	power	Knock down multiple enemies dealing 72 - 108 + 90% Weapon Damage.	/assets/images/powers/radiant-sweep.png	Crowd Control	Instant	Pips	1	Cone	0	5	5	\N	\N	t	2017-07-08 19:23:47.877-05	2017-07-08 19:23:47.877-05	Radiant Sweep	/assets/svgs/powers/radiant-sweep.svg	9
240	rapid-fire-ranger	power	Hold to shoot up to 10 arrows towards your reticle that deal 40 - 54 + 47% Weapon per arrow.  Adds 10 Critical Hit Change for 2 seconds for each arrow that doe not critically hit, effect is removed when you land a critical hit.	/assets/images/powers/rapid-fire-ranger.png	Ranged Attack	Hold Channeled	Energy	0	Reticle	2	1	40	\N	\N	f	2017-07-08 19:23:47.877-05	2017-07-08 19:23:47.877-05	Rapid Fire (Ranger)	/assets/svgs/powers/rapid-fire-ranger.svg	9
241	rapid-fire-pistols	power	Unleash a deadly barrage of hot lead causing 28 - 43 + 36% Weapon Damage.  If Rapid Fire hits an Exposed enemy while they attack or use an ability, they are knocked down and take additional damage.	/assets/images/powers/rapid-fire-pistols.png	Melee Attack	Instant	Universal	0	Ray	0	1	15	\N	\N	f	2017-07-08 19:23:47.877-05	2017-07-08 19:23:47.877-05	Rapid Fire (Pistols)	/assets/svgs/powers/rapid-fire-pistols.svg	9
242	mortal-sin	power	You now apply Mortal Sin instead of Sin.  For each stack of Mortal Sin the target becomes more vulnerable to being Critically Hit by 2% per stack.  All powers that require Sin will also benefit from Mortal Sin.	/assets/images/powers/mortal-sin.png	Passive	Passive	Universal	0	Self	0	0	0	\N	\N	f	2017-07-08 19:23:47.877-05	2017-07-08 19:23:47.877-05	Mortal Sin	/assets/svgs/powers/mortal-sin.svg	0
246	pound-of-flesh	power	Increase your Damage Bonus by 30% when an enemy's Health is above 90%.	/assets/images/powers/pound-of-flesh.png	Passive	Passive	Universal	0	Self	0	0	0	\N	\N	f	2017-07-08 19:23:47.877-05	2017-07-08 19:23:47.877-05	Pound of Flesh	/assets/svgs/powers/pound-of-flesh.svg	0
247	relentless-destroyer	power	You no longer degenerate Rage.  Instead, you generate 1.5 Rage every 1 second while in Combat.	/assets/images/powers/relentless-destroyer.png	Passive	Passive	Universal	0	Self	0	0	0	\N	\N	f	2017-07-08 19:23:47.877-05	2017-07-08 19:23:47.877-05	Relentless (Destroyer)	/assets/svgs/powers/relentless-destroyer.svg	0
248	redemption	power	Rapidly throw up to ten fireballs in a row for 34 - 46 + 40% Fire Weapon Damage scaling up to 43 - 58 + 50% Weapon Damage based on the enemy's Sin.	/assets/images/powers/redemption.png	Ranged Attack	Channeled	Universal	0	Reticle	0	1	30	\N	\N	f	2017-07-08 19:23:47.877-05	2017-07-08 19:23:47.877-05	Redemption	/assets/svgs/powers/redemption.svg	5
254	power-shot	power	Shoot and arrow towards your reticle that deals 227 - 307 + 267% Weapon Damage.	/assets/images/powers/power-shot.png	Ranged Attack	Charged	Energy	0	Reticle	0	1	40	\N	\N	t	2017-07-08 19:23:47.878-05	2017-07-08 19:23:47.878-05	Power Shot	/assets/svgs/powers/power-shot.svg	0
255	rescue	power	Avert an ally's imminent death for 10 seconds preventing them from dropping below 1 Health and healing them for 473 - 578 + 525% Weapon Damage. Recently Rescued allies may not be effected by Rescue.	/assets/images/powers/rescue.png	Buff	Instant	Universal	16	Reticle	10	1	35	\N	\N	f	2017-07-08 19:23:47.878-05	2017-07-08 19:23:47.878-05	Rescue	/assets/svgs/powers/rescue.svg	45
256	redirect-pain	power	Focus your will ignoring pain and reflecting incoming damage back to your attackers. Effects scale with Pips spent. 1 Pip: Gain 2250 Barrier and 7% Retribution for 6 seconds. 2 Pips: Gain 3000 Barrier and 9% Retribution for 9 seconds. 3 Pips: Gain 3750 Barrier and 11% Retribution for 12 seconds. 4 Pips: Gain 4500 Barrier and 13% Retribution for 15 seconds. 5 Pips: Gain 5230 Barrier and 15% Retribution for 18 seconds.	/assets/images/powers/redirect-pain.png	Buff	Instant	Pip	1	Self	0	1	0	\N	\N	f	2017-07-08 19:23:47.878-05	2017-07-08 19:23:47.878-05	Redirect Pain	/assets/svgs/powers/redirect-pain.svg	45
257	restoration-smash	power	Smash an enemy for 117 - 159 + 138% Weapon Damage.	/assets/images/powers/restoration-smash.png	Melee Attack	Instant	Universal	17	Cone	0	1	5	\N	\N	f	2017-07-08 19:23:47.878-05	2017-07-08 19:23:47.878-05	Restoration Smash	/assets/svgs/powers/restoration-smash.svg	9
258	nothing-to-lose	power	Sacrifice 1,000 Health to increase Critical Hit Chance by 5% and Critical Hit Damage by 50% for 20 seconds.	/assets/images/powers/nothing-to-lose.png	Buff	Instant	Universal	1000	Self	20	0	0	\N	\N	f	2017-07-08 19:23:47.878-05	2017-07-08 19:23:47.878-05	Nothing to Lose	/assets/svgs/powers/nothing-to-lose.svg	23
259	reflection	power	Reflect 50% Slashing Weapon Damage back to the source of a Slashing damage attack.	/assets/images/powers/reflection.png	Buff	Instant	Universal	16	Self	15	0	0	\N	\N	f	2017-07-08 19:23:47.878-05	2017-07-08 19:23:47.878-05	Reflection	/assets/svgs/powers/reflection.svg	24
260	protective-thorns	power	Fortify your Armor Class increasing it by three times your Thorns plus Bonus Thorns for 20 seconds whenever you activate Thorns.	/assets/images/powers/protective-thorns.png	Passive		Universal	0	Self	20	0	0	\N	\N	f	2017-07-08 19:23:47.878-05	2017-07-08 19:23:47.878-05	Protective Thorns	/assets/svgs/powers/protective-thorns.svg	0
261	retaliate-champion	power	Jump to your feet, dealing 113 - 153 + 133% Weapon Damage to nearby enemies.	/assets/images/powers/retaliate-champion.png	Retaliate	Instant	Rage	0	Sphere	0	3	5	\N	\N	f	2017-07-08 19:23:47.878-05	2017-07-08 19:23:47.878-05	Retaliate (Champion)	/assets/svgs/powers/retaliate-champion.svg	30
262	retaliate-knight	power	Jump to your feet, damaging all nearby enemies twice for 57 - 77 + 67% Weapon Damage. This attack may only be used while Knocked Down.	/assets/images/powers/retaliate-knight.png	Retaliate	Instant	Stamina	0	Sphere	0	1	5	\N	\N	f	2017-07-08 19:23:47.878-05	2017-07-08 19:23:47.878-05	Retaliate (Knight)	/assets/svgs/powers/retaliate-knight.svg	30
263	second-wind-champion	power	After not taking damage for 4 seconds and falling below 50% Health, Health Regeneration is greatly increased until reaching 50% Health.	/assets/images/powers/second-wind-champion.png	Passive	Passive	Rage	0	Self	4	1	0	\N	\N	f	2017-07-08 19:23:47.878-05	2017-07-08 19:23:47.878-05	Second Wind (Champion)	/assets/svgs/powers/second-wind-champion.svg	0
264	reproach	power	Slash multiple enemies for 54 - 81 + 67% Weapon Damage.	/assets/images/powers/reproach.png	Melee Attack	Instant	Pips	0	Cone	0	5	5	\N	\N	f	2017-07-08 19:23:47.878-05	2017-07-08 19:23:47.878-05	Reproach	/assets/svgs/powers/reproach.svg	0
266	numbness	power	Reduce the cost of Blocking high damage attacks.	/assets/images/powers/numbness.png	Passive		Universal	0	Self	0	0	0	\N	\N	f	2017-07-08 19:23:47.878-05	2017-07-08 19:23:47.878-05	Numbness	/assets/svgs/powers/numbness.svg	0
267	relentless-champion	power	You no longer degenerate Rage. Instead, you generate 1.5 Rage every 1 second while in Combat.	/assets/images/powers/relentless-champion.png	Passive	Passive	Rage	0	Self	0	0	0	\N	\N	f	2017-07-08 19:23:47.878-05	2017-07-08 19:23:47.878-05	Relentless (Champion)	/assets/svgs/powers/relentless-champion.svg	0
269	retaliate-cleric	power	Jump to your feet, hitting all nearby enemies twice for 60 - 73 + 67% Weapon Damage.	/assets/images/powers/retaliate-cleric.png	Retaliate	Instant	N/A	0	Sphere	0	3	0	\N	\N	f	2017-07-08 19:23:47.878-05	2017-07-08 19:23:47.878-05	Retaliate (Cleric)	/assets/svgs/powers/retaliate-cleric.svg	30
274	opportunist	power	Saber Attacks have a 20% chance to reset the cooldown on Flintlock shot.	/assets/images/powers/opportunist.png	Passive	Passive	Pip	0	Self	0	1	0	\N	\N	f	2017-07-08 19:23:47.878-05	2017-07-08 19:23:47.878-05	Opportunist	/assets/svgs/powers/opportunist.svg	0
275	restoration-strike	power	Slice an enemy for 117-159 + 138% Weapon Damage.	/assets/images/powers/restoration-strike.png	Melee Attack	Instant	Universal	17	Cone	0	1	5	\N	\N	f	2017-07-08 19:23:47.878-05	2017-07-08 19:23:47.878-05	Restoration Strike	/assets/svgs/powers/restoration-strike.svg	9
276	rend	power	Rend in front of you, dealing 234 - 316 + 275% Weapon Damage. Applies a Severe Bleed to all hit.	/assets/images/powers/rend.png	Debuff	Instant	Rage	23	Cone	0	1	5	\N	\N	t	2017-07-08 19:23:47.878-05	2017-07-08 19:23:47.878-05	Rend	/assets/svgs/powers/rend.svg	24
277	reveal-shadows	power	Activates Shadow Sight for 12 seconds.	/assets/images/powers/reveal-shadows.png	Buff	Instant	Universal	32	Self	12	1	0	\N	\N	f	2017-07-08 19:23:47.878-05	2017-07-08 19:23:47.878-05	Reveal Shadows	/assets/svgs/powers/reveal-shadows.svg	23
278	reverberating-blow	power	Afflict an enemy with an aura causing other nearby enemies to suffer 15 - 20 + 18% Weapon Damage.	/assets/images/powers/reverberating-blow.png	Debuff	Instant	Universal	11	Cone	15	5	5	\N	\N	f	2017-07-08 19:23:47.878-05	2017-07-08 19:23:47.878-05	Reverberating Blow	/assets/svgs/powers/reverberating-blow.svg	24
279	shroud-of-darkness	power	Attacks made against you have a chance of Stunning the enemy who struck you.	/assets/images/powers/shroud-of-darkness.png	Buff	Instant	Essence	31	Self	0	0	0	\N	\N	f	2017-07-08 19:23:47.878-05	2017-07-08 19:23:47.878-05	Shroud of Darkness	/assets/svgs/powers/shroud-of-darkness.svg	45
280	retaliate-duelist	power	Jump to your feet, damaging all nearby enemies for 105 - 158 + 132% Weapon Damage. Retaliating an Exposed enemy generates an additional Pip and reset Relaliate's cooldown.	/assets/images/powers/retaliate-duelist.png	Retaliate	Instant	Pip	0	Sphere	0	1	0	\N	\N	f	2017-07-08 19:23:47.878-05	2017-07-08 19:23:47.878-05	Retaliate (Duelist)	/assets/svgs/powers/retaliate-duelist.svg	3
281	shield-glare-2	power	Blind an enemy with light reflected from your shield causing 104 - 140 + 122% Weapon Damage.	/assets/images/powers/shield-glare-2.png	Melee Attack	Instant	Universal	12	Cone	0	1	5	\N	\N	t	2017-07-08 19:23:47.878-05	2017-07-08 19:23:47.878-05	Shield Glare 2	/assets/svgs/powers/shield-glare-2.svg	30
282	pepperbox-shot	power	Indiscriminately blast up to three targets causing 57 - 86 + 72% Weapon Damage. Effects scale with Pips spent. 1 Pip: 57 - 86. 2 Pips: 114 - 172. 3 Pips: 171 - 258. 4 Pips: 228 - 344. 5 Pips: 285 - 430 and targets are stunned.	/assets/images/powers/pepperbox-shot.png	Crowd Control	Instant	Pip	1	Cone	0	1	15	\N	\N	f	2017-07-08 19:23:47.878-05	2017-07-08 19:23:47.878-05	Pepperbox Shot	/assets/svgs/powers/pepperbox-shot.svg	9
284	restoration-smash-2	power	Crush an enemy for 116 - 156 + 136% Weapon Damage while restoring your Resource.	/assets/images/powers/restoration-smash-2.png	Melee Attack	Instant	Universal	13	Cone	0	1	5	\N	\N	t	2017-07-08 19:23:47.878-05	2017-07-08 19:23:47.878-05	Restoration Smash 2	/assets/svgs/powers/restoration-smash-2.svg	23
285	ricochet-shot	power	Charge an arrow and shoot it towards your reticle dealing 158 - 213 + 186% Weapon Damage. The arrow will chain to a second target within 6m and then chain to a third target. If you hit 3 targets with this power applies 150 Critical Hit Damage for 10 seconds.	/assets/images/powers/ricochet-shot.png	Ranged Attack	Charged	Energy	1	Reticle	10	1	40	\N	\N	f	2017-07-08 19:23:47.878-05	2017-07-08 19:23:47.878-05	Ricochet Shot	/assets/svgs/powers/ricochet-shot.svg	23
286	righteous-stand	power	Raise your sword to defend yourself increasing your damage mitigation and becoming immune to crow control effects. Being struck with a melee attack restores Righteousness and triggers Righteous Parry	/assets/images/powers/righteous-stand.png	Crowd Control Self	Hold Channeled	Pips	0	Self	0	1	0	\N	\N	f	2017-07-08 19:23:47.878-05	2017-07-08 19:23:47.878-05	Righteous Stand	/assets/svgs/powers/righteous-stand.svg	0
294	runecarve-flesh	power	Carve Runes into your flesh absorbing 50% of damage taken for 6 seconds and then exploding to inflict 35% of total damage taken (max 1050) to nearby enemies as Fire damage.	/assets/images/powers/runecarve-flesh.png	Buff	Instant	Universal	16	Self	6	0	0	\N	\N	f	2017-07-08 19:23:47.878-05	2017-07-08 19:23:47.878-05	Runecarve Flesh	/assets/svgs/powers/runecarve-flesh.svg	45
295	slow-growth	power	Favor the forces of Life reducing your Essence Gain by 50%.	/assets/images/powers/slow-growth.png	Passive	Passive	Universal	0	Self	0	5	0	\N	\N	f	2017-07-08 19:23:47.878-05	2017-07-08 19:23:47.878-05	Slow Growth	/assets/svgs/powers/slow-growth.svg	0
296	sanctuary	power	Defend an area with a runic symbol increasing allies' All Armor by 20%.	/assets/images/powers/sanctuary.png	Buff	Instant	Universal	12	Area	30	5	10	\N	\N	f	2017-07-08 19:23:47.878-05	2017-07-08 19:23:47.878-05	Sanctuary	/assets/svgs/powers/sanctuary.svg	23
297	slow-demise-2	power	Torment an enemy reducing their Healing Bonus and inflicting 79 - 108 + 94% Weapon Damage.	/assets/images/powers/slow-demise-2.png	Debuff	Instant	Universal	12	Cone	15	1	5	\N	\N	t	2017-07-08 19:23:47.878-05	2017-07-08 19:23:47.878-05	Slow Demise 2	/assets/svgs/powers/slow-demise-2.svg	45
298	pulverize	power	Paw at the ground menacingly and begin Raging before ramming head first into your target for 240 - 293 + 267% Weapon Damage. This attack is guaranteed critical hit when over 65% charged.	/assets/images/powers/pulverize.png	Crowd Control	Charged	Fury	50	Cone	0	1	5	\N	\N	f	2017-07-08 19:23:47.879-05	2017-07-08 19:23:47.879-05	Pulverize	/assets/svgs/powers/pulverize.svg	20
299	scatter-horde	power	Rear and smash into the ground damaging 8 enemies in the area for 120 - 146 + 133% Weapon Damage, and pushing them back.	/assets/images/powers/scatter-horde.png	Melee Attack	Instant	N/A	23	Sphere	0	5	6	\N	\N	f	2017-07-08 19:23:47.879-05	2017-07-08 19:23:47.879-05	Scatter Horde	/assets/svgs/powers/scatter-horde.svg	24
300	retaliate-myrmidon	power	Jump to your feet, dealing 39 - 48 + 33% Weapon Damage to nearby enemies.	/assets/images/powers/retaliate-myrmidon.png	Retaliate	Instant	Fury	0	Sphere	0	3	5	\N	\N	f	2017-07-08 19:23:47.879-05	2017-07-08 19:23:47.879-05	Retaliate (Myrmidon)	/assets/svgs/powers/retaliate-myrmidon.svg	30
301	side-strike	power	Strike in front of you for 108 - 132 + 120% Weapon Damage.	/assets/images/powers/side-strike.png	Melee Attack	Instant	N/A	0	Cone	0	1	5	\N	\N	t	2017-07-08 19:23:47.879-05	2017-07-08 19:23:47.879-05	Side Strike	/assets/svgs/powers/side-strike.svg	0
302	saber-attack-2	power	Attack for 54 - 81 + 68% Weapon Damage.	/assets/images/powers/saber-attack-2.png	Melee Attack	Instant	Pip	0	Cone	0	1	5	\N	\N	t	2017-07-08 19:23:47.879-05	2017-07-08 19:23:47.879-05	Saber Attack 2	/assets/svgs/powers/saber-attack-2.svg	0
303	soothing-winds	power	Heals a targeted ally instantly for 32 - 39 + 35% Weapon Damage, and then jumps to a nearby ally.  Each player healed will heal every second for an additional 15 seconds.  SOOTHING WINDS will jump to as many as 5 with healing reduced by 30% each jump.	/assets/images/powers/soothing-winds.png	Buff	Instant	Universal	0	Ray	20	5	35	\N	\N	f	2017-07-08 19:23:47.879-05	2017-07-08 19:23:47.879-05	Soothing Winds	/assets/svgs/powers/soothing-winds.svg	0
304	second-wind-knight	power	Heals you for 4% of your maximum Health every second and recovers Stamina. This effect is automatically triggered when dropping below 20% health.	/assets/images/powers/second-wind-knight.png	Passive	Passive	Stamina	0	Self	0	1	0	\N	\N	f	2017-07-08 19:23:47.879-05	2017-07-08 19:23:47.879-05	Second Wind (Knight)	/assets/svgs/powers/second-wind-knight.svg	0
305	song-of-speed	power	While Out of Combat increases the groups Movement Speed by 35% for 12 seconds. While In Combat increases the groups Movement Speed by 10% for 12 seconds. Type 1 Song.	/assets/images/powers/song-of-speed.png	Buff	Toggle	Universal	0	Group	12	5	0	\N	\N	f	2017-07-08 19:23:47.879-05	2017-07-08 19:23:47.879-05	Song of Speed	/assets/svgs/powers/song-of-speed.svg	1
306	punch-drunk	power	If you take more than 15% of your maximum health as damage in 2 seconds, reset the cooldowns on all powers currently on cooldown.	/assets/images/powers/punch-drunk.png	Passive	Passive	Universal	0	Self	0	0	0	\N	\N	f	2017-07-08 19:23:47.879-05	2017-07-08 19:23:47.879-05	Punch Drunk	/assets/svgs/powers/punch-drunk.svg	0
307	slow-demise	power	Stick an enemy for 85 - 115 + 100% Weapon Damage.	/assets/images/powers/slow-demise.png	Melee Attack	Instant	Universal	12	Cone	0	1	5	\N	\N	f	2017-07-08 19:23:47.879-05	2017-07-08 19:23:47.879-05	Slow Demise	/assets/svgs/powers/slow-demise.svg	9
308	retaliate-ranger	power	Jump to your feet, dealing 113 - 153 + 133% Weapon Damage to nearby enemies.	/assets/images/powers/retaliate-ranger.png	Retaliate	Instant	Energy	0	Sphere	0	3	0	\N	\N	f	2017-07-08 19:23:47.879-05	2017-07-08 19:23:47.879-05	Retaliate (Ranger)	/assets/svgs/powers/retaliate-ranger.svg	30
310	shadows-linger	power	Coming Soon	/assets/images/powers/shadows-linger.png	Passive		Universal	0	Self	0	0	0	\N	\N	f	2017-07-08 19:23:47.879-05	2017-07-08 19:23:47.879-05	Shadows Linger	/assets/svgs/powers/shadows-linger.svg	0
314	purgative	power	Cleanse your group and yourself of damage over time effects healing for 32 - 39 + 35% Weapon Damage for each effect removed.	/assets/images/powers/purgative.png	Buff	Instant	Universal	16	Group	0	5	0	\N	\N	f	2017-07-08 19:23:47.879-05	2017-07-08 19:23:47.879-05	Purgative	/assets/svgs/powers/purgative.svg	23
315	smash	power	Strike in front of you for 68 - 92 + 80% Weapon Damage, generating 4 Rage if you hit.	/assets/images/powers/smash.png	Melee Attack	Instant	Rage	0	Cone	0	1	5	\N	\N	f	2017-07-08 19:23:47.879-05	2017-07-08 19:23:47.879-05	Smash	/assets/svgs/powers/smash.svg	0
316	revenge	power	Increase your Critical Hit Chance and Critical Hit Damage by 25 for 30 seconds when damaged by a Stealth attack.	/assets/images/powers/revenge.png	Passive	Passive	Universal	0	Self	30	1	0	\N	\N	f	2017-07-08 19:23:47.879-05	2017-07-08 19:23:47.879-05	Revenge	/assets/svgs/powers/revenge.svg	0
317	speedy-retaliate	power	Regain your senses recovering immediately from Knockdown or Stun effects with an attack inflicting #min_damage_1# - #max_damage_1# + #weapon_damage_value#% Weapon Damage and then increasing your Movement Speed by 30% for 8 seconds.	/assets/images/powers/speedy-retaliate.png	Debuff	Instant	Universal	0	Area	8	5	5	\N	\N	f	2017-07-08 19:23:47.879-05	2017-07-08 19:23:47.879-05	Speedy Retaliate	/assets/svgs/powers/speedy-retaliate.svg	30
319	sweep	power	Slash in front of you for 68 - 92 - 80% Weapon Damage. Applies Cunning Sweep to one nearby group member, which adds 15% Bonus Damage to their next attack.	/assets/images/powers/sweep.png	Crowd Control Self	Instant	Energy	31	Cone	0	1	5	\N	\N	f	2017-07-08 19:23:47.879-05	2017-07-08 19:23:47.879-05	Sweep	/assets/svgs/powers/sweep.svg	23
320	shield-slam	power	Charge your shield and slam up to 3 enemies in front of you for 82 - 111 + 97% Crushing Weapon Damage based on length of he charge. Charges over 66% guarantee a critical hit and push enemies away.	/assets/images/powers/shield-slam.png	Melee Attack	Instant	Stamina	30	Reticle	0	3	7	\N	\N	f	2017-07-08 19:23:47.879-05	2017-07-08 19:23:47.879-05	Shield Slam	/assets/svgs/powers/shield-slam.svg	24
322	quick-burn	power	Tip the scales towards Death increasing your Essence Gain by 50%.	/assets/images/powers/quick-burn.png	Passive	Passive	Universal	0	Self	0	5	0	\N	\N	f	2017-07-08 19:23:47.879-05	2017-07-08 19:23:47.879-05	Quick Burn	/assets/svgs/powers/quick-burn.svg	0
324	rune-shield	power	Protect yourself increasing Elemental Armor by 20.	/assets/images/powers/rune-shield.png	Buff	Instant	Universal	12	Self	30	1	0	\N	\N	f	2017-07-08 19:23:47.879-05	2017-07-08 19:23:47.879-05	Rune Shield	/assets/svgs/powers/rune-shield.svg	45
325	steal-soul	power	Basic attacks gain the Lifesteal effect.	/assets/images/powers/steal-soul.png	Passive	Passive	Universal	0	Self	0	0	0	\N	\N	f	2017-07-08 19:23:47.879-05	2017-07-08 19:23:47.879-05	Steal Soul	/assets/svgs/powers/steal-soul.svg	0
326	skullcracker-2	power	Smash an enemy, stunning them and causing 94 - 127 + 111% Weapon Damage.	/assets/images/powers/skullcracker-2.png	Debuff	Instant	Universal	12	Cone	0	1	5	\N	\N	t	2017-07-08 19:23:47.879-05	2017-07-08 19:23:47.879-05	Skullcracker 2	/assets/svgs/powers/skullcracker-2.svg	30
327	tenderize-2	power	Cut an enemy for 76 - 103 + 90% Weapon Damage and reducing their Bleed Armor for 15 seconds.	/assets/images/powers/tenderize-2.png	Debuff	Instant	Universal	10	Cone	15	1	5	\N	\N	t	2017-07-08 19:23:47.879-05	2017-07-08 19:23:47.879-05	Tenderize 2	/assets/svgs/powers/tenderize-2.svg	23
328	sparring	power	Increase your basic attack damage 10.	/assets/images/powers/sparring.png	Passive	Passive	Universal	0	Self	0	0	0	\N	\N	f	2017-07-08 19:23:47.879-05	2017-07-08 19:23:47.879-05	Sparring	/assets/svgs/powers/sparring.svg	0
329	strength-of-the-legion	power	Applies Legion's Strength to the group which grants 100 Attack Power. Should the Legionaire die in combat, applies Last Words to all nearby group members, which Heals them and increases their critical hit change, critical hit ammount.	/assets/images/powers/strength-of-the-legion.png	Passive	Passive	N/A	0	Group	0	5	0	\N	\N	f	2017-07-08 19:23:47.879-05	2017-07-08 19:23:47.879-05	Strength of the Legion	/assets/svgs/powers/strength-of-the-legion.svg	0
330	raging-bull	power	Begin Raging and flinging enemies away from you causing 39 - 48 + 44% Weapon Damage to nearby enemies.	/assets/images/powers/raging-bull.png	Ultimate	Instant	Fury	0	Cone	0	5	5	\N	\N	f	2017-07-08 19:23:47.879-05	2017-07-08 19:23:47.879-05	Raging Bull	/assets/svgs/powers/raging-bull.svg	0
331	stink-bomb	power	Torment enemies with a noxious targeted area attack Stunning and afflicting them with Moderate Corruption while maintaining Stealth.	/assets/images/powers/stink-bomb.png	Crowd Control	Ground Aimed	Universal	13	Area	0	5	35	\N	\N	f	2017-07-08 19:23:47.88-05	2017-07-08 19:23:47.88-05	Stink Bomb	/assets/svgs/powers/stink-bomb.svg	30
334	spinning-backfist	power	Spin in front of you dealing 104 - 141 + 122% Weapon Damage as Crushing Damage.	/assets/images/powers/spinning-backfist.png	Melee Attack	Instant	Rage	11	Cone	0	1	5	\N	\N	f	2017-07-08 19:23:47.88-05	2017-07-08 19:23:47.88-05	Spinning Backfist	/assets/svgs/powers/spinning-backfist.svg	9
335	twin-assault	power	Attack in front of you twice for 43 - 58 + 51% Weapon Damage each hit.	/assets/images/powers/twin-assault.png	Melee Attack	Instant	Stamina	14	Cone	0	1	7	\N	\N	t	2017-07-08 19:23:47.88-05	2017-07-08 19:23:47.88-05	Twin Assault	/assets/svgs/powers/twin-assault.svg	9
336	sturdy	power	Reinforce your body reducing Health loss by 20% when your Health is above 80%.	/assets/images/powers/sturdy.png	Passive	Instant	Universal	0	Self	0	0	0	\N	\N	f	2017-07-08 19:23:47.88-05	2017-07-08 19:23:47.88-05	Sturdy	/assets/svgs/powers/sturdy.svg	0
337	terrifying-features	power	Protect yourself with a powerful enchantment periodically stunning attackers.	/assets/images/powers/terrifying-features.png	Passive	Passive	Universal	0	Self	0	0	0	\N	\N	f	2017-07-08 19:23:47.88-05	2017-07-08 19:23:47.88-05	Terrifying Features	/assets/svgs/powers/terrifying-features.svg	0
338	rallying-banner	power	Fortify nearby group members with a banner increasing Attack Power by 200, healing those under 35% Health and removing Slow effects.	/assets/images/powers/rallying-banner.png	Buff	Instant	Universal	16	Area	0	5	15	\N	\N	f	2017-07-08 19:23:47.88-05	2017-07-08 19:23:47.88-05	Rallying Banner	/assets/svgs/powers/rallying-banner.svg	45
344	suns-of-worvan	power	Gain a Fire damage immune Barrier for 15 seconds.	/assets/images/powers/suns-of-worvan.png	Buff	Instant	Universal	13	Cone	15	0	0	\N	\N	f	2017-07-08 19:23:47.88-05	2017-07-08 19:23:47.88-05	Suns of Worvan	/assets/svgs/powers/suns-of-worvan.svg	23
345	thornshield	power	Envelope yourself with dangerous Thorns for 20 seconds causing any who strike you to take damage.	/assets/images/powers/thornshield.png	Buff	Instant	Universal	16	Self	20	0	0	\N	\N	f	2017-07-08 19:23:47.88-05	2017-07-08 19:23:47.88-05	Thornshield	/assets/svgs/powers/thornshield.svg	45
346	remold	power	Reform like clay easily healing any Crushing damage inflicted upon you and an additional 158 - 193 + 175% every five seconds for 15 seconds.	/assets/images/powers/remold.png	Buff	Instant	Universal	16	Self	15	0	0	\N	\N	f	2017-07-08 19:23:47.88-05	2017-07-08 19:23:47.88-05	Remold	/assets/svgs/powers/remold.svg	45
347	taste-for-blood	power	Striking a Bleeding target grants you the Scent of Blood, partially reducing Health loss from Berserk Crash. Striking a Bleeding target also has a chance to grant Taste for Blood for 20 seconds, which greatly increased the damage of your basic attacks.	/assets/images/powers/taste-for-blood.png	Passive	Passive	Fury	0	Self	20	1	0	\N	\N	f	2017-07-08 19:23:47.88-05	2017-07-08 19:23:47.88-05	Taste For Blood	/assets/svgs/powers/taste-for-blood.svg	0
348	tenderize	power	Slice an enemy for 68 - 92 + 80% Weapon Damage.	/assets/images/powers/tenderize.png	Debuff	Instant	Universal	10	Cone	0	1	5	\N	\N	f	2017-07-08 19:23:47.88-05	2017-07-08 19:23:47.88-05	Tenderize	/assets/svgs/powers/tenderize.svg	9
349	unstoppable	power	Embrace overwhelming mania, maximuze your Resolve and trigger Crowd Control Immunity for a short time.	/assets/images/powers/unstoppable.png	Buff	Instant	Universal	16	Self	0	1	0	\N	\N	f	2017-07-08 19:23:47.88-05	2017-07-08 19:23:47.88-05	Unstoppable	/assets/svgs/powers/unstoppable.svg	45
350	strike	power	Strike in front of you for 90 - 110 + 100% Weapon Damage, generating 0.9 Rage #restore_type_time# if you hit.	/assets/images/powers/strike.png	Melee Attack	Instant	N/A	0	Cone	0	1	5	\N	\N	f	2017-07-08 19:23:47.88-05	2017-07-08 19:23:47.88-05	Strike	/assets/svgs/powers/strike.svg	0
351	verses-of-victory	power	Increases your groups Attack Power by 150 as well as Support Power by 150 for 12 seconds. Type 4 Song.	/assets/images/powers/verses-of-victory.png	Buff	Toggle	Universal	0	Group	12	5	0	\N	\N	f	2017-07-08 19:23:47.88-05	2017-07-08 19:23:47.88-05	Verses of Victory	/assets/svgs/powers/verses-of-victory.svg	1
352	tunnel	power	Quickly excavate a path directly ahead of you, ignoring walls and object in your path.	/assets/images/powers/tunnel.png	Non-Aggressive	Instant	Pip	0	Self	0	1	0	\N	\N	f	2017-07-08 19:23:47.88-05	2017-07-08 19:23:47.88-05	Tunnel	/assets/svgs/powers/tunnel.svg	0
353	toughness	power	Strengthen group members and yourself increasing their Maximum Health by 20% for 45 seconds.	/assets/images/powers/toughness.png	Buff	Instant	Universal	16	Group	45	5	0	\N	\N	f	2017-07-08 19:23:47.88-05	2017-07-08 19:23:47.88-05	Toughness	/assets/svgs/powers/toughness.svg	68
357	weapon-oil	power	Restore group members and yourself to full combat readiness removing and gaining immunity to Attack Crowd Control effects for 5 seconds. Weapon Oil can be used while Suppressed.	/assets/images/powers/weapon-oil.png	Buff	Instant	Universal	16	Group	5	5	0	\N	\N	f	2017-07-08 19:23:47.88-05	2017-07-08 19:23:47.88-05	Weapon Oil	/assets/svgs/powers/weapon-oil.svg	45
358	suppression-shot	power	Shoot at a ground location dealing 93 - 126 + 109% Weapon Damage. Applies a Suppression effect to all hit.	/assets/images/powers/suppression-shot.png	Crowd Control	Ground Aimed	Energy	1	Area	0	5	35	\N	\N	f	2017-07-08 19:23:47.88-05	2017-07-08 19:23:47.88-05	Suppression Shot	/assets/svgs/powers/suppression-shot.svg	30
359	vicious-stomp	power	Stomp the ground in front of you, dealing 63 - 85 + 74% Weapon Damage. Applies a 50% movement speed reduction to all hit.	/assets/images/powers/vicious-stomp.png	Debuff	Instant	Rage	7	Cone	0	1	6	\N	\N	f	2017-07-08 19:23:47.88-05	2017-07-08 19:23:47.88-05	Vicious Stomp	/assets/svgs/powers/vicious-stomp.svg	24
364	uniform-leather	power	Increase your Attack Power by 350 when wearing a full set of Leather armor.	/assets/images/powers/uniform-leather.png	Passive	Passive	Universal	0	Self	0	0	0	\N	\N	f	2017-07-08 19:23:47.88-05	2017-07-08 19:23:47.88-05	Uniform Leather	/assets/svgs/powers/uniform-leather.svg	0
365	will-of-the-stoneborn	power	Fortify your defense increasing your Crushing armor and improving weapon efficiency.	/assets/images/powers/will-of-the-stoneborn.png	Buff	Instant	Universal	16	Self	30	1	5	\N	\N	f	2017-07-08 19:23:47.88-05	2017-07-08 19:23:47.88-05	Will of the Stoneborn	/assets/svgs/powers/will-of-the-stoneborn.svg	45
366	take-root	power	Standing still for 2 seconds increases Healing Bonus by 20% and Physical Mitigations by 5% until you move.	/assets/images/powers/take-root.png	Passive	Passive	Universal	0	Self	2	0	0	\N	\N	f	2017-07-08 19:23:47.88-05	2017-07-08 19:23:47.88-05	Take Root	/assets/svgs/powers/take-root.svg	0
367	you-shall-be-avenged	power	Increase your Attack Power when a group member dies.	/assets/images/powers/you-shall-be-avenged.png	Passive	Passive	Universal	0	Self	0	0	0	\N	\N	f	2017-07-08 19:23:47.88-05	2017-07-08 19:23:47.88-05	You Shall Be Avenged	/assets/svgs/powers/you-shall-be-avenged.svg	0
368	water-spirits	power	Summon and launch a Water Spirit forward which heals allies within 5m of the Water Spirit. Water Spirits last 20 seconds or 30 heals. Only heals each player a maximum of 5 times. Enemies hit by the Water Spirit suffer a 30% to Damage Bonus Fire for 20 seconds.	/assets/images/powers/water-spirits.png	Buff	Charged	Universal	46	Area	20	3	5	\N	\N	f	2017-07-08 19:23:47.88-05	2017-07-08 19:23:47.88-05	Water Spirits	/assets/svgs/powers/water-spirits.svg	25
369	saber-attack-3	power	Attack for 69 - 104 + 86% Weapon Damage.	/assets/images/powers/saber-attack-3.png	Melee Attack	Instant	Pip	0	Cone	0	1	5	\N	\N	t	2017-07-08 19:23:47.88-05	2017-07-08 19:23:47.88-05	Saber Attack 3	/assets/svgs/powers/saber-attack-3.svg	0
370	throw-illusion-shield	power	Throw an illusion shield and ricochet off multiple nearby enemies for 85 - 115 + 100% Weapon Damage.  THROW ILLUSION SHIELD will ricochet to as many as 2 with damage reduced by 30% each ricochet.	/assets/images/powers/throw-illusion-shield.png	Melee Attack	Instant	Universal	16	Cone	0	2	15	\N	\N	f	2017-07-08 19:23:47.88-05	2017-07-08 19:23:47.88-05	Throw Illusion Shield	/assets/svgs/powers/throw-illusion-shield.svg	9
371	vile-slash	power	Slash in front of you twice for 45 - 61 + 53% Weapon Damage. Applies an Armor Break to all hit, which reduces all Physical Mitigations by 20% for 15 seconds.	/assets/images/powers/vile-slash.png	Melee Attack	Instant	Energy	0	Cone	0	1	5	\N	\N	t	2017-07-08 19:23:47.88-05	2017-07-08 19:23:47.88-05	Vile Slash	/assets/svgs/powers/vile-slash.svg	0
372	throw-hurlbat	power	Throw a projectile forward, dealing 113 - 153 + 133% Weapon Damage as Piercing Damage. Applies a 50% movement speed reduction to those hit.	/assets/images/powers/throw-hurlbat.png	Ranged Attack	Instant	Rage	12	Reticle	1	1	0	\N	\N	f	2017-07-08 19:23:47.88-05	2017-07-08 19:23:47.88-05	Throw Hurlbat	/assets/svgs/powers/throw-hurlbat.svg	24
374	sacrifice	power	Sacrifice 55 Health for 15% Essence.	/assets/images/powers/sacrifice.png	Non-Aggressive	Instant	Essence	0	Self	0	1	0	\N	\N	f	2017-07-08 19:23:47.88-05	2017-07-08 19:23:47.88-05	Sacrifice	/assets/svgs/powers/sacrifice.svg	5
375	uniform-plate	power	Increase your Attack Power by 350 when wearing a full set of Plate armor.	/assets/images/powers/uniform-plate.png	Passive	Passive	Universal	0	Self	0	0	0	\N	\N	f	2017-07-08 19:23:47.88-05	2017-07-08 19:23:47.88-05	Uniform Plate	/assets/svgs/powers/uniform-plate.svg	0
1	alter-reality	power	Place a Heal Absorption shield on the target which absorbs incoming heals. In order to remove the shield the target must be healed for #buff_amount_1#. If the shield is not healed off before 15 seconds, it will explode dealing #min_damage_1# - #max_damage_1# damage to those nearby.	/assets/images/powers/alter-reality.png	Debuff	Instant	Universal	13	Self	15	1	15	\N	\N	f	2017-07-08 19:23:47.859-05	2017-07-08 19:23:47.859-05	Alter Reality	/assets/svgs/powers/alter-reality.svg	23
2	absolution	power	Absolve 3 targets of Sin for 145 - 218 + 181% Weapon Fire Damage. consuming all stacks and increasing damage per stack to a maximum of 284 - 426 + 355% Weapon Damage. If 5 stacks are consumed movement speed is reduced by 50% for 8 seconds.	/assets/images/powers/absolution.png	Debuff	Instant	Mana	110	Ray	0	1	40	\N	\N	f	2017-07-08 19:23:47.86-05	2017-07-08 19:23:47.86-05	Absolution	/assets/svgs/powers/absolution.svg	9
3	archers-stake	power	Create an Archer's Stake at the feet of the caster. The Stake grants 100 Attack Power to you as long as you are within 5m.	/assets/images/powers/archers-stake.png	Buff	Instant	Energy	131	Self	35	1	5	\N	\N	f	2017-07-08 19:23:47.86-05	2017-07-08 19:23:47.86-05	Archers Stake	/assets/svgs/powers/archers-stake.svg	45
377	will-o-wisps	power	Charge up and fling a Will o' Wisp to heal allies in a #range# area for 270 - 330 + 300% Weapon Damage.	/assets/images/powers/will-o-wisps.png	Non-Aggressive	Charged	Essence	63	Area	0	5	0	\N	\N	f	2017-07-08 19:23:47.88-05	2017-07-08 19:23:47.88-05	Will o' Wisps	/assets/svgs/powers/will-o-wisps.svg	25
384	wicked-winds	power	Launch a swirling maelstrom to fling enemies around and causing 193 - 290 + 242% Weapon Damage.	/assets/images/powers/wicked-winds.png	Ranged Attack	Instant	Essence	79	Reticle	0	5	0	\N	\N	t	2017-07-08 19:23:47.881-05	2017-07-08 19:23:47.881-05	Wicked Winds	/assets/svgs/powers/wicked-winds.svg	24
385	shrivel	power	Curse an enemy with Disease and Black Mantle, absorbing up to 500 points of Healing.  If Shrivel hits an Exposed enemy while they attack or use an ability, they are knocked down and take additional damage.	/assets/images/powers/shrivel.png	Debuff	Charged	Universal	13	Ray	0	1	30	\N	\N	f	2017-07-08 19:23:47.881-05	2017-07-08 19:23:47.881-05	Shrivel	/assets/svgs/powers/shrivel.svg	45
386	song-twisting	power	Singing 4 different songs with 6 seconds activates Pure Voice buff on you, which greatly increases the effects of the next song played.	/assets/images/powers/song-twisting.png	Passive	Passive	Universal	0	Self	6	0	0	\N	\N	f	2017-07-08 19:23:47.881-05	2017-07-08 19:23:47.881-05	Song Twisting	/assets/svgs/powers/song-twisting.svg	0
387	spin-step	power	Roll quickly in the current WASD direction.	/assets/images/powers/spin-step.png	Non-Aggressive	Instant	Energy	0	Self	0	1	0	\N	\N	f	2017-07-08 19:23:47.881-05	2017-07-08 19:23:47.881-05	Spin Step	/assets/svgs/powers/spin-step.svg	0
388	sustain	power	Grants 400% Lifesteal for 5 seconds to your attacks, which returns Health for all attacks that damage a Health pool.	/assets/images/powers/sustain.png	Ultimate	Instant	Energy	0	Self	0	1	0	\N	\N	f	2017-07-08 19:23:47.881-05	2017-07-08 19:23:47.881-05	Sustain	/assets/svgs/powers/sustain.svg	0
389	touch-of-rot	power	Your basic attacks apply a stacking Support Power debuff.	/assets/images/powers/touch-of-rot.png	Passive		Universal	0	Self	0	0	0	\N	\N	f	2017-07-08 19:23:47.881-05	2017-07-08 19:23:47.881-05	Touch of Rot	/assets/svgs/powers/touch-of-rot.svg	0
390	twin-surge	power	Slash in front of you with both blades dealing 57 - 77 + 67% Weapon Damage twice.	/assets/images/powers/twin-surge.png	Melee Attack	Instant	Energy	25	Cone	0	1	5	\N	\N	f	2017-07-08 19:23:47.881-05	2017-07-08 19:23:47.881-05	Twin Surge	/assets/svgs/powers/twin-surge.svg	5
391	uniform-mail	power	Increase your Attack Power by 350 when wearing a full set of Mail armor.	/assets/images/powers/uniform-mail.png	Passive	Passive	Universal	0	Self	0	0	0	\N	\N	f	2017-07-08 19:23:47.881-05	2017-07-08 19:23:47.881-05	Uniform Mail	/assets/svgs/powers/uniform-mail.svg	0
392	wee-one	power	Shrink the targeted area down to size, reducing Damage Bonus by 20% for 25 seconds.  This debuff stacks up to 3 times.	/assets/images/powers/wee-one.png	Debuff	Instant	Universal	14	Area	25	5	5	\N	\N	f	2017-07-08 19:23:47.881-05	2017-07-08 19:23:47.881-05	Wee One	/assets/svgs/powers/wee-one.svg	45
393	whirlwind	power	Spin around rapidly hitting nearby enemies multiple times for 24 - 29 + 26% Weapon Damage and causing them to Bleed for 18 -24 damage.	/assets/images/powers/whirlwind.png	Crowd Control	Instant	Fury	9	Sphere	0	5	5	\N	\N	t	2017-07-08 19:23:47.881-05	2017-07-08 19:23:47.881-05	Whirlwind	/assets/svgs/powers/whirlwind.svg	0
394	wild-charge	power	Charge forward while the input key is depressed, dealing 110 - 135 + 123% Weapon Damage to anything in your way.	/assets/images/powers/wild-charge.png	Melee Attack	Hold Channeled	N/A	21	Rectangle	0	1	12	\N	\N	f	2017-07-08 19:23:47.881-05	2017-07-08 19:23:47.881-05	Wild Charge	/assets/svgs/powers/wild-charge.svg	24
10	aegis-of-salvation	power	Attack causing 70 - 94 + 82% Weapon Damage.	/assets/images/powers/aegis-of-salvation.png	Buff	Instant	Universal	10	Cone	0	1	5	\N	\N	f	2017-07-08 19:23:47.86-05	2017-07-08 19:23:47.86-05	Aegis of Salvation	/assets/svgs/powers/aegis-of-salvation.svg	9
11	bellow-of-triumph	power	Shout colorful epithets healing yourself and an ally in front of you for 52 - 64 + 58% Weapon Damage over 8 seconds.	/assets/images/powers/bellow-of-triumph.png	Non-Aggressive	Instant	N/A	20	Rectangle	8	1	2	\N	\N	f	2017-07-08 19:23:47.86-05	2017-07-08 19:23:47.86-05	Bellow of Triumph	/assets/svgs/powers/bellow-of-triumph.svg	9
12	banshee-wail	power	Deal 30% more Damage to enemies below 30% Health.	/assets/images/powers/banshee-wail.png	Passive	Passive	Universal	0	Self	0	1	0	\N	\N	f	2017-07-08 19:23:47.86-05	2017-07-08 19:23:47.86-05	Banshee Wail	/assets/svgs/powers/banshee-wail.svg	0
13	banner-of-storms	power	Deploy a banner overriding the damage of all nearby group members to Electric and increasing their Electric Armor by 25.	/assets/images/powers/banner-of-storms.png	Buff	Instant	Universal	16	Area	0	5	15	\N	\N	f	2017-07-08 19:23:47.86-05	2017-07-08 19:23:47.86-05	Banner of Storms	/assets/svgs/powers/banner-of-storms.svg	23
23	blade-turning	power	Gain a Slashing damage immune Barrier for 15 seconds.	/assets/images/powers/blade-turning.png	Buff	Instant	Universal	16	Self	15	0	0	\N	\N	f	2017-07-08 19:23:47.86-05	2017-07-08 19:23:47.86-05	Blade Turning	/assets/svgs/powers/blade-turning.svg	45
30	brutal-strike	power	Attack in front of you for 144 - 195 + 170% Crushing Weapon Damage.	/assets/images/powers/brutal-strike.png	Melee Attack	Instant	Stamina	22	Cone	0	1	5	\N	\N	t	2017-07-08 19:23:47.86-05	2017-07-08 19:23:47.86-05	Brutal Strike	/assets/svgs/powers/brutal-strike.svg	9
31	blood-pact	power	Grants a Blood Pact for 15 seconds, which all powers to consume Hitpoints instead of their normal ressource type.	/assets/images/powers/blood-pact.png	Buff	Instant	Universal	16	Self	15	1	0	\N	\N	f	2017-07-08 19:23:47.86-05	2017-07-08 19:23:47.86-05	Blood Pact	/assets/svgs/powers/blood-pact.svg	45
32	cleave	power	Basic attacks hit one additional target.	/assets/images/powers/cleave.png	Passive	Passive	Universal	0	Self	0	0	0	\N	\N	f	2017-07-08 19:23:47.86-05	2017-07-08 19:23:47.86-05	Cleave	/assets/svgs/powers/cleave.svg	0
33	blight	power	Deploy a field causing each COALESCE LIFE orb to explode catasrophically for 86 - 120 + 108% Weapon Damage while COALESCE NATURE orbs explode for 90 to 136 + 113% Weapon Damage. Reduces Earth and Electric defenses by 20%.	/assets/images/powers/blight.png	Debuff	Instant	Essence	57	Area	0	5	10	\N	\N	f	2017-07-08 19:23:47.86-05	2017-07-08 19:23:47.86-05	Blight	/assets/svgs/powers/blight.svg	23
43	concentration	power	Standing still for 3 seconds restores Mana and Zealotry every second until you move.	/assets/images/powers/concentration.png	Passive	Passive	Universal	0	Self	3	0	0	\N	\N	f	2017-07-08 19:23:47.861-05	2017-07-08 19:23:47.861-05	Concentration	/assets/svgs/powers/concentration.svg	0
51	critical-dodge	power	Recover one Dodge when hitting critically.  This effect can occur twice in 45 seconds.	/assets/images/powers/critical-dodge.png	Passive	Passive	Universal	0	Self	0	0	0	\N	\N	f	2017-07-08 19:23:47.861-05	2017-07-08 19:23:47.861-05	Critical Dodge	/assets/svgs/powers/critical-dodge.svg	0
52	cast-net	power	Fling a net at your target rooting them in place and inflicting 83 - 102 + 93% Weapon Damage.	/assets/images/powers/cast-net.png	Crowd Control	Instant	Fury	17	Reticle	0	1	30	\N	\N	f	2017-07-08 19:23:47.868-05	2017-07-08 19:23:47.868-05	Cast Net	/assets/svgs/powers/cast-net.svg	9
53	coalesce-life-2	power	Manifest an Orb at your targeted location that allies or you may use to heal 97 to 119 + 108% Weapon Damage.	/assets/images/powers/coalesce-life-2.png	Non-Aggressive	Instant	Essence	46	Area	0	1	0	\N	\N	t	2017-07-08 19:23:47.868-05	2017-07-08 19:23:47.868-05	Coalesce Life 2	/assets/svgs/powers/coalesce-life-2.svg	0
70	coalesce-life	power	Manifest an Orb at your targeted location that allies or you may use to heal 97 to 119 + 108% Weapon Damage.	/assets/images/powers/coalesce-life.png	Non-Aggressive	Instant	Essence	46	Area	0	1	0	\N	\N	f	2017-07-08 19:23:47.869-05	2017-07-08 19:23:47.869-05	Coalesce Life	/assets/svgs/powers/coalesce-life.svg	0
71	cancel-combo-myrmidon	power	Cancels the current combo power being executed.	/assets/images/powers/cancel-combo-myrmidon.png	Non-Aggressive	Instant	Fury	0	Self	0	1	0	\N	\N	t	2017-07-08 19:23:47.869-05	2017-07-08 19:23:47.869-05	Cancel Combo (Myrmidon)	/assets/svgs/powers/cancel-combo-myrmidon.svg	0
72	disengage	power	Leap backwards dealing 244 - 331 + 287% Weapon Damage. Places your Power Tray into Ranged Mode.	/assets/images/powers/disengage.png	Non-Aggressive	Instant	Energy	100	Cone	0	1	5	\N	\N	t	2017-07-08 19:23:47.869-05	2017-07-08 19:23:47.869-05	Disengage	/assets/svgs/powers/disengage.svg	45
73	critical-hack	power	Slash an enemy for 131-177 +154% Weapon Damage.	/assets/images/powers/critical-hack.png	Melee Attack	Instant	Universal	18	Cone	0	5	5	\N	\N	f	2017-07-08 19:23:47.869-05	2017-07-08 19:23:47.869-05	Critical Hack	/assets/svgs/powers/critical-hack.svg	9
83	fervor	power	Restores 350 Mana over five seconds as you channel. While channeling your physical mitigations are reduced by 15%.	/assets/images/powers/fervor.png	Non-Aggressive	Channeled	Mana	0	Self	5	5	0	\N	\N	f	2017-07-08 19:23:47.869-05	2017-07-08 19:23:47.869-05	Fervor	/assets/svgs/powers/fervor.svg	0
90	dispel	power	Strip away an enemy's Barrier inflicting 91 - 123 + 107% Weapon Damage and causing Knockdown if a Barrier is removed.	/assets/images/powers/dispel.png	Debuff	Instant	Universal	13	Reticle	0	5	15	\N	\N	f	2017-07-08 19:23:47.869-05	2017-07-08 19:23:47.869-05	Dispel	/assets/svgs/powers/dispel.svg	9
91	fire-wave	power	Consumes your Hellfire Shield and transforms it into a fiery wave, which move forward and damages all who are struck by it for 87 - 130 + 109% Weapon Damage.	/assets/images/powers/fire-wave.png	Ranged Attack	Instant	Mana	60	Rectange	0	5	18	\N	\N	t	2017-07-08 19:23:47.869-05	2017-07-08 19:23:47.869-05	Fire Wave	/assets/svgs/powers/fire-wave.svg	24
92	dagger-spin	power	Spin in place and deal 41 - 55 + 48% Weapon Damage around you. Also increases your Lifesteal Bonus by 60% while executing this power.	/assets/images/powers/dagger-spin.png	Melee Attack	Instant	Energy	34	Sphere	0	5	6	\N	\N	f	2017-07-08 19:23:47.869-05	2017-07-08 19:23:47.869-05	Dagger Spin	/assets/svgs/powers/dagger-spin.svg	5
93	execute	power	Slash without remorse dealing 135 - 202 + 168% Weapon Damage. Enemies under 35% health are critically hit for 202 - 300 + 167% Weapon Damage.	/assets/images/powers/execute.png	Melee Attack	Instant	Pips	1	Cone	0	1	5	\N	\N	t	2017-07-08 19:23:47.869-05	2017-07-08 19:23:47.869-05	Execute	/assets/svgs/powers/execute.svg	0
100	death-throws	power	Furiously knock down nearby enemies when you use a Retaliate ability if your Health is under 50%	/assets/images/powers/death-throws.png	Passive	Passive	Universal	16	Self	0	1	0	\N	\N	f	2017-07-08 19:23:47.87-05	2017-07-08 19:23:47.87-05	Death Throws	/assets/svgs/powers/death-throws.svg	0
102	critical-hack-2	power	Strike an enemy twice for 87-118 +103% Weapon Damage and increase your Critical Hit Chance	/assets/images/powers/critical-hack-2.png	Buff	Instant	Universal	10	Cone	15	5	5	\N	\N	f	2017-07-08 19:23:47.87-05	2017-07-08 19:23:47.87-05	Critical Hack 2	/assets/svgs/powers/critical-hack-2.svg	23
120	furious	power	Whenever you reach 100 Rage, your Damage Bonus is increased by 15% for 15 seconds.	/assets/images/powers/furious.png	Passive	Passive	Universal	0	Self	15	1	0	\N	\N	f	2017-07-08 19:23:47.871-05	2017-07-08 19:23:47.871-05	Furious	/assets/svgs/powers/furious.svg	0
25	benediction	power	Benediction Bless group members and yourself increasing Bleed Armor by 50 for 30 seconds.	/assets/images/powers/benediction.png	Buff	Instant	Universal	12	Group	30	5	0	\N	\N	f	2017-07-08 19:23:47.86-05	2017-07-08 19:23:47.86-05	Benediction	/assets/svgs/powers/benediction.svg	45
45	cancel-combo-champion	power	Cancels the current combo power being executed.	/assets/images/powers/cancel-combo-champion.png	Non-Aggressive	Instant	Rage	0	Self	0	1	0	\N	\N	t	2017-07-08 19:23:47.861-05	2017-07-08 19:23:47.861-05	Cancel Combo (Champion)	/assets/svgs/powers/cancel-combo-champion.svg	0
134	enter-burrow	power	Tunnel underground to avoid detection and gain access to new abilities. Taking damage forces you out of your Burrow.	/assets/images/powers/enter-burrow.png	Transformation	Instant	Pip	0	Self	0	1	0	\N	\N	f	2017-07-08 19:23:47.872-05	2017-07-08 19:23:47.872-05	Enter Burrow	/assets/svgs/powers/enter-burrow.svg	0
154	holy-warrior	power	Simmer with Radiance temporarily increasing your maximum Health. All damage inflicted is considered Holy and cannot be mitigated with armor. Zealotry is earned by participating in combat and striking with Righteous Parry.	/assets/images/powers/holy-warrior.png	Transformation	Instant	Pips	1000	Self	30	1	0	\N	\N	f	2017-07-08 19:23:47.873-05	2017-07-08 19:23:47.873-05	Holy Warrior	/assets/svgs/powers/holy-warrior.svg	45
245	relentless-cleric	power	You no longer degenerate Rage. Instead, you generate 1.5 Rage every 1 second while in Combat.	/assets/images/powers/relentless-cleric.png	Passive	Passive	N/A	0	Self	0	1	0	\N	\N	f	2017-07-08 19:23:47.877-05	2017-07-08 19:23:47.877-05	Relentless (Cleric)	/assets/svgs/powers/relentless-cleric.svg	0
265	righteous-smash	power	Spin with an overhead chop hitting multiple enemies for 117 - 176 + 146% Weapon Damage and generating Righteousness for each hit.	/assets/images/powers/righteous-smash.png	Melee Attack	Instant	Pips	0	Cone	0	5	5	\N	\N	t	2017-07-08 19:23:47.878-05	2017-07-08 19:23:47.878-05	Righteous Smash	/assets/svgs/powers/righteous-smash.svg	0
355	tear-reality	power	Tear Reality 8m around you every 3 seconds for 9 seconds, all targets hit have all powers with an active cooldown increased by 3 seconds.	/assets/images/powers/tear-reality.png	Debuff	Instant	Universal	13	Self	9	1	8	\N	\N	f	2017-07-08 19:23:47.88-05	2017-07-08 19:23:47.88-05	Tear Reality	/assets/svgs/powers/tear-reality.svg	45
26	bark-skin	power	Toughen the hide of group members and yourself applying Barrier for 20 seconds preventing 175 to 325 damage.	/assets/images/powers/bark-skin.png	Buff	Instant	Essence	35	Group	20	5	0	\N	\N	f	2017-07-08 19:23:47.86-05	2017-07-08 19:23:47.86-05	Bark Skin	/assets/svgs/powers/bark-skin.svg	23
29	berserker-strength	power	Attacks have a chance to increase Attack Power by 150 and add a protective Barrier.	/assets/images/powers/berserker-strength.png	Passive	Passive	Universal	0	Self	0	0	0	\N	\N	f	2017-07-08 19:23:47.86-05	2017-07-08 19:23:47.86-05	Berserker Strength	/assets/svgs/powers/berserker-strength.svg	0
46	careful-aim	power	Increase your Critical Hit Chance while standing still.	/assets/images/powers/careful-aim.png	Passive	Passive	Universal	0	Self	0	0	0	\N	\N	f	2017-07-08 19:23:47.861-05	2017-07-08 19:23:47.861-05	Careful Aim	/assets/svgs/powers/careful-aim.svg	0
69	cross-slash	power	Slash in front of you for 35 - 47 + 41% Weapon Damage. Applies a Moderate Bleed effect.	/assets/images/powers/cross-slash.png	Debuff	Instant	Energy	31	Cone	0	1	5	\N	\N	f	2017-07-08 19:23:47.869-05	2017-07-08 19:23:47.869-05	Cross Slash	/assets/svgs/powers/cross-slash.svg	9
135	finery	power	Each piece of Epic or Legendary quality armor equipped increases Damage Bonus and Healing Bonus by 2%.	/assets/images/powers/finery.png	Passive	Passive	Universal	0	Self	0	1	0	\N	\N	f	2017-07-08 19:23:47.872-05	2017-07-08 19:23:47.872-05	Finery	/assets/svgs/powers/finery.svg	0
138	gore	power	Strike overhead with both axes before continuing the carnage with a second bloody slice, inflicting 63 - 77 + 70% Weapon Damage for each hit. If you connect, recover 5 Fury per second for 20 seconds.	/assets/images/powers/gore.png	Buff	Instant	Fury	23	Cone	20	1	5	\N	\N	t	2017-07-08 19:23:47.873-05	2017-07-08 19:23:47.873-05	Gore	/assets/svgs/powers/gore.svg	0
155	lament-of-sadness	power	Sing for 12 seconds, affecting up to 5 enemies within 10m. Decreases their Attack Power by 150 as well as Support Power by 150. Type 4 Song.	/assets/images/powers/lament-of-sadness.png	Debuff	Toggle	Universal	32	Point Blank Area	12	5	10	\N	\N	f	2017-07-08 19:23:47.873-05	2017-07-08 19:23:47.873-05	Lament of Sadness	/assets/svgs/powers/lament-of-sadness.svg	1
178	judgement	power	Strike mercillessly inflict 89 - 133 + 111% Weapon Damage. Enemies under 35% health are critically hit for 133 - 200 + 167% Weapon Damage.	/assets/images/powers/judgement.png	Melee Attack	Instant	Pips	1	Cone	0	1	5	\N	\N	f	2017-07-08 19:23:47.873-05	2017-07-08 19:23:47.873-05	Judgement	/assets/svgs/powers/judgement.svg	0
228	matching-plate	power	Increase your Support Power by 350 when wearing a full set of Plate armor.	/assets/images/powers/matching-plate.png	Passive	Passive	Universal	0	Self	0	0	0	\N	\N	f	2017-07-08 19:23:47.877-05	2017-07-08 19:23:47.877-05	Matching Plate	/assets/svgs/powers/matching-plate.svg	0
249	reflect-heat	power	Reflects 50% Fire Weapon Damage back to the source of a Fire damage attack.	/assets/images/powers/reflect-heat.png	Buff	Instant	Universal	6	Self	0	1	0	\N	\N	f	2017-07-08 19:23:47.877-05	2017-07-08 19:23:47.877-05	Reflect Heat	/assets/svgs/powers/reflect-heat.svg	45
289	shockwave	power	Attack and knock down enemies in front of you for 150 - 203 + 177% Crushing Weapon Damage.	/assets/images/powers/shockwave.png	Crowd Control	Instant	Stamina	22	Cone	0	3	5	\N	\N	t	2017-07-08 19:23:47.878-05	2017-07-08 19:23:47.878-05	Shockwave	/assets/svgs/powers/shockwave.svg	30
309	skullcracker	power	Strike an enemy with your mace for 68 - 92 + 80% Weapon Damage.	/assets/images/powers/skullcracker.png	Melee Attack	Instant	Universal	10	Cone	0	1	5	\N	\N	f	2017-07-08 19:23:47.879-05	2017-07-08 19:23:47.879-05	Skullcracker	/assets/svgs/powers/skullcracker.svg	9
339	supreme-element	power	Grants various effects based on type of incoming elemental damage. Incoming Fire damage heals you for 20% of the damage taken. Incoming Electric damage deals 10% of the damage back to the caster. Incoming Ice damage applies a stack of Phase Transition which grants Healing Modifier by 10% per stack. Maximum 3 stacks.	/assets/images/powers/supreme-element.png	Passive	Passive	Universal	0	Self	0	1	0	\N	\N	f	2017-07-08 19:23:47.88-05	2017-07-08 19:23:47.88-05	Supreme Element	/assets/svgs/powers/supreme-element.svg	0
356	ultimate-warrior	power	Harness your Hatred, growing in size and increasing Bonus Damage by 10%. This effect can stack twice.	/assets/images/powers/ultimate-warrior.png	Non-Aggressive	Instant	Rage	0	Self	0	1	0	\N	\N	f	2017-07-08 19:23:47.88-05	2017-07-08 19:23:47.88-05	Ultimate Warrior	/assets/svgs/powers/ultimate-warrior.svg	0
376	vision-of-the-all-father	power	Gain Immunity to Blind effects.	/assets/images/powers/vision-of-the-all-father.png	Passive	Passive	Universal	0	Self	0	0	0	\N	\N	f	2017-07-08 19:23:47.88-05	2017-07-08 19:23:47.88-05	Vision of the All Father	/assets/svgs/powers/vision-of-the-all-father.svg	0
379	vanish	power	Immediately dive into your Burrow becoming immune to damage and control effects for a short time and leaving an explosive decoy in your place that explodes for 213 - 320 + 267% Weapon Damage.	/assets/images/powers/vanish.png	Ultimate	Instant	Pip	0	Self	0	1	0	\N	\N	f	2017-07-08 19:23:47.88-05	2017-07-08 19:23:47.88-05	Vanish	/assets/svgs/powers/vanish.svg	9
44	careless-whisper	power	When you execute a Primary Attack which damages an enemy, you gain a stack of Whispers. If you gain 5 Whispers in 12 seconds, Empowered Whispers is applied, which increases your Critical Hit Chance by 20% and your Critical Damage by 35% for 6 seconds.	/assets/images/powers/careless-whisper.png	Passive	Passive	Universal	0	Self	6	1	0	\N	\N	f	2017-07-08 19:23:47.861-05	2017-07-08 19:23:47.861-05	Careless Whisper	/assets/svgs/powers/careless-whisper.svg	0
67	drive	power	Stab in front of you for 75 - 92 + 83% Weapon Damage as Piercing Damage. Applies a Weapon Break to all hit, which reduces all Damage they deal by 20% for 15 seconds.	/assets/images/powers/drive.png	Debuff	Instant	N/A	12	Cone	0	5	8	\N	\N	t	2017-07-08 19:23:47.869-05	2017-07-08 19:23:47.869-05	Drive	/assets/svgs/powers/drive.svg	23
68	crippling-stab	power	Stab an enemy for 48 - 64 + 56% Weapon Damage.	/assets/images/powers/crippling-stab.png	Melee Attack	Instant	Universal	7	Cone	0	1	5	\N	\N	f	2017-07-08 19:23:47.869-05	2017-07-08 19:23:47.869-05	Crippling Stab	/assets/svgs/powers/crippling-stab.svg	5
133	forced-confession	power	Consumes Flame of the Truth on your reticle target, which instantly exploded for 47 - 71 + 59% Weapon Damage, and stuns the target. Does nothing againts target without Flames of Truth.	/assets/images/powers/forced-confession.png	Crowd Control	Instant	Mana	55	Sphere	0	1	30	\N	\N	t	2017-07-08 19:23:47.872-05	2017-07-08 19:23:47.872-05	Forced Confession	/assets/svgs/powers/forced-confession.svg	30
153	hit-me	power	Irritate your ennemies by recovering Resource when they hit you with non-periodic damage.	/assets/images/powers/hit-me.png	Passive	Passive	Universal	0	Self	0	1	0	\N	\N	f	2017-07-08 19:23:47.873-05	2017-07-08 19:23:47.873-05	Hit Me	/assets/svgs/powers/hit-me.svg	0
176	net-pull	power	Pull your target toward you inflicting 95 - 116 + 106% Weapon Damage.	/assets/images/powers/net-pull.png	Crowd Control	Instant	Fury	17	Reticle	0	1	30	\N	\N	t	2017-07-08 19:23:47.873-05	2017-07-08 19:23:47.873-05	Net Pull	/assets/svgs/powers/net-pull.svg	0
177	leap-2	power	Leap forward, dealing 80 - 108 + 94% Weapon Damage as Crushing Damage as you land.	/assets/images/powers/leap-2.png	Melee Attack	Instant	Rage	0	Sphere	0	5	4	\N	\N	t	2017-07-08 19:23:47.873-05	2017-07-08 19:23:47.873-05	Leap 2	/assets/svgs/powers/leap-2.svg	0
223	obliterate	power	Attack and knock down enemies in front of you for 150 - 203 + 177% Crushing Weapon Damage.	/assets/images/powers/obliterate.png	Crowd Control	Instant	Stamina	10	Sphere	0	3	5	\N	\N	t	2017-07-08 19:23:47.876-05	2017-07-08 19:23:47.876-05	Obliterate	/assets/svgs/powers/obliterate.svg	24
244	pistol-shot-3	power	Shoot an enemy for 95 - 143 + 119% Weapon Damage while generating a Pip with a chance to reset the cooldown of Rapid Fire.	/assets/images/powers/pistol-shot-3.png	Debuff	Instant	Universal	18	Ray	0	1	15	\N	\N	t	2017-07-08 19:23:47.877-05	2017-07-08 19:23:47.877-05	Pistol Shot 3	/assets/svgs/powers/pistol-shot-3.svg	0
268	rehabilitation	power	Tend an ally's and your wounds relieving 53 + 53% Weapon Damage plus an additional 1.4 Health for every point of Stamina every two seconds for six seconds.	/assets/images/powers/rehabilitation.png	Non-Aggressive	Instant	Universal	16	Reticle	6	2	35	\N	\N	f	2017-07-08 19:23:47.878-05	2017-07-08 19:23:47.878-05	Rehabilitation	/assets/svgs/powers/rehabilitation.svg	9
287	sinister-slash	power	Slash in front of you twice for 37 - 51 + 44% Weapon Damage. Applies an Armor Crack to all hit, which reduces all Physical Mitigations by 5% for 15 seconds.	/assets/images/powers/sinister-slash.png	Melee Attack	Instant	Energy	0	Cone	0	1	5	\N	\N	f	2017-07-08 19:23:47.878-05	2017-07-08 19:23:47.878-05	Sinister Slash	/assets/svgs/powers/sinister-slash.svg	0
288	saber-attack-1	power	Attack for 41 - 61 + 51% Weapon Damage.	/assets/images/powers/saber-attack-1.png	Melee Attack	Instant	Pip	0	Cone	0	1	5	\N	\N	f	2017-07-08 19:23:47.878-05	2017-07-08 19:23:47.878-05	Saber Attack 1	/assets/svgs/powers/saber-attack-1.svg	0
318	shield-breaker	power	Crush an enemy who is actively using Block or Parry causing a Knockdown and dealing 91 - 123 + 107% Weapon Damage.	/assets/images/powers/shield-breaker.png	Debuff	Instant	Universal	13	Reticle	0	5	15	\N	\N	f	2017-07-08 19:23:47.879-05	2017-07-08 19:23:47.879-05	Shield Breaker	/assets/svgs/powers/shield-breaker.svg	9
354	retaliate-templar	power	Jump to your feet, damaging all nearby enemies for 53 - 80 + 67% Weapon Damage. Retaliating an enemy afflictd with Sin reduces cooldown of RETALIATE.	/assets/images/powers/retaliate-templar.png	Retaliate	Instant	Pips	0	Cone	0	5	5	\N	\N	f	2017-07-08 19:23:47.88-05	2017-07-08 19:23:47.88-05	Retaliate (Templar)	/assets/svgs/powers/retaliate-templar.svg	30
378	shield-bash	power	A follow-up shield attack Dazing, preventing Dodge and striking for 50 - 67 + 58% Crushing Weapon Damage. SHIELD BASH hits critically for 94 - 128 if used again with 5 seconds.  It is enabled after performing three consecutive basic attacks and when you fill your Block Meter.	/assets/images/powers/shield-bash.png	Crowd Control	Instant	Stamina	0	Sphere	5	1	5	\N	\N	f	2017-07-08 19:23:47.88-05	2017-07-08 19:23:47.88-05	Shield Bash	/assets/svgs/powers/shield-bash.svg	0
103	dazzling-blades	power	Disorient multiple enemies with an attack reducing their Critical Hit Chance by 40 for 15 seconds and inflicting 113 - 153 + 133% Weapon Damage.	/assets/images/powers/dazzling-blades.png	Debuff	Instant	Universal	16	Cone	0	3	5	\N	\N	f	2017-07-08 19:23:47.87-05	2017-07-08 19:23:47.87-05	Dazzling Blades	/assets/svgs/powers/dazzling-blades.svg	23
113	forest-step	power	Blink through the forest shadows forward and gain 50 Movement Speed for 3 seconds.	/assets/images/powers/forest-step.png	Movement	Instant	Energy	34	Self	3	1	0	\N	\N	f	2017-07-08 19:23:47.87-05	2017-07-08 19:23:47.87-05	Forest Step	/assets/svgs/powers/forest-step.svg	24
142	faith	power	Dropping under 35% Health automatically activates the effects of Holy Warrior. Activating Holy Warrior at the same time prevents death until the effect has ended.	/assets/images/powers/faith.png	Passive	Passive	Pips	0	Self	0	1	0	\N	\N	f	2017-07-08 19:23:47.873-05	2017-07-08 19:23:47.873-05	Faith	/assets/svgs/powers/faith.svg	0
162	hymn-of-restoration	power	Increases your groups In Combat Health Regen by 60 as well as Out of Combat Health Regen by 80 for 12 seconds. Type 3 Song.	/assets/images/powers/hymn-of-restoration.png	Buff	Toggle	Universal	0	Group	12	5	0	\N	\N	f	2017-07-08 19:23:47.873-05	2017-07-08 19:23:47.873-05	Hymn of Restoration	/assets/svgs/powers/hymn-of-restoration.svg	1
182	found-resources	power	Return to a minimum of two pips when entering stealth.	/assets/images/powers/found-resources.png	Passive	Passive	Universal	0	Self	0	1	0	\N	\N	f	2017-07-08 19:23:47.874-05	2017-07-08 19:23:47.874-05	Found Resources	/assets/svgs/powers/found-resources.svg	0
192	overwhelming-odds	power	Increase you All Mitigations by 20% when three or more enemies are within 10m.	/assets/images/powers/overwhelming-odds.png	Passive	Passive	Universal	0	Self	0	0	0	\N	\N	f	2017-07-08 19:23:47.874-05	2017-07-08 19:23:47.874-05	Overwhelming Odds	/assets/svgs/powers/overwhelming-odds.svg	0
202	lay-low	power	Take it easy tending to your wounds and recovering 32-39 + 35% Weapon Damage a second for 6 seconds while maintaining Stealth.	/assets/images/powers/lay-low.png	Non-Aggressive	Instant	Universal	16	Self	6	1	0	\N	\N	f	2017-07-08 19:23:47.874-05	2017-07-08 19:23:47.874-05	Lay Low	/assets/svgs/powers/lay-low.svg	23
212	inconceivable	power	Test your luck gaining between one and six buffs! Buff duration and your luck scale with Pips spent. Humiliations Galore: Every Pip generator earn and additional Pip. Bonetti's Defense: Adds 250 in Combat Health Regeneration. Capo Ferro: Gain a chance to attack twice with Saber Attack. Prepare to Die: Increase damage by 9%.  Agrippa: Increase Critial Hit Chance by 9%. Thibault: Increase Critial Hit Amount by 19%.	/assets/images/powers/inconceivable.png	Buff	Instant	Pip	1	Self	0	1	0	\N	\N	f	2017-07-08 19:23:47.876-05	2017-07-08 19:23:47.876-05	Inconceivable!	/assets/svgs/powers/inconceivable.svg	0
222	natural-bond	power	Buffs Damage Bonus by 5% for group members and yourself for 45 seconds.	/assets/images/powers/natural-bond.png	Buff	Instant	Essence	18	Group	45	5	0	\N	\N	t	2017-07-08 19:23:47.876-05	2017-07-08 19:23:47.876-05	Natural Bond	/assets/svgs/powers/natural-bond.svg	5
232	rallying-cry	power	Instantly Heal up to 5 group members and yourself for 563 - 688. Applies Rally to group members which increases Critical Hit Change by 15%.	/assets/images/powers/rallying-cry.png	Ultimate	Instant	N/A	0	Group	0	5	0	\N	\N	f	2017-07-08 19:23:47.877-05	2017-07-08 19:23:47.877-05	Rallying Cry	/assets/svgs/powers/rallying-cry.svg	0
253	requiem	power	Sing for 12 seconds, affecting up to 5 enemies within 10m. Increases their Damage Taken by 15%. Type 2 Song.	/assets/images/powers/requiem.png	Debuff	Toggle	Universal	32	Point Blank Area	12	5	10	\N	\N	f	2017-07-08 19:23:47.878-05	2017-07-08 19:23:47.878-05	Requiem	/assets/svgs/powers/requiem.svg	1
273	shield-glare	power	Smash an enemy if the face for 110 - 148 + 129% Weapon Damage.	/assets/images/powers/shield-glare.png	Melee Attack	Instant	Universal	15	Cone	0	1	5	\N	\N	f	2017-07-08 19:23:47.878-05	2017-07-08 19:23:47.878-05	Shield Glare	/assets/svgs/powers/shield-glare.svg	9
283	right-slash	power	Attack with your right weapon for 3 - 4 + 4% Weapon Damage.	/assets/images/powers/right-slash.png	Melee Attack	Instant	Fury	17	Cone	0	1	5	\N	\N	f	2017-07-08 19:23:47.878-05	2017-07-08 19:23:47.878-05	Right Slash	/assets/svgs/powers/right-slash.svg	0
293	ruby-slash	power	A basic attack slashing in front of you for 60 - 82 + 71% Weapon Damage. Scoring three or more consecutive basic attack hits activates SHIELD BASH.	/assets/images/powers/ruby-slash.png	Melee Attack	Instant	Stamina	0	Cone	0	1	5	\N	\N	f	2017-07-08 19:23:47.878-05	2017-07-08 19:23:47.878-05	Ruby Slash	/assets/svgs/powers/ruby-slash.svg	0
313	spirit-whip	power	Melee Basic attacks now whip to additional targets with #range#.  Each time the Spirit whips is deals less damage.  50% for the first whip and 25% for the second.	/assets/images/powers/spirit-whip.png	Passive	Passive	Universal	0	Self	0	0	0	\N	\N	f	2017-07-08 19:23:47.879-05	2017-07-08 19:23:47.879-05	Spirit Whip	/assets/svgs/powers/spirit-whip.svg	0
323	stars-align	power	Invoke forces of death increasing your Damage Bonus by 30% and reducing Weapon Resource Cost for 20 seconds.	/assets/images/powers/stars-align.png	Buff	Instant	Universal	16	Self	20	5	0	\N	\N	f	2017-07-08 19:23:47.879-05	2017-07-08 19:23:47.879-05	Stars Align	/assets/svgs/powers/stars-align.svg	45
333	sunder-armor	power	Swipe in front of you twice for 49 - 59 + 54% Weapon Damage. Applies an Armor Break to all hit,, which reduces all Physical Mitigations by 20% for 15 seconds.	/assets/images/powers/sunder-armor.png	Debuff	Instant	N/A	8	Cone	0	5	7	\N	\N	t	2017-07-08 19:23:47.88-05	2017-07-08 19:23:47.88-05	Sunder Armor	/assets/svgs/powers/sunder-armor.svg	45
343	underdog	power	Come back even stronger after suffering a Knockdown or Stun with your Attack Power increasing by 300 for 30 seconds. This effect can stack with itself.	/assets/images/powers/underdog.png	Passive	Passive	Universal	16	Self	30	1	0	\N	\N	f	2017-07-08 19:23:47.88-05	2017-07-08 19:23:47.88-05	Underdog	/assets/svgs/powers/underdog.svg	0
363	tendon-slice	power	Slash in front of you for 134 - 181 - 158% Weapon Damage. Applies a 50% movement reduction to the target.	/assets/images/powers/tendon-slice.png	Debuff	Instant	Energy	22	Cone	0	1	5	\N	\N	t	2017-07-08 19:23:47.88-05	2017-07-08 19:23:47.88-05	Tendon Slice	/assets/svgs/powers/tendon-slice.svg	24
373	wicked-slash	power	Slash in front of you twice for 50 - 68 + 59% Weapon Damage. Applies an Armor Fracture to all hit, which reduces all Physical Mitigations by 10% for 15 seconds.	/assets/images/powers/wicked-slash.png	Melee Attack	Instant	Energy	0	Cone	0	1	5	\N	\N	t	2017-07-08 19:23:47.88-05	2017-07-08 19:23:47.88-05	Wicked Slash	/assets/svgs/powers/wicked-slash.svg	0
383	warp-metal	power	Curse an enemy with a destructive aura increasing Resource Cost for each Slashing damage attack they commit.	/assets/images/powers/warp-metal.png	Debuff	Instant	Universal	16	Ray	8	1	15	\N	\N	f	2017-07-08 19:23:47.881-05	2017-07-08 19:23:47.881-05	Warp Metal	/assets/svgs/powers/warp-metal.svg	30
111	devotion	power	Recite a benediction healing group members and you based on the damage you inflict and revealing Sin within enemies attacked for 15 seconds.	/assets/images/powers/devotion.png	Buff	Instant	Pips	1	Group	15	5	0	\N	\N	f	2017-07-08 19:23:47.87-05	2017-07-08 19:23:47.87-05	Devotion	/assets/svgs/powers/devotion.svg	23
121	fountain-of-life	power	Creates a Fountain of Life at the targetted location, which chain heals allies who walk near it. The fountain lasts 10 seconds or 30 heals.	/assets/images/powers/fountain-of-life.png	Buff	Instant	Universal	46	Area	10	4	35	\N	\N	f	2017-07-08 19:23:47.871-05	2017-07-08 19:23:47.871-05	Fountain of Life	/assets/svgs/powers/fountain-of-life.svg	20
140	emerald-slash	power	A basic attack slashing in front of you for 86 - 117 + 101% Weapon Damage. Scoring three or more consecutive basic attack hits activates SHIELD BASH.	/assets/images/powers/emerald-slash.png	Melee Attack	Instant	Stamina	0	Cone	0	1	5	\N	\N	t	2017-07-08 19:23:47.873-05	2017-07-08 19:23:47.873-05	Emerald Slash	/assets/svgs/powers/emerald-slash.svg	0
160	minor-accompaniment	power	Increase your Song Damage by 20%.	/assets/images/powers/minor-accompaniment.png	Passive	Passive	Universal	0	Self	0	0	0	\N	\N	f	2017-07-08 19:23:47.873-05	2017-07-08 19:23:47.873-05	Minor Accompaniment	/assets/svgs/powers/minor-accompaniment.svg	0
180	gleeful-strike	power	While in Melee Mode all critical hits you land have a chance to restore Energy.	/assets/images/powers/gleeful-strike.png	Passive	Passive	Energy	0	Self	0	1	0	\N	\N	f	2017-07-08 19:23:47.873-05	2017-07-08 19:23:47.873-05	Gleeful Strike	/assets/svgs/powers/gleeful-strike.svg	0
200	payback	power	Get even with your opponents after using a Retaliate ability by increasing your Critical Hit Chance by 50 for 30 seconds or until you crit three times.	/assets/images/powers/payback.png	Buff	Passive	Universal	16	Self	30	1	0	\N	\N	f	2017-07-08 19:23:47.874-05	2017-07-08 19:23:47.874-05	Payback	/assets/svgs/powers/payback.svg	0
210	leap	power	Leap forward, dealing 65 - 88 + 77% Weapon Damage as Crushing Damage as you land. Briefly able to perform a second Leap for zero resource cost.	/assets/images/powers/leap.png	Melee Attack	Instant	Rage	0	Sphere	0	5	4	\N	\N	f	2017-07-08 19:23:47.876-05	2017-07-08 19:23:47.876-05	Leap	/assets/svgs/powers/leap.svg	23
230	natures-avatar	power	Empowers an ally with a 75% Damage Bonus buff while you channel.	/assets/images/powers/natures-avatar.png	Buff	Charged	Essence	35	Reticle	0	1	0	\N	\N	f	2017-07-08 19:23:47.877-05	2017-07-08 19:23:47.877-05	Nature's Avatar	/assets/svgs/powers/natures-avatar.svg	0
251	pursuit	power	Charge forward striking with your shield, dealing 77 - 105 + 91% Crushing Weapon Damage and stunning the closest enemy.	/assets/images/powers/pursuit.png	Crowd Control	Instant	Stamina	29	Reticle	0	3	7	\N	\N	f	2017-07-08 19:23:47.878-05	2017-07-08 19:23:47.878-05	Pursuit	/assets/svgs/powers/pursuit.svg	30
271	shadows-caress	power	Increase your Health Regeneration by 350 while in Stealth.	/assets/images/powers/shadows-caress.png	Passive	Passive	Universal	0	Self	0	0	0	\N	\N	f	2017-07-08 19:23:47.878-05	2017-07-08 19:23:47.878-05	Shadows Caress	/assets/svgs/powers/shadows-caress.svg	0
291	righteousness	power	Adds a chance to restore Mana when you deal damage to others. Also buffs Damage Bonus by 5% for 15 seconds whenever you hit reach maximum Zealotry.	/assets/images/powers/righteousness.png	Passive	Passive	Mana	0	Self	15	1	0	\N	\N	f	2017-07-08 19:23:47.878-05	2017-07-08 19:23:47.878-05	Righteousness	/assets/svgs/powers/righteousness.svg	0
311	straight-shot	power	Shoot and arrow towards your reticle that deals 227 - 307 + 267% Weapon Damage.	/assets/images/powers/straight-shot.png	Ranged Attack	Charged	Energy	0	Reticle	0	1	40	\N	\N	f	2017-07-08 19:23:47.879-05	2017-07-08 19:23:47.879-05	Straight Shot	/assets/svgs/powers/straight-shot.svg	0
321	spite	power	Seethe dangerously each time you suffer a Knockdown or Stun and recover 4 - 6% of your maximum Health over 5 seconds.	/assets/images/powers/spite.png	Passive	Passive	Universal	0	Self	5	1	0	\N	\N	f	2017-07-08 19:23:47.879-05	2017-07-08 19:23:47.879-05	Spite	/assets/svgs/powers/spite.svg	0
341	sword-ward	power	Enchant your armor with a ward against Slashing attacks increasing your Slashing Armor by 25.  Slashing attacks cause Sword Ward to slowly weaken temporarily.	/assets/images/powers/sword-ward.png	Passive	Passive	Universal	16	Self	0	0	0	\N	\N	f	2017-07-08 19:23:47.88-05	2017-07-08 19:23:47.88-05	Sword Ward	/assets/svgs/powers/sword-ward.svg	0
361	uppercut	power	Swipe in front of you for 121 - 148 + 134% Weapon Damage.	/assets/images/powers/uppercut.png	Melee Attack	Instant	N/A	11	Cone	0	1	6	\N	\N	t	2017-07-08 19:23:47.88-05	2017-07-08 19:23:47.88-05	Uppercut	/assets/svgs/powers/uppercut.svg	9
381	whirling-leap	power	Leap into the air creating a vacuum at your feet, which pulls in nearby enemies and damages them for 232 - 314 + 273% Crushing Weapon Damage. While in the air you are invulnerable to physics impulses and damage effects.	/assets/images/powers/whirling-leap.png	Ultimate	Instant	Stamina	0	Sphere	0	5	8	\N	\N	f	2017-07-08 19:23:47.88-05	2017-07-08 19:23:47.88-05	Whirling Leap	/assets/svgs/powers/whirling-leap.svg	5
112	fortuitous-blessings	power	Have faith and recieve the blessing you need.  Your actions determine whether you receive the Seeker's Blessing for movement speed, Charitable Blessing for Support Power or Impoverished Blessing for restoring your resource over time.	/assets/images/powers/fortuitous-blessings.png	Passive	Passive	Universal	0	Self	0	1	0	\N	\N	f	2017-07-08 19:23:47.87-05	2017-07-08 19:23:47.87-05	Fortuitous Blessings	/assets/svgs/powers/fortuitous-blessings.svg	0
122	ghost-army	power	Call forth a Ghost Army in front of you dealing 60-81 + 70% Weapon Damage to 5 per wave of the Army. 50% of the Damage dealt will be returned to you as Health.	/assets/images/powers/ghost-army.png	Ranged Attack	Hold Channeled	Universal	16	Rectangle	0	5	0	\N	\N	f	2017-07-08 19:23:47.871-05	2017-07-08 19:23:47.871-05	Ghost Army	/assets/svgs/powers/ghost-army.svg	23
141	form-life	power	Manifest an Orb at your targeted location that allies or you may use to heal 97 to 119 + 108% Weapon Damage.	/assets/images/powers/form-life.png	Non-Aggressive	Instant	Universal	0	Area	0	1	35	\N	\N	f	2017-07-08 19:23:47.873-05	2017-07-08 19:23:47.873-05	Form Life	/assets/svgs/powers/form-life.svg	0
161	iron-skin	power	Harden your skin increasing your Slashing Armor and reducing Weapon Resource Cost.	/assets/images/powers/iron-skin.png	Melee Attack	Instant	Universal	12	Self	30	0	0	\N	\N	f	2017-07-08 19:23:47.873-05	2017-07-08 19:23:47.873-05	Iron Skin	/assets/svgs/powers/iron-skin.svg	45
181	great-swing-1	power	Attack for 48 - 72 + 60% Weapon Damage.	/assets/images/powers/great-swing-1.png	Melee Attack	Instant	Pips	0	Cone	0	1	5	\N	\N	f	2017-07-08 19:23:47.873-05	2017-07-08 19:23:47.873-05	Great Swing 1	/assets/svgs/powers/great-swing-1.svg	0
201	matching-leather	power	Increase your Support Power by 350 when wearing a full set of Leather armor.	/assets/images/powers/matching-leather.png	Passive	Passive	Universal	0	Self	0	0	0	\N	\N	f	2017-07-08 19:23:47.874-05	2017-07-08 19:23:47.874-05	Matching Leather	/assets/svgs/powers/matching-leather.svg	0
211	peripheral-vision	power	Allows you to see into the shadows while actively harvesting.	/assets/images/powers/peripheral-vision.png	Passive		Universal	0	Self	0	0	0	\N	\N	f	2017-07-08 19:23:47.876-05	2017-07-08 19:23:47.876-05	Peripheral Vision	/assets/svgs/powers/peripheral-vision.svg	0
221	pix-fix	power	All 'chain type' heals jump to 1 additional target.  Also reduces the amount of healing falloff per jump by 50%.	/assets/images/powers/pix-fix.png	Passive	Passive	Universal	0	Self	0	0	0	\N	\N	f	2017-07-08 19:23:47.876-05	2017-07-08 19:23:47.876-05	Pix Fix	/assets/svgs/powers/pix-fix.svg	0
231	poisoned-blade	power	Attack for 113 - 153 + 133% Weapon Damage and cause the enemy to become Poisoned taking 8 - 9 + 1% Weapon Damage per tick.	/assets/images/powers/poisoned-blade.png	Melee Attack	Instant	Universal	16	Cone	0	1	5	\N	\N	f	2017-07-08 19:23:47.877-05	2017-07-08 19:23:47.877-05	Poisoned Blade	/assets/svgs/powers/poisoned-blade.svg	9
252	prosecute	power	Convict an enemy causing damage based on their sin: 1 Sin or less: 68-92 + 80% Weapon Damage\n2 Sin: 131-177 + 154% Weapon Damage\n3 Sin: 199-270 + 235% Weapon Damage\n4 Sin: 274-370 + 322% Weapon Damage\n5 Sin: 354-478 + 416% Weapon Damage	/assets/images/powers/prosecute.png	Melee Attack	Instant	Universal	10	Cone	0	1	5	\N	\N	f	2017-07-08 19:23:47.878-05	2017-07-08 19:23:47.878-05	Prosecute	/assets/svgs/powers/prosecute.svg	0
272	resolution	power	Increase your Damage Bonus by 15% when three or more enemies are within 15m.	/assets/images/powers/resolution.png	Passive	Passive	Universal	0	Self	0	0	0	\N	\N	f	2017-07-08 19:23:47.878-05	2017-07-08 19:23:47.878-05	Resolution	/assets/svgs/powers/resolution.svg	0
292	restoration-strike-2	power	Strike an enemy for 117-159 + 138% Weapon Damage while restoring your Resource.	/assets/images/powers/restoration-strike-2.png	Melee Attack	Instant	Universal	13	Cone	0	1	5	\N	\N	t	2017-07-08 19:23:47.878-05	2017-07-08 19:23:47.878-05	Restoration Strike 2	/assets/svgs/powers/restoration-strike-2.svg	23
312	shadow-mantle	power	Attack: Reduce Healing Received	/assets/images/powers/shadow-mantle.png	Ranged Attack		Universal	0		0	0	0	\N	\N	f	2017-07-08 19:23:47.879-05	2017-07-08 19:23:47.879-05	Shadow Mantle	/assets/svgs/powers/shadow-mantle.svg	0
332	rupture-barrier	power	Cause an additional 50% Weapon Damage when striking a Barrier and restore your Resource.	/assets/images/powers/rupture-barrier.png	Passive	Passive	Universal	0	Self	0	1	0	\N	\N	f	2017-07-08 19:23:47.88-05	2017-07-08 19:23:47.88-05	Rupture Barrier	/assets/svgs/powers/rupture-barrier.svg	0
342	stormcaller	power	Forgoing access to Life abilities, your focus on Death allows you to generate Essence while in Combat.  In order to maintain balance, damaging enemies has a chance to Coalesce Life.	/assets/images/powers/stormcaller.png	Passive		Universal	0	Self	0	0	0	\N	\N	f	2017-07-08 19:23:47.88-05	2017-07-08 19:23:47.88-05	Stormcaller	/assets/svgs/powers/stormcaller.svg	0
362	reveal-weakness	power	Enhance group members and yourself increasing Physical Armor Penetration by 10.	/assets/images/powers/reveal-weakness.png	Buff	Instant	Universal	13	Group	30	5	0	\N	\N	f	2017-07-08 19:23:47.88-05	2017-07-08 19:23:47.88-05	Reveal Weakness	/assets/svgs/powers/reveal-weakness.svg	45
382	shield-swipe	power	Attack in front of you for 91 - 123 + 107% Crushing Weapon Damage.	/assets/images/powers/shield-swipe.png	Melee Attack	Instant	Stamina	18	Cone	0	1	5	\N	\N	f	2017-07-08 19:23:47.88-05	2017-07-08 19:23:47.88-05	Shield Swipe	/assets/svgs/powers/shield-swipe.svg	23
139	hellfire-shield	power	Surrounds your skin an a Hellfire Shield to 15 seconds damaging all who cause damage to your for 15 - 18 damage.	/assets/images/powers/hellfire-shield.png	Buff	Instant	Mana	55	Self	15	1	25	\N	\N	f	2017-07-08 19:23:47.873-05	2017-07-08 19:23:47.873-05	Hellfire Shield	/assets/svgs/powers/hellfire-shield.svg	9
159	great-swing-3	power	Attack for 74 - 111 + 93% Weapon Damage and generates a point of Righteousness.	/assets/images/powers/great-swing-3.png	Melee Attack	Instant	Pips	0	Cone	0	1	5	\N	\N	t	2017-07-08 19:23:47.873-05	2017-07-08 19:23:47.873-05	Great Swing 3	/assets/svgs/powers/great-swing-3.svg	0
179	lightning-strike	power	Strike enemies with lightning for 109 - 163 + 136% Weapon Damage and Dazing them.	/assets/images/powers/lightning-strike.png	Ranged Attack	Instant	Essence	46	Ray	0	5	35	\N	\N	t	2017-07-08 19:23:47.873-05	2017-07-08 19:23:47.873-05	Lightning Strike	/assets/svgs/powers/lightning-strike.svg	24
199	long-live-the-fighter	power	Your last Basic attack inflicts a Bleed.	/assets/images/powers/long-live-the-fighter.png	Passive		Universal	0	Self	0	0	0	\N	\N	f	2017-07-08 19:23:47.874-05	2017-07-08 19:23:47.874-05	Long Live the Fighter	/assets/svgs/powers/long-live-the-fighter.svg	0
229	poison-food	power	Coming Soon	/assets/images/powers/poison-food.png	Buff	Instant	Universal	0	Self	0	0	0	\N	\N	f	2017-07-08 19:23:47.877-05	2017-07-08 19:23:47.877-05	Poison Food	/assets/svgs/powers/poison-food.svg	0
250	muck-spatter	power	Crushing attacks made against you have a chance to cause nearby enemies to be afflicted with Blindness and Severe Corruption.	/assets/images/powers/muck-spatter.png	Debuff	Instant	Universal	16	Self	15	0	5	\N	\N	f	2017-07-08 19:23:47.877-05	2017-07-08 19:23:47.877-05	Muck Spatter	/assets/svgs/powers/muck-spatter.svg	30
270	retribution-slash	power	Turn the tables on enemies with a strike granting 20% Retribution for 15 seconds and causing 113 - 153 + 133% Weapon Damage.	/assets/images/powers/retribution-slash.png	Buff	Instant	Universal	16	Cone	15	1	5	\N	\N	f	2017-07-08 19:23:47.878-05	2017-07-08 19:23:47.878-05	Retribution Slash	/assets/svgs/powers/retribution-slash.svg	45
290	poisoned-weapons	power	All your Primary Attacks now deal Poison as their damage type.  In addition your final Primary attack deals an AoE poison damage to nearby enemies.	/assets/images/powers/poisoned-weapons.png	Passive	Passive	Universal	0	Self	0	0	0	\N	\N	f	2017-07-08 19:23:47.878-05	2017-07-08 19:23:47.878-05	Poisoned Weapons	/assets/svgs/powers/poisoned-weapons.svg	0
340	shield-stun	power	Attack and stune those in front of you for 105 - 142 + 124% Crushing Weapon Damage.	/assets/images/powers/shield-stun.png	Crowd Control	Instant	Stamina	18	Cone	0	1	5	\N	\N	t	2017-07-08 19:23:47.88-05	2017-07-08 19:23:47.88-05	Shield Stun	/assets/svgs/powers/shield-stun.svg	30
360	zealot-rush	power	Dash quickly in the current WASD direction.	/assets/images/powers/zealot-rush.png	Non-Aggressive	Instant	Mana	0	Self	0	1	25	\N	\N	f	2017-07-08 19:23:47.88-05	2017-07-08 19:23:47.88-05	Zealot Rush	/assets/svgs/powers/zealot-rush.svg	0
380	whirling-pain	power	Sweep 7 times around you dealing 59 - 79 + 69% Weapon Damage per swing. You may move while spinning.	/assets/images/powers/whirling-pain.png	Melee Attack	Instant	Rage	11	Sphere	0	5	4	\N	\N	t	2017-07-08 19:23:47.88-05	2017-07-08 19:23:47.88-05	Whirling Pain	/assets/svgs/powers/whirling-pain.svg	24
\.


--
-- Name: powers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: h3lix0
--

SELECT pg_catalog.setval('powers_id_seq', 394, true);


--
-- Data for Name: race_disciplines; Type: TABLE DATA; Schema: public; Owner: h3lix0
--

COPY race_disciplines (race_id, discipline_id) FROM stdin;
\.


--
-- Data for Name: race_tags; Type: TABLE DATA; Schema: public; Owner: h3lix0
--

COPY race_tags (race_id, tag_id) FROM stdin;
\.


--
-- Data for Name: races; Type: TABLE DATA; Schema: public; Owner: h3lix0
--

COPY races (id, data_type, slug, name, description, icon, created_at, updated_at, icon_svg) FROM stdin;
1	race	guinecean	Guinecean		/assets/images/races/guinecean.png	2017-07-12 17:47:55.743-05	2017-07-12 17:47:55.743-05	/assets/svgs/races/guinecean.svg
2	race	half-elf	Half-Elf		/assets/images/races/half-elf.png	2017-07-12 17:47:55.743-05	2017-07-12 17:47:55.743-05	/assets/svgs/races/half-elf.svg
3	race	high-elf	High-Elf		/assets/images/races/high-elf.png	2017-07-12 17:47:55.743-05	2017-07-12 17:47:55.743-05	/assets/svgs/races/high-elf.svg
4	race	centaur	Centaur		/assets/images/races/centaur.png	2017-07-12 17:47:55.743-05	2017-07-12 17:47:55.743-05	/assets/svgs/races/centaur.svg
5	race	half-giant	Half-Giant		/assets/images/races/half-giant.png	2017-07-12 17:47:55.743-05	2017-07-12 17:47:55.743-05	/assets/svgs/races/half-giant.svg
6	race	human	Human		/assets/images/races/human.png	2017-07-12 17:47:55.743-05	2017-07-12 17:47:55.743-05	/assets/svgs/races/human.svg
7	race	fae	Fae		/assets/images/races/fae.png	2017-07-12 17:47:55.743-05	2017-07-12 17:47:55.743-05	/assets/svgs/races/fae.svg
8	race	nethari	Nethari		/assets/images/races/nethari.png	2017-07-12 17:47:55.743-05	2017-07-12 17:47:55.743-05	/assets/svgs/races/nethari.svg
9	race	stoneborn	Stoneborn		/assets/images/races/stoneborn.png	2017-07-12 17:47:55.743-05	2017-07-12 17:47:55.743-05	/assets/svgs/races/stoneborn.svg
10	race	elken	Elken		/assets/images/races/elken.png	2017-07-12 17:47:55.743-05	2017-07-12 17:47:55.743-05	/assets/svgs/races/elken.svg
11	race	wood-elf	Wood-Elf		/assets/images/races/wood-elf.png	2017-07-12 17:47:55.743-05	2017-07-12 17:47:55.743-05	/assets/svgs/races/wood-elf.svg
12	race	minotaur	Minotaur		/assets/images/races/minotaur.png	2017-07-12 17:47:55.743-05	2017-07-12 17:47:55.743-05	/assets/svgs/races/minotaur.svg
\.


--
-- Name: races_id_seq; Type: SEQUENCE SET; Schema: public; Owner: h3lix0
--

SELECT pg_catalog.setval('races_id_seq', 12, true);


--
-- Data for Name: statistics; Type: TABLE DATA; Schema: public; Owner: h3lix0
--

COPY statistics (id, type) FROM stdin;
1	Elemental Mitigation
2	Resistance: Fire
3	Stealth
4	Organic Mitigation
5	Max Rage
6	Damage Bonus: Crushing
7	Healing Modifier
8	Distance Bonus
9	Physical Mitigations
10	Blocking Efficiency
11	Armor Pentration: Poison
12	Damage Bonus: Slashing
13	Mitigation: Slashing
14	Physical Mitigation
15	Perception
16	Dodge Regen Tick Rate
17	Resistance: Piercing
18	Armor Penetration: Slashing
19	Damage Modifier
20	Peripheral Vision
21	Song Duration
22	Enhanced Catch Your Breath
23	Enhanced Druid Orbs
24	Final Healing Modifier
25	Damage Bonus: Fire
26	Damage Bonus: Ice
27	Damage Bonus: Electricity
28	Armor Penetration: Crushing
29	Armor Penetration: Piercing
30	Damage Bonus: Piercing
31	Shield Throw: Bonus Ricochets
32	Shield Throw: Falloff Bonus
\.


--
-- Name: statistics_id_seq; Type: SEQUENCE SET; Schema: public; Owner: h3lix0
--

SELECT pg_catalog.setval('statistics_id_seq', 32, true);


--
-- Data for Name: tags; Type: TABLE DATA; Schema: public; Owner: h3lix0
--

COPY tags (id, tag) FROM stdin;
1	Heal
2	Sin
3	Movement Speed
4	Fire
5	Attack Power
6	Barrier
7	Exposed
8	Burrow
9	Electric
10	Stealth
11	Suppress
12	Reveal
13	Stun
14	Block
15	Slashing
16	Bleed
17	Chain
18	Crushing
19	Blind
20	Invulnerable
21	Root
22	Slow
23	Piercing
24	Moderate Bleed
25	Weapon Break
26	Lifesteal
27	Parry
28	Knock Down
29	Retaliate
30	Support Power
31	Righteousness
32	Burning
33	Perception
34	Mortal Strike
35	Health Regeneration
36	Poison
37	Black Mantle
38	Severe Bleed
39	Severe Corruption
40	Corruption
41	Retribution
42	Moderate Corruption
43	Armor Break
44	adjudicate
45	prosecute
46	glass-cannon
47	illusionary-armor
48	careless-whisper
49	blood-strike
50	dazzling-blades
51	retribution-strike
52	blood-price
53	caltrops
54	lay-low
55	stink-bomb
56	preparation
57	shadow-mantle
58	call-darkness
59	shadows-linger
60	banshee-wail
61	haunt
62	ghost-army
63	angel-of-death
64	executioner
65	tenderize
66	cauterize
67	long-live-the-fighter
68	song-of-speed
69	guardian-rhythms
70	hymn-of-restoration
71	verses-of-victory
72	explosive-thorns
73	burning-hatred
74	blood-pact
75	fire-eater
76	reflect-heat
77	conduction
78	last-resort
79	furious-slash
80	demolish-armor
81	berserker-strength
82	free-action
83	weapon-oil
84	speedy-retaliate
85	escapology
86	indulgence
87	benediction
88	chain-heal
89	fortuitous-blessings
90	shield-glare
91	basic-block
92	numbness
93	dig-in
94	aegis-of-salvation
95	insanity
96	frighten
97	relentless
98	furious
99	nova
100	piercing-orb
101	mana-shield
102	mind-revenge
103	mortal-sin
104	glamour-weapon
105	reveal-shadows
106	finery
107	pixie-dust
108	wee-one
109	pix-fix
110	form-life
111	blast-of-leaves
112	take-root
113	hit-me
114	skullcracker
115	reverberating-blow
116	will-of-the-stoneborn
117	critical-slice
118	cut-and-thrust
119	hamstring
120	punch-drunk
121	peripheral-vision
122	grabthars-hammer
123	battle-chant
124	suns-of-worvan
125	you-shall-be-avenged
126	runecarve-flesh
127	nothing-to-lose
128	first-wind
129	found-resources
130	purgative
131	rehabilitation
132	rescue
133	noble-purpose
134	pistol-shot
135	rapid-fire
136	critical-dodge
137	careful-aim
138	matching-leather
139	form-up
140	vision-of-the-all-father
141	poisoned-blade
142	mithradatism
143	poison-food
144	poisoned-weapons
145	matching-plate
146	furious-retaliate
147	unstoppable
148	spite
149	toughness
150	firewall
151	redemption
152	concentration
153	spirit-whip
154	uniform-mail
155	prickly-skin
156	protective-thorns
157	critical-hack
158	restoration-strike
159	iron-skin
160	grasping-roots
161	soothing-winds
162	stars-align
163	quick-burn
164	slow-growth
165	crippling-stab
166	slow-demise
167	steal-soul
168	banner-of-storms
169	rallying-banner
170	bearers-insignia
171	brutal-slam
172	throw-illusion-shield
173	mighty-shield-slam
174	molon-labe
175	minor-accompaniment
176	blade-turning
177	reflection
178	warp-metal
179	sword-ward
180	thornshield
181	clobber
182	restoration-smash
183	cleave
184	song-twisting
185	uniform-leather
186	jelly-skin
187	muck-spatter
188	remold
189	marshy-body
190	fountain-of-life
191	water-spirits
192	supreme-element
193	call-storm
194	grounding
195	stormcaller
196	uniform-plate
197	pound-of-flesh
198	matching-mail
199	rune-shield
200	fortification
201	sanctuary
202	heads-up
203	flare
204	get-em
205	revenge
206	overwhelming-odds
207	aura-of-terror
208	needlin-haystack
209	pin-cushion
210	terrifying-features
211	shrivel
212	decay
213	festering-wounds
214	touch-of-rot
215	resolution
216	shield-breaker
217	dispel
218	reveal-weakness
219	rupture-barrier
220	alter-reality
221	tear-reality
222	crazy-pills
223	sparring
224	shadows-caress
225	sturdy
226	infinite-angles
227	consonant-chains
228	requiem
229	dirge-of-dissonance
230	lament-of-sadness
231	deadly-retaliation
232	payback
233	death-throws
234	underdog
\.


--
-- Name: tags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: h3lix0
--

SELECT pg_catalog.setval('tags_id_seq', 234, true);


--
-- Name: classes_pkey; Type: CONSTRAINT; Schema: public; Owner: h3lix0; Tablespace: 
--

ALTER TABLE ONLY classes
    ADD CONSTRAINT classes_pkey PRIMARY KEY (id);


--
-- Name: discipline_types_pkey; Type: CONSTRAINT; Schema: public; Owner: h3lix0; Tablespace: 
--

ALTER TABLE ONLY discipline_types
    ADD CONSTRAINT discipline_types_pkey PRIMARY KEY (id);


--
-- Name: disciplines_pkey; Type: CONSTRAINT; Schema: public; Owner: h3lix0; Tablespace: 
--

ALTER TABLE ONLY disciplines
    ADD CONSTRAINT disciplines_pkey PRIMARY KEY (id);


--
-- Name: knex_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: h3lix0; Tablespace: 
--

ALTER TABLE ONLY knex_migrations
    ADD CONSTRAINT knex_migrations_pkey PRIMARY KEY (id);


--
-- Name: powers_pkey; Type: CONSTRAINT; Schema: public; Owner: h3lix0; Tablespace: 
--

ALTER TABLE ONLY powers
    ADD CONSTRAINT powers_pkey PRIMARY KEY (id);


--
-- Name: powers_slug_unique; Type: CONSTRAINT; Schema: public; Owner: h3lix0; Tablespace: 
--

ALTER TABLE ONLY powers
    ADD CONSTRAINT powers_slug_unique UNIQUE (slug);


--
-- Name: races_pkey; Type: CONSTRAINT; Schema: public; Owner: h3lix0; Tablespace: 
--

ALTER TABLE ONLY races
    ADD CONSTRAINT races_pkey PRIMARY KEY (id);


--
-- Name: statistics_pkey; Type: CONSTRAINT; Schema: public; Owner: h3lix0; Tablespace: 
--

ALTER TABLE ONLY statistics
    ADD CONSTRAINT statistics_pkey PRIMARY KEY (id);


--
-- Name: tags_pkey; Type: CONSTRAINT; Schema: public; Owner: h3lix0; Tablespace: 
--

ALTER TABLE ONLY tags
    ADD CONSTRAINT tags_pkey PRIMARY KEY (id);


--
-- Name: class_powers_class_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: h3lix0
--

ALTER TABLE ONLY class_powers
    ADD CONSTRAINT class_powers_class_id_foreign FOREIGN KEY (class_id) REFERENCES classes(id);


--
-- Name: class_powers_power_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: h3lix0
--

ALTER TABLE ONLY class_powers
    ADD CONSTRAINT class_powers_power_id_foreign FOREIGN KEY (power_id) REFERENCES powers(id);


--
-- Name: class_races_class_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: h3lix0
--

ALTER TABLE ONLY class_races
    ADD CONSTRAINT class_races_class_id_foreign FOREIGN KEY (class_id) REFERENCES classes(id);


--
-- Name: class_races_race_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: h3lix0
--

ALTER TABLE ONLY class_races
    ADD CONSTRAINT class_races_race_id_foreign FOREIGN KEY (race_id) REFERENCES races(id);


--
-- Name: class_tags_class_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: h3lix0
--

ALTER TABLE ONLY class_tags
    ADD CONSTRAINT class_tags_class_id_foreign FOREIGN KEY (class_id) REFERENCES classes(id);


--
-- Name: class_tags_tag_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: h3lix0
--

ALTER TABLE ONLY class_tags
    ADD CONSTRAINT class_tags_tag_id_foreign FOREIGN KEY (tag_id) REFERENCES tags(id);


--
-- Name: combos_child_power_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: h3lix0
--

ALTER TABLE ONLY combos
    ADD CONSTRAINT combos_child_power_id_foreign FOREIGN KEY (child_power_id) REFERENCES powers(id);


--
-- Name: combos_parent_power_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: h3lix0
--

ALTER TABLE ONLY combos
    ADD CONSTRAINT combos_parent_power_id_foreign FOREIGN KEY (parent_power_id) REFERENCES powers(id);


--
-- Name: discipline_classes_class_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: h3lix0
--

ALTER TABLE ONLY discipline_classes
    ADD CONSTRAINT discipline_classes_class_id_foreign FOREIGN KEY (class_id) REFERENCES classes(id);


--
-- Name: discipline_classes_discipline_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: h3lix0
--

ALTER TABLE ONLY discipline_classes
    ADD CONSTRAINT discipline_classes_discipline_id_foreign FOREIGN KEY (discipline_id) REFERENCES disciplines(id);


--
-- Name: discipline_powers_discipline_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: h3lix0
--

ALTER TABLE ONLY discipline_powers
    ADD CONSTRAINT discipline_powers_discipline_id_foreign FOREIGN KEY (discipline_id) REFERENCES disciplines(id);


--
-- Name: discipline_powers_power_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: h3lix0
--

ALTER TABLE ONLY discipline_powers
    ADD CONSTRAINT discipline_powers_power_id_foreign FOREIGN KEY (power_id) REFERENCES powers(id);


--
-- Name: discipline_tags_discipline_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: h3lix0
--

ALTER TABLE ONLY discipline_tags
    ADD CONSTRAINT discipline_tags_discipline_id_foreign FOREIGN KEY (discipline_id) REFERENCES disciplines(id);


--
-- Name: discipline_tags_tag_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: h3lix0
--

ALTER TABLE ONLY discipline_tags
    ADD CONSTRAINT discipline_tags_tag_id_foreign FOREIGN KEY (tag_id) REFERENCES tags(id);


--
-- Name: power_tags_power_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: h3lix0
--

ALTER TABLE ONLY power_tags
    ADD CONSTRAINT power_tags_power_id_foreign FOREIGN KEY (power_id) REFERENCES powers(id);


--
-- Name: power_tags_tag_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: h3lix0
--

ALTER TABLE ONLY power_tags
    ADD CONSTRAINT power_tags_tag_id_foreign FOREIGN KEY (tag_id) REFERENCES tags(id);


--
-- Name: race_disciplines_discipline_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: h3lix0
--

ALTER TABLE ONLY race_disciplines
    ADD CONSTRAINT race_disciplines_discipline_id_foreign FOREIGN KEY (discipline_id) REFERENCES disciplines(id);


--
-- Name: race_disciplines_race_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: h3lix0
--

ALTER TABLE ONLY race_disciplines
    ADD CONSTRAINT race_disciplines_race_id_foreign FOREIGN KEY (race_id) REFERENCES races(id);


--
-- Name: race_tags_race_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: h3lix0
--

ALTER TABLE ONLY race_tags
    ADD CONSTRAINT race_tags_race_id_foreign FOREIGN KEY (race_id) REFERENCES races(id);


--
-- Name: race_tags_tag_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: h3lix0
--

ALTER TABLE ONLY race_tags
    ADD CONSTRAINT race_tags_tag_id_foreign FOREIGN KEY (tag_id) REFERENCES tags(id);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

