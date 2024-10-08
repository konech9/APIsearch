toc.dat                                                                                             0000600 0004000 0002000 00000034223 14670363245 0014455 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        PGDMP       3                |            postgres    16.4    16.4 4               0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                    0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                    0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false         	           1262    5    postgres    DATABASE     |   CREATE DATABASE postgres WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Russian_Russia.1251';
    DROP DATABASE postgres;
                postgres    false         
           0    0    DATABASE postgres    COMMENT     N   COMMENT ON DATABASE postgres IS 'default administrative connection database';
                   postgres    false    4873                     2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
                pg_database_owner    false                    0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                   pg_database_owner    false    6         �            1259    16574    api    TABLE     #  CREATE TABLE public.api (
    id integer NOT NULL,
    creator_id integer NOT NULL,
    name character varying(30),
    type character varying(30),
    protocol character varying(10),
    body text,
    created_at timestamp without time zone,
    price integer,
    count_of_uses integer
);
    DROP TABLE public.api;
       public         heap    postgres    false    6         �            1259    16573    api_creator_id_seq    SEQUENCE     �   CREATE SEQUENCE public.api_creator_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.api_creator_id_seq;
       public          postgres    false    6    239                    0    0    api_creator_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.api_creator_id_seq OWNED BY public.api.creator_id;
          public          postgres    false    238         �            1259    16572 
   api_id_seq    SEQUENCE     �   CREATE SEQUENCE public.api_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 !   DROP SEQUENCE public.api_id_seq;
       public          postgres    false    6    239                    0    0 
   api_id_seq    SEQUENCE OWNED BY     9   ALTER SEQUENCE public.api_id_seq OWNED BY public.api.id;
          public          postgres    false    237         �            1259    16610    logs    TABLE     �   CREATE TABLE public.logs (
    id integer NOT NULL,
    type character varying(20),
    user_id integer NOT NULL,
    api_id integer NOT NULL,
    body text,
    created_at timestamp without time zone
);
    DROP TABLE public.logs;
       public         heap    postgres    false    6         �            1259    16609    logs_api_id_seq    SEQUENCE     �   CREATE SEQUENCE public.logs_api_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.logs_api_id_seq;
       public          postgres    false    6    245                    0    0    logs_api_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.logs_api_id_seq OWNED BY public.logs.api_id;
          public          postgres    false    244         �            1259    16607    logs_id_seq    SEQUENCE     �   CREATE SEQUENCE public.logs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.logs_id_seq;
       public          postgres    false    245    6                    0    0    logs_id_seq    SEQUENCE OWNED BY     ;   ALTER SEQUENCE public.logs_id_seq OWNED BY public.logs.id;
          public          postgres    false    242         �            1259    16608    logs_user_id_seq    SEQUENCE     �   CREATE SEQUENCE public.logs_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.logs_user_id_seq;
       public          postgres    false    6    245                    0    0    logs_user_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.logs_user_id_seq OWNED BY public.logs.user_id;
          public          postgres    false    243         �            1259    16589    sales_receipt    TABLE     �   CREATE TABLE public.sales_receipt (
    id integer NOT NULL,
    seller_id integer,
    buyer_id integer,
    api_id integer,
    body text,
    created_at timestamp without time zone
);
 !   DROP TABLE public.sales_receipt;
       public         heap    postgres    false    6         �            1259    16588    sales_receipt_id_seq    SEQUENCE     �   CREATE SEQUENCE public.sales_receipt_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.sales_receipt_id_seq;
       public          postgres    false    6    241                    0    0    sales_receipt_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.sales_receipt_id_seq OWNED BY public.sales_receipt.id;
          public          postgres    false    240         �            1259    16566    users    TABLE     �  CREATE TABLE public.users (
    id integer NOT NULL,
    username character varying(50),
    password character varying(18),
    role character varying(12),
    first_name character varying(20),
    last_name character varying(20),
    patronymic character varying(20),
    age integer,
    birth_date date,
    phone character varying(11),
    created_at timestamp without time zone
);
    DROP TABLE public.users;
       public         heap    postgres    false    6         �            1259    16565    users_id_seq    SEQUENCE     �   CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.users_id_seq;
       public          postgres    false    6    236                    0    0    users_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;
          public          postgres    false    235         W           2604    16656    api id    DEFAULT     `   ALTER TABLE ONLY public.api ALTER COLUMN id SET DEFAULT nextval('public.api_id_seq'::regclass);
 5   ALTER TABLE public.api ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    237    239    239         X           2604    16657    api creator_id    DEFAULT     p   ALTER TABLE ONLY public.api ALTER COLUMN creator_id SET DEFAULT nextval('public.api_creator_id_seq'::regclass);
 =   ALTER TABLE public.api ALTER COLUMN creator_id DROP DEFAULT;
       public          postgres    false    238    239    239         Z           2604    16658    logs id    DEFAULT     b   ALTER TABLE ONLY public.logs ALTER COLUMN id SET DEFAULT nextval('public.logs_id_seq'::regclass);
 6   ALTER TABLE public.logs ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    242    245    245         [           2604    16659    logs user_id    DEFAULT     l   ALTER TABLE ONLY public.logs ALTER COLUMN user_id SET DEFAULT nextval('public.logs_user_id_seq'::regclass);
 ;   ALTER TABLE public.logs ALTER COLUMN user_id DROP DEFAULT;
       public          postgres    false    245    243    245         \           2604    16660    logs api_id    DEFAULT     j   ALTER TABLE ONLY public.logs ALTER COLUMN api_id SET DEFAULT nextval('public.logs_api_id_seq'::regclass);
 :   ALTER TABLE public.logs ALTER COLUMN api_id DROP DEFAULT;
       public          postgres    false    244    245    245         Y           2604    16661    sales_receipt id    DEFAULT     t   ALTER TABLE ONLY public.sales_receipt ALTER COLUMN id SET DEFAULT nextval('public.sales_receipt_id_seq'::regclass);
 ?   ALTER TABLE public.sales_receipt ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    240    241    241         V           2604    16662    users id    DEFAULT     d   ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);
 7   ALTER TABLE public.users ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    235    236    236         �          0    16574    api 
   TABLE DATA           k   COPY public.api (id, creator_id, name, type, protocol, body, created_at, price, count_of_uses) FROM stdin;
    public          postgres    false    239       4861.dat           0    16610    logs 
   TABLE DATA           K   COPY public.logs (id, type, user_id, api_id, body, created_at) FROM stdin;
    public          postgres    false    245       4867.dat �          0    16589    sales_receipt 
   TABLE DATA           Z   COPY public.sales_receipt (id, seller_id, buyer_id, api_id, body, created_at) FROM stdin;
    public          postgres    false    241       4863.dat �          0    16566    users 
   TABLE DATA           �   COPY public.users (id, username, password, role, first_name, last_name, patronymic, age, birth_date, phone, created_at) FROM stdin;
    public          postgres    false    236       4858.dat            0    0    api_creator_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.api_creator_id_seq', 1, false);
          public          postgres    false    238                    0    0 
   api_id_seq    SEQUENCE SET     9   SELECT pg_catalog.setval('public.api_id_seq', 1, false);
          public          postgres    false    237                    0    0    logs_api_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.logs_api_id_seq', 1, false);
          public          postgres    false    244                    0    0    logs_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.logs_id_seq', 1, false);
          public          postgres    false    242                    0    0    logs_user_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.logs_user_id_seq', 1, false);
          public          postgres    false    243                    0    0    sales_receipt_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.sales_receipt_id_seq', 1, false);
          public          postgres    false    240                    0    0    users_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.users_id_seq', 1, false);
          public          postgres    false    235         `           2606    16582    api api_pkey 
   CONSTRAINT     J   ALTER TABLE ONLY public.api
    ADD CONSTRAINT api_pkey PRIMARY KEY (id);
 6   ALTER TABLE ONLY public.api DROP CONSTRAINT api_pkey;
       public            postgres    false    239         d           2606    16619    logs logs_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY public.logs
    ADD CONSTRAINT logs_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.logs DROP CONSTRAINT logs_pkey;
       public            postgres    false    245         b           2606    16596     sales_receipt sales_receipt_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.sales_receipt
    ADD CONSTRAINT sales_receipt_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.sales_receipt DROP CONSTRAINT sales_receipt_pkey;
       public            postgres    false    241         ^           2606    16571    users users_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            postgres    false    236         e           2606    16583    api api_creator_id_fkey    FK CONSTRAINT     y   ALTER TABLE ONLY public.api
    ADD CONSTRAINT api_creator_id_fkey FOREIGN KEY (creator_id) REFERENCES public.users(id);
 A   ALTER TABLE ONLY public.api DROP CONSTRAINT api_creator_id_fkey;
       public          postgres    false    4702    236    239         h           2606    16625    logs logs_api_id_fkey    FK CONSTRAINT     q   ALTER TABLE ONLY public.logs
    ADD CONSTRAINT logs_api_id_fkey FOREIGN KEY (api_id) REFERENCES public.api(id);
 ?   ALTER TABLE ONLY public.logs DROP CONSTRAINT logs_api_id_fkey;
       public          postgres    false    239    245    4704         i           2606    16620    logs logs_user_id_fkey    FK CONSTRAINT     u   ALTER TABLE ONLY public.logs
    ADD CONSTRAINT logs_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);
 @   ALTER TABLE ONLY public.logs DROP CONSTRAINT logs_user_id_fkey;
       public          postgres    false    4702    245    236         f           2606    16602 )   sales_receipt sales_receipt_buyer_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.sales_receipt
    ADD CONSTRAINT sales_receipt_buyer_id_fkey FOREIGN KEY (buyer_id) REFERENCES public.users(id);
 S   ALTER TABLE ONLY public.sales_receipt DROP CONSTRAINT sales_receipt_buyer_id_fkey;
       public          postgres    false    4702    241    236         g           2606    16597 *   sales_receipt sales_receipt_seller_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.sales_receipt
    ADD CONSTRAINT sales_receipt_seller_id_fkey FOREIGN KEY (seller_id) REFERENCES public.users(id);
 T   ALTER TABLE ONLY public.sales_receipt DROP CONSTRAINT sales_receipt_seller_id_fkey;
       public          postgres    false    4702    241    236                                                                                                                                                                                                                                                                                                                                                                                     4861.dat                                                                                            0000600 0004000 0002000 00000000005 14670363245 0014261 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           4867.dat                                                                                            0000600 0004000 0002000 00000000005 14670363245 0014267 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           4863.dat                                                                                            0000600 0004000 0002000 00000000005 14670363245 0014263 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           4858.dat                                                                                            0000600 0004000 0002000 00000025172 14670363245 0014303 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	Magdalen_Thompson	K0ZgqXcMagtXNwC	male	Monte	Parisian	Emerson	11	1991-07-16	93759765596	2021-02-11 15:18:42.463
2	Otilia89	FN1p5SP4Lgn7Sst	male	Jana	Blanda	Billie	78	1964-10-06	24996703203	2021-02-11 15:19:42.463
3	Carmella_Jacobs99	RZ1_bpS9U6oEMy_	male	Ericka	Larson	Ellis	44	1989-10-26	37218895686	2021-02-11 15:20:42.463
4	Elwyn2	Egdyfg5HLmovIP5	male	Shanny	Treutel	Shawn	41	1959-06-16	31337936494	2021-02-11 15:21:42.463
5	Linnie_Abernathy	QdFL6YCmR_HvWbp	female	Schuyler	Kihn	Jamie	28	1979-03-30	24916562054	2021-02-11 15:22:42.463
6	Amie_Armstrong	sKJCIMqUGVlx0HP	female	Fidel	Kihn	Harper	43	1979-09-07	34590724696	2021-02-11 15:23:42.463
7	Josiah20	AgjAFzDrXWPWqxc	male	Clovis	Effertz	Elliott	87	1952-01-23	26998954900	2021-02-11 15:24:42.463
8	Yvonne64	vwGLgJ_Gq4vqDzD	male	Zakary	Johns	Phoenix	79	1989-07-20	81972873625	2021-02-11 15:25:42.463
9	Llewellyn_Cormier	7StKgaN97QvnlcA	female	Juana	Schaden	Jules	39	1957-04-12	99123386136	2021-02-11 15:26:42.463
10	Roslyn.Leuschke61	rzww1X_QwtaRm3k	female	Nelle	Berge	Addison	59	1949-05-02	57309666691	2021-02-11 15:27:42.463
11	Dayton.Kozey40	mC2LzS4yl8JvpqA	male	Delphine	Ritchie	Skyler	39	1959-04-08	54273472368	2021-02-11 15:28:42.463
12	Loma_Shanahan79	3WocdakdQrz3DV7	male	Kenna	Hackett	Sawyer	69	1962-04-05	10052019629	2021-02-11 15:29:42.463
13	Jalon.Price	o5GYtjGUKcUIbFj	female	Abigale	Quitzon	London	21	1947-09-14	98424671304	2021-02-11 15:30:42.463
14	Erick94	xuPlEdst8IQexk8	male	Kasandra	Gutmann	Greer	46	1947-08-20	98093756888	2021-02-11 15:31:42.463
15	Mallory_Schaefer	toFOvXcOfkFUMuh	male	Jack	Kuhic	Sawyer	58	1956-08-01	61841661440	2021-02-11 15:32:42.463
16	Mauricio_Powlowski	WiS6Jeb48Cipx6i	female	Hugh	Littel	Nico	42	1958-12-06	67402573014	2021-02-11 15:33:42.463
17	Eloy_Stokes	xKUkdKQoWpUbMGX	male	Cheyenne	Reilly	River	11	2000-07-09	64002487629	2021-02-11 15:34:42.463
18	Grover90	vAYe8L68uHEgXKN	female	Guido	Johns	Brooklyn	24	1988-11-16	65964831389	2021-02-11 15:35:42.463
19	Bell_Effertz	C5bBTlLuuTAjl2P	male	Sophia	Mann	Addison	25	1949-07-05	12352349142	2021-02-11 15:36:42.463
20	Selina_White56	0RVOoZSdeUgxWod	male	Edgar	Smith	Kyle	92	1992-09-02	49418293794	2021-02-11 15:37:42.463
21	Edison.Feil	jkKnX2BKGFTWeuY	male	Shea	Mitchell	August	25	1979-11-12	69160333414	2021-02-11 15:38:42.463
22	Maxine_Terry33	NNRv0m1HWK4BdD_	female	Royal	Hegmann	Shawn	56	1996-02-18	28380079406	2021-02-11 15:39:42.463
23	Kadin.Carter	RaA3ewEC5tDa5AN	female	Erik	Bosco	River	87	1959-04-18	18392696950	2021-02-11 15:40:42.463
24	Murphy_Weber5	rxBB8BiVQn67d5G	female	Hayden	Hintz	Jordan	71	1978-11-22	98104121384	2021-02-11 15:41:42.463
25	Eugene.Pagac30	9Wmve92ZeRXs_Q1	female	Fletcher	Stracke	Parker	71	1996-12-19	65082131566	2021-02-11 15:42:42.463
26	Lukas80	mqWkeuSEXuUmJrD	female	Luciano	Bailey	James	39	1971-05-20	42169448146	2021-02-11 15:43:42.463
27	Devyn_Borer	lBE4nZJBYYovqv8	male	Samanta	Conn	Skyler	82	1973-02-11	01646164151	2021-02-11 15:44:42.463
28	Natalia.Little	eNcPVKvtPVDQKqz	female	Morgan	Bahringer	Cameron	22	1983-05-21	53496990419	2021-02-11 15:45:42.463
29	Jean_Ullrich	Sqltihq4FJ6wHkT	male	Orie	Wiza	James	71	1998-03-12	39763242895	2021-02-11 15:46:42.463
30	Augustus5	IW2M3ZPI6zzOOwq	female	Daniela	Abernathy	Robin	63	1968-02-22	26847510014	2021-02-11 15:47:42.463
31	Robert_Feeney	hefts7pWJFhLGpb	female	Declan	Wisozk	Ellis	78	1953-07-16	93126203568	2021-02-11 15:48:42.463
32	Adrien55	NliL7Mzjj3FAt9O	male	Kasey	Renner	Sage	61	1993-03-13	66811088707	2021-02-11 15:49:42.463
33	Irma.Haley26	sfVd_RO_Y7pshOF	female	Jayme	Brekke	Jamie	40	1967-08-24	13673148105	2021-02-11 15:50:42.463
34	Clara.Blick	z9bL8aGYS2oeAyX	female	Mara	Yost	Jules	46	1987-10-08	27768313840	2021-02-11 15:51:42.463
35	Kirsten.Glover27	abTMu26LAtmqruh	female	Nasir	Roberts	Cameron	84	1980-10-29	04192862599	2021-02-11 15:52:42.463
36	Gust63	QQEpSz889hRsKTH	female	Alva	Spinka	Nico	58	1969-02-08	77915157240	2021-02-11 15:53:42.463
37	Jerrod33	4oPwLkFEhf4YXzT	male	Garett	Marvin	Avery	47	1959-05-05	23768162755	2021-02-11 15:54:42.463
38	Justyn28	felY_gx7EKEsrFd	female	Brandyn	Olson	Riley	54	1965-06-28	07798894224	2021-02-11 15:55:42.463
39	Concepcion_Bashirian31	yECnwX7KL5__Zkg	female	Kaylee	Bernhard	Gray	65	1961-08-29	47821050228	2021-02-11 15:56:42.463
40	Henriette15	t_k4PvKDxNGC6lH	female	Josh	Dicki	Skyler	62	1966-03-27	24606086594	2021-02-11 15:57:42.463
41	Jena_OKon46	n2epyw9Y4Xyn3sy	female	Tony	Ebert	Avery	75	1966-04-26	06859038369	2021-02-11 15:58:42.463
42	Hallie_Crona38	wai5ysDzOiHxK8t	female	Alaina	Flatley	Kai	64	1998-06-10	02170788887	2021-02-11 15:59:42.463
43	Norma.Robel	SxeUSqtvkPIBW7L	female	Jaida	Predovic	Charlie	18	1966-02-05	05383511019	2021-02-11 16:00:42.463
44	Hyman_Greenholt	HFUEF4kvIxNgkxG	female	Monty	Mohr	Riley	79	1996-02-13	60606380809	2021-02-11 16:01:42.463
45	Lon95	oggXmBRMBbAmGY6	male	Delilah	Bergnaum	Charlie	82	1964-10-15	78072671612	2021-02-11 16:02:42.463
46	Doyle31	TWgXKZxUkKV3HSb	female	Karen	Beahan	Greer	14	1994-02-19	78190210837	2021-02-11 16:03:42.463
47	Landen_Pfannerstill	aacMYopAvR2kkhS	male	Rebeca	Olson	Jaden	17	2005-01-14	39013784418	2021-02-11 16:04:42.463
48	Nick42	mFVWuM4DeqxiOtJ	male	Margaret	Langosh	Jules	67	1996-08-09	19070450064	2021-02-11 16:05:42.463
49	Arnaldo_Bartell3	C1IysEKw_MnJdnB	female	Susie	Kassulke	Jamie	49	2003-03-15	27091369730	2021-02-11 16:06:42.463
50	Jennings.Stokes67	kA64hL5St_plTuq	male	Frank	Heathcote	Bailey	70	2003-07-13	51444814507	2021-02-11 16:07:42.463
51	Allie.OHara	YhAvoziLwO7j3Vk	male	Eddie	Konopelski	Skyler	28	1981-02-24	17906486130	2021-02-11 16:08:42.463
52	Vincenza.Lesch	dTFD0qvcNAh8MCu	female	Tommie	Dietrich	Austin	45	1966-09-21	24786522171	2021-02-11 16:09:42.463
53	Kaleigh_Kilback47	VCAVNIBOCqglUbS	male	Jarret	Heller	Ryan	10	1982-11-18	09560894853	2021-02-11 16:10:42.463
54	Hiram68	_boOZiTUI16kRh2	female	Vito	Shanahan	Parker	44	1997-03-07	94304669832	2021-02-11 16:11:42.463
55	Nicholaus2	j8_x4anNbhH3DvD	male	Leland	Flatley	Kyle	11	1992-09-16	74559713804	2021-02-11 16:12:42.463
56	Conor48	B2xmsgoGbQIivus	female	Frankie	Harris	Phoenix	17	1956-12-09	20940561528	2021-02-11 16:13:42.463
57	Jaycee.Ward	NYLxBpmFZHLbVAI	male	Jules	Corkery	Angel	42	1952-10-16	11464225712	2021-02-11 16:14:42.463
58	Savanna54	_9NHpDyQK_2RpHa	male	Andy	Rohan	Charlie	34	1964-11-24	34713027002	2021-02-11 16:15:42.463
59	Orval85	MUdJZ5Cv9o1u4ZG	female	Buck	Homenick	Noah	76	1989-09-05	92388989432	2021-02-11 16:16:42.463
60	Reece1	xFjGXhfwgfhFgzc	male	Rocky	Kuhlman	Riley	54	1951-01-25	67014545206	2021-02-11 16:17:42.463
61	Granville.Crooks	m68YbJPmK9aDI_N	female	Demarcus	Reilly	Shawn	99	1970-12-04	44114986168	2021-02-11 16:18:42.463
62	Mackenzie.Lehner	by6imZGbTHXbFXf	male	Norma	Kessler	Rory	89	1979-01-28	84387927883	2021-02-11 16:19:42.463
63	Trace_Cartwright	pxAPOupu5GUMf2b	male	Juwan	Mayert	London	16	1945-11-06	19362131207	2021-02-11 16:20:42.463
64	Vergie64	BLIboq2uUgSMNZs	female	Frederick	Corkery	Shawn	68	1953-12-04	41531337582	2021-02-11 16:21:42.463
65	Ally_Larson	yITtartaZgIxfWl	female	Ryann	Haley	Blake	71	2000-05-04	19636318334	2021-02-11 16:22:42.463
66	Era.Klocko29	A4SNU1IG3twPtYC	male	Camylle	Huel	August	92	1947-03-04	02523311029	2021-02-11 16:23:42.463
67	Vincent_Corkery3	tGima6OcvcWgfXn	male	Baby	Fahey	Drew	17	1994-03-29	45455995885	2021-02-11 16:24:42.463
68	Shanon_Gerlach15	n0DdWYKDf66j8vL	female	Ellis	Abshire	Nico	13	1955-04-02	68092052740	2021-02-11 16:25:42.463
69	Domenico.West	xEFhBaHH4y43UVL	female	Camilla	Bahringer	Noah	44	1963-11-11	99003792935	2021-02-11 16:26:42.463
70	Margret_Schmeler1	c6PnbXE_2JePuM5	male	Garret	Jakubowski	Reese	78	1980-03-24	22507717814	2021-02-11 16:27:42.463
71	Myrl51	G_1cLxq7v9rnrON	male	Anabelle	Leuschke	Reign	71	1982-01-29	63802506984	2021-02-11 16:28:42.463
72	Madaline.Von71	54DgWXJBH5CyQA4	male	Hillary	Gusikowski	Finley	79	1970-11-10	40169263714	2021-02-11 16:29:42.463
73	Bernita_King	LIeOfnEXYejDUzr	female	Myron	Morar	Ryan	40	1997-10-06	37796025448	2021-02-11 16:30:42.463
74	Earlene.Gulgowski95	tW4WsbDMERpgG66	female	Lindsay	Reinger	Ellis	26	1968-01-18	74252714684	2021-02-11 16:31:42.463
75	Stewart.Kuvalis24	264Zc3Chm4w08tq	male	Austyn	Stiedemann	August	54	1971-06-30	67767984889	2021-02-11 16:32:42.463
76	Sibyl54	FVYAxtDM__gTUQf	male	Alison	Jenkins	Phoenix	43	1956-11-16	31981487611	2021-02-11 16:33:42.463
77	Tess.Okuneva54	CloOQGSvCuJdcLH	male	Rosie	Botsford	Jaden	64	1949-03-10	54067638060	2021-02-11 16:34:42.463
78	Heath79	QjAOEi3YrHbLYr3	male	Naomi	Bosco	Arden	80	1998-12-07	60578175676	2021-02-11 16:35:42.463
79	Leif_Jones	64SzIjuFmqoEf1w	male	Felipa	Braun	Avery	97	1988-07-19	43273221464	2021-02-11 16:36:42.463
80	Ola98	SIEecNeA2ps7umy	female	Lisette	Gleason	Ryan	46	1982-10-27	76097291181	2021-02-11 16:37:42.463
81	Victor_Hickle	YaGCyZ_vq1O9a5M	male	Cristobal	Pfeffer	Angel	18	1965-10-27	04909984835	2021-02-11 16:38:42.463
82	Gideon_Stehr	kjaOCdq5MbIk6Zd	male	Edmund	Padberg	Finley	15	1968-10-12	25686758302	2021-02-11 16:39:42.463
83	Zackery.Gorczany	2z9a6CRG2Dwmtl2	male	Hunter	Fadel	Finley	21	1994-09-23	27885708931	2021-02-11 16:40:42.463
84	Robert28	ed86Ew8DiK48Ll_	male	Orpha	Jones	Finley	14	1973-12-29	64466204187	2021-02-11 16:41:42.463
85	Branson22	NKlQc5sO1Sdxa89	male	Carson	Hermiston	London	62	1987-02-28	89654719847	2021-02-11 16:42:42.463
86	Ottilie_Tillman85	Oys3sDzSHQJk64n	male	Felix	Macejkovic	Austin	94	2001-03-15	25405762386	2021-02-11 16:43:42.463
87	Abigail55	Eoa0NdruByVZ1Lv	male	Claude	Mitchell	Emerson	99	1951-05-04	15525381461	2021-02-11 16:44:42.463
88	Yadira_Medhurst47	msOusWwfhilm2fE	male	Ubaldo	Mertz	Kyle	13	1999-04-26	19753493242	2021-02-11 16:45:42.463
89	Garfield.Green	4JdXvienv5biqUv	female	Jerrod	Hackett	Marlowe	26	1952-05-04	89365193574	2021-02-11 16:46:42.463
90	Jacky_Goldner	YQKMxr6fQsLOuRH	male	Rozella	Hermiston	Noah	28	1978-04-27	05177773407	2021-02-11 16:47:42.463
91	Savanna34	R9kobri76T2klMN	male	Amina	Kozey	Kyle	85	1944-05-14	68780421394	2021-02-11 16:48:42.463
92	Stephania8	o6nC2KZclRv7tWR	male	Jovani	Schaefer	August	19	1979-08-19	49209260312	2021-02-11 16:49:42.463
93	Hortense_Willms25	djPT8g1QsZLuJuF	male	Betsy	Raynor	Anderson	83	1998-06-09	31894250324	2021-02-11 16:50:42.463
94	Lucius.Dicki	zredL2gzDqAcuCT	female	Drake	MacGyver	Quinn	51	1991-05-12	80835938133	2021-02-11 16:51:42.463
95	Lempi64	ge6sinSOPPJ7ioG	female	Dewayne	Armstrong	Shawn	16	1987-08-18	86094677919	2021-02-11 16:52:42.463
96	Grayce55	cwHhqvPWHnyh1mf	female	Santos	Bechtelar	Drew	89	2005-10-15	74531520381	2021-02-11 16:53:42.463
97	Audra_Jenkins63	UJywjexy4puW3oG	male	Obie	Labadie	Sawyer	59	1974-01-11	13004591966	2021-02-11 16:54:42.463
98	Kali.Greenholt	KT2SMFGtOlt5ODS	male	Kirsten	Ankunding	Shiloh	68	1984-01-22	42632249825	2021-02-11 16:55:42.463
99	Vesta_Fisher	eTNEzIrQuZLPPU2	female	Daryl	Okuneva	Finley	99	1997-06-28	65212107533	2021-02-11 16:56:42.463
100	Frieda.Jacobson	yRuqGOFiJn5YwuC	female	Bryana	Hoppe	Sasha	69	1991-09-10	72596233980	2021-02-11 16:57:42.463
\.


                                                                                                                                                                                                                                                                                                                                                                                                      restore.sql                                                                                         0000600 0004000 0002000 00000026656 14670363245 0015415 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        --
-- NOTE:
--
-- File paths need to be edited. Search for $$PATH$$ and
-- replace it with the path to the directory containing
-- the extracted data files.
--
--
-- PostgreSQL database dump
--

-- Dumped from database version 16.4
-- Dumped by pg_dump version 16.4

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

DROP DATABASE postgres;
--
-- Name: postgres; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE postgres WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Russian_Russia.1251';


ALTER DATABASE postgres OWNER TO postgres;

\connect postgres

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

--
-- Name: DATABASE postgres; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON DATABASE postgres IS 'default administrative connection database';


--
-- Name: public; Type: SCHEMA; Schema: -; Owner: pg_database_owner
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO pg_database_owner;

--
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: pg_database_owner
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: api; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.api (
    id integer NOT NULL,
    creator_id integer NOT NULL,
    name character varying(30),
    type character varying(30),
    protocol character varying(10),
    body text,
    created_at timestamp without time zone,
    price integer,
    count_of_uses integer
);


ALTER TABLE public.api OWNER TO postgres;

--
-- Name: api_creator_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.api_creator_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.api_creator_id_seq OWNER TO postgres;

--
-- Name: api_creator_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.api_creator_id_seq OWNED BY public.api.creator_id;


--
-- Name: api_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.api_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.api_id_seq OWNER TO postgres;

--
-- Name: api_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.api_id_seq OWNED BY public.api.id;


--
-- Name: logs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.logs (
    id integer NOT NULL,
    type character varying(20),
    user_id integer NOT NULL,
    api_id integer NOT NULL,
    body text,
    created_at timestamp without time zone
);


ALTER TABLE public.logs OWNER TO postgres;

--
-- Name: logs_api_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.logs_api_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.logs_api_id_seq OWNER TO postgres;

--
-- Name: logs_api_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.logs_api_id_seq OWNED BY public.logs.api_id;


--
-- Name: logs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.logs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.logs_id_seq OWNER TO postgres;

--
-- Name: logs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.logs_id_seq OWNED BY public.logs.id;


--
-- Name: logs_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.logs_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.logs_user_id_seq OWNER TO postgres;

--
-- Name: logs_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.logs_user_id_seq OWNED BY public.logs.user_id;


--
-- Name: sales_receipt; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sales_receipt (
    id integer NOT NULL,
    seller_id integer,
    buyer_id integer,
    api_id integer,
    body text,
    created_at timestamp without time zone
);


ALTER TABLE public.sales_receipt OWNER TO postgres;

--
-- Name: sales_receipt_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sales_receipt_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.sales_receipt_id_seq OWNER TO postgres;

--
-- Name: sales_receipt_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sales_receipt_id_seq OWNED BY public.sales_receipt.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    username character varying(50),
    password character varying(18),
    role character varying(12),
    first_name character varying(20),
    last_name character varying(20),
    patronymic character varying(20),
    age integer,
    birth_date date,
    phone character varying(11),
    created_at timestamp without time zone
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_id_seq OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: api id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api ALTER COLUMN id SET DEFAULT nextval('public.api_id_seq'::regclass);


--
-- Name: api creator_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api ALTER COLUMN creator_id SET DEFAULT nextval('public.api_creator_id_seq'::regclass);


--
-- Name: logs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logs ALTER COLUMN id SET DEFAULT nextval('public.logs_id_seq'::regclass);


--
-- Name: logs user_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logs ALTER COLUMN user_id SET DEFAULT nextval('public.logs_user_id_seq'::regclass);


--
-- Name: logs api_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logs ALTER COLUMN api_id SET DEFAULT nextval('public.logs_api_id_seq'::regclass);


--
-- Name: sales_receipt id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sales_receipt ALTER COLUMN id SET DEFAULT nextval('public.sales_receipt_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: api; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.api (id, creator_id, name, type, protocol, body, created_at, price, count_of_uses) FROM stdin;
\.
COPY public.api (id, creator_id, name, type, protocol, body, created_at, price, count_of_uses) FROM '$$PATH$$/4861.dat';

--
-- Data for Name: logs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.logs (id, type, user_id, api_id, body, created_at) FROM stdin;
\.
COPY public.logs (id, type, user_id, api_id, body, created_at) FROM '$$PATH$$/4867.dat';

--
-- Data for Name: sales_receipt; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sales_receipt (id, seller_id, buyer_id, api_id, body, created_at) FROM stdin;
\.
COPY public.sales_receipt (id, seller_id, buyer_id, api_id, body, created_at) FROM '$$PATH$$/4863.dat';

--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, username, password, role, first_name, last_name, patronymic, age, birth_date, phone, created_at) FROM stdin;
\.
COPY public.users (id, username, password, role, first_name, last_name, patronymic, age, birth_date, phone, created_at) FROM '$$PATH$$/4858.dat';

--
-- Name: api_creator_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.api_creator_id_seq', 1, false);


--
-- Name: api_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.api_id_seq', 1, false);


--
-- Name: logs_api_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.logs_api_id_seq', 1, false);


--
-- Name: logs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.logs_id_seq', 1, false);


--
-- Name: logs_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.logs_user_id_seq', 1, false);


--
-- Name: sales_receipt_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sales_receipt_id_seq', 1, false);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 1, false);


--
-- Name: api api_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api
    ADD CONSTRAINT api_pkey PRIMARY KEY (id);


--
-- Name: logs logs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logs
    ADD CONSTRAINT logs_pkey PRIMARY KEY (id);


--
-- Name: sales_receipt sales_receipt_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sales_receipt
    ADD CONSTRAINT sales_receipt_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: api api_creator_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api
    ADD CONSTRAINT api_creator_id_fkey FOREIGN KEY (creator_id) REFERENCES public.users(id);


--
-- Name: logs logs_api_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logs
    ADD CONSTRAINT logs_api_id_fkey FOREIGN KEY (api_id) REFERENCES public.api(id);


--
-- Name: logs logs_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logs
    ADD CONSTRAINT logs_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: sales_receipt sales_receipt_buyer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sales_receipt
    ADD CONSTRAINT sales_receipt_buyer_id_fkey FOREIGN KEY (buyer_id) REFERENCES public.users(id);


--
-- Name: sales_receipt sales_receipt_seller_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sales_receipt
    ADD CONSTRAINT sales_receipt_seller_id_fkey FOREIGN KEY (seller_id) REFERENCES public.users(id);


--
-- PostgreSQL database dump complete
--

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  