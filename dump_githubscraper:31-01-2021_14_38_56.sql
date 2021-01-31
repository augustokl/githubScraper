--
-- PostgreSQL database cluster dump
--

SET default_transaction_read_only = off;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

--
-- Drop databases (except postgres and template1)
--

DROP DATABASE api;




--
-- Drop roles
--

DROP ROLE postgres;


--
-- Roles
--

CREATE ROLE postgres;
ALTER ROLE postgres WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN REPLICATION BYPASSRLS PASSWORD 'md53175bce1d3201d16594cebf9d7eb3f9d';






--
-- Databases
--

--
-- Database "template1" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 12.2 (Debian 12.2-2.pgdg100+1)
-- Dumped by pg_dump version 12.2 (Debian 12.2-2.pgdg100+1)

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

UPDATE pg_catalog.pg_database SET datistemplate = false WHERE datname = 'template1';
DROP DATABASE template1;
--
-- Name: template1; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE template1 WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'en_US.utf8' LC_CTYPE = 'en_US.utf8';


ALTER DATABASE template1 OWNER TO postgres;

\connect template1

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
-- Name: DATABASE template1; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON DATABASE template1 IS 'default template for new databases';


--
-- Name: template1; Type: DATABASE PROPERTIES; Schema: -; Owner: postgres
--

ALTER DATABASE template1 IS_TEMPLATE = true;


\connect template1

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
-- Name: DATABASE template1; Type: ACL; Schema: -; Owner: postgres
--

REVOKE CONNECT,TEMPORARY ON DATABASE template1 FROM PUBLIC;
GRANT CONNECT ON DATABASE template1 TO PUBLIC;


--
-- PostgreSQL database dump complete
--

--
-- Database "api" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 12.2 (Debian 12.2-2.pgdg100+1)
-- Dumped by pg_dump version 12.2 (Debian 12.2-2.pgdg100+1)

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
-- Name: api; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE api WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'en_US.utf8' LC_CTYPE = 'en_US.utf8';


ALTER DATABASE api OWNER TO postgres;

\connect api

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
-- Name: migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.migrations (
    id integer NOT NULL,
    "timestamp" bigint NOT NULL,
    name character varying NOT NULL
);


ALTER TABLE public.migrations OWNER TO postgres;

--
-- Name: migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.migrations_id_seq OWNER TO postgres;

--
-- Name: migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.migrations_id_seq OWNED BY public.migrations.id;


--
-- Name: repositories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.repositories (
    id integer NOT NULL,
    name character varying NOT NULL,
    user_id integer NOT NULL,
    html_url character varying NOT NULL,
    subscription_url character varying NOT NULL,
    clone_url character varying NOT NULL,
    description character varying,
    language character varying,
    size integer,
    forks integer,
    open_issues integer,
    stargazers integer,
    watchers integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone,
    pushed_at timestamp without time zone
);


ALTER TABLE public.repositories OWNER TO postgres;

--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    login character varying NOT NULL,
    url character varying NOT NULL,
    avatar_url character varying,
    gists_url character varying,
    events_url character varying,
    name character varying,
    email character varying,
    hireable character varying,
    company character varying,
    location character varying,
    blog character varying,
    bio character varying,
    public_repos integer NOT NULL,
    public_gists integer NOT NULL,
    followers integer NOT NULL,
    following integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.migrations ALTER COLUMN id SET DEFAULT nextval('public.migrations_id_seq'::regclass);


--
-- Data for Name: migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.migrations (id, "timestamp", name) FROM stdin;
1	1611716188975	CreateUsers1611716188975
2	1611780806688	CreateRepositories1611780806688
\.


--
-- Data for Name: repositories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.repositories (id, name, user_id, html_url, subscription_url, clone_url, description, language, size, forks, open_issues, stargazers, watchers, created_at, updated_at, pushed_at) FROM stdin;
26899533	30daysoflaptops.github.io	1	https://github.com/mojombo/30daysoflaptops.github.io	https://api.github.com/repos/mojombo/30daysoflaptops.github.io/subscription	https://github.com/mojombo/30daysoflaptops.github.io.git	\N	CSS	1197	2	0	\N	7	2014-11-20 04:42:06	2021-01-13 16:44:03	2014-11-20 04:42:47
17358646	asteroids	1	https://github.com/mojombo/asteroids	https://api.github.com/repos/mojombo/asteroids/subscription	https://github.com/mojombo/asteroids.git	Destroy your Atom editor, Asteroids style!	JavaScript	185	13	3	\N	94	2014-03-03 04:40:00	2021-01-30 03:08:52	2015-03-10 15:18:16
29941343	benbalter.github.com	1	https://github.com/mojombo/benbalter.github.com	https://api.github.com/repos/mojombo/benbalter.github.com/subscription	https://github.com/mojombo/benbalter.github.com.git	The personal website of Ben Balter. Built using Jekyll and GitHub Pages. See humans.txt for more infos.	CSS	20836	6	0	\N	5	2015-01-27 21:54:05	2021-01-13 16:44:45	2015-01-27 21:54:33
330651	bert	1	https://github.com/mojombo/bert	https://api.github.com/repos/mojombo/bert/subscription	https://github.com/mojombo/bert.git	BERT (Binary ERlang Term) serialization library for Ruby.	Ruby	186	68	11	\N	197	2009-10-08 03:06:25	2021-01-13 16:27:11	2016-04-18 12:19:42
444244	bert.erl	1	https://github.com/mojombo/bert.erl	https://api.github.com/repos/mojombo/bert.erl/subscription	https://github.com/mojombo/bert.erl.git	Erlang BERT encoder/decoder	Erlang	246	51	6	\N	94	2009-12-21 00:10:34	2021-01-26 13:26:40	2010-01-07 22:12:10
204457	bertrpc	1	https://github.com/mojombo/bertrpc	https://api.github.com/repos/mojombo/bertrpc/subscription	https://github.com/mojombo/bertrpc.git	BERTRPC is a Ruby BERT-RPC client library.	Ruby	260	30	0	\N	156	2009-05-18 23:44:01	2021-01-13 16:26:19	2014-08-11 17:59:15
6664329	bower	1	https://github.com/mojombo/bower	https://api.github.com/repos/mojombo/bower/subscription	https://github.com/mojombo/bower.git	A package manager for the web	JavaScript	333	3	0	\N	4	2012-11-13 00:32:34	2021-01-13 16:36:05	2012-11-13 00:34:11
144	chronic	1	https://github.com/mojombo/chronic	https://api.github.com/repos/mojombo/chronic/subscription	https://github.com/mojombo/chronic.git	Chronic is a pure Ruby natural language date parser.	Ruby	681	454	147	\N	3087	2008-01-29 04:48:49	2021-01-29 18:32:37	2020-10-15 07:38:07
128373	clippy	1	https://github.com/mojombo/clippy	https://api.github.com/repos/mojombo/clippy/subscription	https://github.com/mojombo/clippy.git	Clippy is a very simple Flash widget that makes it possible to place arbitrary text onto the client's clipboard.	\N	239	180	25	\N	954	2009-02-13 16:59:10	2021-01-13 16:26:05	2011-10-04 18:29:49
54515	conceptual_algorithms	1	https://github.com/mojombo/conceptual_algorithms	https://api.github.com/repos/mojombo/conceptual_algorithms/subscription	https://github.com/mojombo/conceptual_algorithms.git	\N	\N	1916	2	0	\N	4	2008-09-20 01:54:25	2021-01-13 16:25:38	2008-09-20 01:57:28
143281	cubesixel	1	https://github.com/mojombo/cubesixel	https://api.github.com/repos/mojombo/cubesixel/subscription	https://github.com/mojombo/cubesixel.git	A pixel font (native size 7x7) I made in a different life	\N	154	3	1	\N	22	2009-03-04 21:00:25	2021-01-13 16:26:07	2014-02-18 22:10:05
156953038	docz-website	1	https://github.com/mojombo/docz-website	https://api.github.com/repos/mojombo/docz-website/subscription	https://github.com/mojombo/docz-website.git	\N	TypeScript	1360	0	0	\N	1	2018-11-10 04:07:54	2021-01-13 16:57:05	2018-11-10 04:28:05
19398	egitd	1	https://github.com/mojombo/egitd	https://api.github.com/repos/mojombo/egitd/subscription	https://github.com/mojombo/egitd.git	The Erlang git-daemon	Erlang	270	18	1	\N	108	2008-05-24 17:36:13	2021-01-13 16:25:26	2014-02-18 22:01:34
135769	endo	1	https://github.com/mojombo/endo	https://api.github.com/repos/mojombo/endo/subscription	https://github.com/mojombo/endo.git	Test repo for talk.	\N	84	2	0	\N	3	2009-02-23 19:48:51	2021-01-13 16:26:06	2009-02-23 20:38:37
30322	erlang_pipe	1	https://github.com/mojombo/erlang_pipe	https://api.github.com/repos/mojombo/erlang_pipe/subscription	https://github.com/mojombo/erlang_pipe.git	A pipe implementation in pure Erlang	Erlang	77	3	0	\N	19	2008-07-01 13:40:14	2021-01-13 16:25:34	2008-08-03 05:25:18
3010	erlectricity	1	https://github.com/mojombo/erlectricity	https://api.github.com/repos/mojombo/erlectricity/subscription	https://github.com/mojombo/erlectricity.git	Erlectricity exposes Ruby to Erlang and vice versa.	Ruby	200	46	4	\N	339	2008-03-07 22:32:13	2021-01-21 11:33:47	2009-10-28 17:40:13
189157	erlectricity-presentation	1	https://github.com/mojombo/erlectricity-presentation	https://api.github.com/repos/mojombo/erlectricity-presentation/subscription	https://github.com/mojombo/erlectricity-presentation.git	\N	\N	12989	4	0	\N	4	2009-04-30 04:05:01	2021-01-13 16:26:18	2009-04-30 04:05:54
1602	erlenmeyer	1	https://github.com/mojombo/erlenmeyer	https://api.github.com/repos/mojombo/erlenmeyer/subscription	https://github.com/mojombo/erlenmeyer.git	A binding between erlang and mzscheme.	Scheme	93	0	0	\N	7	2008-02-28 00:17:49	2021-01-13 16:25:22	2008-03-26 15:36:22
204419	ernie	1	https://github.com/mojombo/ernie	https://api.github.com/repos/mojombo/ernie/subscription	https://github.com/mojombo/ernie.git	Ernie is an Erlang/Ruby BERT-RPC Server.	Erlang	277	55	9	\N	447	2009-05-18 22:51:40	2021-01-17 00:28:56	2011-12-07 06:32:23
326535	eventmachine	1	https://github.com/mojombo/eventmachine	https://api.github.com/repos/mojombo/eventmachine/subscription	https://github.com/mojombo/eventmachine.git	EventMachine: fast, simple event-processing library for Ruby programs	Ruby	1378	4	0	\N	10	2009-10-04 17:24:34	2021-01-13 16:27:11	2009-10-04 17:35:25
128616	fakegem	1	https://github.com/mojombo/fakegem	https://api.github.com/repos/mojombo/fakegem/subscription	https://github.com/mojombo/fakegem.git	This is a fake gem so I can test GitHub's gem building when I need to	Ruby	84	1	0	\N	3	2009-02-13 23:48:53	2021-01-13 16:26:05	2009-02-14 00:02:01
1015	fixture-scenarios	1	https://github.com/mojombo/fixture-scenarios	https://api.github.com/repos/mojombo/fixture-scenarios/subscription	https://github.com/mojombo/fixture-scenarios.git	This plugin allows you to create 'scenarios' which are collections of fixtures and ruby files that represent a context against which you can run tests.	Ruby	91	14	1	\N	17	2008-02-23 01:25:57	2021-01-13 16:25:22	2017-02-16 05:55:22
70276	git	1	https://github.com/mojombo/git	https://api.github.com/repos/mojombo/git/subscription	https://github.com/mojombo/git.git	GitHub mirror of the publicly available git repo, updated hourly.  It's here so we can use the collaboration tools of GitHub. Updates ONLY from git public repo.  If you want changes pulled, contact the git team, not me.	C	15879	5	0	\N	10	2008-10-31 20:57:51	2021-01-13 16:25:51	2008-10-31 12:01:16
53286	git-bzr	1	https://github.com/mojombo/git-bzr	https://api.github.com/repos/mojombo/git-bzr/subscription	https://github.com/mojombo/git-bzr.git	A bidirectional Git - Bazaar gateway	\N	90	1	0	\N	7	2008-09-16 17:04:23	2021-01-13 16:25:38	2008-08-17 18:28:29
173084	github-flavored-markdown	1	https://github.com/mojombo/github-flavored-markdown	https://api.github.com/repos/mojombo/github-flavored-markdown/subscription	https://github.com/mojombo/github-flavored-markdown.git	GitHub's Flavor of Markdown	\N	127	91	37	\N	183	2009-04-10 18:57:08	2021-01-30 14:49:09	2009-04-10 19:59:38
58173	github-gem	1	https://github.com/mojombo/github-gem	https://api.github.com/repos/mojombo/github-gem/subscription	https://github.com/mojombo/github-gem.git	The official `github` command line helper for simplifying your GitHub experience.	Ruby	238	0	0	\N	5	2008-09-30 19:29:14	2021-01-13 16:25:38	2008-09-30 19:30:48
61	glowstick	1	https://github.com/mojombo/glowstick	https://api.github.com/repos/mojombo/glowstick/subscription	https://github.com/mojombo/glowstick.git	A realtime, OpenGL graphing library for Ruby	Ruby	86	10	1	\N	28	2008-01-16 22:40:56	2021-01-16 22:02:38	2008-03-26 16:09:11
28	god	1	https://github.com/mojombo/god	https://api.github.com/repos/mojombo/god/subscription	https://github.com/mojombo/god.git	Ruby process monitor	Ruby	2639	489	115	\N	2157	2008-01-13 03:16:23	2021-01-29 18:32:35	2018-11-08 11:14:11
818161	gollum-demo	1	https://github.com/mojombo/gollum-demo	https://api.github.com/repos/mojombo/gollum-demo/subscription	https://github.com/mojombo/gollum-demo.git	Gollum test repo	Perl	2386	210	3	\N	74	2010-08-04 20:49:22	2021-01-13 16:29:31	2017-10-08 21:11:59
1	grit	1	https://github.com/mojombo/grit	https://api.github.com/repos/mojombo/grit/subscription	https://github.com/mojombo/grit.git	**Grit is no longer maintained. Check out libgit2/rugged.** Grit gives you object oriented read/write access to Git repositories via Ruby.	Ruby	7954	531	26	\N	1904	2007-10-29 12:37:16	2021-01-25 15:00:32	2020-10-01 00:55:32
1861402	ace	2	https://github.com/defunkt/ace	https://api.github.com/repos/defunkt/ace/subscription	https://github.com/defunkt/ace.git	Ajax.org Cloud9 Editor	JavaScript	4405	6	0	\N	16	2011-06-07 15:41:40	2021-01-13 16:31:48	2011-11-16 16:37:42
3594	acts_as_textiled	2	https://github.com/defunkt/acts_as_textiled	https://api.github.com/repos/defunkt/acts_as_textiled/subscription	https://github.com/defunkt/acts_as_textiled.git	Makes your models act as textiled.	Ruby	333	33	4	\N	114	2008-03-12 03:20:18	2021-01-13 16:25:23	2011-07-21 18:38:47
36	ambition	2	https://github.com/defunkt/ambition	https://api.github.com/repos/defunkt/ambition/subscription	https://github.com/defunkt/ambition.git	include Enumerable — Unmaintained	Ruby	473	17	1	\N	153	2008-01-14 04:28:56	2021-01-20 09:30:29	2015-04-23 21:18:24
230	ambitious_activeldap	2	https://github.com/defunkt/ambitious_activeldap	https://api.github.com/repos/defunkt/ambitious_activeldap/subscription	https://github.com/defunkt/ambitious_activeldap.git	Ambition adapter for ActiveLdap	Ruby	96	3	0	\N	7	2008-01-30 17:20:08	2021-01-13 16:25:21	2008-03-26 16:10:57
12641	ambitious_activerecord	2	https://github.com/defunkt/ambitious_activerecord	https://api.github.com/repos/defunkt/ambitious_activerecord/subscription	https://github.com/defunkt/ambitious_activerecord.git	Unmaintained Ambitious ActiveRecord adapter, for Ambition.	Ruby	95	3	1	\N	13	2008-04-26 06:10:20	2021-01-13 16:25:26	2008-04-26 07:14:04
4180	barefootexamples	2	https://github.com/defunkt/barefootexamples	https://api.github.com/repos/defunkt/barefootexamples/subscription	https://github.com/defunkt/barefootexamples.git	\N	Ruby	83	4	0	\N	6	2008-03-17 03:29:50	2021-01-13 16:25:23	2008-03-26 17:57:13
15939	body_matcher	2	https://github.com/defunkt/body_matcher	https://api.github.com/repos/defunkt/body_matcher/subscription	https://github.com/defunkt/body_matcher.git	Simplify your view testing. Forget assert_select.	Ruby	85	2	0	\N	9	2008-05-11 01:54:44	2021-01-13 16:25:26	2008-05-11 01:54:46
288271	burn	2	https://github.com/defunkt/burn	https://api.github.com/repos/defunkt/burn/subscription	https://github.com/defunkt/burn.git	Sinatra => Campfire	\N	82	3	0	\N	6	2009-08-25 22:31:54	2021-01-13 16:26:56	2009-08-25 23:13:06
93	cache_fu	2	https://github.com/defunkt/cache_fu	https://api.github.com/repos/defunkt/cache_fu/subscription	https://github.com/defunkt/cache_fu.git	Ghost from Christmas past. Unmaintained.	Ruby	105	72	6	\N	252	2008-01-22 22:28:10	2021-01-13 16:25:20	2009-10-03 22:54:43
3591	cheat	2	https://github.com/defunkt/cheat	https://api.github.com/repos/defunkt/cheat/subscription	https://github.com/defunkt/cheat.git	Cheating is fun!	Ruby	235	41	3	\N	239	2008-03-12 03:09:09	2021-01-13 16:25:23	2015-11-17 17:31:56
45193	cheat.el	2	https://github.com/defunkt/cheat.el	https://api.github.com/repos/defunkt/cheat.el/subscription	https://github.com/defunkt/cheat.el.git	Cheat Emacs mode	Emacs Lisp	120	4	0	\N	14	2008-08-23 03:01:37	2021-01-13 16:25:36	2008-12-03 21:55:16
12527	choice	2	https://github.com/defunkt/choice	https://api.github.com/repos/defunkt/choice/subscription	https://github.com/defunkt/choice.git	Choice is a gem for defining and parsing command line options with a friendly DSL.	Ruby	145	22	1	\N	174	2008-04-25 15:30:30	2021-01-13 16:25:26	2016-12-14 03:29:58
270226	cijoe	2	https://github.com/defunkt/cijoe	https://api.github.com/repos/defunkt/cijoe/subscription	https://github.com/defunkt/cijoe.git	CI Joe is a fun Continuous Integration server. Unmaintained.	Ruby	425	134	18	\N	1055	2009-08-05 21:20:39	2021-01-13 16:26:52	2011-10-01 19:56:55
550681	coffee-mode	2	https://github.com/defunkt/coffee-mode	https://api.github.com/repos/defunkt/coffee-mode/subscription	https://github.com/defunkt/coffee-mode.git	Emacs Major Mode for CoffeeScript	Emacs Lisp	811	156	15	\N	573	2010-03-07 05:30:40	2021-01-13 16:28:24	2020-03-15 08:33:46
388149	colored	2	https://github.com/defunkt/colored	https://api.github.com/repos/defunkt/colored/subscription	https://github.com/defunkt/colored.git	Colors in your terminal. Unmaintained.	Ruby	120	42	6	\N	264	2009-11-28 04:16:20	2021-01-23 14:13:19	2020-01-21 06:10:01
12220	currency_converter	2	https://github.com/defunkt/currency_converter	https://api.github.com/repos/defunkt/currency_converter/subscription	https://github.com/defunkt/currency_converter.git	\N	Objective-C	374	4	0	\N	8	2008-04-24 06:34:31	2021-01-13 16:25:26	2008-04-24 06:36:14
18570642	d3	2	https://github.com/defunkt/d3	https://api.github.com/repos/defunkt/d3/subscription	https://github.com/defunkt/d3.git	A JavaScript visualization library for HTML and SVG.	JavaScript	34521	1	0	\N	4	2014-04-08 15:45:26	2021-01-13 16:41:36	2014-04-08 15:46:26
91988	defunkt.github.com	2	https://github.com/defunkt/defunkt.github.com	https://api.github.com/repos/defunkt/defunkt.github.com/subscription	https://github.com/defunkt/defunkt.github.com.git	My GitHub Page	\N	3011	55	4	\N	74	2008-12-17 05:53:14	2021-01-13 16:25:53	2020-12-17 07:53:01
628288	djangode	2	https://github.com/defunkt/djangode	https://api.github.com/repos/defunkt/djangode/subscription	https://github.com/defunkt/djangode.git	Utilities functions for node.js that borrow some useful concepts from Django	JavaScript	191	3	0	\N	9	2010-04-25 13:41:30	2021-01-13 16:28:52	2010-04-25 13:42:56
2448060	dodgeball.github.com	2	https://github.com/defunkt/dodgeball.github.com	https://api.github.com/repos/defunkt/dodgeball.github.com/subscription	https://github.com/defunkt/dodgeball.github.com.git	yes	Ruby	534	6	0	\N	10	2011-09-24 00:01:09	2021-01-13 16:32:39	2011-09-24 00:01:22
5171653	dotenv	2	https://github.com/defunkt/dotenv	https://api.github.com/repos/defunkt/dotenv/subscription	https://github.com/defunkt/dotenv.git	Loads environment variables from `.env`. 	Ruby	75	3	0	\N	10	2012-07-24 18:43:19	2021-01-13 16:34:59	2012-07-24 01:30:34
1336779	dotjs	2	https://github.com/defunkt/dotjs	https://api.github.com/repos/defunkt/dotjs/subscription	https://github.com/defunkt/dotjs.git	~/.js	Ruby	579	373	25	\N	3180	2011-02-07 05:01:33	2021-01-18 21:37:29	2018-07-26 13:09:13
69384	electron-wordwrap	2	https://github.com/defunkt/electron-wordwrap	https://api.github.com/repos/defunkt/electron-wordwrap/subscription	https://github.com/defunkt/electron-wordwrap.git	\N	\N	76	4	0	\N	5	2008-10-29 18:03:17	2021-01-13 16:25:51	2008-10-29 18:28:21
43903	emacs	2	https://github.com/defunkt/emacs	https://api.github.com/repos/defunkt/emacs/subscription	https://github.com/defunkt/emacs.git	My Emacs config	Emacs Lisp	1705	44	0	\N	186	2008-08-19 07:50:19	2021-01-13 16:25:36	2011-10-25 19:53:46
2998404	email_reply_parser	2	https://github.com/defunkt/email_reply_parser	https://api.github.com/repos/defunkt/email_reply_parser/subscription	https://github.com/defunkt/email_reply_parser.git	\N	Ruby	137	5	0	\N	7	2011-12-16 21:13:05	2021-01-13 16:33:17	2011-12-16 21:13:24
1852983	curb	7	https://github.com/evanphx/curb	https://api.github.com/repos/evanphx/curb/subscription	https://github.com/evanphx/curb.git	Ruby bindings for libcurl	C	451	1	0	\N	2	2011-06-06 01:21:18	2018-02-18 17:57:07	2011-06-06 02:08:41
1167457	evilbot	2	https://github.com/defunkt/evilbot	https://api.github.com/repos/defunkt/evilbot/subscription	https://github.com/defunkt/evilbot.git	an evil bot that's definitely not for convore	CoffeeScript	156	15	0	\N	48	2010-12-14 06:09:11	2021-01-13 16:30:19	2011-02-16 05:34:00
35	exception_logger	2	https://github.com/defunkt/exception_logger	https://api.github.com/repos/defunkt/exception_logger/subscription	https://github.com/defunkt/exception_logger.git	Unmaintained. Sorry.	Ruby	232	86	2	\N	233	2008-01-14 01:32:19	2021-01-23 07:19:38	2016-01-01 02:57:28
425	facebox	2	https://github.com/defunkt/facebox	https://api.github.com/repos/defunkt/facebox/subscription	https://github.com/defunkt/facebox.git	Facebook-style lightbox, built in jQuery	JavaScript	1174	420	28	\N	1959	2008-02-11 20:49:27	2021-01-27 05:25:13	2013-07-15 16:55:04
5211331	faceup	2	https://github.com/defunkt/faceup	https://api.github.com/repos/defunkt/faceup/subscription	https://github.com/defunkt/faceup.git	More than just mustaches.	JavaScript	1994	6	1	\N	10	2012-07-27 23:11:56	2021-01-13 16:35:06	2012-07-27 23:40:26
3596	fixture_scenarios_builder	2	https://github.com/defunkt/fixture_scenarios_builder	https://api.github.com/repos/defunkt/fixture_scenarios_builder/subscription	https://github.com/defunkt/fixture_scenarios_builder.git	Build your fixtures in Ruby.	Ruby	96	6	0	\N	14	2008-03-12 03:24:02	2021-01-13 16:25:23	2008-11-12 20:58:39
4061	auto_migrations	3	https://github.com/pjhyett/auto_migrations	https://api.github.com/repos/pjhyett/auto_migrations/subscription	https://github.com/pjhyett/auto_migrations.git	Rails plugin for automating migrations	Ruby	118	41	1	\N	143	2008-03-15 21:44:24	2020-08-10 00:24:58	2013-04-25 17:41:57
112071	blackjax	3	https://github.com/pjhyett/blackjax	https://api.github.com/repos/pjhyett/blackjax/subscription	https://github.com/pjhyett/blackjax.git	buzzword-powered blackjack game	Ruby	170	10	0	\N	9	2009-01-21 18:45:27	2021-01-13 16:26:04	2009-01-21 18:50:19
592	errcount	3	https://github.com/pjhyett/errcount	https://api.github.com/repos/pjhyett/errcount/subscription	https://github.com/pjhyett/errcount.git	simple mongrel handler for a sweet hit counter	Ruby	109	8	2	\N	8	2008-02-15 19:07:30	2019-08-13 10:21:25	2008-03-26 16:15:12
5281804	git-server	3	https://github.com/pjhyett/git-server	https://api.github.com/repos/pjhyett/git-server/subscription	https://github.com/pjhyett/git-server.git	pure ruby version of git daemon server functions	Ruby	80	2	0	\N	1	2012-08-03 02:54:17	2018-03-13 05:07:25	2008-08-17 18:26:49
13163	github-services	3	https://github.com/pjhyett/github-services	https://api.github.com/repos/pjhyett/github-services/subscription	https://github.com/pjhyett/github-services.git	Moved to http://github.com/github/github-services	Ruby	2256	53	0	\N	407	2008-04-28 20:41:21	2020-08-01 12:35:53	2018-08-30 08:54:05
561202	ThoughtStream	3	https://github.com/pjhyett/ThoughtStream	https://api.github.com/repos/pjhyett/ThoughtStream/subscription	https://github.com/pjhyett/ThoughtStream.git	rails-powered tumblelog i wrote in 2007	Ruby	300	7	0	\N	6	2010-03-13 19:17:26	2021-01-13 16:28:26	2010-03-13 19:18:36
590	vjot	3	https://github.com/pjhyett/vjot	https://api.github.com/repos/pjhyett/vjot/subscription	https://github.com/pjhyett/vjot.git	The greatest jotting web app of all time	JavaScript	1698	11	2	\N	7	2008-02-15 18:55:07	2019-08-13 10:21:25	2008-03-26 16:15:11
13727	zoned	3	https://github.com/pjhyett/zoned	https://api.github.com/repos/pjhyett/zoned/subscription	https://github.com/pjhyett/zoned.git	Rails plugin for dead-simple timezone support	Ruby	86	5	0	\N	10	2008-05-01 03:11:57	2021-01-13 16:25:26	2008-05-01 03:13:26
1119731	abbot-from-scratch	4	https://github.com/wycats/abbot-from-scratch	https://api.github.com/repos/wycats/abbot-from-scratch/subscription	https://github.com/wycats/abbot-from-scratch.git	\N	Ruby	213	4	1	\N	8	2010-11-28 15:49:44	2018-07-28 22:18:28	2012-01-27 17:53:46
911701	abbot-ng	4	https://github.com/wycats/abbot-ng	https://api.github.com/repos/wycats/abbot-ng/subscription	https://github.com/wycats/abbot-ng.git	a place to store my in-progress work on the redone SproutCore build tools	Ruby	102	2	0	\N	2	2010-09-15 01:25:23	2019-03-25 15:07:09	2010-09-15 01:25:39
3092609	activerecord-import	4	https://github.com/wycats/activerecord-import	https://api.github.com/repos/wycats/activerecord-import/subscription	https://github.com/wycats/activerecord-import.git	Extraction of the ActiveRecord::Base#import functionality from ar-extensions for Rails 3 and beyon	Ruby	3825	1	0	\N	2	2012-01-03 05:26:10	2018-07-28 22:18:27	2012-01-03 06:42:17
591370	active_params	4	https://github.com/wycats/active_params	https://api.github.com/repos/wycats/active_params/subscription	https://github.com/wycats/active_params.git	\N	\N	89	1	0	\N	7	2010-04-02 04:32:46	2021-01-13 16:28:38	2010-04-02 04:43:48
18471501	agendas	4	https://github.com/wycats/agendas	https://api.github.com/repos/wycats/agendas/subscription	https://github.com/wycats/agendas.git	TC39 meeting agendas	\N	191	1	0	\N	0	2014-04-05 13:57:08	2018-03-13 05:07:04	2014-04-05 13:57:54
577073	alexandria	4	https://github.com/wycats/alexandria	https://api.github.com/repos/wycats/alexandria/subscription	https://github.com/wycats/alexandria.git	Ruby bindings to the Google Data API	Ruby	103	2	0	\N	10	2010-03-24 04:07:30	2021-01-13 16:28:36	2010-04-11 17:03:01
14129810	allocation_counter	4	https://github.com/wycats/allocation_counter	https://api.github.com/repos/wycats/allocation_counter/subscription	https://github.com/wycats/allocation_counter.git	\N	Ruby	102	2	0	\N	7	2013-11-05 00:18:29	2018-03-13 05:07:00	2013-11-13 19:57:52
137634194	argon	4	https://github.com/wycats/argon	https://api.github.com/repos/wycats/argon/subscription	https://github.com/wycats/argon.git	\N	Rust	437	1	5	\N	12	2018-06-17 03:33:41	2020-06-05 22:28:48	2018-08-24 02:15:31
138977917	argon-example	4	https://github.com/wycats/argon-example	https://api.github.com/repos/wycats/argon-example/subscription	https://github.com/wycats/argon-example.git	\N	\N	0	0	0	\N	1	2018-06-28 03:48:38	2018-06-29 04:58:30	2018-06-28 03:50:23
578427	artifice	4	https://github.com/wycats/artifice	https://api.github.com/repos/wycats/artifice/subscription	https://github.com/wycats/artifice.git	Replaces Net::HTTP with a subclass that routes all requests to a Rack application	Ruby	16	15	12	\N	215	2010-03-24 22:36:42	2021-01-13 16:28:37	2020-02-29 05:34:55
842499	asdf	4	https://github.com/wycats/asdf	https://api.github.com/repos/wycats/asdf/subscription	https://github.com/wycats/asdf.git	Make the current directory available on port 9292	Ruby	202	5	3	\N	33	2010-08-16 21:42:23	2020-04-14 23:42:38	2010-08-16 21:43:14
53125	at-media	4	https://github.com/wycats/at-media	https://api.github.com/repos/wycats/at-media/subscription	https://github.com/wycats/at-media.git	The code from my @media talk	\N	117	1	0	\N	3	2008-09-16 07:56:47	2019-08-13 10:35:17	2008-09-16 08:00:31
43278408	atom-pain-split	4	https://github.com/wycats/atom-pain-split	https://api.github.com/repos/wycats/atom-pain-split/subscription	https://github.com/wycats/atom-pain-split.git	Adds additional pane-splitting commands to your favorite editor, provided your favorite editor is Atom.	CoffeeScript	249	1	0	\N	0	2015-09-28 00:42:07	2018-03-13 05:06:51	2015-05-18 19:59:11
86851893	bench-backburner	4	https://github.com/wycats/bench-backburner	https://api.github.com/repos/wycats/bench-backburner/subscription	https://github.com/wycats/bench-backburner.git	Benchmark backburner	TypeScript	184	0	0	\N	0	2017-03-31 16:08:00	2018-03-13 05:06:49	2017-03-23 15:50:44
14327	benchwarmer	4	https://github.com/wycats/benchwarmer	https://api.github.com/repos/wycats/benchwarmer/subscription	https://github.com/wycats/benchwarmer.git	Prettier Benchmarking for Ruby	Ruby	93	5	0	\N	31	2008-05-03 18:22:10	2019-08-13 10:23:59	2008-05-06 04:11:23
191712	blue-ridge	4	https://github.com/wycats/blue-ridge	https://api.github.com/repos/wycats/blue-ridge/subscription	https://github.com/wycats/blue-ridge.git	JavaScript BDD Rails Plugin (using Screw.Unit &amp; env.js)	Ruby	10494	1	0	\N	21	2009-05-03 18:39:35	2019-08-13 11:23:29	2009-05-04 09:02:32
13535854	bootstrap-nitrous	4	https://github.com/wycats/bootstrap-nitrous	https://api.github.com/repos/wycats/bootstrap-nitrous/subscription	https://github.com/wycats/bootstrap-nitrous.git	\N	Ruby	112	1	0	\N	2	2013-10-13 04:56:38	2018-03-13 05:06:43	2013-12-22 00:11:52
49158298	broccoli-concat	4	https://github.com/wycats/broccoli-concat	https://api.github.com/repos/wycats/broccoli-concat/subscription	https://github.com/wycats/broccoli-concat.git	Concatenate broccoli trees	JavaScript	113	1	0	\N	0	2016-01-06 18:01:05	2018-03-13 05:06:41	2015-12-22 00:59:43
196286715	broccoli-typescript-compiler	4	https://github.com/wycats/broccoli-typescript-compiler	https://api.github.com/repos/wycats/broccoli-typescript-compiler/subscription	https://github.com/wycats/broccoli-typescript-compiler.git	\N	TypeScript	499	0	0	\N	0	2019-07-10 20:16:12	2019-07-10 20:17:05	2019-07-10 20:23:57
244703	bundler	4	https://github.com/wycats/bundler	https://api.github.com/repos/wycats/bundler/subscription	https://github.com/wycats/bundler.git	\N	Ruby	717	31	81	\N	412	2009-07-06 19:08:44	2021-01-28 15:58:35	2010-02-03 21:03:34
1912104	cafe	4	https://github.com/wycats/cafe	https://api.github.com/repos/wycats/cafe/subscription	https://github.com/wycats/cafe.git	Brewing up some JavaScript.	JavaScript	1165	1	0	\N	3	2011-06-17 13:38:59	2019-08-13 11:46:44	2011-03-29 23:54:15
21256790	cargo	4	https://github.com/wycats/cargo	https://api.github.com/repos/wycats/cargo/subscription	https://github.com/wycats/cargo.git	Cargo Experiments	Rust	8733	1	0	\N	1	2014-06-26 19:18:01	2018-08-04 13:52:52	2014-08-15 19:18:22
21112934	cargo-website	4	https://github.com/wycats/cargo-website	https://api.github.com/repos/wycats/cargo-website/subscription	https://github.com/wycats/cargo-website.git	\N	CSS	11027	18	4	\N	5	2014-06-23 00:34:27	2020-10-01 03:10:31	2020-10-01 03:14:02
773625	chainable_compare	4	https://github.com/wycats/chainable_compare	https://api.github.com/repos/wycats/chainable_compare/subscription	https://github.com/wycats/chainable_compare.git	\N	Ruby	90	2	0	\N	11	2010-07-13 21:21:55	2019-08-13 11:34:58	2010-07-13 22:52:04
140189962	codespan	4	https://github.com/wycats/codespan	https://api.github.com/repos/wycats/codespan/subscription	https://github.com/wycats/codespan.git	Utilities for dealing with source code locations and pretty diagnostic formatting	Rust	272	0	0	\N	1	2018-07-08 14:51:21	2018-08-04 13:52:45	2018-07-26 19:09:31
21112162	color-rs	4	https://github.com/wycats/color-rs	https://api.github.com/repos/wycats/color-rs/subscription	https://github.com/wycats/color-rs.git	A library that provides types and conversions for working with various color formats.	Rust	1271	1	0	\N	0	2014-06-22 23:56:31	2018-03-13 05:06:31	2014-06-23 23:51:28
2092604	Command-T	4	https://github.com/wycats/Command-T	https://api.github.com/repos/wycats/Command-T/subscription	https://github.com/wycats/Command-T.git	Mirror of the official Command-T repository at git.wincent.com	Ruby	569	0	0	\N	1	2011-07-23 07:02:42	2018-03-13 05:05:21	2011-07-23 07:03:57
231467913	core-data	4	https://github.com/wycats/core-data	https://api.github.com/repos/wycats/core-data/subscription	https://github.com/wycats/core-data.git	Very experimental data layer	TypeScript	1270	0	3	\N	3	2020-01-02 19:14:11	2020-08-20 12:33:11	2021-01-21 10:15:22
167740103	core-storage	4	https://github.com/wycats/core-storage	https://api.github.com/repos/wycats/core-storage/subscription	https://github.com/wycats/core-storage.git	\N	TypeScript	34	0	0	\N	4	2019-01-26 19:19:30	2019-01-31 15:13:18	2019-01-31 15:13:16
27060736	crates.io	4	https://github.com/wycats/crates.io	https://api.github.com/repos/wycats/crates.io/subscription	https://github.com/wycats/crates.io.git	Source code for crates.io	Rust	965	1	0	\N	0	2014-11-24 02:33:45	2018-03-13 05:05:19	2014-11-24 02:34:33
5282	acl_system2	5	https://github.com/ezmobius/acl_system2	https://api.github.com/repos/ezmobius/acl_system2/subscription	https://github.com/ezmobius/acl_system2.git	An access control plugin for Rails	Ruby	113	15	1	\N	57	2008-03-25 16:00:13	2020-07-01 17:11:19	2008-10-13 18:03:58
131	bmhsearch	5	https://github.com/ezmobius/bmhsearch	https://api.github.com/repos/ezmobius/bmhsearch/subscription	https://github.com/ezmobius/bmhsearch.git	Fast string searcher, useful for multi-part post parsing	C	102	2	1	\N	8	2008-01-28 00:22:50	2020-11-08 04:44:06	2008-03-26 16:09:49
118801	chef-101	5	https://github.com/ezmobius/chef-101	https://api.github.com/repos/ezmobius/chef-101/subscription	https://github.com/ezmobius/chef-101.git	A sample chef recipe repo for learning chef-solo	Ruby	85	8	0	\N	61	2009-01-31 15:28:08	2019-08-13 10:57:29	2009-01-31 16:49:23
158501	chef-deploy	5	https://github.com/ezmobius/chef-deploy	https://api.github.com/repos/ezmobius/chef-deploy/subscription	https://github.com/ezmobius/chef-deploy.git	Chef Resources and Providers for deploying ruby web apps without capistrano	Ruby	130	31	6	\N	297	2009-03-24 18:22:28	2019-08-13 11:11:59	2011-06-19 17:17:01
277593	ey-lessql	5	https://github.com/ezmobius/ey-lessql	https://api.github.com/repos/ezmobius/ey-lessql/subscription	https://github.com/ezmobius/ey-lessql.git	a collection of chef recipes to install, configure and run a variety of NoSQL db's on the engine yard cloud.	Ruby	80	10	0	\N	39	2009-08-14 00:17:52	2019-08-13 11:27:29	2009-10-23 15:35:29
1104253	ez-scheme	5	https://github.com/ezmobius/ez-scheme	https://api.github.com/repos/ezmobius/ez-scheme/subscription	https://github.com/ezmobius/ez-scheme.git	scheme on the rbx vm	Ruby	739	4	0	\N	27	2010-11-22 23:55:24	2020-10-15 14:10:09	2013-10-27 01:05:03
27148	ez-where	5	https://github.com/ezmobius/ez-where	https://api.github.com/repos/ezmobius/ez-where/subscription	https://github.com/ezmobius/ez-where.git	query/conditions builder for ActiveRecord and other ORMS	Ruby	87	4	0	\N	34	2008-06-20 17:14:55	2020-07-03 13:03:51	2009-10-28 19:09:25
1103712	heist	5	https://github.com/ezmobius/heist	https://api.github.com/repos/ezmobius/heist/subscription	https://github.com/ezmobius/heist.git	Scheme in as little Ruby and as much Scheme as possible. Supports macros, continuations, tail recursion and lazy evaluation.	Ruby	1184	1	0	\N	1	2010-11-22 19:57:27	2018-03-13 05:04:12	2010-07-27 18:17:41
5226605	LocheGSplicer	5	https://github.com/ezmobius/LocheGSplicer	https://api.github.com/repos/ezmobius/LocheGSplicer/subscription	https://github.com/ezmobius/LocheGSplicer.git	Splices multiple 3D Printer gcode files into a single gcode file for multiple extruder printing.	C++	2165	3	0	\N	5	2012-07-29 20:27:24	2018-03-13 05:04:11	2012-07-29 01:08:00
1363875	lua-nginx-module	5	https://github.com/ezmobius/lua-nginx-module	https://api.github.com/repos/ezmobius/lua-nginx-module/subscription	https://github.com/ezmobius/lua-nginx-module.git	Embed the Power of Lua into NginX	Perl	5874	1	0	\N	2	2011-02-14 01:51:50	2018-03-13 05:04:09	2011-02-14 01:55:00
14497	merbivore	5	https://github.com/ezmobius/merbivore	https://api.github.com/repos/ezmobius/merbivore/subscription	https://github.com/ezmobius/merbivore.git	merb website	Ruby	201	4	0	\N	4	2008-05-04 17:37:24	2019-08-13 10:24:01	2020-10-02 08:56:33
5964	nanite	5	https://github.com/ezmobius/nanite	https://api.github.com/repos/ezmobius/nanite/subscription	https://github.com/ezmobius/nanite.git	self assembling fabric of ruby daemons	Ruby	29179	66	13	\N	738	2008-03-31 05:32:08	2021-01-28 07:50:27	2010-12-22 08:21:32
1099441	nats	5	https://github.com/ezmobius/nats	https://api.github.com/repos/ezmobius/nats/subscription	https://github.com/ezmobius/nats.git	A simple and performant EventMachine based Publish-Subscribe system. 	Ruby	205	1	0	\N	1	2010-11-21 08:29:27	2018-03-13 05:04:03	2010-11-22 08:30:24
112754	nginx-ey-balancer	5	https://github.com/ezmobius/nginx-ey-balancer	https://api.github.com/repos/ezmobius/nginx-ey-balancer/subscription	https://github.com/ezmobius/nginx-ey-balancer.git	nginx max connections queue	C	154	17	0	\N	32	2009-01-22 17:53:59	2020-06-12 18:11:03	2009-01-22 10:25:36
108340	ohai	5	https://github.com/ezmobius/ohai	https://api.github.com/repos/ezmobius/ohai/subscription	https://github.com/ezmobius/ohai.git	Ohai profiles your system and emits JSON	\N	258	0	0	\N	5	2009-01-15 19:58:21	2019-08-13 10:53:59	2009-01-15 18:52:26
455782	redactor	5	https://github.com/ezmobius/redactor	https://api.github.com/repos/ezmobius/redactor/subscription	https://github.com/ezmobius/redactor.git	An Actor library based around Redis. Useful for coordination, command and control of distributed ruby processes	Ruby	80	1	0	\N	66	2010-01-02 03:49:55	2021-01-13 16:27:53	2010-01-02 22:29:53
156717	redis	5	https://github.com/ezmobius/redis	https://api.github.com/repos/ezmobius/redis/subscription	https://github.com/ezmobius/redis.git	Redis key-value store	C	114	0	0	\N	8	2009-03-22 22:54:07	2020-07-07 06:18:13	2009-03-22 11:27:35
3717526	redis-rb	5	https://github.com/ezmobius/redis-rb	https://api.github.com/repos/ezmobius/redis-rb/subscription	https://github.com/ezmobius/redis-rb.git	A Ruby client library for Redis	Ruby	1449	8	1	\N	27	2012-03-14 09:48:05	2019-02-27 08:00:37	2016-07-18 17:39:17
1357116	super-nginx	5	https://github.com/ezmobius/super-nginx	https://api.github.com/repos/ezmobius/super-nginx/subscription	https://github.com/ezmobius/super-nginx.git	killer build of nginx *and* luajit-beta6 plus 21 other modules	C	4638	11	1	\N	148	2011-02-11 21:33:28	2021-01-13 16:30:52	2011-02-18 01:36:13
4983331	tlabs-mendelmax	5	https://github.com/ezmobius/tlabs-mendelmax	https://api.github.com/repos/ezmobius/tlabs-mendelmax/subscription	https://github.com/ezmobius/tlabs-mendelmax.git	Documentation and other tidbits for the TrinityLabs MendelMax 1.5+	\N	158	3	0	\N	8	2012-07-10 23:04:19	2018-03-13 05:03:43	2012-07-11 20:57:20
1740408	vcap-tests	5	https://github.com/ezmobius/vcap-tests	https://api.github.com/repos/ezmobius/vcap-tests/subscription	https://github.com/ezmobius/vcap-tests.git	Cloud Foundry - the open platform as a service project	Ruby	51524	1	0	\N	1	2011-05-12 17:55:30	2018-03-13 05:03:41	2011-05-14 08:57:35
1742412	vmc	5	https://github.com/ezmobius/vmc	https://api.github.com/repos/ezmobius/vmc/subscription	https://github.com/ezmobius/vmc.git	The command line client for Cloud Foundry - the open platform as a service project	Ruby	1166	2	0	\N	3	2011-05-13 05:12:48	2020-01-09 05:20:32	2011-05-16 17:44:47
18482177	adventure_cats	6	https://github.com/ivey/adventure_cats	https://api.github.com/repos/ivey/adventure_cats/subscription	https://github.com/ivey/adventure_cats.git	Adventure Cats, a game by Ellie and her Dad	JavaScript	9252	1	0	\N	0	2014-04-06 00:34:05	2018-03-13 05:03:37	2014-04-07 00:07:48
26449033	anaconda	6	https://github.com/ivey/anaconda	https://api.github.com/repos/ivey/anaconda/subscription	https://github.com/ivey/anaconda.git	A Go client library for the Twitter 1.1 API	Go	214	1	0	\N	0	2014-11-10 16:18:19	2018-03-13 05:03:36	2014-11-10 16:47:55
6681965	ascii	6	https://github.com/ivey/ascii	https://api.github.com/repos/ivey/ascii/subscription	https://github.com/ivey/ascii.git	Awesome ascii	\N	69	1	1	\N	0	2012-11-14 01:15:36	2018-03-13 05:03:34	2017-09-26 21:10:46
19782581	aws	6	https://github.com/ivey/aws	https://api.github.com/repos/ivey/aws/subscription	https://github.com/ivey/aws.git	Development repository for Opscode Cookbook aws	Ruby	234	0	0	\N	0	2014-05-14 11:28:23	2021-01-05 15:55:55	2014-05-14 11:52:38
101022	blog	6	https://github.com/ivey/blog	https://api.github.com/repos/ivey/blog/subscription	https://github.com/ivey/blog.git	\N	JavaScript	924	0	0	\N	3	2009-01-05 02:19:47	2019-08-13 10:51:31	2011-09-10 18:20:07
4875704	build-essential	6	https://github.com/ivey/build-essential	https://api.github.com/repos/ivey/build-essential/subscription	https://github.com/ivey/build-essential.git	Development repository for Opscode Cookbook build-essential	Ruby	82	0	0	\N	1	2012-07-03 15:21:05	2019-01-03 18:47:05	2012-06-22 17:46:19
9051	carpark	6	https://github.com/ivey/carpark	https://api.github.com/repos/ivey/carpark/subscription	https://github.com/ivey/carpark.git	Carpark adds LISP-style car, cdr, and endless combinations of them to the standard Ruby Array, allowing for terse and powerful decomposition of deeply nested arrays: [1, [2, 3, [4, 5], [[[6]]]]].caaaadddadr => 6	Ruby	82	2	1	\N	8	2008-04-12 01:50:00	2019-08-13 10:22:53	2008-07-24 14:32:14
1124294	chef	6	https://github.com/ivey/chef	https://api.github.com/repos/ivey/chef/subscription	https://github.com/ivey/chef.git	A systems integration framework, built to bring the benefits of configuration management to your entire infrastructure.	Ruby	62145	0	0	\N	2	2010-11-30 00:52:15	2018-02-18 18:26:28	2012-07-31 16:16:31
1762403	cinch-github	6	https://github.com/ivey/cinch-github	https://api.github.com/repos/ivey/cinch-github/subscription	https://github.com/ivey/cinch-github.git	Cinch Plugin to let bots interact with Github	Ruby	114	0	0	\N	2	2011-05-17 16:21:34	2018-02-18 18:26:32	2011-06-14 00:57:56
27444944	cli	6	https://github.com/ivey/cli	https://api.github.com/repos/ivey/cli/subscription	https://github.com/ivey/cli.git	A small package for building command line apps in Go	Go	388	0	0	\N	1	2014-12-02 15:42:28	2018-02-18 18:26:36	2015-03-03 19:01:51
908817	clj-gweezlebur-utils	6	https://github.com/ivey/clj-gweezlebur-utils	https://api.github.com/repos/ivey/clj-gweezlebur-utils/subscription	https://github.com/ivey/clj-gweezlebur-utils.git	ivey's clojure utility functions	Clojure	100	0	0	\N	2	2010-09-13 22:12:28	2018-02-18 18:26:40	2010-09-17 03:29:31
906305	clj-highrise	6	https://github.com/ivey/clj-highrise	https://api.github.com/repos/ivey/clj-highrise/subscription	https://github.com/ivey/clj-highrise.git	WORK IN PROGRESS, DO NOT USE	Clojure	96	0	0	\N	2	2010-09-13 00:30:29	2018-02-18 18:26:44	2010-09-13 00:31:24
1589365	colapp	6	https://github.com/ivey/colapp	https://api.github.com/repos/ivey/colapp/subscription	https://github.com/ivey/colapp.git	\N	Ruby	520	0	4	\N	3	2011-04-08 18:33:46	2018-02-18 18:26:48	2011-04-09 17:17:55
2137285	comatose	6	https://github.com/ivey/comatose	https://api.github.com/repos/ivey/comatose/subscription	https://github.com/ivey/comatose.git	Comatose is a micro CMS, implemented as a Rails plugin, that is designed to be easy to embed and extend.	JavaScript	694	0	0	\N	2	2011-08-01 12:02:40	2018-02-18 18:26:52	2011-08-01 12:07:01
2314912	dkpgrcsk	6	https://github.com/ivey/dkpgrcsk	https://api.github.com/repos/ivey/dkpgrcsk/subscription	https://github.com/ivey/dkpgrcsk.git	Asynchronous Python IRC bot with social networking plugins	Python	470	0	0	\N	2	2011-09-02 13:07:13	2018-02-18 18:26:56	2011-09-02 17:08:21
1661719	dropship	6	https://github.com/ivey/dropship	https://api.github.com/repos/ivey/dropship/subscription	https://github.com/ivey/dropship.git	Instantly transfer files between Dropbox accounts using only their hashes.	Python	209	0	0	\N	2	2011-04-25 18:13:40	2018-02-18 18:27:00	2011-04-25 16:38:15
84563	emacs-starter-kit	6	https://github.com/ivey/emacs-starter-kit	https://api.github.com/repos/ivey/emacs-starter-kit/subscription	https://github.com/ivey/emacs-starter-kit.git	All the code you need to get started, with an emphasis on dynamic languages.	Emacs Lisp	3208	0	0	\N	2	2008-12-03 19:03:14	2019-08-13 10:45:26	2011-09-27 13:13:52
107843	enigma-codebook	6	https://github.com/ivey/enigma-codebook	https://api.github.com/repos/ivey/enigma-codebook/subscription	https://github.com/ivey/enigma-codebook.git	Sinatra app to generate codebooks for Enigma machines	Ruby	188	1	0	\N	9	2009-01-15 04:38:20	2021-01-01 21:57:29	2009-01-15 13:56:18
2759816	ethical-eating	6	https://github.com/ivey/ethical-eating	https://api.github.com/repos/ivey/ethical-eating/subscription	https://github.com/ivey/ethical-eating.git	Gentle Guide to Ethical Eating	\N	320	0	0	\N	2	2011-11-12 00:03:50	2018-02-18 18:27:13	2011-11-12 01:09:41
476881	fav2rt	6	https://github.com/ivey/fav2rt	https://api.github.com/repos/ivey/fav2rt/subscription	https://github.com/ivey/fav2rt.git	Turn a set of Twitter favorites into Retweets	Ruby	121	1	0	\N	6	2010-01-18 00:10:01	2014-01-08 00:54:57	2014-01-08 00:54:55
59375	gist.el	6	https://github.com/ivey/gist.el	https://api.github.com/repos/ivey/gist.el/subscription	https://github.com/ivey/gist.el.git	Yet another Emacs paste mode, this one for Gist.	Emacs Lisp	118	0	0	\N	2	2008-10-03 19:24:45	2019-08-13 10:37:05	2010-11-04 22:03:19
100839	github-gem	6	https://github.com/ivey/github-gem	https://api.github.com/repos/ivey/github-gem/subscription	https://github.com/ivey/github-gem.git	The official `github` command line helper for simplifying your GitHub experience.	Ruby	409	1	0	\N	2	2009-01-04 19:37:01	2019-08-13 10:51:26	2009-11-02 02:22:22
17916214	github-selfies	6	https://github.com/ivey/github-selfies	https://api.github.com/repos/ivey/github-selfies/subscription	https://github.com/ivey/github-selfies.git	Everything is better with selfies. Yes, even pull requests. Don't argue.	JavaScript	116	0	0	\N	1	2014-03-19 15:47:51	2018-02-18 18:27:29	2014-03-18 21:59:36
53515418	go-bigip	6	https://github.com/ivey/go-bigip	https://api.github.com/repos/ivey/go-bigip/subscription	https://github.com/ivey/go-bigip.git	A Go package that interacts with F5 BIG-IP systems using the REST API.	Go	55	0	0	\N	1	2016-03-09 14:00:21	2018-02-18 18:27:33	2016-03-15 15:30:20
28249028	gobt	6	https://github.com/ivey/gobt	https://api.github.com/repos/ivey/gobt/subscription	https://github.com/ivey/gobt.git	Behavior Tree library for Go	Go	132	0	0	\N	1	2014-12-19 20:35:37	2018-02-18 18:27:37	2014-12-19 20:36:23
23688409	godep	6	https://github.com/ivey/godep	https://api.github.com/repos/ivey/godep/subscription	https://github.com/ivey/godep.git	dependency tool for go	\N	217	0	0	\N	1	2014-09-05 00:06:03	2018-02-18 18:27:41	2014-09-05 00:07:13
14216658	grit	6	https://github.com/ivey/grit	https://api.github.com/repos/ivey/grit/subscription	https://github.com/ivey/grit.git	Grit gives you object oriented read/write access to Git repositories via Ruby.	Ruby	2306	0	0	\N	0	2013-11-07 19:40:38	2020-01-09 05:21:08	2013-11-07 19:44:18
69065363	habitrpg	6	https://github.com/ivey/habitrpg	https://api.github.com/repos/ivey/habitrpg/subscription	https://github.com/ivey/habitrpg.git	A habit tracker app which treats your goals like a Role Playing Game.	JavaScript	528455	0	0	\N	1	2016-09-23 19:40:18	2018-02-18 18:27:49	2016-09-23 18:28:53
30257818	hipchat-go	6	https://github.com/ivey/hipchat-go	https://api.github.com/repos/ivey/hipchat-go/subscription	https://github.com/ivey/hipchat-go.git	Go client library for the HipChat API v2	Go	1868	0	0	\N	1	2015-02-03 16:27:08	2018-02-18 18:27:53	2015-02-03 18:30:37
1140955	homebrew	6	https://github.com/ivey/homebrew	https://api.github.com/repos/ivey/homebrew/subscription	https://github.com/ivey/homebrew.git	The missing package manager for OS X.	Ruby	7419	0	0	\N	2	2010-12-05 17:26:43	2018-02-18 18:27:57	2011-12-02 15:24:41
11374954	ace	7	https://github.com/evanphx/ace	https://api.github.com/repos/evanphx/ace/subscription	https://github.com/evanphx/ace.git	Ace (Ajax.org Cloud9 Editor)	JavaScript	20170	0	0	\N	1	2013-07-12 15:12:26	2018-02-18 17:56:11	2013-07-12 04:04:43
53301806	alexa	7	https://github.com/evanphx/alexa	https://api.github.com/repos/evanphx/alexa/subscription	https://github.com/evanphx/alexa.git	Golang interface to the Amazon Alexa Voice service	Go	30219	12	2	\N	79	2016-03-07 03:38:15	2020-12-15 10:40:28	2016-03-08 04:03:04
36110636	amqp	7	https://github.com/evanphx/amqp	https://api.github.com/repos/evanphx/amqp/subscription	https://github.com/evanphx/amqp.git	Go client for AMQP 0.9.1	Go	717	1	0	\N	1	2015-05-23 03:43:29	2018-02-18 17:56:19	2015-05-23 03:47:41
292633227	asus-fan-control	7	https://github.com/evanphx/asus-fan-control	https://api.github.com/repos/evanphx/asus-fan-control/subscription	https://github.com/evanphx/asus-fan-control.git	:cyclone: Fan control for ASUS devices running Linux.	\N	328	0	0	\N	0	2020-09-03 14:14:53	2020-09-03 14:14:55	2020-06-29 17:05:59
120141244	atc	7	https://github.com/evanphx/atc	https://api.github.com/repos/evanphx/atc/subscription	https://github.com/evanphx/atc.git	build scheduler and web interface	Go	159045	0	0	\N	1	2018-02-03 22:08:48	2018-02-18 17:56:23	2018-03-04 03:52:49
3814699	benchmark-ips	7	https://github.com/evanphx/benchmark-ips	https://api.github.com/repos/evanphx/benchmark-ips/subscription	https://github.com/evanphx/benchmark-ips.git	Provides iteration per second benchmarking for Ruby	Ruby	215	74	2	\N	1424	2012-03-23 23:58:55	2021-01-25 06:35:13	2021-01-23 21:00:38
56174118	benchmark.fyi	7	https://github.com/evanphx/benchmark.fyi	https://api.github.com/repos/evanphx/benchmark.fyi/subscription	https://github.com/evanphx/benchmark.fyi.git	A place to share benchmarking results	Ruby	30	6	6	\N	9	2016-04-13 14:54:18	2018-02-18 17:56:31	2020-10-01 11:24:57
1574968	benchmark_suite	7	https://github.com/evanphx/benchmark_suite	https://api.github.com/repos/evanphx/benchmark_suite/subscription	https://github.com/evanphx/benchmark_suite.git	A set of enhancements to benchmark.rb	Ruby	128	9	2	\N	45	2011-04-05 22:02:57	2019-10-14 01:17:07	2020-03-30 10:52:39
153561785	biscuit	7	https://github.com/evanphx/biscuit	https://api.github.com/repos/evanphx/biscuit/subscription	https://github.com/evanphx/biscuit.git	Biscuit research OS	Go	136397	0	0	\N	0	2018-10-18 01:05:11	2018-10-18 01:05:28	2018-10-10 21:45:37
56890691	blog	7	https://github.com/evanphx/blog	https://api.github.com/repos/evanphx/blog/subscription	https://github.com/evanphx/blog.git	The source for my blog	HTML	611	1	0	\N	1	2016-04-22 20:27:52	2018-02-18 17:56:39	2016-04-25 20:02:05
27151251	brigade	7	https://github.com/evanphx/brigade	https://api.github.com/repos/evanphx/brigade/subscription	https://github.com/evanphx/brigade.git	Parallel S3 bucket-bucket differential sync in Go	Go	2743	1	0	\N	1	2014-11-25 21:37:54	2018-02-18 17:56:43	2014-11-25 21:58:29
3382377	callbox	7	https://github.com/evanphx/callbox	https://api.github.com/repos/evanphx/callbox/subscription	https://github.com/evanphx/callbox.git	A twilio app to control my callbox	\N	108	1	0	\N	2	2012-02-07 21:07:22	2018-02-18 17:56:47	2012-02-07 21:12:56
1963084	chef	7	https://github.com/evanphx/chef	https://api.github.com/repos/evanphx/chef/subscription	https://github.com/evanphx/chef.git	A systems integration framework, built to bring the benefits of configuration management to your entire infrastructure.	Ruby	66433	0	0	\N	2	2011-06-27 19:45:00	2018-02-18 17:56:51	2013-06-20 15:58:19
453662	cijoe	7	https://github.com/evanphx/cijoe	https://api.github.com/repos/evanphx/cijoe/subscription	https://github.com/evanphx/cijoe.git	CI Joe is a simple Continuous Integration server.	Ruby	183	1	0	\N	2	2009-12-30 17:08:26	2018-02-18 17:56:55	2009-12-30 23:19:23
1141863	citrus	7	https://github.com/evanphx/citrus	https://api.github.com/repos/evanphx/citrus/subscription	https://github.com/evanphx/citrus.git	Parsing Expressions for Ruby	Ruby	4065	1	0	\N	4	2010-12-05 23:47:48	2018-02-18 17:56:59	2010-12-07 03:27:41
50541962	closure-library	7	https://github.com/evanphx/closure-library	https://api.github.com/repos/evanphx/closure-library/subscription	https://github.com/evanphx/closure-library.git	Google's common JavaScript library	JavaScript	57516	0	0	\N	1	2016-01-27 20:18:37	2018-02-18 17:57:03	2016-01-27 18:24:30
170611800	columbia	7	https://github.com/evanphx/columbia	https://api.github.com/repos/evanphx/columbia/subscription	https://github.com/evanphx/columbia.git	WebAssembly based Linux compatible Runtime	WebAssembly	281	1	0	\N	8	2019-02-14 00:14:29	2021-01-01 11:30:39	2019-02-21 02:59:04
4219286	distance_between	7	https://github.com/evanphx/distance_between	https://api.github.com/repos/evanphx/distance_between/subscription	https://github.com/evanphx/distance_between.git	A RubyMotion App that uses calculates the distance between 2 locations	Ruby	112	4	0	\N	24	2012-05-03 18:59:02	2018-02-28 13:46:19	2012-05-07 14:33:08
12006301	docker	7	https://github.com/evanphx/docker	https://api.github.com/repos/evanphx/docker/subscription	https://github.com/evanphx/docker.git	Docker - the open-source application container engine	Go	11238	0	0	\N	1	2013-08-09 14:10:08	2018-02-18 17:57:16	2013-08-18 00:04:03
123542493	docker-image-resource	7	https://github.com/evanphx/docker-image-resource	https://api.github.com/repos/evanphx/docker-image-resource/subscription	https://github.com/evanphx/docker-image-resource.git	a resource for docker images	Go	2090	0	0	\N	0	2018-03-02 03:56:18	2018-03-02 03:56:20	2018-03-04 19:43:31
12228164	dockrun	7	https://github.com/evanphx/dockrun	https://api.github.com/repos/evanphx/dockrun/subscription	https://github.com/evanphx/dockrun.git	This proof of concept docker run wrapper attempts to make docker containers behave like unix processes.	Go	56	1	0	\N	1	2013-08-19 18:33:06	2018-02-18 17:57:20	2013-08-19 18:36:06
42219753	docs	7	https://github.com/evanphx/docs	https://api.github.com/repos/evanphx/docs/subscription	https://github.com/evanphx/docs.git	Prometheus documentation: content and static site generator	CSS	1895	1	0	\N	1	2015-09-10 00:27:37	2018-02-18 17:57:25	2015-09-10 00:31:07
90999145	dotfiles	7	https://github.com/evanphx/dotfiles	https://api.github.com/repos/evanphx/dotfiles/subscription	https://github.com/evanphx/dotfiles.git	Various configuration files	Vim script	65	0	0	\N	1	2017-05-11 13:10:05	2020-09-05 19:30:28	2020-09-05 19:30:26
919566	dotvim	7	https://github.com/evanphx/dotvim	https://api.github.com/repos/evanphx/dotvim/subscription	https://github.com/evanphx/dotvim.git	my .vim directory	VimL	1235	1	0	\N	6	2010-09-17 19:23:46	2018-02-18 17:57:38	2016-06-21 14:49:37
22699	dr-nic-magic-awesome	7	https://github.com/evanphx/dr-nic-magic-awesome	https://api.github.com/repos/evanphx/dr-nic-magic-awesome/subscription	https://github.com/evanphx/dr-nic-magic-awesome.git	Magically fix your projects overnight!	\N	84	0	0	\N	3	2008-06-05 20:02:45	2019-08-13 10:26:06	2008-06-05 20:02:47
120140896	elm-ansi	7	https://github.com/evanphx/elm-ansi	https://api.github.com/repos/evanphx/elm-ansi/subscription	https://github.com/evanphx/elm-ansi.git	ANSI stream handling for Elm	Elm	45	0	0	\N	1	2018-02-03 22:02:26	2018-02-18 17:57:46	2018-02-03 22:06:16
2622905	engineyard	7	https://github.com/evanphx/engineyard	https://api.github.com/repos/evanphx/engineyard/subscription	https://github.com/evanphx/engineyard.git	Deploy to Engine Yard Cloud from the command line	Ruby	1273	1	0	\N	2	2011-10-21 18:28:17	2018-02-18 17:57:50	2011-10-21 18:34:18
91984	evanphx.github.com	7	https://github.com/evanphx/evanphx.github.com	https://api.github.com/repos/evanphx/evanphx.github.com/subscription	https://github.com/evanphx/evanphx.github.com.git	My page	\N	76	1	0	\N	3	2008-12-17 05:45:14	2020-01-09 05:20:56	2008-12-17 05:46:34
56884831	evanphx.github.io	7	https://github.com/evanphx/evanphx.github.io	https://api.github.com/repos/evanphx/evanphx.github.io/subscription	https://github.com/evanphx/evanphx.github.io.git	blog!	HTML	65	1	0	\N	1	2016-04-22 17:58:09	2018-02-18 17:57:58	2016-04-25 20:02:16
58215	amqp	17	https://github.com/vanpelt/amqp	https://api.github.com/repos/vanpelt/amqp/subscription	https://github.com/vanpelt/amqp.git	AMQP client implementation in Ruby/EventMachine	Ruby	389	0	0	\N	4	2008-09-30 21:12:36	2019-08-13 10:36:47	2008-10-02 20:37:16
17235047	analytics-ruby	17	https://github.com/vanpelt/analytics-ruby	https://api.github.com/repos/vanpelt/analytics-ruby/subscription	https://github.com/vanpelt/analytics-ruby.git	The hassle-free way to integrate analytics into any Ruby application.	Ruby	448	1	0	\N	1	2014-02-27 00:23:53	2018-03-13 05:03:24	2014-02-19 23:44:00
18422658	api-blueprint	17	https://github.com/vanpelt/api-blueprint	https://api.github.com/repos/vanpelt/api-blueprint/subscription	https://github.com/vanpelt/api-blueprint.git	API Blueprint	\N	3921	1	0	\N	0	2014-04-03 21:26:04	2018-02-18 18:59:34	2014-04-03 08:10:56
111990595	apollo-client	17	https://github.com/vanpelt/apollo-client	https://api.github.com/repos/vanpelt/apollo-client/subscription	https://github.com/vanpelt/apollo-client.git	:rocket: A fully-featured, production ready caching GraphQL client for every server or UI framework	TypeScript	8469	0	0	\N	0	2017-11-25 07:05:07	2018-02-18 18:59:35	2017-11-24 23:49:35
27188	async-observer	17	https://github.com/vanpelt/async-observer	https://api.github.com/repos/vanpelt/async-observer/subscription	https://github.com/vanpelt/async-observer.git	Rails plugin that provides deep integration with Beanstalk.	Ruby	112	1	0	\N	3	2008-06-20 20:16:43	2019-08-13 10:27:16	2008-06-20 20:16:45
77002473	blueprint	17	https://github.com/vanpelt/blueprint	https://api.github.com/repos/vanpelt/blueprint/subscription	https://github.com/vanpelt/blueprint.git	A React UI toolkit for the web	TypeScript	5731	0	0	\N	0	2016-12-20 22:40:04	2018-02-18 18:59:39	2016-12-18 19:39:48
4429051	CardMaven	17	https://github.com/vanpelt/CardMaven	https://api.github.com/repos/vanpelt/CardMaven/subscription	https://github.com/vanpelt/CardMaven.git	An iOS card game app that allows for multiple variants of games, multi-player over bluetooth, and much more... 	Objective-C	4991	4	0	\N	7	2012-05-24 02:19:36	2020-07-09 01:35:38	2012-05-24 02:21:49
204591	chris-snez	17	https://github.com/vanpelt/chris-snez	https://api.github.com/repos/vanpelt/chris-snez/subscription	https://github.com/vanpelt/chris-snez.git	My better half and I now have our own website...	\N	348	1	0	\N	1	2009-05-19 03:28:14	2018-02-18 18:59:42	2009-08-10 17:10:13
163696210	ConcatenateBlobs	17	https://github.com/vanpelt/ConcatenateBlobs	https://api.github.com/repos/vanpelt/ConcatenateBlobs/subscription	https://github.com/vanpelt/ConcatenateBlobs.git	Simply pass array of blobs. This javascript library will concatenate all blobs in single Blob object.	HTML	6	0	0	\N	0	2018-12-31 18:38:16	2018-12-31 18:38:18	2016-05-03 05:14:26
33222	contacts	17	https://github.com/vanpelt/contacts	https://api.github.com/repos/vanpelt/contacts/subscription	https://github.com/vanpelt/contacts.git	A universal interface to grab contact list information from various providers including Yahoo, Gmail, Hotmail, and Plaxo.	Ruby	85	0	0	\N	2	2008-07-11 02:33:08	2019-08-13 10:28:56	2008-07-11 02:54:25
151773270	create-react-app	17	https://github.com/vanpelt/create-react-app	https://api.github.com/repos/vanpelt/create-react-app/subscription	https://github.com/vanpelt/create-react-app.git	Create React apps with no build configuration.	JavaScript	7067	0	0	\N	0	2018-10-05 17:15:43	2018-10-05 17:15:49	2018-10-05 17:05:36
2524185	cube	17	https://github.com/vanpelt/cube	https://api.github.com/repos/vanpelt/cube/subscription	https://github.com/vanpelt/cube.git	Cube: A system for time series visualization.	JavaScript	569	1	0	\N	1	2011-10-06 02:08:47	2018-02-18 18:59:45	2011-10-05 16:17:09
111592185	deepo	17	https://github.com/vanpelt/deepo	https://api.github.com/repos/vanpelt/deepo/subscription	https://github.com/vanpelt/deepo.git	A Docker image containing almost all popular deep learning frameworks: theano, tensorflow, sonnet, pytorch, keras, lasagne, mxnet, cntk, chainer, caffe, torch.	\N	4	0	0	\N	0	2017-11-21 17:28:07	2018-02-18 18:59:47	2017-11-02 05:42:01
104453	delayed_job	17	https://github.com/vanpelt/delayed_job	https://api.github.com/repos/vanpelt/delayed_job/subscription	https://github.com/vanpelt/delayed_job.git	Database backed asynchronous priority queue -- Extracted from Shopify 	Ruby	2716	5	0	\N	7	2009-01-09 22:14:42	2019-08-13 10:52:38	2009-01-24 21:11:25
55015	dm-imap-adapter	17	https://github.com/vanpelt/dm-imap-adapter	https://api.github.com/repos/vanpelt/dm-imap-adapter/subscription	https://github.com/vanpelt/dm-imap-adapter.git	An IMAP adapter for DataMapper.  Supports reading, writing, updating... the whole works.	Ruby	90	3	2	\N	13	2008-09-21 20:22:56	2019-08-13 10:35:53	2017-09-26 21:11:05
179406159	emotion-detector	17	https://github.com/vanpelt/emotion-detector	https://api.github.com/repos/vanpelt/emotion-detector/subscription	https://github.com/vanpelt/emotion-detector.git	Emotion detector with tfjs	JavaScript	350	1	0	\N	2	2019-04-03 23:25:08	2020-02-13 19:33:11	2019-11-07 03:12:58
4981949	evercookie	17	https://github.com/vanpelt/evercookie	https://api.github.com/repos/vanpelt/evercookie/subscription	https://github.com/vanpelt/evercookie.git	evercookie is a javascript API available that produces extremely persistent cookies in a browser. Its goal is to identify a client even after they've removed standard cookies, Flash cookies (Local Shared Objects or LSOs), and others. 	JavaScript	205	1	0	\N	1	2012-07-10 20:27:42	2018-02-18 18:59:52	2012-07-18 18:21:18
52435	fancy-zoom	17	https://github.com/vanpelt/fancy-zoom	https://api.github.com/repos/vanpelt/fancy-zoom/subscription	https://github.com/vanpelt/fancy-zoom.git	Zoomy JavaScript based loosely on Fancy Zoom by Cabel Sasser.	JavaScript	299	2	0	\N	7	2008-09-14 00:34:06	2019-08-13 10:35:06	2008-12-16 20:55:22
83514508	Faster-RCNN_CloudML	17	https://github.com/vanpelt/Faster-RCNN_CloudML	https://api.github.com/repos/vanpelt/Faster-RCNN_CloudML/subscription	https://github.com/vanpelt/Faster-RCNN_CloudML.git	Faster-RCNN for Cloud ML	Python	1192	0	0	\N	3	2017-03-01 02:16:02	2018-06-01 17:12:10	2017-03-02 19:01:16
201387023	font-facer	17	https://github.com/vanpelt/font-facer	https://api.github.com/repos/vanpelt/font-facer/subscription	https://github.com/vanpelt/font-facer.git	A UI for interpolating fonts	JavaScript	7826	0	7	\N	1	2019-08-09 01:05:42	2020-01-09 05:26:02	2020-12-11 15:03:40
221825553	fsdl-text-recognizer	17	https://github.com/vanpelt/fsdl-text-recognizer	https://api.github.com/repos/vanpelt/fsdl-text-recognizer/subscription	https://github.com/vanpelt/fsdl-text-recognizer.git	Repo that generates https://github.com/full-stack-deep-learning/fsdl-text-recognizer-project	Jupyter Notebook	58865	0	0	\N	0	2019-11-14 23:15:54	2019-11-15 19:45:22	2019-11-15 19:46:58
5533879	guestlist	17	https://github.com/vanpelt/guestlist	https://api.github.com/repos/vanpelt/guestlist/subscription	https://github.com/vanpelt/guestlist.git	Engineering guest list for the Nightmix party	\N	105	1	0	\N	0	2012-08-23 20:36:54	2018-02-18 18:59:57	2012-08-23 20:39:15
42790	instimage	17	https://github.com/vanpelt/instimage	https://api.github.com/repos/vanpelt/instimage/subscription	https://github.com/vanpelt/instimage.git	A lightweight javascript interface for choosing images from arbitrary urls	JavaScript	932	1	0	\N	2	2008-08-14 21:17:32	2019-08-13 10:31:41	2008-08-18 21:46:39
79680	jekyll	17	https://github.com/vanpelt/jekyll	https://api.github.com/repos/vanpelt/jekyll/subscription	https://github.com/vanpelt/jekyll.git	Jekyll is a blog-aware, static site generator in Ruby	Ruby	172	0	0	\N	2	2008-11-22 21:05:02	2019-08-13 10:43:54	2016-07-10 05:19:33
83192655	js-data-cloud-datastore	17	https://github.com/vanpelt/js-data-cloud-datastore	https://api.github.com/repos/vanpelt/js-data-cloud-datastore/subscription	https://github.com/vanpelt/js-data-cloud-datastore.git	Google Cloud Datastore adapter for js-data. Main Site: http://js-data.io, API Reference Docs: http://googlecloudplatform.github.io/js-data-cloud-datastore/	JavaScript	309	0	0	\N	0	2017-02-26 04:59:00	2018-02-18 19:00:01	2016-08-24 02:16:26
58484007	js-segment-annotator	17	https://github.com/vanpelt/js-segment-annotator	https://api.github.com/repos/vanpelt/js-segment-annotator/subscription	https://github.com/vanpelt/js-segment-annotator.git	Javascript image annotation tool based on image segmentation.	JavaScript	408	1	0	\N	0	2016-05-10 15:21:22	2018-02-18 19:00:03	2016-02-01 23:46:06
29	jsawesome	17	https://github.com/vanpelt/jsawesome	https://api.github.com/repos/vanpelt/jsawesome/subscription	https://github.com/vanpelt/jsawesome.git	Awesome JSON	JavaScript	192	2	1	\N	41	2008-01-13 04:04:19	2021-01-23 07:19:31	2008-05-29 17:09:36
91264763	KittiSeg	17	https://github.com/vanpelt/KittiSeg	https://api.github.com/repos/vanpelt/KittiSeg/subscription	https://github.com/vanpelt/KittiSeg.git	A Kitti Road Segmentation model implemented in tensorflow.	Python	12194	0	0	\N	0	2017-05-14 15:57:33	2018-02-18 19:00:06	2017-05-15 12:45:35
235619	lyndon	17	https://github.com/vanpelt/lyndon	https://api.github.com/repos/vanpelt/lyndon/subscription	https://github.com/vanpelt/lyndon.git	Lyndon wraps JavaScript in a loving MacRuby embrace.	Ruby	84	1	0	\N	1	2009-06-24 19:56:16	2018-02-18 19:00:08	2009-06-24 03:09:02
83091761	mali	17	https://github.com/vanpelt/mali	https://api.github.com/repos/vanpelt/mali/subscription	https://github.com/vanpelt/mali.git	A minimalistic gRPC microservice framework for Node.js	JavaScript	69	0	0	\N	0	2017-02-24 20:33:05	2018-02-18 19:00:10	2017-02-21 16:34:04
29316799	afero	18	https://github.com/wayneeseguin/afero	https://api.github.com/repos/wayneeseguin/afero/subscription	https://github.com/wayneeseguin/afero.git	A FileSystem Abstraction System for Go	Go	126	1	0	\N	2	2015-01-15 18:31:17	2018-02-18 18:00:51	2015-01-15 18:33:25
205	alogr	18	https://github.com/wayneeseguin/alogr	https://api.github.com/repos/wayneeseguin/alogr/subscription	https://github.com/wayneeseguin/alogr.git	AlogR is a threadsafe non-blocking asynchronous configurable logger for Ruby.	Ruby	124	1	1	\N	11	2008-02-01 14:36:54	2019-08-13 10:21:20	2008-03-26 16:10:50
25402715	appfirst-boshrelease	18	https://github.com/wayneeseguin/appfirst-boshrelease	https://api.github.com/repos/wayneeseguin/appfirst-boshrelease/subscription	https://github.com/wayneeseguin/appfirst-boshrelease.git	AppFirst BOSH Release (ABR)	Shell	108542	3	0	\N	2	2014-10-18 13:22:20	2018-02-18 18:00:59	2015-05-17 16:53:12
5745	ar_migration_branches	18	https://github.com/wayneeseguin/ar_migration_branches	https://api.github.com/repos/wayneeseguin/ar_migration_branches/subscription	https://github.com/wayneeseguin/ar_migration_branches.git	Active Record Migration Branches	Ruby	112	2	0	\N	7	2008-03-28 19:19:26	2019-08-13 10:22:22	2008-10-06 23:25:23
3791	attachmerb_fu	18	https://github.com/wayneeseguin/attachmerb_fu	https://api.github.com/repos/wayneeseguin/attachmerb_fu/subscription	https://github.com/wayneeseguin/attachmerb_fu.git	A merb port of the attachment_fu Rails plugin	Ruby	108	1	0	\N	4	2008-02-21 03:32:29	2019-08-13 10:22:01	2008-03-13 15:47:50
603825	authlogic	18	https://github.com/wayneeseguin/authlogic	https://api.github.com/repos/wayneeseguin/authlogic/subscription	https://github.com/wayneeseguin/authlogic.git	A simple model based ruby authentication solution.	Ruby	1236	1	0	\N	2	2010-04-10 09:52:50	2018-02-18 18:01:11	2010-01-19 04:25:55
206	autozest	18	https://github.com/wayneeseguin/autozest	https://api.github.com/repos/wayneeseguin/autozest/subscription	https://github.com/wayneeseguin/autozest.git	AutoZest is an autotest addon that: * automated growl installation * generation of .autotest with growl & autozest config * generation of .autozest.yml config file * autozest.sqlite3 database file for pulling random messages based on severity	Ruby	276	1	1	\N	6	2008-02-01 14:37:51	2019-08-13 10:21:20	2008-03-26 16:10:50
35103111	bboshinst	18	https://github.com/wayneeseguin/bboshinst	https://api.github.com/repos/wayneeseguin/bboshinst/subscription	https://github.com/wayneeseguin/bboshinst.git	Binary bosh installer script for OpenStack	Shell	102	1	0	\N	1	2015-05-05 10:58:58	2018-02-18 18:01:20	2015-05-05 11:07:15
32540504	bosh	18	https://github.com/wayneeseguin/bosh	https://api.github.com/repos/wayneeseguin/bosh/subscription	https://github.com/wayneeseguin/bosh.git	Cloud Foundry BOSH is an open source tool chain for release engineering, deployment and lifecycle management of large scale distributed services.	Ruby	373163	0	0	\N	2	2015-03-19 15:56:36	2018-02-18 18:01:25	2015-06-13 12:10:17
40715713	bosh-create	18	https://github.com/wayneeseguin/bosh-create	https://api.github.com/repos/wayneeseguin/bosh-create/subscription	https://github.com/wayneeseguin/bosh-create.git	Exploration of ways to do bosh-release logic and structure.	Shell	21	2	0	\N	1	2015-08-14 10:14:37	2018-02-18 18:01:30	2016-02-05 14:09:36
31613835	bosh-workspace	18	https://github.com/wayneeseguin/bosh-workspace	https://api.github.com/repos/wayneeseguin/bosh-workspace/subscription	https://github.com/wayneeseguin/bosh-workspace.git	Gem for managing your bosh workspace	Ruby	365	2	0	\N	1	2015-03-03 15:21:58	2020-09-21 02:55:19	2015-03-10 16:59:52
2073720	bundler	18	https://github.com/wayneeseguin/bundler	https://api.github.com/repos/wayneeseguin/bundler/subscription	https://github.com/wayneeseguin/bundler.git	Manage your application's gem dependencies with less pain	Ruby	9517	0	0	\N	3	2011-07-19 15:25:32	2020-01-09 22:11:34	2011-07-18 23:30:08
17672315	cf-acceptance-tests	18	https://github.com/wayneeseguin/cf-acceptance-tests	https://api.github.com/repos/wayneeseguin/cf-acceptance-tests/subscription	https://github.com/wayneeseguin/cf-acceptance-tests.git	CF Acceptance tests	Go	1595	1	0	\N	2	2014-03-12 12:40:54	2018-02-18 18:01:44	2014-03-12 12:41:57
21912506	cf-app-logstail	18	https://github.com/wayneeseguin/cf-app-logstail	https://api.github.com/repos/wayneeseguin/cf-app-logstail/subscription	https://github.com/wayneeseguin/cf-app-logstail.git	Cloud Foundry Logs Tailer	Go	124	1	0	\N	1	2014-07-16 15:36:51	2018-02-18 18:01:47	2014-07-16 15:40:41
31297566	cf-appfirst-buildpack	18	https://github.com/wayneeseguin/cf-appfirst-buildpack	https://api.github.com/repos/wayneeseguin/cf-appfirst-buildpack/subscription	https://github.com/wayneeseguin/cf-appfirst-buildpack.git	Cloud Foundry AppFirst Collector Buildpack	Shell	132	2	0	\N	1	2015-02-25 01:42:16	2018-02-18 18:01:52	2015-02-28 19:18:52
21245953	cli	18	https://github.com/wayneeseguin/cli	https://api.github.com/repos/wayneeseguin/cli/subscription	https://github.com/wayneeseguin/cli.git	A CLI for Cloud Foundry written in Go	Go	16302	5	1	\N	1	2014-06-26 12:42:41	2018-02-18 18:01:56	2017-09-26 21:11:16
51490346	concourse-project	18	https://github.com/wayneeseguin/concourse-project	https://api.github.com/repos/wayneeseguin/concourse-project/subscription	https://github.com/wayneeseguin/concourse-project.git	\N	\N	7	1	0	\N	1	2016-02-11 00:50:52	2018-02-18 18:02:00	2016-02-11 00:51:48
20502580	datasciencecoursera	18	https://github.com/wayneeseguin/datasciencecoursera	https://api.github.com/repos/wayneeseguin/datasciencecoursera/subscription	https://github.com/wayneeseguin/datasciencecoursera.git	Data Science @ Coursera	\N	152	1	0	\N	1	2014-06-04 19:03:46	2018-02-18 18:02:04	2014-06-04 22:08:10
20506898	datasharing	18	https://github.com/wayneeseguin/datasharing	https://api.github.com/repos/wayneeseguin/datasharing/subscription	https://github.com/wayneeseguin/datasharing.git	The Leek group guide to data sharing 	\N	157	0	0	\N	1	2014-06-04 22:08:50	2018-02-18 18:02:08	2013-11-25 14:08:34
31423441	data_retention	18	https://github.com/wayneeseguin/data_retention	https://api.github.com/repos/wayneeseguin/data_retention/subscription	https://github.com/wayneeseguin/data_retention.git	\N	\N	160	2	0	\N	1	2015-02-27 11:40:59	2018-02-18 18:02:13	2015-02-23 22:40:03
335190	db	18	https://github.com/wayneeseguin/db	https://api.github.com/repos/wayneeseguin/db/subscription	https://github.com/wayneeseguin/db.git	dbm	\N	48	0	0	\N	2	2009-10-12 16:20:13	2018-02-18 18:02:17	\N
335252	dbm	18	https://github.com/wayneeseguin/dbm	https://api.github.com/repos/wayneeseguin/dbm/subscription	https://github.com/wayneeseguin/dbm.git	\N	\N	48	0	0	\N	2	2009-10-12 17:09:46	2018-02-18 18:02:21	\N
4071025	deliver	18	https://github.com/wayneeseguin/deliver	https://api.github.com/repos/wayneeseguin/deliver/subscription	https://github.com/wayneeseguin/deliver.git	Heroku-style deployment through pure bash. Supports multiple strategies.	Ruby	129	1	0	\N	3	2012-04-18 23:53:30	2018-02-18 18:02:25	2012-04-18 23:58:53
21012106	docs-bosh	18	https://github.com/wayneeseguin/docs-bosh	https://api.github.com/repos/wayneeseguin/docs-bosh/subscription	https://github.com/wayneeseguin/docs-bosh.git	The docs repo for BOSH	\N	3247	1	0	\N	1	2014-06-19 16:05:41	2018-02-18 18:02:29	2014-06-18 20:16:37
237376	dynamic_reports	18	https://github.com/wayneeseguin/dynamic_reports	https://api.github.com/repos/wayneeseguin/dynamic_reports/subscription	https://github.com/wayneeseguin/dynamic_reports.git	Dynamic Reporting Engine for Ruby && Rails	Ruby	335	23	0	\N	224	2009-06-26 21:41:46	2020-08-16 14:02:59	2009-08-04 16:49:44
28674088	env	18	https://github.com/wayneeseguin/env	https://api.github.com/repos/wayneeseguin/env/subscription	https://github.com/wayneeseguin/env.git	Environment mappings and variables for GAE	Go	120	2	1	\N	1	2014-12-31 18:06:24	2018-02-18 18:02:37	2017-09-26 21:11:22
55162477	env-1	18	https://github.com/wayneeseguin/env-1	https://api.github.com/repos/wayneeseguin/env-1/subscription	https://github.com/wayneeseguin/env-1.git	The Best Damn Collection of .rc files this side of the Mississippi	Shell	109	1	0	\N	1	2016-03-31 12:40:46	2018-02-18 18:02:41	2016-03-26 20:45:26
22291102	exdata-project2	18	https://github.com/wayneeseguin/exdata-project2	https://api.github.com/repos/wayneeseguin/exdata-project2/subscription	https://github.com/wayneeseguin/exdata-project2.git	Exploratory Data Analysis Course Project 2	R	640	103	0	\N	3	2014-07-26 13:38:00	2019-11-29 19:34:42	2014-07-26 13:56:57
21795124	ExData_Plotting1	18	https://github.com/wayneeseguin/ExData_Plotting1	https://api.github.com/repos/wayneeseguin/ExData_Plotting1/subscription	https://github.com/wayneeseguin/ExData_Plotting1.git	Plotting Assignment 1 for Exploratory Data Analysis	R	431	1	0	\N	1	2014-07-13 13:44:58	2018-02-18 18:02:49	2014-07-13 17:54:06
543222	fish-nuggets	18	https://github.com/wayneeseguin/fish-nuggets	https://api.github.com/repos/wayneeseguin/fish-nuggets/subscription	https://github.com/wayneeseguin/fish-nuggets.git	Completions, code snippets helping you to get even more out of the amazing Fish shell	\N	123	1	0	\N	2	2010-03-02 14:43:56	2019-10-14 18:38:51	2010-02-25 21:09:51
4588940	active_admin	19	https://github.com/brynary/active_admin	https://api.github.com/repos/brynary/active_admin/subscription	https://github.com/brynary/active_admin.git	The administration framework for Ruby on Rails applications.	Ruby	3729	1	0	\N	2	2012-06-07 15:42:43	2018-02-18 18:07:05	2012-06-07 15:44:56
6974758	active_merchant	19	https://github.com/brynary/active_merchant	https://api.github.com/repos/brynary/active_merchant/subscription	https://github.com/brynary/active_merchant.git	Active Merchant is a simple payment abstraction library used in and sponsored by Shopify. It is written by Tobias Luetke, Cody Fauser, and contributors. The aim of the project is to feel natural to Ruby users and to abstract as many parts as possible away from the user to offer a consistent interface across all supported gateways.	Ruby	7053	1	0	\N	1	2012-12-02 23:11:17	2018-02-18 18:07:09	2012-12-02 23:12:17
11237765	acts-as-taggable-on	19	https://github.com/brynary/acts-as-taggable-on	https://api.github.com/repos/brynary/acts-as-taggable-on/subscription	https://github.com/brynary/acts-as-taggable-on.git	A tagging plugin for Rails applications that allows for custom tagging along dynamic contexts.	Ruby	691	1	0	\N	0	2013-07-07 15:19:46	2020-01-09 12:51:10	2013-05-15 18:09:05
202941	arel	19	https://github.com/brynary/arel	https://api.github.com/repos/brynary/arel/subscription	https://github.com/brynary/arel.git	A Relational Algebra	Ruby	2743	16	2	\N	137	2009-05-16 23:56:18	2020-08-19 18:38:13	2011-04-30 17:30:53
1465039	artifice	19	https://github.com/brynary/artifice	https://api.github.com/repos/brynary/artifice/subscription	https://github.com/brynary/artifice.git	Replaces Net::HTTP with a subclass that routes all requests to a Rack application	Ruby	79	0	0	\N	2	2011-03-10 16:37:30	2018-02-18 18:07:22	2010-10-25 22:31:49
341498	asset-trip	19	https://github.com/brynary/asset-trip	https://api.github.com/repos/brynary/asset-trip/subscription	https://github.com/brynary/asset-trip.git	Rails asset bundling plugin that will expand your mind	Ruby	976	2	0	\N	14	2009-10-18 17:11:39	2019-08-13 11:28:42	2009-12-01 16:13:55
43925066	atlas-examples	19	https://github.com/brynary/atlas-examples	https://api.github.com/repos/brynary/atlas-examples/subscription	https://github.com/brynary/atlas-examples.git	Public examples for using Atlas by HashiCorp	HCL	17949	1	0	\N	1	2015-10-08 22:09:30	2018-08-02 22:04:28	2015-10-04 15:40:43
670928	badger	19	https://github.com/brynary/badger	https://api.github.com/repos/brynary/badger/subscription	https://github.com/brynary/badger.git	\N	Ruby	92	1	0	\N	3	2010-05-17 10:21:40	2018-02-18 18:07:40	2010-05-17 10:22:47
2730563	bert	19	https://github.com/brynary/bert	https://api.github.com/repos/brynary/bert/subscription	https://github.com/brynary/bert.git	BERT (Binary ERlang Term) serialization library for Ruby.	Ruby	179	0	0	\N	3	2011-11-07 22:42:46	2018-02-18 18:07:45	2014-07-24 02:18:47
4915257	bertrpc	19	https://github.com/brynary/bertrpc	https://api.github.com/repos/brynary/bertrpc/subscription	https://github.com/brynary/bertrpc.git	BERTRPC is a Ruby BERT-RPC client library.	Ruby	159	0	0	\N	2	2012-07-05 18:05:54	2018-02-18 18:07:51	2013-01-28 03:32:51
11237438	better_errors	19	https://github.com/brynary/better_errors	https://api.github.com/repos/brynary/better_errors/subscription	https://github.com/brynary/better_errors.git	Better error page for Rails and other Rack apps	Ruby	289	1	0	\N	1	2013-07-07 14:56:29	2018-08-27 05:46:30	2013-07-09 13:01:28
44581060	blackbox	19	https://github.com/brynary/blackbox	https://api.github.com/repos/brynary/blackbox/subscription	https://github.com/brynary/blackbox.git	Safely store secrets in Git/Mercurial/Subversion	Shell	397	1	0	\N	1	2015-10-20 01:58:53	2018-02-18 18:08:00	2015-10-20 02:59:06
17929768	boot2docker	19	https://github.com/brynary/boot2docker	https://api.github.com/repos/brynary/boot2docker/subscription	https://github.com/brynary/boot2docker.git	Lightweight Linux for Docker	Shell	3694	0	0	\N	1	2014-03-20 00:37:12	2018-02-18 18:08:06	2014-03-18 10:06:44
11237550	bootstrap-sass	19	https://github.com/brynary/bootstrap-sass	https://api.github.com/repos/brynary/bootstrap-sass/subscription	https://github.com/brynary/bootstrap-sass.git	bootstrap-sass is bootstrap for Sass, ready to roll	Ruby	744	0	0	\N	1	2013-07-07 15:05:04	2018-02-18 18:08:10	2013-07-17 16:57:56
6833652	brakeman	19	https://github.com/brynary/brakeman	https://api.github.com/repos/brynary/brakeman/subscription	https://github.com/brynary/brakeman.git	A static analysis security vulnerability scanner for Ruby on Rails applications	Ruby	10038	2	0	\N	1	2012-11-23 20:03:24	2018-02-18 18:08:15	2013-04-07 02:32:53
14514622	breach-mitigation-rails	19	https://github.com/brynary/breach-mitigation-rails	https://api.github.com/repos/brynary/breach-mitigation-rails/subscription	https://github.com/brynary/breach-mitigation-rails.git	Make Rails apps more resilient against the BREACH and CRIME attacks	Ruby	173	1	0	\N	1	2013-11-19 02:55:40	2018-02-18 18:08:19	2013-11-06 19:58:12
291857	bundler	19	https://github.com/brynary/bundler	https://api.github.com/repos/brynary/bundler/subscription	https://github.com/brynary/bundler.git	\N	Ruby	15896	1	0	\N	2	2009-08-29 15:38:00	2018-02-18 18:08:24	2009-12-17 18:14:55
8261708	bundler-audit	19	https://github.com/brynary/bundler-audit	https://api.github.com/repos/brynary/bundler-audit/subscription	https://github.com/brynary/bundler-audit.git	Patch-level verification for Bundler	Ruby	177	1	0	\N	1	2013-02-18 01:34:11	2018-02-18 18:08:28	2013-02-18 01:53:55
89388	cache-money	19	https://github.com/brynary/cache-money	https://api.github.com/repos/brynary/cache-money/subscription	https://github.com/brynary/cache-money.git	A Write-Through Cacheing Library for ActiveRecord	Ruby	301	1	0	\N	6	2008-12-12 03:05:29	2019-08-13 10:47:08	2008-12-18 02:19:07
6915162	call_for_proposals_2013	19	https://github.com/brynary/call_for_proposals_2013	https://api.github.com/repos/brynary/call_for_proposals_2013/subscription	https://github.com/brynary/call_for_proposals_2013.git	2013 conference call for proposals	\N	100	1	0	\N	1	2012-11-29 02:24:32	2018-02-18 18:08:50	2012-11-29 02:32:23
4862783	cancan	19	https://github.com/brynary/cancan	https://api.github.com/repos/brynary/cancan/subscription	https://github.com/brynary/cancan.git	Authorization Gem for Ruby on Rails.	Ruby	893	1	0	\N	2	2012-07-02 14:31:21	2018-02-18 18:08:54	2012-07-02 14:32:05
6708789	capistrano	19	https://github.com/brynary/capistrano	https://api.github.com/repos/brynary/capistrano/subscription	https://github.com/brynary/capistrano.git	Remote multi-server automation tool	Ruby	1078	0	0	\N	1	2012-11-15 15:40:24	2018-02-18 18:08:58	2012-11-15 15:42:04
4877742	capybara	19	https://github.com/brynary/capybara	https://api.github.com/repos/brynary/capybara/subscription	https://github.com/brynary/capybara.git	Acceptance test framework for web applications	Ruby	7570	1	0	\N	2	2012-07-03 18:31:36	2016-11-15 07:32:00	2012-07-03 18:33:04
4877683	carrierwave	19	https://github.com/brynary/carrierwave	https://api.github.com/repos/brynary/carrierwave/subscription	https://github.com/brynary/carrierwave.git	Classier solution for file uploads for Rails, Sinatra and other Ruby web frameworks	Ruby	2374	0	0	\N	3	2012-07-03 18:25:58	2018-02-18 18:09:07	2012-07-03 18:36:21
3253993	cells	19	https://github.com/brynary/cells	https://api.github.com/repos/brynary/cells/subscription	https://github.com/brynary/cells.git	Components for Rails.	Ruby	862	1	0	\N	2	2012-01-24 05:28:43	2018-02-18 18:09:11	2011-12-21 10:01:10
34124506	checkmate	19	https://github.com/brynary/checkmate	https://api.github.com/repos/brynary/checkmate/subscription	https://github.com/brynary/checkmate.git	Checkmate - A simple yet powerful meta code-checker with support for multiple languages.	Python	1086	2	1	\N	1	2015-04-17 12:33:03	2018-02-18 18:09:15	2017-09-26 21:11:45
453847	chef	19	https://github.com/brynary/chef	https://api.github.com/repos/brynary/chef/subscription	https://github.com/brynary/chef.git	A systems integration framework, built to bring the benefits of configuration management to your entire infrastructure.	Ruby	36884	1	0	\N	2	2009-12-30 19:58:20	2018-02-18 18:09:19	2009-12-30 20:00:54
6160232	clippy	19	https://github.com/brynary/clippy	https://api.github.com/repos/brynary/clippy/subscription	https://github.com/brynary/clippy.git	A utility to access the systems clipboard from Ruby.	Ruby	98	1	0	\N	2	2012-10-10 13:14:48	2018-02-18 18:09:23	2012-10-10 13:16:45
47726462	codeclimate	19	https://github.com/brynary/codeclimate	https://api.github.com/repos/brynary/codeclimate/subscription	https://github.com/brynary/codeclimate.git	Code Climate CLI	Ruby	707	1	0	\N	1	2015-12-09 21:48:43	2018-02-18 18:09:27	2015-12-09 21:49:33
47726819	codeclimate-phpmd	19	https://github.com/brynary/codeclimate-phpmd	https://api.github.com/repos/brynary/codeclimate-phpmd/subscription	https://github.com/brynary/codeclimate-phpmd.git	Code Climate PHPMD Engine	PHP	26	2	1	\N	1	2015-12-09 21:59:15	2018-02-18 18:09:31	2017-09-26 21:11:49
317647158	AdventOfCode2020	20	https://github.com/kevinclark/AdventOfCode2020	https://api.github.com/repos/kevinclark/AdventOfCode2020/subscription	https://github.com/kevinclark/AdventOfCode2020.git	\N	Rust	73	0	0	\N	0	2020-12-01 16:32:27	2020-12-13 14:19:24	2020-12-13 14:19:22
314925801	ale	20	https://github.com/kevinclark/ale	https://api.github.com/repos/kevinclark/ale/subscription	https://github.com/kevinclark/ale.git	Check syntax in Vim asynchronously and fix files, with Language Server Protocol (LSP) support	Vim script	16810	0	0	\N	1	2020-11-21 20:54:52	2021-01-06 01:07:24	2021-01-14 15:11:25
223032220	aletheia	20	https://github.com/kevinclark/aletheia	https://api.github.com/repos/kevinclark/aletheia/subscription	https://github.com/kevinclark/aletheia.git	A superior, open source suite of state-of-the-art steganalysis tools.	Python	19879	0	0	\N	0	2019-11-20 18:37:47	2020-11-07 16:01:22	2020-11-07 16:09:26
313220843	aoc2019	20	https://github.com/kevinclark/aoc2019	https://api.github.com/repos/kevinclark/aoc2019/subscription	https://github.com/kevinclark/aoc2019.git	AOC 2019 in Rust	Rust	56	0	0	\N	0	2020-11-16 04:22:48	2020-12-16 16:38:44	2020-12-16 16:38:42
96278	chordal	20	https://github.com/kevinclark/chordal	https://api.github.com/repos/kevinclark/chordal/subscription	https://github.com/kevinclark/chordal.git	A library in Io for generating chords	Io	84	1	0	\N	7	2008-12-24 07:30:28	2019-08-13 10:49:51	2008-12-25 03:06:25
12028377	docker-registry	20	https://github.com/kevinclark/docker-registry	https://api.github.com/repos/kevinclark/docker-registry/subscription	https://github.com/kevinclark/docker-registry.git	Registry server for Docker (hosting/delivering of repositories and images)	Python	217	1	0	\N	1	2013-08-10 20:19:38	2020-03-11 09:05:38	2013-08-10 20:36:32
55214	dotfiles	20	https://github.com/kevinclark/dotfiles	https://api.github.com/repos/kevinclark/dotfiles/subscription	https://github.com/kevinclark/dotfiles.git	My configs	Shell	278	1	0	\N	2	2008-09-22 13:28:53	2021-01-12 02:26:11	2021-01-12 02:26:09
21180	dust	20	https://github.com/kevinclark/dust	https://api.github.com/repos/kevinclark/dust/subscription	https://github.com/kevinclark/dust.git	Lint for Ruby. Moved to http://wiki.github.com/kevinclark/nitpick/	Ruby	710	3	1	\N	64	2008-05-31 21:43:28	2020-03-26 13:38:32	2009-03-19 00:34:41
236356395	git-tutorial-8033	20	https://github.com/kevinclark/git-tutorial-8033	https://api.github.com/repos/kevinclark/git-tutorial-8033/subscription	https://github.com/kevinclark/git-tutorial-8033.git	Just some code for a tutorial in person	Java	4	0	0	\N	0	2020-01-26 15:27:19	2020-01-26 15:37:14	2020-01-26 15:37:12
140227	glu.ttono.us	20	https://github.com/kevinclark/glu.ttono.us	https://api.github.com/repos/kevinclark/glu.ttono.us/subscription	https://github.com/kevinclark/glu.ttono.us.git	Blog archives and new engine	JavaScript	960	1	0	\N	2	2009-03-01 00:53:04	2019-08-13 11:05:07	2009-03-03 08:10:26
305	god	20	https://github.com/kevinclark/god	https://api.github.com/repos/kevinclark/god/subscription	https://github.com/kevinclark/god.git	Ruby process monitor	Ruby	926	0	0	\N	4	2008-01-13 03:16:23	2019-08-13 10:21:21	2008-06-30 18:03:00
322514480	gq-4x4	20	https://github.com/kevinclark/gq-4x4	https://api.github.com/repos/kevinclark/gq-4x4/subscription	https://github.com/kevinclark/gq-4x4.git	GQ-4x4 util for OS X	Rust	69	0	0	\N	0	2020-12-18 03:54:22	2020-12-28 05:05:14	2020-12-28 05:05:12
11417037	indexer	20	https://github.com/kevinclark/indexer	https://api.github.com/repos/kevinclark/indexer/subscription	https://github.com/kevinclark/indexer.git	A simple search engine engine in Go	Go	128	1	0	\N	1	2013-07-15 04:11:31	2018-02-18 17:53:05	2013-07-15 13:44:43
303763692	inmate-scraping	20	https://github.com/kevinclark/inmate-scraping	https://api.github.com/repos/kevinclark/inmate-scraping/subscription	https://github.com/kevinclark/inmate-scraping.git	Collecting inmate names and addresses	Python	3198	3	1	\N	0	2020-10-13 13:27:23	2020-10-19 20:26:13	2020-10-22 14:05:41
97666	iospec2	20	https://github.com/kevinclark/iospec2	https://api.github.com/repos/kevinclark/iospec2/subscription	https://github.com/kevinclark/iospec2.git	An rspec like tool for Io	Io	92	1	0	\N	5	2008-12-28 22:32:36	2019-08-13 10:50:23	2008-12-29 21:12:34
1844547	janus	20	https://github.com/kevinclark/janus	https://api.github.com/repos/kevinclark/janus/subscription	https://github.com/kevinclark/janus.git	A MacVim Distro	Ruby	279	1	0	\N	2	2011-06-03 18:02:37	2018-02-18 17:53:12	2011-10-24 19:53:37
539685	kata	20	https://github.com/kevinclark/kata	https://api.github.com/repos/kevinclark/kata/subscription	https://github.com/kevinclark/kata.git	Code kata	C++	1376	1	0	\N	2	2010-02-28 08:26:09	2018-02-18 17:53:16	2010-03-10 15:11:25
3969899	Lesson-Plans	20	https://github.com/kevinclark/Lesson-Plans	https://api.github.com/repos/kevinclark/Lesson-Plans/subscription	https://github.com/kevinclark/Lesson-Plans.git	\N	Python	163	12	1	\N	16	2012-04-09 04:32:16	2020-01-10 14:11:57	2020-01-10 14:11:54
1954084	metrics	20	https://github.com/kevinclark/metrics	https://api.github.com/repos/kevinclark/metrics/subscription	https://github.com/kevinclark/metrics.git	Capturing JVM- and application-level metrics. So you know what's going on.	Java	534	1	0	\N	2	2011-06-25 20:47:50	2018-02-18 17:53:24	2011-08-15 23:47:30
316886484	neovim	20	https://github.com/kevinclark/neovim	https://api.github.com/repos/kevinclark/neovim/subscription	https://github.com/kevinclark/neovim.git	Vim-fork focused on extensibility and usability	\N	105955	0	0	\N	0	2020-11-29 02:57:00	2020-11-29 02:57:03	2020-11-28 23:43:26
285113662	netty	20	https://github.com/kevinclark/netty	https://api.github.com/repos/kevinclark/netty/subscription	https://github.com/kevinclark/netty.git	Netty project - an event-driven asynchronous network application framework	\N	62455	0	0	\N	0	2020-08-04 19:22:02	2020-08-04 19:22:06	2020-08-04 19:24:04
153976	nitpick	20	https://github.com/kevinclark/nitpick	https://api.github.com/repos/kevinclark/nitpick/subscription	https://github.com/kevinclark/nitpick.git	A lint for Ruby 1.8. Defunct. Just for posterity.	Ruby	370	3	3	\N	53	2009-03-19 00:00:14	2020-12-08 04:01:08	2009-03-21 18:54:49
450576	project_euler	20	https://github.com/kevinclark/project_euler	https://api.github.com/repos/kevinclark/project_euler/subscription	https://github.com/kevinclark/project_euler.git	Project Euler problems	Haskell	104	1	0	\N	3	2009-12-28 00:17:24	2018-02-18 17:53:32	2010-09-08 14:04:26
285133899	quicly	20	https://github.com/kevinclark/quicly	https://api.github.com/repos/kevinclark/quicly/subscription	https://github.com/kevinclark/quicly.git	A modular QUIC stack designed primarily for H2O	\N	3716	0	0	\N	0	2020-08-04 21:24:44	2020-08-04 21:24:46	2020-08-04 21:25:35
1596548	redis-py	20	https://github.com/kevinclark/redis-py	https://api.github.com/repos/kevinclark/redis-py/subscription	https://github.com/kevinclark/redis-py.git	Redis Python Client	Python	1689	2	1	\N	2	2011-04-10 19:28:55	2018-02-18 17:53:37	2017-09-26 21:12:07
20807	robot-army	20	https://github.com/kevinclark/robot-army	https://api.github.com/repos/kevinclark/robot-army/subscription	https://github.com/kevinclark/robot-army.git	Deploy scripting with Thor using remote Ruby execution	Ruby	111	1	0	\N	2	2008-05-30 14:46:52	2019-08-13 10:25:31	2008-05-30 21:30:34
258918719	rsearch	20	https://github.com/kevinclark/rsearch	https://api.github.com/repos/kevinclark/rsearch/subscription	https://github.com/kevinclark/rsearch.git	Search, in rust. Personal education project.	Rust	58	0	0	\N	0	2020-04-25 23:15:56	2020-12-08 04:04:51	2020-12-08 04:04:48
3243	ruby-kqueue	20	https://github.com/kevinclark/ruby-kqueue	https://api.github.com/repos/kevinclark/ruby-kqueue/subscription	https://github.com/kevinclark/ruby-kqueue.git	KQueue bindings for Ruby. Long defunct. Just for posterity.	Ruby	92	4	0	\N	28	2008-03-09 23:11:24	2021-01-18 20:29:14	2008-04-03 00:04:36
244414869	shuffleboard	20	https://github.com/kevinclark/shuffleboard	https://api.github.com/repos/kevinclark/shuffleboard/subscription	https://github.com/kevinclark/shuffleboard.git	A modern dashboard for FRC	\N	2325	0	0	\N	0	2020-03-02 13:09:04	2020-03-02 13:09:06	2020-03-02 22:04:31
4148751	snake3	20	https://github.com/kevinclark/snake3	https://api.github.com/repos/kevinclark/snake3/subscription	https://github.com/kevinclark/snake3.git	\N	JavaScript	107	1	0	\N	1	2012-04-26 11:55:47	2020-01-09 05:20:34	2012-04-26 12:04:31
3582580	15	21	https://github.com/technoweenie/15	https://api.github.com/repos/technoweenie/15/subscription	https://github.com/technoweenie/15.git	\N	\N	5324	2	0	\N	3	2012-02-29 11:53:49	2018-02-18 17:54:02	2012-03-16 19:24:05
3779940	activesupport_notifications_backport	21	https://github.com/technoweenie/activesupport_notifications_backport	https://api.github.com/repos/technoweenie/activesupport_notifications_backport/subscription	https://github.com/technoweenie/activesupport_notifications_backport.git	\N	Ruby	118	2	0	\N	10	2012-03-20 17:56:35	2020-07-20 17:25:06	2015-02-13 16:27:11
2374	active_record_context	21	https://github.com/technoweenie/active_record_context	https://api.github.com/repos/technoweenie/active_record_context/subscription	https://github.com/technoweenie/active_record_context.git	simple identity map for active record.  eager loading associations FTL	Ruby	85	4	0	\N	4	2008-03-04 01:44:14	2019-08-18 03:34:37	2008-03-26 16:43:39
2377	acts_as_versioned	21	https://github.com/technoweenie/acts_as_versioned	https://api.github.com/repos/technoweenie/acts_as_versioned/subscription	https://github.com/technoweenie/acts_as_versioned.git	ActiveRecord plugin for versioning your models.	Ruby	505	161	17	\N	409	2008-03-04 01:49:32	2020-11-01 23:16:07	2020-12-08 01:19:49
25060	app_bootstrap	21	https://github.com/technoweenie/app_bootstrap	https://api.github.com/repos/technoweenie/app_bootstrap/subscription	https://github.com/technoweenie/app_bootstrap.git	app:bootstrap rake task providing a command line menu to setup a rails app.  	Ruby	85	5	0	\N	29	2008-06-13 15:51:16	2019-08-13 10:26:42	2008-06-23 14:56:42
192404699	apub	21	https://github.com/technoweenie/apub	https://api.github.com/repos/technoweenie/apub/subscription	https://github.com/technoweenie/apub.git	experimental golang package for parsing ActivityPub objects 	Go	46	0	0	\N	1	2019-06-17 16:16:14	2019-08-18 10:51:28	2019-06-19 19:19:07
36246592	assert	21	https://github.com/technoweenie/assert	https://api.github.com/repos/technoweenie/assert/subscription	https://github.com/technoweenie/assert.git	Asserts to Go testing	Go	5	1	0	\N	2	2015-05-25 15:10:08	2018-02-18 17:54:25	2016-05-23 18:24:24
585087	astrotrain	21	https://github.com/technoweenie/astrotrain	https://api.github.com/repos/technoweenie/astrotrain/subscription	https://github.com/technoweenie/astrotrain.git	email => http_post	Ruby	367	9	0	\N	28	2010-03-29 13:42:05	2020-07-20 17:21:05	2017-01-31 16:49:10
43	attachment_fu	21	https://github.com/technoweenie/attachment_fu	https://api.github.com/repos/technoweenie/attachment_fu/subscription	https://github.com/technoweenie/attachment_fu.git	Treat an ActiveRecord model as a file attachment, storing its patch, size, content type, etc.	Ruby	1008	311	36	\N	1019	2008-01-14 12:51:56	2021-01-05 06:43:08	2017-03-27 21:48:29
3113125	beautiful-docs	21	https://github.com/technoweenie/beautiful-docs	https://api.github.com/repos/technoweenie/beautiful-docs/subscription	https://github.com/technoweenie/beautiful-docs.git	Pointers to useful, well-written, and otherwise beautiful documentation.	\N	72	2	0	\N	7	2012-01-05 18:43:17	2019-02-20 01:28:06	2012-01-05 18:44:51
41045793	blog	21	https://github.com/technoweenie/blog	https://api.github.com/repos/technoweenie/blog/subscription	https://github.com/technoweenie/blog.git	Some notes on things I find interesting and important.	HTML	6212	1	0	\N	1	2015-08-19 13:25:04	2018-02-18 17:54:46	2015-08-19 12:17:28
66007524	brew	21	https://github.com/technoweenie/brew	https://api.github.com/repos/technoweenie/brew/subscription	https://github.com/technoweenie/brew.git	:beer: The missing package manager for OS X	Ruby	16649	0	0	\N	1	2016-08-18 12:13:27	2018-02-18 17:54:50	2016-08-18 11:29:59
3583198	call-for-proposals	21	https://github.com/technoweenie/call-for-proposals	https://api.github.com/repos/technoweenie/call-for-proposals/subscription	https://github.com/technoweenie/call-for-proposals.git	Want to make a talk proposal for EuRuKo 2012? This is the place to be!	\N	448	3	0	\N	3	2012-02-29 12:56:23	2018-02-18 17:54:54	2012-02-29 15:10:11
8793233	camo.go	21	https://github.com/technoweenie/camo.go	https://api.github.com/repos/technoweenie/camo.go/subscription	https://github.com/technoweenie/camo.go.git	\N	Go	132	1	0	\N	4	2013-03-15 03:08:58	2018-02-18 17:54:59	2013-03-26 14:12:46
7135	can_search	21	https://github.com/technoweenie/can_search	https://api.github.com/repos/technoweenie/can_search/subscription	https://github.com/technoweenie/can_search.git	Build common named scopes automatically, and provide a simple way to merge them with a single #search call.	Ruby	99	7	1	\N	95	2008-04-05 05:13:03	2019-08-13 10:22:36	2017-09-26 21:12:16
2873331	celluloid	21	https://github.com/technoweenie/celluloid	https://api.github.com/repos/technoweenie/celluloid/subscription	https://github.com/technoweenie/celluloid.git	Concurrent objects for Ruby	Ruby	529	1	0	\N	2	2011-11-29 05:40:47	2018-02-18 17:55:09	2011-11-29 05:41:05
1419404	chat_gram	21	https://github.com/technoweenie/chat_gram	https://api.github.com/repos/technoweenie/chat_gram/subscription	https://github.com/technoweenie/chat_gram.git	Barebones Instagram realtime endpoint for posting images to a chat service (Campfire).	Ruby	444	10	1	\N	19	2011-02-27 19:39:46	2020-07-20 17:24:51	2013-12-16 13:49:48
1025350	coffee-resque	21	https://github.com/technoweenie/coffee-resque	https://api.github.com/repos/technoweenie/coffee-resque/subscription	https://github.com/technoweenie/coffee-resque.git	\N	CoffeeScript	324	44	5	\N	544	2010-10-26 10:45:07	2021-01-22 16:30:41	2015-10-02 07:47:01
796686	coffee-sprites	21	https://github.com/technoweenie/coffee-sprites	https://api.github.com/repos/technoweenie/coffee-sprites/subscription	https://github.com/technoweenie/coffee-sprites.git	simple html 5 animation/sprites system heavily inspired by http://gamesinhtml5.blogspot.com/2010/07/game-in-progress-sprites-and-animation.html	JavaScript	103	3	0	\N	6	2010-07-25 12:45:26	2018-04-05 18:48:57	2010-07-25 12:46:10
71396	context_on_crack	21	https://github.com/technoweenie/context_on_crack	https://api.github.com/repos/technoweenie/context_on_crack/subscription	https://github.com/technoweenie/context_on_crack.git	experimental macros for testing rails controllers.  port of rspec_on_rails_on_crack	\N	88	4	0	\N	11	2008-11-04 04:41:16	2019-08-13 10:40:50	2008-11-04 04:48:04
151188	cronwtf	21	https://github.com/technoweenie/cronwtf	https://api.github.com/repos/technoweenie/cronwtf/subscription	https://github.com/technoweenie/cronwtf.git	silly cron => english translator	JavaScript	111	14	1	\N	93	2009-03-15 02:30:56	2019-08-13 11:09:27	2019-05-03 12:21:30
22359441	dangerroom	21	https://github.com/technoweenie/dangerroom	https://api.github.com/repos/technoweenie/dangerroom/subscription	https://github.com/technoweenie/dangerroom.git	\N	Go	156	1	0	\N	7	2014-07-28 19:02:49	2019-08-13 12:47:12	2014-10-10 20:30:26
598176	dealer.js	21	https://github.com/technoweenie/dealer.js	https://api.github.com/repos/technoweenie/dealer.js/subscription	https://github.com/technoweenie/dealer.js.git	\N	JavaScript	129	7	0	\N	21	2010-04-06 23:06:39	2021-01-13 16:28:39	2010-07-22 20:49:24
27607751	dummy-repo	21	https://github.com/technoweenie/dummy-repo	https://api.github.com/repos/technoweenie/dummy-repo/subscription	https://github.com/technoweenie/dummy-repo.git	\N	\N	128	1	5	\N	1	2014-12-05 17:58:54	2018-02-18 17:55:41	2016-10-01 14:35:43
105	duplikate	21	https://github.com/technoweenie/duplikate	https://api.github.com/repos/technoweenie/duplikate/subscription	https://github.com/technoweenie/duplikate.git	Syncs one directory to another (example: a git project to an svn repo)	Ruby	97	2	0	\N	23	2008-01-25 18:21:40	2019-08-13 10:21:20	2008-04-10 11:51:49
3599334	elixir-lang.github.com	21	https://github.com/technoweenie/elixir-lang.github.com	https://api.github.com/repos/technoweenie/elixir-lang.github.com/subscription	https://github.com/technoweenie/elixir-lang.github.com.git	Website for Elixir	JavaScript	202	2	0	\N	2	2012-03-02 02:01:34	2018-02-18 17:55:49	2012-03-02 02:02:21
3599691	elixir-rubyports	21	https://github.com/technoweenie/elixir-rubyports	https://api.github.com/repos/technoweenie/elixir-rubyports/subscription	https://github.com/technoweenie/elixir-rubyports.git	\N	Elixir	96	2	0	\N	4	2012-03-02 03:05:54	2018-02-18 17:55:53	2012-03-02 04:05:47
1298439	emoji-css-builder	21	https://github.com/technoweenie/emoji-css-builder	https://api.github.com/repos/technoweenie/emoji-css-builder/subscription	https://github.com/technoweenie/emoji-css-builder.git	Quick Ruby rake task for generating CSS and tiled image for displaying emoji in browsers.	Ruby	530	4	0	\N	29	2011-01-27 07:13:16	2021-01-13 16:30:43	2011-01-27 07:24:11
14824908	etcd	21	https://github.com/technoweenie/etcd	https://api.github.com/repos/technoweenie/etcd/subscription	https://github.com/technoweenie/etcd.git	A highly-available key value store for shared configuration and service discovery	Go	4263	0	0	\N	1	2013-11-30 15:09:31	2018-08-27 22:25:29	2013-12-02 11:44:01
617923	fab	21	https://github.com/technoweenie/fab	https://api.github.com/repos/technoweenie/fab/subscription	https://github.com/technoweenie/fab.git	a javascript DSL for building async web apps	JavaScript	265	2	0	\N	3	2010-04-19 12:11:36	2018-02-18 17:56:06	2010-09-24 21:36:53
20005399	bingo	22	https://github.com/macournoyer/bingo	https://api.github.com/repos/macournoyer/bingo/subscription	https://github.com/macournoyer/bingo.git	Bingo: An easy to learn programming language for first timers	JavaScript	163	0	0	\N	1	2014-05-20 23:36:34	2020-07-10 11:18:24	2015-01-19 13:37:39
6603281	cache_digests	22	https://github.com/macournoyer/cache_digests	https://api.github.com/repos/macournoyer/cache_digests/subscription	https://github.com/macournoyer/cache_digests.git	\N	Ruby	115	1	0	\N	1	2012-11-08 19:00:51	2018-02-18 18:09:39	2012-11-08 19:41:50
551544	confoo	22	https://github.com/macournoyer/confoo	https://api.github.com/repos/macournoyer/confoo/subscription	https://github.com/macournoyer/confoo.git	My Confoo.ca presentation: How to kick assess with asynchronous processing	Ruby	6729	0	0	\N	6	2010-03-07 18:26:05	2014-05-15 04:21:02	2010-03-11 23:36:33
212097	em-spec	22	https://github.com/macournoyer/em-spec	https://api.github.com/repos/macournoyer/em-spec/subscription	https://github.com/macournoyer/em-spec.git	Simple BDD API for testing asynchronous Ruby/EventMachine code	Ruby	93	1	0	\N	3	2009-05-27 21:55:11	2019-08-13 11:26:07	2009-05-27 21:59:54
8736610	eventmachine	22	https://github.com/macournoyer/eventmachine	https://api.github.com/repos/macournoyer/eventmachine/subscription	https://github.com/macournoyer/eventmachine.git	EventMachine: fast, simple event-processing library for Ruby programs	Ruby	1750	1	0	\N	1	2013-03-12 16:36:39	2018-08-10 10:47:58	2013-03-12 17:08:00
12608121	fast_output_buffer	22	https://github.com/macournoyer/fast_output_buffer	https://api.github.com/repos/macournoyer/fast_output_buffer/subscription	https://github.com/macournoyer/fast_output_buffer.git	A faster output buffer for ActionView.	C	144	2	0	\N	22	2013-09-05 00:10:57	2018-04-25 16:16:37	2013-09-05 14:51:05
2640495	faye	22	https://github.com/macournoyer/faye	https://api.github.com/repos/macournoyer/faye/subscription	https://github.com/macournoyer/faye.git	Simple pub/sub messaging for the web	JavaScript	2182	0	0	\N	2	2011-10-24 23:27:19	2018-02-18 18:09:59	2011-10-25 00:09:23
265153	gh-contest	22	https://github.com/macournoyer/gh-contest	https://api.github.com/repos/macournoyer/gh-contest/subscription	https://github.com/macournoyer/gh-contest.git	\N	Ruby	4924	0	0	\N	2	2009-07-30 18:27:03	2018-02-18 18:10:03	2009-07-30 18:43:39
18243904	html_ruby	22	https://github.com/macournoyer/html_ruby	https://api.github.com/repos/macournoyer/html_ruby/subscription	https://github.com/macournoyer/html_ruby.git	simple html language template	Ruby	121	1	0	\N	1	2014-03-29 12:20:56	2018-02-18 18:10:07	2014-03-29 12:44:37
154888792	hyper-proxy	22	https://github.com/macournoyer/hyper-proxy	https://api.github.com/repos/macournoyer/hyper-proxy/subscription	https://github.com/macournoyer/hyper-proxy.git	A proxy connector for Hyper-based crates	Rust	34	0	0	\N	0	2018-10-26 17:11:44	2018-10-26 17:11:46	2018-09-25 03:28:26
377	invisible	22	https://github.com/macournoyer/invisible	https://api.github.com/repos/macournoyer/invisible/subscription	https://github.com/macournoyer/invisible.git	The invisible framework	CSS	206	9	1	\N	50	2008-02-09 16:38:52	2019-08-13 10:21:24	2009-03-24 22:32:40
104475	iolounge	22	https://github.com/macournoyer/iolounge	https://api.github.com/repos/macournoyer/iolounge/subscription	https://github.com/macournoyer/iolounge.git	My personal casual comforting place to play w/ Io	\N	80	1	0	\N	2	2009-01-09 23:22:17	2019-08-13 10:52:38	2009-01-09 23:22:22
217626	is_taggable	22	https://github.com/macournoyer/is_taggable	https://api.github.com/repos/macournoyer/is_taggable/subscription	https://github.com/macournoyer/is_taggable.git	Tagging that doesn't want to be on steroids. It's skinny and happy to stay that way	Ruby	99	1	0	\N	3	2009-06-03 14:33:37	2018-02-18 18:10:19	2009-06-03 14:46:19
320438236	language-liquid	22	https://github.com/macournoyer/language-liquid	https://api.github.com/repos/macournoyer/language-liquid/subscription	https://github.com/macournoyer/language-liquid.git	Liquid language support for Atom.	\N	43	0	0	\N	0	2020-12-10 22:50:52	2020-12-10 23:05:32	2020-12-10 23:05:30
4847140	libuv	22	https://github.com/macournoyer/libuv	https://api.github.com/repos/macournoyer/libuv/subscription	https://github.com/macournoyer/libuv.git	platform layer for node.js	C	7715	0	0	\N	2	2012-06-30 22:57:56	2019-04-02 14:41:13	2012-06-29 22:27:40
320443864	linguist	22	https://github.com/macournoyer/linguist	https://api.github.com/repos/macournoyer/linguist/subscription	https://github.com/macournoyer/linguist.git	Language Savant. If your repository's language is being reported incorrectly, send us a pull request!	\N	36775	0	0	\N	0	2020-12-10 23:20:50	2020-12-10 23:20:53	2020-12-11 07:54:18
59438	llvmruby	22	https://github.com/macournoyer/llvmruby	https://api.github.com/repos/macournoyer/llvmruby/subscription	https://github.com/macournoyer/llvmruby.git	LLVM bindings for Ruby	Ruby	611	0	0	\N	8	2008-10-04 01:16:07	2019-11-04 17:29:55	2008-10-24 00:20:59
94393	macournoyer.github.com	22	https://github.com/macournoyer/macournoyer.github.com	https://api.github.com/repos/macournoyer/macournoyer.github.com/subscription	https://github.com/macournoyer/macournoyer.github.com.git	ze github pages of mine	\N	80	0	0	\N	3	2008-12-20 11:51:48	2019-08-13 10:49:10	2008-12-21 01:32:32
18455	meshu	22	https://github.com/macournoyer/meshu	https://api.github.com/repos/macournoyer/meshu/subscription	https://github.com/macournoyer/meshu.git	MeshU presentation	Ruby	9296	0	0	\N	3	2008-05-20 21:17:31	2019-08-13 10:24:56	2008-05-20 21:21:42
97394	min	22	https://github.com/macournoyer/min	https://api.github.com/repos/macournoyer/min/subscription	https://github.com/macournoyer/min.git	The Min language	Java	1620	12	0	\N	99	2008-12-28 04:56:31	2020-11-24 21:02:56	2014-07-18 11:58:24
866	mor7	22	https://github.com/macournoyer/mor7	https://api.github.com/repos/macournoyer/mor7/subscription	https://github.com/macournoyer/mor7.git	My Montreal on Rails 7 presentation of Thin	Ruby	7476	0	0	\N	3	2008-02-20 15:59:41	2019-08-13 10:21:27	2008-03-26 16:17:36
3202538	mtlrb-jan12	22	https://github.com/macournoyer/mtlrb-jan12	https://api.github.com/repos/macournoyer/mtlrb-jan12/subscription	https://github.com/macournoyer/mtlrb-jan12.git	Montreal.rb January 2012 presentation on creating an homoiconic programming language in < 150 LOC.	Ruby	2206	1	0	\N	4	2012-01-17 17:52:20	2018-02-18 18:10:51	2012-01-18 11:52:10
386983	mysql_s3_backup	22	https://github.com/macournoyer/mysql_s3_backup	https://api.github.com/repos/macournoyer/mysql_s3_backup/subscription	https://github.com/macournoyer/mysql_s3_backup.git	A simple backup script for Mysql and S3 with incremental backups.	Ruby	79	6	0	\N	22	2009-11-26 21:01:51	2019-02-12 18:42:43	2009-11-27 01:55:08
389927	nanodb	22	https://github.com/macournoyer/nanodb	https://api.github.com/repos/macournoyer/nanodb/subscription	https://github.com/macournoyer/nanodb.git	an ultra tiny db	\N	1511	4	0	\N	16	2009-11-30 05:18:38	2019-08-13 11:29:33	2009-11-30 05:19:08
44709583	neuralconvo	22	https://github.com/macournoyer/neuralconvo	https://api.github.com/repos/macournoyer/neuralconvo/subscription	https://github.com/macournoyer/neuralconvo.git	Neural conversational model in Torch	Lua	91	361	26	\N	773	2015-10-21 21:08:43	2021-01-25 04:50:51	2019-05-31 05:42:14
75564576	nn.rb	22	https://github.com/macournoyer/nn.rb	https://api.github.com/repos/macournoyer/nn.rb/subscription	https://github.com/macournoyer/nn.rb.git	A toy Neural Network in Ruby	Ruby	5	3	1	\N	21	2016-12-04 19:06:54	2019-04-22 15:21:11	2017-10-17 14:13:24
473972	node-cusec	22	https://github.com/macournoyer/node-cusec	https://api.github.com/repos/macournoyer/node-cusec/subscription	https://github.com/macournoyer/node-cusec.git	node.js CUSEC 2010 presentation stuff	JavaScript	6972	0	0	\N	4	2010-01-15 16:26:00	2014-05-01 12:55:43	2010-01-23 01:27:30
5497901	node-syscalls	22	https://github.com/macournoyer/node-syscalls	https://api.github.com/repos/macournoyer/node-syscalls/subscription	https://github.com/macournoyer/node-syscalls.git	Node wrapper to some UNIX syscalls. Used during http://truthabouteventloops.com/.	C++	16	0	0	\N	5	2012-08-21 13:37:25	2019-11-15 09:00:13	2018-06-30 21:23:22
66150	orange	22	https://github.com/macournoyer/orange	https://api.github.com/repos/macournoyer/orange/subscription	https://github.com/macournoyer/orange.git	Yummy & juicy compiler	Ruby	87	2	0	\N	56	2008-10-22 02:56:59	2020-12-05 20:52:07	2008-10-29 01:08:28
145007	peg	22	https://github.com/macournoyer/peg	https://api.github.com/repos/macournoyer/peg/subscription	https://github.com/macournoyer/peg.git	fork of peg/leg	C	116	0	0	\N	5	2009-03-07 01:27:08	2019-08-13 11:07:16	2009-04-05 00:43:57
1340328	Brief	23	https://github.com/takeo/Brief	https://api.github.com/repos/takeo/Brief/subscription	https://github.com/takeo/Brief.git	Brief is a Chat Style for Skype 5 on OS X.	JavaScript	1848	1	0	\N	2	2011-02-07 23:19:49	2018-02-18 17:50:20	2011-02-14 16:49:18
52129238	ChromeAutoTextExpander	23	https://github.com/takeo/ChromeAutoTextExpander	https://api.github.com/repos/takeo/ChromeAutoTextExpander/subscription	https://github.com/takeo/ChromeAutoTextExpander.git	Google Chrome Extension : Auto Text Expander - listens for keypresses on pages that support it and will auto-replace text as you type. Keywords: javascript jquery chrome text expander replacement.	JavaScript	21667	1	0	\N	2	2016-02-19 23:06:36	2018-02-18 17:50:24	2016-03-03 00:53:48
696175	GoogleAnalyticsProxy	23	https://github.com/takeo/GoogleAnalyticsProxy	https://api.github.com/repos/takeo/GoogleAnalyticsProxy/subscription	https://github.com/takeo/GoogleAnalyticsProxy.git	A JavaScript proxy class for Google Analytics, which allows you to test event tracking in development mode.	JavaScript	78	1	0	\N	2	2010-05-31 18:56:35	2018-02-18 17:50:30	2009-11-01 16:55:21
12777	googlecharts	23	https://github.com/takeo/googlecharts	https://api.github.com/repos/takeo/googlecharts/subscription	https://github.com/takeo/googlecharts.git	Sexy Charts using Google API & Ruby	Ruby	136	1	0	\N	4	2008-04-27 01:19:08	2019-08-13 10:23:38	2008-05-09 03:31:09
29680	jquery-hotkeys	23	https://github.com/takeo/jquery-hotkeys	https://api.github.com/repos/takeo/jquery-hotkeys/subscription	https://github.com/takeo/jquery-hotkeys.git	jQuery hotkeys plugin.	\N	80	1	0	\N	2	2008-06-29 06:11:50	2019-08-13 10:27:54	2008-06-29 06:17:07
730019	laterstars-for-safari	23	https://github.com/takeo/laterstars-for-safari	https://api.github.com/repos/takeo/laterstars-for-safari/subscription	https://github.com/takeo/laterstars-for-safari.git	A Safari extension to replace the Laterstars one-click fave bookmarklet	JavaScript	147	1	0	\N	2	2010-06-19 23:10:30	2018-02-18 17:50:42	2010-06-20 18:18:37
11516896	MooTune	23	https://github.com/takeo/MooTune	https://api.github.com/repos/takeo/MooTune/subscription	https://github.com/takeo/MooTune.git	A MooTools class for logging events, errors and AB tests to multiple backends such as Google Analytics, Mixpanel or your own server logs.	JavaScript	92	1	0	\N	1	2013-07-18 21:34:14	2018-02-18 17:50:46	2013-09-03 19:56:36
494173	MooZoom	23	https://github.com/takeo/MooZoom	https://api.github.com/repos/takeo/MooZoom/subscription	https://github.com/takeo/MooZoom.git	An image zoomer for MooTools	JavaScript	203	1	0	\N	2	2010-01-29 18:27:35	2018-02-18 17:50:50	2010-01-08 20:22:19
45642	outlook-with-attitude	23	https://github.com/takeo/outlook-with-attitude	https://api.github.com/repos/takeo/outlook-with-attitude/subscription	https://github.com/takeo/outlook-with-attitude.git	Turning Outlook Web Access from a Gent to a G	JavaScript	90	4	2	\N	7	2008-08-25 00:35:03	2019-08-13 10:32:47	2008-11-13 19:22:34
136044	permanent_records	23	https://github.com/takeo/permanent_records	https://api.github.com/repos/takeo/permanent_records/subscription	https://github.com/takeo/permanent_records.git	Rails Plugin - soft-delete your ActiveRecord records with a deleted_at timestamp.  This is a much more explicit version of ActsAsParanoid	Ruby	92	1	0	\N	2	2009-02-24 02:30:11	2019-08-13 11:03:29	2008-07-05 01:27:39
27650176	rdify	23	https://github.com/takeo/rdify	https://api.github.com/repos/takeo/rdify/subscription	https://github.com/takeo/rdify.git	A simple chrome extension to forward open.spotify links to rdio	JavaScript	200	1	0	\N	1	2014-12-06 19:46:22	2018-02-18 17:51:03	2012-04-25 18:57:10
3022566	redmine_client	23	https://github.com/takeo/redmine_client	https://api.github.com/repos/takeo/redmine_client/subscription	https://github.com/takeo/redmine_client.git	Redmine API client	Ruby	93	1	0	\N	3	2011-12-20 19:11:56	2018-02-18 17:51:12	2011-12-20 19:36:56
109243	select-autocompleter	23	https://github.com/takeo/select-autocompleter	https://api.github.com/repos/takeo/select-autocompleter/subscription	https://github.com/takeo/select-autocompleter.git	MooTools plugin to create editable select tags	JavaScript	150	1	0	\N	2	2009-01-17 06:22:09	2019-08-13 10:54:17	2009-01-18 03:16:46
50206681	starter-ruby-bot	23	https://github.com/takeo/starter-ruby-bot	https://api.github.com/repos/takeo/starter-ruby-bot/subscription	https://github.com/takeo/starter-ruby-bot.git	A simple Beep Boop ready starter project in Ruby 	Ruby	158	1	0	\N	2	2016-01-22 18:48:13	2018-02-18 17:51:20	2016-01-22 18:50:18
39090	steezy-pibb	23	https://github.com/takeo/steezy-pibb	https://api.github.com/repos/takeo/steezy-pibb/subscription	https://github.com/takeo/steezy-pibb.git	Makes Pibb+Fluid one hell of a steez.	JavaScript	206	0	0	\N	2	2008-08-01 01:26:22	2019-08-13 10:30:33	2008-11-03 17:12:30
7292051	takeo.github.com	23	https://github.com/takeo/takeo.github.com	https://api.github.com/repos/takeo/takeo.github.com/subscription	https://github.com/takeo/takeo.github.com.git	takeo.me website	JavaScript	1260	1	1	\N	1	2012-12-23 03:15:01	2018-02-18 17:51:30	2013-03-06 01:06:09
503213	TextboxList	23	https://github.com/takeo/TextboxList	https://api.github.com/repos/takeo/TextboxList/subscription	https://github.com/takeo/TextboxList.git	MooTools tokenizer	JavaScript	166	1	0	\N	2	2010-02-04 22:56:55	2018-02-18 17:51:34	2009-12-10 09:23:00
2535600	ValidateSimple	23	https://github.com/takeo/ValidateSimple	https://api.github.com/repos/takeo/ValidateSimple/subscription	https://github.com/takeo/ValidateSimple.git	Simple form validation with good UX for MooTools	JavaScript	436	1	0	\N	2	2011-10-07 19:06:50	2018-02-18 17:51:38	2011-10-19 16:39:05
5515698	warden	23	https://github.com/takeo/warden	https://api.github.com/repos/takeo/warden/subscription	https://github.com/takeo/warden.git	General Rack Authentication Framework	Ruby	522	1	0	\N	1	2012-08-22 18:36:39	2018-03-22 17:18:03	2012-06-16 09:24:09
234451329	airstream	25	https://github.com/caged/airstream	https://api.github.com/repos/caged/airstream/subscription	https://github.com/caged/airstream.git	Color tools plugin for Figma	JavaScript	765	0	4	\N	2	2020-01-16 23:09:47	2020-04-13 14:24:07	2020-07-19 04:54:57
137798	aixmlserialize	25	https://github.com/caged/aixmlserialize	https://api.github.com/repos/caged/aixmlserialize/subscription	https://github.com/caged/aixmlserialize.git	Aims to convert to and from NSXMLDocuments and NSDictionarys on the iPhone (using KissXML) and OS X.	Objective-C	202	3	0	\N	11	2009-02-25 21:46:19	2019-08-13 11:04:05	2009-03-08 19:29:49
1615857	asset	25	https://github.com/caged/asset	https://api.github.com/repos/caged/asset/subscription	https://github.com/caged/asset.git	little asset manager for lazy people. written with node 	JavaScript	144	1	0	\N	3	2011-04-14 16:31:47	2019-07-14 14:15:36	2011-05-24 16:03:09
136747284	attractor	25	https://github.com/caged/attractor	https://api.github.com/repos/caged/attractor/subscription	https://github.com/caged/attractor.git	\N	JavaScript	69	0	0	\N	1	2018-06-09 15:15:04	2018-10-09 04:48:57	2018-06-09 15:15:18
51460686	bash-test	25	https://github.com/caged/bash-test	https://api.github.com/repos/caged/bash-test/subscription	https://github.com/caged/bash-test.git	\N	Shell	1	0	0	\N	1	2016-02-10 16:11:56	2018-02-18 17:58:29	2016-02-10 16:15:21
118284781	basketball-stats	25	https://github.com/caged/basketball-stats	https://api.github.com/repos/caged/basketball-stats/subscription	https://github.com/caged/basketball-stats.git	\N	Jupyter Notebook	906	0	0	\N	1	2018-01-20 20:10:42	2019-04-25 16:10:45	2018-01-29 00:18:38
7313553	bbref-graphs	25	https://github.com/caged/bbref-graphs	https://api.github.com/repos/caged/bbref-graphs/subscription	https://github.com/caged/bbref-graphs.git	Chrome extension to convert tables of statistics to charts on http://basketball-reference.com	JavaScript	408	2	1	\N	2	2012-12-25 01:06:19	2019-04-25 16:10:42	2012-12-30 17:39:32
270869210	budget	25	https://github.com/caged/budget	https://api.github.com/repos/caged/budget/subscription	https://github.com/caged/budget.git	A look at Portland, Oregon's city budget over the years	JavaScript	17	0	0	\N	1	2020-06-08 21:59:54	2020-06-12 14:05:35	2020-06-08 22:11:46
66773693	canvas-examples	25	https://github.com/caged/canvas-examples	https://api.github.com/repos/caged/canvas-examples/subscription	https://github.com/caged/canvas-examples.git	just a scratchpad for canvas experiments	JavaScript	20	0	0	\N	1	2016-08-28 11:49:45	2018-02-18 17:58:46	2017-08-16 00:24:10
144359336	canvas-sketch	25	https://github.com/caged/canvas-sketch	https://api.github.com/repos/caged/canvas-sketch/subscription	https://github.com/caged/canvas-sketch.git	[beta] A framework for making generative artwork in JavaScript and the browser.	JavaScript	19191	0	0	\N	0	2018-08-11 02:50:39	2018-08-11 12:52:55	2018-08-11 12:52:53
38092994	cartile	25	https://github.com/caged/cartile	https://api.github.com/repos/caged/cartile/subscription	https://github.com/caged/cartile.git	\N	JavaScript	144	0	0	\N	1	2015-06-26 02:42:15	2018-02-18 17:58:50	2015-06-27 22:26:13
13907055	census-tools	25	https://github.com/caged/census-tools	https://api.github.com/repos/caged/census-tools/subscription	https://github.com/caged/census-tools.git	Tools for working with NHGIS (https://www.nhgis.org) census data.	Shell	136	0	0	\N	1	2013-10-27 15:42:20	2018-02-18 17:58:54	2015-06-17 00:38:54
14038218	cfb-recruiting	25	https://github.com/caged/cfb-recruiting	https://api.github.com/repos/caged/cfb-recruiting/subscription	https://github.com/caged/cfb-recruiting.git	\N	Ruby	13688	0	0	\N	1	2013-11-01 05:48:50	2018-02-18 17:58:58	2015-11-20 18:00:08
312407642	choochoo	25	https://github.com/caged/choochoo	https://api.github.com/repos/caged/choochoo/subscription	https://github.com/caged/choochoo.git	\N	HTML	60	0	0	\N	0	2020-11-12 19:08:40	2020-11-12 20:11:07	2020-11-12 20:11:04
30319091	choropleth	25	https://github.com/caged/choropleth	https://api.github.com/repos/caged/choropleth/subscription	https://github.com/caged/choropleth.git	Quickly create choropleth map images from topojson data	JavaScript	120	0	0	\N	1	2015-02-04 18:20:05	2018-02-18 17:59:02	2015-02-04 19:34:59
131945394	city-gen	25	https://github.com/caged/city-gen	https://api.github.com/repos/caged/city-gen/subscription	https://github.com/caged/city-gen.git	\N	Shell	9690	0	0	\N	0	2018-05-03 02:22:31	2018-05-03 13:13:34	2018-05-03 13:13:32
89715259	citylist	25	https://github.com/caged/citylist	https://api.github.com/repos/caged/citylist/subscription	https://github.com/caged/citylist.git	\N	Python	60	0	0	\N	1	2017-04-28 11:43:18	2018-02-18 17:59:06	2017-06-06 17:32:06
40424533	civil-rights	25	https://github.com/caged/civil-rights	https://api.github.com/repos/caged/civil-rights/subscription	https://github.com/caged/civil-rights.git	A look into education-based civil rights data for public schools released by the US Department of Education U.S. Department of Education.	Makefile	1724	0	0	\N	1	2015-08-09 00:50:25	2018-02-18 17:59:11	2015-08-09 00:54:51
120890	cocos2d-game	25	https://github.com/caged/cocos2d-game	https://api.github.com/repos/caged/cocos2d-game/subscription	https://github.com/caged/cocos2d-game.git	Xcode Template for cocos2d-based iPhone games.  Includes cocos2d 0.6.3 & the Chipmunk physics engine.	Objective-C	440	2	0	\N	16	2009-02-03 16:50:59	2019-08-13 10:58:13	2009-02-03 17:09:03
67446443	color-wander	25	https://github.com/caged/color-wander	https://api.github.com/repos/caged/color-wander/subscription	https://github.com/caged/color-wander.git	:art: Generative artwork in node/browser based on a seeded random	JavaScript	35497	0	0	\N	1	2016-09-05 16:39:21	2018-07-22 23:40:16	2016-09-05 23:49:53
1988700	compass	25	https://github.com/caged/compass	https://api.github.com/repos/caged/compass/subscription	https://github.com/caged/compass.git	Compass is a Stylesheet Authoring Environment that makes your website design simpler to implement and easier to maintain.	Ruby	9767	0	0	\N	2	2011-07-02 16:01:25	2018-02-18 17:59:36	2011-07-02 17:27:41
232838	concurrent-nsoperation	25	https://github.com/caged/concurrent-nsoperation	https://api.github.com/repos/caged/concurrent-nsoperation/subscription	https://github.com/caged/concurrent-nsoperation.git	Concurrent NSOperation Sample	Objective-C	342	1	0	\N	7	2009-06-21 16:39:09	2018-03-14 19:55:33	2011-05-03 17:59:58
42401888	construction	25	https://github.com/caged/construction	https://api.github.com/repos/caged/construction/subscription	https://github.com/caged/construction.git	\N	Makefile	192	0	0	\N	1	2015-09-13 12:49:12	2018-02-18 17:59:46	2015-09-18 13:25:41
20005691	council-report	25	https://github.com/caged/council-report	https://api.github.com/repos/caged/council-report/subscription	https://github.com/caged/council-report.git	Fetch and parse Portland City Council data	Ruby	286	4	0	\N	4	2014-05-20 23:47:09	2018-02-18 17:59:50	2014-05-31 17:06:15
3542	gruff	26	https://github.com/topfunky/gruff	https://api.github.com/repos/topfunky/gruff/subscription	https://github.com/topfunky/gruff.git	Gruff graphing library for Ruby	Ruby	267838	228	49	\N	1163	2008-03-11 19:06:00	2021-01-26 12:40:08	2020-12-28 03:22:36
36240566	county-stat	25	https://github.com/caged/county-stat	https://api.github.com/repos/caged/county-stat/subscription	https://github.com/caged/county-stat.git	Experiment for exploring aggregate census data.  Counties-only for now.	JavaScript	480	0	0	\N	3	2015-05-25 13:03:44	2018-02-18 17:59:54	2015-06-17 00:40:31
21328459	csv2psql	25	https://github.com/caged/csv2psql	https://api.github.com/repos/caged/csv2psql/subscription	https://github.com/caged/csv2psql.git	Converts a CSV file into a PostgreSQL table	Python	158	2	0	\N	1	2014-06-29 14:37:07	2018-02-18 17:59:58	2014-06-29 14:53:58
4730073	cubism	25	https://github.com/caged/cubism	https://api.github.com/repos/caged/cubism/subscription	https://github.com/caged/cubism.git	Cubism.js: A JavaScript library for time series visualization.	JavaScript	443	0	0	\N	3	2012-06-20 15:58:11	2018-02-18 18:00:03	2015-03-10 13:52:52
1569206	d3	25	https://github.com/caged/d3	https://api.github.com/repos/caged/d3/subscription	https://github.com/caged/d3.git	A JavaScript visualization library for HTML and SVG.	JavaScript	15752	0	0	\N	3	2011-04-04 18:20:34	2019-07-14 14:15:36	2012-11-16 18:25:38
34823784	d3-grid	25	https://github.com/caged/d3-grid	https://api.github.com/repos/caged/d3-grid/subscription	https://github.com/caged/d3-grid.git	D3 grid layout	\N	92	0	0	\N	1	2015-04-29 20:32:40	2018-02-18 18:00:12	2015-04-29 20:45:36
12900888	d3-plugins	25	https://github.com/caged/d3-plugins	https://api.github.com/repos/caged/d3-plugins/subscription	https://github.com/caged/d3-plugins.git	A repository for sharing D3.js plugins.	JavaScript	1889	1	0	\N	3	2013-09-17 13:40:27	2018-02-18 18:00:21	2013-08-22 01:53:51
24363	ar_fixtures	26	https://github.com/topfunky/ar_fixtures	https://api.github.com/repos/topfunky/ar_fixtures/subscription	https://github.com/topfunky/ar_fixtures.git	Dumps YAML fixtures from existing data using ActiveRecord	Ruby	237	24	3	\N	68	2008-06-11 13:37:27	2019-08-13 10:26:33	2008-11-13 19:06:55
52452	basic_model	26	https://github.com/topfunky/basic_model	https://api.github.com/repos/topfunky/basic_model/subscription	https://github.com/topfunky/basic_model.git	A very thin wrapper around CouchRest, for use with CouchDB and Ruby on Rails.	Ruby	87	12	2	\N	51	2008-09-14 01:55:19	2019-08-13 10:35:06	2008-09-14 02:28:24
1441793	bigapp	26	https://github.com/topfunky/bigapp	https://api.github.com/repos/topfunky/bigapp/subscription	https://github.com/topfunky/bigapp.git	An application with many files. For testing only.	Ruby	196	1	0	\N	2	2011-03-04 21:50:18	2014-06-15 00:36:09	2011-03-04 21:50:41
68860702	blog-comments	26	https://github.com/topfunky/blog-comments	https://api.github.com/repos/topfunky/blog-comments/subscription	https://github.com/topfunky/blog-comments.git	Issues and comments related to the blog at https://www.topfunky.com	\N	0	0	1	\N	2	2016-09-21 18:52:53	2018-02-18 18:15:35	2016-09-21 18:52:53
74011	calendar_helper	26	https://github.com/topfunky/calendar_helper	https://api.github.com/repos/topfunky/calendar_helper/subscription	https://github.com/topfunky/calendar_helper.git	Calendar-generating plugin for Ruby	Ruby	332	97	2	\N	376	2008-11-10 17:56:22	2021-01-15 09:42:59	2014-12-29 09:57:40
323654	cappuccino-couchdb	26	https://github.com/topfunky/cappuccino-couchdb	https://api.github.com/repos/topfunky/cappuccino-couchdb/subscription	https://github.com/topfunky/cappuccino-couchdb.git	A class for working with CouchDB documents from Cappuccino/Objective-J	Objective-J	1529	6	0	\N	65	2009-10-01 14:22:52	2020-04-24 09:52:29	2009-10-12 02:13:16
665476	CocoaHelpDemo	26	https://github.com/topfunky/CocoaHelpDemo	https://api.github.com/repos/topfunky/CocoaHelpDemo/subscription	https://github.com/topfunky/CocoaHelpDemo.git	Demo application for generating bundled help documentation (requires Flying Meat's VoodoPad application)	Objective-C	152	1	0	\N	4	2010-05-13 19:31:48	2012-12-14 14:50:48	2010-05-13 19:32:02
11537130	css_graphs	26	https://github.com/topfunky/css_graphs	https://api.github.com/repos/topfunky/css_graphs/subscription	https://github.com/topfunky/css_graphs.git	Rails plugin for making HTML markup to display a bar graph.	Ruby	124	1	0	\N	1	2013-07-19 18:02:01	2018-02-18 18:18:41	2013-07-19 18:03:15
3642919	demo-mocha-watch-bug	26	https://github.com/topfunky/demo-mocha-watch-bug	https://api.github.com/repos/topfunky/demo-mocha-watch-bug/subscription	https://github.com/topfunky/demo-mocha-watch-bug.git	A demo to show a bug in mocha's --watch option	JavaScript	92	1	0	\N	2	2012-03-06 18:34:29	2014-04-27 05:59:32	2012-03-06 18:43:00
3802284	demo-simplest-socket-io	26	https://github.com/topfunky/demo-simplest-socket-io	https://api.github.com/repos/topfunky/demo-simplest-socket-io/subscription	https://github.com/topfunky/demo-simplest-socket-io.git	Very simple socket.io demo.	JavaScript	94	3	1	\N	5	2012-03-22 17:55:36	2018-02-18 18:19:30	2012-03-22 17:57:07
135780120	demo-terraform-101	26	https://github.com/topfunky/demo-terraform-101	https://api.github.com/repos/topfunky/demo-terraform-101/subscription	https://github.com/topfunky/demo-terraform-101.git	Before and after demo code for the Terraform Introduction training course	JavaScript	3935	0	0	\N	0	2018-06-01 23:19:39	2018-06-01 23:19:41	2018-06-24 16:56:55
3542282	demo-vows-callbacks	26	https://github.com/topfunky/demo-vows-callbacks	https://api.github.com/repos/topfunky/demo-vows-callbacks/subscription	https://github.com/topfunky/demo-vows-callbacks.git	A demo for Rob Conery. Nothing to see here.	CoffeeScript	96	1	0	\N	2	2012-02-25 02:01:20	2013-12-04 22:42:29	2012-02-25 02:11:56
104242308	exercism-projects	26	https://github.com/topfunky/exercism-projects	https://api.github.com/repos/topfunky/exercism-projects/subscription	https://github.com/topfunky/exercism-projects.git	My personal exercises on exercism.io for learning new languages	Go	77	0	0	\N	1	2017-09-20 13:46:07	2018-02-18 18:19:51	2017-10-12 04:25:02
3435773	geddy-coffee-script-demo	26	https://github.com/topfunky/geddy-coffee-script-demo	https://api.github.com/repos/topfunky/geddy-coffee-script-demo/subscription	https://github.com/topfunky/geddy-coffee-script-demo.git	Demo app using CoffeeScript with the Geddy web framework for Node.js	JavaScript	264	1	0	\N	5	2012-02-13 22:47:27	2018-02-18 18:19:59	2012-02-13 23:03:24
321865049	gghighcontrast	26	https://github.com/topfunky/gghighcontrast	https://api.github.com/repos/topfunky/gghighcontrast/subscription	https://github.com/topfunky/gghighcontrast.git	A high contrast theme to use with the ggplot library for R	R	232	0	0	\N	0	2020-12-16 01:12:45	2020-12-31 19:42:41	2020-12-31 19:42:39
10110495	gitignore	26	https://github.com/topfunky/gitignore	https://api.github.com/repos/topfunky/gitignore/subscription	https://github.com/topfunky/gitignore.git	A collection of useful .gitignore templates	\N	260	1	0	\N	0	2013-05-16 18:03:44	2013-08-18 09:14:24	2013-01-24 18:40:21
175087970	golang-samples	26	https://github.com/topfunky/golang-samples	https://api.github.com/repos/topfunky/golang-samples/subscription	https://github.com/topfunky/golang-samples.git	Sample apps and code written for Google Cloud in the Go programming language.	Go	16489	0	0	\N	0	2019-03-11 18:40:03	2019-07-16 05:11:49	2019-03-11 18:03:28
95217	good_form_builder	26	https://github.com/topfunky/good_form_builder	https://api.github.com/repos/topfunky/good_form_builder/subscription	https://github.com/topfunky/good_form_builder.git	Form builder for Rails based on Khoi Vinh's Good Form.	Ruby	92	1	0	\N	16	2008-12-22 06:13:55	2019-08-13 10:49:28	2009-03-03 01:46:36
14278	google-checkout	26	https://github.com/topfunky/google-checkout	https://api.github.com/repos/topfunky/google-checkout/subscription	https://github.com/topfunky/google-checkout.git	Experimental Google Checkout gem	Ruby	299	24	0	\N	61	2008-05-03 14:07:50	2020-07-01 17:11:13	2012-09-24 13:02:17
15156031	hello-demo	26	https://github.com/topfunky/hello-demo	https://api.github.com/repos/topfunky/hello-demo/subscription	https://github.com/topfunky/hello-demo.git	Simple Node.js project for demonstrating integration with a CI server.	JavaScript	468	1	1	\N	1	2013-12-13 03:59:58	2020-05-24 15:49:27	2013-12-20 22:33:20
199473611	HelloPluralsightProject	26	https://github.com/topfunky/HelloPluralsightProject	https://api.github.com/repos/topfunky/HelloPluralsightProject/subscription	https://github.com/topfunky/HelloPluralsightProject.git	Demonstration on how projects work at Pluralsight.	JavaScript	87	0	0	\N	0	2019-07-29 11:55:40	2019-07-29 11:58:17	2019-07-29 11:58:14
1211486	help.github.com	26	https://github.com/topfunky/help.github.com	https://api.github.com/repos/topfunky/help.github.com/subscription	https://github.com/topfunky/help.github.com.git	GitHub help guides	JavaScript	429	1	0	\N	2	2010-12-31 18:51:07	2014-02-06 00:22:32	2010-12-31 19:01:43
95431	hodel_3000_compliant_logger	26	https://github.com/topfunky/hodel_3000_compliant_logger	https://api.github.com/repos/topfunky/hodel_3000_compliant_logger/subscription	https://github.com/topfunky/hodel_3000_compliant_logger.git	Alternate logger for Rails that emits syslog-style output. For use with pl_analyze gem.	Ruby	16	13	3	\N	44	2008-12-22 17:31:13	2019-08-13 10:49:31	2020-02-29 05:29:47
118996	hpple	26	https://github.com/topfunky/hpple	https://api.github.com/repos/topfunky/hpple/subscription	https://github.com/topfunky/hpple.git	An XML/HTML parser for Objective-C, inspired by Hpricot.	Objective-C	112	483	39	\N	2766	2009-01-31 22:00:26	2021-01-30 07:56:13	2020-05-29 11:45:08
82326914	HTMLPortfolioProject	26	https://github.com/topfunky/HTMLPortfolioProject	https://api.github.com/repos/topfunky/HTMLPortfolioProject/subscription	https://github.com/topfunky/HTMLPortfolioProject.git	Code School Project: HTML + CSS Portfolio	JavaScript	761	0	0	\N	0	2017-02-17 16:37:31	2017-02-17 16:37:33	2017-02-16 02:19:20
886254	JSLint.tmbundle	26	https://github.com/topfunky/JSLint.tmbundle	https://api.github.com/repos/topfunky/JSLint.tmbundle/subscription	https://github.com/topfunky/JSLint.tmbundle.git	The easiest way to syntax check your JavaScript code from TextMate	JavaScript	132	1	1	\N	15	2010-09-03 14:52:43	2017-05-22 22:40:17	2010-09-03 15:16:40
143462741	katacoda-dev	26	https://github.com/topfunky/katacoda-dev	https://api.github.com/repos/topfunky/katacoda-dev/subscription	https://github.com/topfunky/katacoda-dev.git	Experiments with interactive Katacoda tutorials	Makefile	7122	0	0	\N	1	2018-08-03 15:53:35	2020-06-15 20:48:17	2020-06-15 20:48:14
331841667	launchbar-bluetooth-devices	26	https://github.com/topfunky/launchbar-bluetooth-devices	https://api.github.com/repos/topfunky/launchbar-bluetooth-devices/subscription	https://github.com/topfunky/launchbar-bluetooth-devices.git	A LaunchBar action to [dis]connect your bluetooth device with a few keypress	JavaScript	1161	0	0	\N	0	2021-01-22 02:02:24	2021-01-22 02:07:52	2021-01-22 02:07:50
301891478	learn-terraform-provision-eks-cluster	26	https://github.com/topfunky/learn-terraform-provision-eks-cluster	https://api.github.com/repos/topfunky/learn-terraform-provision-eks-cluster/subscription	https://github.com/topfunky/learn-terraform-provision-eks-cluster.git	\N	\N	17	0	0	\N	0	2020-10-06 21:53:52	2020-10-06 21:53:54	2020-10-06 21:55:13
5309981	ansible	27	https://github.com/anotherjesse/ansible	https://api.github.com/repos/anotherjesse/ansible/subscription	https://github.com/anotherjesse/ansible.git	Michael's copy of Ansible.  Model-driven configuration management, multi-node deployment, and remote task execution system.   Fork github.com/ansible/ansible instead!	Python	8926	0	0	\N	1	2012-08-06 01:10:22	2020-01-14 10:29:06	2012-11-03 14:16:15
10428072	ansible-playbook-gitlab	27	https://github.com/anotherjesse/ansible-playbook-gitlab	https://api.github.com/repos/anotherjesse/ansible-playbook-gitlab/subscription	https://github.com/anotherjesse/ansible-playbook-gitlab.git	Playbook for installing GitLab 5.1 on Debian unstable	\N	78	1	0	\N	1	2013-06-01 17:30:11	2018-02-18 17:34:36	2013-04-23 18:07:56
5333218	ansible.github.com	27	https://github.com/anotherjesse/ansible.github.com	https://api.github.com/repos/anotherjesse/ansible.github.com/subscription	https://github.com/anotherjesse/ansible.github.com.git	ansible.github.com web site	JavaScript	4017	1	0	\N	0	2012-08-07 17:34:36	2020-01-09 12:56:52	2012-08-07 19:49:20
205897834	barb	27	https://github.com/anotherjesse/barb	https://api.github.com/repos/anotherjesse/barb/subscription	https://github.com/anotherjesse/barb.git	\N	JavaScript	155	0	0	\N	1	2019-09-02 13:39:59	2020-01-09 12:56:35	2019-09-02 14:30:51
326479	bb-site	27	https://github.com/anotherjesse/bb-site	https://api.github.com/repos/anotherjesse/bb-site/subscription	https://github.com/anotherjesse/bb-site.git	Book Burro website (couchdb+sinatra)	Ruby	1166	4	0	\N	5	2009-10-04 16:18:35	2020-01-09 05:20:33	2010-01-06 20:13:16
38046	beboist	27	https://github.com/anotherjesse/beboist	https://api.github.com/repos/anotherjesse/beboist/subscription	https://github.com/anotherjesse/beboist.git	A Rails plugin to work with the Bebo API	Ruby	96	2	0	\N	2	2008-07-28 20:46:29	2019-08-13 10:30:14	2008-07-28 20:47:47
270437	big-brother	27	https://github.com/anotherjesse/big-brother	https://api.github.com/repos/anotherjesse/big-brother/subscription	https://github.com/anotherjesse/big-brother.git	use the iSight camera to remind you that you are being watched	Python	80	1	0	\N	2	2009-08-06 03:21:35	2014-02-20 04:43:45	2009-08-06 14:49:50
325175	bookburro	27	https://github.com/anotherjesse/bookburro	https://api.github.com/repos/anotherjesse/bookburro/subscription	https://github.com/anotherjesse/bookburro.git	Book Burro for Firefox	JavaScript	228	8	0	\N	16	2009-10-02 21:57:30	2020-09-19 02:59:15	2010-03-28 19:59:06
28357	caltrain	27	https://github.com/anotherjesse/caltrain	https://api.github.com/repos/anotherjesse/caltrain/subscription	https://github.com/anotherjesse/caltrain.git	source of caltrainapp.com	JavaScript	148	2	0	\N	2	2008-06-24 20:18:43	2019-08-13 10:27:32	2008-06-25 04:06:04
484808	chrome-s3	27	https://github.com/anotherjesse/chrome-s3	https://api.github.com/repos/anotherjesse/chrome-s3/subscription	https://github.com/anotherjesse/chrome-s3.git	chrome extension to browse Amazon S3	JavaScript	299	14	0	\N	5	2010-01-23 03:16:59	2018-02-18 17:35:11	2011-06-26 00:27:12
486177	chromr	27	https://github.com/anotherjesse/chromr	https://api.github.com/repos/anotherjesse/chromr/subscription	https://github.com/anotherjesse/chromr.git	flickr new tab ui	\N	96	4	0	\N	6	2010-01-24 08:54:16	2018-02-18 17:35:15	2010-01-27 21:07:29
5954569	cloudenvy	27	https://github.com/anotherjesse/cloudenvy	https://api.github.com/repos/anotherjesse/cloudenvy/subscription	https://github.com/anotherjesse/cloudenvy.git	\N	Python	127	1	0	\N	1	2012-09-25 15:33:52	2018-02-18 17:35:20	2012-09-25 04:44:28
306157	Cointoss-Ruby	27	https://github.com/anotherjesse/Cointoss-Ruby	https://api.github.com/repos/anotherjesse/Cointoss-Ruby/subscription	https://github.com/anotherjesse/Cointoss-Ruby.git	Port of cointoss.wakingideas.com to ruby	Ruby	87	1	0	\N	1	2009-09-13 22:19:02	2020-01-09 12:43:32	2009-09-13 22:31:23
70666	contacts	27	https://github.com/anotherjesse/contacts	https://api.github.com/repos/anotherjesse/contacts/subscription	https://github.com/anotherjesse/contacts.git	rails 2.1 + sproutcore	Ruby	92	2	0	\N	4	2008-11-02 08:17:48	2020-01-09 08:53:48	2008-11-02 09:01:31
3004375	cuisine	27	https://github.com/anotherjesse/cuisine	https://api.github.com/repos/anotherjesse/cuisine/subscription	https://github.com/anotherjesse/cuisine.git	Chef-like functionality for Fabric	Python	232	1	0	\N	1	2011-12-18 01:30:21	2020-01-09 08:53:46	2011-12-04 14:37:12
1810684	dotfiles	27	https://github.com/anotherjesse/dotfiles	https://api.github.com/repos/anotherjesse/dotfiles/subscription	https://github.com/anotherjesse/dotfiles.git	\N	Emacs Lisp	1331	1	0	\N	3	2011-05-27 13:48:17	2018-02-18 17:35:36	2014-12-01 02:35:30
25578	droplet	27	https://github.com/anotherjesse/droplet	https://api.github.com/repos/anotherjesse/droplet/subscription	https://github.com/anotherjesse/droplet.git	rain drops of music from the cloud	\N	88	1	0	\N	3	2008-06-15 22:48:17	2020-01-09 08:53:47	2008-06-15 22:49:47
902	elasticfox	27	https://github.com/anotherjesse/elasticfox	https://api.github.com/repos/anotherjesse/elasticfox/subscription	https://github.com/anotherjesse/elasticfox.git	ec2 extension for firefox	JavaScript	182	3	1	\N	9	2008-02-21 07:02:53	2019-08-13 10:21:29	2008-03-26 16:17:54
262956903	electron_phoenix_boilerplate	27	https://github.com/anotherjesse/electron_phoenix_boilerplate	https://api.github.com/repos/anotherjesse/electron_phoenix_boilerplate/subscription	https://github.com/anotherjesse/electron_phoenix_boilerplate.git	Is embedding an elixir application inside of an Electron desktop app a terrible idea?	Elixir	242	0	0	\N	0	2020-05-11 03:25:04	2020-05-11 03:26:00	2020-05-11 03:25:57
574337	erlanguniversity	27	https://github.com/anotherjesse/erlanguniversity	https://api.github.com/repos/anotherjesse/erlanguniversity/subscription	https://github.com/anotherjesse/erlanguniversity.git	hacking during kevin smith's web+erlang course	Erlang	464	1	0	\N	3	2010-03-22 14:27:49	2020-01-09 08:53:44	2010-03-23 14:16:22
419983	erlws	27	https://github.com/anotherjesse/erlws	https://api.github.com/repos/anotherjesse/erlws/subscription	https://github.com/anotherjesse/erlws.git	b	Erlang	76	1	0	\N	5	2009-12-11 15:43:35	2018-02-18 17:35:52	2009-12-11 18:19:28
555495	etherpad	27	https://github.com/anotherjesse/etherpad	https://api.github.com/repos/anotherjesse/etherpad/subscription	https://github.com/anotherjesse/etherpad.git	Madriska's fork of Etherpad with PostgreSQL support.	Java	16592	2	0	\N	3	2010-03-10 03:32:14	2012-12-14 00:11:09	2010-03-11 04:13:04
249535	euler	27	https://github.com/anotherjesse/euler	https://api.github.com/repos/anotherjesse/euler/subscription	https://github.com/anotherjesse/euler.git	my project euler solutions	Ruby	124	1	0	\N	3	2009-07-12 20:02:01	2020-01-09 05:20:54	2009-08-09 15:31:41
429	exception_logger	27	https://github.com/anotherjesse/exception_logger	https://api.github.com/repos/anotherjesse/exception_logger/subscription	https://github.com/anotherjesse/exception_logger.git	our hacks to exception_logger	Ruby	175	3	0	\N	5	2008-01-14 01:32:19	2020-02-10 22:31:33	2008-03-26 16:14:14
600	finally	27	https://github.com/anotherjesse/finally	https://api.github.com/repos/anotherjesse/finally/subscription	https://github.com/anotherjesse/finally.git	\N	JavaScript	830	2	0	\N	6	2008-02-15 21:06:02	2019-08-13 10:21:25	2008-03-26 16:15:17
27233	firenomics	27	https://github.com/anotherjesse/firenomics	https://api.github.com/repos/anotherjesse/firenomics/subscription	https://github.com/anotherjesse/firenomics.git	Firenomics is a place to find and share awesome extensions. 	Python	982	6	0	\N	11	2008-06-21 01:23:58	2020-01-09 08:53:51	2009-05-17 20:18:03
136085	flashlitebox	27	https://github.com/anotherjesse/flashlitebox	https://api.github.com/repos/anotherjesse/flashlitebox/subscription	https://github.com/anotherjesse/flashlitebox.git	Full screen "lightbox" in flash in under 1KB	ActionScript	89	2	0	\N	8	2009-02-24 03:56:10	2020-01-09 08:53:50	2009-02-24 06:15:12
468049	fluidium	27	https://github.com/anotherjesse/fluidium	https://api.github.com/repos/anotherjesse/fluidium/subscription	https://github.com/anotherjesse/fluidium.git	A Native Mac OS X Browser Platform based on WebKit with a Cocoa plug-in architecture, tab thumbnails, web splitviews, userscripting, userstyles, URL shortcuts, Twitter timelines, Sparkle Update, Growl, JS Dock Badge API, more.	Objective-C	13179	1	0	\N	2	2010-01-11 20:13:15	2020-01-09 08:35:28	2010-01-11 04:44:49
49814	fobliki	27	https://github.com/anotherjesse/fobliki	https://api.github.com/repos/anotherjesse/fobliki/subscription	https://github.com/anotherjesse/fobliki.git	Forum, Blog, Wiki for AppEngine	Python	148	5	0	\N	12	2008-09-06 02:36:29	2020-01-09 11:26:44	2008-09-06 02:43:55
56	fotomatic	27	https://github.com/anotherjesse/fotomatic	https://api.github.com/repos/anotherjesse/fotomatic/subscription	https://github.com/anotherjesse/fotomatic.git	Flash photo widget prototype - hacked at last SHDH of 2007	ActionScript	139	3	0	\N	11	2008-01-15 06:22:24	2021-01-23 07:19:54	2008-03-26 16:09:10
2064323	Carousel	28	https://github.com/roland/Carousel	https://api.github.com/repos/roland/Carousel/subscription	https://github.com/roland/Carousel.git	Monotouch Carousel	\N	1424	1	0	\N	5	2011-07-18 00:34:10	2018-09-02 19:22:53	2011-07-18 00:41:34
13734705	formflow	28	https://github.com/roland/formflow	https://api.github.com/repos/roland/formflow/subscription	https://github.com/roland/formflow.git	FormFlow	JavaScript	1476	1	0	\N	1	2013-10-21 04:36:11	2018-02-18 17:46:54	2013-10-22 03:17:54
3664937	HttpBuildQuery	28	https://github.com/roland/HttpBuildQuery	https://api.github.com/repos/roland/HttpBuildQuery/subscription	https://github.com/roland/HttpBuildQuery.git	Equivalent of http_build_query in PHP	C#	104	2	2	\N	6	2012-03-08 19:11:04	2019-08-09 07:22:50	2017-08-16 18:14:21
48835316	SHFB	28	https://github.com/roland/SHFB	https://api.github.com/repos/roland/SHFB/subscription	https://github.com/roland/SHFB.git	Sandcastle Help File Builder (SHFB).  A standalone GUI, Visual Studio integration package, and MSBuild tasks providing full configuration and extensibility for building help files with the Sandcastle tools.	C#	16584	0	0	\N	1	2015-12-31 03:36:51	2018-02-18 17:47:02	2015-12-29 04:33:09
3986723	ShowTracker	28	https://github.com/roland/ShowTracker	https://api.github.com/repos/roland/ShowTracker/subscription	https://github.com/roland/ShowTracker.git	An Android App to manage your TV Shows	Java	308	1	0	\N	2	2012-04-10 17:25:29	2020-09-22 13:03:08	2012-04-10 17:32:47
43979131	silentauction-php	28	https://github.com/roland/silentauction-php	https://api.github.com/repos/roland/silentauction-php/subscription	https://github.com/roland/silentauction-php.git	\N	PHP	136	0	0	\N	1	2015-10-09 17:40:52	2018-02-18 17:47:10	2015-10-09 18:00:55
3008991	TestServiceStackService	28	https://github.com/roland/TestServiceStackService	https://api.github.com/repos/roland/TestServiceStackService/subscription	https://github.com/roland/TestServiceStackService.git	\N	C#	932	1	0	\N	2	2011-12-18 22:54:39	2018-02-18 17:47:14	2011-12-19 01:11:28
157126519	audio-super-res	29	https://github.com/lukas/audio-super-res	https://api.github.com/repos/lukas/audio-super-res/subscription	https://github.com/lukas/audio-super-res.git	Audio super resolution using neural networks	Python	59514	1	0	\N	0	2018-11-11 20:16:02	2018-11-11 20:27:27	2018-11-11 20:27:26
122422894	basic-yolo-keras	29	https://github.com/lukas/basic-yolo-keras	https://api.github.com/repos/lukas/basic-yolo-keras/subscription	https://github.com/lukas/basic-yolo-keras.git	Easy training on custom dataset. Various backends (MobileNet and SqueezeNet) supported. A YOLO demo to detect raccoon run entirely in brower is accessible at https://git.io/vF7vI (not on Windows).	Jupyter Notebook	53381	0	0	\N	0	2018-02-21 23:52:29	2018-02-21 23:52:31	2018-02-10 17:20:55
142578563	car-project	29	https://github.com/lukas/car-project	https://api.github.com/repos/lukas/car-project/subscription	https://github.com/lukas/car-project.git	\N	\N	0	0	0	\N	0	2018-07-27 10:08:20	2018-07-27 10:08:20	2018-07-27 10:08:20
185886446	catz	29	https://github.com/lukas/catz	https://api.github.com/repos/lukas/catz/subscription	https://github.com/lukas/catz.git	A machine learning contest to predict the behavior of catz	Python	15	2	0	\N	0	2019-05-09 20:40:05	2019-05-12 22:21:29	2019-05-12 22:21:27
144174773	colorizer	29	https://github.com/lukas/colorizer	https://api.github.com/repos/lukas/colorizer/subscription	https://github.com/lukas/colorizer.git	\N	Python	6	17	1	\N	1	2018-08-09 12:57:14	2020-12-16 11:37:24	2019-05-29 23:44:27
68656631	container-demo	29	https://github.com/lukas/container-demo	https://api.github.com/repos/lukas/container-demo/subscription	https://github.com/lukas/container-demo.git	\N	HTML	5	0	0	\N	1	2016-09-19 20:59:38	2018-02-18 18:22:39	2016-09-19 21:01:11
96162235	demo	29	https://github.com/lukas/demo	https://api.github.com/repos/lukas/demo/subscription	https://github.com/lukas/demo.git	ML Demo	Python	496	0	0	\N	1	2017-07-03 22:10:41	2018-02-18 18:22:43	2017-08-23 19:45:34
83268783	facerec	29	https://github.com/lukas/facerec	https://api.github.com/repos/lukas/facerec/subscription	https://github.com/lukas/facerec.git	Face recognition using amazon's Rekognition service	Python	7	14	1	\N	27	2017-02-27 01:41:33	2020-02-29 04:56:10	2017-09-26 21:13:02
121461073	face_classification	29	https://github.com/lukas/face_classification	https://api.github.com/repos/lukas/face_classification/subscription	https://github.com/lukas/face_classification.git	Real-time face detection and emotion/gender classification using fer2013/imdb datasets with a keras CNN model and openCV.	Python	140792	2	0	\N	1	2018-02-14 00:15:15	2020-12-16 11:37:35	2018-02-22 15:56:04
176216422	heater	29	https://github.com/lukas/heater	https://api.github.com/repos/lukas/heater/subscription	https://github.com/lukas/heater.git	\N	Python	4	0	0	\N	1	2019-03-18 03:16:46	2020-12-16 11:37:23	2019-07-03 02:03:36
123208437	hyperband	29	https://github.com/lukas/hyperband	https://api.github.com/repos/lukas/hyperband/subscription	https://github.com/lukas/hyperband.git	Tuning hyperparams fast with Hyperband	Python	379	0	0	\N	0	2018-02-27 21:59:59	2018-02-27 22:00:00	2017-12-09 05:11:46
197223017	keras	29	https://github.com/lukas/keras	https://api.github.com/repos/lukas/keras/subscription	https://github.com/lukas/keras.git	Deep Learning for humans	Python	12924	5	0	\N	3	2019-07-16 12:45:36	2020-12-16 11:37:21	2019-07-16 13:09:20
160370208	keras-audio	29	https://github.com/lukas/keras-audio	https://api.github.com/repos/lukas/keras-audio/subscription	https://github.com/lukas/keras-audio.git	\N	Python	112481	16	1	\N	2	2018-12-04 12:28:55	2020-12-16 11:37:11	2019-12-06 04:54:50
100407582	Keras-FCN-1	29	https://github.com/lukas/Keras-FCN-1	https://api.github.com/repos/lukas/Keras-FCN-1/subscription	https://github.com/lukas/Keras-FCN-1.git	Keras-tensorflow implementation of Fully Convolutional Networks for Semantic Segmentation（Unfinished）	Python	6987	1	0	\N	1	2017-08-15 15:36:32	2018-02-18 18:22:57	2017-09-05 18:48:16
87006564	lassen	29	https://github.com/lukas/lassen	https://api.github.com/repos/lukas/lassen/subscription	https://github.com/lukas/lassen.git	\N	Python	5210	0	0	\N	1	2017-04-02 15:26:47	2018-02-18 18:23:01	2017-06-12 16:47:12
68656770	lukas.github.io	29	https://github.com/lukas/lukas.github.io	https://api.github.com/repos/lukas/lukas.github.io/subscription	https://github.com/lukas/lukas.github.io.git	\N	HTML	11	0	0	\N	1	2016-09-19 21:03:02	2018-02-18 18:23:06	2016-09-19 21:56:06
26488	mailfactory	29	https://github.com/lukas/mailfactory	https://api.github.com/repos/lukas/mailfactory/subscription	https://github.com/lukas/mailfactory.git	Create MIME email messages with multiple body parts and attachments in Ruby	Ruby	108	3	0	\N	3	2008-06-18 16:38:49	2019-08-13 10:27:05	2008-06-18 18:01:32
144771320	Manual	29	https://github.com/lukas/Manual	https://api.github.com/repos/lukas/Manual/subscription	https://github.com/lukas/Manual.git	You were probably looking for our website... this is it. We moved our website here, so you can see the insides of how we work.	\N	519	1	0	\N	0	2018-08-14 17:55:57	2018-08-14 17:55:59	2018-08-14 17:57:01
41762759	ml-class	29	https://github.com/lukas/ml-class	https://api.github.com/repos/lukas/ml-class/subscription	https://github.com/lukas/ml-class.git	Machine learning lessons and teaching projects designed for engineers	Jupyter Notebook	139523	933	4	\N	1633	2015-09-01 17:52:50	2021-01-28 15:44:25	2020-12-03 11:05:19
159767981	models	29	https://github.com/lukas/models	https://api.github.com/repos/lukas/models/subscription	https://github.com/lukas/models.git	Models and examples built with TensorFlow	Python	576393	0	0	\N	0	2018-11-30 02:20:52	2020-01-09 05:20:13	2018-11-30 02:48:25
273090052	pachyderm	29	https://github.com/lukas/pachyderm	https://api.github.com/repos/lukas/pachyderm/subscription	https://github.com/lukas/pachyderm.git	Reproducible Data Science at Scale!	\N	238863	0	0	\N	1	2020-06-17 19:24:27	2020-12-16 11:37:08	2020-06-17 18:12:52
158044753	pytorch-yolo2	29	https://github.com/lukas/pytorch-yolo2	https://api.github.com/repos/lukas/pytorch-yolo2/subscription	https://github.com/lukas/pytorch-yolo2.git	Convert https://pjreddie.com/darknet/yolo/ into pytorch	Python	1228	1	0	\N	2	2018-11-18 00:57:54	2020-12-16 11:37:29	2018-11-18 01:00:15
124601822	react-vis	29	https://github.com/lukas/react-vis	https://api.github.com/repos/lukas/react-vis/subscription	https://github.com/lukas/react-vis.git	Data-Visualization oriented components	JavaScript	6832	1	0	\N	0	2018-03-09 19:53:55	2018-03-09 19:53:58	2018-03-09 19:54:31
188740973	rl-experiments	29	https://github.com/lukas/rl-experiments	https://api.github.com/repos/lukas/rl-experiments/subscription	https://github.com/lukas/rl-experiments.git	some reinforcement learning experiments	Python	5	0	0	\N	1	2019-05-26 20:19:35	2019-07-10 01:31:53	2019-05-26 22:19:46
65312129	robot	29	https://github.com/lukas/robot	https://api.github.com/repos/lukas/robot/subscription	https://github.com/lukas/robot.git	Simple library for controlling a raspberry pi based robot	Python	64	52	5	\N	157	2016-08-09 13:50:21	2020-12-14 00:03:59	2017-10-19 20:18:28
120672537	smile	29	https://github.com/lukas/smile	https://api.github.com/repos/lukas/smile/subscription	https://github.com/lukas/smile.git	Smile Classifier	Python	34555	11	0	\N	3	2018-02-07 19:14:46	2018-04-24 11:52:37	2018-02-07 23:32:38
199306055	sonnet	29	https://github.com/lukas/sonnet	https://api.github.com/repos/lukas/sonnet/subscription	https://github.com/lukas/sonnet.git	TensorFlow-based neural network library	Python	15075	2	0	\N	3	2019-07-28 12:41:27	2020-12-16 11:37:18	2019-07-28 12:51:32
202820107	test-vega	29	https://github.com/lukas/test-vega	https://api.github.com/repos/lukas/test-vega/subscription	https://github.com/lukas/test-vega.git	\N	Jupyter Notebook	11	0	0	\N	1	2019-08-16 22:18:30	2020-12-16 11:37:20	2019-08-16 22:19:49
125466322	vision-project	29	https://github.com/lukas/vision-project	https://api.github.com/repos/lukas/vision-project/subscription	https://github.com/lukas/vision-project.git	\N	Python	261	78	0	\N	17	2018-03-16 02:07:20	2020-12-16 11:37:09	2020-02-06 02:58:19
125738483	yelp-project	29	https://github.com/lukas/yelp-project	https://api.github.com/repos/lukas/yelp-project/subscription	https://github.com/lukas/yelp-project.git	\N	Python	7	4	0	\N	0	2018-03-18 12:22:06	2018-03-22 15:38:12	2018-03-22 15:38:11
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, login, url, avatar_url, gists_url, events_url, name, email, hireable, company, location, blog, bio, public_repos, public_gists, followers, following, created_at, updated_at) FROM stdin;
1	mojombo	https://api.github.com/users/mojombo	https://avatars.githubusercontent.com/u/1?v=4	https://api.github.com/users/mojombo/gists{/gist_id}	https://api.github.com/users/mojombo/events{/privacy}	Tom Preston-Werner	tom@mojombo.com	\N	@chatterbugapp, @redwoodjs, @preston-werner-ventures 	San Francisco	http://tom.preston-werner.com	\N	62	62	22323	11	2007-10-20 03:24:19	2021-01-12 12:53:34
2	defunkt	https://api.github.com/users/defunkt	https://avatars.githubusercontent.com/u/2?v=4	https://api.github.com/users/defunkt/gists{/gist_id}	https://api.github.com/users/defunkt/events{/privacy}	Chris Wanstrath	\N	\N	\N	\N	http://chriswanstrath.com/	🍔	107	273	21128	210	2007-10-20 03:24:19	2019-11-01 18:56:00
3	pjhyett	https://api.github.com/users/pjhyett	https://avatars.githubusercontent.com/u/3?v=4	https://api.github.com/users/pjhyett/gists{/gist_id}	https://api.github.com/users/pjhyett/events{/privacy}	PJ Hyett	pj@hyett.com	\N	GitHub, Inc.	San Francisco	https://hyett.com	\N	8	21	8211	30	2008-01-07 15:54:22	2020-12-08 16:24:23
4	wycats	https://api.github.com/users/wycats	https://avatars.githubusercontent.com/u/4?v=4	https://api.github.com/users/wycats/gists{/gist_id}	https://api.github.com/users/wycats/events{/privacy}	Yehuda Katz	wycats@gmail.com	\N	Tilde, Inc.	San Francisco	http://yehudakatz.com	\N	232	753	9739	4	2008-01-12 03:38:33	2021-01-28 10:11:55
5	ezmobius	https://api.github.com/users/ezmobius	https://avatars.githubusercontent.com/u/5?v=4	https://api.github.com/users/ezmobius/gists{/gist_id}	https://api.github.com/users/ezmobius/events{/privacy}	Ezra Zygmuntowicz	\N	\N	Stuffstr PBC	In the NW	http://stuffstr.com	\N	22	106	509	13	2008-01-12 05:51:46	2021-01-22 12:26:10
6	ivey	https://api.github.com/users/ivey	https://avatars.githubusercontent.com/u/6?v=4	https://api.github.com/users/ivey/gists{/gist_id}	https://api.github.com/users/ivey/events{/privacy}	Michael D. Ivey	ivey@gweezlebur.com	\N	@RiotGames 	Tuscumbia, AL	http://gweezlebur.com	\N	88	79	117	2	2008-01-12 13:15:00	2021-01-22 12:26:10
7	evanphx	https://api.github.com/users/evanphx	https://avatars.githubusercontent.com/u/7?v=4	https://api.github.com/users/evanphx/gists{/gist_id}	https://api.github.com/users/evanphx/events{/privacy}	Evan Phoenix	evan@phx.io	\N	@hashicorp 	Los Angeles, CA	http://blog.fallingsnow.net	\N	155	441	1366	6	2008-01-12 14:46:24	2021-01-27 22:10:02
17	vanpelt	https://api.github.com/users/vanpelt	https://avatars.githubusercontent.com/u/17?v=4	https://api.github.com/users/vanpelt/gists{/gist_id}	https://api.github.com/users/vanpelt/events{/privacy}	Chris Van Pelt	vanpelt@gmail.com	\N	crowdflower.com	San Francisco	wandb.com	\N	56	49	145	15	2008-01-13 03:57:18	2021-01-19 17:45:52
18	wayneeseguin	https://api.github.com/users/wayneeseguin	https://avatars.githubusercontent.com/u/18?v=4	https://api.github.com/users/wayneeseguin/gists{/gist_id}	https://api.github.com/users/wayneeseguin/events{/privacy}	Wayne E. Seguin	wayneeseguin@gmail.com	\N	http://starkandwayne.com/	Buffalo, NY		\N	97	95	699	17	2008-01-13 04:02:21	2021-01-22 12:26:10
19	brynary	https://api.github.com/users/brynary	https://avatars.githubusercontent.com/u/19?v=4	https://api.github.com/users/brynary/gists{/gist_id}	https://api.github.com/users/brynary/events{/privacy}	Bryan Helmkamp	\N	\N	Code Climate	New York City	http://codeclimate.com	Co-founder and CEO, Code Climate	165	68	633	27	2008-01-13 08:19:47	2021-01-08 19:36:03
20	kevinclark	https://api.github.com/users/kevinclark	https://avatars.githubusercontent.com/u/20?v=4	https://api.github.com/users/kevinclark/gists{/gist_id}	https://api.github.com/users/kevinclark/events{/privacy}	Kevin Clark	kevin.clark@gmail.com	\N	Cue	\N	http://glu.ttono.us	\N	35	30	91	4	2008-01-13 16:33:26	2021-01-13 14:56:00
21	technoweenie	https://api.github.com/users/technoweenie	https://avatars.githubusercontent.com/u/21?v=4	https://api.github.com/users/technoweenie/gists{/gist_id}	https://api.github.com/users/technoweenie/events{/privacy}	risk danger olson	technoweenie@hey.com	\N	\N	Colorado		:metal:	176	106	2544	17	2008-01-14 02:33:35	2021-01-12 10:49:43
22	macournoyer	https://api.github.com/users/macournoyer	https://avatars.githubusercontent.com/u/22?v=4	https://api.github.com/users/macournoyer/gists{/gist_id}	https://api.github.com/users/macournoyer/events{/privacy}	Marc-André Cournoyer	macournoyer@gmail.com	\N	@Shopify 	Montreal, QC, Canada	http://macournoyer.com	I enjoy walks in the park, VMs, neural nets, servers, anything with a loop.	59	55	1104	51	2008-01-14 08:49:35	2021-01-27 11:15:00
23	takeo	https://api.github.com/users/takeo	https://avatars.githubusercontent.com/u/23?v=4	https://api.github.com/users/takeo/gists{/gist_id}	https://api.github.com/users/takeo/events{/privacy}	Toby Sterrett	tobysterrett@gmail.com	\N	@zendesk 	Portland, OR	https://zendesk.com/	\N	19	11	81	11	2008-01-14 09:25:49	2021-01-21 21:52:12
25	caged	https://api.github.com/users/caged	https://avatars.githubusercontent.com/u/25?v=4	https://api.github.com/users/caged/gists{/gist_id}	https://api.github.com/users/caged/events{/privacy}	Justin Palmer	encytemedia@gmail.com	\N	labratrevenge	Portland, OR	http://labratrevenge.com	A series of hacks. Previously @github. \r\n	143	99	2177	43	2008-01-15 02:47:24	2021-01-23 15:07:16
26	topfunky	https://api.github.com/users/topfunky	https://avatars.githubusercontent.com/u/26?v=4	https://api.github.com/users/topfunky/gists{/gist_id}	https://api.github.com/users/topfunky/events{/privacy}	Geoffrey Grosenbach	\N	\N	@hashicorp 	Seattle, USA	https://topfunky.com	Entrepreneur, developer, designer, teacher, athlete. Currently: Director of Education Engineering at @hashicorp. Previously: PeepCode, Pluralsight	72	44	1235	225	2008-01-15 03:40:05	2021-01-27 16:30:40
27	anotherjesse	https://api.github.com/users/anotherjesse	https://avatars.githubusercontent.com/u/27?v=4	https://api.github.com/users/anotherjesse/gists{/gist_id}	https://api.github.com/users/anotherjesse/events{/privacy}	Jesse Andrews	anotherjesse@gmail.com	\N	Planet Labs	San Francisco, CA	http://overstimulate.com	\N	109	60	159	35	2008-01-15 05:49:30	2021-01-16 21:23:37
28	roland	https://api.github.com/users/roland	https://avatars.githubusercontent.com/u/28?v=4	https://api.github.com/users/roland/gists{/gist_id}	https://api.github.com/users/roland/events{/privacy}	Roland	\N	\N	\N	Tirana	http://rolandmai.com/	\N	7	0	18	1	2008-01-15 06:12:51	2021-01-11 02:24:50
29	lukas	https://api.github.com/users/lukas	https://avatars.githubusercontent.com/u/29?v=4	https://api.github.com/users/lukas/gists{/gist_id}	https://api.github.com/users/lukas/events{/privacy}	Lukas Biewald	\N	\N	Weights and Biases	San Francisco	lukasbiewald.com	Founder of wandb.com	30	12	440	16	2008-01-15 10:50:02	2021-01-20 20:49:50
30	fanvsfan	https://api.github.com/users/fanvsfan	https://avatars.githubusercontent.com/u/30?v=4	https://api.github.com/users/fanvsfan/gists{/gist_id}	https://api.github.com/users/fanvsfan/events{/privacy}	\N	\N	\N	\N	\N		\N	0	0	22	0	2008-01-15 12:15:23	2020-11-06 01:42:37
\.


--
-- Name: migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.migrations_id_seq', 2, true);


--
-- Name: migrations PK_8c82d7f526340ab734260ea46be; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.migrations
    ADD CONSTRAINT "PK_8c82d7f526340ab734260ea46be" PRIMARY KEY (id);


--
-- Name: users PK_a3ffb1c0c8416b9fc6f907b7433; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT "PK_a3ffb1c0c8416b9fc6f907b7433" PRIMARY KEY (id);


--
-- Name: repositories PK_ef0c358c04b4f4d29b8ca68ddff; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.repositories
    ADD CONSTRAINT "PK_ef0c358c04b4f4d29b8ca68ddff" PRIMARY KEY (id);


--
-- Name: repositories UserRepository; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.repositories
    ADD CONSTRAINT "UserRepository" FOREIGN KEY (user_id) REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

--
-- Database "postgres" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 12.2 (Debian 12.2-2.pgdg100+1)
-- Dumped by pg_dump version 12.2 (Debian 12.2-2.pgdg100+1)

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

CREATE DATABASE postgres WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'en_US.utf8' LC_CTYPE = 'en_US.utf8';


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
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database cluster dump complete
--

