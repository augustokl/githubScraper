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
    description character varying,
    language character varying,
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

COPY public.repositories (id, name, user_id, html_url, description, language, forks, open_issues, stargazers, watchers, created_at, updated_at, pushed_at) FROM stdin;
26899533	30daysoflaptops.github.io	1	https://github.com/mojombo/30daysoflaptops.github.io	\N	CSS	2	0	\N	7	2014-11-20 04:42:06	2021-01-13 16:44:03	2014-11-20 04:42:47
17358646	asteroids	1	https://github.com/mojombo/asteroids	Destroy your Atom editor, Asteroids style!	JavaScript	13	3	\N	94	2014-03-03 04:40:00	2021-01-30 03:08:52	2015-03-10 15:18:16
29941343	benbalter.github.com	1	https://github.com/mojombo/benbalter.github.com	The personal website of Ben Balter. Built using Jekyll and GitHub Pages. See humans.txt for more infos.	CSS	6	0	\N	5	2015-01-27 21:54:05	2021-01-13 16:44:45	2015-01-27 21:54:33
330651	bert	1	https://github.com/mojombo/bert	BERT (Binary ERlang Term) serialization library for Ruby.	Ruby	68	11	\N	197	2009-10-08 03:06:25	2021-01-13 16:27:11	2016-04-18 12:19:42
444244	bert.erl	1	https://github.com/mojombo/bert.erl	Erlang BERT encoder/decoder	Erlang	51	6	\N	94	2009-12-21 00:10:34	2021-01-26 13:26:40	2010-01-07 22:12:10
204457	bertrpc	1	https://github.com/mojombo/bertrpc	BERTRPC is a Ruby BERT-RPC client library.	Ruby	30	0	\N	156	2009-05-18 23:44:01	2021-01-13 16:26:19	2014-08-11 17:59:15
6664329	bower	1	https://github.com/mojombo/bower	A package manager for the web	JavaScript	3	0	\N	4	2012-11-13 00:32:34	2021-01-13 16:36:05	2012-11-13 00:34:11
144	chronic	1	https://github.com/mojombo/chronic	Chronic is a pure Ruby natural language date parser.	Ruby	454	147	\N	3087	2008-01-29 04:48:49	2021-01-29 18:32:37	2020-10-15 07:38:07
128373	clippy	1	https://github.com/mojombo/clippy	Clippy is a very simple Flash widget that makes it possible to place arbitrary text onto the client's clipboard.	\N	180	25	\N	954	2009-02-13 16:59:10	2021-01-13 16:26:05	2011-10-04 18:29:49
54515	conceptual_algorithms	1	https://github.com/mojombo/conceptual_algorithms	\N	\N	2	0	\N	4	2008-09-20 01:54:25	2021-01-13 16:25:38	2008-09-20 01:57:28
143281	cubesixel	1	https://github.com/mojombo/cubesixel	A pixel font (native size 7x7) I made in a different life	\N	3	1	\N	22	2009-03-04 21:00:25	2021-01-13 16:26:07	2014-02-18 22:10:05
156953038	docz-website	1	https://github.com/mojombo/docz-website	\N	TypeScript	0	0	\N	1	2018-11-10 04:07:54	2021-01-13 16:57:05	2018-11-10 04:28:05
19398	egitd	1	https://github.com/mojombo/egitd	The Erlang git-daemon	Erlang	18	1	\N	108	2008-05-24 17:36:13	2021-01-13 16:25:26	2014-02-18 22:01:34
135769	endo	1	https://github.com/mojombo/endo	Test repo for talk.	\N	2	0	\N	3	2009-02-23 19:48:51	2021-01-13 16:26:06	2009-02-23 20:38:37
30322	erlang_pipe	1	https://github.com/mojombo/erlang_pipe	A pipe implementation in pure Erlang	Erlang	3	0	\N	19	2008-07-01 13:40:14	2021-01-13 16:25:34	2008-08-03 05:25:18
3010	erlectricity	1	https://github.com/mojombo/erlectricity	Erlectricity exposes Ruby to Erlang and vice versa.	Ruby	46	4	\N	339	2008-03-07 22:32:13	2021-01-21 11:33:47	2009-10-28 17:40:13
189157	erlectricity-presentation	1	https://github.com/mojombo/erlectricity-presentation	\N	\N	4	0	\N	4	2009-04-30 04:05:01	2021-01-13 16:26:18	2009-04-30 04:05:54
1602	erlenmeyer	1	https://github.com/mojombo/erlenmeyer	A binding between erlang and mzscheme.	Scheme	0	0	\N	7	2008-02-28 00:17:49	2021-01-13 16:25:22	2008-03-26 15:36:22
204419	ernie	1	https://github.com/mojombo/ernie	Ernie is an Erlang/Ruby BERT-RPC Server.	Erlang	55	9	\N	447	2009-05-18 22:51:40	2021-01-17 00:28:56	2011-12-07 06:32:23
326535	eventmachine	1	https://github.com/mojombo/eventmachine	EventMachine: fast, simple event-processing library for Ruby programs	Ruby	4	0	\N	10	2009-10-04 17:24:34	2021-01-13 16:27:11	2009-10-04 17:35:25
128616	fakegem	1	https://github.com/mojombo/fakegem	This is a fake gem so I can test GitHub's gem building when I need to	Ruby	1	0	\N	3	2009-02-13 23:48:53	2021-01-13 16:26:05	2009-02-14 00:02:01
1015	fixture-scenarios	1	https://github.com/mojombo/fixture-scenarios	This plugin allows you to create 'scenarios' which are collections of fixtures and ruby files that represent a context against which you can run tests.	Ruby	14	1	\N	17	2008-02-23 01:25:57	2021-01-13 16:25:22	2017-02-16 05:55:22
70276	git	1	https://github.com/mojombo/git	GitHub mirror of the publicly available git repo, updated hourly.  It's here so we can use the collaboration tools of GitHub. Updates ONLY from git public repo.  If you want changes pulled, contact the git team, not me.	C	5	0	\N	10	2008-10-31 20:57:51	2021-01-13 16:25:51	2008-10-31 12:01:16
53286	git-bzr	1	https://github.com/mojombo/git-bzr	A bidirectional Git - Bazaar gateway	\N	1	0	\N	7	2008-09-16 17:04:23	2021-01-13 16:25:38	2008-08-17 18:28:29
173084	github-flavored-markdown	1	https://github.com/mojombo/github-flavored-markdown	GitHub's Flavor of Markdown	\N	91	37	\N	183	2009-04-10 18:57:08	2021-01-30 14:49:09	2009-04-10 19:59:38
58173	github-gem	1	https://github.com/mojombo/github-gem	The official `github` command line helper for simplifying your GitHub experience.	Ruby	0	0	\N	5	2008-09-30 19:29:14	2021-01-13 16:25:38	2008-09-30 19:30:48
61	glowstick	1	https://github.com/mojombo/glowstick	A realtime, OpenGL graphing library for Ruby	Ruby	10	1	\N	28	2008-01-16 22:40:56	2021-01-16 22:02:38	2008-03-26 16:09:11
28	god	1	https://github.com/mojombo/god	Ruby process monitor	Ruby	489	115	\N	2157	2008-01-13 03:16:23	2021-01-29 18:32:35	2018-11-08 11:14:11
818161	gollum-demo	1	https://github.com/mojombo/gollum-demo	Gollum test repo	Perl	210	3	\N	74	2010-08-04 20:49:22	2021-01-13 16:29:31	2017-10-08 21:11:59
1	grit	1	https://github.com/mojombo/grit	**Grit is no longer maintained. Check out libgit2/rugged.** Grit gives you object oriented read/write access to Git repositories via Ruby.	Ruby	531	26	\N	1904	2007-10-29 12:37:16	2021-01-25 15:00:32	2020-10-01 00:55:32
1861402	ace	2	https://github.com/defunkt/ace	Ajax.org Cloud9 Editor	JavaScript	6	0	\N	16	2011-06-07 15:41:40	2021-01-13 16:31:48	2011-11-16 16:37:42
3594	acts_as_textiled	2	https://github.com/defunkt/acts_as_textiled	Makes your models act as textiled.	Ruby	33	4	\N	114	2008-03-12 03:20:18	2021-01-13 16:25:23	2011-07-21 18:38:47
36	ambition	2	https://github.com/defunkt/ambition	include Enumerable — Unmaintained	Ruby	17	1	\N	153	2008-01-14 04:28:56	2021-01-20 09:30:29	2015-04-23 21:18:24
230	ambitious_activeldap	2	https://github.com/defunkt/ambitious_activeldap	Ambition adapter for ActiveLdap	Ruby	3	0	\N	7	2008-01-30 17:20:08	2021-01-13 16:25:21	2008-03-26 16:10:57
12641	ambitious_activerecord	2	https://github.com/defunkt/ambitious_activerecord	Unmaintained Ambitious ActiveRecord adapter, for Ambition.	Ruby	3	1	\N	13	2008-04-26 06:10:20	2021-01-13 16:25:26	2008-04-26 07:14:04
4180	barefootexamples	2	https://github.com/defunkt/barefootexamples	\N	Ruby	4	0	\N	6	2008-03-17 03:29:50	2021-01-13 16:25:23	2008-03-26 17:57:13
15939	body_matcher	2	https://github.com/defunkt/body_matcher	Simplify your view testing. Forget assert_select.	Ruby	2	0	\N	9	2008-05-11 01:54:44	2021-01-13 16:25:26	2008-05-11 01:54:46
288271	burn	2	https://github.com/defunkt/burn	Sinatra => Campfire	\N	3	0	\N	6	2009-08-25 22:31:54	2021-01-13 16:26:56	2009-08-25 23:13:06
93	cache_fu	2	https://github.com/defunkt/cache_fu	Ghost from Christmas past. Unmaintained.	Ruby	72	6	\N	252	2008-01-22 22:28:10	2021-01-13 16:25:20	2009-10-03 22:54:43
3591	cheat	2	https://github.com/defunkt/cheat	Cheating is fun!	Ruby	41	3	\N	239	2008-03-12 03:09:09	2021-01-13 16:25:23	2015-11-17 17:31:56
45193	cheat.el	2	https://github.com/defunkt/cheat.el	Cheat Emacs mode	Emacs Lisp	4	0	\N	14	2008-08-23 03:01:37	2021-01-13 16:25:36	2008-12-03 21:55:16
12527	choice	2	https://github.com/defunkt/choice	Choice is a gem for defining and parsing command line options with a friendly DSL.	Ruby	22	1	\N	174	2008-04-25 15:30:30	2021-01-13 16:25:26	2016-12-14 03:29:58
270226	cijoe	2	https://github.com/defunkt/cijoe	CI Joe is a fun Continuous Integration server. Unmaintained.	Ruby	134	18	\N	1055	2009-08-05 21:20:39	2021-01-13 16:26:52	2011-10-01 19:56:55
550681	coffee-mode	2	https://github.com/defunkt/coffee-mode	Emacs Major Mode for CoffeeScript	Emacs Lisp	156	15	\N	573	2010-03-07 05:30:40	2021-01-13 16:28:24	2020-03-15 08:33:46
388149	colored	2	https://github.com/defunkt/colored	Colors in your terminal. Unmaintained.	Ruby	42	6	\N	264	2009-11-28 04:16:20	2021-01-23 14:13:19	2020-01-21 06:10:01
12220	currency_converter	2	https://github.com/defunkt/currency_converter	\N	Objective-C	4	0	\N	8	2008-04-24 06:34:31	2021-01-13 16:25:26	2008-04-24 06:36:14
18570642	d3	2	https://github.com/defunkt/d3	A JavaScript visualization library for HTML and SVG.	JavaScript	1	0	\N	4	2014-04-08 15:45:26	2021-01-13 16:41:36	2014-04-08 15:46:26
91988	defunkt.github.com	2	https://github.com/defunkt/defunkt.github.com	My GitHub Page	\N	55	4	\N	74	2008-12-17 05:53:14	2021-01-13 16:25:53	2020-12-17 07:53:01
628288	djangode	2	https://github.com/defunkt/djangode	Utilities functions for node.js that borrow some useful concepts from Django	JavaScript	3	0	\N	9	2010-04-25 13:41:30	2021-01-13 16:28:52	2010-04-25 13:42:56
2448060	dodgeball.github.com	2	https://github.com/defunkt/dodgeball.github.com	yes	Ruby	6	0	\N	10	2011-09-24 00:01:09	2021-01-13 16:32:39	2011-09-24 00:01:22
5171653	dotenv	2	https://github.com/defunkt/dotenv	Loads environment variables from `.env`. 	Ruby	3	0	\N	10	2012-07-24 18:43:19	2021-01-13 16:34:59	2012-07-24 01:30:34
1336779	dotjs	2	https://github.com/defunkt/dotjs	~/.js	Ruby	373	25	\N	3180	2011-02-07 05:01:33	2021-01-18 21:37:29	2018-07-26 13:09:13
69384	electron-wordwrap	2	https://github.com/defunkt/electron-wordwrap	\N	\N	4	0	\N	5	2008-10-29 18:03:17	2021-01-13 16:25:51	2008-10-29 18:28:21
43903	emacs	2	https://github.com/defunkt/emacs	My Emacs config	Emacs Lisp	44	0	\N	186	2008-08-19 07:50:19	2021-01-13 16:25:36	2011-10-25 19:53:46
2998404	email_reply_parser	2	https://github.com/defunkt/email_reply_parser	\N	Ruby	5	0	\N	7	2011-12-16 21:13:05	2021-01-13 16:33:17	2011-12-16 21:13:24
1167457	evilbot	2	https://github.com/defunkt/evilbot	an evil bot that's definitely not for convore	CoffeeScript	15	0	\N	48	2010-12-14 06:09:11	2021-01-13 16:30:19	2011-02-16 05:34:00
35	exception_logger	2	https://github.com/defunkt/exception_logger	Unmaintained. Sorry.	Ruby	86	2	\N	233	2008-01-14 01:32:19	2021-01-23 07:19:38	2016-01-01 02:57:28
425	facebox	2	https://github.com/defunkt/facebox	Facebook-style lightbox, built in jQuery	JavaScript	420	28	\N	1959	2008-02-11 20:49:27	2021-01-27 05:25:13	2013-07-15 16:55:04
5211331	faceup	2	https://github.com/defunkt/faceup	More than just mustaches.	JavaScript	6	1	\N	10	2012-07-27 23:11:56	2021-01-13 16:35:06	2012-07-27 23:40:26
3596	fixture_scenarios_builder	2	https://github.com/defunkt/fixture_scenarios_builder	Build your fixtures in Ruby.	Ruby	6	0	\N	14	2008-03-12 03:24:02	2021-01-13 16:25:23	2008-11-12 20:58:39
4061	auto_migrations	3	https://github.com/pjhyett/auto_migrations	Rails plugin for automating migrations	Ruby	41	1	\N	143	2008-03-15 21:44:24	2020-08-10 00:24:58	2013-04-25 17:41:57
112071	blackjax	3	https://github.com/pjhyett/blackjax	buzzword-powered blackjack game	Ruby	10	0	\N	9	2009-01-21 18:45:27	2021-01-13 16:26:04	2009-01-21 18:50:19
592	errcount	3	https://github.com/pjhyett/errcount	simple mongrel handler for a sweet hit counter	Ruby	8	2	\N	8	2008-02-15 19:07:30	2019-08-13 10:21:25	2008-03-26 16:15:12
5281804	git-server	3	https://github.com/pjhyett/git-server	pure ruby version of git daemon server functions	Ruby	2	0	\N	1	2012-08-03 02:54:17	2018-03-13 05:07:25	2008-08-17 18:26:49
13163	github-services	3	https://github.com/pjhyett/github-services	Moved to http://github.com/github/github-services	Ruby	53	0	\N	407	2008-04-28 20:41:21	2020-08-01 12:35:53	2018-08-30 08:54:05
561202	ThoughtStream	3	https://github.com/pjhyett/ThoughtStream	rails-powered tumblelog i wrote in 2007	Ruby	7	0	\N	6	2010-03-13 19:17:26	2021-01-13 16:28:26	2010-03-13 19:18:36
590	vjot	3	https://github.com/pjhyett/vjot	The greatest jotting web app of all time	JavaScript	11	2	\N	7	2008-02-15 18:55:07	2019-08-13 10:21:25	2008-03-26 16:15:11
13727	zoned	3	https://github.com/pjhyett/zoned	Rails plugin for dead-simple timezone support	Ruby	5	0	\N	10	2008-05-01 03:11:57	2021-01-13 16:25:26	2008-05-01 03:13:26
1119731	abbot-from-scratch	4	https://github.com/wycats/abbot-from-scratch	\N	Ruby	4	1	\N	8	2010-11-28 15:49:44	2018-07-28 22:18:28	2012-01-27 17:53:46
911701	abbot-ng	4	https://github.com/wycats/abbot-ng	a place to store my in-progress work on the redone SproutCore build tools	Ruby	2	0	\N	2	2010-09-15 01:25:23	2019-03-25 15:07:09	2010-09-15 01:25:39
3092609	activerecord-import	4	https://github.com/wycats/activerecord-import	Extraction of the ActiveRecord::Base#import functionality from ar-extensions for Rails 3 and beyon	Ruby	1	0	\N	2	2012-01-03 05:26:10	2018-07-28 22:18:27	2012-01-03 06:42:17
591370	active_params	4	https://github.com/wycats/active_params	\N	\N	1	0	\N	7	2010-04-02 04:32:46	2021-01-13 16:28:38	2010-04-02 04:43:48
18471501	agendas	4	https://github.com/wycats/agendas	TC39 meeting agendas	\N	1	0	\N	0	2014-04-05 13:57:08	2018-03-13 05:07:04	2014-04-05 13:57:54
577073	alexandria	4	https://github.com/wycats/alexandria	Ruby bindings to the Google Data API	Ruby	2	0	\N	10	2010-03-24 04:07:30	2021-01-13 16:28:36	2010-04-11 17:03:01
14129810	allocation_counter	4	https://github.com/wycats/allocation_counter	\N	Ruby	2	0	\N	7	2013-11-05 00:18:29	2018-03-13 05:07:00	2013-11-13 19:57:52
137634194	argon	4	https://github.com/wycats/argon	\N	Rust	1	5	\N	12	2018-06-17 03:33:41	2020-06-05 22:28:48	2018-08-24 02:15:31
138977917	argon-example	4	https://github.com/wycats/argon-example	\N	\N	0	0	\N	1	2018-06-28 03:48:38	2018-06-29 04:58:30	2018-06-28 03:50:23
578427	artifice	4	https://github.com/wycats/artifice	Replaces Net::HTTP with a subclass that routes all requests to a Rack application	Ruby	15	12	\N	215	2010-03-24 22:36:42	2021-01-13 16:28:37	2020-02-29 05:34:55
842499	asdf	4	https://github.com/wycats/asdf	Make the current directory available on port 9292	Ruby	5	3	\N	33	2010-08-16 21:42:23	2020-04-14 23:42:38	2010-08-16 21:43:14
53125	at-media	4	https://github.com/wycats/at-media	The code from my @media talk	\N	1	0	\N	3	2008-09-16 07:56:47	2019-08-13 10:35:17	2008-09-16 08:00:31
43278408	atom-pain-split	4	https://github.com/wycats/atom-pain-split	Adds additional pane-splitting commands to your favorite editor, provided your favorite editor is Atom.	CoffeeScript	1	0	\N	0	2015-09-28 00:42:07	2018-03-13 05:06:51	2015-05-18 19:59:11
86851893	bench-backburner	4	https://github.com/wycats/bench-backburner	Benchmark backburner	TypeScript	0	0	\N	0	2017-03-31 16:08:00	2018-03-13 05:06:49	2017-03-23 15:50:44
14327	benchwarmer	4	https://github.com/wycats/benchwarmer	Prettier Benchmarking for Ruby	Ruby	5	0	\N	31	2008-05-03 18:22:10	2019-08-13 10:23:59	2008-05-06 04:11:23
191712	blue-ridge	4	https://github.com/wycats/blue-ridge	JavaScript BDD Rails Plugin (using Screw.Unit &amp; env.js)	Ruby	1	0	\N	21	2009-05-03 18:39:35	2019-08-13 11:23:29	2009-05-04 09:02:32
13535854	bootstrap-nitrous	4	https://github.com/wycats/bootstrap-nitrous	\N	Ruby	1	0	\N	2	2013-10-13 04:56:38	2018-03-13 05:06:43	2013-12-22 00:11:52
49158298	broccoli-concat	4	https://github.com/wycats/broccoli-concat	Concatenate broccoli trees	JavaScript	1	0	\N	0	2016-01-06 18:01:05	2018-03-13 05:06:41	2015-12-22 00:59:43
196286715	broccoli-typescript-compiler	4	https://github.com/wycats/broccoli-typescript-compiler	\N	TypeScript	0	0	\N	0	2019-07-10 20:16:12	2019-07-10 20:17:05	2019-07-10 20:23:57
244703	bundler	4	https://github.com/wycats/bundler	\N	Ruby	31	81	\N	412	2009-07-06 19:08:44	2021-01-28 15:58:35	2010-02-03 21:03:34
1912104	cafe	4	https://github.com/wycats/cafe	Brewing up some JavaScript.	JavaScript	1	0	\N	3	2011-06-17 13:38:59	2019-08-13 11:46:44	2011-03-29 23:54:15
21256790	cargo	4	https://github.com/wycats/cargo	Cargo Experiments	Rust	1	0	\N	1	2014-06-26 19:18:01	2018-08-04 13:52:52	2014-08-15 19:18:22
21112934	cargo-website	4	https://github.com/wycats/cargo-website	\N	CSS	18	4	\N	5	2014-06-23 00:34:27	2020-10-01 03:10:31	2020-10-01 03:14:02
773625	chainable_compare	4	https://github.com/wycats/chainable_compare	\N	Ruby	2	0	\N	11	2010-07-13 21:21:55	2019-08-13 11:34:58	2010-07-13 22:52:04
140189962	codespan	4	https://github.com/wycats/codespan	Utilities for dealing with source code locations and pretty diagnostic formatting	Rust	0	0	\N	1	2018-07-08 14:51:21	2018-08-04 13:52:45	2018-07-26 19:09:31
21112162	color-rs	4	https://github.com/wycats/color-rs	A library that provides types and conversions for working with various color formats.	Rust	1	0	\N	0	2014-06-22 23:56:31	2018-03-13 05:06:31	2014-06-23 23:51:28
2092604	Command-T	4	https://github.com/wycats/Command-T	Mirror of the official Command-T repository at git.wincent.com	Ruby	0	0	\N	1	2011-07-23 07:02:42	2018-03-13 05:05:21	2011-07-23 07:03:57
231467913	core-data	4	https://github.com/wycats/core-data	Very experimental data layer	TypeScript	0	3	\N	3	2020-01-02 19:14:11	2020-08-20 12:33:11	2021-01-21 10:15:22
167740103	core-storage	4	https://github.com/wycats/core-storage	\N	TypeScript	0	0	\N	4	2019-01-26 19:19:30	2019-01-31 15:13:18	2019-01-31 15:13:16
27060736	crates.io	4	https://github.com/wycats/crates.io	Source code for crates.io	Rust	1	0	\N	0	2014-11-24 02:33:45	2018-03-13 05:05:19	2014-11-24 02:34:33
5282	acl_system2	5	https://github.com/ezmobius/acl_system2	An access control plugin for Rails	Ruby	15	1	\N	57	2008-03-25 16:00:13	2020-07-01 17:11:19	2008-10-13 18:03:58
131	bmhsearch	5	https://github.com/ezmobius/bmhsearch	Fast string searcher, useful for multi-part post parsing	C	2	1	\N	8	2008-01-28 00:22:50	2020-11-08 04:44:06	2008-03-26 16:09:49
118801	chef-101	5	https://github.com/ezmobius/chef-101	A sample chef recipe repo for learning chef-solo	Ruby	8	0	\N	61	2009-01-31 15:28:08	2019-08-13 10:57:29	2009-01-31 16:49:23
158501	chef-deploy	5	https://github.com/ezmobius/chef-deploy	Chef Resources and Providers for deploying ruby web apps without capistrano	Ruby	31	6	\N	297	2009-03-24 18:22:28	2019-08-13 11:11:59	2011-06-19 17:17:01
277593	ey-lessql	5	https://github.com/ezmobius/ey-lessql	a collection of chef recipes to install, configure and run a variety of NoSQL db's on the engine yard cloud.	Ruby	10	0	\N	39	2009-08-14 00:17:52	2019-08-13 11:27:29	2009-10-23 15:35:29
1104253	ez-scheme	5	https://github.com/ezmobius/ez-scheme	scheme on the rbx vm	Ruby	4	0	\N	27	2010-11-22 23:55:24	2020-10-15 14:10:09	2013-10-27 01:05:03
27148	ez-where	5	https://github.com/ezmobius/ez-where	query/conditions builder for ActiveRecord and other ORMS	Ruby	4	0	\N	34	2008-06-20 17:14:55	2020-07-03 13:03:51	2009-10-28 19:09:25
1103712	heist	5	https://github.com/ezmobius/heist	Scheme in as little Ruby and as much Scheme as possible. Supports macros, continuations, tail recursion and lazy evaluation.	Ruby	1	0	\N	1	2010-11-22 19:57:27	2018-03-13 05:04:12	2010-07-27 18:17:41
5226605	LocheGSplicer	5	https://github.com/ezmobius/LocheGSplicer	Splices multiple 3D Printer gcode files into a single gcode file for multiple extruder printing.	C++	3	0	\N	5	2012-07-29 20:27:24	2018-03-13 05:04:11	2012-07-29 01:08:00
1363875	lua-nginx-module	5	https://github.com/ezmobius/lua-nginx-module	Embed the Power of Lua into NginX	Perl	1	0	\N	2	2011-02-14 01:51:50	2018-03-13 05:04:09	2011-02-14 01:55:00
14497	merbivore	5	https://github.com/ezmobius/merbivore	merb website	Ruby	4	0	\N	4	2008-05-04 17:37:24	2019-08-13 10:24:01	2020-10-02 08:56:33
5964	nanite	5	https://github.com/ezmobius/nanite	self assembling fabric of ruby daemons	Ruby	66	13	\N	738	2008-03-31 05:32:08	2021-01-28 07:50:27	2010-12-22 08:21:32
1099441	nats	5	https://github.com/ezmobius/nats	A simple and performant EventMachine based Publish-Subscribe system. 	Ruby	1	0	\N	1	2010-11-21 08:29:27	2018-03-13 05:04:03	2010-11-22 08:30:24
112754	nginx-ey-balancer	5	https://github.com/ezmobius/nginx-ey-balancer	nginx max connections queue	C	17	0	\N	32	2009-01-22 17:53:59	2020-06-12 18:11:03	2009-01-22 10:25:36
108340	ohai	5	https://github.com/ezmobius/ohai	Ohai profiles your system and emits JSON	\N	0	0	\N	5	2009-01-15 19:58:21	2019-08-13 10:53:59	2009-01-15 18:52:26
455782	redactor	5	https://github.com/ezmobius/redactor	An Actor library based around Redis. Useful for coordination, command and control of distributed ruby processes	Ruby	1	0	\N	66	2010-01-02 03:49:55	2021-01-13 16:27:53	2010-01-02 22:29:53
156717	redis	5	https://github.com/ezmobius/redis	Redis key-value store	C	0	0	\N	8	2009-03-22 22:54:07	2020-07-07 06:18:13	2009-03-22 11:27:35
3717526	redis-rb	5	https://github.com/ezmobius/redis-rb	A Ruby client library for Redis	Ruby	8	1	\N	27	2012-03-14 09:48:05	2019-02-27 08:00:37	2016-07-18 17:39:17
1357116	super-nginx	5	https://github.com/ezmobius/super-nginx	killer build of nginx *and* luajit-beta6 plus 21 other modules	C	11	1	\N	148	2011-02-11 21:33:28	2021-01-13 16:30:52	2011-02-18 01:36:13
4983331	tlabs-mendelmax	5	https://github.com/ezmobius/tlabs-mendelmax	Documentation and other tidbits for the TrinityLabs MendelMax 1.5+	\N	3	0	\N	8	2012-07-10 23:04:19	2018-03-13 05:03:43	2012-07-11 20:57:20
1740408	vcap-tests	5	https://github.com/ezmobius/vcap-tests	Cloud Foundry - the open platform as a service project	Ruby	1	0	\N	1	2011-05-12 17:55:30	2018-03-13 05:03:41	2011-05-14 08:57:35
1742412	vmc	5	https://github.com/ezmobius/vmc	The command line client for Cloud Foundry - the open platform as a service project	Ruby	2	0	\N	3	2011-05-13 05:12:48	2020-01-09 05:20:32	2011-05-16 17:44:47
18482177	adventure_cats	6	https://github.com/ivey/adventure_cats	Adventure Cats, a game by Ellie and her Dad	JavaScript	1	0	\N	0	2014-04-06 00:34:05	2018-03-13 05:03:37	2014-04-07 00:07:48
26449033	anaconda	6	https://github.com/ivey/anaconda	A Go client library for the Twitter 1.1 API	Go	1	0	\N	0	2014-11-10 16:18:19	2018-03-13 05:03:36	2014-11-10 16:47:55
6681965	ascii	6	https://github.com/ivey/ascii	Awesome ascii	\N	1	1	\N	0	2012-11-14 01:15:36	2018-03-13 05:03:34	2017-09-26 21:10:46
19782581	aws	6	https://github.com/ivey/aws	Development repository for Opscode Cookbook aws	Ruby	0	0	\N	0	2014-05-14 11:28:23	2021-01-05 15:55:55	2014-05-14 11:52:38
101022	blog	6	https://github.com/ivey/blog	\N	JavaScript	0	0	\N	3	2009-01-05 02:19:47	2019-08-13 10:51:31	2011-09-10 18:20:07
4875704	build-essential	6	https://github.com/ivey/build-essential	Development repository for Opscode Cookbook build-essential	Ruby	0	0	\N	1	2012-07-03 15:21:05	2019-01-03 18:47:05	2012-06-22 17:46:19
9051	carpark	6	https://github.com/ivey/carpark	Carpark adds LISP-style car, cdr, and endless combinations of them to the standard Ruby Array, allowing for terse and powerful decomposition of deeply nested arrays: [1, [2, 3, [4, 5], [[[6]]]]].caaaadddadr => 6	Ruby	2	1	\N	8	2008-04-12 01:50:00	2019-08-13 10:22:53	2008-07-24 14:32:14
1124294	chef	6	https://github.com/ivey/chef	A systems integration framework, built to bring the benefits of configuration management to your entire infrastructure.	Ruby	0	0	\N	2	2010-11-30 00:52:15	2018-02-18 18:26:28	2012-07-31 16:16:31
1762403	cinch-github	6	https://github.com/ivey/cinch-github	Cinch Plugin to let bots interact with Github	Ruby	0	0	\N	2	2011-05-17 16:21:34	2018-02-18 18:26:32	2011-06-14 00:57:56
27444944	cli	6	https://github.com/ivey/cli	A small package for building command line apps in Go	Go	0	0	\N	1	2014-12-02 15:42:28	2018-02-18 18:26:36	2015-03-03 19:01:51
908817	clj-gweezlebur-utils	6	https://github.com/ivey/clj-gweezlebur-utils	ivey's clojure utility functions	Clojure	0	0	\N	2	2010-09-13 22:12:28	2018-02-18 18:26:40	2010-09-17 03:29:31
906305	clj-highrise	6	https://github.com/ivey/clj-highrise	WORK IN PROGRESS, DO NOT USE	Clojure	0	0	\N	2	2010-09-13 00:30:29	2018-02-18 18:26:44	2010-09-13 00:31:24
1589365	colapp	6	https://github.com/ivey/colapp	\N	Ruby	0	4	\N	3	2011-04-08 18:33:46	2018-02-18 18:26:48	2011-04-09 17:17:55
2137285	comatose	6	https://github.com/ivey/comatose	Comatose is a micro CMS, implemented as a Rails plugin, that is designed to be easy to embed and extend.	JavaScript	0	0	\N	2	2011-08-01 12:02:40	2018-02-18 18:26:52	2011-08-01 12:07:01
2314912	dkpgrcsk	6	https://github.com/ivey/dkpgrcsk	Asynchronous Python IRC bot with social networking plugins	Python	0	0	\N	2	2011-09-02 13:07:13	2018-02-18 18:26:56	2011-09-02 17:08:21
1661719	dropship	6	https://github.com/ivey/dropship	Instantly transfer files between Dropbox accounts using only their hashes.	Python	0	0	\N	2	2011-04-25 18:13:40	2018-02-18 18:27:00	2011-04-25 16:38:15
84563	emacs-starter-kit	6	https://github.com/ivey/emacs-starter-kit	All the code you need to get started, with an emphasis on dynamic languages.	Emacs Lisp	0	0	\N	2	2008-12-03 19:03:14	2019-08-13 10:45:26	2011-09-27 13:13:52
107843	enigma-codebook	6	https://github.com/ivey/enigma-codebook	Sinatra app to generate codebooks for Enigma machines	Ruby	1	0	\N	9	2009-01-15 04:38:20	2021-01-01 21:57:29	2009-01-15 13:56:18
2759816	ethical-eating	6	https://github.com/ivey/ethical-eating	Gentle Guide to Ethical Eating	\N	0	0	\N	2	2011-11-12 00:03:50	2018-02-18 18:27:13	2011-11-12 01:09:41
476881	fav2rt	6	https://github.com/ivey/fav2rt	Turn a set of Twitter favorites into Retweets	Ruby	1	0	\N	6	2010-01-18 00:10:01	2014-01-08 00:54:57	2014-01-08 00:54:55
59375	gist.el	6	https://github.com/ivey/gist.el	Yet another Emacs paste mode, this one for Gist.	Emacs Lisp	0	0	\N	2	2008-10-03 19:24:45	2019-08-13 10:37:05	2010-11-04 22:03:19
100839	github-gem	6	https://github.com/ivey/github-gem	The official `github` command line helper for simplifying your GitHub experience.	Ruby	1	0	\N	2	2009-01-04 19:37:01	2019-08-13 10:51:26	2009-11-02 02:22:22
17916214	github-selfies	6	https://github.com/ivey/github-selfies	Everything is better with selfies. Yes, even pull requests. Don't argue.	JavaScript	0	0	\N	1	2014-03-19 15:47:51	2018-02-18 18:27:29	2014-03-18 21:59:36
53515418	go-bigip	6	https://github.com/ivey/go-bigip	A Go package that interacts with F5 BIG-IP systems using the REST API.	Go	0	0	\N	1	2016-03-09 14:00:21	2018-02-18 18:27:33	2016-03-15 15:30:20
28249028	gobt	6	https://github.com/ivey/gobt	Behavior Tree library for Go	Go	0	0	\N	1	2014-12-19 20:35:37	2018-02-18 18:27:37	2014-12-19 20:36:23
23688409	godep	6	https://github.com/ivey/godep	dependency tool for go	\N	0	0	\N	1	2014-09-05 00:06:03	2018-02-18 18:27:41	2014-09-05 00:07:13
14216658	grit	6	https://github.com/ivey/grit	Grit gives you object oriented read/write access to Git repositories via Ruby.	Ruby	0	0	\N	0	2013-11-07 19:40:38	2020-01-09 05:21:08	2013-11-07 19:44:18
69065363	habitrpg	6	https://github.com/ivey/habitrpg	A habit tracker app which treats your goals like a Role Playing Game.	JavaScript	0	0	\N	1	2016-09-23 19:40:18	2018-02-18 18:27:49	2016-09-23 18:28:53
30257818	hipchat-go	6	https://github.com/ivey/hipchat-go	Go client library for the HipChat API v2	Go	0	0	\N	1	2015-02-03 16:27:08	2018-02-18 18:27:53	2015-02-03 18:30:37
1140955	homebrew	6	https://github.com/ivey/homebrew	The missing package manager for OS X.	Ruby	0	0	\N	2	2010-12-05 17:26:43	2018-02-18 18:27:57	2011-12-02 15:24:41
11374954	ace	7	https://github.com/evanphx/ace	Ace (Ajax.org Cloud9 Editor)	JavaScript	0	0	\N	1	2013-07-12 15:12:26	2018-02-18 17:56:11	2013-07-12 04:04:43
53301806	alexa	7	https://github.com/evanphx/alexa	Golang interface to the Amazon Alexa Voice service	Go	12	2	\N	79	2016-03-07 03:38:15	2020-12-15 10:40:28	2016-03-08 04:03:04
36110636	amqp	7	https://github.com/evanphx/amqp	Go client for AMQP 0.9.1	Go	1	0	\N	1	2015-05-23 03:43:29	2018-02-18 17:56:19	2015-05-23 03:47:41
292633227	asus-fan-control	7	https://github.com/evanphx/asus-fan-control	:cyclone: Fan control for ASUS devices running Linux.	\N	0	0	\N	0	2020-09-03 14:14:53	2020-09-03 14:14:55	2020-06-29 17:05:59
120141244	atc	7	https://github.com/evanphx/atc	build scheduler and web interface	Go	0	0	\N	1	2018-02-03 22:08:48	2018-02-18 17:56:23	2018-03-04 03:52:49
3814699	benchmark-ips	7	https://github.com/evanphx/benchmark-ips	Provides iteration per second benchmarking for Ruby	Ruby	74	2	\N	1424	2012-03-23 23:58:55	2021-01-25 06:35:13	2021-01-23 21:00:38
56174118	benchmark.fyi	7	https://github.com/evanphx/benchmark.fyi	A place to share benchmarking results	Ruby	6	6	\N	9	2016-04-13 14:54:18	2018-02-18 17:56:31	2020-10-01 11:24:57
1574968	benchmark_suite	7	https://github.com/evanphx/benchmark_suite	A set of enhancements to benchmark.rb	Ruby	9	2	\N	45	2011-04-05 22:02:57	2019-10-14 01:17:07	2020-03-30 10:52:39
153561785	biscuit	7	https://github.com/evanphx/biscuit	Biscuit research OS	Go	0	0	\N	0	2018-10-18 01:05:11	2018-10-18 01:05:28	2018-10-10 21:45:37
56890691	blog	7	https://github.com/evanphx/blog	The source for my blog	HTML	1	0	\N	1	2016-04-22 20:27:52	2018-02-18 17:56:39	2016-04-25 20:02:05
27151251	brigade	7	https://github.com/evanphx/brigade	Parallel S3 bucket-bucket differential sync in Go	Go	1	0	\N	1	2014-11-25 21:37:54	2018-02-18 17:56:43	2014-11-25 21:58:29
3382377	callbox	7	https://github.com/evanphx/callbox	A twilio app to control my callbox	\N	1	0	\N	2	2012-02-07 21:07:22	2018-02-18 17:56:47	2012-02-07 21:12:56
1963084	chef	7	https://github.com/evanphx/chef	A systems integration framework, built to bring the benefits of configuration management to your entire infrastructure.	Ruby	0	0	\N	2	2011-06-27 19:45:00	2018-02-18 17:56:51	2013-06-20 15:58:19
453662	cijoe	7	https://github.com/evanphx/cijoe	CI Joe is a simple Continuous Integration server.	Ruby	1	0	\N	2	2009-12-30 17:08:26	2018-02-18 17:56:55	2009-12-30 23:19:23
1141863	citrus	7	https://github.com/evanphx/citrus	Parsing Expressions for Ruby	Ruby	1	0	\N	4	2010-12-05 23:47:48	2018-02-18 17:56:59	2010-12-07 03:27:41
50541962	closure-library	7	https://github.com/evanphx/closure-library	Google's common JavaScript library	JavaScript	0	0	\N	1	2016-01-27 20:18:37	2018-02-18 17:57:03	2016-01-27 18:24:30
170611800	columbia	7	https://github.com/evanphx/columbia	WebAssembly based Linux compatible Runtime	WebAssembly	1	0	\N	8	2019-02-14 00:14:29	2021-01-01 11:30:39	2019-02-21 02:59:04
1852983	curb	7	https://github.com/evanphx/curb	Ruby bindings for libcurl	C	1	0	\N	2	2011-06-06 01:21:18	2018-02-18 17:57:07	2011-06-06 02:08:41
4219286	distance_between	7	https://github.com/evanphx/distance_between	A RubyMotion App that uses calculates the distance between 2 locations	Ruby	4	0	\N	24	2012-05-03 18:59:02	2018-02-28 13:46:19	2012-05-07 14:33:08
12006301	docker	7	https://github.com/evanphx/docker	Docker - the open-source application container engine	Go	0	0	\N	1	2013-08-09 14:10:08	2018-02-18 17:57:16	2013-08-18 00:04:03
123542493	docker-image-resource	7	https://github.com/evanphx/docker-image-resource	a resource for docker images	Go	0	0	\N	0	2018-03-02 03:56:18	2018-03-02 03:56:20	2018-03-04 19:43:31
12228164	dockrun	7	https://github.com/evanphx/dockrun	This proof of concept docker run wrapper attempts to make docker containers behave like unix processes.	Go	1	0	\N	1	2013-08-19 18:33:06	2018-02-18 17:57:20	2013-08-19 18:36:06
42219753	docs	7	https://github.com/evanphx/docs	Prometheus documentation: content and static site generator	CSS	1	0	\N	1	2015-09-10 00:27:37	2018-02-18 17:57:25	2015-09-10 00:31:07
90999145	dotfiles	7	https://github.com/evanphx/dotfiles	Various configuration files	Vim script	0	0	\N	1	2017-05-11 13:10:05	2020-09-05 19:30:28	2020-09-05 19:30:26
919566	dotvim	7	https://github.com/evanphx/dotvim	my .vim directory	VimL	1	0	\N	6	2010-09-17 19:23:46	2018-02-18 17:57:38	2016-06-21 14:49:37
22699	dr-nic-magic-awesome	7	https://github.com/evanphx/dr-nic-magic-awesome	Magically fix your projects overnight!	\N	0	0	\N	3	2008-06-05 20:02:45	2019-08-13 10:26:06	2008-06-05 20:02:47
120140896	elm-ansi	7	https://github.com/evanphx/elm-ansi	ANSI stream handling for Elm	Elm	0	0	\N	1	2018-02-03 22:02:26	2018-02-18 17:57:46	2018-02-03 22:06:16
2622905	engineyard	7	https://github.com/evanphx/engineyard	Deploy to Engine Yard Cloud from the command line	Ruby	1	0	\N	2	2011-10-21 18:28:17	2018-02-18 17:57:50	2011-10-21 18:34:18
91984	evanphx.github.com	7	https://github.com/evanphx/evanphx.github.com	My page	\N	1	0	\N	3	2008-12-17 05:45:14	2020-01-09 05:20:56	2008-12-17 05:46:34
56884831	evanphx.github.io	7	https://github.com/evanphx/evanphx.github.io	blog!	HTML	1	0	\N	1	2016-04-22 17:58:09	2018-02-18 17:57:58	2016-04-25 20:02:16
58215	amqp	17	https://github.com/vanpelt/amqp	AMQP client implementation in Ruby/EventMachine	Ruby	0	0	\N	4	2008-09-30 21:12:36	2019-08-13 10:36:47	2008-10-02 20:37:16
17235047	analytics-ruby	17	https://github.com/vanpelt/analytics-ruby	The hassle-free way to integrate analytics into any Ruby application.	Ruby	1	0	\N	1	2014-02-27 00:23:53	2018-03-13 05:03:24	2014-02-19 23:44:00
18422658	api-blueprint	17	https://github.com/vanpelt/api-blueprint	API Blueprint	\N	1	0	\N	0	2014-04-03 21:26:04	2018-02-18 18:59:34	2014-04-03 08:10:56
111990595	apollo-client	17	https://github.com/vanpelt/apollo-client	:rocket: A fully-featured, production ready caching GraphQL client for every server or UI framework	TypeScript	0	0	\N	0	2017-11-25 07:05:07	2018-02-18 18:59:35	2017-11-24 23:49:35
27188	async-observer	17	https://github.com/vanpelt/async-observer	Rails plugin that provides deep integration with Beanstalk.	Ruby	1	0	\N	3	2008-06-20 20:16:43	2019-08-13 10:27:16	2008-06-20 20:16:45
77002473	blueprint	17	https://github.com/vanpelt/blueprint	A React UI toolkit for the web	TypeScript	0	0	\N	0	2016-12-20 22:40:04	2018-02-18 18:59:39	2016-12-18 19:39:48
4429051	CardMaven	17	https://github.com/vanpelt/CardMaven	An iOS card game app that allows for multiple variants of games, multi-player over bluetooth, and much more... 	Objective-C	4	0	\N	7	2012-05-24 02:19:36	2020-07-09 01:35:38	2012-05-24 02:21:49
204591	chris-snez	17	https://github.com/vanpelt/chris-snez	My better half and I now have our own website...	\N	1	0	\N	1	2009-05-19 03:28:14	2018-02-18 18:59:42	2009-08-10 17:10:13
163696210	ConcatenateBlobs	17	https://github.com/vanpelt/ConcatenateBlobs	Simply pass array of blobs. This javascript library will concatenate all blobs in single Blob object.	HTML	0	0	\N	0	2018-12-31 18:38:16	2018-12-31 18:38:18	2016-05-03 05:14:26
33222	contacts	17	https://github.com/vanpelt/contacts	A universal interface to grab contact list information from various providers including Yahoo, Gmail, Hotmail, and Plaxo.	Ruby	0	0	\N	2	2008-07-11 02:33:08	2019-08-13 10:28:56	2008-07-11 02:54:25
151773270	create-react-app	17	https://github.com/vanpelt/create-react-app	Create React apps with no build configuration.	JavaScript	0	0	\N	0	2018-10-05 17:15:43	2018-10-05 17:15:49	2018-10-05 17:05:36
2524185	cube	17	https://github.com/vanpelt/cube	Cube: A system for time series visualization.	JavaScript	1	0	\N	1	2011-10-06 02:08:47	2018-02-18 18:59:45	2011-10-05 16:17:09
111592185	deepo	17	https://github.com/vanpelt/deepo	A Docker image containing almost all popular deep learning frameworks: theano, tensorflow, sonnet, pytorch, keras, lasagne, mxnet, cntk, chainer, caffe, torch.	\N	0	0	\N	0	2017-11-21 17:28:07	2018-02-18 18:59:47	2017-11-02 05:42:01
104453	delayed_job	17	https://github.com/vanpelt/delayed_job	Database backed asynchronous priority queue -- Extracted from Shopify 	Ruby	5	0	\N	7	2009-01-09 22:14:42	2019-08-13 10:52:38	2009-01-24 21:11:25
55015	dm-imap-adapter	17	https://github.com/vanpelt/dm-imap-adapter	An IMAP adapter for DataMapper.  Supports reading, writing, updating... the whole works.	Ruby	3	2	\N	13	2008-09-21 20:22:56	2019-08-13 10:35:53	2017-09-26 21:11:05
179406159	emotion-detector	17	https://github.com/vanpelt/emotion-detector	Emotion detector with tfjs	JavaScript	1	0	\N	2	2019-04-03 23:25:08	2020-02-13 19:33:11	2019-11-07 03:12:58
4981949	evercookie	17	https://github.com/vanpelt/evercookie	evercookie is a javascript API available that produces extremely persistent cookies in a browser. Its goal is to identify a client even after they've removed standard cookies, Flash cookies (Local Shared Objects or LSOs), and others. 	JavaScript	1	0	\N	1	2012-07-10 20:27:42	2018-02-18 18:59:52	2012-07-18 18:21:18
52435	fancy-zoom	17	https://github.com/vanpelt/fancy-zoom	Zoomy JavaScript based loosely on Fancy Zoom by Cabel Sasser.	JavaScript	2	0	\N	7	2008-09-14 00:34:06	2019-08-13 10:35:06	2008-12-16 20:55:22
83514508	Faster-RCNN_CloudML	17	https://github.com/vanpelt/Faster-RCNN_CloudML	Faster-RCNN for Cloud ML	Python	0	0	\N	3	2017-03-01 02:16:02	2018-06-01 17:12:10	2017-03-02 19:01:16
201387023	font-facer	17	https://github.com/vanpelt/font-facer	A UI for interpolating fonts	JavaScript	0	7	\N	1	2019-08-09 01:05:42	2020-01-09 05:26:02	2020-12-11 15:03:40
221825553	fsdl-text-recognizer	17	https://github.com/vanpelt/fsdl-text-recognizer	Repo that generates https://github.com/full-stack-deep-learning/fsdl-text-recognizer-project	Jupyter Notebook	0	0	\N	0	2019-11-14 23:15:54	2019-11-15 19:45:22	2019-11-15 19:46:58
5533879	guestlist	17	https://github.com/vanpelt/guestlist	Engineering guest list for the Nightmix party	\N	1	0	\N	0	2012-08-23 20:36:54	2018-02-18 18:59:57	2012-08-23 20:39:15
42790	instimage	17	https://github.com/vanpelt/instimage	A lightweight javascript interface for choosing images from arbitrary urls	JavaScript	1	0	\N	2	2008-08-14 21:17:32	2019-08-13 10:31:41	2008-08-18 21:46:39
79680	jekyll	17	https://github.com/vanpelt/jekyll	Jekyll is a blog-aware, static site generator in Ruby	Ruby	0	0	\N	2	2008-11-22 21:05:02	2019-08-13 10:43:54	2016-07-10 05:19:33
83192655	js-data-cloud-datastore	17	https://github.com/vanpelt/js-data-cloud-datastore	Google Cloud Datastore adapter for js-data. Main Site: http://js-data.io, API Reference Docs: http://googlecloudplatform.github.io/js-data-cloud-datastore/	JavaScript	0	0	\N	0	2017-02-26 04:59:00	2018-02-18 19:00:01	2016-08-24 02:16:26
58484007	js-segment-annotator	17	https://github.com/vanpelt/js-segment-annotator	Javascript image annotation tool based on image segmentation.	JavaScript	1	0	\N	0	2016-05-10 15:21:22	2018-02-18 19:00:03	2016-02-01 23:46:06
29	jsawesome	17	https://github.com/vanpelt/jsawesome	Awesome JSON	JavaScript	2	1	\N	41	2008-01-13 04:04:19	2021-01-23 07:19:31	2008-05-29 17:09:36
91264763	KittiSeg	17	https://github.com/vanpelt/KittiSeg	A Kitti Road Segmentation model implemented in tensorflow.	Python	0	0	\N	0	2017-05-14 15:57:33	2018-02-18 19:00:06	2017-05-15 12:45:35
235619	lyndon	17	https://github.com/vanpelt/lyndon	Lyndon wraps JavaScript in a loving MacRuby embrace.	Ruby	1	0	\N	1	2009-06-24 19:56:16	2018-02-18 19:00:08	2009-06-24 03:09:02
83091761	mali	17	https://github.com/vanpelt/mali	A minimalistic gRPC microservice framework for Node.js	JavaScript	0	0	\N	0	2017-02-24 20:33:05	2018-02-18 19:00:10	2017-02-21 16:34:04
29316799	afero	18	https://github.com/wayneeseguin/afero	A FileSystem Abstraction System for Go	Go	1	0	\N	2	2015-01-15 18:31:17	2018-02-18 18:00:51	2015-01-15 18:33:25
205	alogr	18	https://github.com/wayneeseguin/alogr	AlogR is a threadsafe non-blocking asynchronous configurable logger for Ruby.	Ruby	1	1	\N	11	2008-02-01 14:36:54	2019-08-13 10:21:20	2008-03-26 16:10:50
25402715	appfirst-boshrelease	18	https://github.com/wayneeseguin/appfirst-boshrelease	AppFirst BOSH Release (ABR)	Shell	3	0	\N	2	2014-10-18 13:22:20	2018-02-18 18:00:59	2015-05-17 16:53:12
5745	ar_migration_branches	18	https://github.com/wayneeseguin/ar_migration_branches	Active Record Migration Branches	Ruby	2	0	\N	7	2008-03-28 19:19:26	2019-08-13 10:22:22	2008-10-06 23:25:23
3791	attachmerb_fu	18	https://github.com/wayneeseguin/attachmerb_fu	A merb port of the attachment_fu Rails plugin	Ruby	1	0	\N	4	2008-02-21 03:32:29	2019-08-13 10:22:01	2008-03-13 15:47:50
603825	authlogic	18	https://github.com/wayneeseguin/authlogic	A simple model based ruby authentication solution.	Ruby	1	0	\N	2	2010-04-10 09:52:50	2018-02-18 18:01:11	2010-01-19 04:25:55
206	autozest	18	https://github.com/wayneeseguin/autozest	AutoZest is an autotest addon that: * automated growl installation * generation of .autotest with growl & autozest config * generation of .autozest.yml config file * autozest.sqlite3 database file for pulling random messages based on severity	Ruby	1	1	\N	6	2008-02-01 14:37:51	2019-08-13 10:21:20	2008-03-26 16:10:50
35103111	bboshinst	18	https://github.com/wayneeseguin/bboshinst	Binary bosh installer script for OpenStack	Shell	1	0	\N	1	2015-05-05 10:58:58	2018-02-18 18:01:20	2015-05-05 11:07:15
32540504	bosh	18	https://github.com/wayneeseguin/bosh	Cloud Foundry BOSH is an open source tool chain for release engineering, deployment and lifecycle management of large scale distributed services.	Ruby	0	0	\N	2	2015-03-19 15:56:36	2018-02-18 18:01:25	2015-06-13 12:10:17
40715713	bosh-create	18	https://github.com/wayneeseguin/bosh-create	Exploration of ways to do bosh-release logic and structure.	Shell	2	0	\N	1	2015-08-14 10:14:37	2018-02-18 18:01:30	2016-02-05 14:09:36
31613835	bosh-workspace	18	https://github.com/wayneeseguin/bosh-workspace	Gem for managing your bosh workspace	Ruby	2	0	\N	1	2015-03-03 15:21:58	2020-09-21 02:55:19	2015-03-10 16:59:52
2073720	bundler	18	https://github.com/wayneeseguin/bundler	Manage your application's gem dependencies with less pain	Ruby	0	0	\N	3	2011-07-19 15:25:32	2020-01-09 22:11:34	2011-07-18 23:30:08
17672315	cf-acceptance-tests	18	https://github.com/wayneeseguin/cf-acceptance-tests	CF Acceptance tests	Go	1	0	\N	2	2014-03-12 12:40:54	2018-02-18 18:01:44	2014-03-12 12:41:57
21912506	cf-app-logstail	18	https://github.com/wayneeseguin/cf-app-logstail	Cloud Foundry Logs Tailer	Go	1	0	\N	1	2014-07-16 15:36:51	2018-02-18 18:01:47	2014-07-16 15:40:41
31297566	cf-appfirst-buildpack	18	https://github.com/wayneeseguin/cf-appfirst-buildpack	Cloud Foundry AppFirst Collector Buildpack	Shell	2	0	\N	1	2015-02-25 01:42:16	2018-02-18 18:01:52	2015-02-28 19:18:52
21245953	cli	18	https://github.com/wayneeseguin/cli	A CLI for Cloud Foundry written in Go	Go	5	1	\N	1	2014-06-26 12:42:41	2018-02-18 18:01:56	2017-09-26 21:11:16
51490346	concourse-project	18	https://github.com/wayneeseguin/concourse-project	\N	\N	1	0	\N	1	2016-02-11 00:50:52	2018-02-18 18:02:00	2016-02-11 00:51:48
20502580	datasciencecoursera	18	https://github.com/wayneeseguin/datasciencecoursera	Data Science @ Coursera	\N	1	0	\N	1	2014-06-04 19:03:46	2018-02-18 18:02:04	2014-06-04 22:08:10
20506898	datasharing	18	https://github.com/wayneeseguin/datasharing	The Leek group guide to data sharing 	\N	0	0	\N	1	2014-06-04 22:08:50	2018-02-18 18:02:08	2013-11-25 14:08:34
31423441	data_retention	18	https://github.com/wayneeseguin/data_retention	\N	\N	2	0	\N	1	2015-02-27 11:40:59	2018-02-18 18:02:13	2015-02-23 22:40:03
335190	db	18	https://github.com/wayneeseguin/db	dbm	\N	0	0	\N	2	2009-10-12 16:20:13	2018-02-18 18:02:17	\N
335252	dbm	18	https://github.com/wayneeseguin/dbm	\N	\N	0	0	\N	2	2009-10-12 17:09:46	2018-02-18 18:02:21	\N
4071025	deliver	18	https://github.com/wayneeseguin/deliver	Heroku-style deployment through pure bash. Supports multiple strategies.	Ruby	1	0	\N	3	2012-04-18 23:53:30	2018-02-18 18:02:25	2012-04-18 23:58:53
21012106	docs-bosh	18	https://github.com/wayneeseguin/docs-bosh	The docs repo for BOSH	\N	1	0	\N	1	2014-06-19 16:05:41	2018-02-18 18:02:29	2014-06-18 20:16:37
237376	dynamic_reports	18	https://github.com/wayneeseguin/dynamic_reports	Dynamic Reporting Engine for Ruby && Rails	Ruby	23	0	\N	224	2009-06-26 21:41:46	2020-08-16 14:02:59	2009-08-04 16:49:44
28674088	env	18	https://github.com/wayneeseguin/env	Environment mappings and variables for GAE	Go	2	1	\N	1	2014-12-31 18:06:24	2018-02-18 18:02:37	2017-09-26 21:11:22
55162477	env-1	18	https://github.com/wayneeseguin/env-1	The Best Damn Collection of .rc files this side of the Mississippi	Shell	1	0	\N	1	2016-03-31 12:40:46	2018-02-18 18:02:41	2016-03-26 20:45:26
22291102	exdata-project2	18	https://github.com/wayneeseguin/exdata-project2	Exploratory Data Analysis Course Project 2	R	103	0	\N	3	2014-07-26 13:38:00	2019-11-29 19:34:42	2014-07-26 13:56:57
21795124	ExData_Plotting1	18	https://github.com/wayneeseguin/ExData_Plotting1	Plotting Assignment 1 for Exploratory Data Analysis	R	1	0	\N	1	2014-07-13 13:44:58	2018-02-18 18:02:49	2014-07-13 17:54:06
543222	fish-nuggets	18	https://github.com/wayneeseguin/fish-nuggets	Completions, code snippets helping you to get even more out of the amazing Fish shell	\N	1	0	\N	2	2010-03-02 14:43:56	2019-10-14 18:38:51	2010-02-25 21:09:51
4588940	active_admin	19	https://github.com/brynary/active_admin	The administration framework for Ruby on Rails applications.	Ruby	1	0	\N	2	2012-06-07 15:42:43	2018-02-18 18:07:05	2012-06-07 15:44:56
6974758	active_merchant	19	https://github.com/brynary/active_merchant	Active Merchant is a simple payment abstraction library used in and sponsored by Shopify. It is written by Tobias Luetke, Cody Fauser, and contributors. The aim of the project is to feel natural to Ruby users and to abstract as many parts as possible away from the user to offer a consistent interface across all supported gateways.	Ruby	1	0	\N	1	2012-12-02 23:11:17	2018-02-18 18:07:09	2012-12-02 23:12:17
11237765	acts-as-taggable-on	19	https://github.com/brynary/acts-as-taggable-on	A tagging plugin for Rails applications that allows for custom tagging along dynamic contexts.	Ruby	1	0	\N	0	2013-07-07 15:19:46	2020-01-09 12:51:10	2013-05-15 18:09:05
202941	arel	19	https://github.com/brynary/arel	A Relational Algebra	Ruby	16	2	\N	137	2009-05-16 23:56:18	2020-08-19 18:38:13	2011-04-30 17:30:53
1465039	artifice	19	https://github.com/brynary/artifice	Replaces Net::HTTP with a subclass that routes all requests to a Rack application	Ruby	0	0	\N	2	2011-03-10 16:37:30	2018-02-18 18:07:22	2010-10-25 22:31:49
341498	asset-trip	19	https://github.com/brynary/asset-trip	Rails asset bundling plugin that will expand your mind	Ruby	2	0	\N	14	2009-10-18 17:11:39	2019-08-13 11:28:42	2009-12-01 16:13:55
43925066	atlas-examples	19	https://github.com/brynary/atlas-examples	Public examples for using Atlas by HashiCorp	HCL	1	0	\N	1	2015-10-08 22:09:30	2018-08-02 22:04:28	2015-10-04 15:40:43
670928	badger	19	https://github.com/brynary/badger	\N	Ruby	1	0	\N	3	2010-05-17 10:21:40	2018-02-18 18:07:40	2010-05-17 10:22:47
2730563	bert	19	https://github.com/brynary/bert	BERT (Binary ERlang Term) serialization library for Ruby.	Ruby	0	0	\N	3	2011-11-07 22:42:46	2018-02-18 18:07:45	2014-07-24 02:18:47
4915257	bertrpc	19	https://github.com/brynary/bertrpc	BERTRPC is a Ruby BERT-RPC client library.	Ruby	0	0	\N	2	2012-07-05 18:05:54	2018-02-18 18:07:51	2013-01-28 03:32:51
11237438	better_errors	19	https://github.com/brynary/better_errors	Better error page for Rails and other Rack apps	Ruby	1	0	\N	1	2013-07-07 14:56:29	2018-08-27 05:46:30	2013-07-09 13:01:28
44581060	blackbox	19	https://github.com/brynary/blackbox	Safely store secrets in Git/Mercurial/Subversion	Shell	1	0	\N	1	2015-10-20 01:58:53	2018-02-18 18:08:00	2015-10-20 02:59:06
17929768	boot2docker	19	https://github.com/brynary/boot2docker	Lightweight Linux for Docker	Shell	0	0	\N	1	2014-03-20 00:37:12	2018-02-18 18:08:06	2014-03-18 10:06:44
11237550	bootstrap-sass	19	https://github.com/brynary/bootstrap-sass	bootstrap-sass is bootstrap for Sass, ready to roll	Ruby	0	0	\N	1	2013-07-07 15:05:04	2018-02-18 18:08:10	2013-07-17 16:57:56
377	invisible	22	https://github.com/macournoyer/invisible	The invisible framework	CSS	9	1	\N	50	2008-02-09 16:38:52	2019-08-13 10:21:24	2009-03-24 22:32:40
6833652	brakeman	19	https://github.com/brynary/brakeman	A static analysis security vulnerability scanner for Ruby on Rails applications	Ruby	2	0	\N	1	2012-11-23 20:03:24	2018-02-18 18:08:15	2013-04-07 02:32:53
14514622	breach-mitigation-rails	19	https://github.com/brynary/breach-mitigation-rails	Make Rails apps more resilient against the BREACH and CRIME attacks	Ruby	1	0	\N	1	2013-11-19 02:55:40	2018-02-18 18:08:19	2013-11-06 19:58:12
291857	bundler	19	https://github.com/brynary/bundler	\N	Ruby	1	0	\N	2	2009-08-29 15:38:00	2018-02-18 18:08:24	2009-12-17 18:14:55
8261708	bundler-audit	19	https://github.com/brynary/bundler-audit	Patch-level verification for Bundler	Ruby	1	0	\N	1	2013-02-18 01:34:11	2018-02-18 18:08:28	2013-02-18 01:53:55
89388	cache-money	19	https://github.com/brynary/cache-money	A Write-Through Cacheing Library for ActiveRecord	Ruby	1	0	\N	6	2008-12-12 03:05:29	2019-08-13 10:47:08	2008-12-18 02:19:07
6915162	call_for_proposals_2013	19	https://github.com/brynary/call_for_proposals_2013	2013 conference call for proposals	\N	1	0	\N	1	2012-11-29 02:24:32	2018-02-18 18:08:50	2012-11-29 02:32:23
4862783	cancan	19	https://github.com/brynary/cancan	Authorization Gem for Ruby on Rails.	Ruby	1	0	\N	2	2012-07-02 14:31:21	2018-02-18 18:08:54	2012-07-02 14:32:05
6708789	capistrano	19	https://github.com/brynary/capistrano	Remote multi-server automation tool	Ruby	0	0	\N	1	2012-11-15 15:40:24	2018-02-18 18:08:58	2012-11-15 15:42:04
4877742	capybara	19	https://github.com/brynary/capybara	Acceptance test framework for web applications	Ruby	1	0	\N	2	2012-07-03 18:31:36	2016-11-15 07:32:00	2012-07-03 18:33:04
4877683	carrierwave	19	https://github.com/brynary/carrierwave	Classier solution for file uploads for Rails, Sinatra and other Ruby web frameworks	Ruby	0	0	\N	3	2012-07-03 18:25:58	2018-02-18 18:09:07	2012-07-03 18:36:21
3253993	cells	19	https://github.com/brynary/cells	Components for Rails.	Ruby	1	0	\N	2	2012-01-24 05:28:43	2018-02-18 18:09:11	2011-12-21 10:01:10
34124506	checkmate	19	https://github.com/brynary/checkmate	Checkmate - A simple yet powerful meta code-checker with support for multiple languages.	Python	2	1	\N	1	2015-04-17 12:33:03	2018-02-18 18:09:15	2017-09-26 21:11:45
453847	chef	19	https://github.com/brynary/chef	A systems integration framework, built to bring the benefits of configuration management to your entire infrastructure.	Ruby	1	0	\N	2	2009-12-30 19:58:20	2018-02-18 18:09:19	2009-12-30 20:00:54
6160232	clippy	19	https://github.com/brynary/clippy	A utility to access the systems clipboard from Ruby.	Ruby	1	0	\N	2	2012-10-10 13:14:48	2018-02-18 18:09:23	2012-10-10 13:16:45
47726462	codeclimate	19	https://github.com/brynary/codeclimate	Code Climate CLI	Ruby	1	0	\N	1	2015-12-09 21:48:43	2018-02-18 18:09:27	2015-12-09 21:49:33
47726819	codeclimate-phpmd	19	https://github.com/brynary/codeclimate-phpmd	Code Climate PHPMD Engine	PHP	2	1	\N	1	2015-12-09 21:59:15	2018-02-18 18:09:31	2017-09-26 21:11:49
317647158	AdventOfCode2020	20	https://github.com/kevinclark/AdventOfCode2020	\N	Rust	0	0	\N	0	2020-12-01 16:32:27	2020-12-13 14:19:24	2020-12-13 14:19:22
314925801	ale	20	https://github.com/kevinclark/ale	Check syntax in Vim asynchronously and fix files, with Language Server Protocol (LSP) support	Vim script	0	0	\N	1	2020-11-21 20:54:52	2021-01-06 01:07:24	2021-01-14 15:11:25
223032220	aletheia	20	https://github.com/kevinclark/aletheia	A superior, open source suite of state-of-the-art steganalysis tools.	Python	0	0	\N	0	2019-11-20 18:37:47	2020-11-07 16:01:22	2020-11-07 16:09:26
313220843	aoc2019	20	https://github.com/kevinclark/aoc2019	AOC 2019 in Rust	Rust	0	0	\N	0	2020-11-16 04:22:48	2020-12-16 16:38:44	2020-12-16 16:38:42
96278	chordal	20	https://github.com/kevinclark/chordal	A library in Io for generating chords	Io	1	0	\N	7	2008-12-24 07:30:28	2019-08-13 10:49:51	2008-12-25 03:06:25
12028377	docker-registry	20	https://github.com/kevinclark/docker-registry	Registry server for Docker (hosting/delivering of repositories and images)	Python	1	0	\N	1	2013-08-10 20:19:38	2020-03-11 09:05:38	2013-08-10 20:36:32
55214	dotfiles	20	https://github.com/kevinclark/dotfiles	My configs	Shell	1	0	\N	2	2008-09-22 13:28:53	2021-01-12 02:26:11	2021-01-12 02:26:09
21180	dust	20	https://github.com/kevinclark/dust	Lint for Ruby. Moved to http://wiki.github.com/kevinclark/nitpick/	Ruby	3	1	\N	64	2008-05-31 21:43:28	2020-03-26 13:38:32	2009-03-19 00:34:41
236356395	git-tutorial-8033	20	https://github.com/kevinclark/git-tutorial-8033	Just some code for a tutorial in person	Java	0	0	\N	0	2020-01-26 15:27:19	2020-01-26 15:37:14	2020-01-26 15:37:12
140227	glu.ttono.us	20	https://github.com/kevinclark/glu.ttono.us	Blog archives and new engine	JavaScript	1	0	\N	2	2009-03-01 00:53:04	2019-08-13 11:05:07	2009-03-03 08:10:26
305	god	20	https://github.com/kevinclark/god	Ruby process monitor	Ruby	0	0	\N	4	2008-01-13 03:16:23	2019-08-13 10:21:21	2008-06-30 18:03:00
322514480	gq-4x4	20	https://github.com/kevinclark/gq-4x4	GQ-4x4 util for OS X	Rust	0	0	\N	0	2020-12-18 03:54:22	2020-12-28 05:05:14	2020-12-28 05:05:12
11417037	indexer	20	https://github.com/kevinclark/indexer	A simple search engine engine in Go	Go	1	0	\N	1	2013-07-15 04:11:31	2018-02-18 17:53:05	2013-07-15 13:44:43
303763692	inmate-scraping	20	https://github.com/kevinclark/inmate-scraping	Collecting inmate names and addresses	Python	3	1	\N	0	2020-10-13 13:27:23	2020-10-19 20:26:13	2020-10-22 14:05:41
97666	iospec2	20	https://github.com/kevinclark/iospec2	An rspec like tool for Io	Io	1	0	\N	5	2008-12-28 22:32:36	2019-08-13 10:50:23	2008-12-29 21:12:34
1844547	janus	20	https://github.com/kevinclark/janus	A MacVim Distro	Ruby	1	0	\N	2	2011-06-03 18:02:37	2018-02-18 17:53:12	2011-10-24 19:53:37
539685	kata	20	https://github.com/kevinclark/kata	Code kata	C++	1	0	\N	2	2010-02-28 08:26:09	2018-02-18 17:53:16	2010-03-10 15:11:25
3969899	Lesson-Plans	20	https://github.com/kevinclark/Lesson-Plans	\N	Python	12	1	\N	16	2012-04-09 04:32:16	2020-01-10 14:11:57	2020-01-10 14:11:54
1954084	metrics	20	https://github.com/kevinclark/metrics	Capturing JVM- and application-level metrics. So you know what's going on.	Java	1	0	\N	2	2011-06-25 20:47:50	2018-02-18 17:53:24	2011-08-15 23:47:30
316886484	neovim	20	https://github.com/kevinclark/neovim	Vim-fork focused on extensibility and usability	\N	0	0	\N	0	2020-11-29 02:57:00	2020-11-29 02:57:03	2020-11-28 23:43:26
285113662	netty	20	https://github.com/kevinclark/netty	Netty project - an event-driven asynchronous network application framework	\N	0	0	\N	0	2020-08-04 19:22:02	2020-08-04 19:22:06	2020-08-04 19:24:04
153976	nitpick	20	https://github.com/kevinclark/nitpick	A lint for Ruby 1.8. Defunct. Just for posterity.	Ruby	3	3	\N	53	2009-03-19 00:00:14	2020-12-08 04:01:08	2009-03-21 18:54:49
450576	project_euler	20	https://github.com/kevinclark/project_euler	Project Euler problems	Haskell	1	0	\N	3	2009-12-28 00:17:24	2018-02-18 17:53:32	2010-09-08 14:04:26
285133899	quicly	20	https://github.com/kevinclark/quicly	A modular QUIC stack designed primarily for H2O	\N	0	0	\N	0	2020-08-04 21:24:44	2020-08-04 21:24:46	2020-08-04 21:25:35
1596548	redis-py	20	https://github.com/kevinclark/redis-py	Redis Python Client	Python	2	1	\N	2	2011-04-10 19:28:55	2018-02-18 17:53:37	2017-09-26 21:12:07
20807	robot-army	20	https://github.com/kevinclark/robot-army	Deploy scripting with Thor using remote Ruby execution	Ruby	1	0	\N	2	2008-05-30 14:46:52	2019-08-13 10:25:31	2008-05-30 21:30:34
258918719	rsearch	20	https://github.com/kevinclark/rsearch	Search, in rust. Personal education project.	Rust	0	0	\N	0	2020-04-25 23:15:56	2020-12-08 04:04:51	2020-12-08 04:04:48
3243	ruby-kqueue	20	https://github.com/kevinclark/ruby-kqueue	KQueue bindings for Ruby. Long defunct. Just for posterity.	Ruby	4	0	\N	28	2008-03-09 23:11:24	2021-01-18 20:29:14	2008-04-03 00:04:36
244414869	shuffleboard	20	https://github.com/kevinclark/shuffleboard	A modern dashboard for FRC	\N	0	0	\N	0	2020-03-02 13:09:04	2020-03-02 13:09:06	2020-03-02 22:04:31
4148751	snake3	20	https://github.com/kevinclark/snake3	\N	JavaScript	1	0	\N	1	2012-04-26 11:55:47	2020-01-09 05:20:34	2012-04-26 12:04:31
3582580	15	21	https://github.com/technoweenie/15	\N	\N	2	0	\N	3	2012-02-29 11:53:49	2018-02-18 17:54:02	2012-03-16 19:24:05
3779940	activesupport_notifications_backport	21	https://github.com/technoweenie/activesupport_notifications_backport	\N	Ruby	2	0	\N	10	2012-03-20 17:56:35	2020-07-20 17:25:06	2015-02-13 16:27:11
2374	active_record_context	21	https://github.com/technoweenie/active_record_context	simple identity map for active record.  eager loading associations FTL	Ruby	4	0	\N	4	2008-03-04 01:44:14	2019-08-18 03:34:37	2008-03-26 16:43:39
2377	acts_as_versioned	21	https://github.com/technoweenie/acts_as_versioned	ActiveRecord plugin for versioning your models.	Ruby	161	17	\N	409	2008-03-04 01:49:32	2020-11-01 23:16:07	2020-12-08 01:19:49
25060	app_bootstrap	21	https://github.com/technoweenie/app_bootstrap	app:bootstrap rake task providing a command line menu to setup a rails app.  	Ruby	5	0	\N	29	2008-06-13 15:51:16	2019-08-13 10:26:42	2008-06-23 14:56:42
192404699	apub	21	https://github.com/technoweenie/apub	experimental golang package for parsing ActivityPub objects 	Go	0	0	\N	1	2019-06-17 16:16:14	2019-08-18 10:51:28	2019-06-19 19:19:07
36246592	assert	21	https://github.com/technoweenie/assert	Asserts to Go testing	Go	1	0	\N	2	2015-05-25 15:10:08	2018-02-18 17:54:25	2016-05-23 18:24:24
585087	astrotrain	21	https://github.com/technoweenie/astrotrain	email => http_post	Ruby	9	0	\N	28	2010-03-29 13:42:05	2020-07-20 17:21:05	2017-01-31 16:49:10
43	attachment_fu	21	https://github.com/technoweenie/attachment_fu	Treat an ActiveRecord model as a file attachment, storing its patch, size, content type, etc.	Ruby	311	36	\N	1019	2008-01-14 12:51:56	2021-01-05 06:43:08	2017-03-27 21:48:29
3113125	beautiful-docs	21	https://github.com/technoweenie/beautiful-docs	Pointers to useful, well-written, and otherwise beautiful documentation.	\N	2	0	\N	7	2012-01-05 18:43:17	2019-02-20 01:28:06	2012-01-05 18:44:51
41045793	blog	21	https://github.com/technoweenie/blog	Some notes on things I find interesting and important.	HTML	1	0	\N	1	2015-08-19 13:25:04	2018-02-18 17:54:46	2015-08-19 12:17:28
66007524	brew	21	https://github.com/technoweenie/brew	:beer: The missing package manager for OS X	Ruby	0	0	\N	1	2016-08-18 12:13:27	2018-02-18 17:54:50	2016-08-18 11:29:59
3583198	call-for-proposals	21	https://github.com/technoweenie/call-for-proposals	Want to make a talk proposal for EuRuKo 2012? This is the place to be!	\N	3	0	\N	3	2012-02-29 12:56:23	2018-02-18 17:54:54	2012-02-29 15:10:11
8793233	camo.go	21	https://github.com/technoweenie/camo.go	\N	Go	1	0	\N	4	2013-03-15 03:08:58	2018-02-18 17:54:59	2013-03-26 14:12:46
7135	can_search	21	https://github.com/technoweenie/can_search	Build common named scopes automatically, and provide a simple way to merge them with a single #search call.	Ruby	7	1	\N	95	2008-04-05 05:13:03	2019-08-13 10:22:36	2017-09-26 21:12:16
2873331	celluloid	21	https://github.com/technoweenie/celluloid	Concurrent objects for Ruby	Ruby	1	0	\N	2	2011-11-29 05:40:47	2018-02-18 17:55:09	2011-11-29 05:41:05
1419404	chat_gram	21	https://github.com/technoweenie/chat_gram	Barebones Instagram realtime endpoint for posting images to a chat service (Campfire).	Ruby	10	1	\N	19	2011-02-27 19:39:46	2020-07-20 17:24:51	2013-12-16 13:49:48
1025350	coffee-resque	21	https://github.com/technoweenie/coffee-resque	\N	CoffeeScript	44	5	\N	544	2010-10-26 10:45:07	2021-01-22 16:30:41	2015-10-02 07:47:01
796686	coffee-sprites	21	https://github.com/technoweenie/coffee-sprites	simple html 5 animation/sprites system heavily inspired by http://gamesinhtml5.blogspot.com/2010/07/game-in-progress-sprites-and-animation.html	JavaScript	3	0	\N	6	2010-07-25 12:45:26	2018-04-05 18:48:57	2010-07-25 12:46:10
71396	context_on_crack	21	https://github.com/technoweenie/context_on_crack	experimental macros for testing rails controllers.  port of rspec_on_rails_on_crack	\N	4	0	\N	11	2008-11-04 04:41:16	2019-08-13 10:40:50	2008-11-04 04:48:04
151188	cronwtf	21	https://github.com/technoweenie/cronwtf	silly cron => english translator	JavaScript	14	1	\N	93	2009-03-15 02:30:56	2019-08-13 11:09:27	2019-05-03 12:21:30
22359441	dangerroom	21	https://github.com/technoweenie/dangerroom	\N	Go	1	0	\N	7	2014-07-28 19:02:49	2019-08-13 12:47:12	2014-10-10 20:30:26
598176	dealer.js	21	https://github.com/technoweenie/dealer.js	\N	JavaScript	7	0	\N	21	2010-04-06 23:06:39	2021-01-13 16:28:39	2010-07-22 20:49:24
27607751	dummy-repo	21	https://github.com/technoweenie/dummy-repo	\N	\N	1	5	\N	1	2014-12-05 17:58:54	2018-02-18 17:55:41	2016-10-01 14:35:43
105	duplikate	21	https://github.com/technoweenie/duplikate	Syncs one directory to another (example: a git project to an svn repo)	Ruby	2	0	\N	23	2008-01-25 18:21:40	2019-08-13 10:21:20	2008-04-10 11:51:49
3599334	elixir-lang.github.com	21	https://github.com/technoweenie/elixir-lang.github.com	Website for Elixir	JavaScript	2	0	\N	2	2012-03-02 02:01:34	2018-02-18 17:55:49	2012-03-02 02:02:21
3599691	elixir-rubyports	21	https://github.com/technoweenie/elixir-rubyports	\N	Elixir	2	0	\N	4	2012-03-02 03:05:54	2018-02-18 17:55:53	2012-03-02 04:05:47
1298439	emoji-css-builder	21	https://github.com/technoweenie/emoji-css-builder	Quick Ruby rake task for generating CSS and tiled image for displaying emoji in browsers.	Ruby	4	0	\N	29	2011-01-27 07:13:16	2021-01-13 16:30:43	2011-01-27 07:24:11
14824908	etcd	21	https://github.com/technoweenie/etcd	A highly-available key value store for shared configuration and service discovery	Go	0	0	\N	1	2013-11-30 15:09:31	2018-08-27 22:25:29	2013-12-02 11:44:01
617923	fab	21	https://github.com/technoweenie/fab	a javascript DSL for building async web apps	JavaScript	2	0	\N	3	2010-04-19 12:11:36	2018-02-18 17:56:06	2010-09-24 21:36:53
20005399	bingo	22	https://github.com/macournoyer/bingo	Bingo: An easy to learn programming language for first timers	JavaScript	0	0	\N	1	2014-05-20 23:36:34	2020-07-10 11:18:24	2015-01-19 13:37:39
6603281	cache_digests	22	https://github.com/macournoyer/cache_digests	\N	Ruby	1	0	\N	1	2012-11-08 19:00:51	2018-02-18 18:09:39	2012-11-08 19:41:50
551544	confoo	22	https://github.com/macournoyer/confoo	My Confoo.ca presentation: How to kick assess with asynchronous processing	Ruby	0	0	\N	6	2010-03-07 18:26:05	2014-05-15 04:21:02	2010-03-11 23:36:33
212097	em-spec	22	https://github.com/macournoyer/em-spec	Simple BDD API for testing asynchronous Ruby/EventMachine code	Ruby	1	0	\N	3	2009-05-27 21:55:11	2019-08-13 11:26:07	2009-05-27 21:59:54
8736610	eventmachine	22	https://github.com/macournoyer/eventmachine	EventMachine: fast, simple event-processing library for Ruby programs	Ruby	1	0	\N	1	2013-03-12 16:36:39	2018-08-10 10:47:58	2013-03-12 17:08:00
12608121	fast_output_buffer	22	https://github.com/macournoyer/fast_output_buffer	A faster output buffer for ActionView.	C	2	0	\N	22	2013-09-05 00:10:57	2018-04-25 16:16:37	2013-09-05 14:51:05
2640495	faye	22	https://github.com/macournoyer/faye	Simple pub/sub messaging for the web	JavaScript	0	0	\N	2	2011-10-24 23:27:19	2018-02-18 18:09:59	2011-10-25 00:09:23
265153	gh-contest	22	https://github.com/macournoyer/gh-contest	\N	Ruby	0	0	\N	2	2009-07-30 18:27:03	2018-02-18 18:10:03	2009-07-30 18:43:39
18243904	html_ruby	22	https://github.com/macournoyer/html_ruby	simple html language template	Ruby	1	0	\N	1	2014-03-29 12:20:56	2018-02-18 18:10:07	2014-03-29 12:44:37
154888792	hyper-proxy	22	https://github.com/macournoyer/hyper-proxy	A proxy connector for Hyper-based crates	Rust	0	0	\N	0	2018-10-26 17:11:44	2018-10-26 17:11:46	2018-09-25 03:28:26
104475	iolounge	22	https://github.com/macournoyer/iolounge	My personal casual comforting place to play w/ Io	\N	1	0	\N	2	2009-01-09 23:22:17	2019-08-13 10:52:38	2009-01-09 23:22:22
217626	is_taggable	22	https://github.com/macournoyer/is_taggable	Tagging that doesn't want to be on steroids. It's skinny and happy to stay that way	Ruby	1	0	\N	3	2009-06-03 14:33:37	2018-02-18 18:10:19	2009-06-03 14:46:19
320438236	language-liquid	22	https://github.com/macournoyer/language-liquid	Liquid language support for Atom.	\N	0	0	\N	0	2020-12-10 22:50:52	2020-12-10 23:05:32	2020-12-10 23:05:30
4847140	libuv	22	https://github.com/macournoyer/libuv	platform layer for node.js	C	0	0	\N	2	2012-06-30 22:57:56	2019-04-02 14:41:13	2012-06-29 22:27:40
320443864	linguist	22	https://github.com/macournoyer/linguist	Language Savant. If your repository's language is being reported incorrectly, send us a pull request!	\N	0	0	\N	0	2020-12-10 23:20:50	2020-12-10 23:20:53	2020-12-11 07:54:18
59438	llvmruby	22	https://github.com/macournoyer/llvmruby	LLVM bindings for Ruby	Ruby	0	0	\N	8	2008-10-04 01:16:07	2019-11-04 17:29:55	2008-10-24 00:20:59
94393	macournoyer.github.com	22	https://github.com/macournoyer/macournoyer.github.com	ze github pages of mine	\N	0	0	\N	3	2008-12-20 11:51:48	2019-08-13 10:49:10	2008-12-21 01:32:32
18455	meshu	22	https://github.com/macournoyer/meshu	MeshU presentation	Ruby	0	0	\N	3	2008-05-20 21:17:31	2019-08-13 10:24:56	2008-05-20 21:21:42
97394	min	22	https://github.com/macournoyer/min	The Min language	Java	12	0	\N	99	2008-12-28 04:56:31	2020-11-24 21:02:56	2014-07-18 11:58:24
866	mor7	22	https://github.com/macournoyer/mor7	My Montreal on Rails 7 presentation of Thin	Ruby	0	0	\N	3	2008-02-20 15:59:41	2019-08-13 10:21:27	2008-03-26 16:17:36
3202538	mtlrb-jan12	22	https://github.com/macournoyer/mtlrb-jan12	Montreal.rb January 2012 presentation on creating an homoiconic programming language in < 150 LOC.	Ruby	1	0	\N	4	2012-01-17 17:52:20	2018-02-18 18:10:51	2012-01-18 11:52:10
386983	mysql_s3_backup	22	https://github.com/macournoyer/mysql_s3_backup	A simple backup script for Mysql and S3 with incremental backups.	Ruby	6	0	\N	22	2009-11-26 21:01:51	2019-02-12 18:42:43	2009-11-27 01:55:08
389927	nanodb	22	https://github.com/macournoyer/nanodb	an ultra tiny db	\N	4	0	\N	16	2009-11-30 05:18:38	2019-08-13 11:29:33	2009-11-30 05:19:08
44709583	neuralconvo	22	https://github.com/macournoyer/neuralconvo	Neural conversational model in Torch	Lua	361	26	\N	773	2015-10-21 21:08:43	2021-01-25 04:50:51	2019-05-31 05:42:14
75564576	nn.rb	22	https://github.com/macournoyer/nn.rb	A toy Neural Network in Ruby	Ruby	3	1	\N	21	2016-12-04 19:06:54	2019-04-22 15:21:11	2017-10-17 14:13:24
473972	node-cusec	22	https://github.com/macournoyer/node-cusec	node.js CUSEC 2010 presentation stuff	JavaScript	0	0	\N	4	2010-01-15 16:26:00	2014-05-01 12:55:43	2010-01-23 01:27:30
5497901	node-syscalls	22	https://github.com/macournoyer/node-syscalls	Node wrapper to some UNIX syscalls. Used during http://truthabouteventloops.com/.	C++	0	0	\N	5	2012-08-21 13:37:25	2019-11-15 09:00:13	2018-06-30 21:23:22
66150	orange	22	https://github.com/macournoyer/orange	Yummy & juicy compiler	Ruby	2	0	\N	56	2008-10-22 02:56:59	2020-12-05 20:52:07	2008-10-29 01:08:28
145007	peg	22	https://github.com/macournoyer/peg	fork of peg/leg	C	0	0	\N	5	2009-03-07 01:27:08	2019-08-13 11:07:16	2009-04-05 00:43:57
1340328	Brief	23	https://github.com/takeo/Brief	Brief is a Chat Style for Skype 5 on OS X.	JavaScript	1	0	\N	2	2011-02-07 23:19:49	2018-02-18 17:50:20	2011-02-14 16:49:18
52129238	ChromeAutoTextExpander	23	https://github.com/takeo/ChromeAutoTextExpander	Google Chrome Extension : Auto Text Expander - listens for keypresses on pages that support it and will auto-replace text as you type. Keywords: javascript jquery chrome text expander replacement.	JavaScript	1	0	\N	2	2016-02-19 23:06:36	2018-02-18 17:50:24	2016-03-03 00:53:48
696175	GoogleAnalyticsProxy	23	https://github.com/takeo/GoogleAnalyticsProxy	A JavaScript proxy class for Google Analytics, which allows you to test event tracking in development mode.	JavaScript	1	0	\N	2	2010-05-31 18:56:35	2018-02-18 17:50:30	2009-11-01 16:55:21
12777	googlecharts	23	https://github.com/takeo/googlecharts	Sexy Charts using Google API & Ruby	Ruby	1	0	\N	4	2008-04-27 01:19:08	2019-08-13 10:23:38	2008-05-09 03:31:09
29680	jquery-hotkeys	23	https://github.com/takeo/jquery-hotkeys	jQuery hotkeys plugin.	\N	1	0	\N	2	2008-06-29 06:11:50	2019-08-13 10:27:54	2008-06-29 06:17:07
730019	laterstars-for-safari	23	https://github.com/takeo/laterstars-for-safari	A Safari extension to replace the Laterstars one-click fave bookmarklet	JavaScript	1	0	\N	2	2010-06-19 23:10:30	2018-02-18 17:50:42	2010-06-20 18:18:37
11516896	MooTune	23	https://github.com/takeo/MooTune	A MooTools class for logging events, errors and AB tests to multiple backends such as Google Analytics, Mixpanel or your own server logs.	JavaScript	1	0	\N	1	2013-07-18 21:34:14	2018-02-18 17:50:46	2013-09-03 19:56:36
494173	MooZoom	23	https://github.com/takeo/MooZoom	An image zoomer for MooTools	JavaScript	1	0	\N	2	2010-01-29 18:27:35	2018-02-18 17:50:50	2010-01-08 20:22:19
45642	outlook-with-attitude	23	https://github.com/takeo/outlook-with-attitude	Turning Outlook Web Access from a Gent to a G	JavaScript	4	2	\N	7	2008-08-25 00:35:03	2019-08-13 10:32:47	2008-11-13 19:22:34
136044	permanent_records	23	https://github.com/takeo/permanent_records	Rails Plugin - soft-delete your ActiveRecord records with a deleted_at timestamp.  This is a much more explicit version of ActsAsParanoid	Ruby	1	0	\N	2	2009-02-24 02:30:11	2019-08-13 11:03:29	2008-07-05 01:27:39
27650176	rdify	23	https://github.com/takeo/rdify	A simple chrome extension to forward open.spotify links to rdio	JavaScript	1	0	\N	1	2014-12-06 19:46:22	2018-02-18 17:51:03	2012-04-25 18:57:10
3022566	redmine_client	23	https://github.com/takeo/redmine_client	Redmine API client	Ruby	1	0	\N	3	2011-12-20 19:11:56	2018-02-18 17:51:12	2011-12-20 19:36:56
109243	select-autocompleter	23	https://github.com/takeo/select-autocompleter	MooTools plugin to create editable select tags	JavaScript	1	0	\N	2	2009-01-17 06:22:09	2019-08-13 10:54:17	2009-01-18 03:16:46
50206681	starter-ruby-bot	23	https://github.com/takeo/starter-ruby-bot	A simple Beep Boop ready starter project in Ruby 	Ruby	1	0	\N	2	2016-01-22 18:48:13	2018-02-18 17:51:20	2016-01-22 18:50:18
39090	steezy-pibb	23	https://github.com/takeo/steezy-pibb	Makes Pibb+Fluid one hell of a steez.	JavaScript	0	0	\N	2	2008-08-01 01:26:22	2019-08-13 10:30:33	2008-11-03 17:12:30
7292051	takeo.github.com	23	https://github.com/takeo/takeo.github.com	takeo.me website	JavaScript	1	1	\N	1	2012-12-23 03:15:01	2018-02-18 17:51:30	2013-03-06 01:06:09
503213	TextboxList	23	https://github.com/takeo/TextboxList	MooTools tokenizer	JavaScript	1	0	\N	2	2010-02-04 22:56:55	2018-02-18 17:51:34	2009-12-10 09:23:00
2535600	ValidateSimple	23	https://github.com/takeo/ValidateSimple	Simple form validation with good UX for MooTools	JavaScript	1	0	\N	2	2011-10-07 19:06:50	2018-02-18 17:51:38	2011-10-19 16:39:05
5515698	warden	23	https://github.com/takeo/warden	General Rack Authentication Framework	Ruby	1	0	\N	1	2012-08-22 18:36:39	2018-03-22 17:18:03	2012-06-16 09:24:09
234451329	airstream	25	https://github.com/caged/airstream	Color tools plugin for Figma	JavaScript	0	4	\N	2	2020-01-16 23:09:47	2020-04-13 14:24:07	2020-07-19 04:54:57
137798	aixmlserialize	25	https://github.com/caged/aixmlserialize	Aims to convert to and from NSXMLDocuments and NSDictionarys on the iPhone (using KissXML) and OS X.	Objective-C	3	0	\N	11	2009-02-25 21:46:19	2019-08-13 11:04:05	2009-03-08 19:29:49
1615857	asset	25	https://github.com/caged/asset	little asset manager for lazy people. written with node 	JavaScript	1	0	\N	3	2011-04-14 16:31:47	2019-07-14 14:15:36	2011-05-24 16:03:09
136747284	attractor	25	https://github.com/caged/attractor	\N	JavaScript	0	0	\N	1	2018-06-09 15:15:04	2018-10-09 04:48:57	2018-06-09 15:15:18
51460686	bash-test	25	https://github.com/caged/bash-test	\N	Shell	0	0	\N	1	2016-02-10 16:11:56	2018-02-18 17:58:29	2016-02-10 16:15:21
118284781	basketball-stats	25	https://github.com/caged/basketball-stats	\N	Jupyter Notebook	0	0	\N	1	2018-01-20 20:10:42	2019-04-25 16:10:45	2018-01-29 00:18:38
7313553	bbref-graphs	25	https://github.com/caged/bbref-graphs	Chrome extension to convert tables of statistics to charts on http://basketball-reference.com	JavaScript	2	1	\N	2	2012-12-25 01:06:19	2019-04-25 16:10:42	2012-12-30 17:39:32
270869210	budget	25	https://github.com/caged/budget	A look at Portland, Oregon's city budget over the years	JavaScript	0	0	\N	1	2020-06-08 21:59:54	2020-06-12 14:05:35	2020-06-08 22:11:46
66773693	canvas-examples	25	https://github.com/caged/canvas-examples	just a scratchpad for canvas experiments	JavaScript	0	0	\N	1	2016-08-28 11:49:45	2018-02-18 17:58:46	2017-08-16 00:24:10
144359336	canvas-sketch	25	https://github.com/caged/canvas-sketch	[beta] A framework for making generative artwork in JavaScript and the browser.	JavaScript	0	0	\N	0	2018-08-11 02:50:39	2018-08-11 12:52:55	2018-08-11 12:52:53
38092994	cartile	25	https://github.com/caged/cartile	\N	JavaScript	0	0	\N	1	2015-06-26 02:42:15	2018-02-18 17:58:50	2015-06-27 22:26:13
13907055	census-tools	25	https://github.com/caged/census-tools	Tools for working with NHGIS (https://www.nhgis.org) census data.	Shell	0	0	\N	1	2013-10-27 15:42:20	2018-02-18 17:58:54	2015-06-17 00:38:54
14038218	cfb-recruiting	25	https://github.com/caged/cfb-recruiting	\N	Ruby	0	0	\N	1	2013-11-01 05:48:50	2018-02-18 17:58:58	2015-11-20 18:00:08
312407642	choochoo	25	https://github.com/caged/choochoo	\N	HTML	0	0	\N	0	2020-11-12 19:08:40	2020-11-12 20:11:07	2020-11-12 20:11:04
30319091	choropleth	25	https://github.com/caged/choropleth	Quickly create choropleth map images from topojson data	JavaScript	0	0	\N	1	2015-02-04 18:20:05	2018-02-18 17:59:02	2015-02-04 19:34:59
131945394	city-gen	25	https://github.com/caged/city-gen	\N	Shell	0	0	\N	0	2018-05-03 02:22:31	2018-05-03 13:13:34	2018-05-03 13:13:32
89715259	citylist	25	https://github.com/caged/citylist	\N	Python	0	0	\N	1	2017-04-28 11:43:18	2018-02-18 17:59:06	2017-06-06 17:32:06
40424533	civil-rights	25	https://github.com/caged/civil-rights	A look into education-based civil rights data for public schools released by the US Department of Education U.S. Department of Education.	Makefile	0	0	\N	1	2015-08-09 00:50:25	2018-02-18 17:59:11	2015-08-09 00:54:51
120890	cocos2d-game	25	https://github.com/caged/cocos2d-game	Xcode Template for cocos2d-based iPhone games.  Includes cocos2d 0.6.3 & the Chipmunk physics engine.	Objective-C	2	0	\N	16	2009-02-03 16:50:59	2019-08-13 10:58:13	2009-02-03 17:09:03
67446443	color-wander	25	https://github.com/caged/color-wander	:art: Generative artwork in node/browser based on a seeded random	JavaScript	0	0	\N	1	2016-09-05 16:39:21	2018-07-22 23:40:16	2016-09-05 23:49:53
1988700	compass	25	https://github.com/caged/compass	Compass is a Stylesheet Authoring Environment that makes your website design simpler to implement and easier to maintain.	Ruby	0	0	\N	2	2011-07-02 16:01:25	2018-02-18 17:59:36	2011-07-02 17:27:41
232838	concurrent-nsoperation	25	https://github.com/caged/concurrent-nsoperation	Concurrent NSOperation Sample	Objective-C	1	0	\N	7	2009-06-21 16:39:09	2018-03-14 19:55:33	2011-05-03 17:59:58
42401888	construction	25	https://github.com/caged/construction	\N	Makefile	0	0	\N	1	2015-09-13 12:49:12	2018-02-18 17:59:46	2015-09-18 13:25:41
20005691	council-report	25	https://github.com/caged/council-report	Fetch and parse Portland City Council data	Ruby	4	0	\N	4	2014-05-20 23:47:09	2018-02-18 17:59:50	2014-05-31 17:06:15
36240566	county-stat	25	https://github.com/caged/county-stat	Experiment for exploring aggregate census data.  Counties-only for now.	JavaScript	0	0	\N	3	2015-05-25 13:03:44	2018-02-18 17:59:54	2015-06-17 00:40:31
21328459	csv2psql	25	https://github.com/caged/csv2psql	Converts a CSV file into a PostgreSQL table	Python	2	0	\N	1	2014-06-29 14:37:07	2018-02-18 17:59:58	2014-06-29 14:53:58
4730073	cubism	25	https://github.com/caged/cubism	Cubism.js: A JavaScript library for time series visualization.	JavaScript	0	0	\N	3	2012-06-20 15:58:11	2018-02-18 18:00:03	2015-03-10 13:52:52
1569206	d3	25	https://github.com/caged/d3	A JavaScript visualization library for HTML and SVG.	JavaScript	0	0	\N	3	2011-04-04 18:20:34	2019-07-14 14:15:36	2012-11-16 18:25:38
34823784	d3-grid	25	https://github.com/caged/d3-grid	D3 grid layout	\N	0	0	\N	1	2015-04-29 20:32:40	2018-02-18 18:00:12	2015-04-29 20:45:36
12900888	d3-plugins	25	https://github.com/caged/d3-plugins	A repository for sharing D3.js plugins.	JavaScript	1	0	\N	3	2013-09-17 13:40:27	2018-02-18 18:00:21	2013-08-22 01:53:51
24363	ar_fixtures	26	https://github.com/topfunky/ar_fixtures	Dumps YAML fixtures from existing data using ActiveRecord	Ruby	24	3	\N	68	2008-06-11 13:37:27	2019-08-13 10:26:33	2008-11-13 19:06:55
52452	basic_model	26	https://github.com/topfunky/basic_model	A very thin wrapper around CouchRest, for use with CouchDB and Ruby on Rails.	Ruby	12	2	\N	51	2008-09-14 01:55:19	2019-08-13 10:35:06	2008-09-14 02:28:24
1441793	bigapp	26	https://github.com/topfunky/bigapp	An application with many files. For testing only.	Ruby	1	0	\N	2	2011-03-04 21:50:18	2014-06-15 00:36:09	2011-03-04 21:50:41
68860702	blog-comments	26	https://github.com/topfunky/blog-comments	Issues and comments related to the blog at https://www.topfunky.com	\N	0	1	\N	2	2016-09-21 18:52:53	2018-02-18 18:15:35	2016-09-21 18:52:53
74011	calendar_helper	26	https://github.com/topfunky/calendar_helper	Calendar-generating plugin for Ruby	Ruby	97	2	\N	376	2008-11-10 17:56:22	2021-01-15 09:42:59	2014-12-29 09:57:40
323654	cappuccino-couchdb	26	https://github.com/topfunky/cappuccino-couchdb	A class for working with CouchDB documents from Cappuccino/Objective-J	Objective-J	6	0	\N	65	2009-10-01 14:22:52	2020-04-24 09:52:29	2009-10-12 02:13:16
665476	CocoaHelpDemo	26	https://github.com/topfunky/CocoaHelpDemo	Demo application for generating bundled help documentation (requires Flying Meat's VoodoPad application)	Objective-C	1	0	\N	4	2010-05-13 19:31:48	2012-12-14 14:50:48	2010-05-13 19:32:02
11537130	css_graphs	26	https://github.com/topfunky/css_graphs	Rails plugin for making HTML markup to display a bar graph.	Ruby	1	0	\N	1	2013-07-19 18:02:01	2018-02-18 18:18:41	2013-07-19 18:03:15
3642919	demo-mocha-watch-bug	26	https://github.com/topfunky/demo-mocha-watch-bug	A demo to show a bug in mocha's --watch option	JavaScript	1	0	\N	2	2012-03-06 18:34:29	2014-04-27 05:59:32	2012-03-06 18:43:00
3802284	demo-simplest-socket-io	26	https://github.com/topfunky/demo-simplest-socket-io	Very simple socket.io demo.	JavaScript	3	1	\N	5	2012-03-22 17:55:36	2018-02-18 18:19:30	2012-03-22 17:57:07
135780120	demo-terraform-101	26	https://github.com/topfunky/demo-terraform-101	Before and after demo code for the Terraform Introduction training course	JavaScript	0	0	\N	0	2018-06-01 23:19:39	2018-06-01 23:19:41	2018-06-24 16:56:55
3542282	demo-vows-callbacks	26	https://github.com/topfunky/demo-vows-callbacks	A demo for Rob Conery. Nothing to see here.	CoffeeScript	1	0	\N	2	2012-02-25 02:01:20	2013-12-04 22:42:29	2012-02-25 02:11:56
104242308	exercism-projects	26	https://github.com/topfunky/exercism-projects	My personal exercises on exercism.io for learning new languages	Go	0	0	\N	1	2017-09-20 13:46:07	2018-02-18 18:19:51	2017-10-12 04:25:02
3435773	geddy-coffee-script-demo	26	https://github.com/topfunky/geddy-coffee-script-demo	Demo app using CoffeeScript with the Geddy web framework for Node.js	JavaScript	1	0	\N	5	2012-02-13 22:47:27	2018-02-18 18:19:59	2012-02-13 23:03:24
321865049	gghighcontrast	26	https://github.com/topfunky/gghighcontrast	A high contrast theme to use with the ggplot library for R	R	0	0	\N	0	2020-12-16 01:12:45	2020-12-31 19:42:41	2020-12-31 19:42:39
10110495	gitignore	26	https://github.com/topfunky/gitignore	A collection of useful .gitignore templates	\N	1	0	\N	0	2013-05-16 18:03:44	2013-08-18 09:14:24	2013-01-24 18:40:21
175087970	golang-samples	26	https://github.com/topfunky/golang-samples	Sample apps and code written for Google Cloud in the Go programming language.	Go	0	0	\N	0	2019-03-11 18:40:03	2019-07-16 05:11:49	2019-03-11 18:03:28
95217	good_form_builder	26	https://github.com/topfunky/good_form_builder	Form builder for Rails based on Khoi Vinh's Good Form.	Ruby	1	0	\N	16	2008-12-22 06:13:55	2019-08-13 10:49:28	2009-03-03 01:46:36
14278	google-checkout	26	https://github.com/topfunky/google-checkout	Experimental Google Checkout gem	Ruby	24	0	\N	61	2008-05-03 14:07:50	2020-07-01 17:11:13	2012-09-24 13:02:17
3542	gruff	26	https://github.com/topfunky/gruff	Gruff graphing library for Ruby	Ruby	228	49	\N	1163	2008-03-11 19:06:00	2021-01-26 12:40:08	2020-12-28 03:22:36
15156031	hello-demo	26	https://github.com/topfunky/hello-demo	Simple Node.js project for demonstrating integration with a CI server.	JavaScript	1	1	\N	1	2013-12-13 03:59:58	2020-05-24 15:49:27	2013-12-20 22:33:20
199473611	HelloPluralsightProject	26	https://github.com/topfunky/HelloPluralsightProject	Demonstration on how projects work at Pluralsight.	JavaScript	0	0	\N	0	2019-07-29 11:55:40	2019-07-29 11:58:17	2019-07-29 11:58:14
1211486	help.github.com	26	https://github.com/topfunky/help.github.com	GitHub help guides	JavaScript	1	0	\N	2	2010-12-31 18:51:07	2014-02-06 00:22:32	2010-12-31 19:01:43
95431	hodel_3000_compliant_logger	26	https://github.com/topfunky/hodel_3000_compliant_logger	Alternate logger for Rails that emits syslog-style output. For use with pl_analyze gem.	Ruby	13	3	\N	44	2008-12-22 17:31:13	2019-08-13 10:49:31	2020-02-29 05:29:47
118996	hpple	26	https://github.com/topfunky/hpple	An XML/HTML parser for Objective-C, inspired by Hpricot.	Objective-C	483	39	\N	2766	2009-01-31 22:00:26	2021-01-30 07:56:13	2020-05-29 11:45:08
82326914	HTMLPortfolioProject	26	https://github.com/topfunky/HTMLPortfolioProject	Code School Project: HTML + CSS Portfolio	JavaScript	0	0	\N	0	2017-02-17 16:37:31	2017-02-17 16:37:33	2017-02-16 02:19:20
886254	JSLint.tmbundle	26	https://github.com/topfunky/JSLint.tmbundle	The easiest way to syntax check your JavaScript code from TextMate	JavaScript	1	1	\N	15	2010-09-03 14:52:43	2017-05-22 22:40:17	2010-09-03 15:16:40
143462741	katacoda-dev	26	https://github.com/topfunky/katacoda-dev	Experiments with interactive Katacoda tutorials	Makefile	0	0	\N	1	2018-08-03 15:53:35	2020-06-15 20:48:17	2020-06-15 20:48:14
331841667	launchbar-bluetooth-devices	26	https://github.com/topfunky/launchbar-bluetooth-devices	A LaunchBar action to [dis]connect your bluetooth device with a few keypress	JavaScript	0	0	\N	0	2021-01-22 02:02:24	2021-01-22 02:07:52	2021-01-22 02:07:50
301891478	learn-terraform-provision-eks-cluster	26	https://github.com/topfunky/learn-terraform-provision-eks-cluster	\N	\N	0	0	\N	0	2020-10-06 21:53:52	2020-10-06 21:53:54	2020-10-06 21:55:13
5309981	ansible	27	https://github.com/anotherjesse/ansible	Michael's copy of Ansible.  Model-driven configuration management, multi-node deployment, and remote task execution system.   Fork github.com/ansible/ansible instead!	Python	0	0	\N	1	2012-08-06 01:10:22	2020-01-14 10:29:06	2012-11-03 14:16:15
10428072	ansible-playbook-gitlab	27	https://github.com/anotherjesse/ansible-playbook-gitlab	Playbook for installing GitLab 5.1 on Debian unstable	\N	1	0	\N	1	2013-06-01 17:30:11	2018-02-18 17:34:36	2013-04-23 18:07:56
5333218	ansible.github.com	27	https://github.com/anotherjesse/ansible.github.com	ansible.github.com web site	JavaScript	1	0	\N	0	2012-08-07 17:34:36	2020-01-09 12:56:52	2012-08-07 19:49:20
205897834	barb	27	https://github.com/anotherjesse/barb	\N	JavaScript	0	0	\N	1	2019-09-02 13:39:59	2020-01-09 12:56:35	2019-09-02 14:30:51
326479	bb-site	27	https://github.com/anotherjesse/bb-site	Book Burro website (couchdb+sinatra)	Ruby	4	0	\N	5	2009-10-04 16:18:35	2020-01-09 05:20:33	2010-01-06 20:13:16
38046	beboist	27	https://github.com/anotherjesse/beboist	A Rails plugin to work with the Bebo API	Ruby	2	0	\N	2	2008-07-28 20:46:29	2019-08-13 10:30:14	2008-07-28 20:47:47
270437	big-brother	27	https://github.com/anotherjesse/big-brother	use the iSight camera to remind you that you are being watched	Python	1	0	\N	2	2009-08-06 03:21:35	2014-02-20 04:43:45	2009-08-06 14:49:50
325175	bookburro	27	https://github.com/anotherjesse/bookburro	Book Burro for Firefox	JavaScript	8	0	\N	16	2009-10-02 21:57:30	2020-09-19 02:59:15	2010-03-28 19:59:06
28357	caltrain	27	https://github.com/anotherjesse/caltrain	source of caltrainapp.com	JavaScript	2	0	\N	2	2008-06-24 20:18:43	2019-08-13 10:27:32	2008-06-25 04:06:04
484808	chrome-s3	27	https://github.com/anotherjesse/chrome-s3	chrome extension to browse Amazon S3	JavaScript	14	0	\N	5	2010-01-23 03:16:59	2018-02-18 17:35:11	2011-06-26 00:27:12
486177	chromr	27	https://github.com/anotherjesse/chromr	flickr new tab ui	\N	4	0	\N	6	2010-01-24 08:54:16	2018-02-18 17:35:15	2010-01-27 21:07:29
5954569	cloudenvy	27	https://github.com/anotherjesse/cloudenvy	\N	Python	1	0	\N	1	2012-09-25 15:33:52	2018-02-18 17:35:20	2012-09-25 04:44:28
306157	Cointoss-Ruby	27	https://github.com/anotherjesse/Cointoss-Ruby	Port of cointoss.wakingideas.com to ruby	Ruby	1	0	\N	1	2009-09-13 22:19:02	2020-01-09 12:43:32	2009-09-13 22:31:23
70666	contacts	27	https://github.com/anotherjesse/contacts	rails 2.1 + sproutcore	Ruby	2	0	\N	4	2008-11-02 08:17:48	2020-01-09 08:53:48	2008-11-02 09:01:31
3004375	cuisine	27	https://github.com/anotherjesse/cuisine	Chef-like functionality for Fabric	Python	1	0	\N	1	2011-12-18 01:30:21	2020-01-09 08:53:46	2011-12-04 14:37:12
1810684	dotfiles	27	https://github.com/anotherjesse/dotfiles	\N	Emacs Lisp	1	0	\N	3	2011-05-27 13:48:17	2018-02-18 17:35:36	2014-12-01 02:35:30
25578	droplet	27	https://github.com/anotherjesse/droplet	rain drops of music from the cloud	\N	1	0	\N	3	2008-06-15 22:48:17	2020-01-09 08:53:47	2008-06-15 22:49:47
902	elasticfox	27	https://github.com/anotherjesse/elasticfox	ec2 extension for firefox	JavaScript	3	1	\N	9	2008-02-21 07:02:53	2019-08-13 10:21:29	2008-03-26 16:17:54
262956903	electron_phoenix_boilerplate	27	https://github.com/anotherjesse/electron_phoenix_boilerplate	Is embedding an elixir application inside of an Electron desktop app a terrible idea?	Elixir	0	0	\N	0	2020-05-11 03:25:04	2020-05-11 03:26:00	2020-05-11 03:25:57
574337	erlanguniversity	27	https://github.com/anotherjesse/erlanguniversity	hacking during kevin smith's web+erlang course	Erlang	1	0	\N	3	2010-03-22 14:27:49	2020-01-09 08:53:44	2010-03-23 14:16:22
419983	erlws	27	https://github.com/anotherjesse/erlws	b	Erlang	1	0	\N	5	2009-12-11 15:43:35	2018-02-18 17:35:52	2009-12-11 18:19:28
555495	etherpad	27	https://github.com/anotherjesse/etherpad	Madriska's fork of Etherpad with PostgreSQL support.	Java	2	0	\N	3	2010-03-10 03:32:14	2012-12-14 00:11:09	2010-03-11 04:13:04
249535	euler	27	https://github.com/anotherjesse/euler	my project euler solutions	Ruby	1	0	\N	3	2009-07-12 20:02:01	2020-01-09 05:20:54	2009-08-09 15:31:41
429	exception_logger	27	https://github.com/anotherjesse/exception_logger	our hacks to exception_logger	Ruby	3	0	\N	5	2008-01-14 01:32:19	2020-02-10 22:31:33	2008-03-26 16:14:14
600	finally	27	https://github.com/anotherjesse/finally	\N	JavaScript	2	0	\N	6	2008-02-15 21:06:02	2019-08-13 10:21:25	2008-03-26 16:15:17
27233	firenomics	27	https://github.com/anotherjesse/firenomics	Firenomics is a place to find and share awesome extensions. 	Python	6	0	\N	11	2008-06-21 01:23:58	2020-01-09 08:53:51	2009-05-17 20:18:03
136085	flashlitebox	27	https://github.com/anotherjesse/flashlitebox	Full screen "lightbox" in flash in under 1KB	ActionScript	2	0	\N	8	2009-02-24 03:56:10	2020-01-09 08:53:50	2009-02-24 06:15:12
468049	fluidium	27	https://github.com/anotherjesse/fluidium	A Native Mac OS X Browser Platform based on WebKit with a Cocoa plug-in architecture, tab thumbnails, web splitviews, userscripting, userstyles, URL shortcuts, Twitter timelines, Sparkle Update, Growl, JS Dock Badge API, more.	Objective-C	1	0	\N	2	2010-01-11 20:13:15	2020-01-09 08:35:28	2010-01-11 04:44:49
49814	fobliki	27	https://github.com/anotherjesse/fobliki	Forum, Blog, Wiki for AppEngine	Python	5	0	\N	12	2008-09-06 02:36:29	2020-01-09 11:26:44	2008-09-06 02:43:55
56	fotomatic	27	https://github.com/anotherjesse/fotomatic	Flash photo widget prototype - hacked at last SHDH of 2007	ActionScript	3	0	\N	11	2008-01-15 06:22:24	2021-01-23 07:19:54	2008-03-26 16:09:10
2064323	Carousel	28	https://github.com/roland/Carousel	Monotouch Carousel	\N	1	0	\N	5	2011-07-18 00:34:10	2018-09-02 19:22:53	2011-07-18 00:41:34
13734705	formflow	28	https://github.com/roland/formflow	FormFlow	JavaScript	1	0	\N	1	2013-10-21 04:36:11	2018-02-18 17:46:54	2013-10-22 03:17:54
3664937	HttpBuildQuery	28	https://github.com/roland/HttpBuildQuery	Equivalent of http_build_query in PHP	C#	2	2	\N	6	2012-03-08 19:11:04	2019-08-09 07:22:50	2017-08-16 18:14:21
48835316	SHFB	28	https://github.com/roland/SHFB	Sandcastle Help File Builder (SHFB).  A standalone GUI, Visual Studio integration package, and MSBuild tasks providing full configuration and extensibility for building help files with the Sandcastle tools.	C#	0	0	\N	1	2015-12-31 03:36:51	2018-02-18 17:47:02	2015-12-29 04:33:09
3986723	ShowTracker	28	https://github.com/roland/ShowTracker	An Android App to manage your TV Shows	Java	1	0	\N	2	2012-04-10 17:25:29	2020-09-22 13:03:08	2012-04-10 17:32:47
43979131	silentauction-php	28	https://github.com/roland/silentauction-php	\N	PHP	0	0	\N	1	2015-10-09 17:40:52	2018-02-18 17:47:10	2015-10-09 18:00:55
3008991	TestServiceStackService	28	https://github.com/roland/TestServiceStackService	\N	C#	1	0	\N	2	2011-12-18 22:54:39	2018-02-18 17:47:14	2011-12-19 01:11:28
157126519	audio-super-res	29	https://github.com/lukas/audio-super-res	Audio super resolution using neural networks	Python	1	0	\N	0	2018-11-11 20:16:02	2018-11-11 20:27:27	2018-11-11 20:27:26
122422894	basic-yolo-keras	29	https://github.com/lukas/basic-yolo-keras	Easy training on custom dataset. Various backends (MobileNet and SqueezeNet) supported. A YOLO demo to detect raccoon run entirely in brower is accessible at https://git.io/vF7vI (not on Windows).	Jupyter Notebook	0	0	\N	0	2018-02-21 23:52:29	2018-02-21 23:52:31	2018-02-10 17:20:55
142578563	car-project	29	https://github.com/lukas/car-project	\N	\N	0	0	\N	0	2018-07-27 10:08:20	2018-07-27 10:08:20	2018-07-27 10:08:20
185886446	catz	29	https://github.com/lukas/catz	A machine learning contest to predict the behavior of catz	Python	2	0	\N	0	2019-05-09 20:40:05	2019-05-12 22:21:29	2019-05-12 22:21:27
144174773	colorizer	29	https://github.com/lukas/colorizer	\N	Python	17	1	\N	1	2018-08-09 12:57:14	2020-12-16 11:37:24	2019-05-29 23:44:27
68656631	container-demo	29	https://github.com/lukas/container-demo	\N	HTML	0	0	\N	1	2016-09-19 20:59:38	2018-02-18 18:22:39	2016-09-19 21:01:11
96162235	demo	29	https://github.com/lukas/demo	ML Demo	Python	0	0	\N	1	2017-07-03 22:10:41	2018-02-18 18:22:43	2017-08-23 19:45:34
83268783	facerec	29	https://github.com/lukas/facerec	Face recognition using amazon's Rekognition service	Python	14	1	\N	27	2017-02-27 01:41:33	2020-02-29 04:56:10	2017-09-26 21:13:02
121461073	face_classification	29	https://github.com/lukas/face_classification	Real-time face detection and emotion/gender classification using fer2013/imdb datasets with a keras CNN model and openCV.	Python	2	0	\N	1	2018-02-14 00:15:15	2020-12-16 11:37:35	2018-02-22 15:56:04
176216422	heater	29	https://github.com/lukas/heater	\N	Python	0	0	\N	1	2019-03-18 03:16:46	2020-12-16 11:37:23	2019-07-03 02:03:36
123208437	hyperband	29	https://github.com/lukas/hyperband	Tuning hyperparams fast with Hyperband	Python	0	0	\N	0	2018-02-27 21:59:59	2018-02-27 22:00:00	2017-12-09 05:11:46
197223017	keras	29	https://github.com/lukas/keras	Deep Learning for humans	Python	5	0	\N	3	2019-07-16 12:45:36	2020-12-16 11:37:21	2019-07-16 13:09:20
160370208	keras-audio	29	https://github.com/lukas/keras-audio	\N	Python	16	1	\N	2	2018-12-04 12:28:55	2020-12-16 11:37:11	2019-12-06 04:54:50
100407582	Keras-FCN-1	29	https://github.com/lukas/Keras-FCN-1	Keras-tensorflow implementation of Fully Convolutional Networks for Semantic Segmentation（Unfinished）	Python	1	0	\N	1	2017-08-15 15:36:32	2018-02-18 18:22:57	2017-09-05 18:48:16
87006564	lassen	29	https://github.com/lukas/lassen	\N	Python	0	0	\N	1	2017-04-02 15:26:47	2018-02-18 18:23:01	2017-06-12 16:47:12
68656770	lukas.github.io	29	https://github.com/lukas/lukas.github.io	\N	HTML	0	0	\N	1	2016-09-19 21:03:02	2018-02-18 18:23:06	2016-09-19 21:56:06
26488	mailfactory	29	https://github.com/lukas/mailfactory	Create MIME email messages with multiple body parts and attachments in Ruby	Ruby	3	0	\N	3	2008-06-18 16:38:49	2019-08-13 10:27:05	2008-06-18 18:01:32
144771320	Manual	29	https://github.com/lukas/Manual	You were probably looking for our website... this is it. We moved our website here, so you can see the insides of how we work.	\N	1	0	\N	0	2018-08-14 17:55:57	2018-08-14 17:55:59	2018-08-14 17:57:01
41762759	ml-class	29	https://github.com/lukas/ml-class	Machine learning lessons and teaching projects designed for engineers	Jupyter Notebook	933	4	\N	1633	2015-09-01 17:52:50	2021-01-28 15:44:25	2020-12-03 11:05:19
159767981	models	29	https://github.com/lukas/models	Models and examples built with TensorFlow	Python	0	0	\N	0	2018-11-30 02:20:52	2020-01-09 05:20:13	2018-11-30 02:48:25
273090052	pachyderm	29	https://github.com/lukas/pachyderm	Reproducible Data Science at Scale!	\N	0	0	\N	1	2020-06-17 19:24:27	2020-12-16 11:37:08	2020-06-17 18:12:52
158044753	pytorch-yolo2	29	https://github.com/lukas/pytorch-yolo2	Convert https://pjreddie.com/darknet/yolo/ into pytorch	Python	1	0	\N	2	2018-11-18 00:57:54	2020-12-16 11:37:29	2018-11-18 01:00:15
124601822	react-vis	29	https://github.com/lukas/react-vis	Data-Visualization oriented components	JavaScript	1	0	\N	0	2018-03-09 19:53:55	2018-03-09 19:53:58	2018-03-09 19:54:31
188740973	rl-experiments	29	https://github.com/lukas/rl-experiments	some reinforcement learning experiments	Python	0	0	\N	1	2019-05-26 20:19:35	2019-07-10 01:31:53	2019-05-26 22:19:46
65312129	robot	29	https://github.com/lukas/robot	Simple library for controlling a raspberry pi based robot	Python	52	5	\N	157	2016-08-09 13:50:21	2020-12-14 00:03:59	2017-10-19 20:18:28
120672537	smile	29	https://github.com/lukas/smile	Smile Classifier	Python	11	0	\N	3	2018-02-07 19:14:46	2018-04-24 11:52:37	2018-02-07 23:32:38
199306055	sonnet	29	https://github.com/lukas/sonnet	TensorFlow-based neural network library	Python	2	0	\N	3	2019-07-28 12:41:27	2020-12-16 11:37:18	2019-07-28 12:51:32
202820107	test-vega	29	https://github.com/lukas/test-vega	\N	Jupyter Notebook	0	0	\N	1	2019-08-16 22:18:30	2020-12-16 11:37:20	2019-08-16 22:19:49
125466322	vision-project	29	https://github.com/lukas/vision-project	\N	Python	78	0	\N	17	2018-03-16 02:07:20	2020-12-16 11:37:09	2020-02-06 02:58:19
125738483	yelp-project	29	https://github.com/lukas/yelp-project	\N	Python	4	0	\N	0	2018-03-18 12:22:06	2018-03-22 15:38:12	2018-03-22 15:38:11
809295	afg	31	https://github.com/tomtt/afg	\N	Ruby	1	0	\N	2	2010-07-31 11:04:34	2012-12-14 22:56:20	2010-07-30 21:37:03
78560246	ahoy	31	https://github.com/tomtt/ahoy	Analytics for Rails	Ruby	0	0	\N	1	2017-01-10 16:12:42	2018-02-18 17:47:21	2016-12-18 01:36:31
145473490	docker-java	35	https://github.com/kevwil/docker-java	Java Docker API Client	Java	0	0	\N	0	2018-08-20 18:43:37	2018-08-20 18:43:40	2018-08-21 09:38:53
73728332	angular-beatbox	31	https://github.com/tomtt/angular-beatbox	A pattern-based drumming machine based on AngularJS.	JavaScript	0	0	\N	1	2016-11-14 15:09:52	2018-02-18 17:47:25	2016-11-13 08:20:27
224303	bananajour	31	https://github.com/tomtt/bananajour	Local git repository hosting with a sexy web interface and bonjour discovery. It's like your own little adhoc, network-aware github!	JavaScript	1	0	\N	2	2009-06-11 05:55:52	2012-12-12 20:43:57	2009-06-11 06:12:38
899684	bandcamp	31	https://github.com/tomtt/bandcamp	A utility to download the low quality mp3 files for a band on bandcamp.com	Ruby	1	0	\N	5	2010-09-09 17:17:19	2013-12-21 21:13:08	2010-11-03 08:09:29
24814938	bitcoin_test	31	https://github.com/tomtt/bitcoin_test	\N	\N	0	0	\N	1	2014-10-05 09:08:29	2018-02-18 17:47:39	2014-10-05 09:08:29
743962	brainfuckr	31	https://github.com/tomtt/brainfuckr	A Ruby Brainfuck implementation	Ruby	1	0	\N	2	2010-06-27 20:55:22	2014-02-18 08:50:32	2010-06-27 20:55:41
26211418	btc	31	https://github.com/tomtt/btc	Break the Chain: web player for samba tunes of the Rhythms of Resistance network	JavaScript	1	0	\N	1	2014-11-05 07:01:14	2018-02-18 17:47:47	2014-11-13 13:45:20
326380187	bulldoze_renamer	31	https://github.com/tomtt/bulldoze_renamer	A power tool to rename files and names in a code project.	Ruby	0	0	\N	25	2021-01-03 07:27:50	2021-01-26 13:46:40	2021-01-26 13:46:37
1757196	contentapi-ruby	31	https://github.com/tomtt/contentapi-ruby	\N	Ruby	5	0	\N	2	2011-05-16 16:35:32	2019-03-14 23:26:33	2011-05-23 20:48:34
26276208	copay	31	https://github.com/tomtt/copay	A multisignature wallet.	\N	1	0	\N	1	2014-11-06 13:29:01	2018-02-18 17:48:01	2014-11-05 20:46:01
61484858	crabgrass-core	31	https://github.com/tomtt/crabgrass-core	Crabgrass is a software libre web application designed for social networking, group collaboration and network organizing. Our goal is to create communication tools that are tailored specifically to meet the needs of bottom up grassroots organizing.	Ruby	0	0	\N	1	2016-06-19 11:45:04	2018-02-18 17:48:06	2016-04-20 13:27:17
169862	cucumber	31	https://github.com/tomtt/cucumber	BDD that talks to domain experts first and code second	Ruby	0	0	\N	2	2009-04-06 22:32:48	2019-08-13 11:15:54	2009-10-05 13:25:07
159115	cucumber-skin	31	https://github.com/tomtt/cucumber-skin	A cucumber formatter that generates html files to present test results	Ruby	1	0	\N	3	2009-03-25 11:47:56	2019-08-13 11:12:12	2009-03-27 21:01:19
497353	cuke-inspector	31	https://github.com/tomtt/cuke-inspector	Inspect the steps in a cucumber suite	JavaScript	1	0	\N	7	2010-02-01 11:04:41	2018-02-18 17:48:33	2011-01-11 13:22:15
1756388	custodian	31	https://github.com/tomtt/custodian	A ruby wrapper for the Guardian API	Ruby	1	0	\N	2	2011-05-16 13:58:15	2013-01-02 16:32:20	2011-05-16 14:08:48
142287916	cypress-on-rails	31	https://github.com/tomtt/cypress-on-rails	Use cypress.io with your rails application	Ruby	0	0	\N	0	2018-07-25 07:59:02	2019-04-26 04:51:52	2018-06-05 03:11:47
224163612	dotfiles	31	https://github.com/tomtt/dotfiles	\N	\N	0	0	\N	0	2019-11-26 07:24:30	2020-10-12 06:09:25	2019-11-21 11:00:33
16546	elisp_behave	31	https://github.com/tomtt/elisp_behave	A fork of just the bahave files for emacs BDD from technomancy's DotFiles	Emacs Lisp	2	0	\N	3	2008-05-13 15:03:23	2019-08-13 10:24:29	2008-05-13 15:04:01
3349	emacs-rails	31	https://github.com/tomtt/emacs-rails	Tomtt's version of the minor mode for editing RubyOnRails code in Emacs	Emacs Lisp	46	1	\N	65	2008-03-10 14:38:56	2020-06-08 00:38:27	2008-06-10 07:54:38
93934	emacs-starter-kit	31	https://github.com/tomtt/emacs-starter-kit	All the code you need to get started, with an emphasis on dynamic languages.	Emacs Lisp	2	0	\N	4	2008-12-19 16:59:45	2019-08-13 10:48:58	2015-04-23 10:53:25
232854	flocklocal	31	https://github.com/tomtt/flocklocal	do good.fast	Ruby	2	0	\N	4	2009-06-21 17:14:15	2013-10-05 21:09:45	2009-06-21 17:46:04
54021366	git-money	31	https://github.com/tomtt/git-money	Work from anywhere, get paid bitcoin.	HTML	1	0	\N	1	2016-03-16 07:10:16	2020-01-07 17:54:03	2016-03-16 08:22:07
119073678	GroenSubscription	31	https://github.com/tomtt/GroenSubscription	\N	CSS	0	0	\N	1	2018-01-26 14:13:55	2018-04-25 20:37:21	2018-02-16 13:22:36
356864	grog	31	https://github.com/tomtt/grog	A wrapper script for git-log - shows subject, time and author of each commit plus branches and tags	Ruby	1	0	\N	3	2009-11-01 08:43:10	2014-05-14 22:16:00	2010-04-04 00:15:57
145164	hackday	31	https://github.com/tomtt/hackday	A simple Rails app for storing projects made on a Hack Day	Ruby	1	0	\N	2	2009-03-07 09:11:12	2019-08-13 11:07:22	2009-03-07 08:48:35
27450	hideguides	31	https://github.com/tomtt/hideguides	\N	Ruby	2	0	\N	4	2008-06-22 06:58:41	2019-08-13 10:27:20	2008-06-28 14:57:03
12922125	homebrew	31	https://github.com/tomtt/homebrew	The missing package manager for OS X.	Ruby	0	0	\N	1	2013-09-18 09:11:04	2018-02-18 17:49:51	2013-09-18 08:38:41
34382623	homebrew-cask	31	https://github.com/tomtt/homebrew-cask	A CLI workflow for the administration of Mac applications distributed as binaries	Ruby	0	0	\N	1	2015-04-22 06:54:18	2018-05-25 10:55:51	2015-04-24 07:12:05
34714577	homebrew-versions	31	https://github.com/tomtt/homebrew-versions	Alternate versions of Casks for homebrew-cask	Ruby	1	0	\N	1	2015-04-28 04:05:55	2018-05-25 10:51:57	2015-04-27 19:48:09
198945371	ai-deadlines	34	https://github.com/nitay/ai-deadlines	:alarm_clock: AI conference deadline countdowns 	HTML	0	0	\N	0	2019-07-26 01:19:14	2020-01-09 05:20:15	2019-07-28 13:32:39
281858774	ImportJSON	34	https://github.com/nitay/ImportJSON	Import JSON into Google Sheets, this library adds various ImportJSON functions to your spreadsheet	\N	0	0	\N	0	2020-07-23 02:25:41	2020-07-23 02:25:43	2020-05-08 12:24:57
281858814	IMPORTJSONAPI	34	https://github.com/nitay/IMPORTJSONAPI	Use JSONPath to selectively extract data from any JSON or GraphQL API directly into Google Sheets. 	\N	0	0	\N	0	2020-07-23 02:25:52	2020-07-23 02:25:54	2020-04-21 09:19:26
277342568	pidoc	34	https://github.com/nitay/pidoc	Raspberry Pi Cluster Emulation With Docker Compose	Dockerfile	0	0	\N	0	2020-07-05 13:38:03	2020-07-05 13:43:00	2020-07-05 13:42:57
277391271	raspberry-pi-os	34	https://github.com/nitay/raspberry-pi-os	Learning operating system development using Linux kernel and Raspberry Pi	\N	0	0	\N	0	2020-07-05 19:09:38	2020-07-05 19:09:40	2020-07-04 22:06:53
277706464	raspi3-tutorial	34	https://github.com/nitay/raspi3-tutorial	Bare metal Raspberry Pi 3 tutorials	C	0	0	\N	0	2020-07-07 00:25:06	2020-07-07 00:25:58	2020-07-07 00:25:55
9034421	sonatype-yourkit	34	https://github.com/nitay/sonatype-yourkit	\N	Ruby	3	0	\N	2	2013-03-26 13:07:45	2019-08-13 12:18:15	2015-05-12 15:34:09
158012	aspen	35	https://github.com/kevwil/aspen	a JRuby web server similar to Thin	Java	6	6	\N	57	2009-03-24 11:05:56	2020-11-15 06:53:31	2020-10-13 06:47:13
7061104	c-ration	35	https://github.com/kevwil/c-ration	Configuration server based on @typesafehub/config and @playframework/playframework which serves up static and dynamic config based on a file hierarchy.	JavaScript	1	0	\N	1	2012-12-07 20:36:32	2018-02-18 17:36:47	2014-01-06 16:27:27
7097297	c-ration-sample	35	https://github.com/kevwil/c-ration-sample	Sample config repository for testing	\N	1	0	\N	1	2012-12-10 15:19:16	2018-02-18 17:36:51	2012-12-10 20:16:22
7828160	c-ration-sample2	35	https://github.com/kevwil/c-ration-sample2	\N	\N	1	0	\N	1	2013-01-25 18:42:55	2018-02-18 17:36:55	2013-01-25 18:43:37
196644274	climate_data	35	https://github.com/kevwil/climate_data	place to save some PDFs of denver area high temps	\N	0	0	\N	0	2019-07-12 17:49:59	2019-07-12 17:52:01	2019-07-12 17:52:00
4874487	cloud9	35	https://github.com/kevwil/cloud9	Cloud9 IDE - Your code anywhere, anytime. Open Source Javascript IDE.	JavaScript	1	0	\N	3	2012-07-03 13:19:35	2018-02-18 17:36:59	2013-03-06 14:49:59
3228501	easyhttp	35	https://github.com/kevwil/easyhttp	A simplified wrapper around the core node.js http client.	JavaScript	2	0	\N	4	2012-01-20 16:18:03	2018-02-18 17:37:03	2015-03-10 17:32:14
303767655	external-dns	35	https://github.com/kevwil/external-dns	Configure external DNS servers (AWS Route53, Google CloudDNS and others) for Kubernetes Ingresses and Services	Go	0	0	\N	0	2020-10-13 13:40:41	2020-11-25 14:14:01	2020-11-25 14:13:52
10824057	fabric	35	https://github.com/kevwil/fabric	Simple, Pythonic remote execution and deployment.	Python	1	0	\N	1	2013-06-20 13:19:45	2018-02-18 17:37:08	2013-06-20 13:26:25
8604512	git-achievements	35	https://github.com/kevwil/git-achievements	Aquire achievements while using git.	HTML	1	0	\N	1	2013-03-06 11:00:05	2018-02-18 17:37:12	2015-09-25 14:05:28
8590299	gityup-haskell	35	https://github.com/kevwil/gityup-haskell	just like svnup-haskell but for git ;-)	Haskell	1	0	\N	1	2013-03-05 19:11:21	2018-02-18 17:37:16	2016-03-24 13:11:18
3027468	gityup-lua	35	https://github.com/kevwil/gityup-lua	given a directory full of Git working directories, iterate through them and pull updates	Lua	1	0	\N	2	2011-12-21 12:56:29	2018-02-18 17:37:19	2016-05-12 11:20:46
15909592	go-blog-cassandra	35	https://github.com/kevwil/go-blog-cassandra	playing with Go using Revel for web/REST and Cassandra for data	Go	2	0	\N	0	2014-01-14 15:23:45	2018-08-12 03:43:53	2014-01-14 15:40:21
29353227	go-martini-cassandra	35	https://github.com/kevwil/go-martini-cassandra	\N	Go	1	0	\N	1	2015-01-16 13:06:44	2018-02-18 17:37:27	2015-01-16 13:07:07
15910193	hapi-blog-cassandra	35	https://github.com/kevwil/hapi-blog-cassandra	playing with Node.js with Hapi framework for web/REST and Cassandra for data	JavaScript	1	0	\N	5	2014-01-14 15:47:11	2018-12-05 17:35:46	2018-12-05 17:35:44
96668	hellotxt	35	https://github.com/kevwil/hellotxt	HelloTxt Ruby client/library	Ruby	1	0	\N	4	2008-12-25 13:48:13	2019-08-13 10:50:00	2010-11-11 13:41:40
57337479	hipchat-java	35	https://github.com/kevwil/hipchat-java	Java client for the HipChat v2 API	Java	1	0	\N	0	2016-04-28 19:21:48	2020-01-09 05:20:14	2016-04-28 19:24:37
3777667	homebrew	35	https://github.com/kevwil/homebrew	The missing package manager for OS X.	Ruby	0	0	\N	2	2012-03-20 13:59:51	2018-02-18 17:37:49	2014-02-27 23:35:27
59033287	homebrew-cask	35	https://github.com/kevwil/homebrew-cask	A CLI workflow for the administration of Mac applications distributed as binaries	Ruby	0	0	\N	1	2016-05-17 12:11:11	2018-05-25 10:56:57	2016-06-06 13:37:57
14959311	homebrew-patches	35	https://github.com/kevwil/homebrew-patches	My "taps" for Mac Homebrew	Ruby	5	2	\N	17	2013-12-05 14:37:24	2019-02-10 22:38:50	2016-07-11 18:45:45
8318230	hubot-scripts	35	https://github.com/kevwil/hubot-scripts	optional scripts for hubot, opt in via hubot-scripts.json	CoffeeScript	1	0	\N	1	2013-02-20 14:28:30	2018-02-18 17:38:02	2015-01-08 16:12:09
32349803	indefatigable	35	https://github.com/kevwil/indefatigable	http/2 proxy written in Go	Go	1	0	\N	1	2015-03-16 17:05:14	2018-02-18 17:38:06	2015-03-16 17:36:49
318572914	ingress-nginx	35	https://github.com/kevwil/ingress-nginx	NGINX Ingress Controller for Kubernetes	\N	0	0	\N	0	2020-12-04 13:27:31	2020-12-04 13:27:33	2020-12-04 13:41:37
95347	kevwil.github.io	35	https://github.com/kevwil/kevwil.github.io	my github pages site	HTML	1	0	\N	3	2008-12-22 13:56:42	2020-01-11 16:01:33	2020-01-11 16:01:32
9679831	mcp	35	https://github.com/kevwil/mcp	Master Control Program - an extensible collection of programs with a Git-like command pass-through	\N	1	0	\N	1	2013-04-25 16:41:55	2018-02-18 17:38:14	2013-04-25 16:42:19
46505467	mimic	35	https://github.com/kevwil/mimic	[ab]using Unicode to create tragedy	Python	1	0	\N	1	2015-11-19 14:32:47	2018-02-18 17:38:18	2015-10-31 19:00:58
32166471	nh2	35	https://github.com/kevwil/nh2	http/2 proxy for tls termination and web acceleration	JavaScript	1	2	\N	1	2015-03-13 13:17:06	2018-02-18 17:38:22	2015-08-26 11:52:00
166801	pingfm	35	https://github.com/kevwil/pingfm	Ping.fm Ruby Library	Ruby	1	0	\N	2	2009-04-02 23:55:00	2019-08-13 11:14:52	2010-10-06 15:24:50
8146918	pipecleaner	35	https://github.com/kevwil/pipecleaner	filter for unix pipes and streams	JavaScript	1	0	\N	1	2013-02-11 19:18:01	2018-02-18 17:38:30	2015-07-20 03:34:56
4741	arc	36	https://github.com/KirinDave/arc	Paul Graham's Brand New Lisp	Arc	2	0	\N	7	2008-03-14 17:13:58	2019-08-13 10:22:11	2008-03-21 01:33:23
6216245	aws	36	https://github.com/KirinDave/aws	Amazon Web Services for Haskell	Haskell	1	0	\N	0	2012-10-14 14:42:11	2020-01-09 05:20:43	2012-10-13 15:39:11
149353	bilecast	36	https://github.com/KirinDave/bilecast	A Podcast hosted by me and featuring Coda Hale and Cliff Moon (and guests)	\N	1	0	\N	3	2009-03-12 14:18:11	2020-01-09 05:20:39	2009-03-12 15:45:29
788	bus-scheme	36	https://github.com/KirinDave/bus-scheme	a Scheme written in Ruby, but implemented on the bus!	Ruby	1	0	\N	3	2008-02-06 16:28:52	2019-08-13 10:21:26	2008-02-19 16:12:42
14704	classifier	36	https://github.com/KirinDave/classifier	A general classifier module to allow Bayesian and other types of classifications.	Ruby	2	0	\N	5	2008-05-05 14:27:33	2019-08-13 10:24:05	2009-12-12 16:15:14
1758179	Clipping	36	https://github.com/KirinDave/Clipping	A simple, persistent variable library	Scala	1	0	\N	1	2011-05-16 20:18:16	2020-01-09 05:20:40	2011-05-12 19:37:35
378526	clj-interface	36	https://github.com/KirinDave/clj-interface	Clojure wrapper for Erlang's JInterface.	\N	2	0	\N	2	2009-11-19 15:04:05	2018-02-18 18:03:22	2009-11-17 19:35:44
15885925	clj-mixpanel	36	https://github.com/KirinDave/clj-mixpanel	Clojure interface for sending events to Mixpanel	Clojure	1	0	\N	1	2014-01-13 21:42:31	2018-02-18 18:03:30	2012-11-21 07:48:15
4706137	clj-msgpack	36	https://github.com/KirinDave/clj-msgpack	Binary serialization of Clojure objects using MessagePack.	Clojure	1	0	\N	2	2012-06-18 17:54:40	2018-02-18 18:03:34	2012-06-18 19:40:50
583866	clj-time	36	https://github.com/KirinDave/clj-time	A date and time library for Clojure, wrapping the Joda Time library.	Clojure	193	3	\N	47	2010-03-28 17:44:48	2020-07-11 14:52:25	2019-07-03 03:02:23
1758177	Clothesline	36	https://github.com/KirinDave/Clothesline	Prototype port of webmachine to clojure/java for API developers	Clojure	3	0	\N	14	2011-05-16 20:17:56	2018-02-18 18:03:42	2011-05-30 19:53:39
4009922	dcpu16-hs	36	https://github.com/KirinDave/dcpu16-hs	Haskell implementation of Notch's dcpu-16 specification (assembler, emulator)	Haskell	1	0	\N	2	2012-04-12 19:13:54	2018-02-18 18:03:46	2012-04-12 07:01:53
12910511	discourse	36	https://github.com/KirinDave/discourse	A platform for community discussion. Free, open, simple.	JavaScript	0	0	\N	1	2013-09-17 21:46:40	2018-02-18 18:03:51	2013-09-17 18:02:19
490050	dot-emacs	36	https://github.com/KirinDave/dot-emacs	My dotemacs stuff. It's not beautiful, but it's functional.	Emacs Lisp	1	0	\N	2	2010-01-26 22:04:36	2018-02-18 18:03:55	2010-02-02 16:34:16
32807	dynomite	36	https://github.com/KirinDave/dynomite	Open source dynamo clone written in Erlang.	Erlang	1	0	\N	3	2008-07-09 20:08:57	2019-08-13 10:28:49	2008-07-09 20:08:59
2451043	Emacs-Of-The-Future	36	https://github.com/KirinDave/Emacs-Of-The-Future	Updating my emacs dotfiles distribution. These are much more up to date.	Emacs Lisp	3	3	\N	5	2011-09-24 15:26:11	2020-01-09 12:43:41	2020-10-13 07:14:30
163041464	Enigmatica2Expert	36	https://github.com/KirinDave/Enigmatica2Expert	The official repository and issue-tracker for Enigmatica 2: Expert	\N	0	0	\N	0	2018-12-25 01:14:59	2018-12-25 01:15:02	2018-12-21 07:03:52
1166223	ensime	36	https://github.com/KirinDave/ensime	Enhanced Scala Interaction Mode for Emacs	Emacs Lisp	1	0	\N	2	2010-12-13 20:30:10	2018-02-18 18:04:07	2010-12-13 20:47:23
16970834	Equivalent-Exchange-3	36	https://github.com/KirinDave/Equivalent-Exchange-3	\N	Java	2	1	\N	1	2014-02-18 22:59:50	2018-02-18 18:04:11	2017-09-26 21:13:28
4711	erlectricity	36	https://github.com/KirinDave/erlectricity	Erlectricity exposes Ruby to Erlang and vice versa.	Ruby	1	0	\N	6	2008-03-07 22:32:13	2020-01-09 05:20:31	2008-03-26 18:17:30
1592	erlenmeyer	36	https://github.com/KirinDave/erlenmeyer	A binding between erlang and mzscheme.	Scheme	4	0	\N	6	2008-02-28 00:17:49	2020-01-09 05:20:29	2008-03-26 16:26:54
2335294	eventsource-broker	36	https://github.com/KirinDave/eventsource-broker	EventSource Broker - bridges between EventSource and RabbitMQ	Haskell	1	0	\N	1	2011-09-06 12:32:55	2020-01-09 05:20:48	2011-09-05 08:45:27
402455	example-chat	36	https://github.com/KirinDave/example-chat	A simple example of a chat server in Clojure that I intend to blog about.	Clojure	1	0	\N	12	2009-12-06 19:51:46	2020-01-09 05:20:45	2009-12-06 23:32:10
77312	fake-tpw	36	https://github.com/KirinDave/fake-tpw	\N	\N	1	0	\N	3	2008-11-17 19:45:30	2020-01-09 05:20:48	2008-11-17 19:49:56
2326829	Fanboy	36	https://github.com/KirinDave/Fanboy	An irc bot in haskell, experimental in nature, using WAY OVERSPEC'D tools.	Haskell	1	0	\N	3	2011-09-05 04:29:49	2018-02-18 18:04:36	2011-09-07 00:29:27
4602856	fish-nuggets	36	https://github.com/KirinDave/fish-nuggets	Completions, code snippets helping you to get even more out of the amazing Fish shell	\N	1	0	\N	2	2012-06-08 19:10:50	2018-02-18 18:04:40	2010-07-08 07:50:38
14187	fuzed	36	https://github.com/KirinDave/fuzed	A new revision of Fuzed, the Erlang-based frontend for web apps. Check out the mailing list at http://groups.google.com/group/fuzed	Erlang	22	3	\N	274	2008-05-03 01:49:37	2019-12-09 11:46:44	2011-10-27 05:44:25
649	fuzed-old	36	https://github.com/KirinDave/fuzed-old	An integrated replacement for Mongrel+Revproxy systems in erlang	Ruby	1	1	\N	15	2008-02-17 02:05:16	2019-08-13 10:21:26	2008-04-19 17:54:47
4541667	gantry	36	https://github.com/KirinDave/gantry	Operations support in clojure	Clojure	1	0	\N	1	2012-06-03 21:02:00	2020-01-09 05:20:30	2012-06-03 01:26:53
205026	gen_leader_revival	36	https://github.com/KirinDave/gen_leader_revival	A project to unify various implementations of the Erlang library gen_leader into a modern, robust single implementation	Erlang	65	0	\N	64	2009-05-19 14:29:34	2020-07-19 00:13:04	2011-07-31 14:46:52
890204	action_mailer_verp	37	https://github.com/jamesgolick/action_mailer_verp	Send VERP emails with actionmailer. http://en.wikipedia.org/wiki/Variable_envelope_return_path	Ruby	3	0	\N	7	2010-09-05 19:17:18	2018-04-25 16:16:05	2011-06-28 13:38:18
7360	action_messager	37	https://github.com/jamesgolick/action_messager	Dead simple IM notifications for your app	Ruby	2	0	\N	44	2008-04-06 16:41:07	2019-12-18 22:15:30	2008-04-06 21:23:37
3835254	activerecordless_migrations	37	https://github.com/jamesgolick/activerecordless_migrations	\N	Ruby	2	0	\N	2	2012-03-26 14:16:12	2019-01-05 11:24:51	2012-03-26 14:16:25
37432	active_presenter	37	https://github.com/jamesgolick/active_presenter	The presenter library you already know.	Ruby	44	5	\N	299	2008-07-26 11:10:16	2020-10-23 14:43:19	2012-08-27 16:17:02
1148416	always_verify_ssl_certificates	37	https://github.com/jamesgolick/always_verify_ssl_certificates	Ruby's net/http is setup to never verify SSL certificates by default. Most ruby libraries do the same. That means that you're not verifying the identity of the server you're communicating with and are therefore exposed to man in the middle attacks. This gem monkey-patches net/http to force certificate verification and make turning it off impossible. 	Ruby	16	4	\N	97	2010-12-07 23:26:11	2020-12-28 00:01:45	2011-09-12 18:25:38
5391496	apns4erl	37	https://github.com/jamesgolick/apns4erl	Apple Push Notification Server for Erlang	Erlang	1	0	\N	0	2012-08-12 17:03:27	2019-12-12 12:43:32	2012-08-12 17:04:33
6388	attribute_fu	37	https://github.com/jamesgolick/attribute_fu	a better version of this functionality is in rails 2.3. use that!	Ruby	20	3	\N	99	2008-04-02 21:14:53	2019-08-13 10:22:30	2008-11-25 12:16:28
52036	blank	37	https://github.com/jamesgolick/blank	Blank is GiraffeSoft’s blank rails starter app.	Ruby	8	0	\N	61	2008-09-12 13:23:08	2019-08-21 22:01:59	2009-08-21 23:23:11
2344417	browsermob-proxy	37	https://github.com/jamesgolick/browsermob-proxy	A free utility to help web developers watch and manipulate network traffic from their web applications.	Java	1	0	\N	2	2011-09-07 17:46:24	2018-04-25 16:16:16	2011-09-04 01:38:44
290509	cassandra	37	https://github.com/jamesgolick/cassandra	A Ruby client for the Cassandra distributed database.	Ruby	2	0	\N	1	2009-08-27 23:10:31	2018-04-05 18:54:09	2009-12-17 23:55:39
646043	cassandra-munin-plugins	37	https://github.com/jamesgolick/cassandra-munin-plugins	Munin plugins for apache cassandra.	\N	20	3	\N	44	2010-05-04 01:24:06	2020-06-11 21:59:15	2010-05-27 13:06:18
288790	cassandra_object	37	https://github.com/jamesgolick/cassandra_object	A library for persisting your objects into cassandra.	Ruby	1	0	\N	2	2009-08-26 11:49:49	2018-04-05 18:53:53	2009-08-27 15:10:29
637670	cassie	37	https://github.com/jamesgolick/cassie	Another Cassandra client for Scala. This one does what I want.	Scala	2	0	\N	3	2010-04-29 03:06:50	2018-04-25 16:16:01	2010-06-15 13:25:30
351829	chef	37	https://github.com/jamesgolick/chef	A systems integration framework, built to bring the benefits of configuration management to your entire infrastructure.	Ruby	2	0	\N	2	2009-10-27 18:16:28	2018-04-25 16:15:51	2009-10-28 18:22:57
116198	classy_resources	37	https://github.com/jamesgolick/classy_resources	Think resource_controller, except for sinatra.	Ruby	7	0	\N	41	2009-01-27 22:20:08	2019-08-13 10:56:38	2009-02-16 18:41:15
897376	client_proxy	37	https://github.com/jamesgolick/client_proxy	Basic ruby proxy class to use around service clients that handles retrying requests and failover.	Ruby	2	0	\N	1	2010-09-08 19:46:58	2018-04-25 16:16:05	2010-09-08 19:48:12
242688	conductor	37	https://github.com/jamesgolick/conductor	Build clusters in the cloud with conductor.	Ruby	2	0	\N	48	2009-07-03 16:09:41	2019-08-13 11:26:47	2010-02-12 04:42:41
320164	conductor-rails	37	https://github.com/jamesgolick/conductor-rails	A rails stack for conductor.	Ruby	3	0	\N	12	2009-09-28 13:52:58	2019-08-13 11:28:19	2009-09-28 19:32:20
108910	context	37	https://github.com/jamesgolick/context	A super tight library to add contexts to tests.	Ruby	1	0	\N	3	2009-01-16 17:07:11	2019-08-13 10:54:11	2009-01-20 01:13:58
328474	dash-ruby	37	https://github.com/jamesgolick/dash-ruby	FiveRuns Dash core library for Ruby	Ruby	2	0	\N	1	2009-10-06 10:23:04	2018-04-25 16:15:51	2009-03-25 19:26:43
781384	degrade	37	https://github.com/jamesgolick/degrade	Keep track of service error rates using redis. Degrade functionality if they're too high.	Ruby	10	2	\N	315	2010-07-18 03:49:58	2020-09-12 23:33:04	2011-10-10 03:19:59
73214	delayed_job	37	https://github.com/jamesgolick/delayed_job	Database based asynchronously priority queue system -- Extracted from Shopify 	Ruby	3	0	\N	2	2008-11-08 11:40:12	2020-01-09 05:20:17	2008-11-08 12:21:31
270028	dirty_callbacks	37	https://github.com/jamesgolick/dirty_callbacks	\N	Ruby	2	0	\N	6	2009-08-05 16:46:44	2020-01-09 05:20:19	2009-08-05 16:51:38
228669	dm-yaml-adapter	37	https://github.com/jamesgolick/dm-yaml-adapter	a YAML adapter for DataMapper. this (slow) adapter allows you to use DataMapper with YAML files as a backing store.	Ruby	2	0	\N	1	2009-06-16 12:06:13	2018-04-25 16:15:46	2009-05-20 23:05:26
71308	dotfiles	37	https://github.com/jamesgolick/dotfiles	\N	VimL	3	0	\N	17	2008-11-03 22:59:39	2019-08-13 10:40:49	2014-02-15 23:52:51
74	enum_field	37	https://github.com/jamesgolick/enum_field	\N	Ruby	16	2	\N	53	2008-01-21 23:54:15	2020-11-01 16:02:42	2009-06-26 16:19:26
5546553	erl-dns	37	https://github.com/jamesgolick/erl-dns	DNS server, in erlang.	JavaScript	1	0	\N	1	2012-08-24 19:41:56	2018-02-18 18:25:32	2012-08-24 19:42:51
4786007	erlang-mysql-driver	37	https://github.com/jamesgolick/erlang-mysql-driver	Erlang MySQL Driver (from code.google.com)	Erlang	2	1	\N	5	2012-06-25 16:03:03	2020-10-14 12:20:09	2014-03-17 13:25:20
5070745	erlang-thrift	37	https://github.com/jamesgolick/erlang-thrift	\N	Erlang	2	0	\N	1	2012-07-16 14:27:47	2018-04-25 16:16:21	2012-12-20 02:26:19
5011729	erlcloud	37	https://github.com/jamesgolick/erlcloud	Cloud Computing library for erlang (Amazon EC2, S3, SQS, SimpleDB, Mechanical Turk, ELB)	Erlang	2	0	\N	1	2012-07-12 20:21:44	2018-04-25 16:16:21	2012-07-12 21:04:43
301826	aloha_2009	38	https://github.com/atmos/aloha_2009	my talk on open source business models and independent record labels	\N	2	0	\N	1	2009-09-09 04:36:19	2018-03-25 09:49:53	2009-10-06 09:04:22
16522907	appsly-android-rest	38	https://github.com/atmos/appsly-android-rest	An Android client library for RESTful based web services.	Java	2	0	\N	1	2014-02-04 17:29:17	2020-03-16 09:33:29	2014-02-03 08:20:20
127067	as_time_goes_by	38	https://github.com/atmos/as_time_goes_by	an example sinatra/rspec/datamapper/webrat app with selenium built in	Ruby	2	0	\N	6	2009-02-11 23:24:18	2019-08-13 11:00:17	2009-02-21 01:37:56
125749187	atmos-dot-org-netlify	38	https://github.com/atmos/atmos-dot-org-netlify	\N	CSS	0	1	\N	1	2018-03-18 14:18:06	2020-01-09 12:43:48	2019-06-01 13:15:14
13460813	atmos-rails	38	https://github.com/atmos/atmos-rails	A simple rails 4 template for resque and github oauth	Ruby	4	0	\N	4	2013-10-10 00:09:51	2019-08-13 12:28:01	2015-05-29 01:36:45
91967	atmos.github.io	38	https://github.com/atmos/atmos.github.io	\N	HTML	56	1	\N	32	2008-12-17 05:22:39	2020-11-28 23:21:51	2020-06-24 14:53:37
2267489	atmos.org	38	https://github.com/atmos/atmos.org	redirect shit from heroku to github pages	JavaScript	2	0	\N	2	2011-08-25 08:27:23	2018-02-18 17:44:05	2011-08-25 08:28:50
465440	atmos.org-redirector	38	https://github.com/atmos/atmos.org-redirector	redirect atmos.org on ec2 to www.atmos.org on github	Ruby	2	0	\N	2	2010-01-09 18:11:09	2018-02-18 17:44:08	2015-12-07 19:19:09
99978	braintree_transparent_redirect_slice	38	https://github.com/atmos/braintree_transparent_redirect_slice	A slice for interfacing with braintree's transparent redirect stuff in a merb app	Ruby	1	0	\N	4	2009-01-02 22:42:12	2019-08-13 10:51:09	2009-01-21 21:34:18
28524039	brute-force-your-router	38	https://github.com/atmos/brute-force-your-router	\N	Lua	3	0	\N	5	2014-12-26 21:38:02	2016-02-11 15:14:40	2014-12-26 21:44:17
20266141	bugzilla	38	https://github.com/atmos/bugzilla	Read-only mirror of Bugzilla source from git.mozilla.org/bugzilla/bugzilla.git	Perl	1	0	\N	1	2014-05-28 14:24:54	2018-02-18 17:45:15	2014-05-28 03:42:46
965388	bundler	38	https://github.com/atmos/bundler	Manage your application's gem dependencies with less pain	Ruby	0	0	\N	2	2010-10-05 23:17:37	2020-01-09 22:11:24	2010-10-02 16:31:22
898130	bundler-site	38	https://github.com/atmos/bundler-site	\N	Ruby	1	0	\N	2	2010-09-09 05:10:24	2020-01-09 22:09:34	2010-09-07 18:18:16
7322777	butt	38	https://github.com/atmos/butt	Unofficial fork of http://danielnoethen.de/	C++	2	0	\N	5	2012-12-26 01:29:22	2019-08-27 15:32:21	2012-12-26 01:32:14
1076534	camo	38	https://github.com/atmos/camo	:lock: an http proxy to route images through SSL	CoffeeScript	318	26	\N	1547	2010-11-13 00:56:46	2021-01-29 04:32:11	2020-05-23 01:06:38
9332126	campfiyah	38	https://github.com/atmos/campfiyah	Faraday API for Campfire	Ruby	2	0	\N	2	2013-04-09 18:33:52	2018-02-18 17:45:35	2013-10-03 22:48:12
1167358	capybara-standalone	38	https://github.com/atmos/capybara-standalone	rspec2 and capybara testing, a simple example.	Ruby	2	0	\N	8	2010-12-14 05:11:35	2021-01-13 16:30:19	2010-12-14 05:13:18
6133028	charlock_holmes	38	https://github.com/atmos/charlock_holmes	Character encoding detection, brought to you by ICU	Ruby	1	0	\N	2	2012-10-08 20:53:47	2013-12-27 15:06:02	2012-10-03 02:19:16
825471	chef	38	https://github.com/atmos/chef	A systems integration framework, built to bring the benefits of configuration management to your entire infrastructure.	Ruby	1	0	\N	3	2010-08-08 20:59:46	2018-02-18 17:45:56	2010-08-08 21:00:08
681112	ciderapp.org	38	https://github.com/atmos/ciderapp.org	the site that serves up your recipes	Ruby	2	0	\N	10	2010-05-22 18:46:48	2021-01-13 16:29:04	2012-10-22 01:32:33
876168	cinderella	38	https://github.com/atmos/cinderella	how your apple laptop should work	Ruby	1	0	\N	4	2010-08-31 20:10:02	2018-02-18 17:46:03	2013-02-28 21:31:30
855243	connect	38	https://github.com/atmos/connect	Connect is a middleware layer for Node.js	JavaScript	1	0	\N	2	2010-08-22 16:37:34	2018-02-18 17:46:07	2010-08-22 16:37:55
857722	connect-auth	38	https://github.com/atmos/connect-auth	Authentication middleware for connect.	JavaScript	1	0	\N	3	2010-08-23 18:26:05	2018-02-18 17:46:11	2010-08-23 18:51:59
51234462	conveyor	38	https://github.com/atmos/conveyor	A fast build system for Docker images.	Go	1	0	\N	1	2016-02-07 01:50:50	2018-02-18 17:46:15	2016-02-05 22:09:41
8791758	developer.github.com	38	https://github.com/atmos/developer.github.com	GitHub API documentation	Ruby	0	0	\N	1	2013-03-15 00:55:46	2017-01-09 08:29:54	2013-03-15 04:49:02
8656086	django-headcrumbs	38	https://github.com/atmos/django-headcrumbs	Smart and easy-to-use breadcrumbs for Django	Python	0	0	\N	1	2013-03-08 14:23:44	2018-02-18 17:46:23	2013-03-06 06:35:30
27801314	djcharts-menubar	38	https://github.com/atmos/djcharts-menubar	djcharts.io menubar item	Objective-C	1	0	\N	3	2014-12-10 01:59:02	2018-02-18 17:46:28	2015-01-14 20:16:31
51883807	docker-unifi-controller	38	https://github.com/atmos/docker-unifi-controller	\N	\N	2	0	\N	0	2016-02-16 23:18:08	2018-03-01 02:25:33	2016-02-16 23:46:55
29575	dot_xen	38	https://github.com/atmos/dot_xen	parsing xen's .xen files for reading and writing	Ruby	3	0	\N	12	2008-06-28 16:31:04	2019-08-13 10:27:52	2008-10-22 05:01:11
4644280	elasticsearch-client	38	https://github.com/atmos/elasticsearch-client	\N	Ruby	1	0	\N	2	2012-06-12 20:25:17	2018-02-18 17:46:41	2012-06-12 20:30:33
2277888	test	44	https://github.com/errfree/test	\N	\N	0	0	\N	0	2011-08-27 01:08:47	2020-01-09 05:20:36	\N
789949	test1	44	https://github.com/errfree/test1	\N	\N	0	0	\N	0	2010-07-21 21:40:28	2020-01-09 05:20:35	\N
2367236	AaronCam	45	https://github.com/mojodna/AaronCam	Camera + Flickr app skeleton	Objective-C	1	0	\N	2	2011-09-11 17:11:02	2018-02-18 17:32:26	2011-09-12 01:16:25
36765316	abaculus	45	https://github.com/mojodna/abaculus	Library for creating static maps from tiles based on center or corner lng,lat coordinates. Uses node-blend.	JavaScript	1	0	\N	1	2015-06-02 19:23:49	2018-02-18 17:32:30	2015-06-10 11:23:58
78781538	accelerometer	45	https://github.com/mojodna/accelerometer	D3 accelerometer vis + Node websocket server	HTML	0	0	\N	1	2017-01-12 17:56:45	2018-05-18 01:10:48	2017-01-12 17:57:55
76239	active_queue	45	https://github.com/mojodna/active_queue	A toolkit for queueing tasks and creating worker processes	Ruby	2	0	\N	19	2008-11-14 22:51:12	2019-08-13 10:42:45	2008-11-21 03:42:48
150924684	amazon-ecs-cli	45	https://github.com/mojodna/amazon-ecs-cli	The Amazon ECS CLI enables users to run their applications on ECS/Fargate using the Docker Compose file format, quickly provision resources, push/pull images in ECR, and monitor running applications on ECS/Fargate.	Go	0	0	\N	0	2018-09-30 00:03:06	2018-09-30 00:03:09	2018-10-01 18:20:04
154824	anemone	45	https://github.com/mojodna/anemone	Web Hook servicer / batch request system	Ruby	1	0	\N	3	2009-03-20 02:08:11	2019-08-13 11:10:45	2009-03-20 02:08:27
80044	annotate_models	45	https://github.com/mojodna/annotate_models	git-svn clone of http://repo.pragprog.com/svn/Public/plugins/annotate_models/	Ruby	1	0	\N	2	2008-11-24 00:02:49	2019-08-13 10:44:01	2008-11-24 00:04:04
1731015	doozer-bench	46	https://github.com/bmizerany/doozer-bench	bechmark the doozerz	Go	1	0	\N	1	2011-05-10 22:07:07	2021-01-12 18:45:03	2011-05-23 20:12:35
1243715	asi-http-request	45	https://github.com/mojodna/asi-http-request	Easy to use CFNetwork wrapper for HTTP requests, Objective-C,  Mac OS X and iPhone	Objective-C	1	0	\N	6	2011-01-11 22:23:16	2018-02-18 17:32:50	2011-05-16 16:14:54
129167197	augdiff-pipeline	45	https://github.com/mojodna/augdiff-pipeline	Generate Augmented Diffs of OpenStreetMap from minutely replication files.	Shell	0	0	\N	0	2018-04-11 20:47:38	2018-04-11 20:47:40	2018-08-09 21:12:46
80053204	awsgi	45	https://github.com/mojodna/awsgi	A WSGI gateway for the AWS API Gateway/Lambda proxy integration	Python	0	0	\N	1	2017-01-25 18:10:37	2018-02-18 17:32:54	2017-01-25 20:08:36
144009	bamboo-shooter	45	https://github.com/mojodna/bamboo-shooter	(demo) PubSub for Pandas	Ruby	1	0	\N	3	2009-03-05 19:33:22	2019-08-13 11:06:53	2009-03-06 19:21:09
131043777	bound-dms	45	https://github.com/mojodna/bound-dms	Bound is a document management system allowing collaboration and control of document translation projects.	JavaScript	0	0	\N	0	2018-04-25 14:51:25	2018-04-25 14:51:28	2018-04-25 15:39:52
111745101	caliparks.org	45	https://github.com/mojodna/caliparks.org	Mapping social media in parks and other open spaces	JavaScript	0	0	\N	1	2017-11-22 22:21:24	2018-02-18 17:33:02	2017-11-22 22:22:29
69443426	CameraCalibration	45	https://github.com/mojodna/CameraCalibration	\N	Python	0	0	\N	1	2016-09-28 05:39:25	2018-02-18 17:33:06	2016-09-28 12:22:07
181801207	carbon-components-vue	45	https://github.com/mojodna/carbon-components-vue	Vue implementation of the Carbon Design System	JavaScript	0	0	\N	0	2019-04-16 23:20:09	2019-04-16 23:20:13	2019-05-07 12:40:47
8688853	carto	45	https://github.com/mojodna/carto	hyperspeed CSS-like map styling	JavaScript	2	1	\N	1	2013-03-10 14:41:57	2018-02-18 17:33:10	2017-09-26 21:13:51
22931536	cartodb	45	https://github.com/mojodna/cartodb	Geospatial database for the cloud	\N	1	0	\N	1	2014-08-13 18:15:18	2018-02-18 17:33:14	2014-08-13 20:32:27
27455700	CartoDB-basemaps	45	https://github.com/mojodna/CartoDB-basemaps	CartoDB basemaps	JavaScript	1	0	\N	2	2014-12-02 20:00:26	2018-02-18 17:33:18	2014-12-02 20:00:45
28829483	CartoDB-SQL-API	45	https://github.com/mojodna/CartoDB-SQL-API	CartoDB SQL API	JavaScript	1	0	\N	1	2015-01-05 18:09:29	2018-02-18 17:33:23	2015-01-06 23:28:05
46544249	cartodb.js	45	https://github.com/mojodna/cartodb.js	CartoDB javascript library	JavaScript	1	0	\N	1	2015-11-20 04:36:09	2018-02-18 17:33:26	2015-11-19 16:02:06
9084255	Cascadenik	45	https://github.com/mojodna/Cascadenik	Cascading Sheets Of Style for Mapnik	Python	1	0	\N	1	2013-03-28 16:04:14	2018-02-18 17:33:31	2014-05-23 22:58:34
54485823	changeset-replay-tool	45	https://github.com/mojodna/changeset-replay-tool	\N	JavaScript	1	0	\N	3	2016-03-22 12:19:26	2018-02-18 17:33:35	2016-04-28 16:36:11
88789715	ckanapi	45	https://github.com/mojodna/ckanapi	A command line interface and Python module for accessing the CKAN Action API	Python	0	0	\N	1	2017-04-19 17:51:28	2018-02-18 17:33:39	2017-04-19 17:56:28
189308035	ClusterODM	45	https://github.com/mojodna/ClusterODM	A NodeODM API compatible reverse proxy, load balancer and task tracker for easy horizontal scaling ♆	JavaScript	0	0	\N	0	2019-05-29 19:33:55	2019-05-29 19:33:57	2019-05-31 01:16:40
7740041	collectd-write_graphite	45	https://github.com/mojodna/collectd-write_graphite	Graphite output plugin for collectd	C	1	0	\N	1	2013-01-21 18:44:55	2018-02-18 17:33:43	2013-02-11 18:59:12
12741447	commander.js	45	https://github.com/mojodna/commander.js	node.js command-line interfaces made easy	JavaScript	1	0	\N	1	2013-09-10 18:46:46	2018-02-18 17:33:47	2013-09-10 18:47:13
43019887	convox.github.io	45	https://github.com/mojodna/convox.github.io	Convox Docs	JavaScript	1	0	\N	1	2015-09-23 15:41:27	2018-02-18 17:33:51	2015-09-23 19:47:50
80035	crud_controller	45	https://github.com/mojodna/crud_controller	Abstract resource controller + generator for Rails	\N	1	0	\N	3	2008-11-23 23:40:13	2019-08-13 10:44:01	2008-11-23 23:40:29
23206113	cugos.github.com	45	https://github.com/mojodna/cugos.github.com	cugos github pages	\N	1	1	\N	1	2014-08-21 20:17:22	2018-02-18 17:33:59	2017-09-26 21:13:55
148221480	curtin	45	https://github.com/mojodna/curtin	Official mirror of curtin project	Python	0	0	\N	0	2018-09-10 18:29:03	2020-04-17 17:16:37	2018-09-10 18:29:31
291873	amazon-ec2	46	https://github.com/bmizerany/amazon-ec2	A Ruby Gem that gives you full access to the Amazon EC2 API from your Ruby/Ruby on Rails apps	Ruby	2	0	\N	1	2009-08-29 16:06:50	2021-01-12 18:48:10	2009-08-20 23:40:42
66670	amqp	46	https://github.com/bmizerany/amqp	AMQP client implementation in Ruby/EventMachine	Ruby	1	0	\N	4	2008-10-23 05:34:48	2019-08-13 10:39:09	2008-12-09 20:38:45
1107816	assert	46	https://github.com/bmizerany/assert	Asserts to Go testing	Go	40	6	\N	142	2010-11-24 00:05:49	2021-01-27 23:15:58	2018-06-16 11:01:51
5322	attrubates	46	https://github.com/bmizerany/attrubates	Arrtubates sets meta on meta for objects and adds additional rendering helpers for ActionController::Base in Rails.	Ruby	1	0	\N	3	2008-03-25 19:16:00	2019-08-13 10:22:19	2011-03-09 23:33:30
2968891	aws	46	https://github.com/bmizerany/aws	An old simple AWS client in Go (use bmizerany/aws4 for more up to date aws usage).	Go	9	2	\N	26	2011-12-12 23:21:09	2019-08-13 11:54:05	2013-01-19 17:39:52
3643809	aws.go	46	https://github.com/bmizerany/aws.go	\N	Go	2	0	\N	2	2012-03-06 20:16:44	2018-05-15 01:26:52	2012-03-29 19:01:58
5455390	aws4	46	https://github.com/bmizerany/aws4	A Go package for AWS Signature version 4 	Go	24	6	\N	72	2012-08-17 14:41:26	2020-06-12 11:18:05	2014-10-25 09:03:58
363872	bacon	46	https://github.com/bmizerany/bacon	a small RSpec clone	Ruby	1	0	\N	2	2009-11-06 20:39:11	2021-01-12 18:48:01	2009-09-22 16:18:41
293810	bang	46	https://github.com/bmizerany/bang	banger	Ruby	1	0	\N	1	2009-08-31 21:41:14	2021-01-12 18:48:06	2009-08-31 21:50:25
162965	beldam	46	https://github.com/bmizerany/beldam	clean, easy, ec2 wrapper	Ruby	1	0	\N	14	2009-03-30 04:00:34	2019-08-13 11:13:34	2009-05-26 19:28:38
7650	capistrano-bells	46	https://github.com/bmizerany/capistrano-bells	A bunch of recipes to help you deploy a Rails app.	Ruby	1	0	\N	4	2008-04-07 18:14:40	2019-08-13 10:22:41	2008-04-08 00:29:46
12134	cheat	46	https://github.com/bmizerany/cheat	Cheating is fun!	Ruby	1	0	\N	2	2008-04-23 19:38:22	2019-08-13 10:23:31	2008-04-23 19:38:23
114683	chef	46	https://github.com/bmizerany/chef	A systems integration framework, built to bring the benefits of configuration management to your entire infrastructure.	Ruby	1	0	\N	3	2009-01-26 00:22:02	2019-08-13 10:56:12	2009-10-20 20:37:06
211151	cloudquery	46	https://github.com/bmizerany/cloudquery	Ruby client for the Xoopit search API	Ruby	1	0	\N	2	2009-05-27 00:07:54	2021-01-12 18:48:14	2009-06-15 20:01:23
363867	contest	46	https://github.com/bmizerany/contest	Write more readable tests in Test::Unit with this tiny script.	Ruby	1	0	\N	1	2009-11-06 20:36:40	2021-01-12 18:48:13	2009-06-23 20:34:47
116960	coral	46	https://github.com/bmizerany/coral	Git-powered alternative to RubyGems	Ruby	1	0	\N	2	2009-01-28 21:26:38	2019-08-13 10:56:54	2009-01-28 20:59:20
18283532	coreup	46	https://github.com/bmizerany/coreup	\N	Go	1	0	\N	0	2014-03-31 03:11:58	2021-01-12 18:44:23	2014-03-31 15:52:30
260057	couchdb-simple-demo	46	https://github.com/bmizerany/couchdb-simple-demo	Simple CouchDB demo	Ruby	1	0	\N	1	2009-07-24 21:21:49	2021-01-12 18:48:13	2009-07-24 21:22:42
188828	delayed_job	46	https://github.com/bmizerany/delayed_job	Database backed asynchronous priority queue -- Extracted from Shopify 	Ruby	0	0	\N	2	2009-04-29 18:40:45	2019-08-13 11:22:25	2009-03-19 12:33:06
17471127	describe-tag	46	https://github.com/bmizerany/describe-tag	\N	Go	1	0	\N	0	2014-03-06 05:32:12	2021-01-12 18:44:25	2014-03-06 05:34:11
436280	domainy	46	https://github.com/bmizerany/domainy	for getting the base of a domain	Ruby	5	0	\N	4	2009-12-14 04:47:27	2018-05-24 01:40:41	2009-12-14 22:44:08
1633964	doozerd	46	https://github.com/bmizerany/doozerd	A consistent distributed data store.	Go	1	0	\N	5	2011-04-19 00:58:16	2019-10-23 00:04:36	2014-03-03 22:42:37
401239	dotfiles	46	https://github.com/bmizerany/dotfiles	~rtomayko	Perl	60	0	\N	6	2009-12-05 23:36:08	2019-06-12 22:10:37	2011-10-31 05:46:45
218666	Elephant	46	https://github.com/bmizerany/Elephant	An Adium Plugin for keeping realtime backup/full-text search of all chats	Objective-C	1	0	\N	2	2009-06-04 15:22:24	2020-08-28 14:23:09	2009-06-04 19:24:13
1399159	em-swirl	46	https://github.com/bmizerany/em-swirl	An evented Ruby EC2 driver for EventMachine	Ruby	1	0	\N	12	2011-02-22 17:04:01	2021-01-13 16:30:57	2011-02-28 22:38:04
393584	em-syslog	46	https://github.com/bmizerany/em-syslog	Basic support for remote syslog in EM.	Ruby	1	0	\N	2	2009-12-02 23:34:04	2021-01-12 18:48:09	2009-08-31 06:22:33
84534	emacs	46	https://github.com/bmizerany/emacs	My Emacs config	Emacs Lisp	1	0	\N	2	2008-12-03 18:09:08	2019-08-13 10:45:25	2009-01-29 21:32:42
61918505	env	46	https://github.com/bmizerany/env	\N	Go	0	0	\N	0	2016-06-24 20:52:00	2020-01-09 11:19:16	2016-06-24 20:54:39
53028	erlectricity	46	https://github.com/bmizerany/erlectricity	Erlectricity exposes Ruby to Erlang and vice versa.	Ruby	0	0	\N	2	2008-09-15 22:42:01	2019-08-13 10:35:15	2008-09-15 22:42:04
267617642	.github	47	https://github.com/jnewland/.github	/rem checkboxes	\N	1	0	\N	10	2020-05-28 11:51:08	2020-06-27 12:51:17	2020-05-29 00:48:11
294466406	action-kots-release	47	https://github.com/jnewland/action-kots-release	\N	Dockerfile	0	0	\N	0	2020-09-10 13:40:06	2020-09-10 13:41:15	2020-09-10 13:41:12
261753282	actions-playground	47	https://github.com/jnewland/actions-playground	\N	\N	0	2	\N	1	2020-05-06 09:34:13	2020-10-15 13:36:53	2020-10-15 13:37:30
303699380	actions-runner-controller	47	https://github.com/jnewland/actions-runner-controller	Kubernetes controller for GitHub Actions self-hosted runnners	\N	0	0	\N	0	2020-10-13 09:41:28	2020-10-13 09:41:30	2020-10-13 09:42:10
476509	agile_zen	47	https://github.com/jnewland/agile_zen	\N	Ruby	0	0	\N	5	2010-01-17 18:39:53	2018-02-18 18:12:40	2010-01-17 18:40:37
37894188	airfoil-api	47	https://github.com/jnewland/airfoil-api	Wrap AirFoil's Applescript interface with a JSON API.	JavaScript	12	6	\N	21	2015-06-23 00:09:04	2020-12-13 02:45:44	2019-11-02 00:46:22
37954266	airfoil-api-smartthings	47	https://github.com/jnewland/airfoil-api-smartthings	[unmaintained] A SmartThings App & Device Handler to pair with airfoil-api	Groovy	4	2	\N	3	2015-06-23 22:15:38	2019-01-04 17:41:19	2016-12-15 21:40:45
19348669	alfred-open-windows	47	https://github.com/jnewland/alfred-open-windows	Alfred extension to switch between open windows of the currently focused application	Shell	3	1	\N	55	2014-05-01 12:32:05	2020-12-10 18:28:50	2018-01-30 21:00:39
66203040	appdaemon	47	https://github.com/jnewland/appdaemon	Python Apps for Home Assistant	Python	0	0	\N	1	2016-08-21 11:30:09	2020-07-05 17:25:39	2016-08-21 11:30:24
95135527	bcc	47	https://github.com/jnewland/bcc	BCC - Tools for BPF-based Linux IO analysis, networking, monitoring, and more	C++	0	0	\N	1	2017-06-22 13:30:59	2018-02-18 18:13:02	2017-06-20 15:33:03
51563198	beaker	47	https://github.com/jnewland/beaker	Puppet Acceptance Testing Harness	Ruby	1	1	\N	1	2016-02-12 00:40:13	2020-07-27 10:54:15	2017-09-26 21:14:12
223120	bigdecimal-segfault-fix	47	https://github.com/jnewland/bigdecimal-segfault-fix	Provides a quick workaround for the segfault bug in Ruby (CVE-2009-1904)	Ruby	1	0	\N	2	2009-06-09 21:35:14	2018-02-18 18:13:11	2009-06-09 21:36:11
2563	boolean_web_service	47	https://github.com/jnewland/boolean_web_service	BooleanWebService(:isitchristmas) => false. Well, unless it's christmas. Then it'd be true.	Ruby	0	0	\N	4	2008-03-04 22:32:08	2019-08-13 10:21:46	2008-03-26 16:47:31
2399108	brew2deb	47	https://github.com/jnewland/brew2deb	homebrew + fpm = debian packages	Ruby	0	0	\N	3	2011-09-16 09:22:18	2018-02-18 18:13:19	2011-11-11 16:08:18
60718979	bt.sh	47	https://github.com/jnewland/bt.sh	bt.sh: timechart-like tracing with bash	Shell	0	0	\N	1	2016-06-08 15:02:41	2018-02-18 18:13:23	2015-06-05 01:32:40
493687	capistrano	47	https://github.com/jnewland/capistrano	Remote multi-server automation tool	Ruby	1	0	\N	2	2010-01-29 12:51:29	2018-02-18 18:13:27	2010-01-29 12:54:12
539055	capistrano-log_with_awesome	47	https://github.com/jnewland/capistrano-log_with_awesome	logging callbacks for capistrano	Ruby	5	2	\N	18	2010-02-27 17:53:04	2020-08-31 22:07:33	2017-03-28 14:06:05
339	capsize	47	https://github.com/jnewland/capsize	A Capistrano extension for managing and running your app on Amazon EC2.	Ruby	12	2	\N	41	2008-02-08 10:12:11	2021-01-27 12:59:31	2017-09-26 21:14:17
697462	cassandra_object	47	https://github.com/jnewland/cassandra_object	A library for persisting your objects into cassandra.	Ruby	1	0	\N	2	2010-06-01 12:57:27	2018-02-18 18:13:39	2010-06-02 10:43:33
1837664	cookbooks	47	https://github.com/jnewland/cookbooks	Opscode Cookbooks for Chef	Ruby	0	0	\N	3	2011-06-02 12:05:20	2020-04-24 18:58:20	2011-06-02 12:07:21
675189	cucumber-json	47	https://github.com/jnewland/cucumber-json	A cucumber output formatter that outputs JSON	Ruby	10	1	\N	9	2010-05-19 11:34:17	2020-05-21 17:33:16	2010-05-19 11:48:02
603969	cucumber-nagios	47	https://github.com/jnewland/cucumber-nagios	systems testing plugin for Nagios with Cucumber + Webrat + Mechanize + Net::SSH	Ruby	1	0	\N	2	2010-04-10 12:21:45	2018-02-18 18:13:52	2010-04-10 12:27:35
709776	cucumber-newrelic	47	https://github.com/jnewland/cucumber-newrelic	Cucumber steps for verifing metrics from NewRelic's API	Ruby	1	0	\N	12	2010-06-08 13:26:29	2018-02-18 18:13:56	2010-06-09 08:46:40
710239	cucumber-scout	47	https://github.com/jnewland/cucumber-scout	Cucumber steps for verifying Scout metrics	Ruby	0	0	\N	8	2010-06-08 17:51:10	2018-02-18 18:14:00	2010-06-09 08:46:46
1055140	cucumber-standalone	47	https://github.com/jnewland/cucumber-standalone	generator for standalone cuke projects	Ruby	3	0	\N	6	2010-11-05 17:35:41	2018-02-18 18:14:04	2010-11-05 17:46:21
68298011	dd-agent	47	https://github.com/jnewland/dd-agent	Datadog Agent	Python	0	0	\N	1	2016-09-15 10:49:36	2018-02-18 18:14:09	2017-07-11 10:22:53
160534756	deploy	47	https://github.com/jnewland/deploy	A Probot app to trigger deployments on GitHub	JavaScript	0	0	\N	0	2018-12-05 13:00:23	2018-12-05 13:00:25	2018-12-05 13:00:46
291291859	dotfiles	47	https://github.com/jnewland/dotfiles	\N	\N	0	0	\N	0	2020-08-29 11:56:58	2020-08-29 11:57:02	2020-08-29 11:57:00
1272563	erlang.tmbundle	47	https://github.com/jnewland/erlang.tmbundle	TextMate support for Erlang	Erlang	1	0	\N	2	2011-01-19 20:00:13	2018-02-18 18:14:13	2011-01-27 19:06:27
954	fireeagle	47	https://github.com/jnewland/fireeagle	Ruby wrapper for Yahoo!'s FireEagle	Ruby	11	0	\N	40	2008-02-21 23:00:43	2019-08-13 10:21:29	2009-07-30 11:06:27
2181	db-populate	48	https://github.com/joshknowles/db-populate	Rake task to assist with bootstrapping a Rails project database	Ruby	16	0	\N	20	2008-03-02 21:22:30	2020-11-19 06:04:22	2008-03-26 16:39:58
68204	dotfiles	48	https://github.com/joshknowles/dotfiles	Misc configuration files	Shell	1	0	\N	4	2008-10-27 00:46:29	2019-08-13 10:39:40	2012-09-22 20:40:57
235583	ec2-chef-example	48	https://github.com/joshknowles/ec2-chef-example	Collection of Rake tasks and example Chef recipes used to automate the creation of EC2 instances	Ruby	1	0	\N	4	2009-06-24 18:56:56	2013-10-06 20:51:25	2009-06-24 18:58:49
6631941	feed_parser	48	https://github.com/joshknowles/feed_parser	\N	Ruby	1	0	\N	0	2012-11-10 18:24:39	2013-07-29 15:57:54	2012-11-10 21:34:16
196831	gitrdoc	48	https://github.com/joshknowles/gitrdoc	Generate RDoc for your GitHub project	Ruby	2	0	\N	15	2009-05-09 19:03:19	2019-08-13 11:25:19	2009-05-10 14:12:40
23322213	chrisdone-emacs	52	https://github.com/reinh/chrisdone-emacs	My Emacs configuration	\N	0	0	\N	0	2014-08-25 14:22:49	2014-08-23 10:57:50	2014-08-25 14:24:36
124511	joshknowles.github.com	48	https://github.com/joshknowles/joshknowles.github.com	Jekyll repository for http://joshknowles.com	\N	1	0	\N	2	2009-02-08 17:58:50	2019-08-13 10:59:27	2010-07-12 15:32:41
70012	pt	48	https://github.com/joshknowles/pt	Pivotal Tracker API & Report Generation	Ruby	2	0	\N	15	2008-10-31 06:26:22	2019-08-13 10:40:19	2008-11-01 13:15:26
2184	rspec-on-rails-matchers	48	https://github.com/joshknowles/rspec-on-rails-matchers	A collection of RSpec matchers to be used with the Ruby on Rails project	Ruby	37	2	\N	170	2008-03-02 21:34:31	2020-02-03 07:15:56	2008-03-26 16:40:02
68663	userscripts	48	https://github.com/joshknowles/userscripts	A collection of Userscripts for GreaseMonkey and Fluid	\N	1	1	\N	2	2008-10-28 01:46:59	2019-08-13 10:39:50	2017-07-16 08:05:58
213	arc	49	https://github.com/hornbeck/arc	My arc repo	Arc	3	0	\N	7	2008-02-02 01:05:31	2019-08-13 10:21:21	2008-03-26 16:10:51
307	blerb-core	49	https://github.com/hornbeck/blerb-core	blerb running on merb-core	Ruby	2	0	\N	27	2008-02-06 11:50:43	2019-08-13 10:21:21	2008-03-26 16:12:03
21093	fuzed	49	https://github.com/hornbeck/fuzed	A new revision of Fuzed, the Erlang-based frontend for web apps.	Erlang	0	0	\N	2	2008-05-31 17:54:03	2019-08-13 10:25:37	2008-05-31 17:54:04
207077	Little-Erlanger	49	https://github.com/hornbeck/Little-Erlanger	\N	Erlang	2	0	\N	9	2009-05-21 16:41:49	2017-11-13 12:01:11	2011-07-22 15:29:26
7310518	resumatoR	49	https://github.com/hornbeck/resumatoR	R package for the Resumator API	R	1	0	\N	1	2012-12-24 16:44:14	2013-10-02 03:07:11	2013-02-11 02:53:01
840329	rubyzilla	49	https://github.com/hornbeck/rubyzilla	A ruby API for interfacing with bugzilla.	Ruby	1	0	\N	1	2010-08-16 01:58:30	2012-12-15 00:12:19	2010-08-16 02:16:34
26388820	test	49	https://github.com/hornbeck/test	\N	\N	0	0	\N	0	2014-11-09 05:29:32	2014-11-09 05:29:32	2014-11-09 05:29:32
7297812	zendeskR	49	https://github.com/hornbeck/zendeskR	R wrapper for Zendesk API	R	1	0	\N	0	2012-12-23 16:47:21	2013-02-04 18:48:00	2013-02-04 18:45:31
23227978	adarkroom	50	https://github.com/jwhitmire/adarkroom	A Dark Room - A Minimalist Text Adventure	\N	1	0	\N	0	2014-08-22 11:25:25	2014-08-21 00:59:31	2014-08-21 17:23:21
122758676	alchemist.el	50	https://github.com/jwhitmire/alchemist.el	Elixir Tooling Integration Into Emacs	Emacs Lisp	0	0	\N	0	2018-02-24 13:40:36	2018-02-24 13:40:38	2018-02-23 05:28:47
12438440	alfred-terminal-control	50	https://github.com/jwhitmire/alfred-terminal-control	Alfred Workflow for Managing Apple Terminal Windows	Ruby	1	0	\N	0	2013-08-28 13:10:52	2013-08-28 13:10:53	2013-05-12 10:56:01
14092219	chruby.el	50	https://github.com/jwhitmire/chruby.el	Emacs support for the Chruby version switcher for Ruby	Emacs Lisp	1	0	\N	0	2013-11-03 17:53:26	2014-07-08 14:21:52	2014-07-08 14:21:52
51152058	code-kata	50	https://github.com/jwhitmire/code-kata	\N	Ruby	1	0	\N	0	2016-02-05 12:43:52	2019-02-14 21:26:09	2016-02-05 13:12:26
15234645	csv-mode	50	https://github.com/jwhitmire/csv-mode	Updated csv-mode for emacs	Emacs Lisp	1	0	\N	1	2013-12-16 17:12:51	2021-01-17 12:15:20	2013-12-16 17:47:22
21664881	dev-themes	50	https://github.com/jwhitmire/dev-themes	Various collection of development tool themes	Emacs Lisp	1	0	\N	1	2014-07-09 16:02:07	2014-07-13 10:40:36	2014-07-09 20:29:46
453459	dial-a-script	50	https://github.com/jwhitmire/dial-a-script	Helpful stuff I put in my ~/bin directory to keep me fat and lazy	Shell	1	0	\N	1	2009-12-30 13:40:14	2014-02-07 22:09:33	2010-03-08 12:27:18
5007766	donors_choose_gem	50	https://github.com/jwhitmire/donors_choose_gem	\N	Ruby	1	0	\N	1	2012-07-12 15:01:58	2013-01-11 01:33:26	2012-07-12 14:57:50
23680763	dotfiles	50	https://github.com/jwhitmire/dotfiles	My dotfiles reset	Shell	1	0	\N	1	2014-09-04 18:53:19	2017-02-05 02:29:08	2017-05-11 23:12:21
18347159	emacs24-starter-kit	50	https://github.com/jwhitmire/emacs24-starter-kit	A cleaner version of the literate starter kit based on Emacs24	Emacs Lisp	1	0	\N	0	2014-04-01 19:29:13	2014-04-14 21:04:15	2014-07-02 23:54:03
13708734	enhanced-ruby-mode	50	https://github.com/jwhitmire/enhanced-ruby-mode	An enhanced ruby-mode for Emacs that uses Ripper in ruby 1.9.2 to highlight and indent the source code	Emacs Lisp	1	0	\N	0	2013-10-19 18:02:40	2013-10-19 18:02:40	2013-09-16 18:13:27
23736145	factory_girl	50	https://github.com/jwhitmire/factory_girl	A library for setting up Ruby objects as test data.	\N	0	0	\N	0	2014-09-06 11:15:18	2014-09-05 21:54:03	2015-07-11 01:30:05
7401731	fbootstrapp	50	https://github.com/jwhitmire/fbootstrapp	HTML, CSS, and JS toolkit for facebook apps	JavaScript	0	0	\N	0	2013-01-02 01:07:48	2013-01-13 19:52:39	2012-01-17 14:16:41
251017	feedzirra	50	https://github.com/jwhitmire/feedzirra	A feed fetching and parsing library that treats the internet like Godzilla treats Japan: it dominates and eats all.	Ruby	1	0	\N	1	2009-07-14 13:10:45	2014-03-17 10:01:51	2009-07-14 14:23:14
13569744	Ghost	50	https://github.com/jwhitmire/Ghost	Just a blogging platform	JavaScript	1	0	\N	0	2013-10-14 15:39:33	2015-03-09 21:44:39	2013-10-24 11:21:56
90326910	habitica	50	https://github.com/jwhitmire/habitica	A habit tracker app which treats your goals like a Role Playing Game.	JavaScript	0	0	\N	0	2017-05-04 22:58:47	2017-05-04 22:58:58	2017-05-04 13:11:59
2757392	hubot	50	https://github.com/jwhitmire/hubot	A customizable, kegerator-powered life embetterment robot.	CoffeeScript	0	0	\N	1	2011-11-11 15:35:17	2017-06-12 12:25:17	2011-11-10 12:13:54
2757416	hubot-scripts	50	https://github.com/jwhitmire/hubot-scripts	optional scripts for hubot, opt in via hubot-scripts.json	CoffeeScript	0	0	\N	1	2011-11-11 15:38:17	2013-01-04 13:13:03	2011-11-11 07:14:11
70613908	jdubdox	50	https://github.com/jwhitmire/jdubdox	Kiibohd Controller	C	0	0	\N	0	2016-10-11 13:36:33	2019-03-01 15:28:53	2019-03-01 15:28:00
8630174	jwhitmire.github.com	50	https://github.com/jwhitmire/jwhitmire.github.com	\N	\N	1	0	\N	1	2013-03-07 12:19:57	2014-10-04 12:29:59	2013-03-07 12:19:57
395495	lazy_developer	50	https://github.com/jwhitmire/lazy_developer	Rake tasks to make working with Rails apps a bit easier.	Ruby	1	0	\N	1	2009-12-04 14:09:25	2016-07-26 13:14:08	2009-12-04 15:23:35
726	llor-nu-legacy	50	https://github.com/jwhitmire/llor-nu-legacy	Legacy code from the original llor.nu site	Ruby	3	0	\N	12	2008-02-18 16:20:34	2019-08-13 10:21:26	2011-04-15 19:00:17
314651287	neofetch	50	https://github.com/jwhitmire/neofetch	🖼️  A command-line system information tool written in bash 3.2+	\N	0	0	\N	0	2020-11-20 16:32:38	2020-11-20 16:32:39	2020-11-17 13:43:57
190240986	prezto	50	https://github.com/jwhitmire/prezto	The configuration framework for Zsh	Shell	0	0	\N	0	2019-06-04 13:33:52	2020-04-02 14:21:14	2020-04-02 14:21:06
9782948	rails	50	https://github.com/jwhitmire/rails	Ruby on Rails	Ruby	0	0	\N	0	2013-04-30 21:27:33	2015-03-09 21:47:40	2013-08-13 19:01:38
9826036	rails-api	50	https://github.com/jwhitmire/rails-api	Rails for API only applications	Ruby	1	0	\N	0	2013-05-02 22:11:57	2013-05-02 22:11:57	2013-04-23 08:00:16
5666209	rails-diplomacy	50	https://github.com/jwhitmire/rails-diplomacy	Web Based Diplomacy	Ruby	1	0	\N	0	2012-09-03 22:50:54	2013-01-12 00:22:48	2012-05-21 19:57:29
14647487	replace-colorthemes	50	https://github.com/jwhitmire/replace-colorthemes	Replace color-theme with Emacs theme framework	Emacs Lisp	1	0	\N	0	2013-11-23 15:59:37	2014-07-09 15:53:25	2014-07-09 15:53:25
53331	rspec_validation_expectations	50	https://github.com/jwhitmire/rspec_validation_expectations	Adds several handy expectations for testing ActiveRecord model validations.	Ruby	1	0	\N	3	2008-09-16 19:46:50	2019-08-13 10:35:20	2010-05-12 00:25:24
269197342	activeresource	51	https://github.com/elbowdonkey/activeresource	Connects business objects and REST web services	\N	0	0	\N	0	2020-06-03 18:22:12	2020-06-03 18:22:13	2020-06-04 14:03:29
233139335	active_remote	51	https://github.com/elbowdonkey/active_remote	Active Remote provides Active Record-like object-relational mapping over RPC. It's Active Record for your platform.	\N	0	0	\N	0	2020-01-10 19:15:42	2020-01-10 19:15:43	2020-01-14 14:12:48
36535615	antimony	51	https://github.com/elbowdonkey/antimony	CAD from a parallel universe	C++	0	0	\N	0	2015-05-29 21:10:00	2015-05-29 21:10:01	2015-05-29 18:58:07
112361	axonome	51	https://github.com/elbowdonkey/axonome	javascript isometric rendering kit	JavaScript	7	1	\N	91	2009-01-22 03:05:05	2020-06-20 07:48:04	2011-04-12 14:50:55
10699429	balsa_chopper	51	https://github.com/elbowdonkey/balsa_chopper	OpenSCAD Balsa Chopper	\N	0	0	\N	0	2013-06-14 20:05:32	2013-10-14 05:25:15	2013-06-14 20:33:44
210478316	beef	51	https://github.com/elbowdonkey/beef	The Browser Exploitation Framework Project	\N	0	0	\N	0	2019-09-23 21:40:41	2019-09-23 21:40:42	2019-09-23 04:12:26
12066331	bradwii_arduino	51	https://github.com/elbowdonkey/bradwii_arduino	BradWii Multi-Copter software for Arduino	C++	0	0	\N	0	2013-08-12 18:04:19	2013-08-12 23:17:10	2013-08-12 23:15:40
86486209	eco	51	https://github.com/elbowdonkey/eco	Embedded CoffeeScript templates	CoffeeScript	0	0	\N	0	2017-03-28 14:07:26	2017-03-28 14:07:27	2017-03-28 14:17:06
73876230	elbowdonkey.github.io	51	https://github.com/elbowdonkey/elbowdonkey.github.io	\N	\N	0	0	\N	0	2016-11-16 00:36:21	2016-11-16 00:36:21	2016-11-16 00:41:52
3276699	ember.js	51	https://github.com/elbowdonkey/ember.js	Ember.js - formerly known as SproutCore 2.0	JavaScript	0	0	\N	1	2012-01-26 17:32:53	2013-01-06 18:24:27	2012-01-26 17:05:11
4627801	flightcontrol	51	https://github.com/elbowdonkey/flightcontrol	\N	Java	0	0	\N	1	2012-06-11 14:13:38	2013-03-06 14:18:10	2012-06-11 21:07:00
6237186	gcode_to_canvas	51	https://github.com/elbowdonkey/gcode_to_canvas	A humble GCode simulator.	JavaScript	0	0	\N	0	2012-10-15 22:33:49	2013-10-06 16:08:41	2012-10-16 01:39:19
2386450	gitignore	51	https://github.com/elbowdonkey/gitignore	A collection of useful .gitignore templates	\N	0	0	\N	1	2011-09-14 13:04:30	2013-01-04 03:51:20	2011-09-14 03:31:09
24970687	hero-starter	51	https://github.com/elbowdonkey/hero-starter	\N	\N	1	1	\N	0	2014-10-08 23:43:06	2014-10-08 23:42:07	2017-09-26 21:14:37
10976544	hubot	51	https://github.com/elbowdonkey/hubot	A customizable, kegerator-powered life embetterment robot.	CoffeeScript	0	0	\N	0	2013-06-26 16:11:50	2017-06-12 12:25:35	2013-06-26 16:40:10
120485851	i18n-tasks	51	https://github.com/elbowdonkey/i18n-tasks	Manage translation and localization with static analysis, for Ruby i18n	Ruby	0	0	\N	0	2018-02-06 14:14:26	2018-02-06 14:14:28	2018-02-06 14:39:16
1379755	impsock	51	https://github.com/elbowdonkey/impsock	\N	C++	8	1	\N	38	2011-02-17 18:37:05	2014-01-03 11:48:36	2017-10-01 18:34:34
5447904	infiniteexcitebike	51	https://github.com/elbowdonkey/infiniteexcitebike	\N	JavaScript	0	0	\N	0	2012-08-17 01:12:23	2014-04-23 10:35:42	2013-08-02 16:57:32
1631612	IsometricMap	51	https://github.com/elbowdonkey/IsometricMap	Isometric projection maps in Impact	JavaScript	7	0	\N	19	2011-04-18 14:14:49	2014-12-04 10:23:15	2011-04-18 14:18:41
12902123	isopaint	51	https://github.com/elbowdonkey/isopaint	An isometric pixel art drawing tool.	JavaScript	0	0	\N	1	2013-09-17 14:33:39	2013-12-26 11:49:53	2013-09-27 14:23:24
12261383	jasmine-jquery	51	https://github.com/elbowdonkey/jasmine-jquery	jQuery matchers and fixture loader for Jasmine framework	JavaScript	0	0	\N	0	2013-08-21 01:43:15	2013-08-21 04:56:19	2013-08-21 02:54:31
12262652	jasminerice	51	https://github.com/elbowdonkey/jasminerice	Pain free coffeescript testing under Rails 3.1	Ruby	1	0	\N	0	2013-08-21 03:08:44	2013-08-21 03:08:46	2013-08-06 18:21:35
5695427	js_state	51	https://github.com/elbowdonkey/js_state	A simple Javascript state machine.	JavaScript	0	0	\N	1	2012-09-05 21:24:58	2014-04-25 15:13:21	2012-10-15 21:35:14
17353791	mbpro_tidy	51	https://github.com/elbowdonkey/mbpro_tidy	3D printable thing that aligns Magsafe, Thunderbolt, and USB connections for a 15" Retina Macbook Pro	\N	3	0	\N	9	2014-03-03 00:14:03	2020-10-31 21:22:10	2014-03-03 00:15:24
7022473	MCAD	51	https://github.com/elbowdonkey/MCAD	OpenSCAD Parametric CAD Library (LGPL 2.1)	Python	0	0	\N	0	2012-12-05 16:34:25	2013-01-13 10:38:27	2012-08-07 10:50:09
83247477	metasploit-framework	51	https://github.com/elbowdonkey/metasploit-framework	Metasploit Framework	Ruby	0	0	\N	0	2017-02-26 20:10:17	2017-02-26 20:10:42	2017-02-26 17:29:58
229328737	minimagick	51	https://github.com/elbowdonkey/minimagick	mini replacement for RMagick	\N	0	0	\N	0	2019-12-20 17:03:24	2019-12-20 17:03:26	2019-10-11 14:07:28
197667462	mxcpu	51	https://github.com/elbowdonkey/mxcpu	Arecibo / MXCPU Billboard Puzzle	JavaScript	0	0	\N	0	2019-07-18 20:01:38	2019-07-18 20:01:41	2019-04-15 06:54:24
120792730	nocode	51	https://github.com/elbowdonkey/nocode	The best way to write secure and reliable applications. Write nothing; deploy nowhere.	\N	0	0	\N	0	2018-02-08 15:17:56	2018-02-08 15:17:23	2018-02-08 14:37:47
10632322	octopress	51	https://github.com/elbowdonkey/octopress	Octopress is an obsessively designed framework for Jekyll blogging. It’s easy to configure and easy to deploy. Sweet huh?	Ruby	0	0	\N	0	2013-06-11 19:35:06	2013-06-15 13:55:39	2013-06-11 20:00:18
43190	accord	52	https://github.com/reinh/accord	Chord and scale definition library. Ruby. Work in progress.	Ruby	0	0	\N	4	2008-08-16 15:11:18	2019-08-13 10:31:52	2008-08-16 15:11:42
9338746	allong.es	52	https://github.com/reinh/allong.es	\N	JavaScript	0	0	\N	0	2013-04-10 02:20:50	2013-12-04 20:34:54	2013-04-10 02:21:15
23329386	ansible-vagrant-examples	52	https://github.com/reinh/ansible-vagrant-examples	Ansible examples using Vagrant to deploy to local VMs.	\N	0	0	\N	0	2014-08-25 18:30:21	2014-08-24 18:44:28	2014-08-24 23:44:06
41408	archaeopteryx	52	https://github.com/reinh/archaeopteryx	Ruby MIDI DJing/live-coding thing	Ruby	1	0	\N	2	2008-08-09 20:39:49	2019-08-13 10:31:15	2008-08-09 20:39:52
7948178	asciidoctor	52	https://github.com/reinh/asciidoctor	An open source Ruby processor for converting AsciiDoc source files or strings into HTML 5, DocBook 4.5 and other formats.	Ruby	0	0	\N	0	2013-01-31 21:41:26	2013-12-04 20:34:54	2013-02-01 00:03:44
880022	Atatonic-CSS-Framework	52	https://github.com/reinh/Atatonic-CSS-Framework	A CSS Framework with it's main focus on solid typography.	\N	1	0	\N	3	2010-09-01 15:29:52	2016-05-09 23:50:54	2009-08-30 09:53:14
220497	authlogic	52	https://github.com/reinh/authlogic	A clean, simple, and unobtrusive ruby authentication solution.	Ruby	1	0	\N	1	2009-06-06 18:46:54	2014-10-30 18:57:29	2009-06-06 18:47:43
4178680	backbone-rails	52	https://github.com/reinh/backbone-rails	Easily use backbone.js with rails 3.1	Ruby	0	0	\N	1	2012-04-29 21:39:59	2013-12-04 20:34:56	2012-04-29 21:42:27
753930	baretest	52	https://github.com/reinh/baretest	A testframework that doesn't stand in your way or forces you to learn a new language. Two methods is all that is required to know.\nIf you need it, it provides you with all kinds of features to support you\nwriting your tests.	Ruby	1	0	\N	1	2010-07-02 15:09:23	2013-12-04 20:34:56	2010-06-10 23:23:43
2357950	batunit	52	https://github.com/reinh/batunit	Bourne Again Test Unit framework	Shell	0	0	\N	3	2011-09-09 17:40:07	2013-12-04 20:34:56	2011-09-09 19:19:05
215115577	beyond-blameless	52	https://github.com/reinh/beyond-blameless	Resources for Rein's talk, Beyond Blameless	\N	0	0	\N	0	2019-10-14 15:20:17	2019-10-14 15:25:01	2019-10-14 15:24:12
13089	bin	52	https://github.com/reinh/bin	My ~/bin	Ruby	0	0	\N	2	2008-04-28 14:23:03	2019-08-13 10:23:42	2008-04-28 14:23:18
76611957	callouts	52	https://github.com/reinh/callouts	Destiny callout maps	Ruby	0	0	\N	0	2016-12-15 23:56:25	2016-12-16 02:35:57	2016-12-16 02:58:25
65316364	cheat	52	https://github.com/reinh/cheat	Manage text cheat sheets from multiple (git) sources.	Shell	0	0	\N	1	2016-08-09 14:52:34	2016-10-01 03:07:14	2016-08-12 20:12:23
8734993	cloud-to-butt	52	https://github.com/reinh/cloud-to-butt	Chrome extension that replaces occurrences of 'the cloud' with 'my butt'	JavaScript	0	0	\N	0	2013-03-12 15:20:30	2013-12-04 20:34:57	2013-03-12 15:21:16
19874475	CodeSearch	52	https://github.com/reinh/CodeSearch	google codesearch in Haskell. Do not use this for anything.	Haskell	0	0	\N	0	2014-05-16 21:19:12	2014-05-20 23:01:57	2014-05-20 23:01:55
647381	codr	52	https://github.com/reinh/codr	Convert ruby code with comments to Markdown	Ruby	0	0	\N	1	2010-05-04 18:55:21	2013-12-06 01:38:40	2010-05-04 19:50:25
9015950	coffeequest	52	https://github.com/reinh/coffeequest	\N	CoffeeScript	0	0	\N	0	2013-03-25 18:04:18	2014-03-05 03:52:50	2013-03-28 13:10:06
9156508	coffeescript-stemcell	52	https://github.com/reinh/coffeescript-stemcell	\N	CoffeeScript	0	0	\N	0	2013-04-01 18:29:38	2013-12-04 20:34:58	2013-04-01 18:29:56
286525475	cognitive-systems-engineering	52	https://github.com/reinh/cognitive-systems-engineering	\N	\N	1	0	\N	0	2020-08-10 13:27:42	2020-08-10 13:27:43	2020-08-10 13:28:15
679618	commandant	52	https://github.com/reinh/commandant	A simple library for writing commands with subcommands (like git)	Ruby	1	0	\N	5	2010-05-21 17:23:59	2014-04-17 09:48:55	2010-05-21 23:00:08
884437	compass-wordpress	52	https://github.com/reinh/compass-wordpress	Compass plugin for creating WordPress themes using Sass	PHP	1	0	\N	2	2010-09-02 18:48:11	2013-12-04 20:34:59	2010-06-30 11:53:11
2464450	config_badger	52	https://github.com/reinh/config_badger	Config badger don't care.	Ruby	0	1	\N	3	2011-09-26 21:23:45	2014-02-25 00:09:03	2011-09-27 21:08:22
38273176	Contract_Automation_Using_LaTeX	52	https://github.com/reinh/Contract_Automation_Using_LaTeX	Automated contract template in LaTeX that includes fill-in-the-blank fields, conditional clauses, and automatic paragraph numbering.	TeX	0	0	\N	0	2015-06-29 18:51:27	2015-06-29 18:51:28	2013-08-20 17:22:11
25222107	coreos-vagrant-flannel-kubernetes-libswarm-panamax-deis-kibana-elastisearch-grafana-influxdb-galera	52	https://github.com/reinh/coreos-vagrant-flannel-kubernetes-libswarm-panamax-deis-kibana-elastisearch-grafana-influxdb-galera	Vagrant CoreOS with Flannel, Kubernetes, libswarm, Panamax, Deis, Kibana, Logstash, Logspout, Fail2Ban, ElasticSearch, Heapster, Grafana, Influxdb, cadvisor, Galera MySQL, and Zookeeper for good measure.	\N	0	0	\N	1	2014-10-14 16:07:06	2019-03-02 00:31:07	2014-10-14 03:00:57
89172397	CS410-16	52	https://github.com/reinh/CS410-16	being the lecture materials and exercises for the 2016/17 session of Advanced Functional Programming at Strathclyde	Agda	0	0	\N	0	2017-04-23 18:03:30	2017-04-23 18:03:31	2017-04-11 14:25:06
30936009	cufp.org	52	https://github.com/reinh/cufp.org	Implementation of the cufp.org website.	CSS	0	0	\N	0	2015-02-17 18:24:25	2015-02-17 18:24:25	2015-02-17 18:26:33
9120894	d3js-stemcell	52	https://github.com/reinh/d3js-stemcell	\N	CoffeeScript	0	0	\N	0	2013-03-30 16:39:40	2014-01-18 14:12:06	2013-03-30 16:44:56
3036147	data	52	https://github.com/reinh/data	A data persistence library for Ember.js.	JavaScript	0	0	\N	1	2011-12-22 17:37:33	2013-12-04 20:35:00	2011-12-22 17:39:06
54096	arts	53	https://github.com/knzconnor/arts	Mirror of the ARTS Rails plugin.	Ruby	2	0	\N	8	2008-09-18 19:44:41	2019-08-13 10:35:35	2008-09-18 19:48:08
1228953	benchmark-timed_each	53	https://github.com/knzconnor/benchmark-timed_each	A wrapper for Benchmark.benchmark that enmurates over a collection	Ruby	0	0	\N	1	2011-01-07 06:24:29	2013-11-04 02:11:33	2011-01-07 07:20:04
170682	cache_fu	53	https://github.com/knzconnor/cache_fu	Everyone's favorite memcached plugin for ActiveRecord.	Ruby	1	0	\N	7	2009-04-07 22:40:35	2019-08-13 11:16:11	2009-04-07 22:49:22
25240690	cocoon	53	https://github.com/knzconnor/cocoon	A Rails development Vagrant box.	Ruby	0	0	\N	0	2014-10-15 02:50:22	2014-10-15 03:07:41	2014-10-15 03:12:15
177733	dotfiles	53	https://github.com/knzconnor/dotfiles	Kenzi Connor's dot and lib files	Ruby	1	0	\N	5	2009-04-16 14:14:36	2019-11-21 19:59:05	2019-11-21 19:59:03
223284483	faker	53	https://github.com/knzconnor/faker	A library for generating fake data such as names, addresses, and phone numbers.	\N	0	0	\N	0	2019-11-21 20:33:38	2019-11-21 20:33:39	2019-11-21 08:11:14
1354005	jasmine-fixtures	53	https://github.com/knzconnor/jasmine-fixtures	Fixture loader for Jasmine	Ruby	0	0	\N	1	2011-02-11 04:28:15	2012-12-18 20:28:06	2011-02-10 21:20:43
75871346	osm-feeds	53	https://github.com/knzconnor/osm-feeds	Sinatra-based proxy for accessing web APIs for Open Source Malaria	Ruby	0	0	\N	0	2016-12-07 18:05:28	2016-12-07 18:05:29	2015-06-09 23:01:06
2271536	pivotal_workstation	53	https://github.com/knzconnor/pivotal_workstation	A cookbook of recipes for an OSX workstation	Ruby	0	0	\N	1	2011-08-25 21:40:07	2014-04-13 13:07:14	2011-09-20 04:47:03
733054	progit	53	https://github.com/knzconnor/progit	Pro Git Book Content	Shell	1	0	\N	1	2010-06-21 21:52:54	2012-12-14 17:13:28	2010-05-29 09:26:49
641100	rack	53	https://github.com/knzconnor/rack	a modular Ruby webserver interface	Ruby	1	0	\N	2	2010-05-01 04:04:26	2021-01-13 16:28:54	2010-05-03 13:09:07
181272	rack-bug	53	https://github.com/knzconnor/rack-bug	Debugging toolbar for Rack applications implemented as middleware	Ruby	1	0	\N	10	2009-04-20 19:30:27	2019-08-13 11:19:53	2010-10-22 03:12:03
178698	rack-flash	53	https://github.com/knzconnor/rack-flash	Flash messages for Rack applications implemented as middleware.	Ruby	0	0	\N	4	2009-04-17 14:44:17	2019-08-13 11:18:55	2009-05-01 12:18:20
622969	rack-test	53	https://github.com/knzconnor/rack-test	Rack::Test is a layer on top of Rack's MockRequest similar to Merb's RequestHelper	Ruby	1	0	\N	1	2010-04-22 03:26:51	2020-04-08 16:35:52	2010-04-22 04:29:59
596619	rakegem	53	https://github.com/knzconnor/rakegem	Simple gem and release management with customizable Rake tasks.	Ruby	1	0	\N	1	2010-04-06 02:38:38	2012-12-14 01:28:51	2010-04-06 16:22:19
2991	range_set	53	https://github.com/knzconnor/range_set	class that supports set operations on ranges	Ruby	0	0	\N	3	2008-03-07 18:54:01	2019-08-13 10:21:51	2008-03-26 17:01:55
1276819	resque-scheduler	53	https://github.com/knzconnor/resque-scheduler	A light-weight job scheduling system built on top of resque	Ruby	0	0	\N	1	2011-01-20 23:35:07	2012-12-17 17:26:53	2011-01-14 15:42:30
1345287	rspec-core	53	https://github.com/knzconnor/rspec-core	Rspec-2 runner and formatters	Ruby	0	0	\N	1	2011-02-09 04:36:39	2013-09-19 10:10:25	2011-02-09 06:22:13
1345254	rspec-dev	53	https://github.com/knzconnor/rspec-dev	Rspec-2 development environment	\N	0	0	\N	1	2011-02-09 04:18:59	2012-12-17 22:08:39	2011-02-07 02:51:23
160338	ruby-tmbundle	53	https://github.com/knzconnor/ruby-tmbundle	Ruby TextMate bundle	Ruby	0	0	\N	2	2009-03-26 17:14:41	2019-08-13 11:12:36	2009-03-26 17:39:23
76741425	sb.StardustSuite	53	https://github.com/knzconnor/sb.StardustSuite	Starbound mod suite!	Lua	0	0	\N	0	2016-12-17 16:59:01	2016-12-17 16:59:03	2016-10-31 18:57:17
15721	screw-unit	53	https://github.com/knzconnor/screw-unit	A Javascript BDD Framework with nested describes, a convenient assertion syntax, and an intuitive test browser.	JavaScript	0	0	\N	3	2008-05-09 18:55:32	2019-08-13 10:24:17	2008-07-31 17:26:44
135610	skynet	53	https://github.com/knzconnor/skynet	\N	Ruby	0	0	\N	2	2009-02-23 16:49:12	2019-08-13 11:03:17	2009-02-23 19:03:49
1452828	snippets	53	https://github.com/knzconnor/snippets	A rubygem/rails-engine for editing snippets of markdown that compiled to html	Ruby	0	0	\N	1	2011-03-07 22:33:19	2014-04-21 13:40:02	2011-03-16 00:31:08
155148968	Techguns2	53	https://github.com/knzconnor/Techguns2	1.12 Port/Rewrite of Techguns mod for Minecraft. WIP	Java	0	0	\N	0	2018-10-29 00:49:00	2018-10-29 00:49:05	2018-07-15 11:21:29
3931156	jetty-hello-world	73	https://github.com/sam/jetty-hello-world	\N	Ruby	6	0	\N	1	2012-04-04 14:21:30	2018-07-04 02:36:39	2012-06-14 12:22:15
106087	test_benchmark	53	https://github.com/knzconnor/test_benchmark	 *NOT ACTIVELY MAINTAINED* Rails plugin (and/or ruby gem) for benchmarking your test::units: a rework of the original by topfunky	Ruby	10	3	\N	62	2009-01-12 19:27:58	2019-08-13 10:53:13	2010-10-24 00:27:21
596319	turn	53	https://github.com/knzconnor/turn	A new look and feel for Test::Unit output -- Test::Unit Reporter (New)	Ruby	1	0	\N	1	2010-04-05 21:51:16	2012-12-14 01:28:16	2010-03-09 04:44:44
91629	utility-belt	53	https://github.com/knzconnor/utility-belt	IRB Power User Utility Belt	Ruby	1	0	\N	3	2008-12-16 18:54:23	2019-08-13 10:48:04	2008-12-18 19:56:43
1354008	vcr	53	https://github.com/knzconnor/vcr	Record your test suite's HTTP interactions and replay them during future test runs for fast, deterministic, accurate tests.	Ruby	0	0	\N	1	2011-02-11 04:30:06	2012-12-18 20:28:07	2011-02-10 15:31:37
31114087	AlarmServer	68	https://github.com/bs/AlarmServer	Envisalink 2DS/3 Alarm Server (Proxy & HTTP/JSON)	JavaScript	0	0	\N	0	2015-02-21 01:27:35	2015-02-21 01:27:37	2014-08-01 15:03:56
307810367	alfred-github-workflow	68	https://github.com/bs/alfred-github-workflow	GitHub Workflow for Alfred 3/4	\N	0	0	\N	0	2020-10-27 16:44:49	2020-10-27 16:44:50	2020-10-27 16:48:20
261890609	alfred-pinboard-rs	68	https://github.com/bs/alfred-pinboard-rs	Alfred Workflow for Pinboard (Rust)	\N	0	0	\N	0	2020-05-06 19:16:04	2020-05-06 19:16:05	2020-05-07 00:55:11
264803203	awesome-go	68	https://github.com/bs/awesome-go	A curated list of awesome Go frameworks, libraries and software	\N	0	0	\N	0	2020-05-17 23:22:45	2020-05-17 23:22:46	2020-05-17 21:28:54
89535748	browser-laptop	68	https://github.com/bs/browser-laptop	Brave browser for Desktop and Laptop computers running Windows, OSX, and Linux	JavaScript	1	0	\N	1	2017-04-26 20:33:25	2018-03-21 23:06:12	2017-05-01 18:56:24
299419926	cocktail-party-problem	68	https://github.com/bs/cocktail-party-problem	\N	Jupyter Notebook	1	0	\N	0	2020-09-28 17:08:19	2020-11-18 14:45:17	2020-09-28 17:46:21
305933971	dendron	68	https://github.com/bs/dendron	The personal knowledge management (PKM) tool that grows as you do!	TypeScript	0	0	\N	0	2020-10-21 03:51:19	2020-11-16 00:08:46	2020-11-16 00:08:35
300121893	dendron-template	68	https://github.com/bs/dendron-template	Getting started with Dendron	JavaScript	0	0	\N	0	2020-09-30 23:55:05	2020-11-04 12:02:14	2020-11-04 12:02:04
6522466	dotfiles	68	https://github.com/bs/dotfiles	.dotfiles :)	CSS	0	0	\N	0	2012-11-03 16:04:34	2020-10-29 17:57:48	2020-10-29 17:57:46
38635262	forkmysite	68	https://github.com/bs/forkmysite	Templates to forkmysite.com	HTML	0	0	\N	0	2015-07-06 14:41:28	2015-07-06 14:41:28	2015-07-06 14:40:21
241291857	from_zero_to_DSP	68	https://github.com/bs/from_zero_to_DSP	\N	\N	0	0	\N	0	2020-02-18 03:47:13	2020-02-18 03:47:14	2020-02-14 02:07:45
292749690	Glass-Dome	68	https://github.com/bs/Glass-Dome	An Alfred workflow to fight link rot in Markdown notes.	\N	0	0	\N	0	2020-09-04 01:34:09	2020-09-04 01:34:11	2020-08-04 12:35:02
305188306	hello-github-actions	68	https://github.com/bs/hello-github-actions	\N	\N	0	1	\N	0	2020-10-18 17:16:41	2020-10-18 17:16:48	2020-10-18 17:16:46
79787851	homebridge-nest	68	https://github.com/bs/homebridge-nest	Nest plugin for HomeBridge	JavaScript	0	0	\N	0	2017-01-23 07:05:35	2017-01-23 07:05:37	2017-01-23 07:07:08
226281531	jekyll-compose	68	https://github.com/bs/jekyll-compose	:memo: Streamline your writing in Jekyll with these commands.	\N	0	0	\N	0	2019-12-06 05:29:54	2019-12-06 05:29:57	2019-12-03 17:55:51
14643523	jschesstest	68	https://github.com/bs/jschesstest	\N	JavaScript	0	1	\N	0	2013-11-23 12:15:44	2013-12-06 05:10:15	2017-07-16 08:16:35
88210253	machine-learning-for-software-engineers	68	https://github.com/bs/machine-learning-for-software-engineers	A complete daily plan for studying to become a machine learning engineer.	\N	1	0	\N	0	2017-04-13 19:06:02	2017-04-13 18:54:53	2017-02-14 10:18:07
305188643	markdown-portfolio	68	https://github.com/bs/markdown-portfolio	\N	\N	0	1	\N	0	2020-10-18 17:18:38	2020-10-18 17:18:47	2020-10-18 17:18:42
264821178	my-mac-os	68	https://github.com/bs/my-mac-os	List of applications and tools that make my macOS experience even more amazing	\N	0	0	\N	0	2020-05-18 00:58:51	2020-05-18 00:58:53	2020-05-14 20:45:45
305188601	oss-enterprise	68	https://github.com/bs/oss-enterprise	\N	\N	0	1	\N	0	2020-10-18 17:18:27	2020-10-18 17:18:39	2020-10-18 17:18:32
271159516	p5.js-sound	68	https://github.com/bs/p5.js-sound	p5.sound brings the Processing approach to Web Audio and p5.js. Demos:	\N	0	0	\N	0	2020-06-09 23:39:05	2020-06-09 23:39:07	2020-06-06 10:05:01
552006	pleasejobme	68	https://github.com/bs/pleasejobme	A project to help people connect with Twitter Employees at SxSW.	JavaScript	0	1	\N	2	2010-03-08 02:10:00	2014-02-25 01:04:28	2017-07-16 08:02:19
280349805	shields	68	https://github.com/bs/shields	Concise, consistent, and legible badges in SVG and raster format	\N	0	0	\N	0	2020-07-17 03:52:23	2020-07-17 03:52:25	2020-07-16 17:23:35
90890833	signal-muon	68	https://github.com/bs/signal-muon	Signal Desktop using https://github.com/brave/muon instead of Chrome. Not affiliated with WhisperSystems.	JavaScript	0	0	\N	0	2017-05-10 14:28:29	2017-05-10 14:28:31	2017-05-10 14:36:55
69644476	SmartThingsPublic	68	https://github.com/bs/SmartThingsPublic	\N	Groovy	0	0	\N	0	2016-09-30 04:29:15	2016-09-30 04:29:31	2016-09-29 18:54:40
351	starling	68	https://github.com/bs/starling	Starling Message Queue	Ruby	2	1	\N	22	2008-02-08 20:52:06	2019-08-13 10:21:22	2017-07-16 08:02:58
296801231	TiddlyWiki5	68	https://github.com/bs/TiddlyWiki5	A self-contained JavaScript wiki for the browser, Node.js, AWS Lambda etc.	\N	0	0	\N	0	2020-09-19 03:30:23	2020-09-19 03:30:24	2020-09-17 10:14:41
301565450	vscode	68	https://github.com/bs/vscode	Visual Studio Code	\N	0	0	\N	0	2020-10-05 20:37:58	2020-10-05 20:38:00	2020-10-05 20:34:12
263779655	wikish	68	https://github.com/bs/wikish	A wiki-ish collection of thoughts and feelings	\N	1	0	\N	1	2020-05-13 21:58:58	2020-09-10 10:50:14	2020-05-18 04:11:52
305188621	writing-javascript-actions	68	https://github.com/bs/writing-javascript-actions	\N	\N	0	1	\N	0	2020-10-18 17:18:33	2020-10-18 17:18:41	2020-10-18 17:18:38
23890057	accept_these_tests	69	https://github.com/rsanheim/accept_these_tests	Template project using rspec and capybara with the selenium driver	\N	0	0	\N	0	2014-09-10 17:02:10	2013-11-25 22:17:34	2014-09-10 17:04:33
94474978	adr-tools	69	https://github.com/rsanheim/adr-tools	Command-line tools for working with Architecture Decision Records	Shell	0	0	\N	0	2017-06-15 17:10:04	2017-06-15 17:10:06	2017-05-31 18:38:13
83510725	avocado	69	https://github.com/rsanheim/avocado	\N	Ruby	0	0	\N	0	2017-03-01 01:15:49	2017-03-01 01:17:58	2017-10-11 12:00:18
324825	braincron	69	https://github.com/rsanheim/braincron	\N	Ruby	0	0	\N	2	2009-10-02 15:09:02	2019-08-06 16:54:49	2009-10-10 20:24:21
332709	braincron_consumer	69	https://github.com/rsanheim/braincron_consumer	\N	Ruby	0	0	\N	2	2009-10-09 21:05:03	2014-01-09 06:09:44	2009-10-09 22:00:16
430	brain_buster	69	https://github.com/rsanheim/brain_buster	BrainBuster - a logic captcha for Rails	Ruby	15	0	\N	60	2008-02-12 03:53:53	2020-02-26 08:36:38	2014-09-23 01:14:09
326844	chatterbox	69	https://github.com/rsanheim/chatterbox	This is not maintained.	Ruby	2	0	\N	21	2009-10-05 01:35:28	2014-04-17 17:19:37	2010-07-06 21:45:34
326811	chatterbox-email	69	https://github.com/rsanheim/chatterbox-email	\N	Ruby	0	0	\N	2	2009-10-05 00:31:15	2013-11-05 05:57:42	2009-10-05 01:43:25
306337	chef-repo	69	https://github.com/rsanheim/chef-repo	A blank Chef repository - useful to bootstrap your own	Ruby	1	0	\N	2	2009-09-14 03:50:28	2016-08-04 11:44:09	2009-10-10 16:06:26
333247	cloud-talk	69	https://github.com/rsanheim/cloud-talk	\N	\N	0	0	\N	2	2009-10-10 13:00:37	2014-01-14 06:49:53	2009-10-10 16:16:40
52705990	contextio-ruby	69	https://github.com/rsanheim/contextio-ruby	Provides Ruby interface to Context.IO	Ruby	2	1	\N	0	2016-02-28 02:17:58	2021-01-14 18:38:49	2017-09-26 21:15:04
12675018	deadlock_retry	69	https://github.com/rsanheim/deadlock_retry	Deadlock Retry plugin	Ruby	0	0	\N	0	2013-09-07 23:36:13	2013-09-08 20:51:27	2013-09-08 20:51:27
132791659	detox	69	https://github.com/rsanheim/detox	Gray Box End-to-End Testing and Automation Framework for Mobile Apps	JavaScript	0	0	\N	0	2018-05-09 14:33:16	2018-05-09 14:33:18	2018-05-09 07:43:00
44850973	dotfiles	69	https://github.com/rsanheim/dotfiles	here there be bash	Shell	0	0	\N	0	2015-10-24 01:39:06	2021-01-28 13:31:37	2021-01-28 13:31:34
118175347	dotfiles-1	69	https://github.com/rsanheim/dotfiles-1	originally derived from @holman/dotfiles	Ruby	0	0	\N	0	2018-01-19 18:31:53	2018-01-19 18:31:55	2018-01-19 18:39:45
9918614	email_reply_parser	69	https://github.com/rsanheim/email_reply_parser	A small ruby library to parse plain text email content to return only the reply.	Ruby	0	0	\N	0	2013-05-07 15:24:49	2014-04-29 09:14:28	2013-07-23 17:04:49
133434202	flipper	69	https://github.com/rsanheim/flipper	:dolphin: feature flipping for ruby (performant and simple)	Ruby	0	0	\N	0	2018-05-14 20:49:01	2018-05-14 20:49:03	2018-05-14 20:49:49
1948508	honey_badger	69	https://github.com/rsanheim/honey_badger	Honey Badger don't care - he will show your Rails.env, your deployment info, whatever.	Ruby	5	9	\N	50	2011-06-24 13:31:39	2019-08-13 11:46:58	2020-02-29 05:46:47
247146	isis	69	https://github.com/rsanheim/isis	isis	Ruby	0	0	\N	2	2009-07-09 11:08:56	2014-02-26 21:00:13	2009-09-12 23:23:37
5849154	madison-code-and-coffee	69	https://github.com/rsanheim/madison-code-and-coffee	A little repo to organize informal Madison morning coffee and hacking	\N	0	0	\N	5	2012-09-17 21:11:40	2019-08-13 12:09:14	2012-11-26 14:52:16
92316816	md2key	69	https://github.com/rsanheim/md2key	Convert markdown to keynote	Ruby	0	0	\N	0	2017-05-24 14:07:40	2017-05-24 14:07:42	2017-05-24 14:08:49
172967	micronaut	69	https://github.com/rsanheim/micronaut	The latest and greatest wheel to be invented yet	Ruby	0	0	\N	3	2009-04-10 16:01:15	2019-08-13 11:16:57	2009-03-28 00:56:32
149338292	multidb	69	https://github.com/rsanheim/multidb	An ActiveRecord extension to switch between multiple databases, such as in a master/slave setup	Ruby	0	0	\N	0	2018-09-18 16:01:03	2019-01-09 19:39:10	2018-09-19 12:42:55
821612	nachos	69	https://github.com/rsanheim/nachos	not maintained - use preflight https://github.com/rsanheim/preflight	Ruby	7	4	\N	16	2010-08-06 12:22:56	2015-09-08 10:00:12	2014-02-12 01:42:05
4360245	pairhost	69	https://github.com/rsanheim/pairhost	The ultimate EC2 remote pairing development environment	Shell	0	0	\N	1	2012-05-17 13:03:15	2013-01-09 03:31:34	2011-08-30 18:20:51
8345006	paper_trail	69	https://github.com/rsanheim/paper_trail	Track changes to your models' data.  Good for auditing or versioning.	Ruby	0	0	\N	0	2013-02-21 19:00:25	2018-05-08 12:04:36	2013-03-04 16:40:49
263363957	pfatt	69	https://github.com/rsanheim/pfatt	enable true bridge mode for AT&T U-Verse and pfSense (this is a fork of an original repository https://github.com/aus/pfatt. Since it is not available anymore, I'll do my best to maitain a copy for people that still need a bypass)	\N	0	0	\N	0	2020-05-12 11:40:59	2020-05-12 11:41:01	2020-05-06 14:55:40
3173455	pivotal_workstation	69	https://github.com/rsanheim/pivotal_workstation	A cookbook of recipes for an OSX workstation	Ruby	0	0	\N	1	2012-01-13 16:56:30	2013-01-05 18:30:05	2012-01-14 00:13:23
3912	prag_dave_testing	69	https://github.com/rsanheim/prag_dave_testing	Dave Thomas' proof of concept test library	Ruby	1	0	\N	8	2008-03-14 14:33:56	2019-08-13 10:22:03	2008-08-14 01:08:16
16676113	preflight	69	https://github.com/rsanheim/preflight	Keep your git repos up to date in the background	Ruby	3	0	\N	5	2014-02-09 19:26:58	2019-11-21 15:50:22	2019-11-21 15:50:22
18652806	3D-Me	70	https://github.com/schacon/3D-Me	Me, in 3D	\N	0	0	\N	0	2014-04-10 18:40:18	2014-04-10 18:53:58	2014-04-10 18:53:58
322596	aeon	70	https://github.com/schacon/aeon	An HD interface for XBMC	Python	0	0	\N	3	2009-09-30 15:44:58	2015-07-04 12:31:31	2009-09-28 23:16:07
265158	agitmemnon	70	https://github.com/schacon/agitmemnon	Git/Cassandra Ruby Library	JavaScript	2	0	\N	7	2009-07-30 18:28:26	2019-07-14 14:02:27	2009-09-08 19:50:17
271983	agitmemnon-server	70	https://github.com/schacon/agitmemnon-server	Cassandra/Git backed python Git server	Python	3	0	\N	11	2009-08-07 17:10:58	2021-01-13 16:26:53	2009-09-07 16:32:50
383605	amp	70	https://github.com/schacon/amp	Version Control in Ruby. Mercurial Compatible. Big ideas.	Ruby	2	0	\N	3	2009-11-24 06:04:38	2017-06-29 19:21:55	2009-12-16 20:47:42
453957	arel	70	https://github.com/schacon/arel	A Relational Algebra	Ruby	1	0	\N	3	2009-12-30 21:54:51	2017-06-29 19:21:55	2009-12-29 17:05:06
1399106	article	70	https://github.com/schacon/article	\N	C	0	0	\N	3	2011-02-22 16:53:35	2015-07-04 12:44:27	2011-02-28 21:38:15
24407924	asciidoc_samples	70	https://github.com/schacon/asciidoc_samples	This directory contains samples of Asciidoc source files, for use with our internal publishing tools.	\N	0	0	\N	0	2014-09-24 05:57:50	2014-09-22 16:16:09	2014-08-13 17:22:53
20140	asgit	70	https://github.com/schacon/asgit	ActionScript Git library and browser implementation	ActionScript	3	0	\N	40	2008-05-28 02:12:33	2019-08-13 10:25:20	2008-12-28 02:46:22
25365750	atlas-api	70	https://github.com/schacon/atlas-api	Gem to interact with the O'Reilly Atlas API	\N	0	0	\N	0	2014-10-17 12:58:38	2014-05-19 17:32:11	2014-03-04 16:54:03
151644	benchwarmer	70	https://github.com/schacon/benchwarmer	Prettier Benchmarking for Ruby	Ruby	1	0	\N	3	2009-03-15 20:59:48	2019-08-13 11:09:37	2008-05-06 04:11:23
18278583	binary-code	70	https://github.com/schacon/binary-code	Let's unravel the mysteries of binary code!	Python	4	0	\N	1	2014-03-30 22:35:46	2016-01-22 13:16:47	2014-04-05 13:58:08
2483488	blah	70	https://github.com/schacon/blah	\N	Ruby	1	0	\N	1	2011-09-29 14:08:28	2017-06-29 19:22:08	2011-09-29 14:18:06
20782866	blink	70	https://github.com/schacon/blink	Example file to blink the LED on an Arduino	Arduino	1266	661	\N	17	2014-06-12 18:04:52	2021-01-23 13:57:51	2021-01-28 06:28:11
408538	bundler	70	https://github.com/schacon/bundler	\N	Ruby	1	0	\N	4	2009-12-08 18:00:43	2017-06-29 19:21:55	2009-12-08 18:03:16
1702146	bup	70	https://github.com/schacon/bup	Highly efficient file backup system based on the git packfile format.  Capable of doing *fast* incremental backups of virtual machine images.	Python	0	0	\N	1	2011-05-04 13:41:55	2015-07-04 12:19:15	2011-04-06 12:27:21
27678439	calcdown	70	https://github.com/schacon/calcdown	Calca/Soulver-like interpreter for Atom	CoffeeScript	1	0	\N	8	2014-12-07 15:35:10	2020-09-23 10:16:14	2014-12-07 18:59:57
1048573	campyre	70	https://github.com/schacon/campyre	A Campfire client for Android.	Java	1	0	\N	2	2010-11-03 15:44:18	2021-01-23 21:51:58	2010-11-03 15:44:45
102916641	chatterblog1	70	https://github.com/schacon/chatterblog1	\N	CSS	0	0	\N	0	2017-09-08 22:05:33	2017-09-08 22:09:23	2017-09-09 01:18:53
13811601	choosealicense.com	70	https://github.com/schacon/choosealicense.com	A site to provide non-judgmental guidance on choosing a license for your open source project	CSS	1	0	\N	1	2013-10-23 16:50:07	2018-12-30 07:02:11	2013-10-23 16:52:22
139923	chronic	70	https://github.com/schacon/chronic	Chronic is a pure Ruby natural language date parser.	Ruby	1	1	\N	4	2009-02-28 15:02:30	2019-08-13 11:04:58	2008-11-14 05:49:20
2380927	clippy	70	https://github.com/schacon/clippy	Clippy is a very simple Flash widget that makes it possible to place arbitrary text onto the client's clipboard.	HaXe	1	0	\N	4	2011-09-13 16:54:39	2017-06-11 21:21:24	2011-09-13 16:55:49
100442	cocoagit	70	https://github.com/schacon/cocoagit	An Objective-C/Foundation implementation of the Git version control software.	C	2	0	\N	14	2009-01-03 21:05:29	2019-08-13 10:51:19	2009-05-30 21:43:05
1344164	collabgit	70	https://github.com/schacon/collabgit	ShowOff preso on collaborating with Git	JavaScript	3	0	\N	6	2011-02-08 21:26:11	2013-10-27 13:03:30	2011-03-26 03:43:03
556622	cowsay	70	https://github.com/schacon/cowsay	git version of awesome cowsay project	Shell	74	19	\N	200	2010-03-10 19:15:20	2021-01-28 02:27:40	2019-09-08 13:34:59
136406	cucumber	70	https://github.com/schacon/cucumber	BDD that talks to domain experts first and code second	Ruby	3	0	\N	4	2009-09-27 23:47:46	2019-08-13 11:03:36	2009-09-24 20:19:38
1254893	ddd	70	https://github.com/schacon/ddd	developer driven development talk	JavaScript	1	0	\N	20	2011-01-14 13:58:31	2019-08-06 16:53:43	2011-01-14 21:07:21
2336760	diveclog	70	https://github.com/schacon/diveclog	Rough divelog in C and Gtk	C	0	0	\N	1	2011-09-06 16:27:37	2020-04-26 20:13:30	2011-09-06 16:35:47
576179	django-schedule	70	https://github.com/schacon/django-schedule	\N	Python	0	0	\N	4	2010-03-23 15:45:52	2018-01-30 18:25:37	2010-03-23 15:47:31
4716032	docurium	70	https://github.com/schacon/docurium	moved to github/docurium	C	1	0	\N	17	2012-06-19 13:15:04	2016-10-16 13:45:25	2012-05-21 16:15:28
134720821	accomplish	71	https://github.com/uggedal/accomplish	 Minimal task list	Ruby	0	0	\N	0	2018-05-24 10:40:37	2018-05-24 10:41:47	2018-05-24 10:41:46
11608046	ansible	71	https://github.com/uggedal/ansible	Ansible configures operating systems, deploys applications, runs parallel commands, and orchestrates IT processes like zero-downtime rolling updates.  It uses SSH by default, so no special software has to be installed to start managing remote machines.  Modules can be written in any language.	Python	0	0	\N	0	2013-07-23 09:43:38	2013-10-27 17:03:06	2013-08-26 08:25:35
134719967	apkaux	71	https://github.com/uggedal/apkaux	Various Alpine Package Keeper scripts	Shell	0	0	\N	0	2018-05-24 10:34:20	2018-05-24 10:34:51	2018-05-24 10:34:36
134715396	aports-vercmp	71	https://github.com/uggedal/aports-vercmp	Compare aport versions against upstream	Lua	0	0	\N	0	2018-05-24 09:55:35	2018-05-24 09:55:57	2018-05-24 09:55:51
134715275	bare	71	https://github.com/uggedal/bare	Barely a Linux	C	2	0	\N	19	2018-05-24 09:54:27	2020-09-20 00:18:37	2018-05-24 09:54:44
181361743	bash-it	71	https://github.com/uggedal/bash-it	A community Bash framework.	Shell	0	0	\N	0	2019-04-14 16:56:02	2019-04-14 16:56:04	2019-04-14 17:31:39
7866758	cdist	71	https://github.com/uggedal/cdist	cdist configuration management	Shell	0	0	\N	0	2013-01-28 07:28:36	2015-09-06 16:30:47	2013-01-28 11:32:57
190415996	cfg	71	https://github.com/uggedal/cfg	\N	Shell	0	0	\N	3	2019-06-05 12:00:04	2020-12-26 11:56:37	2020-12-26 11:56:34
134719283	conf.sh	71	https://github.com/uggedal/conf.sh	Zero dependency configuration management	Shell	0	0	\N	0	2018-05-24 10:28:43	2018-05-24 10:29:46	2018-05-24 10:29:10
73427167	core-plans	71	https://github.com/uggedal/core-plans	Core Habitat Plan definitions	Shell	0	0	\N	0	2016-11-10 20:44:47	2016-11-10 20:44:49	2016-11-10 21:01:40
521666	django-flatblocks	71	https://github.com/uggedal/django-flatblocks	django-chunks + headerfield + variable chunknames + "inclusion tag" == django-flatblocks	Python	1	0	\N	1	2010-02-17 08:34:27	2012-12-13 21:24:10	2010-02-17 10:46:49
134721015	django-notices	71	https://github.com/uggedal/django-notices	Efficient and lightweight Django notices	Python	0	0	\N	0	2018-05-24 10:42:28	2018-05-24 10:42:46	2018-05-24 10:42:42
159160	django-positions	71	https://github.com/uggedal/django-positions	A Django field for custom model ordering. (setuptools compatible patch )	Python	0	0	\N	1	2009-03-25 12:42:22	2019-08-13 11:12:12	2009-03-25 13:05:15
18730873	docker	71	https://github.com/uggedal/docker	Docker - the open-source application container engine	Go	0	0	\N	0	2014-04-13 11:22:27	2017-04-18 11:47:39	2014-04-15 05:00:05
15686070	docker-overlay	71	https://github.com/uggedal/docker-overlay	Gentoo overlay for Docker	Shell	0	0	\N	0	2014-01-06 19:38:17	2014-01-08 17:16:35	2014-01-06 19:53:08
134719788	dotfiles	71	https://github.com/uggedal/dotfiles	User config	Shell	0	0	\N	0	2018-05-24 10:32:51	2020-01-16 17:16:26	2018-05-24 10:33:33
239368579	emacs.d	71	https://github.com/uggedal/emacs.d	My evil Emacs configuration	\N	0	0	\N	0	2020-02-09 17:22:07	2020-02-09 17:22:09	2015-07-12 13:31:39
8783146	feedhq	71	https://github.com/uggedal/feedhq	FeedHQ is a web-based feed reader	Python	0	0	\N	0	2013-03-14 16:08:47	2013-07-09 16:30:18	2013-03-14 17:48:23
9734743	fish-shell	71	https://github.com/uggedal/fish-shell	The user-friendly command line shell.	C++	0	0	\N	0	2013-04-28 16:09:01	2013-05-01 12:46:06	2013-05-01 12:46:05
134714850	gitoff	71	https://github.com/uggedal/gitoff	Git WWW interface	C	0	0	\N	0	2018-05-24 09:51:00	2018-05-24 09:51:30	2018-05-24 09:51:15
134720338	going	71	https://github.com/uggedal/going	Simple process supervisor	C	0	0	\N	0	2018-05-24 10:37:07	2019-06-08 03:32:04	2018-05-24 10:37:26
8699	halcyon	71	https://github.com/uggedal/halcyon	JSON Web App Framework	Java	0	0	\N	2	2008-04-11 09:18:18	2019-08-13 10:22:51	2008-04-11 10:58:06
674997	jsoup	71	https://github.com/uggedal/jsoup	Java HTML Parser	Java	1	0	\N	1	2010-05-19 09:43:01	2012-12-14 15:08:42	2010-05-19 09:56:41
595942	kokki	71	https://github.com/uggedal/kokki	System configuration management framework influenced by Chef	Python	1	0	\N	1	2010-04-05 16:59:23	2012-12-14 01:27:28	2010-04-08 16:57:20
575581	libcloud	71	https://github.com/uggedal/libcloud	Linode fixes	Python	1	0	\N	1	2010-03-23 09:36:47	2012-12-14 00:48:53	2010-03-23 13:58:35
24109423	liblogging	71	https://github.com/uggedal/liblogging	an easy to use and lightweight signal-safe logging library	\N	0	0	\N	0	2014-09-16 14:13:45	2014-06-23 08:18:36	2014-09-16 18:15:58
2437950	littlechef	71	https://github.com/uggedal/littlechef	Cook with Chef without a Chef Server	Python	0	0	\N	0	2011-09-22 12:21:02	2013-01-04 05:11:42	2011-09-22 18:10:59
16949098	lxc	71	https://github.com/uggedal/lxc	LXC - Linux Containers	C	0	0	\N	0	2014-02-18 10:04:40	2014-02-18 10:09:42	2014-02-18 10:07:50
149479832	macconfig	71	https://github.com/uggedal/macconfig	Configuration and dotfiles for MacOS	Shell	1	1	\N	2	2018-09-19 13:23:46	2020-10-19 02:54:20	2019-03-15 08:55:10
134721411	merb-cache-observer	71	https://github.com/uggedal/merb-cache-observer	Expires Merb caches	Ruby	0	0	\N	0	2018-05-24 10:45:38	2018-05-24 10:46:11	2018-05-24 10:46:02
39589675	.emacs.d	72	https://github.com/bruce/.emacs.d	Emacs initialization and customization files	Emacs Lisp	0	0	\N	0	2015-07-23 17:05:41	2018-01-22 16:46:12	2015-03-12 00:46:33
88114247	absinthe	72	https://github.com/bruce/absinthe	The GraphQL toolkit for Elixir	Elixir	0	0	\N	0	2017-04-12 23:01:59	2018-01-22 16:48:28	2018-11-16 00:58:41
100529599	absinthe-battleship-assets	72	https://github.com/bruce/absinthe-battleship-assets	Assets for an example	HTML	0	0	\N	0	2017-08-16 17:24:39	2018-01-22 16:49:01	2017-08-16 18:15:49
81768117	absinthe_plug	72	https://github.com/bruce/absinthe_plug	Plug support for Absinthe	Elixir	0	0	\N	0	2017-02-12 22:17:14	2018-01-22 16:48:13	2017-03-02 04:24:43
1445394	also_migrate	72	https://github.com/bruce/also_migrate	Migrate multiple tables with similar schema at once	Ruby	0	0	\N	1	2011-03-06 01:47:13	2018-01-22 16:43:04	2011-03-06 01:56:08
254970611	analytics-elixir	72	https://github.com/bruce/analytics-elixir	Segment.com library for Elixir	\N	0	0	\N	0	2020-04-11 20:04:42	2020-04-11 20:04:44	2020-04-11 20:28:31
12363585	angular-dragdrop	72	https://github.com/bruce/angular-dragdrop	Drag and Drop for AngularJS (with Animation)	JavaScript	1	1	\N	0	2013-08-25 15:31:25	2018-01-22 16:44:15	2017-09-26 21:15:29
13428313	ansible-jenkins	72	https://github.com/bruce/ansible-jenkins	Ansible playbook: Jenkins	\N	0	0	\N	0	2013-10-08 20:35:46	2018-01-22 16:44:21	2013-10-03 10:08:25
15991214	api-pagination	72	https://github.com/bruce/api-pagination	Link header pagination for Rails and Grape APIs.	Ruby	0	0	\N	0	2014-01-17 03:39:53	2018-01-22 16:44:34	2014-01-17 03:55:49
94487369	apollo-client	72	https://github.com/bruce/apollo-client	:rocket: A fully-featured, production ready caching GraphQL client for every server or UI framework	TypeScript	0	0	\N	0	2017-06-15 20:46:41	2018-01-22 16:48:45	2017-06-15 20:48:41
100837238	apollo-phoenix-websocket	72	https://github.com/bruce/apollo-phoenix-websocket	An Apollo networkInterface for executing GraphQL queries via Phoenix Channels	JavaScript	0	0	\N	0	2017-08-20 01:05:40	2018-01-22 16:49:02	2017-07-30 15:43:27
158684	archibald	72	https://github.com/bruce/archibald	Sinatra app to interactively merge family trees (GEDCOM)	\N	0	0	\N	3	2009-03-24 22:44:24	2019-08-13 11:12:02	2009-03-24 22:44:45
17237088	atom-csscomb	72	https://github.com/bruce/atom-csscomb	Atom Editor Plugin for CSSComb [NOT MAINTAINED, SEE ISSUES]	CoffeeScript	4	15	\N	22	2014-02-27 01:52:15	2020-05-23 19:26:02	2015-06-09 17:28:08
134488768	autorest.python	72	https://github.com/bruce/autorest.python	Extension for AutoRest (https://github.com/Azure/autorest) that generates Python code	Python	0	0	\N	0	2018-05-22 21:02:13	2018-05-22 21:02:16	2018-05-22 21:16:48
204408	bitmask-attribute	72	https://github.com/bruce/bitmask-attribute	Official repo is now: https://github.com/joelmoss/bitmask_attributes	Ruby	90	7	\N	34	2009-05-18 22:30:24	2020-12-13 18:46:44	2011-10-17 13:46:58
15559968	bootstrap	72	https://github.com/bruce/bootstrap	Native AngularJS (Angular) directives for Twitter's Bootstrap. Small footprint (5kB gzipped!), no 3rd party JS dependencies (jQuery, bootstrap JS) required!	JavaScript	0	0	\N	0	2014-01-01 01:18:29	2018-01-22 16:44:32	2013-12-31 15:12:37
29035826	braketini	72	https://github.com/bruce/braketini	martini middleware for reporting panics to airbrake	Go	0	0	\N	0	2015-01-09 19:19:23	2020-11-17 13:55:36	2015-01-09 19:24:23
11398300	bruce-io	72	https://github.com/bruce/bruce-io	Another take on http://bruce.io	JavaScript	0	0	\N	0	2013-07-14 01:24:23	2018-01-22 16:44:09	2013-07-14 01:30:02
173523285	bruce.github.io	72	https://github.com/bruce/bruce.github.io	\N	\N	0	0	\N	0	2019-03-02 23:46:09	2019-03-02 23:46:19	2019-03-02 23:46:10
66049723	bruce.io	72	https://github.com/bruce/bruce.io	Website	JavaScript	0	0	\N	0	2016-08-19 00:29:40	2018-01-22 16:47:34	2016-08-19 19:51:50
292868	bumpspark	72	https://github.com/bruce/bumpspark	Generates bumpspark-style sparklines as PNG (including Data URI support) from Ruby and Rails.	Ruby	3	0	\N	40	2009-08-30 23:49:46	2019-08-17 16:12:37	2013-01-30 20:04:58
158336144	calculator_events	72	https://github.com/bruce/calculator_events	Mentoring example: Calculator with events	Elixir	0	0	\N	2	2018-11-20 03:35:47	2018-11-27 16:46:05	2018-11-20 03:36:09
13896380	capistrano-unicorn	72	https://github.com/bruce/capistrano-unicorn	Capistrano 3.x integration for Unicorn!	Ruby	1	0	\N	0	2013-10-27 03:33:39	2018-01-22 16:44:25	2013-10-27 03:37:51
94033619	chump	72	https://github.com/bruce/chump	A prototype Chummer Data File tool	JavaScript	0	0	\N	0	2017-06-11 18:42:00	2018-01-22 16:48:44	2017-06-11 19:02:19
2017177	citizenry	72	https://github.com/bruce/citizenry	Community awesome directory hub mumble mumble	JavaScript	0	0	\N	1	2011-07-08 06:52:57	2018-01-22 16:43:09	2011-04-16 03:57:12
10899268	clauth	72	https://github.com/bruce/clauth	Authentication library for Clojure and Ring based on OAuth2	Clojure	0	0	\N	0	2013-06-24 02:11:05	2018-01-22 16:44:06	2012-08-27 15:36:31
232519	clojure-experiments	72	https://github.com/bruce/clojure-experiments	Bruce's Clojure experiments	Shell	0	0	\N	1	2009-06-21 04:50:07	2013-10-07 08:58:53	2009-06-21 17:26:21
179016	compare-app	72	https://github.com/bruce/compare-app	Ruby 1.8/1.9 Comparison app	Ruby	0	0	\N	3	2009-04-17 23:14:29	2019-08-13 11:19:02	2009-04-18 00:04:47
146604	dash-haskell	72	https://github.com/bruce/dash-haskell	Provides an API for Haskell applications to the FiveRuns Dash service, http://dash.fiveruns.com	Haskell	0	0	\N	2	2009-03-09 14:02:40	2019-08-13 11:07:55	2009-03-09 16:06:06
75522148	debug	72	https://github.com/bruce/debug	tiny node.js & browser debugging utility for your libraries and applications	JavaScript	0	0	\N	0	2016-12-04 04:48:08	2018-01-22 16:47:57	2016-11-28 15:25:12
10820993	async-example	73	https://github.com/sam/async-example	Working on an scala/async example.	Scala	4	0	\N	1	2013-06-20 11:01:02	2017-11-01 17:22:52	2013-06-20 11:40:55
41059121	aws-dynamodb-scala	73	https://github.com/sam/aws-dynamodb-scala	Scala client for Amazon DynamoDB	Scala	10	0	\N	0	2015-08-19 17:48:12	2015-08-19 17:48:12	2015-08-20 13:20:57
4128827	bbd	73	https://github.com/sam/bbd	Backbone App Demo from BOH Session at RailsConf 2012	Ruby	6	0	\N	0	2012-04-24 16:37:14	2013-08-22 07:47:29	2012-04-24 19:20:41
3279694	blog	73	https://github.com/sam/blog	It's a blog.	Scala	8	4	\N	3	2012-01-27 00:49:15	2018-07-03 12:40:59	2013-02-06 18:00:23
46817085	calculator	73	https://github.com/sam/calculator	Example of Scala Parser Combinators	Scala	12	0	\N	0	2015-11-24 18:35:29	2015-11-24 18:36:11	2015-11-24 18:43:32
68844389	cloudant-search	73	https://github.com/sam/cloudant-search	Dockerfile template that compiles Cloudant full text search funcionality into CouchDB 2.0 alpha	Ruby	13	0	\N	0	2016-09-21 15:06:29	2016-09-21 15:06:30	2016-02-08 14:03:36
11955549	collections-vs	73	https://github.com/sam/collections-vs	Ruby vs Scala Collections forked from https://gist.github.com/mattetti/3936587	Scala	4	0	\N	0	2013-08-07 14:05:33	2013-12-06 03:27:39	2013-08-07 14:10:20
68841628	couchdb	73	https://github.com/sam/couchdb	Mirror of Apache CouchDB	JavaScript	12	0	\N	0	2016-09-21 14:31:30	2016-09-21 14:31:32	2016-09-21 14:32:36
69034116	couchdb-search	73	https://github.com/sam/couchdb-search	Dockerfile for CouchDB 2.0 plus Cloudant Search	\N	15	0	\N	0	2016-09-23 11:49:19	2016-09-23 11:49:19	2016-09-26 19:29:29
68856588	docker-couchdb	73	https://github.com/sam/docker-couchdb	:whale: Source of the official Apache CouchDB Docker image	Shell	13	0	\N	0	2016-09-21 17:52:16	2016-09-21 17:52:18	2016-09-20 12:57:46
5799179	doubleshot	73	https://github.com/sam/doubleshot	Build and Dependency Management for mixed Java/Ruby projects.	Ruby	20	6	\N	19	2012-09-13 15:38:18	2020-08-30 19:10:38	2017-09-26 21:15:40
3172162	geminaboxplus	73	https://github.com/sam/geminaboxplus	A ready-to-go Geminabox install	Ruby	7	0	\N	2	2012-01-13 14:12:28	2018-07-04 02:45:36	2012-02-21 20:57:06
3436381	harbor	73	https://github.com/sam/harbor	Harbor is a Ruby Web Framework.	Ruby	7	19	\N	5	2012-02-14 00:31:59	2019-08-13 11:57:04	2012-11-13 16:42:42
4276384	harbor-ftp	73	https://github.com/sam/harbor-ftp	An embedded FTP Server for JRuby wrapping Apache's FTPServer libraries	Ruby	3	0	\N	2	2012-05-09 17:27:01	2013-10-02 22:29:21	2012-08-08 14:40:21
43399449	htmlunit-core-js	73	https://github.com/sam/htmlunit-core-js	Tests and packaging for htmlunit-rhino-fork	Java	11	0	\N	0	2015-09-29 20:05:48	2015-09-29 20:05:49	2015-08-24 08:06:19
43399443	htmlunit-rhino-fork	73	https://github.com/sam/htmlunit-rhino-fork	htmlunit-core-js is HtmlUnit's Rhino fork	C++	3	0	\N	0	2015-09-29 20:05:40	2015-09-29 20:05:48	2015-06-03 07:06:29
12278254	imgscalr-scala-example	73	https://github.com/sam/imgscalr-scala-example	Example usage of imgscalr in Scala.	Scala	5	0	\N	0	2013-08-21 15:39:22	2013-12-22 07:56:51	2013-08-22 11:59:01
5401258	infinispan-configuration	73	https://github.com/sam/infinispan-configuration	Configuration example for Infinispan to explore clustering, eviction, etc.	Ruby	4	0	\N	0	2012-08-13 13:03:34	2018-08-27 10:08:36	2012-08-16 14:12:37
4664832	jar-hello-world	73	https://github.com/sam/jar-hello-world	This is just the jetty-hello-world program packaged as a single jar.	Ruby	4	0	\N	0	2012-06-14 12:17:57	2013-12-09 18:19:24	2012-08-07 13:19:19
11026955	jepsen-couchdb	73	https://github.com/sam/jepsen-couchdb	Run-DMC explains Network Partitions	Python	2	0	\N	0	2013-06-28 10:31:51	2013-06-28 10:31:51	2013-06-19 11:56:39
51034095	json4s	73	https://github.com/sam/json4s	A single AST to be used by other scala json libraries	Scala	11	0	\N	0	2016-02-03 20:06:55	2016-02-03 20:06:56	2016-01-25 12:57:32
3575615	mail_builder	73	https://github.com/sam/mail_builder	MailBuilder is a simple library for building RFC compliant MIME emails.	Ruby	4	0	\N	1	2012-02-28 18:11:02	2018-08-27 10:08:31	2012-12-05 15:50:15
5399303	map-benchmarks	73	https://github.com/sam/map-benchmarks	A benchmark between a JRuby Hash, Hazelcast and Infinispan.	Ruby	5	1	\N	8	2012-08-13 10:30:20	2020-06-21 04:21:31	2012-08-13 12:31:34
3159651	mod_zip	73	https://github.com/sam/mod_zip	ZIP archiver for nginx	C	6	0	\N	0	2012-01-12 02:03:38	2018-07-03 09:56:14	2012-01-18 01:38:47
6928338	onchange	73	https://github.com/sam/onchange	File System Watcher for Doubleshot based on JDK7's java.nio.file.WatchService	Java	6	0	\N	0	2012-11-29 18:51:25	2013-12-04 21:56:58	2012-12-04 16:05:29
7568091	play2-memcached	73	https://github.com/sam/play2-memcached	An implementation of Play 2.0's CacheAPI which provides access to memcached using spymemcached.	Scala	4	0	\N	1	2013-01-11 20:20:31	2013-01-14 13:52:19	2012-12-13 13:53:29
58219636	process-streaming	73	https://github.com/sam/process-streaming	Example of video-clipping	Scala	16	0	\N	0	2016-05-06 13:16:21	2016-05-06 13:32:13	2016-05-06 16:09:11
3165373	redis_directory	73	https://github.com/sam/redis_directory	Provides centralized management of Redis connection strings.	Ruby	6	0	\N	0	2012-01-12 18:15:57	2018-07-03 09:56:25	2011-10-19 17:53:57
6783366	ruby-style-guide	73	https://github.com/sam/ruby-style-guide	A community-driven Ruby coding style guide	Ruby	3	0	\N	0	2012-11-20 17:02:11	2013-01-13 04:05:10	2012-11-20 17:02:51
90236876	acronymium	74	https://github.com/mmower/acronymium	Generates acronyms according to rules	Clojure	0	0	\N	1	2017-05-04 04:59:04	2017-05-09 10:29:21	2017-05-14 05:46:21
106920764	aido	74	https://github.com/mmower/aido	Clojure behaviour tree library	Clojure	1	1	\N	10	2017-10-14 08:02:22	2020-07-29 11:02:04	2020-07-18 15:18:00
64992	alonetone	74	https://github.com/mmower/alonetone	The kick ass (non-commercial) home for musicians and their music	JavaScript	1	0	\N	4	2009-08-31 18:53:18	2019-08-13 10:38:36	2011-03-02 14:59:07
6237	bishop	74	https://github.com/mmower/bishop	A bayesian classifier library for Ruby	Ruby	7	2	\N	24	2008-04-02 06:37:17	2019-08-13 10:22:27	2011-11-01 00:54:59
155744	blueprint-css	74	https://github.com/mmower/blueprint-css	A CSS framework that aims to cut down on your CSS development time	Ruby	0	0	\N	2	2009-03-21 11:11:42	2019-08-13 11:11:06	2009-03-02 23:36:58
573838	bones	74	https://github.com/mmower/bones	A kind of cranky app for tracking weight & eating.	JavaScript	0	0	\N	1	2010-03-22 08:27:08	2013-12-25 05:29:55	2010-03-22 08:27:56
39193653	caisson	74	https://github.com/mmower/caisson	Automatically exported from code.google.com/p/caisson	\N	0	0	\N	0	2015-07-16 08:40:16	2015-07-16 08:40:16	2015-07-16 08:42:48
9842521	cell-culture-1	74	https://github.com/mmower/cell-culture-1	A first go at Langston's cellular automata in the browser	JavaScript	0	0	\N	0	2013-05-03 15:56:52	2014-01-10 12:52:04	2013-05-03 16:49:44
9852523	cell-culture-3	74	https://github.com/mmower/cell-culture-3	Extended the cellculture library to do Conway's "Game of Life"	JavaScript	0	0	\N	0	2013-05-04 07:26:47	2013-10-06 19:26:49	2013-05-12 18:00:49
15511024	clojure-lanterna	74	https://github.com/mmower/clojure-lanterna	A Clojurey wrapper around the Lanterna terminal output library.	Clojure	0	0	\N	0	2013-12-29 14:12:37	2017-01-30 10:18:12	2013-07-10 21:26:45
4024544	CocoaAsyncSocket	74	https://github.com/mmower/CocoaAsyncSocket	Asynchronous socket networking library for Mac and iOS	Objective-C	0	0	\N	1	2012-04-14 09:15:23	2013-01-08 15:16:58	2012-04-13 00:51:32
17246909	codox	74	https://github.com/mmower/codox	Clojure documentation tool	Clojure	0	0	\N	0	2014-02-27 08:42:08	2014-02-27 08:42:09	2014-02-15 19:22:03
35128737	collider	74	https://github.com/mmower/collider	An Overtone based particle collider instrument	Clojure	0	0	\N	0	2015-05-05 20:22:00	2015-05-07 21:22:48	2015-05-09 09:22:18
31415	coreplus	74	https://github.com/mmower/coreplus	Some extensions to Ruby Core & Stdlib that I use	Ruby	0	0	\N	3	2008-07-05 10:10:33	2019-08-13 10:28:26	2008-07-05 14:03:58
97324	crashcity	74	https://github.com/mmower/crashcity	Open crash logging application	\N	0	0	\N	2	2008-12-27 22:18:07	2019-08-13 10:50:16	2008-12-27 22:18:34
65487851	cwmapper	74	https://github.com/mmower/cwmapper	Central Working Mapper	Clojure	0	0	\N	0	2016-08-11 14:20:09	2016-08-11 14:21:02	2016-08-11 19:42:46
18913107	dependency	74	https://github.com/mmower/dependency	A data structure for representing dependency graphs in Clojure	HTML	0	0	\N	0	2014-04-18 09:58:53	2015-03-13 15:47:16	2015-03-13 15:47:15
43548	dg834statsd	74	https://github.com/mmower/dg834statsd	An ADSL line stats collecting daemon for DG834v1 routers	Ruby	0	0	\N	2	2008-08-18 06:50:06	2019-08-13 10:32:01	2008-08-19 13:41:38
17899	diffly	74	https://github.com/mmower/diffly	Diffly is a tool for exploring Subversion working copies. It shows all files with changes and, clicking on a file, shows a highlighted view of the changes for that file. When you are ready to commit Diffly makes it easy to select the files you want to check-in and assemble a useful commit message.	Objective-C	2	0	\N	9	2008-05-18 21:18:22	2019-08-13 10:24:50	2009-10-05 06:14:42
47387	elysium	74	https://github.com/mmower/elysium	A Generative MIDI Sequencer for Mac OS X	Objective-C	5	3	\N	41	2008-08-29 15:41:05	2019-08-13 10:33:32	2009-10-05 19:01:36
88108	embeddable-macruby	74	https://github.com/mmower/embeddable-macruby	Fixes MacRuby to build the framework inherently relocatable and to load fixed BridgeSupport metadata from the framework.	\N	0	0	\N	2	2008-12-10 08:30:14	2019-08-13 10:46:44	2008-12-10 08:45:41
331644980	epic	74	https://github.com/mmower/epic	Parser combinator library for Elixir projects	Elixir	0	0	\N	1	2021-01-21 10:59:30	2021-01-25 05:15:00	2021-01-25 05:14:58
1113272	errata_plugin	74	https://github.com/mmower/errata_plugin	Rails plugin for logging errata for the Errata client	Ruby	0	0	\N	1	2010-11-25 20:30:28	2013-11-30 22:23:05	2010-12-12 21:31:59
73546201	expectations-test-case	74	https://github.com/mmower/expectations-test-case	\N	Clojure	0	1	\N	0	2016-11-12 08:30:51	2016-11-12 08:33:51	2016-11-12 16:15:20
897559	Freeman	74	https://github.com/mmower/Freeman	An attempt to automate some aspects of building in Native Instruments Reaktor 5	Objective-C	0	0	\N	3	2010-09-08 21:51:45	2019-08-13 11:36:29	2014-07-10 17:47:38
5722275	Gen	74	https://github.com/mmower/Gen	Objective-C Code Generator	Objective-C	3	1	\N	12	2012-09-07 17:48:34	2019-01-04 23:51:59	2012-09-08 18:45:19
165711147	GMCodeEditor	74	https://github.com/mmower/GMCodeEditor	An objective-C code editing component.	Objective-C	1	0	\N	0	2019-01-14 16:16:02	2019-01-14 16:16:04	2013-09-27 12:14:00
3054	godo	74	https://github.com/mmower/godo	go (to project) do (stuffs)	Ruby	2	0	\N	9	2008-03-08 10:59:49	2019-08-13 10:21:52	2008-05-30 17:09:11
516509	Grayson	74	https://github.com/mmower/Grayson	The application I built to help myself track spending & budget for purchases	\N	0	0	\N	1	2010-02-13 12:33:13	2012-12-13 21:14:23	\N
164644722	GRMustache.swift	74	https://github.com/mmower/GRMustache.swift	Flexible Mustache templates for Swift	Swift	0	0	\N	0	2019-01-08 10:31:12	2019-07-20 11:49:13	2017-11-10 19:12:06
15571576	abhay.github.io	75	https://github.com/abhay/abhay.github.io	\N	\N	0	0	\N	0	2014-01-01 21:04:05	2014-01-01 21:04:05	2014-01-01 21:04:05
270113009	protestnet-generator	76	https://github.com/rabble/protestnet-generator	Static Site Generator for protest.net	\N	0	0	\N	0	2020-06-06 18:47:29	2020-06-06 18:50:12	2020-03-24 05:16:51
194744	addressable	75	https://github.com/abhay/addressable	Addressable is a replacement for the URI implementation that is part of Ruby's standard library. It more closely conforms to the relevant RFCs and adds support for IRIs and URI templates. 	Ruby	0	0	\N	1	2009-05-07 03:21:58	2019-08-13 11:24:35	2009-05-01 10:34:12
201196935	bodega-bot-guesser	75	https://github.com/abhay/bodega-bot-guesser	Guesses at @BodegaBot tweets	Ruby	0	0	\N	0	2019-08-08 03:53:43	2019-08-08 03:53:46	2019-08-08 03:54:53
341809	bundles	75	https://github.com/abhay/bundles	Index for TextMate bundles available via git	\N	1	0	\N	0	2009-10-19 00:43:48	2017-08-22 00:55:34	2009-10-19 00:46:20
142	calais	75	https://github.com/abhay/calais	A Ruby interface to the Open Calais API (http://opencalais.com)	Ruby	49	6	\N	134	2008-01-29 02:10:12	2020-12-20 17:37:09	2020-06-30 13:44:55
703	chronic	75	https://github.com/abhay/chronic	Chronic is a pure Ruby natural language date parser.	Ruby	0	0	\N	3	2008-01-29 04:48:49	2019-08-13 10:21:26	2008-03-26 16:16:08
194734	dm-core	75	https://github.com/abhay/dm-core	DataMapper - Core	Ruby	0	0	\N	1	2009-05-07 03:09:13	2019-08-13 11:24:35	2009-05-06 23:10:29
185178	dm-more	75	https://github.com/abhay/dm-more	Extras for DataMapper, including bridges to DataObjects::Migrations and Merb::DataMapper	Ruby	0	0	\N	1	2009-04-25 05:15:49	2019-08-13 11:21:12	2009-04-25 05:17:33
20540	dynomite	75	https://github.com/abhay/dynomite	Open source dynamo clone written in Erlang.	Erlang	0	0	\N	1	2008-05-29 16:42:41	2019-08-13 10:25:26	2008-07-22 01:59:00
314534	erlang	75	https://github.com/abhay/erlang	Erlang with extra unofficial patches (see branches for patches in development, alterline for merged patches)	Erlang	1	0	\N	0	2009-09-22 14:18:30	2017-08-22 00:55:42	2009-09-22 14:23:35
659457	erlang-bcrypt	75	https://github.com/abhay/erlang-bcrypt	Erlang wrapper for OpenBSD's Blowfish password hashing code	C	106	0	\N	14	2010-05-10 15:42:44	2020-01-20 10:14:12	2019-10-29 21:36:36
265342	erlang_nginx	75	https://github.com/abhay/erlang_nginx	A proof of concept to demonstrate how nginx and Erlang play nicely together.	C	3	0	\N	1	2009-07-30 23:33:16	2017-08-22 00:55:48	2009-08-02 15:17:44
682658	erldis	75	https://github.com/abhay/erldis	redis erlang client library (imported from bitbucket)	Erlang	1	0	\N	0	2010-05-24 00:44:51	2017-08-22 00:55:13	2010-05-18 14:05:46
17729	erlectricity	75	https://github.com/abhay/erlectricity	Erlectricity exposes Ruby to Erlang and vice versa.	Ruby	0	0	\N	1	2008-05-18 04:33:02	2019-08-13 10:24:46	2008-05-31 15:42:30
25885	eunit	75	https://github.com/abhay/eunit	Git tracking branch of EUnit, a unit testing framework for Erlang	Erlang	4	0	\N	11	2008-06-16 21:00:32	2019-08-13 10:26:55	2008-06-16 21:00:54
173085	extlib	75	https://github.com/abhay/extlib	General Ruby extensions for DataMapper and DataObjects	Ruby	0	0	\N	1	2009-04-10 18:58:18	2019-08-13 11:16:59	2009-04-10 19:24:56
17736	fuzed	75	https://github.com/abhay/fuzed	A new revision of Fuzed, the Erlang-based frontend for web apps.	Erlang	1	0	\N	4	2008-05-18 06:12:52	2019-08-13 10:24:46	2008-07-09 17:57:17
140	gchart	75	https://github.com/abhay/gchart	GChart exposes the Google Chart API (http://code.google.com/apis/chart) via a friendly Ruby interface. It can generate the URL for a given chart (for webpage use), or download the generated PNG (for offline use).	Ruby	13	0	\N	36	2008-01-28 19:23:10	2020-03-24 07:48:43	2008-05-08 19:20:24
3540189	gladman-aes	75	https://github.com/abhay/gladman-aes	Git mirror of Brian Gladman's AES code	C	5	0	\N	6	2012-02-24 20:04:09	2019-08-16 09:06:12	2012-02-24 20:08:25
232442520	heroku-buildpack-libsodium	75	https://github.com/abhay/heroku-buildpack-libsodium	libsodium/rbnacl buildpack for Heroku	Shell	0	0	\N	0	2020-01-07 21:19:04	2020-01-07 21:19:48	2020-01-07 21:19:46
265929038	HIP	75	https://github.com/abhay/HIP	Helium Improvement Proposals	\N	0	0	\N	0	2020-05-21 16:00:04	2020-08-19 21:55:28	2020-08-22 15:37:50
1154867	ibrowse	75	https://github.com/abhay/ibrowse	Erlang HTTP client	Erlang	0	0	\N	0	2010-12-09 22:14:10	2017-08-22 00:55:11	2010-12-09 23:06:30
1673706	IR_Black-for-Intellij-Idea-X	75	https://github.com/abhay/IR_Black-for-Intellij-Idea-X	IR_Black color scheme for Intellij Idea - The best color scheme around for coding.	Shell	0	0	\N	0	2011-04-27 22:42:36	2017-08-22 00:55:07	2012-01-30 23:37:27
23881856	minesweeper	75	https://github.com/abhay/minesweeper	\N	\N	0	0	\N	0	2014-09-10 13:19:49	2014-09-07 01:26:35	2014-09-10 01:18:32
20906	mochiweb.old	75	https://github.com/abhay/mochiweb.old	Erlang HTTP toolkit	Erlang	4	0	\N	7	2008-05-30 22:55:29	2019-08-13 10:25:32	2008-06-24 15:08:29
282549	mooish-template	75	https://github.com/abhay/mooish-template	A template for building and organizing your Javascript code like Mootools. Great starting-point for Mootools plugins or classes. 	JavaScript	1	0	\N	0	2009-08-19 20:24:16	2017-08-22 00:55:44	2010-01-02 22:52:57
659661	neotoma	75	https://github.com/abhay/neotoma	Erlang library and packrat parser-generator for parsing expression grammars.	Erlang	1	0	\N	0	2010-05-10 17:35:38	2017-08-22 00:55:15	2010-06-14 00:45:17
10088253	Octosplit	75	https://github.com/abhay/Octosplit	Chrome extension that provides side by side diffs in GitHub (WIP)	JavaScript	0	0	\N	0	2013-05-15 18:21:40	2013-05-15 18:21:40	2013-05-10 08:38:58
224926713	rails-uikit	75	https://github.com/abhay/rails-uikit	UIKit3 for Ruby on Rails • https://getuikit.com	\N	0	0	\N	0	2019-11-29 18:53:22	2019-11-29 18:53:23	2019-11-29 18:55:23
20404	sample-rpc-server	75	https://github.com/abhay/sample-rpc-server	A Sample RPC Server using Mochiweb	Erlang	4	0	\N	6	2008-05-29 05:11:51	2019-08-13 10:25:24	2008-06-02 18:21:44
188721338	buffalo-auth	76	https://github.com/rabble/buffalo-auth	Buffalo auth plugin helps adding username password authentication to your app	Go	0	0	\N	0	2019-05-26 16:05:43	2019-05-26 16:05:45	2019-05-26 16:06:00
323738599	distance-map	76	https://github.com/rabble/distance-map	\N	JavaScript	0	0	\N	0	2020-12-22 18:39:22	2020-12-23 12:26:20	2020-12-23 12:26:17
283257	fluiddb	76	https://github.com/rabble/fluiddb	Ruby client library to FluidDB	Ruby	0	0	\N	1	2009-08-20 14:40:36	2014-05-05 11:40:05	2009-08-20 16:26:35
282214	geoplanet	76	https://github.com/rabble/geoplanet	A Ruby wrapper for the Yahoo! GeoPlanet API	Ruby	1	0	\N	2	2009-08-19 15:06:25	2012-12-12 22:23:56	2009-08-19 16:25:29
72566190	henshaw-plath	76	https://github.com/rabble/henshaw-plath	Personal website for evan.henshaw-plath.com	HTML	0	0	\N	0	2016-11-01 16:49:41	2021-01-29 07:30:02	2021-01-29 07:29:59
154895769	heroku-buildpack-libsodium	76	https://github.com/rabble/heroku-buildpack-libsodium	libsodium/rbnacl buildpack for Heroku	Shell	0	0	\N	0	2018-10-26 18:20:36	2018-10-26 18:22:12	2018-10-26 18:22:10
1865	icalico	76	https://github.com/rabble/icalico	social calendaring web app for conferences	Ruby	0	0	\N	16	2008-02-29 14:45:59	2019-08-13 10:21:37	2008-07-14 16:18:43
193657415	MarchBNB	76	https://github.com/rabble/MarchBNB	Home sharing app for Marchers	Ruby	0	0	\N	0	2019-06-25 04:29:23	2019-06-25 04:29:58	2018-02-22 00:13:58
40203298	pio.io	76	https://github.com/rabble/pio.io	Pio.io an open social media environment built on ipfs.	CSS	2	0	\N	0	2015-08-04 15:53:29	2015-11-03 18:08:51	2015-11-08 16:38:33
45754051	pioexperiments	76	https://github.com/rabble/pioexperiments	playing with experiments for pio apps and the platform. 	\N	0	0	\N	0	2015-11-07 18:51:01	2015-11-07 18:51:01	2015-12-17 18:06:57
49680458	playback	76	https://github.com/rabble/playback	Video player build using atom-shell and node.js	JavaScript	0	0	\N	0	2016-01-14 20:50:03	2016-01-14 20:50:03	2016-01-03 17:00:08
269264415	portland-protest-hugo	76	https://github.com/rabble/portland-protest-hugo	\N	CSS	0	4	\N	0	2020-06-04 01:58:58	2020-06-04 02:01:37	2020-12-12 17:16:35
14937778	ptest	76	https://github.com/rabble/ptest	testing out how github pages	\N	0	0	\N	0	2013-12-04 20:29:58	2013-12-04 20:43:25	2013-12-04 20:43:25
55080524	rabble.consulting	76	https://github.com/rabble/rabble.consulting	\N	HTML	0	0	\N	0	2016-03-30 13:51:56	2016-03-30 16:06:45	2020-12-05 16:04:49
46637168	rabble.github.io	76	https://github.com/rabble/rabble.github.io	\N	\N	0	0	\N	0	2015-11-21 20:47:50	2015-11-21 20:47:50	2015-11-21 20:47:50
2505377	revent_public	76	https://github.com/rabble/revent_public	A public version of the Revent repo	Ruby	0	0	\N	1	2011-10-03 12:13:29	2013-11-02 07:11:55	2010-01-27 22:56:44
154373	rillow	76	https://github.com/rabble/rillow	Ruby interface to the Zillow API, forked from the project by Leo Chan	Ruby	0	0	\N	3	2009-03-19 13:58:06	2019-08-13 11:10:35	2010-02-22 18:43:22
109927	riot	76	https://github.com/rabble/riot	rewrite of protest.net	JavaScript	0	0	\N	10	2009-01-18 16:02:09	2019-08-13 10:54:31	2009-12-10 19:15:22
204159	sandbox	76	https://github.com/rabble/sandbox	Mapstraction demo sandbox	JavaScript	1	0	\N	1	2009-05-18 16:44:58	2012-12-12 20:09:48	2009-05-18 16:03:53
271145299	sanity-cms	76	https://github.com/rabble/sanity-cms	\N	JavaScript	0	1	\N	0	2020-06-09 22:16:18	2020-06-09 22:18:40	2020-07-20 22:50:48
47363047	server	76	https://github.com/rabble/server	Distributed video hosting	PHP	0	0	\N	0	2015-12-03 19:50:42	2015-12-03 19:54:17	2015-12-03 19:55:07
207928219	ssb-server	76	https://github.com/rabble/ssb-server	The gossip and replication server for Secure Scuttlebutt - a distributed social network	\N	0	0	\N	0	2019-09-11 21:05:07	2019-09-11 21:05:08	2019-09-11 21:09:12
54058170	trump	76	https://github.com/rabble/trump	trump.protest.net	JavaScript	0	0	\N	0	2016-03-16 15:50:31	2016-03-16 16:35:59	2016-03-17 13:21:08
175048	urbanmapping	76	https://github.com/rabble/urbanmapping	Library to interface to the urbanmapping rest api for neighborhood lookups	\N	0	0	\N	5	2009-04-13 17:59:01	2019-08-13 11:17:42	2009-04-14 20:58:38
199126	Ushahidi_Web	76	https://github.com/rabble/Ushahidi_Web	Ushahidi is a platform that crowdsources crisis information, allowing anyone to submit crisis information through text messaging using a mobile phone, email or web form.	PHP	0	0	\N	2	2009-05-12 16:08:38	2017-07-21 05:20:24	2009-05-12 14:47:12
78308898	alacritty	77	https://github.com/benburkert/alacritty	A cross-platform, GPU enhanced terminal emulator	Rust	0	0	\N	0	2017-01-07 21:06:25	2020-01-10 18:12:51	2017-09-01 15:17:13
24395190	ansible-coreos-bootstrap	77	https://github.com/benburkert/ansible-coreos-bootstrap	bootstrap a coreos machine for control via ansible	Python	0	0	\N	0	2014-09-23 21:52:23	2014-09-23 21:55:36	2014-09-23 21:55:36
4646528	bootstrap-razor	77	https://github.com/benburkert/bootstrap-razor	A simple script to get up and running with Razor.	Shell	0	0	\N	2	2012-06-13 02:13:54	2013-10-21 20:55:22	2012-06-13 02:15:23
2187214	brew2deb	77	https://github.com/benburkert/brew2deb	homebrew + fpm = debian packages	Ruby	2	1	\N	3	2011-08-10 16:46:06	2013-12-23 19:44:38	2013-10-30 02:42:03
3631488	cheeseman	77	https://github.com/benburkert/cheeseman	\N	Go	0	0	\N	1	2012-03-05 18:17:15	2014-08-10 17:43:05	2014-08-10 17:41:13
1332950	chef	77	https://github.com/benburkert/chef	A systems integration framework, built to bring the benefits of configuration management to your entire infrastructure.	Ruby	0	0	\N	1	2011-02-05 21:22:23	2012-12-17 21:27:44	2011-02-05 21:22:54
1399926	chef_fail	77	https://github.com/benburkert/chef_fail	\N	Ruby	0	0	\N	1	2011-02-22 20:05:37	2014-04-18 06:56:52	2011-02-22 20:25:23
73524116	collectd-cloudwatch	77	https://github.com/benburkert/collectd-cloudwatch	A collectd plugin for sending data to Amazon CloudWatch	Python	0	0	\N	0	2016-11-11 23:25:48	2016-11-11 23:25:49	2016-11-11 23:37:09
60057	community_shelf	77	https://github.com/benburkert/community_shelf	A simple app for managing a bookshelf, and a demo app for DataMapper, Merb, merb-cache	Ruby	0	0	\N	14	2008-10-06 12:39:47	2019-08-13 10:37:18	2008-11-21 20:01:04
373246	compleat	77	https://github.com/benburkert/compleat	Generate command-line completions from simple usage descriptions.	Haskell	1	0	\N	1	2009-11-14 21:43:17	2014-04-14 01:59:11	2009-11-11 15:54:26
410	cruisecontrolrb	77	https://github.com/benburkert/cruisecontrolrb	CruiseControl.rb is a continuous integration tool, written in Ruby. It is quick to install, simple to use and easy to hack.	Ruby	10	0	\N	85	2008-02-11 05:34:12	2020-05-11 18:14:34	2008-07-23 13:26:09
64081784	crypto	77	https://github.com/benburkert/crypto	[mirror] Go supplementary cryptography libraries	Go	0	0	\N	0	2016-07-24 16:22:12	2016-07-24 16:22:15	2017-01-13 03:44:55
147650	database-recipes	77	https://github.com/benburkert/database-recipes	A starter repo for custom chef recipes on EY's cloud platform	Ruby	0	0	\N	4	2009-03-10 16:16:13	2019-08-13 11:08:15	2009-04-11 17:41:54
65187	dm-is-permalink	77	https://github.com/benburkert/dm-is-permalink	permalinks for DM	\N	0	0	\N	2	2008-10-19 22:48:14	2019-08-13 10:38:40	2008-10-19 22:48:48
103151805	dns	77	https://github.com/benburkert/dns	DNS client & server package for Go	Go	7	2	\N	36	2017-09-11 12:15:20	2020-05-29 19:55:26	2019-08-04 18:48:23
23715692	docker	77	https://github.com/benburkert/docker	Docker - the open-source application container engine	Go	0	0	\N	0	2014-09-05 16:31:05	2017-04-18 11:47:59	2014-09-05 17:11:23
24118272	docker-fluentd-librato	77	https://github.com/benburkert/docker-fluentd-librato	\N	Shell	1	0	\N	0	2014-09-16 18:22:54	2014-09-17 00:57:24	2014-09-17 00:55:46
2057195	doozque	77	https://github.com/benburkert/doozque	Resque is a Redis-backed Ruby library for creating background jobs, placing those jobs on multiple queues, and processing them.	Ruby	0	0	\N	2	2011-07-16 04:43:14	2013-01-03 19:45:53	2011-07-17 01:22:27
358262	dot-compleat	77	https://github.com/benburkert/dot-compleat	my .compleat directory	\N	1	0	\N	4	2009-11-02 15:20:22	2019-08-13 11:28:59	2009-11-05 19:18:16
5487036	dotfiles	77	https://github.com/benburkert/dotfiles	These are my dotfiles. There are many like them, but these ones are mine.	Vim script	0	0	\N	0	2012-08-20 18:30:37	2019-11-30 20:39:40	2019-11-30 20:39:38
506978	dvorax0r	77	https://github.com/benburkert/dvorax0r	custom key bindings for KeyRemap4MacBook	C++	0	0	\N	2	2010-02-07 20:01:45	2019-01-17 23:45:24	2011-02-16 21:27:32
58949	emp	77	https://github.com/benburkert/emp	EMP = Event Machine + xMPp	Ruby	2	0	\N	25	2008-10-02 17:24:31	2019-08-13 10:36:59	2008-10-02 19:34:29
849949	engineyard	77	https://github.com/benburkert/engineyard	Deploy to Engine Yard Cloud from the command line	Ruby	1	0	\N	1	2010-08-19 19:09:07	2013-09-17 21:17:16	2010-08-19 19:09:38
3279082	epticsmix	77	https://github.com/benburkert/epticsmix	vanity me for skiing	Ruby	4	0	\N	5	2012-01-26 22:59:41	2016-12-21 03:38:39	2013-12-06 20:36:45
13108158	eventmachine	77	https://github.com/benburkert/eventmachine	EventMachine: fast, simple event-processing library for Ruby programs	Ruby	0	0	\N	0	2013-09-25 20:28:54	2014-01-14 05:01:06	2013-09-26 12:29:41
729862	excon	77	https://github.com/benburkert/excon	EXtended http(s) CONnections	Ruby	1	0	\N	1	2010-06-19 20:24:20	2014-05-29 17:51:46	2010-12-18 19:37:07
53817	extlib	77	https://github.com/benburkert/extlib	General Ruby extensions for DataMapper and DataObjects	Ruby	0	0	\N	2	2008-09-18 02:46:21	2019-08-13 10:35:30	2008-09-18 03:03:23
142977	ey-backup	77	https://github.com/benburkert/ey-backup	backup gem for backing up databases and filesystems to s3 with rolling windows and a download reapply backup script	Ruby	1	0	\N	7	2009-03-04 14:00:44	2019-08-13 11:06:28	2009-04-13 17:51:02
276786	ey-check	77	https://github.com/benburkert/ey-check	\N	\N	0	0	\N	1	2009-08-13 05:03:20	2013-09-16 09:31:13	2009-08-13 13:50:20
36779404	rake	87	https://github.com/tmornini/rake	A make-like build utility for Ruby.	Ruby	0	0	\N	0	2015-06-03 01:13:26	2016-01-13 05:26:54	2016-08-31 16:44:14
13627926	faraday	77	https://github.com/benburkert/faraday	Simple, but flexible HTTP client library, with support for multiple backends.	Ruby	0	0	\N	0	2013-10-16 15:47:11	2013-11-08 19:19:06	2013-10-16 15:47:48
160299365	1password-teams-open-source	78	https://github.com/indirect/1password-teams-open-source	Get a free 1Password Teams membership for your open source project	\N	0	0	\N	0	2018-12-04 02:55:17	2018-12-04 02:55:19	2018-12-04 02:58:31
126670741	activestorage-cloudinary-service	78	https://github.com/indirect/activestorage-cloudinary-service	\N	Ruby	0	0	\N	0	2018-03-25 03:28:11	2018-04-05 02:23:11	2018-04-05 02:23:10
312705627	acts_as_scrubbable	78	https://github.com/indirect/acts_as_scrubbable	Scrub sensitive data from your non-production environments	Ruby	0	0	\N	0	2020-11-13 20:24:15	2020-11-13 20:24:45	2020-11-13 20:24:42
116391898	actually.men	78	https://github.com/indirect/actually.men	\N	CSS	0	1	\N	0	2018-01-05 12:12:41	2018-06-12 21:54:41	2018-06-12 21:54:40
45236440	adoption-center	78	https://github.com/indirect/adoption-center	The RubyGems Adoption Center - RGSoC 2015	Ruby	0	0	\N	0	2015-10-30 05:46:09	2015-10-30 05:46:10	2015-10-30 05:47:13
112962904	adventofcode	78	https://github.com/indirect/adventofcode	\N	Ruby	0	0	\N	0	2017-12-03 18:53:55	2020-12-22 04:11:07	2020-12-22 04:11:04
2701252	airbrake	78	https://github.com/indirect/airbrake	Reports exceptions to Airbrake	Ruby	1	1	\N	1	2011-11-03 08:13:12	2013-01-04 11:44:11	2017-09-26 21:16:11
172681615	alpacka	78	https://github.com/indirect/alpacka	\N	Swift	0	1	\N	0	2019-02-26 06:38:15	2019-03-27 04:44:05	2020-12-09 20:35:16
1494584	always_verify_ssl_certificates	78	https://github.com/indirect/always_verify_ssl_certificates	Ruby's net/http is setup to never verify SSL certificates by default. Most ruby libraries do the same. That means that you're not verifying the identity of the server you're communicating with and are therefore exposed to man in the middle attacks. This gem monkey-patches net/http to force certificate verification and make turning it off impossible. 	Ruby	0	0	\N	1	2011-03-18 00:28:39	2012-12-25 08:29:35	2011-03-18 00:29:15
2130483	andre.arko.net	78	https://github.com/indirect/andre.arko.net	blog	JavaScript	2	5	\N	2	2011-07-30 19:48:57	2021-01-27 19:57:51	2021-01-28 02:34:50
13663827	andre.arko.net-new	78	https://github.com/indirect/andre.arko.net-new	new blog design?	Ruby	0	1	\N	0	2013-10-17 20:27:38	2013-10-17 20:29:55	2020-12-09 20:32:42
244293190	arduboy-hello-rs	78	https://github.com/indirect/arduboy-hello-rs	Demo for Arduboy written in rust	Rust	0	1	\N	0	2020-03-02 03:04:22	2020-03-04 04:32:34	2020-12-09 20:33:59
132853225	arewomenbadatcoding.com	78	https://github.com/indirect/arewomenbadatcoding.com	\N	CSS	0	0	\N	0	2018-05-10 02:34:30	2018-06-12 21:55:07	2018-06-12 21:55:06
2130494	arko.net	78	https://github.com/indirect/arko.net	homepage	HTML	1	0	\N	3	2011-07-30 19:51:13	2020-05-09 00:32:17	2020-05-09 00:32:15
238616232	Atreus2-Firmware	78	https://github.com/indirect/Atreus2-Firmware	\N	C++	0	0	\N	0	2020-02-06 02:38:24	2020-10-16 19:23:00	2020-10-16 19:22:57
15211616	bitcoin-ruby	78	https://github.com/indirect/bitcoin-ruby	bitcoin utils and protocol in ruby.	Ruby	1	0	\N	5	2013-12-15 20:00:33	2014-10-06 20:23:07	2013-12-19 02:45:57
253345612	blasterblock	78	https://github.com/indirect/blasterblock	\N	Ruby	0	0	\N	0	2020-04-05 19:36:49	2020-04-05 20:10:57	2020-04-05 20:10:54
237331679	bors-ng	78	https://github.com/indirect/bors-ng	👁 A merge bot for GitHub Pull Requests	\N	0	0	\N	0	2020-01-30 21:17:58	2020-01-30 21:18:00	2020-01-30 21:18:39
327685660	bpb	78	https://github.com/indirect/bpb	boats's personal barricade	Rust	0	0	\N	0	2021-01-07 14:51:14	2021-01-26 04:47:16	2021-01-26 04:47:14
164601858	brew	78	https://github.com/indirect/brew	🍺 The Homebrew package manager	Ruby	0	0	\N	0	2019-01-08 06:31:28	2020-06-30 04:30:13	2020-06-30 04:31:49
398608	brewbygems	78	https://github.com/indirect/brewbygems	Make RubyGems and Homebrew play nice together	Ruby	1	0	\N	42	2009-12-05 02:35:45	2020-12-02 21:45:53	2020-06-27 03:53:59
14568199	bt	78	https://github.com/indirect/bt	\N	JavaScript	0	0	\N	0	2013-11-20 18:29:42	2014-02-01 02:43:49	2014-01-18 16:21:22
40515315	bugsnag-notification-plugins	78	https://github.com/indirect/bugsnag-notification-plugins	Notification plugins for the Bugsnag error tracker	CoffeeScript	0	1	\N	0	2015-08-10 22:46:52	2015-08-10 22:46:53	2020-12-09 20:33:40
1517907	builder	78	https://github.com/indirect/builder	Provide a simple way to create XML markup and data structures.	Ruby	0	0	\N	1	2011-03-23 16:53:34	2012-12-31 13:40:38	2011-03-23 23:17:50
153554871	bundler	78	https://github.com/indirect/bundler	Manage your Ruby application's gem dependencies	Ruby	0	0	\N	0	2018-10-17 23:56:48	2020-01-09 22:14:10	2018-10-17 15:05:28
70657121	bundler-missing-versions-demo	78	https://github.com/indirect/bundler-missing-versions-demo	\N	Shell	0	0	\N	0	2016-10-12 00:03:16	2016-10-14 14:42:18	2016-10-14 14:47:06
14531492	call-for-papers	78	https://github.com/indirect/call-for-papers	\N	\N	0	0	\N	0	2013-11-19 15:09:51	2016-08-10 02:13:51	2013-11-24 19:07:27
216751936	callbox	78	https://github.com/indirect/callbox	\N	Ruby	0	0	\N	0	2019-10-22 04:38:00	2019-10-28 09:33:15	2019-10-24 00:48:38
14458194	call_for_proposals_2014	78	https://github.com/indirect/call_for_proposals_2014	\N	\N	0	0	\N	0	2013-11-16 22:21:38	2014-01-15 12:45:47	2013-11-20 20:06:47
29555881	capistrano-puma	78	https://github.com/indirect/capistrano-puma	Puma integration for Capistrano 3 	Ruby	0	0	\N	0	2015-01-20 20:08:32	2015-01-20 20:08:32	2015-01-20 20:09:56
6114243	activewarehouse-etl	79	https://github.com/fearoffish/activewarehouse-etl	Extract-Transform-Load library from ActiveWarehouse	Ruby	0	0	\N	0	2012-10-07 14:02:38	2013-06-24 14:07:58	2012-10-09 07:10:38
266137641	adhoq	79	https://github.com/fearoffish/adhoq	Rails engine to generate instant reports from adhoc SQL query.	\N	0	0	\N	0	2020-05-22 11:59:29	2020-05-22 11:59:30	2019-12-17 22:48:48
676812	aegis	79	https://github.com/fearoffish/aegis	Complete authorization solution for Rails that supports roles and a RESTish, resource-style declaration of permission rules. 	Ruby	1	0	\N	1	2010-05-20 07:09:56	2013-06-24 14:07:55	2010-05-24 15:11:13
1397668	aether	79	https://github.com/fearoffish/aether	Cloud computing management console - initially for Chef Server with EC2	JavaScript	3	0	\N	25	2011-02-22 10:49:49	2020-05-06 08:36:08	2013-06-03 11:05:39
306014348	alpine-chrome	79	https://github.com/fearoffish/alpine-chrome	Chrome Headless docker images built upon alpine official image	\N	0	0	\N	0	2020-10-21 09:16:56	2020-10-21 09:16:58	2020-10-08 09:35:27
296330004	argocd-notifications	79	https://github.com/fearoffish/argocd-notifications	Notifications for Argo CD	\N	0	0	\N	0	2020-09-17 10:10:40	2020-09-17 10:10:41	2020-06-26 08:59:50
181008379	artfulgardening.co.uk	79	https://github.com/fearoffish/artfulgardening.co.uk	Jade's website	Ruby	0	16	\N	0	2019-04-12 09:56:41	2019-05-31 08:22:34	2020-12-11 01:31:18
24384775	artoo-arduino	79	https://github.com/fearoffish/artoo-arduino	Artoo adaptor for the Arduino microcontroller.	\N	0	0	\N	0	2014-09-23 15:45:50	2014-09-16 11:01:37	2014-09-23 15:56:10
2421762	AuctionBoss	79	https://github.com/fearoffish/AuctionBoss	AuctionBoss is a data collection and analysis package for the WoW Auction House	Ruby	0	0	\N	1	2011-09-20 07:53:07	2013-06-24 14:07:56	2010-05-21 23:39:54
2193804	backup	79	https://github.com/fearoffish/backup	Backup is a RubyGem, written for Linux and Mac OSX, that allows you to easily perform backup operations on both your remote, as well as your local environment. It provides you with an elegant DSL in Ruby for modeling (configuring) your backups. Backup has built-in support for various databases, storage protocols/services, syncers, compressors, encryptors and notifiers which you can mix and match. It was built with modularity, extensibility and simplicity in mind.	Ruby	0	0	\N	1	2011-08-11 18:13:22	2015-03-30 15:54:53	2011-08-11 20:05:27
67156502	bosh-aws-cpi-release	79	https://github.com/fearoffish/bosh-aws-cpi-release	BOSH AWS CPI	Ruby	0	0	\N	0	2016-09-01 15:33:41	2018-10-01 12:52:15	2016-09-02 06:01:54
12240680	bosh-bootstrap	79	https://github.com/fearoffish/bosh-bootstrap	From zero to a running micro BOSH in one command line	Ruby	0	0	\N	0	2013-08-20 07:35:47	2017-03-23 18:51:11	2013-08-20 10:21:14
12627316	bosh-cloudfoundry	79	https://github.com/fearoffish/bosh-cloudfoundry	Create, scale and upgrade your company's own Cloud Foundry	Ruby	0	0	\N	0	2013-09-05 16:53:55	2017-03-23 18:51:37	2013-09-05 16:55:23
12285044	bosh-info	79	https://github.com/fearoffish/bosh-info	Grab information from a bosh release, right now just the cf-release, and just differences between properties (between tags)	Ruby	0	0	\N	5	2013-08-21 21:54:25	2019-07-08 06:34:45	2013-08-22 11:25:51
36470639	bosh-workspace	79	https://github.com/fearoffish/bosh-workspace	Gem for managing your bosh workspace	Ruby	0	0	\N	0	2015-05-28 19:55:53	2020-09-21 02:55:20	2015-05-29 13:28:40
38735	britify	79	https://github.com/fearoffish/britify	Translate from American to British and British to American (for amusement only)	Ruby	1	0	\N	10	2008-07-30 22:29:49	2019-08-13 10:30:25	2008-08-21 17:59:59
2748168	bulk_api	79	https://github.com/fearoffish/bulk_api	\N	Ruby	0	0	\N	1	2011-11-10 09:43:20	2013-06-24 14:07:56	2011-11-10 09:47:43
62235118	cf-deployment	79	https://github.com/fearoffish/cf-deployment	Genesis Templates for a traditional Cloud Foundry deployment	Shell	0	1	\N	0	2016-06-29 12:04:47	2018-06-29 16:51:10	2016-06-29 12:13:30
12226198	cf-docs	79	https://github.com/fearoffish/cf-docs	A well lit place for docs	CSS	0	0	\N	0	2013-08-19 16:55:44	2014-06-13 14:36:45	2013-08-19 23:00:21
33302713	cf-rabbitmq-release	79	https://github.com/fearoffish/cf-rabbitmq-release	\N	Clojure	0	0	\N	0	2015-04-02 07:19:00	2015-04-02 07:21:04	2015-04-02 07:21:04
33302494	cf-redis-release	79	https://github.com/fearoffish/cf-redis-release	\N	HTML	0	0	\N	0	2015-04-02 07:13:27	2015-04-02 07:17:19	2015-04-02 07:17:18
11426301	cf-release	79	https://github.com/fearoffish/cf-release	\N	C	0	0	\N	0	2013-07-15 12:19:06	2018-02-13 20:48:57	2013-07-15 12:42:25
12141220	cf-services-contrib-release	79	https://github.com/fearoffish/cf-services-contrib-release	release repository for community contributed services	Ruby	0	0	\N	0	2013-08-15 15:53:07	2014-02-04 17:19:01	2013-08-16 06:36:03
11526730	cf-services-release	79	https://github.com/fearoffish/cf-services-release	Cloud Foundry services	Ruby	0	0	\N	0	2013-07-19 08:42:58	2017-03-29 06:38:18	2013-07-17 16:32:57
11712911	cfoundry	79	https://github.com/fearoffish/cfoundry	Cloud Foundry REST API gem	Ruby	0	0	\N	0	2013-07-27 21:16:04	2015-05-05 14:46:57	2013-07-29 12:44:45
16104077	chatter	79	https://github.com/fearoffish/chatter	A demo application that summarises chat messages	Ruby	1	0	\N	0	2014-01-21 12:02:30	2018-01-10 08:18:49	2017-10-12 05:22:40
1478081	chef-fiddler	79	https://github.com/fearoffish/chef-fiddler	Classes that interact with chef servers (to be included in other projects)	Ruby	0	0	\N	1	2011-03-14 09:29:14	2014-05-14 14:31:41	2011-03-15 10:05:50
4703800	cinderella	79	https://github.com/fearoffish/cinderella	how your apple laptop should work	Ruby	0	0	\N	1	2012-06-18 14:18:44	2014-12-09 07:49:37	2012-06-23 09:28:07
2929164	clamp	79	https://github.com/fearoffish/clamp	a Ruby command-line application framework	Ruby	0	0	\N	1	2011-12-06 22:20:00	2013-06-24 14:07:57	2011-12-06 22:25:21
265315031	clean	79	https://github.com/fearoffish/clean	\N	\N	0	0	\N	0	2020-05-19 14:26:09	2020-05-19 14:26:11	2020-04-30 14:54:30
322297486	aaa_tinyclouds2	80	https://github.com/ry/aaa_tinyclouds2	\N	JavaScript	2	0	\N	5	2020-12-17 10:07:04	2021-01-08 09:27:24	2021-01-08 09:27:22
164223619	awesome-deno	80	https://github.com/ry/awesome-deno	🎉A curated list of awesome things related to Deno	\N	0	0	\N	16	2019-01-05 12:47:49	2021-01-07 13:06:36	2019-01-10 16:47:25
205937462	aws-appsync-chat	80	https://github.com/ry/aws-appsync-chat	Real-Time Offline Ready Chat App written with GraphQL, AWS AppSync, & AWS Amplify	JavaScript	2	0	\N	9	2019-09-02 18:13:07	2020-09-19 13:02:38	2019-09-02 18:26:50
146788128	deno	80	https://github.com/ry/deno	\N	TypeScript	31	0	\N	399	2018-08-30 15:09:18	2021-01-17 15:59:38	2021-01-29 10:16:35
162363037	deno_std	80	https://github.com/ry/deno_std	deno standard modules	TypeScript	0	0	\N	2	2018-12-18 22:55:46	2020-02-20 11:41:48	2019-10-10 06:36:08
201152585	deno_typescript	80	https://github.com/ry/deno_typescript	To generate snapshots of TypeScript files during build.rs	JavaScript	3	0	\N	32	2019-08-07 22:14:41	2020-11-10 17:52:32	2019-09-10 14:57:48
217404450	deno_website2	80	https://github.com/ry/deno_website2	prototype of new deno.land website 	\N	1	0	\N	9	2019-10-24 19:14:58	2020-09-15 10:02:17	2020-10-08 12:15:49
248276811	discord-open-source	80	https://github.com/ry/discord-open-source	List of open source communities living on Discord	\N	1	0	\N	1	2020-03-18 12:55:29	2020-05-13 21:20:54	2020-03-18 12:56:18
237802090	eecs151	80	https://github.com/ry/eecs151	http://inst.eecs.berkeley.edu/~eecs151/fa19/	Verilog	0	0	\N	12	2020-02-02 13:43:05	2020-02-20 11:41:44	2020-02-02 13:53:03
307216234	fetchevent_examples	80	https://github.com/ry/fetchevent_examples	Examples that make use of web standard FetchEvent	JavaScript	0	0	\N	0	2020-10-25 20:47:22	2021-01-18 18:19:44	2021-01-18 18:19:41
151741813	flatbuffers	80	https://github.com/ry/flatbuffers	Memory Efficient Serialization Library	C++	1	0	\N	2	2018-10-05 12:31:17	2020-02-20 11:42:01	2018-10-05 12:35:03
138584245	flatbuffers_chromium	80	https://github.com/ry/flatbuffers_chromium	\N	C++	2	0	\N	21	2018-06-25 08:13:22	2020-02-20 11:42:02	2018-06-25 08:15:09
156896555	go	80	https://github.com/ry/go	The Go programming language	Go	2	0	\N	10	2018-11-09 15:37:55	2020-06-16 21:33:53	2020-09-02 05:19:11
57337498	gym	80	https://github.com/ry/gym	A toolkit for developing and comparing reinforcement learning algorithms.	Python	2	0	\N	6	2016-04-28 19:22:04	2020-10-21 15:57:07	2016-05-31 16:15:08
178950736	homebrew-core	80	https://github.com/ry/homebrew-core	🍻 Default formulae for the missing package manager for macOS	Ruby	0	0	\N	1	2019-04-01 18:36:57	2020-02-20 11:41:55	2019-04-17 13:05:26
124598466	parcel	80	https://github.com/ry/parcel	📦🚀 Blazing fast, zero configuration web application bundler	JavaScript	2	0	\N	10	2018-03-09 19:08:10	2020-02-20 11:42:14	2018-03-22 03:28:51
135518741	protobuf_chromium	80	https://github.com/ry/protobuf_chromium	\N	C++	1	0	\N	7	2018-05-30 23:03:43	2020-02-20 11:42:03	2018-06-21 10:15:41
245498305	rust-sourcemap	80	https://github.com/ry/rust-sourcemap	A library for rust that implements basic sourcemap handling	\N	0	0	\N	2	2020-03-06 16:14:33	2020-05-13 04:58:27	2020-04-08 12:11:15
221978975	rusty_v8	80	https://github.com/ry/rusty_v8	\N	\N	0	0	\N	8	2019-11-15 15:13:00	2020-07-20 11:04:36	2020-10-16 12:16:19
245296385	sccache	80	https://github.com/ry/sccache	sccache is ccache with cloud storage	\N	0	0	\N	2	2020-03-05 21:29:02	2020-03-08 17:30:05	2020-03-14 16:16:00
135439182	summit	80	https://github.com/ry/summit	Organizing a Collaborator Summit	\N	0	0	\N	3	2018-05-30 09:25:56	2020-02-20 11:42:05	2018-05-30 09:47:38
56016951	tensorflow	80	https://github.com/ry/tensorflow	Computation using data flow graphs for scalable machine learning	C++	3	0	\N	4	2016-04-11 21:08:52	2018-10-03 13:33:51	2017-08-22 17:28:19
48251594	tensorflow-resnet	80	https://github.com/ry/tensorflow-resnet	ResNet model in TensorFlow	Python	631	38	\N	1579	2015-12-18 17:03:22	2021-01-25 13:12:56	2018-06-15 23:54:27
46162916	tensorflow-vgg16	80	https://github.com/ry/tensorflow-vgg16	conversation of caffe vgg16 model to tensorflow	Python	288	12	\N	650	2015-11-14 03:32:04	2021-01-29 18:01:52	2018-12-29 21:54:24
59914434	tfevents_plot	80	https://github.com/ry/tfevents_plot	\N	Python	2	0	\N	9	2016-05-28 18:05:17	2020-02-20 11:42:27	2016-05-28 18:16:35
129989018	tfjs-core	80	https://github.com/ry/tfjs-core	WebGL-accelerated ML // linear algebra // automatic differentiation for JavaScript.	TypeScript	0	0	\N	4	2018-04-17 23:01:13	2020-02-20 11:42:12	2018-04-22 12:20:39
130517755	tfjs-layers	80	https://github.com/ry/tfjs-layers	TensorFlow.js high-level layers API	TypeScript	1	0	\N	2	2018-04-21 19:51:02	2020-02-20 11:42:11	2018-04-23 00:29:59
130892284	tfjs-node	80	https://github.com/ry/tfjs-node	\N	TypeScript	0	0	\N	2	2018-04-24 14:43:39	2020-02-20 11:42:10	2018-04-24 15:49:08
112437868	tldr	80	https://github.com/ry/tldr	:books: Simplified and community-driven man pages	TeX	1	0	\N	9	2017-11-29 04:46:29	2020-02-20 11:42:16	2017-11-29 18:00:38
152482471	tokio	80	https://github.com/ry/tokio	A runtime for writing reliable, asynchronous, and slim applications with the Rust programming language.	Rust	0	0	\N	11	2018-10-10 17:01:31	2020-05-17 07:03:09	2019-04-23 14:41:25
29930933	active_model_serializers	81	https://github.com/engineyard/active_model_serializers	ActiveModel::Serializer implementation and Rails hooks	Ruby	0	0	\N	1	2015-01-27 17:31:23	2015-04-06 23:38:58	2015-08-11 12:33:17
2984636	addressable	81	https://github.com/engineyard/addressable	Addressable is a replacement for the URI implementation that is part of Ruby's standard library. It more closely conforms to the relevant RFCs and adds support for IRIs and URI templates. 	Ruby	0	0	\N	1	2011-12-14 23:24:09	2013-01-04 19:33:11	2011-10-31 09:33:14
26763923	angular-wizard	81	https://github.com/engineyard/angular-wizard	Easy to use Wizard library for AngularJS	JavaScript	0	0	\N	0	2014-11-17 13:48:31	2014-12-16 21:45:38	2015-07-08 11:59:24
1289733	appcloud-for-chrome-webstore	81	https://github.com/engineyard/appcloud-for-chrome-webstore	The manifest + assets for a Hosted App on the Chrome WebStore	Ruby	0	0	\N	2	2011-01-24 21:55:54	2014-03-05 06:41:27	2011-01-25 23:45:11
12469987	ardm	81	https://github.com/engineyard/ardm	Use Datamapper DSL on top of ActiveRecord	Ruby	8	2	\N	14	2013-08-29 17:08:44	2020-07-21 21:03:14	2017-06-15 19:01:06
4208331	ar_properties	81	https://github.com/engineyard/ar_properties	Explicit properties for ActiveRecord	Ruby	0	0	\N	1	2012-05-02 19:36:48	2013-10-19 08:38:19	2012-05-08 20:57:09
8842112	async	81	https://github.com/engineyard/async	Yet another background processing abstraction layer	Ruby	2	1	\N	2	2013-03-17 18:45:18	2017-05-17 15:39:36	2017-09-26 21:16:39
21660603	aws-s3	81	https://github.com/engineyard/aws-s3	AWS-S3 is a Ruby implementation of Amazon's S3 REST API	\N	0	0	\N	1	2014-07-09 13:46:39	2014-10-23 07:27:01	2014-07-09 16:52:47
11028542	azure-sdk-for-python	81	https://github.com/engineyard/azure-sdk-for-python	Windows Azure SDK for Python	VHDL	0	0	\N	0	2013-06-28 11:32:29	2014-06-20 15:54:45	2014-06-20 15:54:45
7099179	backup	81	https://github.com/engineyard/backup	Backup is a RubyGem, written for UNIX-like operating systems, that allows you to easily perform backup operations on both your remote, as well as your local environment. It provides you with an elegant DSL in Ruby for modeling (configuring) your backups. Backup has built-in support for various databases, storage protocols/services, syncers, compressors, encryptors and notifiers which you can mix and match. It was built with modularity, extensibility and simplicity in mind.	Ruby	2	1	\N	1	2012-12-10 17:23:34	2015-03-30 15:54:54	2014-03-13 18:09:49
64217920	basic-chat	81	https://github.com/engineyard/basic-chat	Basic Node.js chat app using Socket.IO	JavaScript	1	0	\N	0	2016-07-26 09:02:01	2016-08-03 06:52:03	2016-09-19 07:39:07
4328499	bcrypt-ruby	81	https://github.com/engineyard/bcrypt-ruby	bcrypt-ruby is a Ruby binding for the OpenBSD bcrypt() password hashing algorithm, allowing you to easily store a secure hash of your users' passwords.	C	0	0	\N	1	2012-05-14 17:17:18	2013-01-09 02:31:42	2011-10-21 13:33:03
2440824	bundler	81	https://github.com/engineyard/bundler	Manage your application's gem dependencies with less pain	Ruby	0	0	\N	1	2011-09-22 20:19:16	2020-01-09 22:11:37	2011-09-26 18:31:06
110126916	capybara-screenshot	81	https://github.com/engineyard/capybara-screenshot	Automatically save screen shots when a Capybara scenario fails	Ruby	1	0	\N	0	2017-11-09 12:41:11	2017-11-09 12:41:13	2018-09-13 16:45:56
4540649	chat	81	https://github.com/engineyard/chat	Sample Node.js App for Engine Yard Cloud	CSS	32	1	\N	17	2012-06-03 18:09:06	2020-01-16 02:29:56	2017-06-06 16:26:46
234534	chef-deploy	81	https://github.com/engineyard/chef-deploy	Chef Resources and Providers for deploying ruby web apps without capistrano	Ruby	1	0	\N	12	2009-06-23 15:29:05	2016-04-15 09:20:36	2010-04-01 19:14:46
19391815	chef-mongodb	81	https://github.com/engineyard/chef-mongodb	MongoDB Chef cookbook	Ruby	0	0	\N	0	2014-05-02 20:54:49	2016-07-29 09:56:13	2014-04-28 07:01:03
26134134	chef-percona	81	https://github.com/engineyard/chef-percona	Chef cookbook for Percona MySQL components	\N	0	0	\N	1	2014-11-03 17:10:11	2019-01-17 19:56:42	2014-08-21 19:55:08
25310714	chef-postgresql	81	https://github.com/engineyard/chef-postgresql	Chef cookbook for PostgreSQL components 	\N	0	0	\N	0	2014-10-16 13:19:41	2014-10-12 13:50:16	2014-08-27 01:44:06
19147125	chef-vault	81	https://github.com/engineyard/chef-vault	Securely manage passwords, certs, and other secrets in Chef	Ruby	0	0	\N	0	2014-04-25 10:37:31	2015-11-24 11:50:05	2014-04-05 15:53:34
2379879	chronatog	81	https://github.com/engineyard/chronatog	third party api integration service example	Ruby	5	0	\N	4	2011-09-13 14:18:14	2017-05-25 22:43:04	2013-07-26 20:36:13
11486462	cistern	81	https://github.com/engineyard/cistern	API client framework extracted from Fog	Ruby	0	0	\N	2	2013-07-17 17:14:19	2015-01-11 15:50:07	2014-06-17 12:39:57
14187197	cliff	81	https://github.com/engineyard/cliff	Command Line Interface Formulation Framework	Python	1	0	\N	0	2013-11-06 20:11:36	2013-11-06 20:12:30	2013-10-23 20:49:49
3114429	cloudex	81	https://github.com/engineyard/cloudex	Lookup for vm on TMK	Ruby	0	0	\N	1	2012-01-05 22:02:54	2014-02-12 14:04:35	2012-01-25 17:01:31
147662551	container-services-examples	81	https://github.com/engineyard/container-services-examples	A few examples for Engine Yard Container Services	Ruby	5	2	\N	0	2018-09-06 08:19:18	2018-09-27 06:39:18	2019-02-08 13:45:07
37610297	core-client-rb	81	https://github.com/engineyard/core-client-rb	Engine Yard Core API Ruby client	Ruby	18	15	\N	5	2015-06-17 14:34:46	2020-06-11 17:25:04	2020-11-15 08:39:10
11848544	coveralls-ruby	81	https://github.com/engineyard/coveralls-ruby	Coveralls for Ruby	Ruby	0	0	\N	0	2013-08-02 14:18:34	2013-08-02 14:18:35	2013-05-15 18:39:13
303611	cucumber	81	https://github.com/engineyard/cucumber	BDD that talks to domain experts first and code second	Ruby	1	0	\N	1	2009-09-10 20:52:22	2017-06-05 13:54:20	2009-09-17 23:19:35
22477312	database_cleaner	81	https://github.com/engineyard/database_cleaner	Strategies for cleaning databases in Ruby.  Can be used to ensure a clean state for testing.	\N	1	1	\N	1	2014-07-31 13:55:30	2019-05-05 03:22:51	2017-09-26 21:16:57
2188244	datafabric-example	81	https://github.com/engineyard/datafabric-example	\N	Ruby	0	0	\N	2	2011-08-10 20:27:22	2014-01-19 03:11:24	2011-08-10 20:34:18
7610537	amatsung	82	https://github.com/jsierles/amatsung	Run Tsung Szenarios on multiple Amazon EC2 Instances	Ruby	0	0	\N	0	2013-01-14 16:57:50	2013-01-14 16:57:50	2011-10-27 12:08:26
62663085	animated	82	https://github.com/jsierles/animated	Declarative Animations Library for React and React Native	JavaScript	0	0	\N	0	2016-07-05 16:18:35	2016-07-05 16:18:37	2016-07-05 16:31:48
18653148	apache2	82	https://github.com/jsierles/apache2	Development repository for  the apache2 cookbook	Ruby	0	0	\N	0	2014-04-10 18:53:05	2016-11-08 16:20:16	2014-04-10 19:20:15
55815485	represent	87	https://github.com/tmornini/represent	\N	Ruby	0	0	\N	0	2016-04-08 20:21:40	2016-04-08 20:23:45	2016-04-19 19:49:54
213916	asterisk-cookbook	82	https://github.com/jsierles/asterisk-cookbook	A Chef cookbook for creating an Asterisk server	Ruby	0	0	\N	2	2009-05-29 21:21:13	2014-04-15 14:23:48	2009-05-27 12:46:57
25974387	bcx	82	https://github.com/jsierles/bcx	Fully-fledged Ruby API wrapper for Basecamp Next	\N	0	0	\N	0	2014-10-30 12:25:06	2013-10-02 02:07:12	2013-09-02 15:55:21
4110271	bcx-api	82	https://github.com/jsierles/bcx-api	API documentation and wrappers for the new Basecamp	\N	0	0	\N	0	2012-04-23 03:37:54	2018-04-05 15:43:23	2012-04-21 23:22:24
1209306	bitsontherun	82	https://github.com/jsierles/bitsontherun	BitsOnTheRun.com API implementation in Ruby	Ruby	1	0	\N	2	2010-12-30 17:55:32	2018-03-29 20:36:05	2011-07-14 14:52:50
822209	bits_on_the_run	82	https://github.com/jsierles/bits_on_the_run	Ruby implementation of the Bits on the Run API	Ruby	0	0	\N	6	2010-08-06 18:00:36	2017-05-21 02:30:25	2010-08-13 09:58:24
381893	bluepill	82	https://github.com/jsierles/bluepill	simple process monitoring tool	Ruby	1	0	\N	0	2009-11-22 19:22:10	2018-04-05 15:43:59	2010-02-05 16:59:09
6143966	braindump	82	https://github.com/jsierles/braindump	A practical, fun and educational UNIX command wrapper	Ruby	0	0	\N	1	2012-10-09 13:35:33	2014-06-17 19:06:03	2012-12-04 00:24:19
439269	broach	82	https://github.com/jsierles/broach	Ruby implementation of 37signal's Campfire API.	Ruby	1	0	\N	0	2009-12-16 12:56:11	2018-04-05 15:43:55	2009-12-16 16:53:20
34730896	browserify-rails	82	https://github.com/jsierles/browserify-rails	Browserify + Rails = CommonJS Heaven	Ruby	0	0	\N	0	2015-04-28 10:06:55	2015-04-28 10:06:56	2015-04-20 20:07:48
446913	bundler	82	https://github.com/jsierles/bundler	\N	Ruby	1	0	\N	0	2009-12-23 09:24:01	2018-04-05 15:43:53	2010-01-07 00:27:14
19456491	capistrano-bundler	82	https://github.com/jsierles/capistrano-bundler	Bundler support for Capistrano 3.x	Ruby	0	0	\N	0	2014-05-05 10:24:49	2014-05-05 10:25:12	2014-03-26 05:43:24
17210567	capistrano-newrelic	82	https://github.com/jsierles/capistrano-newrelic	New Relic integration for Capistrano 3	Ruby	0	0	\N	0	2014-02-26 09:54:13	2014-02-26 10:03:24	2014-02-26 10:03:23
32897684	carrierwave-video	82	https://github.com/jsierles/carrierwave-video	carrierwave extension to use ffmpeg to transcode videos to html5-friendly format	Ruby	0	0	\N	0	2015-03-25 20:53:43	2015-03-25 20:53:43	2014-05-16 13:13:34
36671613	cfp-lightnings-2015	82	https://github.com/jsierles/cfp-lightnings-2015	ReactEurope Lightning talks Call For Papers	\N	1	1	\N	0	2015-06-01 12:55:28	2015-05-20 13:37:15	2017-09-26 21:17:05
116753	chef	82	https://github.com/jsierles/chef	A systems integration framework, built to bring the benefits of configuration management to your entire infrastructure.	Ruby	0	1	\N	4	2009-01-28 16:24:21	2019-08-13 10:56:50	2010-04-21 13:11:07
15479909	chef-ec2-bundle-vol	82	https://github.com/jsierles/chef-ec2-bundle-vol	bundles and uploads a new ec2 ami from the running instance, ready to use with auto-scaling	Ruby	0	0	\N	0	2013-12-27 16:56:19	2013-12-27 16:56:20	2012-06-15 07:58:54
1972532	chef_cookbooks_deprecated	82	https://github.com/jsierles/chef_cookbooks_deprecated	Opinionated chef recipes for Ubuntu/Debian. Manage nginx, unicorn, UNIX user accounts, postgresql, and more!	Perl	30	0	\N	143	2011-06-29 10:51:13	2020-04-15 12:38:15	2012-12-21 16:00:07
461045	cijoe	82	https://github.com/jsierles/cijoe	CI Joe is a simple Continuous Integration server.	Ruby	1	0	\N	0	2010-01-06 16:30:29	2018-04-05 15:43:50	2010-01-06 17:24:55
644320	clickatell	82	https://github.com/jsierles/clickatell	Ruby interface to the Clickatell SMS Gateway API	Ruby	1	0	\N	1	2010-05-03 09:25:44	2012-12-14 14:13:06	2010-05-03 12:27:34
20563060	confd	82	https://github.com/jsierles/confd	Manage local application configuration files using templates and data from etcd or consul	Go	0	0	\N	0	2014-06-06 09:34:42	2014-06-06 09:34:43	2014-05-28 19:30:31
272265841	convox	82	https://github.com/jsierles/convox	Multicloud Platform as a Service	Go	0	0	\N	0	2020-06-14 16:03:18	2020-07-08 09:27:00	2020-07-08 09:26:56
20402483	crane	82	https://github.com/jsierles/crane	Crane - Lift containers with ease	Go	0	0	\N	0	2014-06-02 09:02:26	2014-06-10 20:57:48	2014-06-10 08:10:53
104106281	diagrams	82	https://github.com/jsierles/diagrams	\N	\N	0	0	\N	0	2017-09-19 14:31:15	2017-09-19 14:31:15	2017-09-19 14:32:08
37912797	diluvia-web	82	https://github.com/jsierles/diluvia-web	Jekyll theme based on Grayscale Start Bootstrap theme	CSS	0	0	\N	0	2015-06-23 07:35:45	2015-06-23 07:36:12	2015-05-26 09:23:59
19994880	discourse	82	https://github.com/jsierles/discourse	A platform for community discussion. Free, open, simple.	Ruby	0	0	\N	0	2014-05-20 16:43:18	2014-05-25 00:56:31	2014-05-23 08:01:14
84401319	distillery	82	https://github.com/jsierles/distillery	A pure Elixir implementation of release packaging functionality for the Erlang VM	Elixir	0	0	\N	0	2017-03-09 02:18:35	2017-03-09 02:18:37	2017-03-09 03:45:12
15564527	dnsimple-services	82	https://github.com/jsierles/dnsimple-services	\N	Ruby	0	0	\N	0	2014-01-01 11:30:21	2018-02-08 17:04:31	2013-12-14 07:37:23
56159120	aardvark	83	https://github.com/tweibley/aardvark	\N	\N	0	0	\N	0	2016-04-13 11:29:43	2016-04-13 11:29:43	2016-04-13 11:34:33
11452929	camper_van	83	https://github.com/tweibley/camper_van	A Campfire to IRC bridge	Ruby	0	0	\N	0	2013-07-16 12:23:35	2013-07-16 12:23:35	2013-06-29 18:33:27
1815047	em-dns-server	83	https://github.com/tweibley/em-dns-server	A simple Ruby DNS server for EventMachine	Ruby	0	0	\N	2	2011-05-28 15:30:03	2013-10-08 03:01:41	2010-12-23 20:46:24
10980993	firering	83	https://github.com/tweibley/firering	Eventmachine powered Campfire API	Ruby	0	0	\N	0	2013-06-26 19:33:48	2013-07-06 00:17:23	2013-06-26 20:06:46
1874162	fog	83	https://github.com/tweibley/fog	The Ruby cloud services library.	Ruby	0	0	\N	2	2011-06-10 00:14:06	2013-10-08 03:01:47	2011-06-08 21:52:47
47335981	geoip	83	https://github.com/tweibley/geoip	GeoIP API for Golang	Go	0	0	\N	0	2015-12-03 12:08:15	2015-12-03 12:08:16	2015-07-29 16:40:25
123628725	helm-secure-tiller	83	https://github.com/tweibley/helm-secure-tiller	Enable RBAC profiles for Tiller	Shell	2	1	\N	2	2018-03-02 17:42:45	2018-04-15 05:00:12	2018-04-15 12:39:50
9253276	knife-hardware	83	https://github.com/tweibley/knife-hardware	Helpers for linking hardware information in a hardware data bag to a node by UUID	Ruby	0	0	\N	0	2013-04-05 21:31:38	2013-10-08 03:01:54	2012-11-21 12:36:54
7425254	mysql_cache_manager	83	https://github.com/tweibley/mysql_cache_manager	MySQL Cache Manager: Save and restore InnoDB Buffer Pool contents	Ruby	0	0	\N	0	2013-01-03 13:51:19	2013-10-08 03:01:54	2013-01-03 13:54:48
21905342	redis	83	https://github.com/tweibley/redis	Redis is an in-memory database that persists on disk. The data model is key-value, but many different kind of values are supported: Strings, Lists, Sets, Sorted Sets, Hashes	\N	0	0	\N	0	2014-07-16 12:00:23	2020-07-07 06:21:51	2014-07-16 06:37:41
2884267	rubyhaze-persisted	83	https://github.com/tweibley/rubyhaze-persisted	ActiveRecord-like objects persisted with Hazelcast and RubyHaze	Ruby	0	0	\N	2	2011-11-30 13:54:16	2013-10-08 03:01:46	2011-11-30 13:58:25
47410583	traceroute	83	https://github.com/tweibley/traceroute	Go Traceroute library	Go	0	0	\N	0	2015-12-04 13:03:10	2015-12-04 13:03:10	2013-12-08 18:41:08
2428	actsassubscribeable	84	https://github.com/peimei/actsassubscribeable	The acts_as_subscribeable plugin is a generator and plugin to allow the subscription based email notification 	Ruby	1	0	\N	4	2008-03-04 10:30:40	2019-08-13 10:21:43	2008-03-26 16:44:52
2173	has_many_tenses	84	https://github.com/peimei/has_many_tenses	Allows models to have associations and instance bools based on past recent and future	Ruby	1	0	\N	6	2008-03-02 20:47:57	2019-08-13 10:21:41	2008-03-26 16:39:48
206198527	hello-github-actions	109	https://github.com/lukesutton/hello-github-actions	\N	\N	0	1	\N	0	2019-09-03 21:49:47	2019-09-03 21:50:12	2019-09-03 21:50:11
11475	jitsu-framework-base-website	84	https://github.com/peimei/jitsu-framework-base-website	The Modular "MyTubeSpace" Website that Jitsu Is extracted from	Ruby	7	5	\N	3	2008-04-21 00:43:24	2019-08-13 10:23:22	2020-10-02 07:45:27
11474	jitsu-framework-gem	84	https://github.com/peimei/jitsu-framework-gem	Jitsu is a modular website development framework using Ruby on Rails	Ruby	1	0	\N	4	2008-04-21 00:39:30	2019-08-13 10:23:22	2008-04-25 16:44:04
204921	restful-authentication	84	https://github.com/peimei/restful-authentication	Hamlized version of Rick's Restful Authentication	Ruby	1	0	\N	1	2009-05-19 12:33:43	2012-12-12 20:10:59	2009-04-13 20:47:54
98589082	airbrake-elixir	85	https://github.com/brixen/airbrake-elixir	An Elixir notifier to the Airbrake/Errbit.  System-wide error reporting enriched with the information from Plug and Phoenix channels.	Elixir	0	0	\N	0	2017-07-27 21:02:23	2017-07-27 21:02:24	2017-07-31 16:05:21
42227749	Antrack	85	https://github.com/brixen/Antrack	\N	C++	0	0	\N	0	2015-09-10 03:51:33	2015-09-10 03:51:34	2015-09-10 03:52:37
8964808	arachni	85	https://github.com/brixen/arachni	Web Application Security Scanner Framework	Ruby	0	0	\N	1	2013-03-22 23:39:31	2013-03-23 05:34:12	2013-03-20 20:06:05
14024171	archer	85	https://github.com/brixen/archer	A programming language using only Unicode arrows.	\N	2	0	\N	4	2013-10-31 15:51:39	2018-10-12 09:42:43	2017-08-17 14:07:58
31239572	atom	85	https://github.com/brixen/atom	The hackable editor	CoffeeScript	0	0	\N	0	2015-02-23 22:30:34	2015-02-23 22:30:39	2015-02-25 02:10:06
30809556	atom-term2	85	https://github.com/brixen/atom-term2	Open Terminal tabs in Atom. Fork of Term package	CoffeeScript	0	0	\N	0	2015-02-14 19:35:40	2015-02-14 19:35:41	2014-10-05 15:10:37
5867269	atomy	85	https://github.com/brixen/atomy	a modular, macro-ular, totally tubular language for the Rubinius VM. #atomo @ freenode	Ruby	0	0	\N	0	2012-09-19 02:11:48	2013-01-12 05:30:22	2012-09-19 02:27:31
118089725	autoload	85	https://github.com/brixen/autoload	defined? differences between MRI and rbx	Ruby	0	0	\N	0	2018-01-19 05:01:30	2018-01-19 05:02:12	2018-01-20 15:37:27
32033016	big_brother	85	https://github.com/brixen/big_brother	a daemon to monitor and administer servers in a LVS cluster of load balanced virtual servers	Ruby	0	0	\N	0	2015-03-11 15:04:28	2015-03-11 15:04:29	2015-02-23 17:28:57
9804915	brixen.github.io	85	https://github.com/brixen/brixen.github.io	\N	JavaScript	0	0	\N	0	2013-05-02 00:19:58	2013-10-18 20:07:25	2013-10-18 20:07:25
1186623	brixen.io	85	https://github.com/brixen/brixen.io	A collection of stuff.	\N	0	0	\N	3	2010-12-21 06:12:25	2019-08-23 04:33:45	2013-01-02 16:19:01
56632319	bunny	85	https://github.com/brixen/bunny	Bunny is a popular, easy to use, well-maintained Ruby client for RabbitMQ (3.3+)	Ruby	1	0	\N	0	2016-04-19 18:11:05	2016-04-19 18:11:06	2016-04-19 18:13:01
4126968	bzip2-ruby	85	https://github.com/brixen/bzip2-ruby	Original libbz2 ruby C bindings from Guy Decoux, with some new love	Ruby	0	0	\N	2	2012-04-24 13:33:43	2013-01-08 19:34:38	2012-04-27 21:04:13
3613685	call-for-proposals	85	https://github.com/brixen/call-for-proposals	Want to submit a talk proposal for EuRuKo 2012? This is the place to be!	\N	0	0	\N	1	2012-03-03 17:58:03	2014-03-13 13:39:55	2012-03-03 22:52:12
681022	charm	85	https://github.com/brixen/charm	Rubinius helping Ruby swallow Java, one bytecode at a time.	Ruby	2	0	\N	6	2010-05-22 17:49:04	2021-01-13 16:29:03	2013-10-30 18:46:17
790378	clojure	85	https://github.com/brixen/clojure	CloXure is Clojure running on the Rubinius VM	\N	0	0	\N	3	2010-07-22 04:32:30	2018-05-01 01:52:02	2010-07-22 04:33:58
36046905	cocaine	85	https://github.com/brixen/cocaine	A small library for doing (command) lines.	Ruby	0	0	\N	0	2015-05-21 23:01:46	2015-05-21 23:01:47	2015-05-21 23:06:47
14763832	cocoon	85	https://github.com/brixen/cocoon	Dynamic nested forms using jQuery made easy; works with formtastic, simple_form or default forms	Ruby	1	1	\N	0	2013-11-27 22:51:47	2013-12-06 15:12:13	2017-09-26 21:17:40
16819550	concurrent-ruby	85	https://github.com/brixen/concurrent-ruby	Modern concurrency tools including agents, futures, promises, thread pools, supervisors, and more. Inspired by Erlang, Clojure, Scala, Go, Java, JavaScript, and classic concurrency patterns.	Ruby	0	0	\N	4	2014-02-13 20:32:22	2014-02-18 18:17:39	2014-02-18 17:24:37
7567186	coping	85	https://github.com/brixen/coping	An experimental type-safe/context-aware templating library	Ruby	1	0	\N	0	2013-01-11 19:17:59	2013-01-17 18:49:32	2013-01-11 19:18:54
43861207	cpp-test	85	https://github.com/brixen/cpp-test	\N	C	0	0	\N	0	2015-10-08 00:46:56	2015-10-08 00:46:56	2015-10-08 00:48:16
89865308	Cure	85	https://github.com/brixen/Cure	Small library that interfaces C-code with Erlang/Elixir using Ports.	Elixir	1	1	\N	0	2017-04-30 14:18:48	2017-04-30 14:18:49	2017-09-26 21:17:45
16713574	darstellung	85	https://github.com/brixen/darstellung	Simple and Fast API Representations in Ruby.	Ruby	0	0	\N	0	2014-02-10 21:59:28	2014-02-10 22:19:14	2014-02-10 22:15:44
16659660	delayed_job	85	https://github.com/brixen/delayed_job	Database based asynchronous priority queue system -- Extracted from Shopify 	Ruby	0	0	\N	0	2014-02-09 02:17:03	2014-06-30 20:55:44	2014-06-30 21:01:38
16683301	delayed_job_mongoid	85	https://github.com/brixen/delayed_job_mongoid	Mongoid backend for delayed_job	Ruby	0	0	\N	0	2014-02-10 01:29:47	2014-02-10 11:17:53	2014-02-10 01:30:47
21252252	dentaku	85	https://github.com/brixen/dentaku	math and logic formula parser and evaluator	Ruby	0	0	\N	0	2014-06-26 16:28:03	2014-06-26 16:29:26	2014-06-26 16:29:26
52580845	dependencies	85	https://github.com/brixen/dependencies	A file to define environment dependencies for applications	\N	0	0	\N	0	2016-02-26 02:27:25	2016-02-25 22:11:38	2016-02-26 02:28:19
32560661	docs-travis-ci-com	85	https://github.com/brixen/docs-travis-ci-com	The Travis CI Documentation	HTML	0	0	\N	0	2015-03-20 00:36:10	2015-03-20 00:40:40	2015-03-20 00:40:37
9661774	engine	85	https://github.com/brixen/engine	a brand new CMS system with super sexy UI and cool features	Ruby	0	0	\N	0	2013-04-24 23:01:03	2014-06-26 18:53:39	2014-06-26 18:53:38
29274271	Enova-hack-night	85	https://github.com/brixen/Enova-hack-night	Repo for Enova Hack Night exercises and challenges.	JavaScript	0	0	\N	0	2015-01-14 23:13:48	2015-01-14 23:20:43	2015-01-14 23:20:43
97303372	async-file-processing-go	87	https://github.com/tmornini/async-file-processing-go	\N	Go	1	0	\N	4	2017-07-15 05:41:47	2020-03-23 16:52:22	2017-07-15 05:42:17
33423106	bitcoin_reward_era	87	https://github.com/tmornini/bitcoin_reward_era	Calculates and displays table "Projected Bitcoins Long Term" from https://en.bitcoin.it/wiki/Controlled_supply	Ruby	0	0	\N	0	2015-04-04 19:52:53	2015-04-07 13:49:14	2015-04-07 13:49:14
14827500	bitcoin_wealth_distribution	87	https://github.com/tmornini/bitcoin_wealth_distribution	\N	Ruby	0	0	\N	0	2013-11-30 18:04:14	2013-12-06 16:38:34	2013-12-06 16:38:33
71298694	compose	87	https://github.com/tmornini/compose	Define and run multi-container applications with Docker	Python	0	0	\N	0	2016-10-18 21:03:14	2016-10-18 21:03:15	2016-10-27 21:30:42
242216611	go-interface-example	87	https://github.com/tmornini/go-interface-example	\N	Go	0	0	\N	0	2020-02-21 16:36:30	2020-02-21 16:41:36	2020-02-21 16:41:34
70939120	http-spec	87	https://github.com/tmornini/http-spec	HTTP request/response specification Gatlin gun!	Go	3	21	\N	25	2016-10-14 15:59:31	2020-04-30 23:51:25	2019-06-22 21:25:49
41717411	infrastucture	87	https://github.com/tmornini/infrastucture	\N	Ruby	0	0	\N	0	2015-09-01 01:45:51	2016-01-24 00:12:48	2016-08-31 19:21:17
41465797	life	87	https://github.com/tmornini/life	\N	Ruby	0	0	\N	0	2015-08-27 01:33:51	2015-08-27 21:05:27	2015-10-16 22:04:29
50869011	quad-tile-go	87	https://github.com/tmornini/quad-tile-go	A golang package for for ingesting GPS positions and calculating their QuadTile IDs	Go	1	0	\N	10	2016-02-01 18:32:43	2020-10-07 11:17:36	2016-02-08 04:18:16
207719086	rigetti-computing	87	https://github.com/tmornini/rigetti-computing	Go implementation of the Rigetti Classical Computer (RCC)	Go	0	0	\N	0	2019-09-11 00:56:03	2019-09-23 13:56:03	2019-09-23 13:56:01
212796424	snapdocs	87	https://github.com/tmornini/snapdocs	\N	Go	0	0	\N	0	2019-10-04 08:09:36	2019-10-04 08:12:06	2019-10-04 08:12:05
35917484	tic-tac-toe	87	https://github.com/tmornini/tic-tac-toe	Teach my daughter to code	Ruby	0	0	\N	0	2015-05-19 22:06:34	2020-01-06 20:53:43	2015-09-13 01:24:21
252336633	udemy-hangman	87	https://github.com/tmornini/udemy-hangman	Udemy homework assignment	Go	0	0	\N	0	2020-04-01 23:32:22	2020-04-12 18:01:03	2020-04-12 18:01:00
204564986	bountiful-ultimate	88	https://github.com/outerim/bountiful-ultimate	\N	SCSS	0	0	\N	0	2019-08-26 18:30:16	2020-11-08 02:28:39	2020-11-08 02:28:36
151803385	browserless	88	https://github.com/outerim/browserless	Chrome as a service in docker. Bring your own cloud or hardware.	TypeScript	0	0	\N	0	2018-10-06 01:04:44	2019-06-02 13:22:40	2018-10-06 01:18:10
178699641	CGMBLEKit	88	https://github.com/outerim/CGMBLEKit	Make your G5/G6 data truly mobile.	Swift	0	0	\N	0	2019-03-31 11:33:04	2019-03-31 11:33:07	2019-03-31 12:18:09
902461	coffer	88	https://github.com/outerim/coffer	Aspires to be an S3 like storage system with simplified authentication	Ruby	2	0	\N	5	2010-09-10 19:15:20	2013-10-13 03:01:44	2010-10-02 09:56:02
63275485	deadlock_retry	88	https://github.com/outerim/deadlock_retry	This is a thing I hate to admit even existed or that I might have reason to care about	Ruby	0	0	\N	0	2016-07-13 16:59:11	2016-07-13 16:59:45	2016-07-13 16:59:43
178699317	dexcom-share-client-swift	88	https://github.com/outerim/dexcom-share-client-swift	\N	Swift	0	0	\N	0	2019-03-31 11:30:34	2019-03-31 11:30:37	2019-03-31 12:17:19
262631486	docker-compose-buildkite-plugin	88	https://github.com/outerim/docker-compose-buildkite-plugin	🐳⚡️ Run build scripts, and build + push images, w/ Docker Compose	Shell	0	0	\N	0	2020-05-09 15:14:36	2020-05-09 15:16:10	2020-06-17 01:46:00
1548551	fog	88	https://github.com/outerim/fog	The Ruby cloud services library.	Ruby	0	0	\N	1	2011-03-30 19:51:59	2012-12-31 15:14:08	2011-03-30 20:51:21
178699957	G4ShareSpy	88	https://github.com/outerim/G4ShareSpy	iOS framework to read Dexcom G4 Share data over BLE.	Swift	0	0	\N	0	2019-03-31 11:35:28	2019-03-31 11:35:30	2019-03-31 12:18:47
2442135	ghost	88	https://github.com/outerim/ghost	A gem that allows you to create, list, and modify hostnames with ease...	Ruby	1	0	\N	1	2011-09-23 02:20:13	2013-08-07 01:47:11	2011-09-23 11:15:54
1651670	goliath	88	https://github.com/outerim/goliath	Goliath is a non-blocking Ruby web server framework	Ruby	0	0	\N	2	2011-04-22 19:11:09	2016-09-22 00:10:16	2011-04-21 21:42:11
1452393	homebrew	88	https://github.com/outerim/homebrew	The missing package manager for OS X.	Ruby	0	0	\N	1	2011-03-07 20:05:27	2013-12-13 23:23:27	2011-03-08 03:13:41
178643487	Loop	88	https://github.com/outerim/Loop	An automated insulin delivery app template for iOS, built on LoopKit	Swift	0	0	\N	2	2019-03-31 01:45:11	2021-01-22 02:46:40	2019-03-31 13:29:32
178704553	LoopKit	88	https://github.com/outerim/LoopKit	A set of iOS tools for building closed-loop insulin delivery apps	Swift	0	0	\N	0	2019-03-31 12:12:42	2019-03-31 12:12:45	2019-05-28 10:57:50
85854141	maxminddb	88	https://github.com/outerim/maxminddb	Pure Ruby GeoIP2 MaxMind DB reader.	Ruby	0	0	\N	0	2017-03-22 13:59:06	2017-03-22 13:59:08	2017-01-10 23:22:23
76418391	neveragaindottech.github.io	88	https://github.com/outerim/neveragaindottech.github.io	Source files for the neveragain.tech site	HTML	0	0	\N	0	2016-12-14 00:46:31	2016-12-14 00:46:32	2016-12-14 00:49:34
157792288	oak-hills-musical	88	https://github.com/outerim/oak-hills-musical	\N	Ruby	0	0	\N	0	2018-11-15 22:56:27	2020-02-21 00:05:31	2020-02-21 00:05:29
4471263	rack-jsonp	88	https://github.com/outerim/rack-jsonp	A Rack middleware for providing JSON-P support	Ruby	0	0	\N	1	2012-05-28 11:24:40	2013-01-09 07:38:29	2011-10-19 07:53:24
178700301	rileylink_ios	88	https://github.com/outerim/rileylink_ios	RileyLink iOS App, RileyLink Frameworks, and MinimedKit decoding Framework	Swift	0	0	\N	0	2019-03-31 11:38:17	2019-03-31 11:38:20	2019-03-31 12:19:22
912950	ripple	88	https://github.com/outerim/ripple	A rich Ruby client for Riak, Basho's distributed database	Ruby	0	0	\N	1	2010-09-15 13:25:44	2016-10-06 14:15:50	2010-09-25 23:23:32
1453491	stunnel	88	https://github.com/outerim/stunnel	Stunnel with X-Forwarded-Proto patch	C	0	0	\N	1	2011-03-08 02:55:45	2012-12-25 06:22:57	2011-03-08 03:08:02
6234854	travis_reprise	88	https://github.com/outerim/travis_reprise	A stupid gem to trigger travis. Use RESPONSIBLY.	Ruby	1	0	\N	1	2012-10-15 18:43:50	2013-10-19 15:01:36	2012-10-23 17:02:09
259964861	april_liveview	89	https://github.com/daksis/april_liveview	groxio april liveview course	JavaScript	0	0	\N	0	2020-04-29 12:27:56	2020-05-01 18:25:07	2020-05-01 18:25:04
143532483	dev-setup	89	https://github.com/daksis/dev-setup	Mac OS X development environment setup:  Easy-to-understand instructions with automated setup scripts for developer tools like Vim, Sublime Text, Bash, iTerm, Python data analysis, Spark, Hadoop MapReduce, AWS, Heroku, JavaScript web development, Android development, common data stores, and dev-based OS X defaults.	Python	0	0	\N	0	2018-08-04 10:46:56	2019-07-16 05:11:49	2018-06-30 18:32:46
117143415	prelude	89	https://github.com/daksis/prelude	Prelude is an enhanced Emacs 24.4+ distribution that should make your experience with Emacs both more pleasant and more powerful.	Emacs Lisp	0	0	\N	0	2018-01-11 17:25:59	2019-07-16 05:11:49	2018-01-07 08:02:46
151315604	trade-finance-logistics	89	https://github.com/daksis/trade-finance-logistics	Trade Finance and Logistics based on Letter of Credit and Proof of Shipment	JavaScript	0	0	\N	0	2018-10-02 17:02:47	2019-07-16 05:11:49	2018-09-19 09:39:22
21145471	turing-blog	89	https://github.com/daksis/turing-blog	Blog for the Turing School of Software and Design	CSS	23	0	\N	0	2014-06-23 20:13:39	2019-07-16 05:11:49	2014-06-23 20:28:34
46616443	acts	90	https://github.com/sr/acts	Another Calendar-based Tarsnap Script	Shell	0	0	\N	0	2015-11-21 11:30:25	2015-11-21 11:30:26	2015-12-16 02:07:33
1097803	agent-plugins	90	https://github.com/sr/agent-plugins	A collection of custom plugins for the Cloudkick agent	Python	0	0	\N	2	2010-11-20 15:11:05	2014-05-01 12:54:05	2010-11-29 09:13:58
47366431	ansible-go	90	https://github.com/sr/ansible-go	Ansible role that installs Go (http://golang.org/). The latest stable release that has been compiled for x86 64-bit Linux systems is installed by default, and different platforms and versions are supported by modifying the role variables.	Shell	0	0	\N	0	2015-12-03 21:02:44	2015-12-03 21:02:45	2015-12-03 21:03:23
47369258	ansible-playbook-dev	90	https://github.com/sr/ansible-playbook-dev	ansible playbook I use for my remote development and auxiliary machine	Shell	0	0	\N	1	2015-12-03 22:15:02	2018-10-04 05:51:48	2016-02-24 05:17:47
48228165	ansible-role-buildkite-agent	90	https://github.com/sr/ansible-role-buildkite-agent	Install the Buildkite.com agent on Ubuntu	Shell	0	0	\N	0	2015-12-18 08:04:31	2018-12-27 21:54:16	2015-12-18 08:15:50
47275424	ansible-role-cbk	90	https://github.com/sr/ansible-role-cbk	\N	Shell	0	0	\N	0	2015-12-02 15:01:21	2018-12-27 21:53:44	2016-01-21 12:27:48
360	ape	90	https://github.com/sr/ape	The Atom Protocol Exerciser	Ruby	0	1	\N	8	2008-02-09 11:46:14	2020-09-29 12:57:13	2008-06-03 15:19:26
337707	aperorb-paris	90	https://github.com/sr/aperorb-paris	\N	Ruby	1	0	\N	2	2009-10-14 19:18:13	2014-05-01 12:56:31	2009-10-15 14:39:36
70547	atom	90	https://github.com/sr/atom	Ruby library for working with the Atom 1.0 syndication format	\N	0	0	\N	3	2008-11-01 21:11:19	2020-09-29 12:56:10	2008-11-01 21:11:59
70357	atom-test	90	https://github.com/sr/atom-test	Atom syndication format test suite for Ruby. 	Ruby	0	0	\N	4	2008-11-01 04:18:43	2020-09-29 12:56:19	2008-11-01 19:53:19
17680	atom-tools	90	https://github.com/sr/atom-tools	mirror of the darcs repository (ruby lib for atom/atompub)	Ruby	7	1	\N	10	2008-05-17 20:22:03	2020-09-29 12:56:55	2008-06-23 13:09:21
95576	beadmin	90	https://github.com/sr/beadmin	Python scripts hacked together to manage bearnaise.net	Python	1	0	\N	4	2008-12-22 22:35:10	2020-09-29 12:55:33	2008-12-22 23:55:29
215987	bob	90	https://github.com/sr/bob	Bob the Builder will build your codes	Ruby	1	0	\N	3	2009-06-01 20:06:49	2018-01-11 10:13:43	2009-09-30 10:16:35
215845	bob-test	90	https://github.com/sr/bob-test	Test helpers for Bob's family	Ruby	1	0	\N	3	2009-06-01 17:31:11	2020-09-29 12:54:22	2009-06-01 19:33:27
194084	bobette	90	https://github.com/sr/bobette	Bob's sister	Ruby	1	0	\N	2	2009-05-06 13:22:19	2020-09-29 12:53:39	2009-12-09 06:59:27
259681	bundler	90	https://github.com/sr/bundler	\N	Ruby	1	0	\N	2	2009-07-24 13:20:35	2014-05-01 12:57:05	2009-07-24 13:28:45
46228879	cbk	90	https://github.com/sr/cbk	Backup personnal data hosted on third party services	Shell	0	0	\N	4	2015-11-15 15:53:11	2018-06-24 07:30:06	2015-12-03 11:02:46
242522284	cert-manager-webhook-dnsimple	90	https://github.com/sr/cert-manager-webhook-dnsimple	DNSimple provider for cert-manager	Go	0	1	\N	1	2020-02-23 10:30:09	2020-03-28 18:00:18	2020-02-23 10:30:18
525728	chef-deploy	90	https://github.com/sr/chef-deploy	Chef Resources and Providers for deploying ruby web apps without capistrano	Ruby	1	0	\N	2	2010-02-19 07:19:43	2014-05-01 12:55:22	2010-02-19 19:15:15
569622	cijoe	90	https://github.com/sr/cijoe	CI Joe is a fun Continuous Integration server.	Ruby	1	0	\N	2	2010-03-19 06:58:15	2014-05-01 12:54:59	2010-02-28 14:42:27
738151	Connect	90	https://github.com/sr/Connect	Connect is a middleware layer for Node.js	JavaScript	1	0	\N	2	2010-06-24 15:44:00	2014-05-01 12:54:21	2010-06-24 16:06:32
747337	connect-basic-auth	90	https://github.com/sr/connect-basic-auth	basic auth middleware for Connect	JavaScript	3	2	\N	6	2010-06-29 15:59:04	2020-09-29 12:51:55	2010-07-03 21:03:37
169407	couchdb-mail	90	https://github.com/sr/couchdb-mail	Playing around with CouchDB and Email	\N	0	0	\N	5	2009-04-06 12:17:03	2020-09-29 12:54:55	2009-04-06 12:18:12
47583	couchy	90	https://github.com/sr/couchy	Simple, no-frills Ruby library around CouchDB's RESTful API	Ruby	0	0	\N	6	2008-08-30 09:42:30	2019-08-13 10:33:35	2008-11-23 17:51:38
380593	develop.github.com	90	https://github.com/sr/develop.github.com	API Documentation for GitHub	JavaScript	1	0	\N	2	2009-11-21 13:04:02	2015-02-16 07:18:33	2009-09-23 16:54:26
382670	dm-more	90	https://github.com/sr/dm-more	Extras for DataMapper, including bridges to DataObjects::Migrations and Merb::DataMapper	Ruby	1	0	\N	1	2009-11-23 14:04:29	2012-12-13 12:26:46	2009-11-23 03:22:42
252078	dm-redis-adapter	90	https://github.com/sr/dm-redis-adapter	A DataMapper adapter for redis	Ruby	1	0	\N	3	2009-07-15 15:26:34	2014-05-01 12:57:16	2009-07-19 09:59:29
47793972	docs	90	https://github.com/sr/docs	The source files for the Buildkite documentation	HTML	0	0	\N	0	2015-12-10 21:41:03	2015-12-10 21:41:04	2015-12-12 00:27:00
190	dst	90	https://github.com/sr/dst	todo-list manager I wrote back in 2008 with the help of Gregory Brown in order to learn Ruby and TDD	Ruby	2	1	\N	7	2008-01-31 15:55:46	2019-08-13 10:21:20	2018-10-02 21:51:53
629	dumbapp	90	https://github.com/sr/dumbapp	DumbApp is a simple AtomPub (RFC 5023) implementation based on Mongrel and ActiveRecord.	Ruby	1	0	\N	7	2008-02-16 14:41:38	2020-09-29 12:57:05	2008-06-18 18:04:13
439166	cramp	91	https://github.com/lifo/cramp	Real-time web application framework in Ruby	JavaScript	132	14	\N	1521	2009-12-16 10:59:59	2021-01-13 16:27:41	2015-01-15 12:37:49
2187583	cramp-pub-sub-chat-demo	91	https://github.com/lifo/cramp-pub-sub-chat-demo	Cramp + Redis Pub/Sub + WebSockets	Ruby	19	2	\N	95	2011-08-10 17:52:55	2020-11-08 10:35:41	2011-09-10 19:49:24
2194534	cramp_chat_demo	91	https://github.com/lifo/cramp_chat_demo	Bare bone chat demo using @lifo's Cramp	JavaScript	0	0	\N	2	2011-08-11 21:11:57	2013-01-03 23:15:03	2011-08-11 21:13:27
2205468	enlighten-websockets	91	https://github.com/lifo/enlighten-websockets	Cramp + WebSockets for enlighten	Ruby	0	0	\N	3	2011-08-14 10:53:17	2019-07-13 18:19:57	2011-08-14 10:54:55
320947	fast_context	91	https://github.com/lifo/fast_context	Make your shoulda contexts faster	Ruby	22	1	\N	60	2009-09-29 08:15:22	2020-09-15 04:08:39	2017-12-05 14:56:31
5418474	journey	91	https://github.com/lifo/journey	A router for rails	Ruby	0	0	\N	0	2012-08-14 17:53:08	2013-01-11 16:48:35	2012-09-06 12:59:40
5594037	journey_demo	91	https://github.com/lifo/journey_demo	Nothing to see here	Ruby	1	1	\N	1	2012-08-28 21:45:09	2013-10-26 19:01:36	2012-09-06 13:03:27
121035	lifo.github.com	91	https://github.com/lifo/lifo.github.com	Mod Porter	\N	0	0	\N	4	2009-02-03 19:57:39	2019-08-13 10:58:17	2009-08-03 01:44:47
1085374	misfit_client	91	https://github.com/lifo/misfit_client	\N	Ruby	0	0	\N	2	2010-11-16 12:49:45	2013-09-30 10:01:25	2010-11-17 23:44:05
166263869	rails	91	https://github.com/lifo/rails	Ruby on Rails	Ruby	0	0	\N	0	2019-01-17 15:04:27	2019-02-06 23:20:23	2019-02-06 23:20:20
2363181	sidekick	91	https://github.com/lifo/sidekick	Nothing to see here	Ruby	0	0	\N	3	2011-09-10 20:21:22	2014-04-23 18:00:22	2011-09-15 10:01:38
2311135	snoop	91	https://github.com/lifo/snoop	Cramp + WebSockets + IRC	Ruby	0	0	\N	4	2011-09-01 21:30:58	2014-03-07 20:21:16	2011-09-01 21:32:45
6943560	testing	91	https://github.com/lifo/testing	Testing	\N	0	0	\N	0	2012-11-30 16:21:33	2014-04-25 16:28:59	2012-11-30 16:21:35
251382	tickle	91	https://github.com/lifo/tickle	Run your tests in parallel processes	Ruby	5	3	\N	110	2009-07-14 21:09:33	2021-01-13 16:26:39	2009-11-17 20:25:06
780871	tramp	91	https://github.com/lifo/tramp	Asynchronous ORM layer	Ruby	2	1	\N	27	2010-07-17 17:31:28	2019-08-13 11:35:03	2011-02-15 01:11:05
2205644	Websocket-Bomberman	91	https://github.com/lifo/Websocket-Bomberman	A multiplayer websocket based bomberman clone	Ruby	0	0	\N	1	2011-08-14 11:58:18	2013-01-03 23:31:02	2010-09-30 11:33:23
118186537	ActionCableTest	92	https://github.com/rsl/ActionCableTest	\N	Ruby	0	0	\N	0	2018-01-19 20:37:52	2018-01-19 20:38:09	2018-01-19 20:38:08
12166434	active_merchant	92	https://github.com/rsl/active_merchant	This is a fork for personal[ish] use. You probably want to use the official repo.	Ruby	0	0	\N	0	2013-08-16 16:29:33	2015-06-22 14:55:30	2013-08-16 16:30:32
120776412	acts-as-taggable-on	92	https://github.com/rsl/acts-as-taggable-on	A tagging plugin for Rails applications that allows for custom tagging along dynamic contexts.	Ruby	0	0	\N	0	2018-02-08 13:04:50	2018-02-08 13:04:53	2018-06-14 18:13:07
7205	acts_as_snook	92	https://github.com/rsl/acts_as_snook	A comment spam solution that doesn't rely on CAPTCHAs, Javascript, or external web services. In other words, a comment spam solution that doesn't suck!	Ruby	8	0	\N	106	2008-04-05 16:38:46	2021-01-13 16:25:24	2009-06-23 11:48:15
19588936	authlogic	92	https://github.com/rsl/authlogic	A simple model based ruby authentication solution.	Ruby	0	0	\N	0	2014-05-08 18:07:39	2014-05-08 18:10:19	2014-05-08 18:10:19
9887334	board_of_review	92	https://github.com/rsl/board_of_review	Comment spam detection and marking system	\N	0	0	\N	0	2013-05-06 10:26:14	2013-12-07 08:44:11	2013-05-06 10:28:07
9887338	bored_of_review	92	https://github.com/rsl/bored_of_review	Comment spam detection and marking system	\N	0	0	\N	0	2013-05-06 10:26:33	2013-10-04 09:20:40	2013-05-06 10:29:59
83081507	capistrano3-delayed-job	92	https://github.com/rsl/capistrano3-delayed-job	\N	Ruby	0	0	\N	0	2017-02-24 17:50:01	2017-02-24 17:50:03	2016-04-28 13:28:42
11844357	catchall	92	https://github.com/rsl/catchall	A catchall site for my Nginx configuration	\N	0	0	\N	0	2013-08-02 10:50:02	2014-06-02 10:19:43	2014-06-02 10:19:45
117872792	closure_tree	92	https://github.com/rsl/closure_tree	Easily and efficiently make your ActiveRecord models support hierarchies	Ruby	0	0	\N	0	2018-01-17 15:59:56	2018-01-17 15:59:58	2018-01-17 16:50:57
94366280	devise	92	https://github.com/rsl/devise	Flexible authentication solution for Rails with Warden.	Ruby	0	0	\N	0	2017-06-14 16:32:51	2020-01-11 10:32:25	2017-06-13 16:51:21
64395714	devise_saml_authenticatable	92	https://github.com/rsl/devise_saml_authenticatable	Devise SAML 2.0 authentication strategy	Ruby	0	0	\N	0	2016-07-28 09:58:14	2016-07-28 09:58:15	2016-07-28 10:37:07
5261716	dotfiles	92	https://github.com/rsl/dotfiles	My dotfiles	Shell	0	0	\N	2	2012-08-01 13:31:23	2019-05-31 16:39:14	2019-05-31 16:39:12
11828791	errbit	92	https://github.com/rsl/errbit	The open source error catcher that's Airbrake API compliant	Ruby	0	0	\N	0	2013-08-01 19:04:04	2014-06-02 10:46:39	2014-06-02 10:46:40
92531554	font-awesome-sass	92	https://github.com/rsl/font-awesome-sass	Font-Awesome Sass gem for use in Ruby/Rails projects	CSS	1	0	\N	0	2017-05-26 14:01:17	2017-05-26 14:01:19	2017-05-26 14:03:19
19123983	git-bump	92	https://github.com/rsl/git-bump	Create Git release commits and tags with changelogs	Ruby	0	0	\N	0	2014-04-24 18:01:59	2014-04-24 18:03:29	2014-04-24 18:02:52
2558805	is_gay	92	https://github.com/rsl/is_gay	This space left intentionally blank.	\N	0	0	\N	3	2011-10-11 19:36:49	2018-01-27 18:09:08	2011-10-11 19:39:22
75097846	it	92	https://github.com/rsl/it	A helper for links and other html tags in your translations	Ruby	0	0	\N	0	2016-11-29 14:02:52	2016-11-29 14:02:54	2017-06-02 10:13:59
173376095	linters	92	https://github.com/rsl/linters	RSL's Linter Configurations	\N	0	0	\N	0	2019-03-01 19:26:02	2019-03-03 16:22:55	2019-03-03 16:22:54
20227660	mollusque	92	https://github.com/rsl/mollusque	\N	Ruby	0	0	\N	0	2014-05-27 13:53:30	2014-06-06 13:02:28	2014-06-06 13:02:28
120017706	new_sanctuary_asylum	92	https://github.com/rsl/new_sanctuary_asylum	\N	Ruby	0	0	\N	0	2018-02-02 16:42:40	2020-09-16 19:50:07	2020-09-19 19:23:56
66156144	nomanssky	92	https://github.com/rsl/nomanssky	\N	Ruby	0	0	\N	0	2016-08-20 13:16:48	2016-08-20 13:17:36	2016-08-20 13:18:53
11314254	paper_trail	92	https://github.com/rsl/paper_trail	Track changes to your models' data.  Good for auditing or versioning.	Ruby	0	0	\N	0	2013-07-10 11:30:10	2018-05-08 12:04:37	2013-07-10 11:37:35
105304295	pivotal-tracker-alfred-workflow	92	https://github.com/rsl/pivotal-tracker-alfred-workflow	A workflow for Alfred v2 (alfredapp.com) to add Pivotal Tracker stories directly.	\N	0	0	\N	0	2017-09-29 15:23:51	2016-11-25 20:56:27	2016-11-27 19:46:08
5682	proxy_attributes	92	https://github.com/rsl/proxy_attributes	ProxyAttributes is designed to "skinny-up" your controller code by moving the creation and management of child associations to the parent object. It also has the side benefit of making it easier to use your association proxies directly within a form_for form.	Ruby	0	1	\N	11	2008-03-28 09:19:35	2019-08-13 10:22:21	2009-01-29 15:18:22
22616250	rails	92	https://github.com/rsl/rails	Ruby on Rails	\N	0	0	\N	0	2014-08-04 16:02:40	2014-08-04 13:15:24	2014-08-04 14:22:26
10821179	responders	92	https://github.com/rsl/responders	A set of Rails responders to dry up your application	Ruby	0	0	\N	0	2013-06-20 11:09:26	2020-01-11 10:29:40	2013-06-20 11:31:22
109032713	roadie	92	https://github.com/rsl/roadie	Making HTML emails comfortable for the Ruby rockstars	Ruby	0	0	\N	0	2017-10-31 15:52:03	2017-10-31 15:52:05	2017-08-16 03:16:06
104905	rsl.github.com	92	https://github.com/rsl/rsl.github.com	Nathaniel likes to dance (even if I do not).	\N	0	0	\N	2	2009-01-10 20:28:29	2019-08-13 10:52:48	2009-01-10 20:32:01
173366384	rtist	92	https://github.com/rsl/rtist	Enhancements on RMagick for artistic purposes	Ruby	0	0	\N	0	2019-03-01 17:50:41	2019-04-16 12:29:54	2019-04-16 12:29:52
329452961	babelwrongpath	93	https://github.com/imownbey/babelwrongpath	\N	Java	0	0	\N	0	2021-01-13 20:03:51	2021-01-13 20:05:48	2021-01-13 20:05:37
114173817	bitcoin-ruby	93	https://github.com/imownbey/bitcoin-ruby	bitcoin utils and protocol in ruby.	Ruby	0	0	\N	0	2017-12-13 20:05:47	2017-12-13 20:05:49	2017-11-21 18:42:09
75883	blawgz	93	https://github.com/imownbey/blawgz	A blog which generates HTML and then uploads it via SCP	\N	0	0	\N	2	2008-11-14 04:51:03	2019-08-13 10:42:38	2008-11-17 05:06:11
14626417	brooklynjs.github.io	93	https://github.com/imownbey/brooklynjs.github.io	The world's most popular programming language, in New York's most popular borough	JavaScript	0	0	\N	0	2013-11-22 16:49:25	2013-11-29 11:45:49	2013-11-22 16:55:09
601695	cascal	93	https://github.com/imownbey/cascal	a high-level scala based cassandra library	Scala	1	0	\N	1	2010-04-08 21:25:16	2012-12-14 01:38:44	2010-04-08 21:39:50
156894321	CBDatabase	93	https://github.com/imownbey/CBDatabase	\N	Swift	2	0	\N	0	2018-11-09 15:17:26	2019-01-03 18:54:12	2019-01-04 16:48:59
208880440	cocoapods-fix-react-native	93	https://github.com/imownbey/cocoapods-fix-react-native	A CocoaPods plugin for hot-patching React Native per-version	Ruby	0	0	\N	0	2019-09-16 16:25:30	2019-09-16 16:27:27	2019-09-16 16:27:24
34476898	color	93	https://github.com/imownbey/color	A collection of categories and utilities that extend UIColor	Objective-C	1	1	\N	0	2015-04-23 16:26:24	2015-04-23 16:26:24	2017-09-26 21:18:45
176800251	danger-ruby-swiftlint	93	https://github.com/imownbey/danger-ruby-swiftlint	A Danger plugin for SwiftLint.	Ruby	0	0	\N	0	2019-03-20 16:07:58	2019-03-20 16:57:35	2019-03-20 16:57:33
14995287	davidblane	93	https://github.com/imownbey/davidblane	\N	Ruby	0	0	\N	0	2013-12-06 20:39:42	2013-12-06 21:02:40	2013-12-06 21:02:38
4486791	ddttt	93	https://github.com/imownbey/ddttt	\N	Ruby	2	0	\N	6	2012-05-29 16:51:54	2016-01-07 06:33:17	2012-08-17 18:22:27
285039484	DefinitelyTyped	93	https://github.com/imownbey/DefinitelyTyped	The repository for high quality TypeScript type definitions.	\N	0	0	\N	0	2020-08-04 13:37:43	2020-08-04 13:37:46	2020-08-04 13:36:34
297790512	Detox	93	https://github.com/imownbey/Detox	Gray box end-to-end testing and automation framework for mobile apps	JavaScript	0	0	\N	0	2020-09-22 19:47:09	2020-09-22 20:30:44	2020-09-22 20:30:39
12145	docbox	93	https://github.com/imownbey/docbox	Wiki interface allowing people to contribute to the documentation of a project	Ruby	4	0	\N	53	2008-04-23 20:40:18	2019-08-13 10:23:31	2008-11-08 12:21:08
72557	docbox-sample-app	93	https://github.com/imownbey/docbox-sample-app	Sample App for Docbox	Ruby	0	0	\N	2	2008-11-06 20:07:50	2019-08-13 10:41:15	2008-11-07 14:57:25
6445549	dotfiles	93	https://github.com/imownbey/dotfiles	scared of losing my vimrc... now its in the cloud!	VimL	0	0	\N	0	2012-10-29 16:35:01	2013-01-12 19:25:55	2012-10-28 20:38:20
209631738	DrawerKit	93	https://github.com/imownbey/DrawerKit	DrawerKit lets an UIViewController modally present another UIViewController in a manner similar to the way Apple's Maps app works.	\N	0	0	\N	0	2019-09-19 16:20:06	2019-09-19 16:20:07	2019-09-19 16:28:10
353067	dygraphs	93	https://github.com/imownbey/dygraphs	Dygraphs with some extra loving	JavaScript	1	0	\N	1	2009-10-28 16:21:20	2019-01-08 07:43:23	2009-11-12 19:29:57
40560477	EZAudio	93	https://github.com/imownbey/EZAudio	An iOS and OSX audio visualization framework built upon Core Audio useful for anyone doing real-time, low-latency audio processing and visualizations.	Objective-C	1	1	\N	0	2015-08-11 16:16:48	2015-10-27 16:23:17	2017-09-26 21:18:51
17525973	Foursquare-API-v2	93	https://github.com/imownbey/Foursquare-API-v2	Foursquare API v2 For iOS and MacOS	Objective-C	2	1	\N	0	2014-03-07 17:13:06	2014-05-03 15:44:46	2017-09-26 21:18:54
78989	gist-vim	93	https://github.com/imownbey/gist-vim	vimscript for gist	VimL	0	0	\N	2	2008-11-21 04:29:03	2019-08-13 10:43:40	2008-11-17 23:24:58
224798	haml	93	https://github.com/imownbey/haml	HTML Abstraction Markup Language - A Markup Haiku	Ruby	1	0	\N	1	2009-06-11 17:47:39	2012-12-12 20:44:45	2009-06-11 19:34:37
12712661	httpclient	93	https://github.com/imownbey/httpclient	\N	CoffeeScript	0	0	\N	0	2013-09-09 18:00:48	2014-01-07 02:50:08	2013-09-10 16:02:16
75633	inspires	93	https://github.com/imownbey/inspires	Inspires blog	\N	0	0	\N	2	2008-11-13 22:35:54	2019-08-13 10:42:26	\N
98716	iownbey.github.com	93	https://github.com/imownbey/iownbey.github.com	Inspir.es	\N	0	0	\N	2	2008-12-30 22:22:33	2019-08-13 10:50:45	2008-12-30 22:22:55
556	jim	93	https://github.com/imownbey/jim	An irc bot written in io. To learn and stuff	Io	3	0	\N	14	2008-02-15 01:35:50	2019-08-13 10:21:25	2008-03-26 16:14:54
15028183	kittiebot	93	https://github.com/imownbey/kittiebot	Mood jewelry via Arduino	JavaScript	0	0	\N	0	2013-12-08 15:46:10	2013-12-08 16:03:15	2013-12-08 16:03:11
72235011	kylejson.com	93	https://github.com/imownbey/kylejson.com	My portfolio website	JavaScript	0	0	\N	0	2016-10-28 17:11:35	2020-08-19 17:45:20	2015-08-23 19:42:54
40932643	LTPhoneNumberField	93	https://github.com/imownbey/LTPhoneNumberField	\N	Objective-C	0	0	\N	0	2015-08-17 19:09:09	2015-08-17 19:09:10	2014-08-02 21:26:36
152629086	mergetest	93	https://github.com/imownbey/mergetest	\N	\N	0	0	\N	0	2018-10-11 14:21:00	2018-10-11 14:25:32	2018-10-12 16:10:41
2731282	acts-as-taggable-on	94	https://github.com/dylanegan/acts-as-taggable-on	A tagging plugin for Rails applications that allows for custom tagging along dynamic contexts.  This is my own version, with a few modifications: Dropped support for Rails < 3.0; Moving towards a devise-style inclusion model for more easily extendable Tags and Taggings	Ruby	0	0	\N	1	2011-11-08 01:21:01	2013-01-04 12:28:37	2011-11-08 01:24:59
330250	amqp-rabbitmq-article	94	https://github.com/dylanegan/amqp-rabbitmq-article	The examples from http://www.infoq.com/articles/AMQP-RabbitMQ	Ruby	1	0	\N	8	2009-10-07 18:06:25	2019-08-13 11:28:30	2009-10-08 06:30:50
4725894	animated	94	https://github.com/dylanegan/animated	\N	\N	1	1	\N	5	2012-06-20 09:20:13	2021-01-13 16:34:46	2013-01-25 07:19:16
26111433	ansible-buildbox	94	https://github.com/dylanegan/ansible-buildbox	This is an ansible role for the buildbox agent.	\N	0	0	\N	0	2014-11-03 07:14:03	2014-08-07 19:51:09	2014-11-04 13:22:31
265329	at-the-movies	94	https://github.com/dylanegan/at-the-movies	Pulling that shit in yo!	Ruby	0	0	\N	1	2009-07-30 23:13:36	2014-02-26 15:50:28	2010-03-18 03:20:33
311862563	azure-docs	94	https://github.com/dylanegan/azure-docs	Open source documentation of Microsoft Azure	\N	0	0	\N	0	2020-11-11 01:28:58	2020-11-11 01:29:02	2020-11-11 01:05:19
4483336	candidate	94	https://github.com/dylanegan/candidate	Manifesto API client.	Ruby	1	0	\N	2	2012-05-29 11:46:15	2013-11-26 17:27:17	2012-06-04 10:28:10
11877843	cards	94	https://github.com/dylanegan/cards	A collection of card game rules.	\N	0	0	\N	0	2013-08-04 08:47:11	2013-12-21 14:02:18	2013-08-04 09:24:53
272842	configarrr	94	https://github.com/dylanegan/configarrr	Just like a pirate would!	Ruby	0	0	\N	1	2009-08-08 21:07:43	2012-12-12 22:08:30	2009-10-12 19:50:39
1157324	CouchPotato	94	https://github.com/dylanegan/CouchPotato	Automatic Movie Downloading via NZBs & Torrents	Python	0	0	\N	1	2010-12-10 19:30:45	2016-02-10 14:07:41	2011-01-04 01:00:49
4870591	dadame	94	https://github.com/dylanegan/dadame	Locate Dada Falafel and provide directions.	Ruby	0	1	\N	1	2012-07-03 06:57:39	2014-05-31 05:28:20	2012-07-03 08:02:53
2662180	dnsimple-ruby	94	https://github.com/dylanegan/dnsimple-ruby	A Ruby wrapper for the DNSimple API	Ruby	0	0	\N	1	2011-10-27 22:14:25	2016-07-14 04:27:06	2012-12-26 11:24:52
52657133	dnsimple-services	94	https://github.com/dylanegan/dnsimple-services	One-click service configurations for DNSimple	Ruby	0	0	\N	0	2016-02-27 05:17:53	2016-02-27 05:17:54	2016-02-18 14:53:03
95792589	ex_clearbit	94	https://github.com/dylanegan/ex_clearbit	A lightweight API wrapper for Clearbit	Elixir	0	1	\N	0	2017-06-29 12:36:24	2017-06-29 12:36:26	2017-06-30 16:21:17
557097	faqueue	94	https://github.com/dylanegan/faqueue	Mocktacular Companion to AMQP Library. Happy TATFTing!	Ruby	1	0	\N	1	2010-03-11 02:44:29	2012-12-14 00:13:55	2010-03-11 03:18:06
1926212	fog	94	https://github.com/dylanegan/fog	The Ruby cloud services library.	Ruby	0	0	\N	1	2011-06-20 19:09:14	2013-01-03 16:03:15	2012-07-04 12:34:09
27129522	foreman	94	https://github.com/dylanegan/foreman	Manage Procfile-based applications	Ruby	0	0	\N	0	2014-11-25 12:30:11	2014-11-25 12:30:11	2014-11-25 12:34:00
1617185	fraggle-block	94	https://github.com/dylanegan/fraggle-block	A synchronous Ruby client for Doozer.	Ruby	5	0	\N	10	2011-04-14 23:08:22	2019-07-15 18:14:33	2012-04-10 18:31:56
906351	geonames.js	94	https://github.com/dylanegan/geonames.js	Stalking you in many different ways.	JavaScript	0	0	\N	1	2010-09-13 01:09:32	2012-12-15 02:12:56	2011-11-07 03:26:21
1614993	gollum	94	https://github.com/dylanegan/gollum	A simple, Git-powered wiki with a sweet API and local frontend.	JavaScript	0	0	\N	2	2011-04-14 13:28:30	2013-01-01 19:39:23	2011-04-10 14:23:55
904605	google-weather	94	https://github.com/dylanegan/google-weather	stupid simple fetching of the weather using google's api	Ruby	1	0	\N	3	2010-09-12 01:50:11	2012-12-15 02:09:30	2010-09-12 02:13:10
247775	hellanzb	94	https://github.com/dylanegan/hellanzb	XMLRPC API all wrapped up	Ruby	1	0	\N	2	2009-07-10 03:04:01	2013-10-07 01:08:35	2009-10-04 08:17:38
6815310	howmanydylans	94	https://github.com/dylanegan/howmanydylans	How Many Dylans?	Ruby	0	3	\N	1	2012-11-22 13:41:12	2014-03-31 18:58:59	2014-03-31 18:58:59
1501745	htmlip	94	https://github.com/dylanegan/htmlip	FUCKING POINTLESS!	\N	0	0	\N	1	2011-03-19 21:39:26	2013-10-25 00:36:28	2011-03-19 21:43:05
4091808	hubot-scripts	94	https://github.com/dylanegan/hubot-scripts	optional scripts for hubot, opt in via hubot-scripts.json	CoffeeScript	0	0	\N	1	2012-04-20 19:13:49	2013-01-08 18:19:58	2012-06-21 14:05:42
906339	isitciderweather.js	94	https://github.com/dylanegan/isitciderweather.js	Client side version of isitciderweather.	JavaScript	6	4	\N	3	2010-09-13 00:58:08	2016-11-17 13:26:16	2019-05-20 21:48:47
7872402	just-the-tip	94	https://github.com/dylanegan/just-the-tip	A collection of random tips.	\N	0	0	\N	0	2013-01-28 13:27:09	2014-02-26 23:45:54	2013-02-05 08:41:05
6968552	lincoln-s-birthday	94	https://github.com/dylanegan/lincoln-s-birthday	Lincoln's Birthday	\N	0	0	\N	0	2012-12-02 13:15:20	2014-02-25 10:04:01	2012-12-02 13:59:01
4449647	manifesto	94	https://github.com/dylanegan/manifesto	S3 backed manifests.	Ruby	2	4	\N	2	2012-05-25 17:06:29	2014-04-15 22:36:52	2013-02-08 05:48:35
9887058	merman	94	https://github.com/dylanegan/merman	\N	CoffeeScript	0	0	\N	0	2013-05-06 10:12:26	2014-02-24 06:56:07	2013-05-06 10:33:48
159733	acte-math	95	https://github.com/jm/acte-math	A math trivia game built by middle school students I've been tutoring in Ruby.  App was built in 3 weeks, learning Ruby and Sinatra from the ground up.	Ruby	2	1	\N	5	2009-03-26 01:27:37	2019-08-13 11:12:23	2017-02-05 02:59:26
160462	acte-trivia	95	https://github.com/jm/acte-trivia	Another application from the kids I've been tutoring in Ruby (this time a group led/mentored by @pjdavis).  A simple trivia game.	Ruby	1	0	\N	5	2009-03-26 19:23:01	2019-08-13 11:12:38	2009-03-26 19:23:37
19914269	activejob	95	https://github.com/jm/activejob	Declare job classes that can be run by a variety of queueing backends	Ruby	0	0	\N	0	2014-05-18 12:51:14	2014-05-18 12:51:14	2014-05-18 09:10:15
553592	acts_as_good_speeler	95	https://github.com/jm/acts_as_good_speeler	Plugin to fix some of the weird/wrong pluralizations in Rails	Ruby	1	0	\N	2	2010-03-09 01:12:47	2017-06-05 14:28:29	2010-05-06 17:41:00
113484	acts_like_git	95	https://github.com/jm/acts_like_git	A Rails plugin that uses git to version ActiveRecord fields, like acts_as_versioned, but a git.	Ruby	0	0	\N	5	2009-01-23 19:37:32	2019-08-13 10:55:46	2009-01-23 19:42:31
5573834	asciidoctor	95	https://github.com/jm/asciidoctor	Asciidoc to HTML gem	Ruby	0	0	\N	0	2012-08-27 13:39:48	2013-12-18 14:25:37	2012-08-27 13:40:58
474962	attachment_fu	95	https://github.com/jm/attachment_fu	Treat an ActiveRecord model as a file attachment, storing its patch, size, content type, etc.	Ruby	1	0	\N	2	2010-01-16 12:51:52	2013-12-16 13:33:47	2009-11-28 21:28:07
7150834	bayes_motel	95	https://github.com/jm/bayes_motel	Multi-variate Bayesian classification engine with MongoDB persistence	Ruby	1	1	\N	0	2012-12-13 13:53:54	2013-12-16 14:19:52	2017-09-26 21:19:14
283385	better	95	https://github.com/jm/better	A collection of better replacements for Ruby standard libaries	Ruby	1	0	\N	4	2009-08-20 16:49:25	2013-12-15 13:15:24	2009-08-20 16:07:22
6357	branched_migrations	95	https://github.com/jm/branched_migrations	Branching of database migrations.	Ruby	1	0	\N	6	2008-04-02 18:44:36	2019-08-13 10:22:27	2008-04-02 18:54:10
18223527	bundler	95	https://github.com/jm/bundler	Manage your application's gem dependencies with less pain	Ruby	0	0	\N	0	2014-03-28 16:10:45	2020-01-09 22:12:26	2014-03-28 16:44:03
6355463	burst	95	https://github.com/jm/burst	Ruby parsing reStructuredText	Ruby	2	0	\N	1	2012-10-23 13:57:52	2020-06-16 16:49:58	2013-04-15 14:31:09
254517325	collapsible_intubation_box	95	https://github.com/jm/collapsible_intubation_box	A collapsible, no-glue, simple to assemble aerosol/intubation box for COVID protection.  Design is 100% open and free.	\N	0	0	\N	0	2020-04-09 22:37:45	2020-04-10 00:05:57	2020-04-10 00:06:41
59112	context	95	https://github.com/jm/context	A super tight library to add contexts to tests.	Ruby	12	4	\N	121	2008-10-03 02:57:35	2021-01-13 16:25:39	2009-01-31 13:31:17
105131	dataplace	95	https://github.com/jm/dataplace	A phpMyAdmin-esque app in Sinatra	Ruby	1	0	\N	8	2009-01-11 04:34:58	2019-08-13 10:52:54	2009-01-13 02:31:58
4165	dcov	95	https://github.com/jm/dcov	Documentation coverage analyzer for Ruby code	Ruby	1	0	\N	7	2008-03-16 23:47:54	2019-08-13 10:22:05	2008-03-26 17:56:49
169115	deprecate	95	https://github.com/jm/deprecate	Deprecate (primarily) test code after a certain date, version, or other arbitrary condition is met.	\N	0	0	\N	13	2009-04-06 03:46:19	2019-08-13 11:15:37	2009-04-06 03:51:24
3038465	ditchdaddy	95	https://github.com/jm/ditchdaddy	Ditch GoDaddy, join the DNSimple/Namecheap/Gandi.net party	Ruby	4	2	\N	52	2011-12-23 02:59:29	2019-09-25 18:50:56	2011-12-25 01:46:36
27546	docbox	95	https://github.com/jm/docbox	Wiki interface allowing people to contribute to the documentation of a project	Ruby	0	0	\N	4	2008-06-22 18:26:00	2019-08-13 10:27:21	2008-07-07 02:58:00
7241	docr	95	https://github.com/jm/docr	A clean replacement for RDoc.  Uses as much of RDoc as possible at this point and will eventually replace/refactor where possible.	Ruby	1	0	\N	9	2008-04-05 20:34:02	2019-08-13 10:22:37	2008-04-08 13:00:25
65976	estimette	95	https://github.com/jm/estimette	Suck at estimation?  Great!  Estimette can help.	Ruby	0	0	\N	5	2008-10-21 17:55:48	2019-08-13 10:38:56	2008-10-21 22:20:23
9686929	fed	95	https://github.com/jm/fed	\N	Ruby	1	3	\N	0	2013-04-26 00:50:06	2013-10-08 07:31:46	2013-04-27 00:37:27
4492	fleet	95	https://github.com/jm/fleet	The fleet little web framework in Ruby.	Ruby	0	0	\N	4	2008-03-19 00:22:03	2019-08-13 10:22:08	2008-03-26 18:09:21
21520896	forem	95	https://github.com/jm/forem	The best Rails 3 and Rails 4 forum engine. Ever.	Ruby	0	0	\N	0	2014-07-05 10:49:39	2014-07-05 10:50:46	2014-07-05 10:50:44
112642	foundry	95	https://github.com/jm/foundry	Another fixture replacement using named_scope.  It's fast and simple.	Ruby	5	0	\N	50	2009-01-22 14:24:47	2019-08-13 10:55:29	2009-03-08 01:24:50
6629277	fresno	95	https://github.com/jm/fresno	Framework for writing FRC controller code in Mirah	Ruby	0	0	\N	0	2012-11-10 13:59:00	2013-11-16 17:26:25	2012-11-10 13:59:11
8187238	gem_audit	95	https://github.com/jm/gem_audit	Client for GemAudit.org	Ruby	0	0	\N	1	2013-02-13 18:34:10	2013-12-16 18:57:12	2013-02-13 18:36:02
8187259	gem_audit_server	95	https://github.com/jm/gem_audit_server	API for serving up gem-related CVEs	\N	0	0	\N	0	2013-02-13 18:34:50	2013-02-13 18:34:50	2013-02-13 18:34:50
2820574	gem_git	95	https://github.com/jm/gem_git	Tools for working with gems' source code with Git	Ruby	2	2	\N	12	2011-11-21 12:56:32	2017-06-01 03:02:51	2011-11-21 12:56:45
4459898	git-scribe	95	https://github.com/jm/git-scribe	basically the best way to write an ebook	Ruby	0	0	\N	1	2012-05-27 01:46:30	2013-12-16 23:12:47	2012-04-11 00:49:55
12184059	911	100	https://github.com/kmarsh/911	Suite of tools for trying to make sense of semi-structured crime reporting data in semi-real time.	Ruby	0	0	\N	1	2013-08-17 16:13:33	2015-08-11 14:11:54	2014-01-05 20:03:36
30292	action_mailer_layouts	100	https://github.com/kmarsh/action_mailer_layouts	Enable the use of layouts in ActionMailer templates, this fork's goal is to enable content_for blocks	Ruby	0	0	\N	8	2008-07-01 11:18:10	2019-08-13 10:28:06	2009-04-19 17:18:34
329029718	afreshcup.com	100	https://github.com/kmarsh/afreshcup.com	Scraped copy of Mike Gunderloy's blog "A Fresh Cup"	HTML	0	0	\N	0	2021-01-12 12:29:12	2021-01-12 12:36:35	2021-01-12 12:36:32
39298922	autogeoreferencer	100	https://github.com/kmarsh/autogeoreferencer	An automated georeferencer based on Li and Briggs' 2006 paper "Automated Georeferencing Based on Topological Point Pattern Matching"	Python	0	1	\N	4	2015-07-18 10:20:50	2019-09-18 09:22:53	2015-07-18 11:58:02
37751925	awesome_parser	100	https://github.com/kmarsh/awesome_parser	\N	Ruby	0	0	\N	1	2015-06-19 21:20:20	2016-11-26 09:32:42	2015-06-20 13:01:54
7391853	Better-Autocomplete	100	https://github.com/kmarsh/Better-Autocomplete	A flexible jQuery plugin which offers rich text autocompletion, both from local and remote sources.	JavaScript	0	0	\N	0	2012-12-31 21:53:10	2013-01-13 19:39:56	2012-04-26 14:00:15
12072	chart_fu	100	https://github.com/kmarsh/chart_fu	Easy charting library for Ruby with multiple backends	Ruby	2	0	\N	15	2008-04-23 13:00:45	2021-01-13 16:25:26	2009-02-04 03:34:31
195815694	code-server	100	https://github.com/kmarsh/code-server	Run VS Code on a remote server.	TypeScript	0	0	\N	0	2019-07-08 10:18:00	2019-07-08 10:18:03	2019-07-08 07:06:10
90674309	cv-tricks.com	100	https://github.com/kmarsh/cv-tricks.com	Repository for all the tutorials and codes shared at cv-tricks.com	Python	0	0	\N	0	2017-05-08 18:32:14	2019-11-25 06:19:10	2017-04-17 02:34:07
34134510	Dante	100	https://github.com/kmarsh/Dante	Just another Medium wysiwyg editor clone	HTML	1	1	\N	0	2015-04-17 15:58:17	2015-04-17 16:18:28	2017-09-26 21:19:45
175029	desert	100	https://github.com/kmarsh/desert	Desert is a component framework for Rails that allows your plugins have a Rails app like directory structure, routes, migrations, and dependencies.	Ruby	0	0	\N	1	2009-04-13 17:32:53	2019-08-13 11:17:42	2009-04-13 17:34:30
55856014	docker-automated-test	100	https://github.com/kmarsh/docker-automated-test	\N	\N	0	0	\N	0	2016-04-09 13:52:01	2016-04-09 13:52:01	2016-04-09 13:57:33
49106365	dokku-postgres	100	https://github.com/kmarsh/dokku-postgres	BETA: a postgres plugin for dokku	Shell	0	0	\N	0	2016-01-06 00:23:27	2016-01-06 00:23:28	2016-01-06 00:24:23
910100	dotvim	100	https://github.com/kmarsh/dotvim	\N	VimL	0	0	\N	0	2010-09-14 11:45:23	2013-10-02 20:58:29	2010-09-27 14:53:20
19388066	drone-cc	100	https://github.com/kmarsh/drone-cc	Simple CCMenu component for the Drone CI server	\N	1	0	\N	0	2014-05-02 17:43:00	2014-05-02 17:46:47	2014-05-02 17:46:48
323141041	dropbox_api	100	https://github.com/kmarsh/dropbox_api	Ruby client library for Dropbox API v2	\N	0	0	\N	0	2020-12-20 15:42:06	2020-12-20 15:42:08	2020-12-20 15:44:14
1086717	ec2-imagemagick	100	https://github.com/kmarsh/ec2-imagemagick	Quick set of scripts to do image manipulation on S3 on EC2, likely to be of little use to anyone	Ruby	1	0	\N	0	2010-11-16 20:42:17	2013-03-09 21:51:32	2011-01-18 12:48:44
18192044	elasticsearch	100	https://github.com/kmarsh/elasticsearch	Open Source, Distributed, RESTful Search Engine	Java	0	0	\N	0	2014-03-27 18:27:25	2015-03-09 21:44:53	2014-03-27 18:24:14
161823116	elasticsearch-rails	100	https://github.com/kmarsh/elasticsearch-rails	Elasticsearch integrations for ActiveModel/Record and Ruby on Rails	Ruby	0	0	\N	0	2018-12-14 16:06:56	2018-12-14 16:06:59	2018-12-14 14:45:32
61956936	elixtagram	100	https://github.com/kmarsh/elixtagram	:camera: Instagram API client for the Elixir language (elixir-lang)	Elixir	0	0	\N	0	2016-06-25 15:46:39	2016-06-25 15:46:42	2016-06-02 20:03:19
287938198	FindingBalance	100	https://github.com/kmarsh/FindingBalance	Code Kata to find the balance / pivot point in an integer list	\N	0	0	\N	0	2020-08-16 09:20:35	2020-08-16 09:20:37	2017-08-10 06:51:11
32932683	flummox-isomorphic-demo	100	https://github.com/kmarsh/flummox-isomorphic-demo	Demo of how to create isomorphic apps using Flummox and react-router	JavaScript	0	0	\N	0	2015-03-26 11:37:56	2015-03-26 11:37:56	2015-03-26 11:57:59
4395	foo_tools	100	https://github.com/kmarsh/foo_tools	Random Rails stuff that I've cribbed from other places and improved upon, mostly to bootstrap a new Rails project quickly	Ruby	0	0	\N	3	2008-03-18 12:08:42	2019-08-13 10:22:08	2008-12-27 15:02:40
547	git-wiki	100	https://github.com/kmarsh/git-wiki	A quick & dirty git-powered Sinatra wiki	Ruby	2	0	\N	7	2008-01-29 18:39:42	2019-08-13 10:21:25	2008-03-26 16:14:52
39104032	gmmreg	100	https://github.com/kmarsh/gmmreg	Automatically exported from code.google.com/p/gmmreg	C++	0	4	\N	3	2015-07-14 19:39:57	2017-07-13 07:15:17	2015-07-14 19:42:29
178582	ical-time	100	https://github.com/kmarsh/ical-time	Utility for pulling data out of iCal, useful for time tracking	\N	0	0	\N	3	2009-04-17 12:28:43	2019-08-13 11:18:52	2009-04-17 12:53:21
127795	jekyll	100	https://github.com/kmarsh/jekyll	Jekyll is a blog-aware, static site generator in Ruby	Ruby	0	0	\N	1	2009-02-12 21:16:24	2019-08-13 11:00:31	2009-02-12 21:22:24
62419793	jenkins-pipeline-test	100	https://github.com/kmarsh/jenkins-pipeline-test	Just playing with Jenkins 2 pipelines and Docker	\N	0	0	\N	0	2016-07-01 18:08:26	2016-07-01 18:08:26	2016-07-01 18:52:17
2912204	json_builder	100	https://github.com/kmarsh/json_builder	Rails provides an excellent XML Builder by default to build RSS and ATOM feeds, but nothing to help you build complex and custom JSON data structures. The standard to_json works well, but can get very verbose when you need full control of what is generated. JSON Builder hopes to solve that problem.	Ruby	0	0	\N	0	2011-12-04 18:32:05	2013-01-23 20:37:21	2011-12-04 19:05:50
1025487	jumpcut	100	https://github.com/kmarsh/jumpcut	Fork of Steve Cook's Jumpcut clipboard history utility (jumpcut.sourceforge.net), hopefully adding web syncing	Objective-C	0	0	\N	2	2010-10-26 11:33:07	2018-12-17 01:58:42	2010-10-26 11:43:41
11214345	adarkroom	101	https://github.com/jvantuyl/adarkroom	A Dark Room - A Minimalist Text Adventure	JavaScript	0	0	\N	0	2013-07-06 03:41:32	2015-04-16 11:09:55	2013-07-06 17:53:35
157779645	aiolog	101	https://github.com/jvantuyl/aiolog	Asynchronous handlers for standard python logging library	Python	0	0	\N	0	2018-11-15 20:16:31	2018-11-15 20:16:34	2016-12-08 13:28:52
7413389	ansible	101	https://github.com/jvantuyl/ansible	Model-driven configuration management, multi-node deployment, and remote task execution system.   Uses SSH by default, so there is no special software has to be installed on the nodes you manage.  Ansible can be extended in any language.  Note: The default branch is the development branch, if you need a stable version, see the release-XX branches, tags, or downloads.	Python	0	0	\N	0	2013-01-02 19:10:18	2013-02-22 05:28:53	2013-01-26 23:34:39
49497676	ansible-modules-core	101	https://github.com/jvantuyl/ansible-modules-core	Ansible modules - these modules ship with ansible	Python	0	0	\N	0	2016-01-12 10:05:50	2016-01-12 10:05:52	2016-01-12 10:34:37
69708421	app_start_spec	101	https://github.com/jvantuyl/app_start_spec	\N	Elixir	0	0	\N	0	2016-09-30 20:16:59	2016-09-30 20:17:00	2016-09-30 20:26:09
326615833	base85	101	https://github.com/jvantuyl/base85	implements some 85-character encodings for Elixir	Elixir	0	0	\N	0	2021-01-04 05:22:31	2021-01-18 02:03:34	2021-01-04 07:30:36
53029953	bash_scripting_tutorial	101	https://github.com/jvantuyl/bash_scripting_tutorial	\N	Shell	0	0	\N	0	2016-03-03 04:24:25	2016-03-03 04:24:26	2016-03-03 04:46:12
66414961	canada	101	https://github.com/jvantuyl/canada	Easy permission definitions in Elixir apps!	Elixir	0	0	\N	0	2016-08-23 21:43:51	2016-08-23 21:43:52	2016-08-23 21:44:46
259972997	cidrex	101	https://github.com/jvantuyl/cidrex	LPM implementation in Elixir	Elixir	0	0	\N	0	2020-04-29 13:00:14	2020-04-29 13:01:36	2020-04-29 13:01:34
63985153	ded	101	https://github.com/jvantuyl/ded	Diagram Editor	Java	0	0	\N	0	2016-07-22 18:44:11	2016-07-22 18:44:14	2016-07-22 18:45:31
300238908	ecto	101	https://github.com/jvantuyl/ecto	A toolkit for data mapping and language integrated query.	\N	0	0	\N	0	2020-10-01 07:28:51	2020-10-01 07:28:53	2020-10-01 01:08:26
214534880	ecto_sql	101	https://github.com/jvantuyl/ecto_sql	SQL-based adapters for Ecto and database migrations	Elixir	0	0	\N	0	2019-10-11 18:56:14	2020-09-08 19:48:22	2020-09-08 21:24:42
310708501	elixir	101	https://github.com/jvantuyl/elixir	Elixir is a dynamic, functional language designed for building scalable and maintainable applications	\N	0	0	\N	0	2020-11-06 18:23:32	2020-11-06 18:23:34	2020-11-06 11:58:44
282632	erl-class	101	https://github.com/jvantuyl/erl-class	Class Notes for Fault-Tolerance With Erlang Class	Erlang	0	0	\N	3	2009-08-19 22:33:44	2013-12-28 11:40:32	2009-09-03 23:39:08
230976	erl-skel	101	https://github.com/jvantuyl/erl-skel	Basic Skeleton Erlang Project	Erlang	1	0	\N	11	2009-06-18 20:58:02	2017-11-13 12:01:12	2010-01-01 00:25:46
271272	erlbench	101	https://github.com/jvantuyl/erlbench	Erlang Benchmark Suite	Erlang	0	0	\N	3	2009-08-06 23:36:53	2014-01-09 02:30:37	2009-08-16 23:51:35
493308	erlctl	101	https://github.com/jvantuyl/erlctl	Command Line Interface Framework for Erlang	Erlang	7	2	\N	36	2010-01-29 05:09:56	2019-11-09 13:30:04	2010-12-05 00:26:44
58234340	erlexec	101	https://github.com/jvantuyl/erlexec	Execute and control OS processes from Erlang/OTP	C++	0	0	\N	0	2016-05-06 17:54:17	2016-05-06 17:54:18	2016-05-06 17:55:59
123437779	exexec	101	https://github.com/jvantuyl/exexec	Execute and control OS processes from Elixir.	Elixir	0	0	\N	0	2018-03-01 10:21:43	2018-03-01 10:21:45	2018-03-01 10:43:12
1520364	exim_ses_transport	101	https://github.com/jvantuyl/exim_ses_transport	Amazon SES Transport for Exim	Python	3	0	\N	10	2011-03-24 07:24:38	2019-11-07 12:09:02	2013-09-28 09:28:58
83658571	exlager	101	https://github.com/jvantuyl/exlager	Elixir binding for lager	Elixir	0	0	\N	0	2017-03-02 06:16:51	2017-03-02 06:16:53	2017-05-18 21:56:39
262990439	Factorio	101	https://github.com/jvantuyl/Factorio	\N	\N	0	0	\N	0	2020-05-11 05:58:08	2020-05-11 05:58:10	2019-08-04 09:54:24
22716346	ForestryMC	101	https://github.com/jvantuyl/ForestryMC	Source code for Forestry (Minecraft mod).	Java	0	0	\N	0	2014-08-07 06:49:49	2014-08-07 06:57:30	2014-08-07 06:59:43
14836601	fuse	101	https://github.com/jvantuyl/fuse	FUSE library for Go. Please use import path "bazil.org/fuse".	Go	0	0	\N	0	2013-12-01 07:56:20	2013-12-01 07:56:20	2013-10-12 15:51:43
64255918	gonag	101	https://github.com/jvantuyl/gonag	a tiny library for writing Nagios checks in the Go Language	Go	0	0	\N	0	2016-07-26 18:26:42	2016-07-26 18:27:01	2016-07-26 18:27:11
183151941	go_http_parallelism_madness	101	https://github.com/jvantuyl/go_http_parallelism_madness	wow... this works	Go	0	0	\N	0	2019-04-24 02:06:07	2019-06-10 20:39:41	2019-06-10 20:39:40
261567358	gracie	101	https://github.com/jvantuyl/gracie	Graceful Shutdown Testing with Cowboy	Elixir	0	0	\N	0	2020-05-05 16:42:37	2020-05-05 16:47:24	2020-05-05 16:42:46
327298790	grouper	101	https://github.com/jvantuyl/grouper	Elixir process groups for non-global configuration and non-global name registration	Elixir	0	0	\N	0	2021-01-06 09:03:22	2021-01-14 15:40:50	2021-01-14 15:40:48
7602301	gunicorn-init	101	https://github.com/jvantuyl/gunicorn-init	Gunicorn init script	Python	0	0	\N	0	2013-01-14 08:22:38	2013-03-06 18:20:43	2013-01-14 08:24:10
4311050	iterdict	101	https://github.com/jvantuyl/iterdict	Lazy-populated dict that retrieves keys from an iterator as they're accessed	Python	0	0	\N	1	2012-05-12 21:29:08	2013-01-09 02:01:35	2012-05-13 06:18:08
11040764	active_shipping	102	https://github.com/BrianTheCoder/active_shipping	Shipping API extension for Active Merchant.	Ruby	4	0	\N	0	2013-06-28 20:24:02	2014-10-21 15:00:10	2014-10-21 15:08:59
9660225	airbrake-api	102	https://github.com/BrianTheCoder/airbrake-api	Airbrake API Ruby Client	Ruby	0	0	\N	0	2013-04-24 20:59:00	2013-04-24 21:02:36	2013-04-24 21:02:36
24742805	angular-isotope	102	https://github.com/BrianTheCoder/angular-isotope	AngularJS directives to easily work with JQuery Isotope.	\N	0	0	\N	0	2014-10-02 22:11:31	2014-09-28 20:47:13	2014-05-26 17:45:52
23821267	angular-payment	102	https://github.com/BrianTheCoder/angular-payment	Native AngularJS (Angular) directives based heavily on Stripe's jQuery payment library. No 3rd party JS dependencies (jQuery, Stripe.js, etc.) required!  http://seandesmond.github.io/angular-payment/	JavaScript	0	0	\N	0	2014-09-09 02:59:14	2014-09-09 03:01:47	2015-07-13 19:57:48
9108332	animate.css	102	https://github.com/BrianTheCoder/animate.css	Cross-browser CSS3 animations. Plug and play. Do a little dance.	\N	1	0	\N	0	2013-03-29 20:09:59	2020-05-07 12:45:03	2013-03-12 10:00:39
1297607	ankusa	102	https://github.com/BrianTheCoder/ankusa	Text classifier in Ruby that uses Hadoop/HBase or Cassandra for storage	Ruby	0	0	\N	1	2011-01-27 00:10:30	2012-12-17 18:49:13	2011-01-28 06:48:15
7439395	ankusa-1	102	https://github.com/BrianTheCoder/ankusa-1	Text classifier in Ruby that uses Hadoop/HBase, Mongo, or Cassandra for storage. New location for http://github.com/livingsocial/ankusa	Ruby	0	0	\N	0	2013-01-04 09:38:04	2013-01-13 20:53:30	2012-11-30 18:09:05
13635669	braintree_ruby_guide	102	https://github.com/BrianTheCoder/braintree_ruby_guide	Example Braintree integrations	Ruby	0	0	\N	0	2013-10-16 22:11:17	2013-10-16 22:11:17	2013-08-16 12:18:27
5160318	brianthecoder.github.com	102	https://github.com/BrianTheCoder/brianthecoder.github.com	pages!	\N	0	0	\N	1	2012-07-23 23:53:30	2013-01-11 07:16:24	2012-07-23 23:53:30
438452	bureaucrat	102	https://github.com/BrianTheCoder/bureaucrat	Form handling for Ruby inspired by Django forms. 	Ruby	1	0	\N	1	2009-12-15 19:39:09	2012-12-13 18:48:52	2009-12-05 18:36:05
44063967	carrierwave-mongoid	102	https://github.com/BrianTheCoder/carrierwave-mongoid	Mongoid support for CarrierWave	Ruby	0	0	\N	0	2015-10-11 15:23:30	2015-10-11 15:23:31	2015-10-04 14:25:27
22295333	carrierwave-video	102	https://github.com/BrianTheCoder/carrierwave-video	carrierwave extension to use ffmpeg to transcode videos to html5-friendly format	\N	0	0	\N	0	2014-07-26 17:04:36	2014-07-24 08:16:38	2014-05-16 13:13:34
7236920	car_pc	102	https://github.com/BrianTheCoder/car_pc	Code for my car pc built with node.js and running on a raspberry pi!	CoffeeScript	0	0	\N	1	2012-12-19 05:44:14	2013-09-28 17:19:15	2012-12-27 13:42:01
1020090	columbus	102	https://github.com/BrianTheCoder/columbus	Autodiscovers feeds from urls	Ruby	0	0	\N	1	2010-10-24 15:19:47	2012-12-15 19:50:11	2009-04-02 12:34:31
105169	compass	102	https://github.com/BrianTheCoder/compass	Compass is a real stylesheet framework, not a collection of classes. With Compass, you still use the best of breed css frameworks; ported to Sass to make them easier to configure and apply to your semantic markup.	Ruby	0	0	\N	3	2009-01-11 06:41:04	2019-08-13 10:52:54	2009-01-11 06:51:39
156066	cool_breeze	102	https://github.com/BrianTheCoder/cool_breeze	A new type of orm, so awesome I'm calling it a urm(ultimate relation mapper)....its that good.	Ruby	0	0	\N	7	2009-03-21 21:31:15	2019-08-13 11:11:12	2009-04-15 15:37:57
10293415	copycopter-server	102	https://github.com/BrianTheCoder/copycopter-server	Copycopter Server is open source. Run it as a web service.	Ruby	0	0	\N	0	2013-05-26 01:19:21	2013-05-26 01:19:21	2012-06-28 09:48:11
134929	couchdb_presentation_code	102	https://github.com/BrianTheCoder/couchdb_presentation_code	Code for using different gems with couchdb	Ruby	0	0	\N	2	2009-02-22 18:18:45	2019-08-13 11:03:03	2009-02-22 21:36:29
1188313	Dashboard	102	https://github.com/BrianTheCoder/Dashboard	a modular admin dashboard	Ruby	0	0	\N	1	2010-12-21 19:04:55	2014-05-22 22:18:20	2010-12-21 19:35:23
104552	davenport	102	https://github.com/BrianTheCoder/davenport	Couchdb blog	JavaScript	0	0	\N	4	2009-01-10 03:59:22	2019-08-13 10:52:40	2009-04-07 13:35:27
49781	dealer	102	https://github.com/BrianTheCoder/dealer	Beat vegas through simulation	Ruby	0	0	\N	3	2008-09-05 21:48:15	2019-08-13 10:34:18	2008-09-06 16:46:28
259907	delayed_job	102	https://github.com/BrianTheCoder/delayed_job	Database based asynchronously priority queue system -- Extracted from Shopify 	Ruby	1	0	\N	1	2009-07-24 16:59:38	2012-12-12 21:47:14	2009-07-19 02:24:12
860617	devise	102	https://github.com/BrianTheCoder/devise	Flexible authentication solution for Rails with Warden. NOTICE: If you want to use Devise master, you need Rails master and vice-versa.	Ruby	1	0	\N	1	2010-08-24 23:33:31	2020-01-11 10:27:48	2010-08-23 18:02:15
24657860	discourse	102	https://github.com/BrianTheCoder/discourse	A platform for community discussion. Free, open, simple.	\N	0	0	\N	0	2014-09-30 19:20:55	2014-09-30 18:39:26	2014-09-30 17:10:56
321409	dm-core	102	https://github.com/BrianTheCoder/dm-core	DataMapper - Core	Ruby	1	0	\N	1	2009-09-29 16:36:42	2012-12-12 23:43:06	2009-09-28 13:16:48
468187	dm-geokit	102	https://github.com/BrianTheCoder/dm-geokit	Geokit for DataMapper	Ruby	1	0	\N	1	2010-01-11 22:14:49	2012-12-13 19:44:49	2009-12-23 14:09:33
81429	dm-is-markup	102	https://github.com/BrianTheCoder/dm-is-markup	Textile, Markdown, Wikitext support for datampper	Ruby	0	0	\N	2	2008-11-26 18:28:09	2019-08-13 10:44:30	2008-11-26 21:39:37
145870	dm-is-schemaless	102	https://github.com/BrianTheCoder/dm-is-schemaless	Schemaless data in a traditional rdbms. Inspired by friendfeed	Ruby	1	1	\N	22	2009-03-08 13:35:35	2019-08-13 11:07:38	2009-10-30 07:45:01
321410	dm-more	102	https://github.com/BrianTheCoder/dm-more	Extras for DataMapper, including bridges to DataObjects::Migrations and Merb::DataMapper	Ruby	1	0	\N	1	2009-09-29 16:36:47	2012-12-12 23:43:06	2009-09-23 21:21:05
373849	dm-preferences	102	https://github.com/BrianTheCoder/dm-preferences	TODO: one-line summary of your gem	\N	0	0	\N	1	2009-11-15 16:00:06	2014-01-02 04:40:40	2009-11-15 16:00:12
97737876	2017-talks	103	https://github.com/freeformz/2017-talks	Slides and links for 2017 talks	Go	0	0	\N	0	2017-07-19 13:21:52	2017-07-19 13:21:54	2017-08-01 03:05:12
3121843	activerecord-postgis-adapter	103	https://github.com/freeformz/activerecord-postgis-adapter	ActiveRecord connection adapter for PostGIS, based on postgresql and rgeo	Ruby	0	0	\N	2	2012-01-06 21:18:49	2014-05-02 20:45:26	2011-08-15 20:14:24
47368397	anonymous-slack	103	https://github.com/freeformz/anonymous-slack	A Heroku service that lets you send anonymous messages to colleagues on Slack.	Go	0	0	\N	0	2015-12-03 21:52:20	2015-12-03 21:52:21	2015-12-03 21:54:12
210919542	bits	103	https://github.com/freeformz/bits	Random bits of code	Go	1	0	\N	0	2019-09-25 16:02:42	2019-11-18 15:03:47	2019-11-18 15:04:01
285116565	angular	113	https://github.com/mattetti/angular	One framework. Mobile & desktop.	\N	0	0	\N	0	2020-08-04 19:38:37	2020-08-04 19:38:40	2020-08-04 19:22:55
9479217	burninator	103	https://github.com/freeformz/burninator	Warm a standby database with production query traffic	Ruby	0	0	\N	0	2013-04-16 15:14:39	2013-04-16 15:14:39	2013-04-16 13:22:55
52480275	bwag	103	https://github.com/freeformz/bwag	Material provided by Jeremy Saenz (@CodeGangsta): Source Code for the Free Online Book Building Web Apps in Go.	Go	0	0	\N	0	2016-02-24 19:50:35	2019-02-19 14:27:49	2016-02-25 23:05:40
41518448	caddy-test	103	https://github.com/freeformz/caddy-test	\N	HTML	0	0	\N	0	2015-08-27 21:44:02	2015-08-27 21:44:09	2015-08-27 21:44:09
39097167	centrifugo	103	https://github.com/freeformz/centrifugo	Language-agnostic real-time messaging (Websockets or SockJS) server in Go	Go	0	0	\N	0	2015-07-14 16:53:12	2015-07-14 16:53:12	2015-07-20 15:10:11
189498204	cli	103	https://github.com/freeformz/cli	CLI	\N	0	0	\N	0	2019-05-30 21:00:47	2019-05-30 21:00:47	2019-05-30 21:00:48
188318152	cobra	103	https://github.com/freeformz/cobra	A Commander for modern Go CLI interactions	Go	0	0	\N	0	2019-05-23 20:03:08	2019-05-23 20:03:10	2019-05-22 04:46:17
33016023	cod3s	103	https://github.com/freeformz/cod3s	Reflect the requested HTTP code back to you.	Go	0	0	\N	0	2015-03-27 21:54:22	2015-03-27 22:14:55	2015-03-27 22:14:55
9873286	codeeval	103	https://github.com/freeformz/codeeval	\N	Ruby	0	0	\N	0	2013-05-05 16:21:04	2013-05-06 01:07:56	2013-05-06 01:07:54
39088834	congo	103	https://github.com/freeformz/congo	Conference Management Software for Conference Organizers	Go	0	0	\N	0	2015-07-14 14:06:16	2015-07-14 14:06:16	2015-06-08 17:32:16
9533451	copy-librato	103	https://github.com/freeformz/copy-librato	Copy Librato stuff from one account to another	Ruby	0	0	\N	0	2013-04-18 19:38:50	2013-11-18 18:40:06	2013-04-18 19:38:57
6643136	cors-talk-example	103	https://github.com/freeformz/cors-talk-example	\N	Ruby	0	0	\N	0	2012-11-11 17:13:45	2013-01-13 00:34:58	2012-11-01 20:26:31
5811471	dcell	103	https://github.com/freeformz/dcell	Actor-based distributed objects in Ruby based on Celluloid and 0MQ	Ruby	0	0	\N	0	2012-09-14 13:02:21	2013-04-07 15:11:35	2012-10-25 20:10:16
80796510	depExample	103	https://github.com/freeformz/depExample	github.com/golang/dep example repo, each commit is a step	Go	0	0	\N	1	2017-02-03 02:19:15	2017-11-05 08:43:22	2017-02-08 21:27:08
47368283	devcon-2014-static-json	103	https://github.com/freeformz/devcon-2014-static-json	Devcon 2014 JSON API	Go	0	0	\N	0	2015-12-03 21:49:59	2015-12-03 21:50:00	2015-12-03 21:51:41
67630014	discord-wow-bot	103	https://github.com/freeformz/discord-wow-bot	Discord bot app for WoW-connected info	Go	0	0	\N	0	2016-09-07 14:44:23	2016-09-07 14:44:24	2016-09-07 14:45:41
3279275	disk-stats	103	https://github.com/freeformz/disk-stats	\N	Ruby	0	0	\N	2	2012-01-26 23:40:20	2017-05-18 00:22:55	2012-03-01 03:11:47
41518455	docker-caddy	103	https://github.com/freeformz/docker-caddy	\N	Shell	0	0	\N	0	2015-08-27 21:44:19	2015-08-27 21:44:52	2015-08-27 21:58:12
41831311	docker-go-base	103	https://github.com/freeformz/docker-go-base	\N	Shell	0	0	\N	0	2015-09-02 19:42:47	2015-09-02 19:43:12	2015-09-02 19:43:25
41051572	dotfiles	103	https://github.com/freeformz/dotfiles	\N	Shell	0	0	\N	2	2015-08-19 15:11:55	2020-06-06 20:39:57	2020-06-06 20:39:55
2981544	dotvim	103	https://github.com/freeformz/dotvim	\N	VimL	0	0	\N	2	2011-12-14 15:18:44	2015-03-13 00:27:53	2015-06-04 14:46:32
81896616	echo	103	https://github.com/freeformz/echo	High performance, minimalist Go web framework	Go	0	0	\N	0	2017-02-14 00:42:39	2017-12-09 09:13:04	2017-02-14 16:11:09
5695228	em_postgresql	103	https://github.com/freeformz/em_postgresql	ActiveRecord driver for Postgresql with EventMachine	Ruby	0	0	\N	0	2012-09-05 20:58:36	2013-01-12 01:12:00	2011-07-27 18:46:51
17584473	etcdctl	103	https://github.com/freeformz/etcdctl	A simple command line client for etcd	Go	0	0	\N	0	2014-03-10 04:02:39	2014-03-10 04:02:40	2014-02-26 05:00:16
9181719	exp	103	https://github.com/freeformz/exp	Just show me the requests and respond with 200	Go	0	0	\N	0	2013-04-02 19:25:40	2018-09-25 18:02:42	2018-09-25 18:02:41
174022154	extratools	103	https://github.com/freeformz/extratools	\N	Go	0	0	\N	0	2019-03-05 18:18:06	2019-03-05 18:52:53	2019-03-05 18:52:52
11009146	factor	103	https://github.com/freeformz/factor	Go Proxy	Go	0	0	\N	0	2013-06-27 19:06:53	2013-11-18 16:00:00	2013-07-12 19:34:55
4942750	.pair.io	104	https://github.com/hassox/.pair.io	Personal dotfiles for use when pairing or using pair.io servers	VimL	0	0	\N	1	2012-07-07 22:03:49	2013-01-10 23:29:49	2012-06-05 15:26:27
160562633	2018-advent	104	https://github.com/hassox/2018-advent	https://adventofcode.com/2018	Elixir	0	0	\N	0	2018-12-05 16:41:36	2018-12-09 04:41:26	2018-12-09 04:41:25
152938803	abc	104	https://github.com/hassox/abc	Broadcaster (GenStage + Swarm)	Elixir	0	0	\N	3	2018-10-14 01:21:14	2020-05-13 07:11:42	2018-10-14 01:31:15
2415048	abr_lookup	104	https://github.com/hassox/abr_lookup	An ABN/ACN lookup tool	Ruby	3	0	\N	5	2011-09-19 09:16:16	2019-04-11 21:00:25	2013-03-01 18:18:46
150356057	absinthe_proto	104	https://github.com/hassox/absinthe_proto	Protobuf (gRPC) -> Graphql	Elixir	2	2	\N	5	2018-09-25 23:17:19	2021-01-23 11:18:05	2019-09-23 21:03:56
3987915	acts_as_votable	104	https://github.com/hassox/acts_as_votable	Votable ActiveRecord for Rails	Ruby	1	0	\N	3	2012-04-10 19:40:02	2013-01-08 13:41:04	2012-04-11 08:05:16
483132	amqp	104	https://github.com/hassox/amqp	AMQP client implementation in Ruby/EventMachine	Ruby	1	0	\N	4	2010-01-21 22:44:58	2017-04-20 11:03:11	2010-01-21 22:46:36
429928	any_view	104	https://github.com/hassox/any_view	Universal View helpers with minimal requirements	Ruby	1	0	\N	15	2009-12-13 03:19:06	2021-01-13 16:27:41	2010-06-15 19:49:57
498845	babushka-deps	104	https://github.com/hassox/babushka-deps	My babushka dep files	Ruby	1	0	\N	2	2010-02-02 09:47:10	2012-12-13 20:42:45	2010-02-02 09:55:08
617318	bcrypt-ruby	104	https://github.com/hassox/bcrypt-ruby	bcrypt-ruby is a Ruby binding for the OpenBSD bcrypt() password hashing algorithm, allowing you to easily store a secure hash of your users' passwords.	C	1	0	\N	1	2010-04-19 03:31:43	2015-12-15 12:49:23	2010-05-20 05:53:34
26829439	bitmasker	104	https://github.com/hassox/bitmasker	Bitmasker allows you to store many boolean values as one integer field in the database.	Ruby	2	0	\N	0	2014-11-18 18:52:53	2014-11-18 18:52:53	2016-07-08 14:47:20
757372	black	104	https://github.com/hassox/black	A hackable blog stack	Ruby	0	0	\N	2	2010-07-05 05:15:39	2021-01-13 16:29:18	2010-07-05 06:43:07
32178450	business_time	104	https://github.com/hassox/business_time	Support for doing time math in business hours and days	Ruby	0	0	\N	0	2015-03-13 17:10:38	2015-03-13 17:10:38	2015-03-20 17:29:51
132651516	bypass	104	https://github.com/hassox/bypass	Bypass provides a quick way to create a custom plug that can be put in place instead of an actual HTTP server to return prebaked responses to client requests.	Elixir	0	0	\N	0	2018-05-08 15:52:07	2018-05-08 15:52:09	2018-07-11 19:09:43
224722775	c3p0	104	https://github.com/hassox/c3p0	Protocols for Elixir	Elixir	1	0	\N	0	2019-11-28 17:16:52	2020-06-19 12:16:18	2020-06-19 12:16:16
442641	chain	104	https://github.com/hassox/chain	A Simple Application Convention for Node	JavaScript	2	0	\N	38	2009-12-19 07:17:28	2021-01-13 16:27:42	2010-01-31 21:47:21
11376108	clockwork	104	https://github.com/hassox/clockwork	A scheduler process to replace cron.	Ruby	1	0	\N	0	2013-07-12 16:11:13	2016-10-27 15:28:54	2013-07-09 03:44:03
54342337	config_values	104	https://github.com/hassox/config_values	A consistent way to interpolate config values in Elixir	Elixir	1	0	\N	3	2016-03-20 18:47:49	2017-03-28 16:40:56	2017-01-07 22:28:55
531878	conventionsapp	104	https://github.com/hassox/conventionsapp	a little something something	JavaScript	1	0	\N	1	2010-02-23 08:38:58	2012-12-13 23:27:47	2010-02-22 12:04:58
224917184	ctx	104	https://github.com/hassox/ctx	Erlang context library	\N	0	0	\N	0	2019-11-29 17:18:41	2019-11-29 17:18:43	2019-11-29 17:19:40
16396146	database_cleaner	104	https://github.com/hassox/database_cleaner	Strategies for cleaning databases in Ruby.  Can be used to ensure a clean state for testing.	Ruby	0	0	\N	0	2014-01-30 22:52:13	2014-01-30 22:52:13	2014-01-27 00:17:56
116640398	dataloader	104	https://github.com/hassox/dataloader	DataLoader for Elixir	Elixir	0	0	\N	0	2018-01-08 04:46:46	2018-01-08 04:46:48	2019-12-21 17:37:46
2387889	db2fog	104	https://github.com/hassox/db2fog	store your rails database backups in the cloud	Ruby	0	0	\N	1	2011-09-14 16:58:30	2013-01-04 03:53:58	2011-09-14 17:04:30
23941	dm-adapters	104	https://github.com/hassox/dm-adapters	DataMapper Adapters	Ruby	0	0	\N	3	2008-06-10 08:24:27	2019-08-13 10:26:27	2008-06-10 09:17:43
549458	dm-more	104	https://github.com/hassox/dm-more	Extras for DataMapper, including bridges to DataObjects::Migrations and Merb::DataMapper	Ruby	1	0	\N	1	2010-03-06 02:10:16	2012-12-13 23:59:50	2010-02-23 17:15:50
551930	dm-pagination	104	https://github.com/hassox/dm-pagination	Better DataMapper paging solution - framework independant - like will_paginate but better ;)	Ruby	1	0	\N	1	2010-03-08 00:24:39	2012-12-14 00:04:34	2010-03-08 00:57:56
24878	dm-polymorphic	104	https://github.com/hassox/dm-polymorphic	An initial repo for polymorphism in datamapper	Ruby	9	1	\N	27	2008-06-13 01:47:35	2019-08-13 10:26:39	2010-02-09 04:27:06
756796	dm-zone-types	104	https://github.com/hassox/dm-zone-types	Time zone aware data types	Ruby	3	4	\N	13	2010-07-04 18:16:45	2016-03-30 22:25:56	2010-11-08 00:53:20
2195490	dotfiles	104	https://github.com/hassox/dotfiles	config files for zsh, bash, completions, gem, git, irb, rails	VimL	0	0	\N	2	2011-08-12 02:33:32	2013-01-03 23:16:27	2011-08-22 21:36:48
27471521	dropbox-protos	104	https://github.com/hassox/dropbox-protos	\N	JavaScript	0	0	\N	0	2014-12-03 03:44:58	2015-01-25 22:21:57	2015-01-25 22:21:57
27845	activemdb	105	https://github.com/automatthew/activemdb	Sad little library for read access to Access (MDB) databases	Ruby	14	3	\N	24	2008-06-23 13:18:57	2019-08-13 10:27:25	2019-10-21 17:52:19
8082239	ascribe	105	https://github.com/automatthew/ascribe	ASCII charting for JavaScript	JavaScript	0	0	\N	0	2013-02-07 19:37:37	2014-05-22 19:57:39	2014-05-22 19:57:38
50508	cassie	105	https://github.com/automatthew/cassie	Pure-Ruby CSS generator	Ruby	1	0	\N	7	2008-09-08 14:13:36	2019-08-13 10:34:31	2008-09-30 15:14:20
4317456	desire	105	https://github.com/automatthew/desire	Redis wrappers	Ruby	0	5	\N	1	2012-05-13 17:47:48	2015-08-04 19:44:23	2012-11-13 20:16:01
2042979	djinn	105	https://github.com/automatthew/djinn	Javascript Finite State Automata	CoffeeScript	0	1	\N	4	2011-07-13 13:42:15	2018-07-16 23:16:10	2013-01-08 19:23:06
235661676	docusign-ruby-client	105	https://github.com/automatthew/docusign-ruby-client	The Official DocuSign Ruby Library used to interact with the eSign REST API. Send, sign, and approve documents using this client.	Ruby	0	0	\N	0	2020-01-22 17:35:46	2020-01-22 17:38:41	2020-01-22 17:38:37
2638692	flipper	105	https://github.com/automatthew/flipper	Load testing helper: track target and test configs, storing with each result	Ruby	0	0	\N	2	2011-10-24 17:44:26	2014-01-02 21:04:46	2012-06-28 17:10:21
412267	fyte	105	https://github.com/automatthew/fyte	JVM assembler written in a Forth	Forth	0	0	\N	6	2009-12-09 23:32:53	2018-12-14 18:09:50	2015-06-16 12:06:00
5260715	harp	105	https://github.com/automatthew/harp	A mixin for creating application REPLs with Readline support	Ruby	0	1	\N	1	2012-08-01 12:02:30	2014-05-16 14:07:33	2013-04-06 15:32:47
4054314	minfinite	105	https://github.com/automatthew/minfinite	minimal FSMs in C, using function pointers in macros	C++	2	0	\N	1	2012-04-17 13:00:15	2020-09-30 17:41:44	2020-09-30 17:41:41
211967	moonstone	105	https://github.com/automatthew/moonstone	JRuby wrapper and base classes for Lucene indexing	Ruby	3	3	\N	41	2009-05-27 18:58:05	2019-08-13 11:26:07	2017-09-26 21:54:47
49527304	pandoc	105	https://github.com/automatthew/pandoc	Universal markup converter	Haskell	0	0	\N	0	2016-01-12 18:35:06	2016-01-12 18:35:08	2016-01-11 19:36:17
236964	pez	105	https://github.com/automatthew/pez	Pez is a Forth dialect based on Atlast, with expanded capabilities and more portability.	Shell	1	0	\N	5	2009-07-23 16:43:32	2012-12-12 21:05:14	2012-04-17 16:05:19
433941	pez_libs	105	https://github.com/automatthew/pez_libs	libs for Pez	\N	0	0	\N	2	2009-12-13 16:09:27	2013-10-27 15:27:37	2009-12-13 16:18:26
225894756	powscript	105	https://github.com/automatthew/powscript	transpiler written in bash: painless shellscript, indentbased, coffee for the shell with hipster-sparkles v1 BETA LANDED 🎉🎉🎉🎉 thanks fcard!	\N	0	0	\N	0	2019-12-04 12:09:51	2019-12-04 12:09:54	2019-09-10 08:50:54
16385	rakegen	105	https://github.com/automatthew/rakegen	Rake extension for generating and updating projects from templates	Ruby	0	0	\N	2	2008-05-12 22:46:19	2019-08-13 10:24:27	2008-09-03 11:14:41
259114	rupez	105	https://github.com/automatthew/rupez	Pez in Ruby, via FFI	Ruby	1	0	\N	2	2009-07-23 20:04:34	2013-12-22 07:19:00	2009-07-28 02:31:57
2084551	squeeze	105	https://github.com/automatthew/squeeze	Data reduction in Ruby	Ruby	0	0	\N	1	2011-07-21 13:56:06	2016-08-15 17:02:56	2016-08-15 17:03:31
99087	stevedore	105	https://github.com/automatthew/stevedore	Benchmarking with a whiff of statistical awareness	Ruby	0	0	\N	2	2008-12-31 17:12:38	2019-08-13 10:50:52	2009-05-20 13:29:44
4549614	synopticon	105	https://github.com/automatthew/synopticon	Browser DOM/CSS replication/synchronization	JavaScript	0	3	\N	1	2012-06-04 13:48:51	2013-12-06 09:55:19	2012-06-25 18:05:24
44393963	ti	105	https://github.com/automatthew/ti	A simple command line time tracker	Python	0	0	\N	0	2015-10-16 12:27:48	2015-10-16 12:27:49	2015-10-16 13:04:07
297608	acts_as_network	106	https://github.com/queso/acts_as_network	Rails plugin for cleanly modeling social networks using ActiveRecord	Ruby	1	0	\N	1	2009-09-04 12:26:27	2012-12-12 23:03:59	2009-09-04 16:32:12
48389577	akismet	106	https://github.com/queso/akismet	Meteor wrapper for NPM akismet-api	JavaScript	0	0	\N	0	2015-12-21 17:16:58	2015-12-21 17:16:59	2014-09-17 09:54:06
54399721	ama	106	https://github.com/queso/ama	Ask me anything!	\N	0	0	\N	1	2016-03-21 12:18:57	2019-08-26 17:24:06	2016-03-21 17:15:45
130588141	anywherejs-template	106	https://github.com/queso/anywherejs-template	\N	JavaScript	0	1	\N	0	2018-04-22 13:56:07	2018-12-27 20:32:18	2018-12-27 20:32:17
8468637	autoserialize	106	https://github.com/queso/autoserialize	\N	Ruby	0	0	\N	0	2013-02-27 21:25:23	2013-02-27 21:29:40	2013-02-27 21:26:09
38811	auto_follow	106	https://github.com/queso/auto_follow	Twitter auto follow script	Ruby	0	0	\N	2	2008-07-31 03:23:40	2019-08-13 10:30:27	2008-07-31 03:51:34
37236764	Beethub	106	https://github.com/queso/Beethub	Offers a simple management system for non-profits	JavaScript	0	0	\N	0	2015-06-11 00:18:18	2015-06-11 00:18:18	2015-06-11 00:20:52
31382103	boozio-web	106	https://github.com/queso/boozio-web	\N	HTML	0	0	\N	0	2015-02-26 15:31:31	2015-02-26 15:31:31	2015-02-26 15:31:53
21449498	chatApp	106	https://github.com/queso/chatApp	A simple app built during an AirPair session.	JavaScript	0	0	\N	1	2014-07-03 01:15:04	2014-07-09 03:33:45	2014-07-21 22:46:39
1331593	cijoe	106	https://github.com/queso/cijoe	CI Joe is a fun Continuous Integration server.	Ruby	0	0	\N	1	2011-02-05 12:31:48	2012-12-17 21:22:44	2011-02-21 19:27:00
5925340	cincyrb	106	https://github.com/queso/cincyrb	Cincinnati.rb web app	Ruby	0	0	\N	0	2012-09-23 16:24:34	2013-01-12 07:10:58	2012-10-03 03:35:52
46763957	crater-remote-conf	106	https://github.com/queso/crater-remote-conf	\N	CSS	0	0	\N	0	2015-11-24 01:15:27	2015-11-24 03:06:15	2016-07-13 12:50:31
40193924	divan	107	https://github.com/lancecarlson/divan	CouchDB implementation backed by PostgreSQL.	Go	0	0	\N	1	2015-08-04 12:48:22	2018-09-11 13:29:41	2015-08-10 19:08:27
325226	daemon-kit	106	https://github.com/queso/daemon-kit	Daemon Kit aims to simplify creating Ruby daemons by providing a sound application skeleton (through a generator), task specific generators (jabber bot, etc) and robust environment management code.	Ruby	1	0	\N	2	2009-10-02 23:26:23	2012-12-12 23:48:30	2009-11-22 18:28:46
7165568	dotfiles	106	https://github.com/queso/dotfiles	My OSX dotfiles	Shell	0	0	\N	2	2012-12-14 11:07:55	2018-09-13 11:23:12	2018-09-13 11:23:10
200472	dryopteris	106	https://github.com/queso/dryopteris	HTML sanitization using Nokogiri	Ruby	0	0	\N	0	2009-05-13 23:37:37	2013-11-21 06:52:35	2009-05-14 00:19:36
101798830	electron-next	106	https://github.com/queso/electron-next	Build Electron apps using Next.js	JavaScript	0	0	\N	0	2017-08-29 16:27:58	2017-08-29 16:27:59	2017-08-26 19:51:50
7174383	envelopes	106	https://github.com/queso/envelopes	A quick budgeting app based on the envelope system	Ruby	0	0	\N	0	2012-12-14 23:06:30	2014-06-13 02:38:09	2012-12-14 23:07:02
18659636	follower-down	106	https://github.com/queso/follower-down	Shutdown page for follower.io	\N	0	0	\N	0	2014-04-10 23:26:19	2014-04-11 01:30:45	2014-04-11 01:30:44
168896533	gatsby-remark-reading-time	106	https://github.com/queso/gatsby-remark-reading-time	Gatsby remark plugin to add an estimated reading time field to all remark nodes	JavaScript	0	0	\N	0	2019-02-02 23:14:31	2019-02-02 23:14:33	2019-01-08 19:14:03
1352864	general-hawk	106	https://github.com/queso/general-hawk	A Sinatra app to monitor multiple CIJoe Projects	Ruby	1	1	\N	2	2011-02-10 21:16:09	2013-10-24 11:39:52	2011-02-11 18:49:15
24003	github-services	106	https://github.com/queso/github-services	Official GitHub Services Integration	Ruby	0	0	\N	2	2008-06-10 12:35:13	2019-08-13 10:26:27	2008-12-08 17:41:17
66165981	GitHunt	106	https://github.com/queso/GitHunt	An Apollo full-stack example app: vote for your favorite GitHub repos!	JavaScript	0	0	\N	0	2016-08-20 17:08:23	2016-08-20 17:08:24	2016-08-19 01:43:10
32871523	give	106	https://github.com/queso/give	A donation page for Meteor using Stripe	JavaScript	0	0	\N	1	2015-03-25 11:59:43	2015-04-09 09:49:40	2015-03-26 15:59:47
46374401	guide	106	https://github.com/queso/guide	How do I use Meteor?	JavaScript	0	0	\N	0	2015-11-17 18:46:02	2015-11-17 18:46:03	2015-11-17 18:51:17
764990	homebrew	106	https://github.com/queso/homebrew	The missing package manager for OS X	Ruby	1	0	\N	0	2010-07-08 21:06:47	2013-12-13 23:23:18	2010-07-08 23:32:41
204353593	homebridge-ecobee3-lite-sensors	106	https://github.com/queso/homebridge-ecobee3-lite-sensors	Homebridge plugin that exposes Ecobee 3 Lite sensors as HomeKit accessories	\N	0	1	\N	0	2019-08-25 18:49:56	2019-08-25 18:49:56	2019-08-25 18:49:57
37025	hoptoad_notifier	106	https://github.com/queso/hoptoad_notifier	Reports exceptions to Hoptoad	Ruby	2	1	\N	2	2008-07-24 22:15:00	2019-08-13 10:29:55	2017-09-26 21:54:57
16139459	impressionist	106	https://github.com/queso/impressionist	A fork that supports redis	Ruby	0	0	\N	0	2014-01-22 11:05:55	2014-01-22 11:09:06	2014-01-22 11:09:05
87179	integrity-campfire	106	https://github.com/queso/integrity-campfire	Campfire notifier for the Integrity continuous integration server	Ruby	11	0	\N	2	2008-12-08 17:36:12	2019-08-13 10:46:23	2008-12-08 20:31:37
168902660	joshowens.dev	106	https://github.com/queso/joshowens.dev	My blog	JavaScript	0	0	\N	0	2019-02-03 00:48:50	2019-12-09 11:45:52	2019-12-09 11:45:50
97150	aasm	107	https://github.com/lancecarlson/aasm	AASM - State machines for Ruby classes	Ruby	0	0	\N	2	2008-12-27 07:13:40	2019-08-13 10:50:11	2008-12-24 13:21:46
50970	account_location	107	https://github.com/lancecarlson/account_location	Account Location Plugin	Ruby	0	0	\N	2	2008-09-09 16:34:50	2019-08-13 10:34:38	2008-09-09 16:37:12
164952392	activemerchant_basecommerce	107	https://github.com/lancecarlson/activemerchant_basecommerce	\N	Ruby	0	0	\N	0	2019-01-09 21:08:10	2019-01-10 20:15:35	2019-01-10 20:15:34
159758711	active_merchant	107	https://github.com/lancecarlson/active_merchant	Active Merchant is a simple payment abstraction library extracted from Shopify. The aim of the project is to feel natural to Ruby users and to abstract as many parts as possible away from the user to offer a consistent interface across all supported gateways.	Ruby	0	0	\N	0	2018-11-30 00:44:22	2019-01-15 02:10:21	2019-06-18 18:41:34
488647	acts-as-taggable-on	107	https://github.com/lancecarlson/acts-as-taggable-on	A tagging plugin for Rails applications that allows for custom tagging along dynamic contexts.	Ruby	1	0	\N	1	2010-01-26 00:27:36	2012-12-13 20:23:18	2010-01-26 00:34:20
184746	altered_beast	107	https://github.com/lancecarlson/altered_beast	Ground-up rewrite of Beast, a Ruby on Rails forum.	Ruby	0	0	\N	2	2009-04-24 15:55:45	2019-08-13 11:21:04	2008-10-14 21:04:42
180681	amfruby	107	https://github.com/lancecarlson/amfruby	Completely standalone Ruby library for speaking flash's AMF protocol	Ruby	0	0	\N	3	2009-04-20 07:12:10	2019-08-13 11:19:40	2009-04-20 07:12:37
4028	anvil	107	https://github.com/lancecarlson/anvil	Ruby on Anvils ;)	Ruby	3	0	\N	34	2008-03-15 16:29:01	2020-11-30 06:22:44	2008-08-17 08:37:01
133543649	authy-ruby	107	https://github.com/lancecarlson/authy-ruby	Ruby library to access the authy API	Ruby	0	0	\N	0	2018-05-15 13:26:25	2018-09-25 18:21:07	2018-05-15 13:29:22
131636221	bootstrap_form	107	https://github.com/lancecarlson/bootstrap_form	Official repository of the bootstrap_form gem, a Rails form builder that makes it super easy to create beautiful-looking forms using Bootstrap 4	Ruby	0	0	\N	0	2018-04-30 16:11:58	2018-07-20 12:16:11	2018-07-20 12:16:07
43971844	bosh-lite	107	https://github.com/lancecarlson/bosh-lite	A lite development env for BOSH	Shell	0	0	\N	0	2015-10-09 15:03:31	2020-09-23 17:11:59	2015-10-09 15:04:50
14721932	cch	107	https://github.com/lancecarlson/cch	CouchDB CLI tool.	Go	0	0	\N	0	2013-11-26 14:13:55	2013-11-26 15:33:24	2013-11-26 15:33:20
88471	cheap_chronic	107	https://github.com/lancecarlson/cheap_chronic	A simplified version of the chronic gem. (I had bad experiences with the current chronic implementation)	Ruby	1	0	\N	5	2008-12-10 20:02:22	2019-08-13 10:46:52	2008-12-25 09:29:36
118793670	chrono	107	https://github.com/lancecarlson/chrono	Date and time library for Rust	Rust	0	0	\N	0	2018-01-24 14:48:38	2018-01-24 14:48:40	2018-01-24 21:55:11
94256669	cookie-rs	107	https://github.com/lancecarlson/cookie-rs	HTTP cookie parsing and cookie jar management for rust	Rust	0	0	\N	0	2017-06-13 17:50:34	2019-04-30 23:45:07	2017-06-13 17:52:21
1760088	corpus	107	https://github.com/lancecarlson/corpus	Corpus.js is a Javascript framework for large client side web applications 	JavaScript	1	0	\N	15	2011-05-17 06:40:16	2019-05-31 17:38:02	2011-05-18 10:10:17
7550739	couchgo	107	https://github.com/lancecarlson/couchgo	CouchDB Client for Go. Supports BulkSave and emulates couch.js API	Go	4	1	\N	23	2013-01-10 21:27:53	2020-07-14 08:19:17	2016-11-06 15:11:09
10022290	couchin.go	107	https://github.com/lancecarlson/couchin.go	Utilities for bulk updating data in couchdb	Go	0	0	\N	1	2013-05-12 22:27:16	2016-10-18 08:08:41	2013-05-15 12:41:11
9985646	couchout.go	107	https://github.com/lancecarlson/couchout.go	Utilities for bulk updating data in couchdb	Go	0	0	\N	3	2013-05-10 13:40:26	2016-10-18 08:08:42	2013-05-15 15:29:23
25376073	dbfcsv	107	https://github.com/lancecarlson/dbfcsv	Simple CLI to convert dbf files to csv	Go	3	0	\N	2	2014-10-17 17:35:54	2020-07-02 16:34:54	2019-03-20 20:16:40
129843594	devise	107	https://github.com/lancecarlson/devise	Flexible authentication solution for Rails with Warden.	Ruby	0	0	\N	0	2018-04-17 00:57:59	2020-01-11 10:32:58	2018-04-17 01:03:16
97064292	diesel	107	https://github.com/lancecarlson/diesel	A safe, extensible ORM and Query Builder for Rust	Rust	0	0	\N	0	2017-07-12 21:49:36	2017-07-12 21:49:38	2017-08-16 03:30:33
455732	dm-mongo-adapter	107	https://github.com/lancecarlson/dm-mongo-adapter	Mongo DataMapper Adapter	Ruby	1	0	\N	1	2010-01-02 02:22:41	2012-12-13 19:21:33	2010-01-04 18:31:35
113968	dm-more	107	https://github.com/lancecarlson/dm-more	Extras for DataMapper, including bridges to DataObjects::Migrations and Merb::DataMapper	Ruby	0	0	\N	2	2009-01-24 17:43:16	2019-08-13 10:55:56	2009-01-25 03:41:31
24194197	docker-heroku-sqlite3	107	https://github.com/lancecarlson/docker-heroku-sqlite3	\N	Shell	0	0	\N	0	2014-09-18 12:42:42	2014-09-18 12:54:12	2014-09-18 12:54:12
34963723	docs	107	https://github.com/lancecarlson/docs	The code generating SendGrid's documentation. Please feel free to make pull requests, if there's anything you feel we could do better!	HTML	0	0	\N	0	2015-05-02 18:21:18	2015-05-02 18:25:02	2015-05-02 18:25:02
40261007	elderberries	107	https://github.com/lancecarlson/elderberries	An authentication microservice with OAuth2 support	\N	0	0	\N	0	2015-08-05 15:04:52	2015-08-05 15:04:52	2015-08-05 15:04:52
280367	eugene	107	https://github.com/lancecarlson/eugene	Evolve your programs! Eugenics applied to software.	\N	0	0	\N	5	2009-08-17 18:20:11	2013-10-26 20:38:48	2009-08-17 19:27:13
806724	exception_notification	107	https://github.com/lancecarlson/exception_notification	Exception Notifier Plugin for Rails	Ruby	1	0	\N	1	2010-07-30 00:42:26	2012-12-14 22:51:39	2010-07-30 00:43:38
941141	.dotfiles	108	https://github.com/drnic/.dotfiles	\N	Shell	1	0	\N	11	2010-09-26 18:53:20	2019-08-13 11:37:02	2012-04-28 11:33:20
5991198	4th_and_king	108	https://github.com/drnic/4th_and_king	README only idea	\N	0	0	\N	1	2012-09-27 22:42:07	2013-10-21 16:46:56	2012-09-27 23:17:06
183439	8cpj	108	https://github.com/drnic/8cpj	the octocat's pajamas: this is a fork of why's original project. I added unit tests and refactored the project. He didn't want them. Go back to the early commits to find where why left off. 	JavaScript	1	0	\N	3	2009-04-23 06:35:51	2019-08-13 11:20:38	2009-04-23 07:51:21
243098030	agent	108	https://github.com/drnic/agent	The Buildkite Agent is an open-source toolkit written in Golang for securely running build jobs on any device or network	\N	0	0	\N	0	2020-02-25 17:42:07	2020-02-25 17:42:09	2020-02-26 18:22:55
78584210	alexa-skill-dice-roll	108	https://github.com/drnic/alexa-skill-dice-roll	\N	Go	0	0	\N	0	2017-01-10 21:29:44	2017-01-10 21:30:03	2017-01-10 22:07:42
194688887	aliyun-cli	108	https://github.com/drnic/aliyun-cli	Alibaba Cloud CLI	Go	0	0	\N	0	2019-07-01 11:29:29	2019-07-01 11:29:33	2019-07-09 04:04:58
3973266	appscrolls	108	https://github.com/drnic/appscrolls	The App Scrolls is a magical tool to generate new Rails apps and modify existing Rails applications (coming) to include your favourite, powerful magic. 	Ruby	29	24	\N	221	2012-04-09 13:16:29	2021-01-13 16:34:10	2013-06-24 20:49:30
107863129	apt-buildpack	108	https://github.com/drnic/apt-buildpack	\N	Go	0	0	\N	0	2017-10-22 10:17:52	2017-10-22 10:17:54	2017-10-26 19:07:10
169654131	ardupilot	108	https://github.com/drnic/ardupilot	ArduPlane, ArduCopter, ArduRover source	C++	0	0	\N	1	2019-02-07 20:39:30	2019-05-11 06:46:04	2019-04-03 22:34:06
170803011	ardupilot-ci	108	https://github.com/drnic/ardupilot-ci	\N	Shell	0	0	\N	0	2019-02-15 02:43:32	2019-02-23 20:54:44	2019-02-23 20:54:43
170042526	ardupilot_wiki	108	https://github.com/drnic/ardupilot_wiki	Repository for Ardupilot wiki issues and wiki-specific website infrastructure.	Python	0	0	\N	0	2019-02-10 22:08:09	2019-02-10 22:08:16	2019-03-27 00:51:48
16535387	asciidoc-samples	108	https://github.com/drnic/asciidoc-samples	A repository of AsciiDoc source files for testing AsciiDoc rendering on GitHub.	\N	0	0	\N	0	2014-02-05 02:49:48	2014-02-05 02:49:51	2014-02-04 06:19:13
840700	associated_with	108	https://github.com/drnic/associated_with	Ruby on Rails check if object1 is associated object2	Ruby	1	0	\N	2	2010-08-16 06:49:45	2019-07-08 06:32:28	2010-08-16 06:50:12
138250853	authrecipe	108	https://github.com/drnic/authrecipe	A recipe for using Buffalo & Password Authentication	Go	0	0	\N	0	2018-06-22 00:36:21	2019-07-08 06:45:40	2018-06-22 00:36:34
209930261	awesome-operators	108	https://github.com/drnic/awesome-operators	A resource tracking a number of Operators out in the wild.	\N	0	0	\N	0	2019-09-21 02:29:44	2019-09-21 02:29:46	2019-09-21 02:30:43
118386078	awesome-oss-mentors	108	https://github.com/drnic/awesome-oss-mentors	List of OSS contributors willing to help others with their first pull requests!	\N	0	0	\N	0	2018-01-21 22:20:00	2018-01-21 22:15:24	2018-01-28 21:32:40
29065650	aws_student_accounts	108	https://github.com/drnic/aws_student_accounts	Manage student AWS accounts in bulk	Ruby	1	0	\N	1	2015-01-10 15:56:13	2019-07-08 06:45:40	2015-01-12 21:08:32
16152369	babygopher-site	108	https://github.com/drnic/babygopher-site	Landing page for getting yourself the Baby Gopher badge for your first Golang projects	\N	4	2	\N	15	2014-01-22 18:57:31	2017-12-29 07:47:49	2015-03-21 05:43:08
1860280	Backbone.tmbundle	108	https://github.com/drnic/Backbone.tmbundle	\N	\N	2	1	\N	20	2011-06-07 11:44:29	2019-07-08 06:33:13	2011-08-22 21:09:29
16968551	baseimage-docker	108	https://github.com/drnic/baseimage-docker	A minimal Ubuntu base image modified for Docker-friendliness	Python	0	0	\N	0	2014-02-18 21:12:06	2019-07-08 06:44:46	2014-02-18 21:14:11
9839876	Bats.tmbundle	108	https://github.com/drnic/Bats.tmbundle	\N	\N	1	0	\N	10	2013-05-03 13:25:31	2019-07-16 07:14:41	2016-03-21 00:41:53
772384	bcat	108	https://github.com/drnic/bcat	A pipe to browser utility	Ruby	1	0	\N	1	2010-07-13 09:54:10	2012-12-14 21:43:52	2010-07-13 09:54:50
169643574	betaflight-configurator	108	https://github.com/drnic/betaflight-configurator	Cross platform configuration tool for the cleanflight firmware	JavaScript	0	0	\N	0	2019-02-07 19:13:51	2019-02-07 19:13:54	2019-02-07 19:14:03
61746	blinksale-greasemonkey	108	https://github.com/drnic/blinksale-greasemonkey	Greasemonkey/GreaseKit extensions for Blinksale	Ruby	1	0	\N	3	2008-10-10 23:48:14	2019-08-13 10:37:44	2008-10-11 11:14:07
254149	blue-ridge	108	https://github.com/drnic/blue-ridge	JavaScript BDD Rails Plugin (using Screw.Unit and env.js)	JavaScript	1	0	\N	7	2009-07-18 01:18:01	2019-07-08 06:30:57	2009-11-11 03:13:56
264621	blue-ridge-tmbundle	108	https://github.com/drnic/blue-ridge-tmbundle	TextMate support for the Blue Ridge JavaScript Testing Rails Plugin (Screw.Unit, Smoke, etc.)	Ruby	1	0	\N	3	2009-07-30 07:54:46	2019-07-08 06:30:57	2010-03-31 07:51:06
100653125	bolo-boshrelease	108	https://github.com/drnic/bolo-boshrelease	A BOSH release for deploying a Bolo Monitoring System	Shell	0	0	\N	0	2017-08-17 20:23:35	2017-08-17 20:23:36	2017-08-17 20:23:51
134195666	bom-charts	108	https://github.com/drnic/bom-charts	Mobile-friendly BOM charts	HTML	0	1	\N	1	2018-05-20 20:37:20	2019-07-08 06:46:25	2018-06-21 22:38:55
137306280	bom-charts-lsalt	108	https://github.com/drnic/bom-charts-lsalt	\N	TypeScript	0	0	\N	0	2018-06-14 01:31:24	2018-06-18 02:34:19	2018-06-18 02:34:18
9309401	bootstrap-cf-plugin	108	https://github.com/drnic/bootstrap-cf-plugin	\N	Ruby	0	0	\N	0	2013-04-08 20:55:39	2019-07-08 06:44:46	2013-05-24 18:20:38
130676613	conrod	109	https://github.com/lukesutton/conrod	An easy-to-use, 2D GUI library written entirely in Rust.	Rust	0	0	\N	0	2018-04-23 06:58:58	2018-04-23 06:59:00	2018-04-17 05:57:34
58017320	envenvenv	109	https://github.com/lukesutton/envenvenv	A Swift library for typed access to environment variables	Swift	0	0	\N	0	2016-05-03 23:39:19	2016-05-03 23:39:33	2016-06-05 06:38:07
122886521	fselect	109	https://github.com/lukesutton/fselect	Find files with SQL-like queries	Rust	0	0	\N	0	2018-02-25 20:09:28	2018-02-25 20:09:29	2018-02-25 17:56:33
54159358	hekk	109	https://github.com/lukesutton/hekk	Can you write HTML using pure Swift? Maybe? Let's find out!	Swift	0	3	\N	1	2016-03-17 20:57:31	2019-03-18 11:40:46	2017-07-11 03:58:25
125140775	MusicTheory	109	https://github.com/lukesutton/MusicTheory	Universal music theory library for iOS, macOS, tvOS and watchOS in Swift	Swift	0	0	\N	0	2018-03-13 23:03:45	2018-03-13 23:03:47	2018-01-26 23:13:46
64213886	olpej	109	https://github.com/lukesutton/olpej	An experiment with building declarative views in UIKit ala Elm, React etc.	Swift	0	0	\N	1	2016-07-26 07:50:42	2017-01-10 19:10:02	2016-08-15 05:25:34
74017599	qul	109	https://github.com/lukesutton/qul	An experiment with declarative transformation of JSON; NOT AN OBJECT MAPPER	Swift	0	0	\N	0	2016-11-17 08:45:43	2016-11-17 08:52:32	2016-11-20 09:59:18
206198311	training-kit	109	https://github.com/lukesutton/training-kit	Open source cheat sheets for Git and GitHub	\N	0	0	\N	0	2019-09-03 21:48:25	2019-09-03 21:48:27	2019-08-26 04:58:39
54069026	uut	109	https://github.com/lukesutton/uut	Can you write CSS using pure Swift? Yes you can.	Swift	1	8	\N	0	2016-03-16 18:51:18	2016-04-29 09:28:31	2017-09-26 21:55:24
55196752	ververver	109	https://github.com/lukesutton/ververver	A Swift library for defining versions, version requirements and making comparisons between them	Swift	0	0	\N	0	2016-03-31 23:10:21	2016-03-31 23:10:37	2016-04-01 06:01:51
58292525	xet	109	https://github.com/lukesutton/xet	An experiment in a small Swift web-framework	Swift	0	6	\N	0	2016-05-07 23:09:42	2016-05-07 23:10:00	2016-05-07 23:09:59
64124140	yopuy	109	https://github.com/lukesutton/yopuy	Type-safe glue for building REST APIs	Swift	0	7	\N	1	2016-07-25 07:04:47	2017-04-30 23:12:15	2017-05-03 06:51:41
87697843	yopuy-alamofire	109	https://github.com/lukesutton/yopuy-alamofire	Adds support for Alamofire to Yopuy	Swift	0	0	\N	0	2017-04-09 06:39:18	2017-04-09 06:40:03	2017-04-10 21:47:01
87694485	yopuy-unbox	109	https://github.com/lukesutton/yopuy-unbox	Adds support for Unbox to Yopuy	Swift	0	0	\N	0	2017-04-09 05:39:21	2017-04-09 05:39:55	2017-04-10 22:05:17
163060	aaws	110	https://github.com/danwrong/aaws	API wrapper for Amazon Associates Web Service.	Ruby	0	0	\N	2	2009-03-30 07:09:39	2019-08-13 11:13:36	2008-06-01 16:02:34
133181	acts-as-money	110	https://github.com/danwrong/acts-as-money	Extensions to Active Record for dealing with storing currency.  Compatible with Active Merchant.	Ruby	2	0	\N	7	2009-02-20 06:31:11	2019-08-13 11:02:22	2009-02-20 06:35:22
29848	ar-openid-store	110	https://github.com/danwrong/ar-openid-store	JanRain's OpenID store for ActiveRecord jammed into a gem	Ruby	5	1	\N	5	2008-06-29 20:27:55	2019-08-13 10:27:58	2008-06-29 20:28:20
133174	code-highlighter	110	https://github.com/danwrong/code-highlighter	A compact, extensible code highlighter written in JavaScript	JavaScript	8	3	\N	65	2009-02-20 06:21:55	2019-08-13 11:02:22	2016-10-20 23:51:01
395359	couchrestler	110	https://github.com/danwrong/couchrestler	A CouchDB interface for node.js written on top of Restler	JavaScript	0	0	\N	11	2009-12-04 11:54:08	2019-08-13 11:29:40	2009-12-04 17:49:35
184399602	danwebb.net	110	https://github.com/danwrong/danwebb.net	Personal site	JavaScript	0	0	\N	0	2019-05-01 07:17:16	2019-05-07 06:16:58	2019-05-07 06:16:57
153823	evil	110	https://github.com/danwrong/evil	A tool for creating websites from web service data.	Ruby	0	0	\N	4	2009-03-18 19:16:30	2019-08-13 11:10:22	2009-04-22 15:42:11
23876016	flight-sandbox	110	https://github.com/danwrong/flight-sandbox	Playing around with ideas for Flight	JavaScript	0	0	\N	0	2014-09-10 10:46:16	2014-09-10 10:58:13	2014-09-10 10:58:13
186788	google-analytics	110	https://github.com/danwrong/google-analytics	\N	Ruby	0	1	\N	7	2009-04-27 13:07:34	2019-08-13 11:21:47	2009-09-28 08:18:16
247122	httparty	110	https://github.com/danwrong/httparty	Makes http fun! Also, makes consuming restful web services dead easy.	Ruby	1	0	\N	2	2009-07-09 10:35:47	2013-10-10 02:33:52	2009-05-18 17:25:51
261684	iso_codes	110	https://github.com/danwrong/iso_codes	ISO code lookups in Ruby for Currencies, Countries and Languages.	Ruby	1	0	\N	7	2009-07-27 12:53:56	2016-01-23 23:47:51	2009-07-27 13:05:58
11666917	jasmine-flight	110	https://github.com/danwrong/jasmine-flight	Extensions to the Jasmine test framework for use with Flight	JavaScript	0	0	\N	0	2013-07-25 14:40:42	2013-07-26 21:35:37	2013-07-25 15:01:05
211390	jplayer	110	https://github.com/danwrong/jplayer	A Flash-based mp3 player plugin for jQuery originally written by Happy Worm	ActionScript	1	0	\N	5	2009-05-27 07:39:25	2016-06-10 22:48:13	2009-05-27 07:39:50
4045794	jruby-rack	110	https://github.com/danwrong/jruby-rack	Rack for JRuby and Java appservers	Ruby	0	0	\N	2	2012-04-16 18:09:49	2016-01-23 23:47:35	2012-04-05 11:29:18
171498	liquid-inheritance	110	https://github.com/danwrong/liquid-inheritance	Django-style template inheritance for the Liquid templating language	\N	10	4	\N	21	2009-04-08 20:14:07	2019-08-13 11:16:29	2011-10-22 16:28:55
1486201	loadbuilder	110	https://github.com/danwrong/loadbuilder	Node package for building combine minified JavaScript files for use with Loadrunner	JavaScript	8	9	\N	24	2011-03-16 03:27:02	2020-12-25 19:56:06	2016-04-14 18:03:33
854358	loadrunner	110	https://github.com/danwrong/loadrunner	Simple, flexible and sane JavaScript loader and build tool for browsers.	JavaScript	39	14	\N	278	2010-08-22 02:56:38	2020-11-29 22:21:32	2016-04-07 15:37:25
133160	low-pro	110	https://github.com/danwrong/low-pro	Extensions to Prototype to aid in writing unobstrusive JavaScript	JavaScript	13	1	\N	100	2009-02-20 05:38:52	2020-08-12 00:06:21	2009-10-22 12:24:43
185	low-pro-for-jquery	110	https://github.com/danwrong/low-pro-for-jquery	A jQuery plugin version of the Low Pro behavior framework.	JavaScript	15	2	\N	134	2008-01-31 12:11:27	2019-08-13 10:21:20	2012-01-18 21:14:35
27575	merb_openid	110	https://github.com/danwrong/merb_openid	An OpenID Consumer plugin for Merb	Ruby	0	0	\N	10	2008-06-22 20:33:27	2019-08-13 10:27:22	2009-01-08 21:15:26
11667354	mocha-flight	110	https://github.com/danwrong/mocha-flight	Extensions to the Mocha test framework for use with Flight	JavaScript	0	0	\N	0	2013-07-25 15:02:57	2013-07-26 21:36:18	2013-07-25 15:35:38
170028	morph	110	https://github.com/danwrong/morph	Morph makes it easy to emerge Ruby class definitions at runtime. Mix with Hpricot for screen scrapping fun.	Ruby	1	0	\N	2	2009-04-07 05:29:48	2019-08-13 11:15:58	2009-04-07 05:51:38
248692	musicblog	110	https://github.com/danwrong/musicblog	A thing what we are making for Music Hack Day	Ruby	0	0	\N	2	2009-07-11 09:54:03	2013-10-10 02:33:54	2009-07-12 09:36:52
161395	rails	110	https://github.com/danwrong/rails	Ruby on Rails	Ruby	1	0	\N	2	2009-03-27 20:58:59	2019-08-13 11:12:59	2009-03-24 12:54:33
122548116	react-static	110	https://github.com/danwrong/react-static	⚛️ 🚀 A progressive static site generator for React.	JavaScript	0	0	\N	0	2018-02-22 20:30:23	2019-07-15 18:09:17	2018-02-22 19:08:26
43557465	reaction	110	https://github.com/danwrong/reaction	A React render server proof of concept	JavaScript	0	0	\N	0	2015-10-02 11:30:12	2015-10-02 11:30:13	2015-10-02 10:34:17
385260	restler	110	https://github.com/danwrong/restler	REST client library for node.js	JavaScript	402	104	\N	2007	2009-11-25 12:27:22	2021-01-13 22:11:00	2019-07-10 08:40:53
146575	rugalytics	110	https://github.com/danwrong/rugalytics	Rugalytics is a Ruby Google Analytics API.	Ruby	0	0	\N	4	2009-03-09 13:26:08	2019-08-13 11:07:54	2009-04-06 15:08:44
133189	sumo	110	https://github.com/danwrong/sumo	A microformat parser framework for JavaScript	\N	5	0	\N	19	2009-02-20 06:42:17	2019-08-13 11:02:23	2009-04-03 21:08:40
247001	twaudio-ruby	110	https://github.com/danwrong/twaudio-ruby	Ruby bindings for the twaud.io API	Ruby	0	0	\N	2	2009-07-09 07:15:25	2013-10-10 02:34:03	2009-07-09 07:25:18
307492872	2020.demuxed.com	111	https://github.com/hcatlin/2020.demuxed.com	2020 Demuxed Website!	\N	0	0	\N	0	2020-10-26 17:13:31	2020-10-26 17:13:33	2020-10-26 17:33:14
281708309	activeadmin	111	https://github.com/hcatlin/activeadmin	The administration framework for Ruby on Rails applications.	Ruby	0	0	\N	0	2020-07-22 12:02:19	2020-10-19 13:51:45	2020-10-19 15:01:44
1021957	active_merchant	111	https://github.com/hcatlin/active_merchant	Active Merchant is a simple payment abstraction library used in and sponsored by Shopify. It is written by Tobias Luetke, Cody Fauser, and contributors. The aim of the project is to feel natural to Ruby users and to abstract as many parts as possible away from the user to offer a consistent interface across all supported gateways.	Ruby	0	0	\N	1	2010-10-25 08:35:10	2012-12-15 19:53:18	2010-02-11 10:46:34
47789036	appsignal	111	https://github.com/hcatlin/appsignal	AppSignal agent	Ruby	0	0	\N	0	2015-12-10 19:40:12	2015-12-10 19:40:13	2015-12-10 19:45:14
18105975	askr-api	111	https://github.com/hcatlin/askr-api	\N	Ruby	0	0	\N	8	2014-03-25 12:44:33	2019-08-13 12:38:26	2015-03-26 13:08:27
32867895	askr-ui	111	https://github.com/hcatlin/askr-ui	\N	HTML	0	3	\N	4	2015-03-25 10:58:41	2018-07-22 14:38:22	2016-04-27 14:44:07
45567617	benchmark	111	https://github.com/hcatlin/benchmark	PostCSS benchmarks	JavaScript	0	0	\N	0	2015-11-04 19:09:53	2015-11-04 19:09:54	2015-10-25 22:33:50
17382994	biller	111	https://github.com/hcatlin/biller	My treehouse course application	Ruby	0	0	\N	0	2014-03-03 19:52:33	2014-03-05 21:41:27	2014-03-05 21:41:27
17003089	bob	111	https://github.com/hcatlin/bob	A Simple Haml/Sass builder for multi-platform HTML5 apps	JavaScript	1	0	\N	23	2014-02-19 20:37:03	2021-01-04 12:35:11	2014-12-29 16:00:31
751904	carrierwave	111	https://github.com/hcatlin/carrierwave	Classier solution for file uploads in Ruby for Rack, Rails, Merb and Sinatra	Ruby	1	0	\N	1	2010-07-01 15:15:08	2014-04-23 02:41:27	2010-07-02 10:56:39
980863	catlindesign	111	https://github.com/hcatlin/catlindesign	\N	Ruby	0	0	\N	1	2010-10-12 07:17:12	2018-07-22 14:38:04	2016-05-25 18:59:06
51413009	clean	111	https://github.com/hcatlin/clean	Apply for CalFresh in SF	Ruby	0	0	\N	0	2016-02-09 23:00:38	2016-02-09 23:00:39	2016-02-09 23:01:30
1821974	compass	111	https://github.com/hcatlin/compass	Compass is a Stylesheet Authoring Environment that makes your website design simpler to implement and easier to maintain.	Ruby	0	0	\N	1	2011-05-30 12:17:58	2014-06-03 23:17:34	2018-05-04 11:59:13
3371316	compass-style.org	111	https://github.com/hcatlin/compass-style.org	The Compass Stylesheet Framework's Website	Ruby	0	0	\N	1	2012-02-06 19:35:58	2014-06-04 17:30:06	2010-10-11 06:45:40
31782888	data	111	https://github.com/hcatlin/data	A data persistence library for Ember.js.	JavaScript	0	0	\N	0	2015-03-06 15:28:03	2015-04-06 10:56:06	2015-04-06 10:56:05
15094180	dechor	111	https://github.com/hcatlin/dechor	Server that let's you dictate what its response should be.	Go	0	0	\N	0	2013-12-10 22:49:30	2013-12-10 22:49:31	2013-12-06 05:02:03
182355	dot-rot	111	https://github.com/hcatlin/dot-rot	My dotfiles are better than your dotfiles.	Ruby	1	0	\N	6	2009-04-22 00:05:34	2019-08-13 11:20:14	2009-04-22 01:12:31
55639497	dotfiles	111	https://github.com/hcatlin/dotfiles	\N	Shell	0	0	\N	0	2016-04-06 17:48:53	2016-04-06 17:48:54	2016-04-06 17:53:28
28751841	ember-cli	111	https://github.com/hcatlin/ember-cli	\N	JavaScript	0	0	\N	0	2015-01-03 16:54:29	2015-01-03 16:54:30	2015-01-03 16:55:08
34403522	ember-youtube	111	https://github.com/hcatlin/ember-youtube	A simple Ember.js component to load, play and control YouTube videos using the iframe API	JavaScript	0	0	\N	0	2015-04-22 13:57:19	2015-04-23 14:46:02	2015-04-23 14:46:01
25224067	foundation	111	https://github.com/hcatlin/foundation	The most advanced responsive front-end framework in the world. Quickly create prototypes and production code for sites and apps that work on any kind of device.	CSS	0	0	\N	0	2014-10-14 17:00:01	2019-09-09 18:40:10	2014-10-14 17:02:28
3509122	gitlabhq	111	https://github.com/hcatlin/gitlabhq	Project management and code hosting  application. Follow us on twitter @gitlabhq	Ruby	0	0	\N	1	2012-02-21 20:50:21	2013-01-07 21:08:02	2012-02-21 20:31:33
253127	Grammar-Army	111	https://github.com/hcatlin/Grammar-Army	Correcting Wikipedia's Grammar	JavaScript	0	0	\N	1	2009-07-16 20:39:20	2014-04-14 11:57:22	2009-07-16 20:41:08
810510	hamgen	111	https://github.com/hcatlin/hamgen	Rails 3 template. Wow!!!	Ruby	1	0	\N	6	2010-08-01 09:22:05	2014-02-18 10:12:08	2010-10-12 10:41:39
26288740	heroku-buildpack-ruby-octopress	111	https://github.com/hcatlin/heroku-buildpack-ruby-octopress	Fork of Heroku's Ruby Buildpack for Cedar with added support for compiling Octopress sites. See the blog post for specifics:	Ruby	0	0	\N	0	2014-11-06 18:33:34	2014-11-06 18:36:43	2014-11-06 18:36:42
816883	homebrew	111	https://github.com/hcatlin/homebrew	The missing package manager for OS X.	Ruby	1	0	\N	1	2010-08-04 09:28:04	2013-12-13 23:23:18	2010-08-04 10:27:36
7042684	icinga	111	https://github.com/hcatlin/icinga	\N	Ruby	0	0	\N	0	2012-12-06 18:45:08	2014-06-06 09:33:33	2012-12-06 18:47:40
183073	image_browser	111	https://github.com/hcatlin/image_browser	Sinatra based image broswer for Reuters images	Ruby	0	0	\N	3	2009-04-22 18:58:41	2019-08-13 11:20:30	2009-05-02 17:58:21
1088126	image_science	111	https://github.com/hcatlin/image_science	\N	Ruby	0	0	\N	1	2010-11-17 08:50:40	2012-12-15 21:55:40	2010-11-17 08:56:04
169593120	jenns_closet	111	https://github.com/hcatlin/jenns_closet	A Modern Take on Cher's Closet from Clueless	TypeScript	0	0	\N	0	2019-02-07 13:23:55	2019-02-08 16:58:30	2019-02-08 16:58:52
49114199	pg_partman	112	https://github.com/jfrost/pg_partman	Partition management extention for PostgreSQL	PLpgSQL	0	0	\N	0	2016-01-06 03:19:15	2018-04-13 19:18:34	2015-11-17 19:59:53
50887428	puppetlabs-logentries	112	https://github.com/jfrost/puppetlabs-logentries	Installs the logentries agent	Puppet	0	0	\N	0	2016-02-02 00:16:28	2016-02-02 00:16:29	2016-02-04 19:16:57
46940643	s3cmd	112	https://github.com/jfrost/s3cmd	Official s3cmd repo -- Command line tool for managing Amazon S3 and CloudFront services	Python	0	0	\N	0	2015-11-26 15:57:48	2015-11-26 15:57:50	2015-11-26 15:38:50
15084851	salt	112	https://github.com/jfrost/salt	Central system and configuration manager 	Python	1	0	\N	0	2013-12-10 15:56:39	2013-12-10 17:31:21	2013-12-10 17:06:43
83915127	scale-15x-talk	112	https://github.com/jfrost/scale-15x-talk	Scripts and SQL from my talk at SCALE 15x	Shell	1	0	\N	1	2017-03-04 15:25:57	2017-03-04 22:13:30	2017-03-04 15:38:58
37937147	the-art-of-command-line	112	https://github.com/jfrost/the-art-of-command-line	Master the command line, in one page	\N	1	0	\N	0	2015-06-23 15:28:07	2015-06-23 15:27:23	2015-06-23 15:38:18
25713621	wal-e	112	https://github.com/jfrost/wal-e	Simple Continuous Archiving for Postgres	Python	0	0	\N	0	2014-10-24 21:58:06	2014-10-28 19:02:24	2014-10-28 19:15:48
2954	acts_as_taggable_on_steroids	113	https://github.com/mattetti/acts_as_taggable_on_steroids	(OBSOLETE) This plugin is based on acts_as_taggable by DHH but includes extras	Ruby	21	0	\N	154	2008-03-07 15:13:34	2019-09-03 08:23:59	2013-03-03 22:43:37
5925146	adCleanerChromeExt	113	https://github.com/mattetti/adCleanerChromeExt	Test Chrome extension	JavaScript	0	0	\N	0	2012-09-23 16:00:41	2013-12-02 00:30:50	2012-09-23 16:04:04
36413888	agouti	113	https://github.com/mattetti/agouti	A WebDriver client and acceptance testing framework for Go	Go	0	0	\N	0	2015-05-28 01:04:58	2015-05-28 01:04:59	2015-05-27 11:00:08
11269848	airbrake-go	113	https://github.com/mattetti/airbrake-go	Go library to report errors to airbrake and compatible servers	Go	0	0	\N	1	2013-07-08 22:29:48	2015-08-27 23:48:16	2013-07-08 22:35:42
8716934	Andromeda	113	https://github.com/mattetti/Andromeda	The goal is to provide a highly concurrent public facing API that dispatches requests to other APIs via different protocols (HTTP, Thrift..)	Scala	0	0	\N	1	2013-03-11 22:01:48	2013-12-06 09:28:12	2013-03-29 22:14:22
15668349	api	113	https://github.com/mattetti/api	Golang package to wrap web API endpoints	Go	1	0	\N	0	2014-01-06 05:47:28	2014-01-07 05:17:49	2014-01-07 05:17:48
239052	apple-remote-wrapper	113	https://github.com/mattetti/apple-remote-wrapper	fork of Martin Kahr work on an Apple Remote Wrapper	Objective-C	1	0	\N	8	2009-06-29 14:02:54	2014-01-17 20:49:20	2010-09-08 04:05:24
214487	approval_tests	113	https://github.com/mattetti/approval_tests	Approval testing for specs and unit tests	Ruby	1	0	\N	2	2009-05-30 19:11:32	2012-12-12 20:27:13	2009-05-30 19:35:52
2588	ar-backup	113	https://github.com/mattetti/ar-backup	Active Record backup is a Rails plugin which lets you backup your database schema and content in a schema.rb file and fixtures.	Ruby	2	0	\N	13	2008-03-05 03:05:03	2019-08-13 10:21:46	2008-03-26 16:48:01
35383	artist_portfolio	113	https://github.com/mattetti/artist_portfolio	Shoes app displaying an artist portfolio using Flickr as a source for content	Ruby	0	0	\N	4	2008-07-19 03:11:36	2019-08-13 10:29:27	2008-07-19 03:15:21
4496	attachment_fu	113	https://github.com/mattetti/attachment_fu	Treat an ActiveRecord model as a file attachment, storing its patch, size, content type, etc.	Ruby	0	0	\N	3	2008-01-14 12:51:56	2019-08-13 10:22:09	2008-03-19 01:24:51
25104493	audio	113	https://github.com/mattetti/audio	This is a playground, production ready code is available at https://github.com/go-audio/	Go	10	2	\N	63	2014-10-11 23:34:41	2020-10-04 10:53:06	2019-04-04 17:15:05
108205490	AudioNotebooks	113	https://github.com/mattetti/AudioNotebooks	Collection of notebooks and scripts related to audio processing and machine learning.	Jupyter Notebook	0	0	\N	1	2017-10-24 23:46:59	2019-09-28 19:04:18	2017-02-21 01:47:24
250385698	audioplayer	113	https://github.com/mattetti/audioplayer	A flutter plugin to play audio files ( ObjC/Java )	Dart	0	0	\N	1	2020-03-26 19:28:28	2020-10-07 10:39:12	2020-03-27 02:13:48
3519826	benchmarks	113	https://github.com/mattetti/benchmarks	\N	Ruby	1	0	\N	7	2012-02-22 20:28:33	2013-07-16 01:06:26	2012-02-23 21:45:47
4298626	benchmark_suite	113	https://github.com/mattetti/benchmark_suite	A set of enhancements to benchmark.rb	Ruby	0	0	\N	1	2012-05-11 12:33:37	2013-01-09 01:38:46	2012-05-11 12:37:02
353203	bert	113	https://github.com/mattetti/bert	BERT (Binary ERlang Term) serialization library for Ruby.	Ruby	1	0	\N	1	2009-10-28 17:30:22	2012-12-13 00:35:38	2009-10-28 16:58:20
228915525	billmonger	113	https://github.com/mattetti/billmonger	Dead simple one-page PDF invoice generator. Write YAML, get simple, pretty invoices.	Go	0	0	\N	0	2019-12-18 17:22:30	2020-01-30 14:30:10	2020-01-30 14:30:08
12794	book_mdar	113	https://github.com/mattetti/book_mdar	Life On The Edge With Merb, DataMapper & RSpec	Ruby	0	0	\N	3	2008-04-27 03:39:07	2019-08-13 10:23:38	2008-12-01 05:55:42
107354489	bootstrap	113	https://github.com/mattetti/bootstrap	Tools to bootstrap micro computers	Go	0	0	\N	0	2017-10-18 01:28:36	2017-10-18 01:28:38	2017-12-16 18:26:29
8568036	bottetti	113	https://github.com/mattetti/bottetti	my irc bot	CoffeeScript	0	0	\N	3	2013-03-04 21:06:08	2017-07-06 01:14:44	2014-01-02 21:15:16
3412656	Box2d	113	https://github.com/mattetti/Box2d	My Box2d fork which has the iPhone TestBed compiling under Xcode4	C++	1	0	\N	5	2012-02-10 23:09:32	2019-10-23 12:38:34	2012-02-10 23:52:57
4643308	BubbleWrap	113	https://github.com/mattetti/BubbleWrap	Cocoa wrappers and helpers for RubyMotion (Ruby for iOS) - Making Cocoa APIs more Ruby like, one API at a time. Fork away and send your pull requests.	Ruby	6	0	\N	64	2012-06-12 18:31:20	2020-07-01 11:16:39	2012-07-26 02:39:40
11431097	bugsnag-go	113	https://github.com/mattetti/bugsnag-go	bugsnag.com API client in Go	Go	1	0	\N	1	2013-07-15 16:07:11	2014-06-30 00:54:51	2014-06-11 12:05:16
11442605	bugsnag-ios	113	https://github.com/mattetti/bugsnag-ios	\N	Objective-C	1	1	\N	0	2013-07-16 03:42:35	2013-09-17 23:20:35	2017-09-26 21:55:51
632317	bundler	113	https://github.com/mattetti/bundler	Manage your application's gem dependencies with less pain	Ruby	1	0	\N	1	2010-04-27 18:44:26	2020-01-09 22:11:21	2013-05-12 07:25:39
135242992	cbc	113	https://github.com/mattetti/cbc	CBC/radio-canada has great content and in some cases, one might be interested in keeping a backup	Go	1	0	\N	2	2018-05-29 01:56:55	2020-07-26 08:18:29	2020-05-08 22:43:32
155617172	chidley-stein	113	https://github.com/mattetti/chidley-stein	A hacky fork of chidley you probably shouldn't be using	Go	0	0	\N	0	2018-10-31 17:10:03	2018-11-02 00:48:35	2018-11-02 00:48:34
92186076	circbuf	113	https://github.com/mattetti/circbuf	Golang circular (ring) buffer	Go	0	0	\N	0	2017-05-23 12:01:29	2017-05-23 12:01:30	2017-05-24 15:57:54
151127584	1space	114	https://github.com/ctennis/1space	1space enables a single object namespace between object storage locations. 1space enables data lifecycling, migration, and data protection. 1space integrates with OpenStack Swift. The 1space connector is a container that runs in the cloud.	Python	0	0	\N	0	2018-10-01 14:19:49	2019-06-11 19:48:32	2018-10-03 16:57:26
158855934	academic-kickstart	114	https://github.com/ctennis/academic-kickstart	Easily create a beautiful website using Academic and Hugo	Shell	0	0	\N	0	2018-11-23 14:30:21	2018-11-23 14:30:23	2018-11-17 20:44:00
93551709	amazon-ecs-agent	114	https://github.com/ctennis/amazon-ecs-agent	Amazon EC2 Container Service Agent	Go	0	0	\N	0	2017-06-06 15:40:30	2017-06-06 15:40:32	2018-08-09 17:54:15
46021016	assumerole	114	https://github.com/ctennis/assumerole	\N	Go	0	0	\N	0	2015-11-11 23:22:13	2015-11-11 23:23:08	2015-11-11 23:23:06
326063049	cargo	114	https://github.com/ctennis/cargo	The Rust package manager	\N	0	0	\N	0	2021-01-01 19:01:21	2021-01-01 19:01:23	2021-01-01 09:11:30
315319139	cloudmapper	114	https://github.com/ctennis/cloudmapper	 CloudMapper helps you analyze your Amazon Web Services (AWS) environments.	\N	0	0	\N	0	2020-11-23 10:10:17	2020-11-23 10:10:18	2020-11-23 10:22:02
503107	erlang-modbus	114	https://github.com/ctennis/erlang-modbus	A modbus RTU and TCP driver for erlang	Erlang	21	4	\N	31	2010-02-04 21:32:35	2020-11-30 17:47:02	2016-06-09 13:28:10
149319053	fluent-plugin-elb-log	114	https://github.com/ctennis/fluent-plugin-elb-log	Amazon ELB log input plugin	Ruby	0	0	\N	0	2018-09-18 13:28:20	2018-09-18 13:28:22	2018-08-09 23:03:02
134594120	grape	114	https://github.com/ctennis/grape	An opinionated framework for creating REST-like APIs in Ruby.	Ruby	0	0	\N	0	2018-05-23 13:00:58	2018-05-23 13:01:01	2018-05-30 09:07:56
158854831	hugo-academic	114	https://github.com/ctennis/hugo-academic	The website designer for Hugo. Build and deploy a beautiful website in minutes :rocket:	HTML	0	0	\N	0	2018-11-23 14:18:58	2020-09-02 15:43:31	2019-10-11 17:02:11
142146662	infra-cla	114	https://github.com/ctennis/infra-cla	Contributor License Agreement of the Jenkins project	Groovy	0	0	\N	0	2018-07-24 08:04:56	2018-07-24 08:05:01	2018-07-24 08:23:19
69605142	jenkins-infra	114	https://github.com/ctennis/jenkins-infra	Jenkins main control repo for R10k and our Puppet Enterprise managed infrastructure	Puppet	0	0	\N	0	2016-09-29 17:27:40	2016-09-29 17:27:41	2016-09-29 17:21:36
231816488	kubernetes-engine-samples	114	https://github.com/ctennis/kubernetes-engine-samples	Sample applications for Google Kubernetes Engine (GKE)	\N	0	0	\N	0	2020-01-04 16:22:52	2020-01-04 16:22:54	2019-12-16 10:42:19
62500603	packaging	114	https://github.com/ctennis/packaging	Native packaging for Jenkins	Shell	0	0	\N	0	2016-07-03 11:38:03	2016-07-03 11:38:05	2016-07-11 12:57:52
174602752	rails	114	https://github.com/ctennis/rails	Ruby on Rails	Ruby	0	0	\N	0	2019-03-08 17:13:08	2019-03-08 17:13:30	2019-03-08 17:06:27
208865141	rds-snapshot-tool	114	https://github.com/ctennis/rds-snapshot-tool	The Snapshot Tool for Amazon RDS automates the task of creating manual snapshots, copying them into a different account and a different region, and deleting them after a specified number of days 	\N	0	0	\N	0	2019-09-16 15:05:20	2019-09-16 15:05:21	2019-09-16 07:26:50
126899623	recaptcha	114	https://github.com/ctennis/recaptcha	ReCaptcha helpers for ruby apps	Ruby	0	0	\N	0	2018-03-26 19:59:08	2018-03-26 19:59:10	2018-03-23 20:13:28
149528857	rusoto	114	https://github.com/ctennis/rusoto	AWS SDK for Rust	Rust	0	0	\N	0	2018-09-19 21:33:49	2018-09-19 21:33:54	2021-01-04 18:28:46
29141217	rust	114	https://github.com/ctennis/rust	a safe, concurrent, practical language	Rust	0	0	\N	0	2015-01-12 13:15:40	2015-01-12 13:15:52	2015-01-12 13:10:38
133401992	sanitize	114	https://github.com/ctennis/sanitize	Whitelist-based Ruby HTML and CSS sanitizer.	HTML	0	0	\N	0	2018-05-14 15:03:00	2018-05-14 15:03:02	2018-03-20 13:53:06
33619040	sc	114	https://github.com/ctennis/sc	\N	Rust	0	0	\N	0	2015-04-08 13:37:25	2015-04-08 13:37:39	2015-04-08 13:37:39
46980478	sneaker	114	https://github.com/ctennis/sneaker	A tool for securely storing secrets on S3 using Amazon KMS.	Go	0	0	\N	0	2015-11-27 11:00:54	2015-11-27 11:00:54	2015-10-07 18:26:19
16515150	swift3	114	https://github.com/ctennis/swift3	Swift3 Middleware for OpenStack Swift, allowing access to OpenStack swift via the Amazon S3 API.	Python	0	0	\N	0	2014-02-04 13:04:15	2020-12-02 04:44:52	2013-04-09 21:41:21
123498133	authlogic	115	https://github.com/lawrencepit/authlogic	A simple ruby authentication solution.	Ruby	0	0	\N	0	2018-03-01 19:09:46	2018-03-01 19:09:48	2018-03-05 00:32:00
460007	autosave_habtm	115	https://github.com/lawrencepit/autosave_habtm	Autosave for has_and_belongs_to_many as it should be	Ruby	0	0	\N	1	2010-01-05 21:13:49	2012-12-13 19:29:45	2010-01-05 21:15:49
137196970	aws-cloudformation-user-guide	115	https://github.com/lawrencepit/aws-cloudformation-user-guide	The open source version of the AWS CloudFormation User Guide	\N	0	0	\N	0	2018-06-13 06:57:05	2018-06-13 06:57:10	2018-06-13 03:17:39
164065100	aws-sdk-ruby	115	https://github.com/lawrencepit/aws-sdk-ruby	The official AWS SDK for Ruby.	Ruby	0	0	\N	0	2019-01-04 04:03:17	2019-01-04 04:03:32	2019-01-03 21:50:11
2194197	dalli	115	https://github.com/lawrencepit/dalli	High performance memcached client for Ruby	Ruby	0	0	\N	0	2011-08-11 19:30:06	2020-01-05 19:44:58	2012-03-29 22:25:27
1041096	dotfiles	115	https://github.com/lawrencepit/dotfiles	My dotfiles	Ruby	1	0	\N	1	2010-11-01 04:32:04	2013-11-26 01:31:02	2013-11-26 01:30:57
7968980	email_reply_parser	115	https://github.com/lawrencepit/email_reply_parser	A small ruby library to parse plain text email content to return only the reply.	Ruby	5	0	\N	13	2013-02-01 21:59:52	2019-08-13 12:15:29	2013-05-09 04:58:52
957865	Esoteric	115	https://github.com/lawrencepit/Esoteric	Esoteric	C	1	0	\N	0	2010-10-03 03:16:37	2020-01-05 19:44:35	2010-10-03 03:20:43
14865	exception_logger	115	https://github.com/lawrencepit/exception_logger	\N	Ruby	1	1	\N	2	2008-05-06 02:34:15	2020-01-05 19:44:26	2008-05-06 06:09:23
700454	exception_notification	115	https://github.com/lawrencepit/exception_notification	Exception Notifier Plugin for Rails	Ruby	1	0	\N	0	2010-06-02 23:54:12	2020-01-05 19:44:34	2010-08-06 05:11:10
223252	flavoured_markdown	115	https://github.com/lawrencepit/flavoured_markdown	Websafe Markdown with some extra flavour.	Ruby	0	0	\N	1	2009-06-10 02:32:20	2014-09-07 22:38:35	2009-10-09 19:28:42
2581446	haml-sprockets	115	https://github.com/lawrencepit/haml-sprockets	Use the awesome haml-js with sprockets	Ruby	0	0	\N	0	2011-10-15 08:42:16	2020-01-05 19:44:49	2011-10-15 08:44:05
9145594	html-pipeline	115	https://github.com/lawrencepit/html-pipeline	HTML processing filters and utilities	Ruby	0	0	\N	0	2013-04-01 07:50:07	2021-01-07 18:01:56	2013-03-29 14:09:17
3948092	mail	115	https://github.com/lawrencepit/mail	A Really Ruby Mail Library	Ruby	0	0	\N	1	2012-04-06 05:34:40	2013-06-27 00:10:39	2012-11-19 19:56:55
9046065	malihu-custom-scrollbar-plugin	115	https://github.com/lawrencepit/malihu-custom-scrollbar-plugin	jQuery custom scrollbar plugin utilizing jquery UI that's fully customizable with CSS. Features vertical/horizontal scrolling, mouse-wheel support, scroll easing, adjustable scrollbar height/width etc.	JavaScript	0	0	\N	0	2013-03-27 00:43:50	2013-03-31 11:48:53	2013-03-27 01:56:07
1107269	mustache	115	https://github.com/lawrencepit/mustache	Logic-less Ruby templates.	Ruby	0	0	\N	0	2010-11-23 19:49:44	2020-01-05 19:44:41	2010-11-26 01:13:03
2611552	node-date-utils	115	https://github.com/lawrencepit/node-date-utils	Date Pollyfills for Node.js and Browser	JavaScript	0	0	\N	0	2011-10-20 05:08:01	2020-01-05 19:44:54	2011-10-20 05:59:03
2314161	rack	115	https://github.com/lawrencepit/rack	a modular Ruby webserver interface	Ruby	0	0	\N	0	2011-09-02 11:07:49	2020-01-05 19:44:42	2011-09-07 19:13:34
2050422	rails	115	https://github.com/lawrencepit/rails	Ruby on Rails	Ruby	0	0	\N	1	2011-07-14 20:25:39	2015-03-09 21:47:33	2013-03-10 18:51:24
209469	remarkable_paperclip	115	https://github.com/lawrencepit/remarkable_paperclip	Remarkable matchers for Paperclip.	Ruby	0	0	\N	6	2009-05-25 05:21:38	2020-01-05 19:44:30	2010-06-05 10:18:16
2360780	ruby-git	115	https://github.com/lawrencepit/ruby-git	Ruby/Git is a Ruby library that can be used to create, read and manipulate Git repositories by wrapping system calls to the git binary.	Ruby	0	0	\N	0	2011-09-10 10:03:22	2020-01-05 19:44:48	2011-09-10 20:10:11
4058998	ruby-saml	115	https://github.com/lawrencepit/ruby-saml	SAML SSO for Ruby	Ruby	0	0	\N	2	2012-04-17 22:20:08	2014-03-24 14:30:48	2014-09-08 21:20:23
4166920	ruby-saml-idp	115	https://github.com/lawrencepit/ruby-saml-idp	SAML Identity Provider library in ruby	Ruby	91	9	\N	134	2012-04-28 08:57:27	2020-12-07 21:19:09	2018-06-08 03:18:13
125698479	sirp	115	https://github.com/lawrencepit/sirp	Secure (interoperable) Remote Password Auth (SRP-6a)	Ruby	0	0	\N	0	2018-03-18 03:24:29	2018-03-18 03:29:26	2018-03-18 03:29:25
170811	slick-grid	115	https://github.com/lawrencepit/slick-grid	Quite simply, SlickGrid is a JavaScript grid/spreadsheet component. 	\N	7	0	\N	15	2009-04-08 03:50:54	2020-01-05 19:44:21	2009-04-09 02:49:40
2707778	typhoeus	115	https://github.com/lawrencepit/typhoeus	Like a modern code version of the mythical beast with 100 serpent heads, Typhoeus runs HTTP requests in parallel while cleanly encapsulating handling logic.	Ruby	0	0	\N	1	2011-11-04 05:40:54	2013-01-04 11:54:00	2011-11-03 20:00:20
3393850	useragent2css	115	https://github.com/lawrencepit/useragent2css	User-Agent to CSS parser for ruby	Ruby	0	0	\N	1	2012-02-09 01:13:41	2013-12-08 04:16:09	2013-12-08 04:16:05
159959211	adventofcode2018	116	https://github.com/marcjeanson/adventofcode2018	\N	Elixir	0	0	\N	0	2018-12-01 13:38:04	2018-12-10 20:27:37	2018-12-10 20:27:36
225203688	adventofcode2019	116	https://github.com/marcjeanson/adventofcode2019	My clojure solutions to the advent of code 2019 puzzles	Clojure	0	0	\N	0	2019-12-01 14:53:23	2019-12-24 01:30:47	2019-12-24 01:30:45
64056	awesome_nested_set	116	https://github.com/marcjeanson/awesome_nested_set	An awesome replacement for acts_as_nested_set and better_nested_set.	Ruby	0	0	\N	1	2008-10-17 06:36:57	2019-08-13 10:38:23	2008-10-15 16:29:09
30415719	aws-flow-ruby	116	https://github.com/marcjeanson/aws-flow-ruby	\N	Ruby	0	0	\N	0	2015-02-06 12:23:17	2018-03-07 14:06:55	2015-01-27 22:52:13
2382547	bowling_kata	116	https://github.com/marcjeanson/bowling_kata	Bowling Kata in ruby	Ruby	0	0	\N	0	2011-09-13 22:22:27	2016-06-15 04:54:23	2011-09-13 22:22:53
193118289	cljs-ajax	116	https://github.com/marcjeanson/cljs-ajax	simple asynchronous Ajax client for ClojureScript and Clojure	Clojure	0	0	\N	0	2019-06-21 12:08:35	2019-06-21 12:08:38	2019-06-21 12:06:13
251483	default_value_for	116	https://github.com/marcjeanson/default_value_for	Provides a way to specify default values for ActiveRecord models	Ruby	1	0	\N	0	2009-07-15 00:27:11	2016-06-15 04:57:05	2009-07-15 00:36:15
1088317	devise_invitable	116	https://github.com/marcjeanson/devise_invitable	An invitation strategy for devise	Ruby	0	0	\N	0	2010-11-17 10:24:22	2016-06-15 04:54:37	2010-11-15 11:19:20
60329901	docs	116	https://github.com/marcjeanson/docs	Linode guides and tutorials.	\N	0	0	\N	0	2016-06-03 05:05:12	2016-06-03 01:47:42	2016-06-02 17:29:35
77926159	dotfiles	116	https://github.com/marcjeanson/dotfiles	@holman does dotfiles	Emacs Lisp	1	0	\N	0	2017-01-03 12:52:32	2020-03-13 06:34:24	2017-02-12 20:58:59
44477	emacs-config	116	https://github.com/marcjeanson/emacs-config	My emacs configuration setup.	Emacs Lisp	0	0	\N	1	2008-08-20 23:08:46	2019-08-13 10:32:19	2008-12-03 04:09:39
30493145	emacs-setup	116	https://github.com/marcjeanson/emacs-setup	My current emacs setup	Emacs Lisp	0	0	\N	0	2015-02-08 12:17:53	2015-05-08 11:24:47	2015-05-08 11:24:44
24844841	foundation_rails_helper	116	https://github.com/marcjeanson/foundation_rails_helper	Rails Helper for Zurb Fondation framework	Ruby	0	0	\N	0	2014-10-06 09:28:45	2014-10-06 10:15:41	2014-10-16 12:26:02
181467	is_taggable	116	https://github.com/marcjeanson/is_taggable	Tagging that doesn't want to be on steroids. It's skinny and happy to stay that way	Ruby	0	0	\N	1	2009-04-21 00:57:02	2019-08-13 11:19:56	2009-04-21 02:13:57
2041029	KanbanFU	116	https://github.com/marcjeanson/KanbanFU	The best kanban app ever!!!!	Ruby	0	0	\N	0	2011-07-13 06:13:53	2016-06-15 04:54:25	2011-10-08 04:23:19
7555188	marcjeanson.github.com	116	https://github.com/marcjeanson/marcjeanson.github.com	\N	JavaScript	0	0	\N	0	2013-01-11 04:21:10	2013-04-09 09:00:49	2013-01-11 04:28:06
2736271	microblog-api	116	https://github.com/marcjeanson/microblog-api	Clojure twitter style api	Clojure	0	0	\N	0	2011-11-08 17:26:03	2016-06-15 04:54:16	2011-11-08 20:28:09
1019530	mochaui	116	https://github.com/marcjeanson/mochaui	development tree for MochaUI	JavaScript	0	0	\N	0	2010-10-24 09:30:25	2016-06-15 04:54:42	2010-10-24 09:35:56
1024163	mootools-ujs	116	https://github.com/marcjeanson/mootools-ujs	MooTools driver for the Ruby on Rails 3 unobtrusive JavaScript API.	JavaScript	0	0	\N	0	2010-10-25 23:28:53	2016-06-15 04:54:40	2010-10-29 18:54:53
3017677	oh-my-zsh	116	https://github.com/marcjeanson/oh-my-zsh	A community-driven framework for managing your zsh configuration. Includes 40+ optional plugins (rails, git, OSX, hub, capistrano, brew, ant, macports, etc), over 80 terminal themes to spice up  your morning, and an auto-update tool so that makes it easy to keep up with the latest updates from the community.	Shell	0	0	\N	0	2011-12-20 04:16:03	2019-11-20 22:17:24	2012-03-12 12:42:15
2547498	peer_reviewer	116	https://github.com/marcjeanson/peer_reviewer	Sample application used for an upcoming presentation	Ruby	0	0	\N	0	2011-10-10 08:33:16	2016-06-15 04:54:22	2011-10-18 07:29:07
3256768	Pomodoroz	116	https://github.com/marcjeanson/Pomodoroz	\N	Ruby	3	0	\N	6	2012-01-24 13:13:10	2017-07-14 17:42:43	2012-01-25 21:02:03
15083436	prezto	116	https://github.com/marcjeanson/prezto	The configuration framework for Zsh	Shell	0	0	\N	0	2013-12-10 14:57:53	2014-10-18 08:41:37	2014-10-18 08:44:27
47409036	rails	116	https://github.com/marcjeanson/rails	Ruby on Rails	Ruby	0	0	\N	0	2015-12-04 12:34:56	2015-12-04 12:35:27	2015-12-04 08:42:58
1510250	rhodes_presentation	116	https://github.com/marcjeanson/rhodes_presentation	\N	\N	0	0	\N	0	2011-03-22 03:53:51	2016-06-15 04:54:26	2011-03-22 04:00:23
3714073	savon	116	https://github.com/marcjeanson/savon	Heavy metal Ruby SOAP client	Ruby	0	0	\N	0	2012-03-14 00:13:23	2016-06-15 04:57:04	2012-03-14 00:15:56
146600	slicehost	116	https://github.com/marcjeanson/slicehost	Capistrano recipes for setting up and deploying to Slicehost	Ruby	0	0	\N	1	2009-03-09 13:57:42	2019-08-13 11:07:55	2009-03-09 11:16:29
1287009	snipmate.vim	116	https://github.com/marcjeanson/snipmate.vim	snipMate.vim aims to be a concise vim script that implements some of TextMate's snippets features in Vim. 	VimL	0	0	\N	0	2011-01-24 06:27:14	2016-06-15 04:54:31	2011-08-21 08:22:05
47816558	spacemacs-rspec	116	https://github.com/marcjeanson/spacemacs-rspec	\N	Emacs Lisp	0	0	\N	0	2015-12-11 07:13:26	2015-12-11 07:14:17	2015-12-11 07:15:47
47814680	spacemacs-rubocop	116	https://github.com/marcjeanson/spacemacs-rubocop	spacemacs layer to add Rubocop	Emacs Lisp	1	0	\N	0	2015-12-11 06:33:42	2015-12-11 06:37:37	2015-12-11 06:40:37
199	amazon-ec2	117	https://github.com/grempe/amazon-ec2	WARNING : You probably don't want this code. Its archived and ancient and probably doesn't work. Try the official AWS Ruby SDK instead.	Ruby	111	26	\N	436	2008-02-01 02:27:00	2021-01-23 11:22:57	2016-09-13 12:53:25
37731705	diceware	117	https://github.com/grempe/diceware	A tool for generating strong Diceware passwords, with entropy and crack time estimates.	JavaScript	52	16	\N	184	2015-06-19 12:58:44	2021-01-20 21:33:31	2020-12-03 10:13:31
67962453	diceware-generator	117	https://github.com/grempe/diceware-generator	A diceware generator	JavaScript	0	0	\N	1	2016-09-11 21:34:27	2016-11-09 19:21:56	2016-11-24 21:43:06
67961162	diceware-wordlist-en-eff	117	https://github.com/grempe/diceware-wordlist-en-eff	\N	JavaScript	1	0	\N	1	2016-09-11 21:01:03	2016-09-15 04:15:38	2016-09-15 04:26:44
23170372	dmr-watch	117	https://github.com/grempe/dmr-watch	An Elixir & Phoenix project to watch DMR Amateur Radio Traffic in real time.	JavaScript	0	0	\N	1	2014-08-20 22:46:44	2018-08-24 17:39:46	2014-09-10 15:41:16
545716	efps	117	https://github.com/grempe/efps	Simple Erlang Flash Policy File Server	Erlang	2	0	\N	5	2010-03-03 22:25:53	2020-08-06 11:57:37	2015-10-01 00:02:49
23049155	ex_rated	117	https://github.com/grempe/ex_rated	ExRated, the Elixir OTP GenServer with the naughty name that allows you to rate-limit calls to any service that requires it.	Elixir	41	1	\N	325	2014-08-17 17:00:03	2021-01-28 23:51:06	2021-01-11 15:01:32
74095833	fingerprint	117	https://github.com/grempe/fingerprint	Fingerprint is a simple tool that can be used to verify the contents of a directory.	Ruby	0	0	\N	0	2016-11-18 02:40:28	2016-11-18 02:40:29	2016-12-09 23:13:53
215457083	go-diceware	117	https://github.com/grempe/go-diceware	Golang library for generating passphrases via the diceware algorithm.	\N	0	0	\N	0	2019-10-16 01:30:17	2019-10-16 01:30:18	2018-10-24 20:08:17
11348879	grempe.github.io	117	https://github.com/grempe/grempe.github.io	Glenn Rempe's Public Website	HTML	1	1	\N	1	2013-07-11 14:59:23	2020-05-08 00:55:45	2020-05-08 00:55:43
180676720	ipfs-add	117	https://github.com/grempe/ipfs-add	Tool to add a file or directory to IPFS	Go	0	0	\N	0	2019-04-10 20:04:02	2019-04-10 20:04:04	2019-03-18 12:02:01
259511433	js-stellar-sdk	117	https://github.com/grempe/js-stellar-sdk	Main Stellar client library for the Javascript language	\N	0	0	\N	0	2020-04-27 23:35:43	2020-04-27 23:35:45	2020-04-27 23:39:24
89541411	nist-randomness-beacon	117	https://github.com/grempe/nist-randomness-beacon	A Javascript wrapper for the NIST Randomness Beacon API	\N	1	0	\N	1	2017-04-26 22:18:19	2018-09-11 16:39:03	2018-09-11 16:39:01
361413	opensecrets	117	https://github.com/grempe/opensecrets	OpenSecrets.org API Ruby Wrapper	Ruby	4	0	\N	16	2009-11-04 22:33:32	2019-08-13 11:29:03	2016-05-17 19:48:12
194761029	pem-jwk	117	https://github.com/grempe/pem-jwk	\N	JavaScript	0	0	\N	0	2019-07-01 21:38:41	2019-07-01 21:38:44	2019-04-26 18:20:56
255671005	qldb-simple-demo	117	https://github.com/grempe/qldb-simple-demo	\N	\N	0	0	\N	0	2020-04-14 14:00:29	2020-07-05 08:21:22	2020-04-07 14:43:03
73313168	rack-content_security_policy	117	https://github.com/grempe/rack-content_security_policy	Rack middleware for sending the HTTP ContentSecurityPolicy (W3C CSP Level 2/3) security headers in responses to prevent XSS and other browser based attacks.	Ruby	0	3	\N	1	2016-11-09 17:08:11	2019-08-27 14:57:51	2019-08-27 13:57:39
70432513	rack-json_web_token_auth	117	https://github.com/grempe/rack-json_web_token_auth	Rack middleware for authentication using JSON Web Tokens	Ruby	0	0	\N	2	2016-10-09 18:50:28	2019-08-27 14:55:22	2019-08-27 14:08:56
190452614	react-material-ui-firebase	117	https://github.com/grempe/react-material-ui-firebase	React + Material-UI + Firebase; the three musketeers, all in one pack in the form of a boilerplate app	JavaScript	0	0	\N	1	2019-06-05 16:02:26	2020-03-08 14:25:05	2019-06-05 19:14:31
27193849	secrets.js	117	https://github.com/grempe/secrets.js	Secret sharing for javascript	JavaScript	43	8	\N	165	2014-11-26 17:59:11	2021-01-29 10:04:20	2021-01-20 10:26:00
2764367	secretsharing	117	https://github.com/grempe/secretsharing	NO LONGER MAINTAINED, please see important news in README.md. Shamir's Secret Sharing is an algorithm in cryptography. It is a form of secret sharing, where a secret is divided into parts, giving each participant its own unique part, where some of the parts or all of them are needed in order to reconstruct the secret. Holders of a share gain no knowledge of the larger secret.	Ruby	3	0	\N	21	2011-11-12 22:39:37	2019-08-27 15:16:05	2016-04-16 14:40:37
67685482	session-keys-js	117	https://github.com/grempe/session-keys-js	A cryptographic tool for the deterministic generation of unique user IDs, and NaCl cryptographic keys	JavaScript	1	8	\N	6	2016-09-08 05:47:14	2020-07-19 15:37:31	2021-01-29 10:37:59
67685344	session-keys-rb	117	https://github.com/grempe/session-keys-rb	A tool for the deterministic generation of unique user IDs, and NaCl cryptographic keys from a single username and high entropy passphrase.	Ruby	0	1	\N	1	2016-09-08 05:45:39	2019-09-09 18:17:49	2019-09-27 14:40:52
58765283	sirp	117	https://github.com/grempe/sirp	Secure (interoperable) Remote Password Auth (SRP-6a)	Ruby	10	2	\N	22	2016-05-13 15:58:25	2020-11-02 09:22:27	2019-08-14 14:01:08
58960738	sirp-demo	117	https://github.com/grempe/sirp-demo	A live demo of grempe/sirp Secure Remote Password SRP-6a Authentication	JavaScript	0	7	\N	2	2016-05-16 16:26:28	2019-08-14 15:37:08	2020-12-21 10:14:38
79163508	split-api-swagger	117	https://github.com/grempe/split-api-swagger	SwaggerHub Sync of API Definition (Only edit in SwaggerHub)	Shell	0	0	\N	0	2017-01-16 20:00:52	2020-05-26 14:34:56	2017-01-16 20:33:48
38183458	strongpass	117	https://github.com/grempe/strongpass	An offline, deterministic, cryptographically strong, password generator.	HTML	1	0	\N	6	2015-06-27 23:33:25	2019-09-22 07:29:16	2016-11-25 17:48:35
64052284	thesplit	117	https://github.com/grempe/thesplit	The open-source, end-to-end encrypted, zero-knowledge, auto-expiring, cryptographically secure, secret sharing service.	CSS	1	0	\N	1	2016-07-24 03:36:48	2020-05-26 14:35:33	2016-11-14 18:57:36
64052569	thesplit-vue	117	https://github.com/grempe/thesplit-vue	VUE.js client code for thesplit.is	Vue	0	0	\N	0	2016-07-24 03:45:17	2020-05-26 14:34:00	2016-09-06 17:01:50
64729056	tierion	117	https://github.com/grempe/tierion	This API this code makes use of will be retired. This code is archived.	\N	5	0	\N	7	2016-08-02 03:08:21	2019-02-27 17:08:25	2019-02-27 17:06:23
43431651	amabot	118	https://github.com/peterc/amabot	An IRC bot that answers questions by searching reddit.	JavaScript	0	0	\N	0	2015-09-30 09:31:03	2015-09-30 09:31:03	2015-09-28 08:53:54
225358848	aoc2019solutions	118	https://github.com/peterc/aoc2019solutions	My Advent of Code 2019 Solutions	Ruby	0	0	\N	1	2019-12-02 08:28:33	2019-12-22 18:18:32	2019-12-22 18:18:30
16482081	author	118	https://github.com/peterc/author	\N	Ruby	0	0	\N	0	2014-02-03 12:43:14	2014-08-23 17:31:06	2014-08-23 17:31:06
117698903	awesome-serverless	118	https://github.com/peterc/awesome-serverless	:cloud: A curated list of awesome services, solutions and resources for serverless / nobackend applications.	\N	0	0	\N	0	2018-01-16 13:06:28	2018-01-16 12:50:05	2018-01-16 13:07:11
3206025	bitarray	118	https://github.com/peterc/bitarray	Pure Ruby bit array/bitfield implementation	Ruby	12	2	\N	77	2012-01-18 02:37:31	2020-12-23 04:01:37	2020-02-29 05:47:04
22552352	cardnut	118	https://github.com/peterc/cardnut	Simple backend for pushing Twilio text messages over WebSocket to a client (not useful for many)	JavaScript	0	0	\N	1	2014-08-02 14:40:45	2017-09-27 17:17:15	2014-08-02 15:28:44
86877202	chrome2gif	118	https://github.com/peterc/chrome2gif	Dynamically create an animated GIF of a page running in Chrome	JavaScript	4	0	\N	63	2017-03-31 23:37:37	2020-06-11 14:54:11	2017-03-31 23:49:21
260293407	codebuildtest	118	https://github.com/peterc/codebuildtest	testing codebuild to run random tasks	Ruby	1	0	\N	0	2020-04-30 15:54:08	2020-05-07 07:05:21	2020-05-07 07:05:19
1916789	coffeebots	118	https://github.com/peterc/coffeebots	A programmable robot war game in CoffeeScript / JavaScript	CoffeeScript	0	0	\N	4	2011-06-18 16:08:07	2018-04-21 02:57:33	2011-06-23 23:44:26
23026690	discourse	118	https://github.com/peterc/discourse	A platform for community discussion. Free, open, simple.	Ruby	0	0	\N	0	2014-08-16 17:39:56	2014-08-16 19:31:38	2014-08-18 12:35:23
184478620	drender	118	https://github.com/peterc/drender	drender	Ruby	0	0	\N	0	2019-05-01 17:39:30	2019-05-01 17:39:43	2019-05-01 17:39:41
267876728	engblogs	118	https://github.com/peterc/engblogs	Engineering Blogs	Ruby	1	2	\N	35	2020-05-29 11:21:47	2021-01-18 19:44:39	2021-01-18 19:44:36
11097840	eu_countries	118	https://github.com/peterc/eu_countries	List of EU Countries, built on top of the countries gem	Ruby	0	0	\N	0	2013-07-01 11:49:05	2013-07-01 13:25:48	2013-07-01 11:51:07
2037697	flitter	118	https://github.com/peterc/flitter	iLinkoln group project to build a Twitter / Flickr style mashup	Ruby	0	0	\N	3	2011-07-12 15:34:55	2019-08-13 11:47:39	2011-08-29 09:19:53
990349	hackerslide	118	https://github.com/peterc/hackerslide	A sliding view of the Hacker News front page over time	JavaScript	11	2	\N	77	2010-10-15 13:22:57	2020-06-12 03:57:59	2010-11-01 23:44:13
93973447	herokuexperiment	118	https://github.com/peterc/herokuexperiment	Running two processes (web and worker) on a single Heroku dyno	Ruby	0	0	\N	1	2017-06-10 21:49:20	2019-03-08 14:19:52	2017-06-10 21:49:28
172759390	hntitles	118	https://github.com/peterc/hntitles	Hacker News title edit tracker	Ruby	0	0	\N	1	2019-02-26 14:38:58	2020-04-08 08:56:35	2020-04-08 08:56:33
23409201	hstore_accessor	118	https://github.com/peterc/hstore_accessor	Adds typed hstore-backed field support to ActiveRecord models.	Ruby	0	0	\N	0	2014-08-27 20:46:13	2014-08-27 20:49:48	2014-08-27 20:59:09
113713971	iA-Fonts	118	https://github.com/peterc/iA-Fonts	\N	\N	0	0	\N	0	2017-12-09 23:31:33	2017-12-09 23:05:42	2017-12-08 11:48:59
58166416	igsubscriber	118	https://github.com/peterc/igsubscriber	Streams live market data from IG.com's Lightstreamer into a Redis data store	JavaScript	1	0	\N	4	2016-05-05 20:14:07	2017-01-28 09:28:34	2016-05-09 20:18:59
169269936	illustrator-cc-scripting	118	https://github.com/peterc/illustrator-cc-scripting	Help and resources on scripting Illustrator CC on macOS	JavaScript	1	0	\N	1	2019-02-05 14:10:20	2019-03-11 17:44:07	2019-02-05 14:20:19
191791806	iohook	118	https://github.com/peterc/iohook	Node.js global keyboard and mouse listener.	C	0	0	\N	0	2019-06-13 12:47:56	2019-06-13 12:47:59	2019-06-11 10:25:38
194938981	john-carmack-plan-archive	118	https://github.com/peterc/john-carmack-plan-archive	Collection of John Carmack’s .plan files.	\N	0	0	\N	0	2019-07-02 18:44:40	2019-07-02 18:44:44	2015-02-05 10:08:40
4613172	kitabu	118	https://github.com/peterc/kitabu	A framework for creating e-books from Markdown/Textile text markup using Ruby. Using the Prince PDF generator, you'll be able to get high quality PDFs.	Ruby	1	0	\N	6	2012-06-10 03:23:47	2013-04-21 09:07:07	2012-05-25 02:31:27
4109586	massiveattract	118	https://github.com/peterc/massiveattract	A game developed in a few hours for Ludum Dare 23	JavaScript	0	0	\N	2	2012-04-23 01:21:46	2013-01-08 18:54:33	2012-04-23 01:24:01
2999296	monos	118	https://github.com/peterc/monos	My Ludum Dare 22 entry	Ruby	1	0	\N	9	2011-12-17 01:00:55	2015-05-05 01:57:25	2011-12-19 00:52:53
332815803	homebrew-made	120	https://github.com/afarnham/homebrew-made	\N	Ruby	0	0	\N	0	2021-01-25 13:48:03	2021-01-26 14:43:48	2021-01-26 14:43:46
7856216	multirb	118	https://github.com/peterc/multirb	Run Ruby code over multiple implementations/versions using RVM from a IRB-esque prompt	Ruby	3	0	\N	43	2013-01-27 16:40:03	2017-11-18 19:48:20	2014-08-19 09:39:07
168835223	netlifytest	118	https://github.com/peterc/netlifytest	\N	Ruby	0	0	\N	0	2019-02-02 11:36:03	2019-02-02 11:54:21	2019-02-02 11:54:20
168783318	new-computer	118	https://github.com/peterc/new-computer	An extremely opinionated and highly personalized script to set up a new Mac machine, just the way I like it!	Shell	1	0	\N	0	2019-02-01 23:54:06	2019-02-01 23:54:08	2019-01-22 18:28:17
1181023	penny	118	https://github.com/peterc/penny	Flexible, multi-format, multi-workflow e-book generation toolkit	Ruby	1	1	\N	6	2010-12-19 00:40:17	2014-01-01 13:56:41	2010-12-19 04:30:29
6252648	ActionBarSherlock	119	https://github.com/ministrycentered/ActionBarSherlock	Library for implementing the action bar design pattern using the native action bar on Android 4.0+ and a custom implementation on pre-4.0 through a single API and theme.	Java	0	0	\N	0	2012-10-16 19:17:10	2019-03-11 18:42:58	2012-10-07 22:13:22
20488617	activeuuid	119	https://github.com/ministrycentered/activeuuid	Binary uuid keys in Rails	Ruby	0	0	\N	0	2014-06-04 12:16:24	2019-03-11 18:53:28	2014-06-04 12:17:45
146816387	active_record_slave	119	https://github.com/ministrycentered/active_record_slave	Redirect ActiveRecord (Rails) reads to slave databases while ensuring all writes go to the master database.	Ruby	0	0	\N	0	2018-08-30 20:15:19	2020-06-17 09:32:28	2018-08-30 20:17:15
20303631	active_utils	119	https://github.com/ministrycentered/active_utils	Active Utils	Ruby	0	0	\N	0	2014-05-29 15:18:39	2019-03-11 18:53:32	2014-05-29 15:24:54
256385	amazon-ecs	119	https://github.com/ministrycentered/amazon-ecs	Generic Ruby Amazon E-commerce REST API	Ruby	1	0	\N	1	2009-07-21 00:23:45	2019-03-11 18:39:56	2009-10-12 23:37:15
1385236	amplify	119	https://github.com/ministrycentered/amplify	Amplify	JavaScript	0	0	\N	0	2011-02-19 02:11:03	2019-03-11 18:40:13	2011-02-18 20:02:52
1935321	AQGridView	119	https://github.com/ministrycentered/AQGridView	An grid view for iPhone/iPad, designed to look similar to NSCollectionView.	Objective-C	0	0	\N	1	2011-06-22 11:47:45	2019-03-11 18:41:55	2011-10-10 17:59:22
4396547	batman	119	https://github.com/ministrycentered/batman	Fighting Crime and Kicking Apps	CoffeeScript	0	0	\N	1	2012-05-21 14:52:32	2019-03-11 18:46:24	2014-02-20 00:25:51
17804082	batman-paginator	119	https://github.com/ministrycentered/batman-paginator	\N	CoffeeScript	1	2	\N	3	2014-03-16 14:00:31	2019-03-11 18:53:36	2014-05-27 13:25:04
4447914	Batman.Live	119	https://github.com/ministrycentered/Batman.Live	Batman.Live	CoffeeScript	0	0	\N	5	2012-05-25 14:10:26	2019-03-11 18:42:39	2012-07-16 17:23:12
80578121	bramble	119	https://github.com/ministrycentered/bramble	Map-Reduce for Rails, ActiveJob and Redis	Ruby	0	0	\N	0	2017-01-31 22:59:59	2019-03-11 20:06:54	2019-01-31 15:42:43
14571543	browser	119	https://github.com/ministrycentered/browser	Do some browser detection with Ruby. Includes ActionController integration.	Ruby	0	0	\N	0	2013-11-20 20:49:27	2013-11-20 21:16:24	2013-11-20 21:16:23
6097621	bully	119	https://github.com/ministrycentered/bully	Simple Pusher Objective-C client	Objective-C	1	0	\N	0	2012-10-05 19:27:22	2019-03-11 19:30:48	2017-09-26 21:56:32
78684188	c3	119	https://github.com/ministrycentered/c3	A D3-based reusable chart library	JavaScript	0	0	\N	0	2017-01-11 20:05:45	2019-03-11 19:20:15	2017-04-18 17:24:49
16702399	capistrano-nginx	119	https://github.com/ministrycentered/capistrano-nginx	Simple nginx management with capistrano	Ruby	0	0	\N	0	2014-02-10 15:05:38	2019-03-11 18:53:42	2014-05-14 12:55:43
19797233	capistrano-upstart	119	https://github.com/ministrycentered/capistrano-upstart	a capistrano recipe to manage upstart serivce.	Ruby	0	0	\N	0	2014-05-14 18:42:24	2019-03-11 18:53:39	2014-05-14 18:46:20
2520729	Chameleon	119	https://github.com/ministrycentered/Chameleon	Chameleon is a port of Apple's UIKit for iOS (and some minimal related frameworks) to Mac OS X.	Objective-C	0	0	\N	1	2011-10-05 14:22:47	2019-03-11 18:41:49	2011-08-01 00:05:23
96473780	check-ins-app	119	https://github.com/ministrycentered/check-ins-app	Published releases of the Check-Ins Desktop App for Mac and Windows	\N	0	0	\N	2	2017-07-06 18:33:15	2019-08-28 12:09:55	2019-11-20 13:33:22
15804764	chef-slanger	119	https://github.com/ministrycentered/chef-slanger	Chef Slanger cookbook	Ruby	0	0	\N	0	2014-01-10 15:34:14	2019-03-11 18:42:52	2012-09-24 17:42:09
114810606	church-center-dreamin	119	https://github.com/ministrycentered/church-center-dreamin	react native playground for flow exploration.	JavaScript	0	0	\N	0	2017-12-19 18:59:39	2019-03-11 19:26:29	2017-12-22 21:42:27
118939345	closure_tree	119	https://github.com/ministrycentered/closure_tree	Easily and efficiently make your ActiveRecord models support hierarchies	Ruby	0	0	\N	0	2018-01-25 14:38:23	2019-03-11 19:32:49	2018-01-25 14:54:44
80783302	demoji	119	https://github.com/ministrycentered/demoji	Replace emojis as to not blow up utf8 MySQL.	Ruby	0	0	\N	0	2017-02-02 22:35:36	2019-03-11 19:31:30	2017-07-10 18:51:22
4195404	docsplit	119	https://github.com/ministrycentered/docsplit	Break Apart Documents into Images, Text, Pages and PDFs	Ruby	0	0	\N	0	2012-05-01 15:59:41	2019-03-11 18:42:20	2012-05-01 17:46:28
97884185	doorman	119	https://github.com/ministrycentered/doorman	an osquery fleet manager	Python	0	0	\N	0	2017-07-20 19:46:06	2019-03-11 19:31:24	2017-07-25 15:11:14
140772506	doxy-docs	119	https://github.com/ministrycentered/doxy-docs	Documentation site for the doxy system	JavaScript	0	0	\N	0	2018-07-12 20:00:58	2019-05-01 16:18:04	2019-05-01 16:18:02
155878910	electron-builder	119	https://github.com/ministrycentered/electron-builder	A complete solution to package and build a ready for distribution Electron app with “auto update” support out of the box	TypeScript	0	0	\N	0	2018-11-02 11:39:48	2019-03-11 20:00:59	2018-11-02 15:49:28
50744916	frontend-guidelines-questionnaire	119	https://github.com/ministrycentered/frontend-guidelines-questionnaire	A MCT tailored fork of Brad Frost's questionnaire—for 2016 Design Summit	\N	0	0	\N	0	2016-01-30 19:05:33	2019-03-11 19:05:30	2016-01-30 19:32:54
6127817	HockeySDK-iOS	119	https://github.com/ministrycentered/HockeySDK-iOS	The official iOS SDK for the HockeyApp service	Objective-C	0	0	\N	0	2012-10-08 13:55:18	2019-03-11 18:44:21	2013-09-03 14:47:52
294733280	imagemagick-aws-lambda-2	119	https://github.com/ministrycentered/imagemagick-aws-lambda-2	ImageMagick for AWS Lambda 2 runtimes	Makefile	0	1	\N	0	2020-09-11 12:32:06	2020-09-28 15:52:52	2020-11-11 16:15:38
1129656	jquery-ui	119	https://github.com/ministrycentered/jquery-ui	The official jQuery user interface library.	JavaScript	0	0	\N	1	2010-12-01 17:26:00	2019-03-11 18:40:04	2010-12-01 21:03:43
242850930	AppCenter	120	https://github.com/afarnham/AppCenter	AppCenter in Swift	Swift	0	0	\N	1	2020-02-24 18:47:36	2020-09-20 09:26:22	2020-03-05 19:21:57
127999258	BlueSim	120	https://github.com/afarnham/BlueSim	Bluetooth LE device simulator for iOS	Objective-C	0	0	\N	0	2018-04-04 00:03:15	2018-04-04 00:24:29	2018-04-04 00:24:28
109052981	caffe-android-demo	120	https://github.com/afarnham/caffe-android-demo	An android caffe demo app exploiting caffe pre-trained ImageNet model for image classification	Java	0	0	\N	0	2017-10-31 19:14:42	2017-10-31 19:14:44	2016-12-05 12:52:15
145575589	episode-code-samples	120	https://github.com/afarnham/episode-code-samples	💾 Point-Free episode code.	Swift	0	0	\N	0	2018-08-21 11:29:30	2018-08-21 11:29:32	2018-08-20 23:07:36
6151907	gdal	120	https://github.com/afarnham/gdal	Git mirror of the GDAL svn repository 	C++	0	0	\N	0	2012-10-10 01:04:07	2018-03-25 17:30:39	2012-10-09 20:06:13
181222620	GpxKit	120	https://github.com/afarnham/GpxKit	Swift GPX parser and writer	Swift	0	0	\N	0	2019-04-13 17:02:44	2019-04-17 18:59:24	2019-04-17 18:59:21
191044464	HouFloodModel	120	https://github.com/afarnham/HouFloodModel	\N	Swift	0	0	\N	0	2019-06-09 16:04:24	2019-06-17 13:12:27	2019-06-17 13:12:26
102689950	HTXFloodKit	120	https://github.com/afarnham/HTXFloodKit	Harris County Flood Warning System Kit	Swift	0	0	\N	0	2017-09-07 01:06:38	2019-06-17 15:24:51	2019-06-17 15:24:49
102690705	HTXFloodService	120	https://github.com/afarnham/HTXFloodService	Harris County Flood Warning System Service	Swift	0	0	\N	0	2017-09-07 01:17:59	2017-09-07 01:18:19	2017-09-07 01:18:17
19711838	iOS-Framework	120	https://github.com/afarnham/iOS-Framework	How to create, develop, and distribute iOS Static Frameworks quickly and efficiently	Objective-C	1	1	\N	0	2014-05-12 16:16:51	2014-05-12 16:16:51	2017-09-26 21:56:39
129778034	Jira-Swift	120	https://github.com/afarnham/Jira-Swift	A client for Jira written in Swift	Swift	0	0	\N	0	2018-04-16 14:04:46	2018-04-16 14:04:48	2018-03-18 13:21:03
86079357	KalmanFilter	120	https://github.com/afarnham/KalmanFilter	Swift implementation of Kalman Filter algorithm	Swift	0	0	\N	0	2017-03-24 11:54:40	2017-03-24 11:54:42	2017-03-28 13:15:54
9092764	libspatialite-ios	120	https://github.com/afarnham/libspatialite-ios	libspatialite compiled for iOS	\N	0	0	\N	0	2013-03-29 02:29:39	2013-03-29 02:29:39	2013-02-20 14:32:48
142185455	MixedModules	120	https://github.com/afarnham/MixedModules	Example of mixed Swift and Objective-C modules	Objective-C	1	0	\N	1	2018-07-24 13:31:39	2019-12-11 22:17:41	2018-07-24 14:00:12
27882171	ObjectiveWMM	120	https://github.com/afarnham/ObjectiveWMM	An Objective-C iOS wrapper for the World Magnetic Model 2010	C	0	0	\N	0	2014-12-11 15:07:22	2014-12-11 15:10:22	2014-12-11 15:10:21
326749371	osx-vm-templates	120	https://github.com/afarnham/osx-vm-templates	macOS templates for Packer and VeeWee.	\N	0	0	\N	0	2021-01-04 13:53:01	2021-01-04 13:53:02	2020-10-20 15:32:59
4593565	owslib	120	https://github.com/afarnham/owslib	This is a mirror of the owslib svn repository 	Python	0	0	\N	1	2012-06-08 01:26:11	2013-01-09 11:58:27	2012-06-09 03:11:57
231106671	PFParser	120	https://github.com/afarnham/PFParser	PointFree.co Parser Combinators	Swift	1	0	\N	0	2019-12-31 11:58:29	2020-02-23 18:19:16	2020-02-23 18:19:14
8825053	preflight	120	https://github.com/afarnham/preflight	\N	Python	3	1	\N	4	2013-03-16 17:34:07	2019-12-18 17:16:21	2019-12-18 17:16:19
173806641	RayTracerChallenge	120	https://github.com/afarnham/RayTracerChallenge	My work on the Ray Tracer Challenge - https://pragprog.com/book/jbtracer/the-ray-tracer-challenge	Swift	0	0	\N	0	2019-03-04 16:20:32	2019-03-04 16:26:21	2019-03-04 16:26:20
193583933	ReactiveCocoa	120	https://github.com/afarnham/ReactiveCocoa	Reactive extensions to Cocoa frameworks, built on top of ReactiveSwift	Swift	0	0	\N	0	2019-06-24 18:35:33	2019-06-24 18:35:36	2019-06-23 02:59:54
175890990	ReactiveDemo	120	https://github.com/afarnham/ReactiveDemo	\N	Swift	0	0	\N	0	2019-03-15 18:04:38	2019-03-15 18:05:02	2019-03-15 18:04:59
2303883	route-me	120	https://github.com/afarnham/route-me	Open source map library for iOS	Objective-C	0	0	\N	0	2011-08-31 17:18:21	2016-05-31 16:45:06	2011-08-31 19:15:52
331720107	swift-package-manager	120	https://github.com/afarnham/swift-package-manager	The Package Manager for the Swift Programming Language	\N	0	0	\N	0	2021-01-21 15:38:13	2021-01-21 15:38:15	2021-01-21 12:27:28
191167643	swift-prelude	120	https://github.com/afarnham/swift-prelude	🎶 A collection of types and functions that enhance the Swift language.	Swift	0	0	\N	0	2019-06-10 09:53:19	2019-06-10 10:03:36	2019-06-10 10:03:34
191053351	swift-snapshot-testing	120	https://github.com/afarnham/swift-snapshot-testing	📸 Delightful Swift snapshot testing.	Swift	0	0	\N	0	2019-06-09 17:41:31	2019-06-09 17:41:33	2019-06-07 07:46:40
331724077	swift-tools-support-core	120	https://github.com/afarnham/swift-tools-support-core	Contains common infrastructural code for both SwiftPM and llbuild.	\N	0	0	\N	0	2021-01-21 15:53:35	2021-01-21 15:53:37	2021-01-21 02:58:16
192398401	swift-web	120	https://github.com/afarnham/swift-web	🕸 A collection of Swift server-side frameworks for handling HTML, CSS, routing and middleware.	Swift	0	0	\N	0	2019-06-17 15:27:40	2019-06-17 15:27:43	2019-06-11 19:08:15
138923507	swiftfpexercises	120	https://github.com/afarnham/swiftfpexercises	Collection of FPish exercises in Swift	Swift	0	0	\N	0	2018-06-27 16:17:20	2018-06-27 16:17:22	2018-06-18 02:01:05
57778	altered_beast	121	https://github.com/up_the_irons/altered_beast	Ground-up rewrite of Beast, a Ruby on Rails forum.	Ruby	0	0	\N	2	2008-09-29 22:18:09	2019-08-13 10:36:41	2008-10-01 09:48:47
16789202	arpnet-toolbox	121	https://github.com/up_the_irons/arpnet-toolbox	\N	Ruby	2	2	\N	1	2014-02-13 00:21:28	2016-06-02 08:39:13	2016-06-02 08:39:13
17052405	arpnetworks-packages	121	https://github.com/up_the_irons/arpnetworks-packages	\N	\N	0	0	\N	0	2014-02-21 07:03:07	2014-02-21 07:25:55	2014-02-21 07:25:55
1927970	billing-system-models	121	https://github.com/up_the_irons/billing-system-models	A collection of ActiveRecord models that can be included as part of a full-featured billing system	Ruby	3	0	\N	4	2011-06-21 04:50:07	2019-01-31 14:21:41	2013-11-22 04:30:17
19527959	browser-i18n	121	https://github.com/up_the_irons/browser-i18n	Simple tool for i18n in the browser	JavaScript	0	0	\N	0	2014-05-07 06:05:31	2014-05-07 06:10:24	2014-05-07 06:09:47
33706	cacheable-flash	121	https://github.com/up_the_irons/cacheable-flash	Rails flash working with page caching. Forked to work with JQuery instead of Prototype.	JavaScript	3	0	\N	8	2008-07-13 04:49:22	2019-08-13 10:29:03	2008-07-31 18:53:00
17313047	communityengine	121	https://github.com/up_the_irons/communityengine	Adds basic social networking capabilities to your existing application, including users, blogs, photos, clippings, favorites, and more.	Ruby	0	0	\N	0	2014-03-01 07:50:06	2014-03-02 09:17:11	2014-03-02 06:32:33
245	credit_card_tools	121	https://github.com/up_the_irons/credit_card_tools	Tools for processing credit cards on the command line	Ruby	4	0	\N	12	2008-02-03 10:37:18	2020-02-19 04:24:05	2008-03-26 16:11:23
20279053	curriculum	121	https://github.com/up_the_irons/curriculum	Ops School Curriculum	Python	0	0	\N	0	2014-05-28 22:54:22	2014-06-06 09:16:07	2014-05-28 23:09:12
2610567	dotfiles	121	https://github.com/up_the_irons/dotfiles	\N	Emacs Lisp	0	0	\N	3	2011-10-20 00:10:18	2020-05-18 04:54:54	2020-05-18 04:54:52
217	ebay4r	121	https://github.com/up_the_irons/ebay4r	eBay4R is a Ruby wrapper for eBay's Web Services SOAP API	Ruby	7	0	\N	31	2008-02-02 09:02:50	2019-08-13 10:21:21	2017-07-28 09:05:30
19363289	foundation-rails	121	https://github.com/up_the_irons/foundation-rails	Foundation for Rails	Ruby	0	0	\N	0	2014-05-01 22:48:14	2019-09-09 18:07:48	2014-05-01 23:31:36
1943984	git-winner	121	https://github.com/up_the_irons/git-winner	\N	Shell	1	0	\N	4	2011-06-23 17:23:07	2017-12-15 09:51:42	2011-08-30 16:28:08
18165253	gogo	121	https://github.com/up_the_irons/gogo	\N	Ruby	0	1	\N	0	2014-03-27 02:19:08	2014-04-16 03:50:42	2014-04-16 03:50:45
53479	immutable	121	https://github.com/up_the_irons/immutable	Declare methods as immutable, somewhat like Java's "final" but still allowing child classes to override.	Ruby	1	0	\N	28	2008-09-17 07:06:19	2020-08-17 13:29:39	2009-09-19 17:34:23
107206	ip_allocator	121	https://github.com/up_the_irons/ip_allocator	A class that helps ISP's subnet their IPv4 and IPv6 address space.	Ruby	2	0	\N	5	2009-01-14 07:33:26	2019-08-13 10:53:35	2009-03-04 18:10:10
2317456	jenkins-hipchat-plugin	121	https://github.com/up_the_irons/jenkins-hipchat-plugin	basically forked the campfire plugin and made things hipchatish	Java	0	0	\N	1	2011-09-02 23:18:36	2013-01-04 02:11:11	2011-09-02 23:20:54
60574432	kubernetes	121	https://github.com/up_the_irons/kubernetes	Production-Grade Container Scheduling and Management	Go	0	0	\N	0	2016-06-06 23:05:33	2016-06-06 23:05:49	2016-06-07 04:43:06
278768538	maintenance	121	https://github.com/up_the_irons/maintenance	Maintenance Page Support For Capistrano	Ruby	0	0	\N	0	2020-07-10 22:54:17	2020-07-10 22:55:08	2020-07-10 22:55:04
56686	mephisto	121	https://github.com/up_the_irons/mephisto	A mirror of the mephisto code-base	Ruby	1	0	\N	2	2008-09-26 06:54:39	2019-08-13 10:36:23	2008-09-20 17:18:41
19226909	mobile-experiments	121	https://github.com/up_the_irons/mobile-experiments	\N	JavaScript	0	0	\N	0	2014-04-28 01:17:56	2014-05-28 05:29:15	2014-05-28 05:29:15
3923364	node-autocomplete	121	https://github.com/up_the_irons/node-autocomplete	Autocomplete module for node.js	JavaScript	0	0	\N	1	2012-04-03 19:22:29	2013-01-08 11:14:29	2012-04-03 19:23:23
124317	pony	121	https://github.com/up_the_irons/pony	The express way to send mail from Ruby.	Ruby	0	0	\N	2	2009-02-08 10:55:25	2019-08-13 10:59:23	2009-01-14 02:30:56
2005299	powerdns-models	121	https://github.com/up_the_irons/powerdns-models	A couple of ActiveRecord models that can be used to manipulate a PowerDNS database	Ruby	0	0	\N	5	2011-07-06 05:01:35	2017-11-20 13:34:46	2011-08-08 22:27:19
220	ram	121	https://github.com/up_the_irons/ram	Ruby Asset Manager	Ruby	0	0	\N	7	2008-02-02 10:17:56	2019-08-13 10:21:21	2008-03-26 16:10:53
1891962	Ruby-Radius	121	https://github.com/up_the_irons/Ruby-Radius	RADIUS interface for Ruby, based on the work of Rafael R. Sevilla	Ruby	2	0	\N	8	2011-06-13 21:37:46	2019-12-16 00:45:14	2011-09-14 20:00:32
20610571	selfstarter	121	https://github.com/up_the_irons/selfstarter	Roll your own crowdfunding	Ruby	0	0	\N	1	2014-06-08 03:00:42	2018-03-06 00:06:12	2014-06-08 04:28:08
5683830	tendersync	121	https://github.com/up_the_irons/tendersync	Utility for syncing documents from an ENTP Tender repository to a local filesystem, as well as creating index files	Ruby	0	0	\N	1	2012-09-05 04:20:28	2013-01-12 00:52:27	2012-09-05 05:46:47
139912203	tmux-battery	121	https://github.com/up_the_irons/tmux-battery	Plug and play battery percentage and icon indicator for Tmux.	Shell	0	0	\N	0	2018-07-05 20:59:25	2018-07-05 21:03:09	2018-07-05 21:03:08
59063323	twofactorauth	121	https://github.com/up_the_irons/twofactorauth	List of sites with two factor auth support which includes SMS, email, phone calls, hardware, and software.	JavaScript	0	0	\N	0	2016-05-17 19:24:32	2016-05-17 19:24:35	2016-05-17 19:51:36
118429242	.spacemacs.d	122	https://github.com/cristibalan/.spacemacs.d	~/.spacemacs.d	Emacs Lisp	0	0	\N	0	2018-01-22 06:37:33	2018-01-22 08:11:12	2018-02-07 06:41:43
635551	.vim	122	https://github.com/cristibalan/.vim	~/.vim	Vim script	2	0	\N	3	2010-04-28 20:29:56	2019-01-06 22:24:28	2019-01-06 22:24:23
119036340	.vim-1	122	https://github.com/cristibalan/.vim-1	my .vim	Vim script	0	0	\N	0	2018-01-26 08:04:31	2018-01-26 08:04:33	2018-01-26 08:06:00
20196	asset_auto_include	122	https://github.com/cristibalan/asset_auto_include	Based on the javascript_auto_include_plugin but allows to include all sorts of things, not just js	Ruby	0	0	\N	9	2008-05-28 09:49:20	2019-08-13 10:25:20	2009-11-29 09:47:08
249	braid	122	https://github.com/cristibalan/braid	Simple tool to help track vendor branches in a Git repository.	Ruby	35	13	\N	441	2008-02-03 19:14:46	2021-01-13 16:25:21	2019-06-10 19:38:56
17996	dotfiles	122	https://github.com/cristibalan/dotfiles	dotfiles	Shell	2	1	\N	9	2008-05-19 08:24:48	2019-08-13 10:24:51	2019-06-25 22:00:12
123478	evil.che.lu	122	https://github.com/cristibalan/evil.che.lu	evil.che.lu - fluffy_barbarian source	JavaScript	0	0	\N	2	2009-02-06 23:00:59	2019-08-13 10:59:06	2010-11-07 01:17:51
449813	feedzinho	122	https://github.com/cristibalan/feedzinho	A tiny feed reader for lolcats and githubz	Ruby	0	0	\N	2	2009-12-27 00:36:37	2014-05-01 13:12:40	2009-12-27 00:37:04
308915	fizzy	122	https://github.com/cristibalan/fizzy	Gangsta file matching.	Ruby	0	0	\N	4	2009-09-16 11:41:15	2019-08-13 11:28:07	2009-09-16 12:22:47
1041009	fluffy_barbarian	122	https://github.com/cristibalan/fluffy_barbarian	Fluffy barbarian carefully handles your blog	Ruby	0	0	\N	3	2010-11-01 03:25:27	2014-05-01 13:11:57	2010-11-01 14:17:53
308962	fuf-fizzy	122	https://github.com/cristibalan/fuf-fizzy	Fizzy mode for fuzzyfinder.vim	VimL	0	0	\N	2	2009-09-16 12:19:48	2014-05-01 13:13:12	2009-10-13 07:08:03
124627	fuzzyfinder_textmate	122	https://github.com/cristibalan/fuzzyfinder_textmate	UNMAINTAINED! A vim script that extends the fuzzyfinder plugin to support TextMate style file searches (e.g. cmd-T)	VimL	0	0	\N	2	2009-02-08 21:55:28	2019-08-13 10:59:30	2009-02-08 22:23:08
124563	fuzzy_file_finder	122	https://github.com/cristibalan/fuzzy_file_finder	UNMAINTAINED! A (slightly enhanced) implementation of TextMate's cmd-T lookup functionality, in Ruby, for embedding in other projects	Ruby	0	0	\N	2	2009-02-08 19:42:00	2019-08-13 10:59:28	2009-02-10 16:31:58
451532	gist_inliner	122	https://github.com/cristibalan/gist_inliner	Inline gists into HTML	JavaScript	0	0	\N	2	2009-12-28 20:04:03	2014-05-01 13:12:40	2009-12-28 20:04:24
1046910	i18n-js	122	https://github.com/cristibalan/i18n-js	It's a small library to provide the I18n translations on the Javascript. It comes with Rails support.	JavaScript	0	0	\N	2	2010-11-03 01:56:53	2014-05-01 13:11:56	2010-11-03 01:57:54
352718	kbdhax	122	https://github.com/cristibalan/kbdhax	Changes right alt key with a control key on a macbook keyboard	C	0	0	\N	5	2009-10-28 11:59:05	2014-05-01 13:13:00	2010-01-22 16:32:52
352721	macvim	122	https://github.com/cristibalan/macvim	Mirror of the MacVim repo.or.cz repo updated hourly. Backup of my custom changes in branch chelu. Will push -f to it.	C	1	0	\N	2	2009-10-28 12:01:37	2014-05-01 13:12:59	2010-04-19 02:27:40
449798	mailinho	122	https://github.com/cristibalan/mailinho	broken webmail thingy	Ruby	0	0	\N	2	2009-12-27 00:20:05	2017-05-30 22:17:03	2009-12-27 00:20:34
15772187	rails	122	https://github.com/cristibalan/rails	Ruby on Rails	Ruby	0	0	\N	0	2014-01-09 14:31:02	2015-03-09 21:47:43	2014-01-09 00:42:09
113341787	re-frisk	122	https://github.com/cristibalan/re-frisk	Visualize re-frame pattern data or reagent ratom data as a tree structure, watch re-frame events and export state in the debugger. 	Clojure	0	0	\N	0	2017-12-06 14:39:37	2017-12-06 14:39:39	2017-12-06 14:50:34
7226296	reportable	122	https://github.com/cristibalan/reportable	A plugin that makes basic reporting for rails models dead simple. Formally known as reports_as_sparkline.	Ruby	0	0	\N	0	2012-12-18 14:13:23	2014-01-13 08:59:19	2014-01-13 08:59:19
106439	skittlish	122	https://github.com/cristibalan/skittlish	A candy coloured theme for mephisto. Comes in 7 flavours! (orange, blue, green, pink, cyan, red, violet)	JavaScript	1	0	\N	3	2009-01-13 07:24:07	2019-08-13 10:53:20	2009-01-16 21:06:07
676508	Sonny	122	https://github.com/cristibalan/Sonny	Weather by mobster. Doesn't work yet	Ruby	0	0	\N	2	2010-05-20 02:49:28	2014-05-01 13:12:08	2010-05-20 02:50:08
3867639	thorax	122	https://github.com/cristibalan/thorax	Strengthening your Backbone	JavaScript	0	0	\N	2	2012-03-29 12:53:13	2014-05-01 13:11:54	2012-03-29 12:53:54
20653	acts_as_dismissible	123	https://github.com/heavysixer/acts_as_dismissible	Allows you to create messages in the user interface, which the users can dismiss once read. The plugin stores the reference to the dismissed message in a cookie. 	Ruby	2	0	\N	18	2008-05-29 23:46:21	2019-08-13 10:25:27	2009-03-03 19:35:14
2268615	acts_as_moderated	123	https://github.com/heavysixer/acts_as_moderated	ActsAsModerated is a plugin that allows specific columns of a model to be audited by a moderator at some later point.	Ruby	1	0	\N	5	2011-08-25 12:08:33	2017-07-04 15:28:26	2011-08-25 12:54:38
4016819	acts_as_sanitiled	123	https://github.com/heavysixer/acts_as_sanitiled	Textile and sanitize ActiveRecord columns	Ruby	0	0	\N	1	2012-04-13 11:53:43	2013-01-08 14:58:17	2011-07-03 18:01:06
30708109	angular-bind-polymer	123	https://github.com/heavysixer/angular-bind-polymer	Angular directive for *double* variable binding of Polymer attributes.	JavaScript	0	0	\N	0	2015-02-12 13:15:19	2015-02-12 13:15:20	2015-02-12 13:19:31
39409273	angular-video-background	123	https://github.com/heavysixer/angular-video-background	html5 fullscreen video background in angular	JavaScript	0	0	\N	0	2015-07-20 18:26:55	2015-07-20 18:26:56	2015-07-20 18:58:05
349380	arduino-touchshield-asteroids	123	https://github.com/heavysixer/arduino-touchshield-asteroids	Asteroids-like asteroids on the Arduino Diecimila and TouchShield Stealth. Creates several asteroids that float around the screen.	C++	1	0	\N	1	2009-10-25 19:23:43	2014-01-01 22:49:32	2009-06-07 21:39:32
1929215	billing-system-models	123	https://github.com/heavysixer/billing-system-models	A collection of ActiveRecord models that can be included as part of a full-featured billing system	Ruby	0	0	\N	1	2011-06-21 10:21:56	2013-01-03 16:07:49	2011-06-21 07:32:38
44873519	building-blocks	123	https://github.com/heavysixer/building-blocks	Create, fork and edit d3.js code snippets for use with bl.ocks.org right in the browser, no terminal required.	JavaScript	1	0	\N	0	2015-10-24 14:03:35	2015-10-24 14:03:36	2015-10-24 04:22:46
100407856	camunda-modeler	123	https://github.com/heavysixer/camunda-modeler	An integrated modeling solution for BPMN, DMN and CMMN based on bpmn.io	JavaScript	0	0	\N	0	2017-08-15 15:40:10	2017-08-15 15:40:12	2017-08-14 06:23:23
43781441	cool_ruby_faces	123	https://github.com/heavysixer/cool_ruby_faces	CLI app for displaying and copying Cool Faces in OS X	Ruby	0	0	\N	0	2015-10-06 19:02:05	2015-10-06 19:02:06	2015-05-21 16:38:30
45279011	d3-lessons	123	https://github.com/heavysixer/d3-lessons	An interactive approach to teaching interactive data visualizations.	JavaScript	0	0	\N	0	2015-10-30 20:07:06	2015-10-30 20:07:11	2015-04-17 19:25:26
5427386	d3-plugins	123	https://github.com/heavysixer/d3-plugins	A repository for sharing D3.js plugins.	JavaScript	0	0	\N	0	2012-08-15 11:59:51	2013-01-11 17:09:46	2012-07-25 07:12:48
45351953	d3workshop	123	https://github.com/heavysixer/d3workshop	Angular Material Design application to support the D3 workshop I am teaching.	HTML	4	0	\N	7	2015-11-01 16:22:00	2016-03-04 13:33:25	2016-03-04 12:53:58
16287509	d4	123	https://github.com/heavysixer/d4	A friendly reusable charts DSL for D3	JavaScript	48	18	\N	431	2014-01-27 16:04:54	2020-09-29 12:01:08	2020-04-11 17:53:40
19129280	d4-www	123	https://github.com/heavysixer/d4-www	Example site for d4	JavaScript	2	0	\N	1	2014-04-24 21:52:33	2015-04-19 18:20:25	2015-04-19 18:20:24
45848630	data	123	https://github.com/heavysixer/data	A collection of public data sets	HTML	0	0	\N	0	2015-11-09 13:53:02	2015-11-09 13:53:33	2015-10-30 12:24:56
69413977	doorkeeper	123	https://github.com/heavysixer/doorkeeper	Doorkeeper is an OAuth 2 provider for Rails	Ruby	0	0	\N	0	2016-09-27 22:38:47	2016-09-27 22:38:48	2016-09-23 19:14:47
294996393	emmadaggett.com	123	https://github.com/heavysixer/emmadaggett.com	emma daggett's home page.	HTML	0	0	\N	0	2020-09-12 14:48:54	2020-09-12 15:56:03	2020-09-12 15:56:01
53266956	exif-map	123	https://github.com/heavysixer/exif-map	simple d3 app to show you how to extract exif data from JPGS and map the lat / lon onto a d3 visualization.	JavaScript	0	0	\N	3	2016-03-06 14:24:59	2016-07-23 18:17:27	2016-03-06 15:17:43
1962813	funnel_plot_highchart	123	https://github.com/heavysixer/funnel_plot_highchart	Funnel Plots for Highcharts.js	JavaScript	0	0	\N	1	2011-06-27 18:40:37	2013-12-13 13:05:03	2011-06-28 19:23:57
31435054	generator-gruntfile	123	https://github.com/heavysixer/generator-gruntfile	Create a basic Gruntfile with yo.	JavaScript	0	0	\N	0	2015-02-27 16:18:33	2015-02-27 18:57:48	2015-02-27 18:57:48
56166461	generator-gulp-angular	123	https://github.com/heavysixer/generator-gulp-angular	Yeoman generator for AngularJS with GulpJS	JavaScript	0	0	\N	0	2016-04-13 13:02:43	2016-04-13 13:02:45	2016-04-13 06:48:14
56978590	GeneticAlgorithm-TSP	123	https://github.com/heavysixer/GeneticAlgorithm-TSP	GA-TSP	JavaScript	1	1	\N	0	2016-04-24 12:21:25	2016-04-24 12:21:26	2017-09-26 21:57:12
1383322	gesso	123	https://github.com/heavysixer/gesso	A HTML5 Canvas-based game framework powered by jQuery.	JavaScript	0	0	\N	1	2011-02-18 15:28:17	2014-04-25 16:22:00	2011-07-02 22:19:24
16004569	git.tmbundle	123	https://github.com/heavysixer/git.tmbundle	The Git TextMate Bundle	Ruby	0	0	\N	0	2014-01-17 14:16:34	2014-01-17 14:20:43	2014-01-17 14:19:11
7463082	grape-on-rack	123	https://github.com/heavysixer/grape-on-rack	A demo Grape API mounted on RACK.	Ruby	0	0	\N	0	2013-01-06 00:48:19	2015-08-04 18:14:46	2013-01-06 19:05:47
124962	heavysixer.github.com	123	https://github.com/heavysixer/heavysixer.github.com	mah homepage	HTML	0	0	\N	2	2009-02-09 11:34:46	2020-01-22 12:46:37	2020-01-22 12:46:34
1987854	highchart-heatmap	123	https://github.com/heavysixer/highchart-heatmap	Simple Heatmaps for Highcharts	JavaScript	7	2	\N	7	2011-07-02 11:45:50	2015-08-07 18:13:58	2011-07-02 19:04:56
2522911	kompatible	123	https://github.com/heavysixer/kompatible	An api for hosting games on both Kongregate and Facebook	PHP	0	0	\N	1	2011-10-05 20:12:54	2013-01-04 07:28:43	2011-06-02 18:01:45
4386363	mailcar	123	https://github.com/heavysixer/mailcar	mountable rails engine for sending mail to your users.	Ruby	0	0	\N	1	2012-05-20 15:01:56	2013-01-09 04:24:42	2012-05-20 20:24:33
260542008	airship-container-images	124	https://github.com/brosner/airship-container-images	\N	Dockerfile	0	0	\N	0	2020-05-01 16:30:15	2020-06-23 15:21:18	2020-06-23 15:21:15
90988608	apistar	124	https://github.com/brosner/apistar	A smart Web API framework, designed for Python 3. ⚡️	Python	0	0	\N	0	2017-05-11 11:29:20	2017-05-11 11:29:22	2017-05-25 14:11:34
75189962	apk-rkt	124	https://github.com/brosner/apk-rkt	\N	Shell	0	0	\N	0	2016-11-30 11:35:10	2016-11-30 11:46:13	2016-11-30 18:05:46
75224480	aports	124	https://github.com/brosner/aports	Readonly mirror of aports (http://git.alpinelinux.org/cgit/aports)	Shell	0	0	\N	0	2016-11-30 18:29:35	2016-11-30 18:29:59	2016-12-08 15:27:44
700439	articles	124	https://github.com/brosner/articles	Articles by Brian Rosner	\N	0	0	\N	14	2010-06-02 23:31:46	2017-06-05 19:59:59	2010-06-03 00:04:20
282451251	aws-mfa	124	https://github.com/brosner/aws-mfa	Manage AWS MFA Security Credentials	Python	0	0	\N	0	2020-07-25 10:39:22	2020-07-25 18:00:30	2020-07-25 18:00:28
56609	beanstalkd	124	https://github.com/brosner/beanstalkd	Beanstalkd is a fast, distributed, in-memory workqueue service. Its interface is generic, but was designed for use in reducing the latency of page views in high-volume web applications by running most time-consuming tasks asynchronously.	C	0	0	\N	2	2008-09-26 00:08:43	2019-08-13 10:36:20	2008-10-26 15:13:16
217728	birdie	124	https://github.com/brosner/birdie	this is going to be awesome	\N	0	0	\N	9	2009-06-03 16:21:49	2013-10-05 22:50:52	2009-06-04 00:29:25
12513	bosnobot	124	https://github.com/brosner/bosnobot	A purely Python implemented IRC bot framework.	Python	36	4	\N	86	2008-04-25 14:24:04	2021-01-13 16:25:26	2009-04-20 01:36:01
21980808	brosner.com	124	https://github.com/brosner/brosner.com	the code behind brosner.com	JavaScript	0	0	\N	2	2014-07-18 10:15:58	2016-11-16 23:36:16	2014-07-18 10:22:27
92325	brosner.github.com	124	https://github.com/brosner/brosner.github.com	\N	\N	0	0	\N	1	2008-12-17 17:13:41	2019-08-13 10:48:20	2014-01-08 18:29:44
163783	cherrypy-wsgi-process-pool	124	https://github.com/brosner/cherrypy-wsgi-process-pool	Process pool instead of thread pool in WSGI CherryPy	Python	0	0	\N	2	2009-03-31 02:39:46	2019-08-13 11:13:50	2009-03-31 02:41:01
69144	cleese	124	https://github.com/brosner/cleese	an operating system in Python	C	0	0	\N	5	2008-10-29 03:28:34	2019-08-13 10:40:00	2009-10-11 15:01:38
993387	college-monopoly	124	https://github.com/brosner/college-monopoly	A monolopy simulation I wrote as a final project for CS101 (or something) back in 2003 (I am sure it is horrible)	C++	0	0	\N	0	2010-10-16 18:24:54	2013-10-29 18:27:36	2010-10-16 18:27:37
13691398	colour_qwiz	124	https://github.com/brosner/colour_qwiz	\N	\N	0	0	\N	0	2013-10-18 19:42:49	2013-10-18 19:42:50	2013-10-18 19:42:16
74782048	compute-image-packages	124	https://github.com/brosner/compute-image-packages	Scripts and tools for Google Compute Engine Linux images.	Python	0	0	\N	0	2016-11-25 17:02:03	2016-11-25 17:02:04	2016-11-21 22:49:41
328285	Cony	124	https://github.com/brosner/Cony	Cony is a HTTP based service for providing insight into running RabbitMQ processes	Python	1	0	\N	1	2009-10-06 06:24:50	2017-03-21 02:16:41	2009-10-07 02:51:51
134309	dapi	124	https://github.com/brosner/dapi	Django RESTful API	Python	0	0	\N	3	2009-02-21 18:45:14	2019-08-13 11:02:46	2009-02-22 04:19:27
56835	django-announcements	124	https://github.com/brosner/django-announcements	A site-wide announcement reusable app for Django.	Python	58	0	\N	59	2008-09-26 16:25:45	2020-11-09 00:26:33	2020-04-04 18:26:03
70818	django-app-test-runner	124	https://github.com/brosner/django-app-test-runner	Tools for running Django app tests standalone	Python	8	1	\N	26	2008-11-02 19:40:41	2019-12-17 00:11:08	2010-04-14 18:37:26
239840	django-atompub	124	https://github.com/brosner/django-atompub	implementation of Atom format and protocol for the Django web framework	Python	1	0	\N	0	2009-06-30 12:57:23	2012-12-12 21:10:36	2009-06-30 13:08:58
181079	django-avatar	124	https://github.com/brosner/django-avatar	A reusable django application for handling Avatars.	Python	0	0	\N	2	2009-04-20 15:45:56	2019-08-13 11:19:50	2010-06-24 16:43:21
42647	django-basic-cart	124	https://github.com/brosner/django-basic-cart	\N	Python	3	0	\N	6	2008-08-14 12:19:26	2019-08-13 10:31:38	2008-08-14 13:05:43
177881	django-bookmarks	124	https://github.com/brosner/django-bookmarks	bookmark management for the Django web framework	\N	27	0	\N	53	2009-04-16 17:03:42	2021-01-27 13:07:31	2009-04-16 17:03:59
530999	django-community	124	https://github.com/brosner/django-community	community site for djangoproject.com	Python	0	0	\N	1	2010-02-22 19:37:52	2015-01-11 00:59:28	2010-02-22 19:22:55
351309	django-csrf	124	https://github.com/brosner/django-csrf	CSRF protection pre-1.2	Python	0	0	\N	5	2009-10-27 10:52:13	2019-09-27 12:40:00	2009-10-27 12:31:00
260076	django-email-confirmation	124	https://github.com/brosner/django-email-confirmation	simple email confirmation for the Django web framework	Python	5	1	\N	9	2009-07-24 22:07:30	2018-06-01 08:11:59	2010-09-11 01:32:21
56830	django-faq	124	https://github.com/brosner/django-faq	a simple faq application for django apps	Python	1	0	\N	5	2008-09-26 16:11:13	2019-08-13 10:36:25	2008-12-17 04:14:28
246789	django-filter	124	https://github.com/brosner/django-filter	A generic system for filtering Django QuerySets based on user selections	Python	2	0	\N	6	2009-07-08 23:36:15	2015-02-10 22:11:30	2010-02-28 17:37:56
263185	django-friends	124	https://github.com/brosner/django-friends	friendship, contact and invitation management for the Django web framework	Python	2	0	\N	3	2009-07-29 01:13:29	2015-01-11 00:59:42	2010-04-12 22:43:24
29364183	angry-inch	125	https://github.com/danielmorrison/angry-inch	Just some test files. Nothing interesting.	\N	0	2	\N	1	2015-01-16 17:27:51	2015-01-22 19:06:24	2015-02-25 14:48:40
42271543	carrierwave	125	https://github.com/danielmorrison/carrierwave	Classier solution for file uploads for Rails, Sinatra and other Ruby web frameworks	Ruby	0	0	\N	0	2015-09-10 18:25:34	2015-09-10 18:25:35	2015-09-10 00:23:16
153841623	cindy_is_awesome	125	https://github.com/danielmorrison/cindy_is_awesome	Cindy Is Awesome And Everyone Loves Her	HTML	0	0	\N	0	2018-10-19 18:03:58	2018-10-19 18:04:08	2018-10-19 18:12:24
38834585	codeclimate-rubocop	125	https://github.com/danielmorrison/codeclimate-rubocop	Code Climate Engine for Rubocop 	Ruby	0	0	\N	0	2015-07-09 14:18:12	2015-07-09 14:18:12	2015-07-09 14:18:36
10827755	demo	125	https://github.com/danielmorrison/demo	\N	\N	0	0	\N	0	2013-06-20 16:29:01	2013-06-20 16:29:01	2013-06-20 16:29:01
12521218	devise-heroku	125	https://github.com/danielmorrison/devise-heroku	Heroku SSO authentication strategy for Devise	Ruby	2	0	\N	0	2013-09-01 10:50:30	2016-11-11 15:42:35	2016-09-22 11:55:26
31349300	git-game	125	https://github.com/danielmorrison/git-game	The git committer guessing game!	Ruby	0	0	\N	0	2015-02-26 00:42:04	2015-02-26 00:42:04	2015-02-26 14:47:24
99436811	hay10k	125	https://github.com/danielmorrison/hay10k	A slowly-evolving project to manage the Pickford Hay Days 10k, 5k, and 2k races.	JavaScript	0	3	\N	0	2017-08-05 14:09:45	2019-08-05 09:52:59	2020-02-25 01:28:59
23629449	heroku	125	https://github.com/danielmorrison/heroku	Heroku Client	Ruby	0	0	\N	0	2014-09-03 14:05:48	2014-09-03 14:07:47	2014-09-03 14:07:47
252809787	honeybadger-ruby	125	https://github.com/danielmorrison/honeybadger-ruby	Ruby gem for reporting errors to honeybadger.io	\N	0	0	\N	0	2020-04-03 15:30:33	2020-04-03 15:30:35	2020-04-06 16:13:13
2061738	joint	125	https://github.com/danielmorrison/joint	MongoMapper and GridFS joined in file upload love.	Ruby	0	0	\N	2	2011-07-17 10:32:42	2017-06-05 15:15:13	2011-03-18 08:46:16
147594086	model-s-api	125	https://github.com/danielmorrison/model-s-api	:oncoming_automobile: A Ruby gem and unofficial documentation of the Tesla JSON API	Ruby	0	0	\N	0	2018-09-05 21:16:11	2018-09-05 21:16:13	2018-09-05 21:18:36
6376943	pgbackups-archive	125	https://github.com/danielmorrison/pgbackups-archive	A means of automating Heroku's pgbackups and archiving them to Amazon S3 via the fog gem.	Ruby	0	0	\N	0	2012-10-24 18:25:03	2013-12-06 05:28:59	2013-12-03 16:15:41
4689	relative_time_helpers	125	https://github.com/danielmorrison/relative_time_helpers	ActionView helpers for showing relative time spans like "Jan 1 - 5" or "Jan 1 - Feb 5"	Ruby	1	0	\N	3	2008-03-04 01:52:28	2019-08-13 10:22:10	2008-03-20 17:11:53
168239911	sass-rails	125	https://github.com/danielmorrison/sass-rails	Ruby on Rails stylesheet engine for Sass	Ruby	0	0	\N	0	2019-01-29 20:31:59	2019-01-29 20:32:01	2018-11-21 14:41:00
306106569	sense-bpw-tracker	125	https://github.com/danielmorrison/sense-bpw-tracker	Use Sense energy monitor data to check savings under Holland BPW's Time of Use rate for EVs.	Ruby	0	1	\N	0	2020-10-21 14:57:30	2020-10-23 10:59:15	2020-10-23 10:59:13
160728333	standard	125	https://github.com/danielmorrison/standard	🌟 Ruby Style Guide, with linter & automatic code fixer	Ruby	0	0	\N	0	2018-12-06 18:30:08	2018-12-06 18:30:10	2019-02-01 18:29:12
9168	submodule_example	125	https://github.com/danielmorrison/submodule_example	An example of how git submodules work. See the blog post for more info.	\N	0	0	\N	3	2008-04-12 14:09:28	2019-08-13 10:22:55	2008-04-12 14:45:20
5533714	swordfish	125	https://github.com/danielmorrison/swordfish	A password management app with support for sharing with groups.	JavaScript	1	0	\N	0	2012-08-23 20:15:12	2015-02-15 17:13:11	2012-08-24 18:03:36
1883	sxsw	125	https://github.com/danielmorrison/sxsw	Download free music from SXSW	Ruby	1	0	\N	6	2008-02-29 16:23:14	2019-08-13 10:21:38	2008-03-26 16:33:14
168756107	testdouble.js	125	https://github.com/danielmorrison/testdouble.js	A minimal test double library for TDD with JavaScript	JavaScript	0	0	\N	0	2019-02-01 18:27:37	2019-02-01 18:27:40	2019-01-29 20:35:37
6830707	travis-ci.github.com	125	https://github.com/danielmorrison/travis-ci.github.com	the official Travis CI blog & documentation website	JavaScript	0	0	\N	0	2012-11-23 15:12:53	2013-01-13 05:18:11	2012-11-23 15:35:53
13853	addressbookimporter	126	https://github.com/danielharan/addressbookimporter	Fork of Adocca's importer, with a fix for gmail import	Ruby	0	0	\N	7	2008-05-01 17:23:26	2019-08-13 10:23:54	2008-05-01 17:28:30
214447	biximo	126	https://github.com/danielharan/biximo	Code for biximo.com, a mobile-accessible google map of bixi stations	Ruby	0	0	\N	4	2009-05-30 17:44:40	2017-02-23 10:47:47	2009-07-03 10:59:50
12658416	bixi_data	126	https://github.com/danielharan/bixi_data	bixi_data	Ruby	0	0	\N	0	2013-09-06 23:07:22	2014-02-06 02:35:07	2013-09-06 23:08:36
54309	bort	126	https://github.com/danielharan/bort	Base Rails app with email login instead of username. Bort: Programmed to feel pain.	Ruby	0	0	\N	2	2008-09-19 11:49:27	2019-08-13 10:35:38	2008-09-22 09:04:03
61583	canadian-postal-code-to-electoral-districts	126	https://github.com/danielharan/canadian-postal-code-to-electoral-districts	\N	\N	3	0	\N	9	2008-10-10 13:21:27	2019-08-13 10:37:41	2008-10-10 15:04:43
346222	cijoe	126	https://github.com/danielharan/cijoe	(rebuilt gem to get latest changes) CI Joe is a simple Continuous Integration server.	Ruby	1	0	\N	1	2009-10-22 14:52:06	2012-12-13 00:23:59	2009-10-22 15:05:17
574576	confidence	126	https://github.com/danielharan/confidence	MP voting record scraper	Ruby	0	0	\N	2	2010-03-22 17:22:48	2014-06-12 00:47:58	2010-03-23 14:02:05
411982	danielharan.com	126	https://github.com/danielharan/danielharan.com	personal site	Ruby	0	0	\N	1	2009-12-09 19:19:07	2013-10-14 05:46:18	2010-11-02 16:19:02
265297	github_resys	126	https://github.com/danielharan/github_resys	submission to github's contest; code will be released soon :)	Ruby	0	0	\N	6	2009-07-30 22:18:04	2014-06-24 16:04:56	2009-08-28 17:50:54
153857	hansard_scraper	126	https://github.com/danielharan/hansard_scraper	get parl.gc.ca Hansard into a saner format	Ruby	1	0	\N	5	2009-03-18 20:14:01	2019-08-13 11:10:23	2009-04-23 18:14:39
302390	hintly_client	126	https://github.com/danielharan/hintly_client	A client to handle interaction with the Hint.ly API	\N	0	0	\N	0	2009-09-09 16:48:39	2014-07-02 16:37:06	\N
142040	integrity	126	https://github.com/danielharan/integrity	The easy and fun Continuous Integration server	Ruby	0	0	\N	2	2009-03-03 13:25:26	2019-08-13 11:06:01	2009-02-27 21:54:19
73595	isochrones	126	https://github.com/danielharan/isochrones	\N	Ruby	0	0	\N	2	2008-11-09 18:03:30	2019-08-13 10:41:41	2008-11-19 00:17:38
13448322	mechanize	126	https://github.com/danielharan/mechanize	Mechanize is a ruby library that makes automated web interaction easy.	Ruby	0	0	\N	0	2013-10-09 14:02:18	2013-10-09 14:02:19	2013-08-16 14:29:30
349627	miniblog	126	https://github.com/danielharan/miniblog	the bare necessities for blogging	Ruby	0	0	\N	1	2009-10-26 01:19:40	2014-01-26 16:19:35	2009-10-26 01:34:09
548838	mp-ca-scraper	126	https://github.com/danielharan/mp-ca-scraper	scraper + web service for Canadian MPs	Ruby	0	0	\N	1	2010-03-05 15:13:39	2015-06-19 17:19:35	2010-03-05 15:15:21
161774	our-parliament	126	https://github.com/danielharan/our-parliament	Republishing Canada's Hansard	JavaScript	9	2	\N	17	2009-03-28 12:28:30	2020-04-29 08:23:19	2010-08-30 11:02:34
120285	pc_scraper	126	https://github.com/danielharan/pc_scraper	postal code to edid scraper	Ruby	1	0	\N	6	2009-02-02 21:12:44	2019-08-13 10:58:01	2009-03-08 16:09:31
79117	people_you_may_know	126	https://github.com/danielharan/people_you_may_know	given a social graph, suggests people you may know	Ruby	0	0	\N	4	2008-11-21 13:12:31	2019-08-13 10:43:43	2008-11-21 19:25:03
627103	postal_code_to_edid_webservice	126	https://github.com/danielharan/postal_code_to_edid_webservice	\N	Ruby	1	0	\N	4	2010-04-24 16:08:32	2014-01-18 03:42:33	2010-06-26 17:41:00
37898	presenter_test	126	https://github.com/danielharan/presenter_test	A simple app with r_a	Ruby	0	0	\N	3	2008-07-28 13:12:35	2019-08-13 10:30:12	2008-07-28 13:14:22
2390840	prisoners_dilemma	126	https://github.com/danielharan/prisoners_dilemma	\N	Ruby	0	0	\N	1	2011-09-15 03:52:49	2013-09-28 09:14:28	2011-09-15 06:47:12
17652479	resource_controller	126	https://github.com/danielharan/resource_controller	Rails RESTful controller abstraction plugin.	Ruby	0	0	\N	0	2014-03-11 23:19:30	2014-03-11 23:19:30	2011-09-28 06:16:23
24726	restful-authentication	126	https://github.com/danielharan/restful-authentication	Generates common user authentication code for Rails/Merb, with a full test/unit and rspec suite built-in.	Ruby	0	0	\N	4	2008-06-12 15:08:44	2019-08-13 10:26:36	2008-07-03 19:32:34
284796	ruby-aaws	126	https://github.com/danielharan/ruby-aaws	clone of https://rubyforge.org/projects/ruby-aaws/	Ruby	5	0	\N	11	2009-08-22 00:14:03	2019-07-09 11:00:34	2009-08-22 00:16:21
346508	scanty	126	https://github.com/danielharan/scanty	The blog that's almost nothing	Ruby	1	0	\N	1	2009-10-22 19:02:01	2012-12-13 00:24:30	2009-07-23 23:32:46
136728	scraper	126	https://github.com/danielharan/scraper	TODO	\N	0	0	\N	2	2009-02-24 19:17:44	2019-08-13 11:03:43	2009-02-24 19:17:51
67122	semantic-menu	126	https://github.com/danielharan/semantic-menu	A plugin to make rails menus easier to write	Ruby	30	3	\N	121	2008-10-24 01:33:52	2020-06-23 15:53:17	2010-05-05 17:33:38
502890	spree	126	https://github.com/danielharan/spree	Spree is a complete open source e-commerce solution for Ruby on Rails.	Ruby	1	0	\N	0	2010-02-04 19:01:19	2019-01-31 00:32:50	2010-02-04 14:45:38
91779	support	126	https://github.com/danielharan/support	A collection of ruby core extensions I find useful.	Ruby	0	0	\N	2	2008-12-16 22:33:57	2019-08-13 10:48:06	2009-03-27 17:11:11
283605148	.doom.d	127	https://github.com/kvnsmth/.doom.d	personal config for doom-emacs	Emacs Lisp	0	0	\N	0	2020-07-29 18:22:43	2021-01-22 14:25:05	2021-01-22 14:25:02
53173529	ask_awesomely	127	https://github.com/kvnsmth/ask_awesomely	Build Typeforms awesomely. In Ruby.	Ruby	0	0	\N	0	2016-03-04 21:06:46	2016-03-04 21:06:47	2016-03-04 21:22:00
102019	attr_remote	127	https://github.com/kvnsmth/attr_remote	Painlessly integrate ActiveResource into ActiveRecord. (very out-dated, but possibly interesting!)	Ruby	1	0	\N	8	2009-01-06 13:46:05	2020-10-09 15:12:53	2009-02-16 23:59:28
232636009	community-group	127	https://github.com/kvnsmth/community-group	This is the official DTCG repository for the design tokens specification.	\N	0	0	\N	0	2020-01-08 15:56:18	2020-01-08 15:56:20	2020-01-08 15:58:38
458511	dm-salesforce	127	https://github.com/kvnsmth/dm-salesforce	Datamapper Adapter for Salesforce	Ruby	1	0	\N	1	2010-01-04 18:39:36	2012-12-13 19:26:54	2010-01-04 18:42:51
284807738	doom-emacs	127	https://github.com/kvnsmth/doom-emacs	An Emacs framework for the stubborn martian hacker	\N	0	0	\N	0	2020-08-03 18:08:56	2020-08-03 18:08:58	2020-08-03 03:52:56
282312395	editor-plugins	127	https://github.com/kvnsmth/editor-plugins	List of editor plugins for Elm.	\N	0	0	\N	0	2020-07-24 17:41:52	2020-07-24 17:41:55	2020-02-01 03:58:08
3510990	FallingLeaves	127	https://github.com/kvnsmth/FallingLeaves	iOS reimplementation of http://www.webkit.org/blog-files/leaves/index.html	Objective-C	0	0	\N	2	2012-02-22 01:22:51	2020-10-09 15:13:13	2012-02-22 01:39:07
532131	gitx	127	https://github.com/kvnsmth/gitx	A gitk clone for OS X	Objective-C	1	0	\N	1	2010-02-23 11:58:54	2012-12-13 23:28:20	2010-01-08 11:50:46
4485750	heroku-autoscale	127	https://github.com/kvnsmth/heroku-autoscale	\N	Ruby	1	0	\N	1	2012-05-29 15:23:15	2013-10-09 00:08:53	2012-05-29 15:28:33
7964571	HockeySDK-iOS	127	https://github.com/kvnsmth/HockeySDK-iOS	The official iOS SDK for the HockeyApp service (Releases are in the master branch, current development in the default develop branch)	Objective-C	0	0	\N	0	2013-02-01 17:19:02	2013-02-04 12:17:23	2013-02-01 17:20:38
30120	image_groove	127	https://github.com/kvnsmth/image_groove	An easy way to show images + captions. (abandoned)	JavaScript	0	0	\N	2	2008-06-30 20:39:35	2020-10-09 15:13:29	2012-04-19 16:56:01
289098047	iterm2-gruvbox-light-faded	127	https://github.com/kvnsmth/iterm2-gruvbox-light-faded	A gruvbox light theme with muted contrast	\N	0	0	\N	0	2020-08-20 16:56:38	2020-08-20 17:16:48	2020-08-20 17:14:43
13133743	KVNAsync	127	https://github.com/kvnsmth/KVNAsync	Lightweight library for asynchronous tasks and eventual values (proof of concept)	Objective-C	0	5	\N	17	2013-09-26 17:38:23	2020-10-09 15:12:10	2015-02-27 17:00:15
260298593	kvnsmth-xyz	127	https://github.com/kvnsmth/kvnsmth-xyz	playground	HTML	0	0	\N	0	2020-04-30 16:20:31	2021-01-27 17:10:25	2021-01-27 17:10:22
287630253	lexic	127	https://github.com/kvnsmth/lexic	Fancy Emacs integration with the Console Version of StarDict	\N	0	0	\N	0	2020-08-14 18:48:37	2020-08-14 18:48:39	2020-08-14 18:54:05
7229103	LROAuth2Client	127	https://github.com/kvnsmth/LROAuth2Client	OAuth2 client for iPhone and iPad apps	Objective-C	1	0	\N	0	2012-12-18 17:33:56	2014-03-21 02:23:10	2012-12-19 17:36:27
677812	masonry	127	https://github.com/kvnsmth/masonry	Playing around with having a fixed corner (no longer maintained)	JavaScript	1	0	\N	4	2010-05-20 17:34:13	2015-01-13 14:46:15	2010-05-27 08:19:37
49527764	medis	127	https://github.com/kvnsmth/medis	Medis is a beautiful, easy-to-use Mac database management application for Redis.	JavaScript	0	0	\N	0	2016-01-12 18:44:41	2017-06-23 11:08:03	2016-01-12 18:50:57
12256540	mixpanel-iphone	127	https://github.com/kvnsmth/mixpanel-iphone	iPhone tracking library for Mixpanel Analytics	Objective-C	0	0	\N	0	2013-08-20 20:18:50	2013-08-20 20:18:51	2013-08-20 17:44:34
566550	mongodb-csharp	127	https://github.com/kvnsmth/mongodb-csharp	A driver written in c# to connect to the MongoDB document oriented database.	C#	1	0	\N	1	2010-03-17 09:57:42	2012-12-14 00:31:39	2010-03-18 16:07:08
12254380	NagKit	127	https://github.com/kvnsmth/NagKit	Prompt to rate an app based on configurable events.	Objective-C	0	0	\N	0	2013-08-20 18:14:12	2013-08-20 18:14:12	2013-07-31 17:42:15
79287629	nodegit	127	https://github.com/kvnsmth/nodegit	Native Node bindings to Git.	JavaScript	0	0	\N	0	2017-01-17 22:41:07	2017-01-17 22:41:10	2017-01-17 07:28:51
45427947	objective-git	127	https://github.com/kvnsmth/objective-git	Objective-C bindings to libgit2	Objective-C	0	0	\N	0	2015-11-02 21:05:34	2015-11-02 21:05:38	2015-10-25 04:15:21
3640840	objectiveflickr	127	https://github.com/kvnsmth/objectiveflickr	ObjectiveFlickr, a Flickr API framework for Objective-C	Objective-C	0	0	\N	1	2012-03-06 14:59:51	2014-04-25 14:03:14	2012-03-06 15:56:41
987138	omniauth	127	https://github.com/kvnsmth/omniauth	OmniAuth is a flexible authentication system utilizing Rack middleware.	Ruby	0	0	\N	1	2010-10-14 11:37:51	2016-08-05 18:11:48	2010-10-13 23:09:34
183958	paperclipped	127	https://github.com/kvnsmth/paperclipped	Radiant extension for managing assets and images with the Paperclip plugin	Ruby	1	1	\N	2	2009-04-23 19:16:03	2019-08-13 11:20:49	2017-09-26 21:57:34
27005450	Prototope	127	https://github.com/kvnsmth/Prototope	Swift library of lightweight interfaces for prototyping	Swift	0	0	\N	0	2014-11-22 14:53:36	2014-11-22 14:53:36	2014-11-22 15:14:52
304388788	riscv-isa-manual	127	https://github.com/kvnsmth/riscv-isa-manual	RISC-V Instruction Set Manual	\N	0	0	\N	0	2020-10-15 13:40:11	2020-10-15 13:40:13	2020-10-15 13:40:47
7928098	Specs	127	https://github.com/kvnsmth/Specs	A repository of CocoaPods (cocoapods.org) specifications.	Ruby	0	0	\N	0	2013-01-30 23:42:59	2013-01-31 15:06:06	2013-01-30 23:49:08
1862353	actionview-fields_for_with_template	128	https://github.com/collectiveidea/actionview-fields_for_with_template	Adds fields_for_with_template method for use in views where JS is used to add/remove fields	Ruby	0	0	\N	1	2011-06-07 18:50:58	2013-01-03 13:56:32	2012-03-15 14:00:11
5310	action_mailer_optional_tls	128	https://github.com/collectiveidea/action_mailer_optional_tls	Enables TLS on SMTP connections (for services like GMail)	Ruby	26	0	\N	130	2008-03-25 18:27:14	2020-04-03 15:15:39	2010-01-01 16:40:29
188451	active_merchant	128	https://github.com/collectiveidea/active_merchant	Active Merchant is a simple payment abstraction library used in and sponsored by Shopify. It is written by Tobias Luetke, Cody Fauser, and contributors. The aim of the project is to feel natural to Ruby users and to abstract as many parts as possible away from the user to offer a consistent interface across all supported gateways.	Ruby	0	0	\N	4	2009-04-29 11:02:58	2019-08-13 11:22:18	2009-06-09 12:49:44
517218	active_resource_throttle	128	https://github.com/collectiveidea/active_resource_throttle	A throttler for ActiveResource requests.	Ruby	1	0	\N	1	2010-02-14 01:29:38	2017-05-22 11:51:46	2009-05-07 12:32:56
121164	acts-as-taggable-on	128	https://github.com/collectiveidea/acts-as-taggable-on	A tagging plugin for Rails applications that allows for custom tagging along dynamic contexts.	Ruby	2	0	\N	4	2009-02-03 23:01:33	2019-08-13 10:58:19	2009-02-19 20:06:06
4141496	acts_as_audited	128	https://github.com/collectiveidea/acts_as_audited	acts_as_audited is now… Audited.	\N	1	0	\N	4	2012-04-25 18:12:24	2019-03-03 12:36:06	2012-04-25 18:20:59
364	acts_as_geocodable	128	https://github.com/collectiveidea/acts_as_geocodable	Simple geocoding for Active Record models	Ruby	39	2	\N	202	2008-02-09 14:20:11	2020-10-11 23:15:37	2017-06-03 15:41:05
365	acts_as_money	128	https://github.com/collectiveidea/acts_as_money	an Active Record plugin that makes it easier to work with the money gem	Ruby	14	0	\N	44	2008-02-09 14:22:42	2019-10-21 05:25:57	2008-11-19 19:33:32
2556385	adapter-simpledb	128	https://github.com/collectiveidea/adapter-simpledb	An adapter for Amazon's SimpleDB	Ruby	1	0	\N	3	2011-10-11 13:01:45	2019-07-12 08:41:12	2017-05-03 12:08:48
42585006	address_book	128	https://github.com/collectiveidea/address_book	A demo for teaching RSpec concepts	Ruby	0	0	\N	0	2015-09-16 09:12:52	2015-09-16 09:13:31	2015-09-16 09:13:31
236541325	apnotic	128	https://github.com/collectiveidea/apnotic	A Ruby APNs HTTP/2 gem able to provide instant feedback.	\N	2	0	\N	0	2020-01-27 13:51:50	2020-01-27 13:51:52	2020-01-27 14:00:19
123475249	ARPlaneDetector	128	https://github.com/collectiveidea/ARPlaneDetector	Use ARKit to find, and visualize horizontal and vertical planes.	Swift	6	0	\N	19	2018-03-01 15:22:36	2020-09-24 16:09:52	2018-07-13 17:47:15
95130184	ARtistry	128	https://github.com/collectiveidea/ARtistry	AR drawing demonstration app.	Swift	1	0	\N	0	2017-06-22 12:31:45	2018-03-15 11:03:40	2017-06-22 12:31:58
18355	attribute_fu	128	https://github.com/collectiveidea/attribute_fu	rails multi-model forms made easy!	Ruby	0	0	\N	3	2008-05-20 14:51:35	2019-08-13 10:24:55	2008-09-27 14:17:29
116350	audit-demo	128	https://github.com/collectiveidea/audit-demo	Demo application for acts_as_audited	\N	0	0	\N	6	2009-01-28 02:52:13	2019-08-13 10:56:42	2009-01-28 02:53:02
363	audited	128	https://github.com/collectiveidea/audited	Audited (formerly acts_as_audited) is an ORM extension that logs all changes to your Rails models.	Ruby	563	156	\N	2795	2008-02-09 14:14:05	2021-01-30 00:58:16	2021-01-24 01:56:25
74870	awesome-backup	128	https://github.com/collectiveidea/awesome-backup	Rails plugin that provides Rake and Capistrano tasks for making database backups	Ruby	3	0	\N	33	2008-11-12 11:56:24	2019-08-13 10:42:11	2009-10-13 14:01:57
362	awesomeness	128	https://github.com/collectiveidea/awesomeness	Collective Idea's Awesomeness.  A collection of useful Rails bits and pieces.	Ruby	2	0	\N	46	2008-02-09 13:44:22	2019-08-13 10:21:22	2010-11-18 23:00:53
912	awesome_nested_set	128	https://github.com/collectiveidea/awesome_nested_set	An awesome replacement for acts_as_nested_set and better_nested_set.	Ruby	482	5	\N	2214	2008-02-21 13:03:25	2021-01-22 08:57:39	2021-01-11 18:40:15
8000333	bender	128	https://github.com/collectiveidea/bender	\N	Ruby	3	1	\N	8	2013-02-04 01:17:27	2019-05-09 22:38:42	2019-02-05 21:40:01
185445109	BTExample	128	https://github.com/collectiveidea/BTExample	\N	Swift	1	0	\N	0	2019-05-07 14:04:22	2019-05-07 14:04:37	2019-05-07 14:04:35
331662	build-test	128	https://github.com/collectiveidea/build-test	Stupid simple way to test a continuous integration build server.	Shell	0	0	\N	1	2009-10-08 23:59:37	2014-01-07 02:59:22	2010-02-15 16:00:00
6830013	buildlight	128	https://github.com/collectiveidea/buildlight	Aggregating webhooks from multiple build services (Travis, Circle, Heroku) to power the stoplight in our office.	Ruby	4	10	\N	5	2012-11-23 14:20:58	2020-01-08 21:14:51	2020-07-27 19:36:43
37334	caldav	128	https://github.com/collectiveidea/caldav	A Ruby CalDAV client	Ruby	9	0	\N	40	2008-07-25 21:56:55	2019-08-13 10:30:01	2008-07-25 22:03:34
367	calendar_builder	128	https://github.com/collectiveidea/calendar_builder	\N	Ruby	5	1	\N	41	2008-02-09 14:36:15	2019-08-13 10:21:22	2018-01-21 10:17:00
15379231	capybara-ui	128	https://github.com/collectiveidea/capybara-ui	Page objects for readable, resilient acceptance tests	Ruby	0	1	\N	6	2013-12-22 15:29:52	2016-06-14 16:35:47	2013-12-26 15:30:19
2155561	chat	128	https://github.com/collectiveidea/chat	An example chat application	Ruby	3	0	\N	7	2011-08-04 13:26:56	2018-05-15 10:25:19	2014-12-17 15:56:16
368	clear_empty_attributes	128	https://github.com/collectiveidea/clear_empty_attributes	When Active Record objects are saved from a form, empty fields are saved as empty strings instead of nil.  This kills most validations.	Ruby	4	0	\N	8	2008-02-09 14:39:13	2021-01-04 08:56:40	2009-12-13 22:07:13
220316244	cms	128	https://github.com/collectiveidea/cms	Craft is a flexible, user-friendly CMS for creating custom digital experiences on the web and beyond.	\N	1	0	\N	0	2019-11-07 16:44:38	2019-11-07 16:44:40	2019-11-07 11:28:35
19291331	coderay	128	https://github.com/collectiveidea/coderay	Fast and easy syntax highlighting for selected languages, written in Ruby.	Ruby	0	0	\N	0	2014-04-29 17:59:20	2014-04-29 18:09:10	2014-04-29 18:09:09
7593795	Adafruit-GFX-Library	129	https://github.com/canadaduane/Adafruit-GFX-Library	Adafruit GFX graphics core library, this is the 'core' class that all our other graphics libraries (will eventually) derive from. Still beta (but working)	C	0	0	\N	0	2013-01-13 19:27:26	2013-01-14 00:36:44	2013-01-10 01:20:28
7593811	Adafruit-ST7735-Library	129	https://github.com/canadaduane/Adafruit-ST7735-Library	This is a library for the Adafruit 1.8" SPI display http://www.adafruit.com/products/358  and http://www.adafruit.com/products/618	Java	0	0	\N	0	2013-01-13 19:28:26	2013-05-27 14:32:57	2013-05-27 14:32:57
39300535	Adafruit_mfGFX	129	https://github.com/canadaduane/Adafruit_mfGFX	Multifont Adafruit_GFX	Objective-C	1	1	\N	4	2015-07-18 11:17:59	2021-01-19 05:49:35	2017-09-26 21:57:46
39286134	Adafruit_SSD1306	129	https://github.com/canadaduane/Adafruit_SSD1306	SSD1306 oled driver library for 'monochrome' 128x64 and 128x32 OLEDs!	C++	1	0	\N	1	2015-07-18 01:09:29	2015-10-12 03:54:07	2015-09-02 01:07:53
8018709	alfred2-dropbox	129	https://github.com/canadaduane/alfred2-dropbox	Dropbox Workflow for Alfred 2	Ruby	7	2	\N	51	2013-02-04 21:31:03	2019-08-13 12:15:39	2013-02-08 21:33:40
7946307	alfred2-ruby-framework	129	https://github.com/canadaduane/alfred2-ruby-framework	A framework for Alfred 2 workflow development in Ruby.	Ruby	2	0	\N	68	2013-01-31 19:48:05	2020-05-08 23:56:44	2013-03-29 15:17:22
229610287	amethyst	129	https://github.com/canadaduane/amethyst	Data-oriented and data-driven game engine written in Rust	\N	0	0	\N	0	2019-12-22 15:12:25	2019-12-22 15:12:27	2019-12-22 12:21:39
20196005	annotator	129	https://github.com/canadaduane/annotator	Annotation tools for the web. Select text, images, or (nearly) anything else, and add your notes.	CoffeeScript	0	0	\N	0	2014-05-26 16:21:47	2014-05-27 01:47:14	2014-05-27 01:47:14
11625888	ansible-docker	129	https://github.com/canadaduane/ansible-docker	ansible-playbook for interacting with lxc-docker containers	\N	1	1	\N	0	2013-07-24 01:06:39	2013-07-24 01:06:40	2017-09-26 21:57:51
14133700	archivist	129	https://github.com/canadaduane/archivist	Ruby client for Archive.org	Ruby	0	0	\N	0	2013-11-05 04:14:15	2013-11-07 21:46:13	2013-11-07 21:46:12
10307260	Arduino	129	https://github.com/canadaduane/Arduino	Arduino Games and Libraries	Processing	1	0	\N	0	2013-05-27 00:27:02	2013-10-10 22:34:33	2013-10-10 22:34:28
159279112	ArdusatSDK	129	https://github.com/canadaduane/ArdusatSDK	Ardusat Sensors SDK	C	0	0	\N	0	2018-11-27 03:07:12	2018-11-27 03:07:15	2018-11-27 18:55:39
229528114	arewegameyet	129	https://github.com/canadaduane/arewegameyet	The repository for arewegameyet.rs	\N	0	0	\N	0	2019-12-22 03:33:01	2019-12-22 03:33:03	2019-12-20 14:19:35
55783858	artcade-artistic-photobooth	129	https://github.com/canadaduane/artcade-artistic-photobooth	Neural-Artistic-Style (deep-learning application) Kiosk for Utah Arts Festival	Python	3	0	\N	3	2016-04-08 11:11:33	2021-01-21 12:28:08	2017-06-24 00:01:59
189683881	automerge	129	https://github.com/canadaduane/automerge	A JSON-like data structure (a CRDT) that can be modified concurrently by different users, and merged again automatically.	JavaScript	0	0	\N	0	2019-06-01 00:03:18	2019-06-01 00:03:21	2019-06-01 00:10:32
188273295	automerge-issue	129	https://github.com/canadaduane/automerge-issue	Something wrong with applyChanges?	JavaScript	0	2	\N	0	2019-05-23 13:50:24	2019-05-23 14:22:07	2020-12-11 04:50:34
191649559	automerge-mongo	129	https://github.com/canadaduane/automerge-mongo	Experimental automerge-mongodb sync (one-way to mongo) via nats-streaming-server	JavaScript	0	4	\N	0	2019-06-12 18:49:58	2019-06-12 19:05:51	2020-12-11 06:07:36
57933845	aws-sdk-esp8266	129	https://github.com/canadaduane/aws-sdk-esp8266	A fork of aws-sdk-arduino adding support for the ESP8266 module	C++	1	1	\N	0	2016-05-02 22:55:19	2016-05-02 22:55:22	2017-09-26 21:57:55
15556761	bespoke	129	https://github.com/canadaduane/bespoke	Bespoke does in-memory object joins using mustache templates	Ruby	0	0	\N	0	2013-12-31 19:03:42	2014-02-10 18:34:17	2014-02-10 18:34:17
137413565	BinkleyBot	129	https://github.com/canadaduane/BinkleyBot	Telegram bot for our family fund	Ruby	0	0	\N	0	2018-06-14 18:59:50	2018-06-17 19:56:25	2018-06-17 19:56:24
115477	bio-hmm	129	https://github.com/canadaduane/bio-hmm	Hidden Markov Model project for bioinformatics class	Perl	1	0	\N	4	2009-01-27 01:44:41	2019-08-13 10:56:25	2009-02-02 02:33:29
3348528	Bookmarkly	129	https://github.com/canadaduane/Bookmarkly	Source of bookmarkly.com, a visual bookmarking site	JavaScript	0	0	\N	1	2012-02-03 19:34:26	2013-01-07 16:02:42	2012-02-03 16:41:00
218444278	braid-spec	129	https://github.com/canadaduane/braid-spec	Working area for Braid extensions to HTTP	\N	0	0	\N	0	2019-10-30 01:37:13	2019-10-30 01:37:14	2019-10-30 01:40:52
331427591	braid-system-info	129	https://github.com/canadaduane/braid-system-info	Experimental use of Braid-HTTP to get and set system information	JavaScript	0	0	\N	3	2021-01-20 17:45:54	2021-01-26 13:44:53	2021-01-26 13:44:51
333849687	braidjs	129	https://github.com/canadaduane/braidjs	Basic typescript with tools for server and client	TypeScript	0	0	\N	0	2021-01-28 15:31:33	2021-01-28 18:07:06	2021-01-28 18:07:04
206686481	braidjs-simple-server	129	https://github.com/canadaduane/braidjs-simple-server	BraidJS state synchronization server example	JavaScript	0	2	\N	0	2019-09-05 22:18:45	2019-09-05 22:21:59	2020-12-11 16:59:53
190309	BraveZealot	129	https://github.com/canadaduane/BraveZealot	bzFlag AI Bot	Ruby	1	0	\N	4	2009-05-01 15:07:26	2019-08-13 11:22:59	2009-06-15 14:06:02
145300549	bs-tea-starter-kit	129	https://github.com/canadaduane/bs-tea-starter-kit	A bucklescript-tea starter kit.	OCaml	0	0	\N	1	2018-08-19 09:19:27	2019-07-15 17:56:48	2018-08-19 09:33:42
107829226	bucklescript	129	https://github.com/canadaduane/bucklescript	A backend for the OCaml compiler which emits JavaScript.	OCaml	0	0	\N	0	2017-10-21 23:41:38	2017-10-21 23:41:46	2017-10-21 23:42:43
133087335	bucklescript-tea	129	https://github.com/canadaduane/bucklescript-tea	TEA for Bucklescript	OCaml	0	0	\N	0	2018-05-11 17:49:36	2018-05-11 17:49:38	2018-05-12 21:47:33
8373082	agency	130	https://github.com/nate/agency	An actor library built with agent.	Ruby	0	0	\N	0	2013-02-23 05:53:38	2014-01-18 20:34:34	2013-02-23 06:54:59
198535234	agent	130	https://github.com/nate/agent	Agent is an attempt at modelling Go-like concurrency, in Ruby	Ruby	0	0	\N	0	2019-07-23 22:31:56	2019-07-23 22:31:59	2016-09-21 10:48:15
99828907	alchemist.vim	130	https://github.com/nate/alchemist.vim	Elixir Integration Into Vim	Elixir	0	0	\N	0	2017-08-09 13:17:46	2017-08-09 13:17:48	2017-08-07 16:59:28
171345325	app_env	130	https://github.com/nate/app_env	A way to copy environment variables into the Application config at startup in an Elixir app.	Elixir	1	0	\N	0	2019-02-18 16:42:23	2019-02-18 18:44:09	2019-02-18 18:44:07
149190084	asdf	130	https://github.com/nate/asdf	Extendable version manager with support for Ruby, Node.js, Elixir, Erlang & more	Shell	0	0	\N	0	2018-09-17 18:26:22	2018-09-17 18:26:24	2018-09-17 18:29:36
283660007	asdf-mysql	130	https://github.com/nate/asdf-mysql	A MySQL Plugin for asdf	\N	0	0	\N	0	2020-07-30 00:28:04	2020-07-30 00:28:06	2019-10-02 10:42:25
16330438	attr_encrypted	130	https://github.com/nate/attr_encrypted	Generates attr_accessors that encrypt and decrypt attributes	Ruby	0	0	\N	0	2014-01-28 22:00:33	2014-01-28 22:31:56	2014-01-28 22:30:55
50540077	aws-sdk-ruby	130	https://github.com/nate/aws-sdk-ruby	The official AWS SDK for Ruby.	Ruby	0	0	\N	0	2016-01-27 19:46:49	2016-01-27 19:46:52	2016-01-27 19:59:58
63896531	azure-storage-node	130	https://github.com/nate/azure-storage-node	Microsoft Azure Storage SDK for Node.js	JavaScript	0	0	\N	0	2016-07-21 16:23:58	2016-07-21 16:24:00	2016-06-28 02:31:45
229298725	babashka	130	https://github.com/nate/babashka	A Clojure babushka for the grey areas of Bash.	Clojure	0	0	\N	0	2019-12-20 13:24:56	2021-01-01 07:12:25	2020-01-06 22:10:55
982855	bare-rails-template	130	https://github.com/nate/bare-rails-template	A very bare rails template with some things we tend to use a lot	\N	0	0	\N	2	2010-10-12 22:17:04	2013-10-08 11:46:13	2010-10-12 23:33:20
9101483	bluepill	130	https://github.com/nate/bluepill	simple process monitoring tool	Ruby	0	0	\N	0	2013-03-29 12:58:57	2013-03-30 03:37:47	2013-03-29 13:05:46
56729919	brew	130	https://github.com/nate/brew	:beer: The missing package manager for OS X	Ruby	0	0	\N	0	2016-04-20 21:30:41	2016-04-20 21:30:43	2016-04-20 21:06:46
236100902	bundler.el	130	https://github.com/nate/bundler.el	Bundler helpers for Emacs.	Emacs Lisp	0	0	\N	0	2020-01-24 20:29:38	2020-01-24 21:21:38	2020-01-24 21:21:36
334325616	calor	130	https://github.com/nate/calor	make those colors hot, janet	\N	0	0	\N	0	2021-01-30 01:16:27	2021-01-30 01:16:32	2021-01-30 01:16:29
3840556	celluloid	130	https://github.com/nate/celluloid	Actor-based concurrent object framework for Ruby	Ruby	0	0	\N	1	2012-03-27 01:58:12	2013-01-08 08:17:53	2012-03-27 02:26:19
283873607	coast	130	https://github.com/nate/coast	The fullest full stack clojure web framework	Clojure	0	0	\N	0	2020-07-30 17:46:51	2020-07-31 20:09:24	2020-07-31 20:09:21
4258033	connection_pool	130	https://github.com/nate/connection_pool	Generic connection pooling for Ruby	Ruby	0	0	\N	2	2012-05-08 03:56:13	2013-10-08 11:46:07	2012-03-07 19:46:12
12287683	cql-rb	130	https://github.com/nate/cql-rb	Cassandra CQL 3 binary protocol driver for Ruby	Ruby	0	0	\N	0	2013-08-22 00:40:18	2013-08-27 10:48:22	2013-08-27 10:48:17
37189334	crystal	130	https://github.com/nate/crystal	The Crystal Programming Language	Crystal	0	0	\N	0	2015-06-10 06:57:37	2016-02-24 13:09:42	2015-06-10 07:15:51
29673846	dd-agent	130	https://github.com/nate/dd-agent	Datadog Agent	Python	0	0	\N	0	2015-01-22 08:45:14	2015-01-22 08:45:16	2015-01-22 08:58:22
1141129	delayed_job	130	https://github.com/nate/delayed_job	Database based asynchronously priority queue system -- Extracted from Shopify 	Ruby	0	0	\N	1	2010-12-05 18:49:53	2012-12-15 23:43:25	2010-12-05 21:04:53
230542656	depstar	130	https://github.com/nate/depstar	A clj-based uberjarrer (based on healthfinch/depstar, with enhancements)	\N	0	0	\N	0	2019-12-27 22:35:12	2019-12-27 22:35:14	2019-10-19 00:49:54
302790750	doom-emacs	130	https://github.com/nate/doom-emacs	An Emacs framework for the stubborn martian hacker	\N	0	0	\N	0	2020-10-09 22:41:34	2020-10-09 22:41:36	2020-10-09 22:44:15
1661639	dropship	130	https://github.com/nate/dropship	Instantly transfer files between Dropbox accounts using only their hashes.	Python	0	0	\N	2	2011-04-25 17:58:46	2020-10-21 15:57:27	2011-04-25 16:38:15
45663213	elixir-lang.github.com	130	https://github.com/nate/elixir-lang.github.com	Website for Elixir	CSS	0	0	\N	0	2015-11-06 04:16:13	2015-11-06 04:16:14	2015-11-01 12:34:28
47660248	elixir-tmbundle	130	https://github.com/nate/elixir-tmbundle	A TextMate and Sublime Text Bundle for the Elixir programming language.	JavaScript	0	0	\N	0	2015-12-08 23:20:04	2017-07-30 06:15:06	2015-11-19 16:47:54
8103802	ethon	130	https://github.com/nate/ethon	Very simple libcurl wrapper.	Ruby	0	0	\N	0	2013-02-08 22:05:07	2013-02-14 07:24:39	2013-02-14 04:15:49
286338270	evil-cleverparens	130	https://github.com/nate/evil-cleverparens	Evil normal-state minor-mode for editing lisp-like languages. Work in progress.	Emacs Lisp	0	0	\N	0	2020-08-09 21:10:07	2020-08-09 21:19:33	2020-08-09 21:19:31
299452094	example-clojure-postgres-leiningen-app	130	https://github.com/nate/example-clojure-postgres-leiningen-app	\N	Clojure	0	0	\N	0	2020-09-28 20:08:54	2020-09-28 20:09:21	2020-09-28 20:09:19
6409519	ain	131	https://github.com/dstrelau/ain	Syslog logging for node.js	JavaScript	0	0	\N	0	2012-10-26 17:50:42	2013-01-12 18:40:43	2012-02-04 08:25:13
15190005	api-blueprint	131	https://github.com/dstrelau/api-blueprint	API Blueprint	\N	0	0	\N	0	2013-12-14 15:59:22	2013-12-14 15:59:23	2013-12-12 19:27:17
2622116	carlbot	131	https://github.com/dstrelau/carlbot	Carl, your friendly campfire robot	CoffeeScript	0	1	\N	0	2011-10-21 16:09:57	2014-06-07 09:46:12	2011-10-21 16:13:17
14648173	circle2slack	131	https://github.com/dstrelau/circle2slack	\N	Go	0	0	\N	1	2013-11-23 16:43:40	2013-11-23 16:45:03	2013-11-23 16:44:58
817342	code-katas	131	https://github.com/dstrelau/code-katas	\N	Ruby	0	0	\N	1	2010-08-04 13:29:12	2014-05-07 20:28:06	2010-08-04 13:29:52
141340693	concourse-git-bitbucket-pr-resource	131	https://github.com/dstrelau/concourse-git-bitbucket-pr-resource	:rocket: Concourse CI resource for tracking git branches for Bitbucket pull-requests	Shell	0	0	\N	0	2018-07-17 17:33:57	2018-07-17 17:33:59	2018-06-20 06:09:47
140718088	contentful-go	131	https://github.com/dstrelau/contentful-go	Contentful api SDK for GoLang	Go	0	0	\N	0	2018-07-12 10:38:32	2018-07-12 10:38:34	2018-07-12 10:41:05
135592080	dstrelau	131	https://github.com/dstrelau/dstrelau	\N	Vim script	0	0	\N	0	2018-05-31 11:07:17	2021-01-28 17:54:52	2021-01-28 17:54:49
5012990	euler	131	https://github.com/dstrelau/euler	Solutions to Project Euler problems in various languages	Go	0	0	\N	0	2012-07-12 22:52:15	2019-04-11 14:43:51	2019-04-11 14:43:50
293689	general_hawk	131	https://github.com/dstrelau/general_hawk	Hawk keeps your army of C.I. Joes in check	Ruby	0	0	\N	1	2009-08-31 18:57:58	2014-04-10 13:04:46	2009-08-31 19:14:16
57096658	go-nuts-presentation	131	https://github.com/dstrelau/go-nuts-presentation	Lunch & Learn — A Fast-Paced Intro to Go	Go	0	0	\N	0	2016-04-26 01:01:21	2016-04-26 01:02:32	2016-04-27 13:05:07
1931796	goliath	131	https://github.com/dstrelau/goliath	Goliath is a non-blocking Ruby web server framework	Ruby	0	0	\N	0	2011-06-21 18:41:10	2013-10-23 23:51:37	2011-06-22 13:48:47
1516792	guard-forku	131	https://github.com/dstrelau/guard-forku	\N	Ruby	0	0	\N	1	2011-03-23 12:30:27	2012-12-31 13:36:55	2011-03-23 17:50:58
4394893	heroku-buildpack-nginx	131	https://github.com/dstrelau/heroku-buildpack-nginx	\N	Shell	0	0	\N	0	2012-05-21 12:09:20	2013-10-23 21:13:16	2012-05-21 13:56:00
41184727	homebrew	131	https://github.com/dstrelau/homebrew	:beer: The missing package manager for OS X.	Ruby	0	0	\N	0	2015-08-21 22:26:07	2015-08-21 22:26:23	2015-08-21 21:11:34
2655156	hubot-scripts	131	https://github.com/dstrelau/hubot-scripts	optional scripts for hubot, opt in via hubot-scripts.json	CoffeeScript	0	0	\N	0	2011-10-26 23:27:51	2013-10-23 23:49:08	2011-11-11 15:22:45
17786374	hubot-slack	131	https://github.com/dstrelau/hubot-slack	\N	CoffeeScript	0	0	\N	0	2014-03-15 18:54:23	2016-11-02 14:05:07	2014-03-15 19:29:39
2432177	knife-brightbox	131	https://github.com/dstrelau/knife-brightbox	Opscode Chef knife plug-in for Brightbox Cloud	Ruby	0	0	\N	0	2011-09-21 16:29:20	2013-10-23 23:49:33	2011-09-21 16:35:27
72565422	log	131	https://github.com/dstrelau/log	Structured logging package for Go.	Go	0	0	\N	0	2016-11-01 16:40:36	2016-11-01 16:40:37	2016-11-01 17:33:47
59612112	logrus	131	https://github.com/dstrelau/logrus	Structured, pluggable logging for Go.	Go	0	0	\N	0	2016-05-24 19:11:06	2016-05-24 19:11:07	2016-05-24 14:28:59
274497466	me	131	https://github.com/dstrelau/me	My resume/portfolio	\N	0	0	\N	0	2020-06-23 17:00:22	2020-07-06 14:12:39	2020-07-06 14:12:36
1489523	meme	131	https://github.com/dstrelau/meme	Generate memes from http://memegenerator.net	Ruby	0	0	\N	1	2011-03-16 20:25:16	2012-12-25 08:14:58	2011-04-01 17:28:15
174056558	Model01-Firmware	131	https://github.com/dstrelau/Model01-Firmware	The "standard" Keyboardio Model 01 Firmware sketch.	C++	0	0	\N	0	2019-03-05 23:32:55	2019-03-05 23:32:57	2019-03-05 21:55:30
225644367	monkey-rs	131	https://github.com/dstrelau/monkey-rs	The Monkey programming language from interpreterbook.com, in Rust	Rust	0	0	\N	0	2019-12-03 11:48:39	2020-01-30 23:08:04	2020-11-23 17:31:24
18653438	multiset	131	https://github.com/dstrelau/multiset	Ruby implementation of multisets / Rubyによる多重集合の実装	Ruby	0	0	\N	0	2014-04-10 19:03:47	2014-05-15 13:26:35	2014-04-10 19:25:29
2529900	pathways	131	https://github.com/dstrelau/pathways	Pathways Ruby Gem - Find out the common pathways within your Rails app.	Ruby	0	0	\N	0	2011-10-06 22:13:20	2013-10-23 23:49:10	2011-10-07 00:02:53
10066404	pinky	131	https://github.com/dstrelau/pinky	caching the brain (aka faceted)	Ruby	0	0	\N	0	2013-05-14 19:34:37	2013-05-14 19:37:52	2013-05-14 19:37:51
40326990	protobuf	131	https://github.com/dstrelau/protobuf	Protocol Buffers - Google's data interchange format	C++	0	0	\N	0	2015-08-06 18:07:28	2018-08-21 09:18:24	2015-08-06 15:25:18
4185614	puma	131	https://github.com/dstrelau/puma	A ruby web server built for concurrency	Ruby	0	0	\N	0	2012-04-30 15:28:42	2013-10-23 21:14:06	2012-04-30 15:55:36
60735048	qmk_firmware	131	https://github.com/dstrelau/qmk_firmware	keyboard controller firmware for Atmel AVR USB family	C	0	0	\N	1	2016-06-08 19:29:47	2018-03-28 13:57:19	2019-03-18 11:13:20
268467975	actioncable-streamvideo-demo	132	https://github.com/sunny/actioncable-streamvideo-demo	This is demo StreamVideo via ActionCable (Rails 5)	\N	0	0	\N	0	2020-06-01 05:37:30	2020-06-01 05:37:31	2020-05-22 11:59:37
21737134	action_mailer_auto_url_options	132	https://github.com/sunny/action_mailer_auto_url_options	Make ActionMailer use the current request host and protocol for URL generation	Ruby	3	1	\N	14	2014-07-11 10:31:28	2020-10-08 04:31:36	2020-12-10 01:24:45
6825887	active_admin	132	https://github.com/sunny/active_admin	The administration framework for Ruby on Rails applications.	Ruby	0	0	\N	0	2012-11-23 08:31:37	2015-01-23 02:12:25	2014-02-18 18:18:36
160562941	active_admin_datetimepicker	132	https://github.com/sunny/active_admin_datetimepicker	:calendar: active_admin_datetimepicker gem	Ruby	0	0	\N	0	2018-12-05 16:44:22	2018-12-05 16:44:24	2018-12-06 12:08:54
148713945	active_currency	132	https://github.com/sunny/active_currency	Rails plugin to store currency rates in the database	Ruby	2	0	\N	11	2018-09-13 21:29:47	2021-01-15 07:17:17	2021-01-15 07:17:14
247253582	actor	132	https://github.com/sunny/actor	Composable Ruby service objects	Ruby	4	0	\N	101	2020-03-14 07:12:53	2021-01-25 05:01:28	2020-12-07 06:07:58
249772064	actor-rails	132	https://github.com/sunny/actor-rails	Actor Rails provides Rails support to the Actor service objects	Ruby	0	0	\N	1	2020-03-24 14:22:44	2020-06-11 07:42:08	2020-06-14 06:41:36
191653820	acts-as-taggable-on	132	https://github.com/sunny/acts-as-taggable-on	A tagging plugin for Rails applications that allows for custom tagging along dynamic contexts.	Ruby	0	0	\N	0	2019-06-12 19:36:28	2019-06-12 19:36:31	2019-06-11 00:50:43
254165470	algo-structures	132	https://github.com/sunny/algo-structures	de "petits" exercices plutôt pour les juniors (quoique...) pour (re)découvrir des notions d'algorithmie 	\N	0	0	\N	0	2020-04-08 15:12:43	2020-04-08 15:12:45	2019-09-11 12:26:48
131402156	all3dp	132	https://github.com/sunny/all3dp	Ruby gem to send 3D files to Craftcloud, All3DP's 3D Printing Price Comparison Service API	Ruby	0	0	\N	0	2018-04-28 08:01:55	2020-12-05 09:33:12	2020-12-05 09:33:09
97917	allocine	132	https://github.com/sunny/allocine	Allocine.fr parser	Ruby	5	0	\N	2	2008-12-29 12:24:32	2020-06-14 07:09:59	2020-06-14 07:09:39
1265458	anyplayer	132	https://github.com/sunny/anyplayer	Interact with the currently running music player. Supports iTunes Mac, iTunes Windows, Spotify Mac, Rdio Mac, MPD, Rhythmbox, Amarok and XMMS2.	Ruby	9	1	\N	43	2011-01-17 22:32:10	2020-12-19 13:33:36	2020-12-20 06:39:16
166799360	appsignal_helper	132	https://github.com/sunny/appsignal_helper	\N	Ruby	0	0	\N	0	2019-01-21 09:01:44	2019-01-21 09:01:46	2019-01-21 09:17:21
26229685	archives	132	https://github.com/sunny/archives	\N	CoffeeScript	0	0	\N	0	2014-11-05 14:55:44	2014-11-05 14:56:38	2014-11-05 14:56:46
289271581	asset_sync	132	https://github.com/sunny/asset_sync	Synchronises Assets between Rails and S3	\N	0	0	\N	0	2020-08-21 10:05:15	2020-08-21 10:05:18	2020-08-21 10:07:23
31502061	authentise	132	https://github.com/sunny/authentise	Ruby gem to access Authentise's API	Ruby	0	0	\N	0	2015-03-01 13:19:05	2016-05-27 13:48:19	2020-06-14 06:57:09
11145909	auto_strip_attributes	132	https://github.com/sunny/auto_strip_attributes	AutoStripAttributes gem for Rails helps to remove unnecessary whitespaces from ActiveRecord or ActiveModel attributes. It's good for removing accidental spaces from user inputs (e.g. when user copy/pastes some value to a form and the value has extra spaces at the end).	Ruby	0	0	\N	0	2013-07-03 05:44:33	2013-07-03 06:38:03	2013-07-03 05:45:50
37197732	awesome-events	132	https://github.com/sunny/awesome-events	A collection of awesome Ruby events (meetups, conferences, camps, etc.) from around the world	\N	0	0	\N	0	2015-06-10 10:09:11	2015-06-10 09:11:27	2015-06-10 12:30:14
102840891	awesome_webradios	132	https://github.com/sunny/awesome_webradios	A list of cool web radios	\N	0	0	\N	0	2017-09-08 05:56:40	2017-09-07 09:23:19	2017-09-11 04:38:59
31250662	awesomplete	132	https://github.com/sunny/awesomplete	Ultra lightweight, usable, beautiful autocomplete with zero dependencies.	HTML	0	0	\N	0	2015-02-24 05:18:06	2015-02-24 05:18:06	2015-02-24 15:17:57
95750	beadmin	132	https://github.com/sunny/beadmin	\N	Python	0	0	\N	3	2008-12-23 08:20:22	2019-08-13 10:49:39	2008-12-23 08:30:27
620073	bigbuttons	132	https://github.com/sunny/bigbuttons	Big buttons which one punches to make sweet HTML5 <audio> sound	JavaScript	0	0	\N	7	2010-04-20 15:34:20	2020-02-14 10:32:35	2020-06-14 06:44:18
14525840	browser_details	132	https://github.com/sunny/browser_details	Browser Details is a Rack Middleware that logs information about the browser used to make a request	Ruby	0	0	\N	0	2013-11-19 11:49:46	2013-11-19 16:55:22	2013-11-19 14:24:49
14758867	bundler	132	https://github.com/sunny/bundler	Manage your application's gem dependencies with less pain	Ruby	0	0	\N	0	2013-11-27 18:56:46	2020-01-09 22:12:17	2017-10-06 05:20:22
24365595	caniuse	132	https://github.com/sunny/caniuse	Raw browser/feature support data from caniuse.com	\N	0	0	\N	0	2014-09-23 06:43:39	2014-09-21 19:35:26	2014-09-23 06:51:54
1730787	Sparkle	135	https://github.com/richcollins/Sparkle	A software update framework for the Mac	Objective-C	0	0	\N	1	2011-05-10 20:52:58	2014-06-28 13:09:44	2011-05-11 01:06:31
11975858	carrierwave	132	https://github.com/sunny/carrierwave	Classier solution for file uploads for Rails, Sinatra and other Ruby web frameworks	Ruby	0	0	\N	0	2013-08-08 09:35:05	2013-08-08 13:10:05	2013-08-08 13:10:03
41968515	carrierwave-bombshelter	132	https://github.com/sunny/carrierwave-bombshelter	Protects your carrierwave from image bombs	Ruby	0	0	\N	0	2015-09-05 13:49:49	2015-09-05 13:49:50	2015-09-05 13:57:44
46985059	carrierwave-color	132	https://github.com/sunny/carrierwave-color	Store the dominant color of an image with CarrierWave	Ruby	3	0	\N	17	2015-11-27 12:42:56	2020-12-27 07:49:05	2020-06-14 06:25:20
17322587	carrierwave-processing	132	https://github.com/sunny/carrierwave-processing	Additional processing support for MiniMagick and RMagick	Ruby	0	0	\N	0	2014-03-01 16:37:51	2014-03-01 17:28:12	2017-06-13 07:02:01
19756560	carrierwave-processing-dominant_color	132	https://github.com/sunny/carrierwave-processing-dominant_color	Store the dominant color of an image with CarrierWave (MOVED to carrierwave-color)	\N	0	0	\N	2	2014-05-13 18:27:39	2020-06-14 06:59:10	2020-06-14 06:58:38
5616630	abstract_type	133	https://github.com/dkubb/abstract_type	\N	Ruby	9	3	\N	56	2012-08-30 12:15:17	2020-02-18 04:52:53	2015-06-28 02:11:44
5299159	adamantium	133	https://github.com/dkubb/adamantium	Create immutable objects	Ruby	13	9	\N	377	2012-08-04 19:17:25	2020-09-15 09:05:57	2016-04-13 00:28:10
111438983	addressable	133	https://github.com/dkubb/addressable	Addressable is a replacement for the URI implementation that is part of Ruby's standard library. It more closely conforms to RFC 3986, RFC 3987, and RFC 6570 (level 4), additionally providing support for IRIs and URI templates.	Ruby	0	0	\N	0	2017-11-20 15:03:07	2017-11-20 15:03:09	2017-11-12 10:53:47
457690	axiom	133	https://github.com/dkubb/axiom	Simplifies querying of structured data using relational algebra	Ruby	23	6	\N	457	2010-01-04 03:29:51	2021-01-22 07:50:22	2018-11-19 19:49:11
2024810	axiom-do-adapter	133	https://github.com/dkubb/axiom-do-adapter	Use Axiom relations with an RDBMS	Ruby	3	2	\N	14	2011-07-10 03:34:42	2016-12-06 19:39:14	2014-01-24 07:02:07
6661017	axiom-logic	133	https://github.com/dkubb/axiom-logic	\N	\N	0	0	\N	1	2012-11-12 19:36:00	2013-02-28 14:37:32	2012-11-12 19:36:00
10813588	axiom-memory-adapter	133	https://github.com/dkubb/axiom-memory-adapter	Axiom Memory adapter	Ruby	2	0	\N	8	2013-06-20 03:25:35	2020-12-01 18:40:25	2014-03-28 19:08:54
1575483	axiom-optimizer	133	https://github.com/dkubb/axiom-optimizer	Relational algebra optimizer	Ruby	0	0	\N	22	2011-04-06 00:49:04	2019-08-13 11:43:44	2014-01-24 06:46:08
316850927	axiom-rs	133	https://github.com/dkubb/axiom-rs	Axiom port for rust	\N	0	0	\N	3	2020-11-28 22:00:09	2020-12-04 09:37:57	2020-11-28 22:00:29
1199440	axiom-sql-generator	133	https://github.com/dkubb/axiom-sql-generator	Relational algebra SQL generator	Ruby	3	3	\N	33	2010-12-26 21:54:11	2019-08-13 11:39:59	2014-01-24 06:55:17
7849193	axiom-types	133	https://github.com/dkubb/axiom-types	Define types with optional constraints	Ruby	6	4	\N	35	2013-01-27 04:51:29	2020-11-20 07:50:13	2017-02-04 12:20:39
283251395	bank-ocr-kata	133	https://github.com/dkubb/bank-ocr-kata	Bank OCR Kata	\N	0	1	\N	0	2020-07-28 12:22:23	2020-07-28 17:03:09	2020-08-06 16:47:29
32279306	bot	133	https://github.com/dkubb/bot	A build bot	Haskell	0	12	\N	2	2015-03-15 16:24:32	2015-07-06 14:58:34	2015-07-18 20:42:39
85193509	busybox	133	https://github.com/dkubb/busybox	Fork of git://android.git.linaro.org/platform/external/busybox.git	C	0	0	\N	0	2017-03-16 09:29:56	2017-03-16 09:30:02	2012-03-18 01:16:08
5616645	descendants_tracker	133	https://github.com/dkubb/descendants_tracker	Track descendants of a class	Ruby	12	2	\N	41	2012-08-30 12:16:35	2020-11-20 07:50:11	2017-02-04 12:18:34
130420988	dhall-haskell	133	https://github.com/dkubb/dhall-haskell	A configuration language guaranteed to terminate	Haskell	0	0	\N	0	2018-04-20 19:59:10	2018-04-20 19:59:12	2018-04-15 20:50:18
123999	dm-ambition	133	https://github.com/dkubb/dm-ambition	Ambition inspired API for DataMapper 	Ruby	0	0	\N	13	2009-02-07 19:30:56	2020-07-10 05:28:26	2011-11-03 17:47:24
10675225	dm-cassandra-adapter	133	https://github.com/dkubb/dm-cassandra-adapter	Cassandra DataMapper Adapter	Ruby	0	0	\N	0	2013-06-13 17:28:45	2016-07-28 13:45:52	2014-05-19 20:59:22
40729544	dockerfiles	133	https://github.com/dkubb/dockerfiles	A set of docker images I use for development	Shell	0	3	\N	10	2015-08-14 15:11:56	2019-07-11 10:50:08	2017-06-22 09:35:24
5616644	equalizer	133	https://github.com/dkubb/equalizer	Define equality, equivalency and hash methods automatically	Ruby	16	5	\N	201	2012-08-30 12:16:06	2020-11-20 07:51:22	2020-04-16 16:52:45
39737766	ghc-musl	133	https://github.com/dkubb/ghc-musl	Using GHC with musl libc to get true static linking	Shell	2	0	\N	0	2015-07-26 15:59:35	2015-07-29 03:23:09	2015-07-29 03:00:13
269683462	gilded_rose_kata	133	https://github.com/dkubb/gilded_rose_kata	The Gilded Rose Code Cata	\N	1	2	\N	0	2020-06-05 12:25:31	2020-07-28 17:03:30	2020-09-01 14:00:03
43704990	git-set-mtime	133	https://github.com/dkubb/git-set-mtime	set files mtime by latest commit time.	Ruby	0	0	\N	0	2015-10-05 15:28:08	2015-10-05 15:28:09	2015-10-05 15:41:14
30732577	git-tools	133	https://github.com/dkubb/git-tools	A small collection of git tools	Shell	3	3	\N	8	2015-02-12 22:24:52	2020-11-03 18:49:52	2020-09-09 14:17:13
39979643	haskell-builder	133	https://github.com/dkubb/haskell-builder	A docker container for compiling statically linked binaries written in Haskell	Shell	5	1	\N	25	2015-07-30 22:09:12	2019-08-18 13:49:02	2015-08-25 12:39:15
3783794	ice_nine	133	https://github.com/dkubb/ice_nine	Deep Freeze Ruby Objects	Ruby	19	15	\N	290	2012-03-21 02:55:13	2020-11-20 07:50:12	2021-01-21 15:12:48
13167259	memoizable	133	https://github.com/dkubb/memoizable	Memoize method return values	Ruby	10	5	\N	103	2013-09-28 01:46:50	2020-12-05 07:38:16	2020-10-20 22:13:27
16056494	mutant	133	https://github.com/dkubb/mutant	Mutation tests for ruby	Ruby	0	0	\N	0	2014-01-19 21:15:17	2018-08-08 15:46:38	2014-01-18 21:46:50
33769982	ploeh.github.com	133	https://github.com/dkubb/ploeh.github.com	ploeh blog 'source code'	HTML	0	0	\N	0	2015-04-11 06:23:34	2015-04-11 14:55:47	2015-04-11 15:45:41
3332026	project-euler	133	https://github.com/dkubb/project-euler	Project Euler in Haskell	Haskell	0	0	\N	2	2012-02-02 02:43:57	2013-11-02 22:07:20	2012-02-09 04:52:56
382450	acts-as-list	134	https://github.com/jnicklas/acts-as-list	Gem version of acts_as_list Rails plugin.	Ruby	1	0	\N	1	2009-11-23 09:45:46	2012-12-13 12:26:26	2009-11-23 09:48:55
35230	acts_as_xapian	134	https://github.com/jnicklas/acts_as_xapian	Xapian full text search plugin for Ruby on Rails	Ruby	0	0	\N	2	2008-07-18 13:02:22	2019-08-13 10:29:25	2008-07-18 13:02:23
1500567	advanced_capybara	134	https://github.com/jnicklas/advanced_capybara	A repo containing the example app and slides of my advanced capybara talk	Ruby	2	4	\N	6	2011-03-19 14:17:18	2020-11-04 02:55:16	2020-07-28 01:01:08
1324658	akephalos	134	https://github.com/jnicklas/akephalos	Headless HTMLUnit powered browser for Capybara	Ruby	0	0	\N	1	2011-02-03 14:08:50	2012-12-17 20:59:54	2011-02-03 12:08:20
202535645	angular-cli-rails	134	https://github.com/jnicklas/angular-cli-rails	Unify your EmberCLI and Rails Workflows	Ruby	0	0	\N	1	2019-08-15 09:18:04	2020-11-04 02:55:40	2019-04-12 17:02:01
305344097	attveta	134	https://github.com/jnicklas/attveta	Foundation website	HTML	0	0	\N	1	2020-10-19 07:18:52	2020-11-04 02:55:02	2020-10-19 07:20:08
262035645	bigtest-examples	134	https://github.com/jnicklas/bigtest-examples	An example application demonstrating the use of the new bigtest	\N	0	0	\N	1	2020-05-07 08:47:54	2020-11-04 02:55:18	2020-05-07 08:48:42
457303	bistro_car	134	https://github.com/jnicklas/bistro_car	This project is obsolete. Use the asset pipeline now built into Rails instead.	Ruby	11	1	\N	102	2010-01-03 18:53:55	2020-10-29 16:33:20	2010-05-09 12:06:38
167522558	bottled-water	134	https://github.com/jnicklas/bottled-water	Kafka Connect + Postgres + Debezium and KSQL on Heroku	Shell	0	0	\N	1	2019-01-25 07:36:22	2020-11-04 02:55:41	2019-01-25 07:37:34
17213684	broccoli	134	https://github.com/jnicklas/broccoli	Browser compilation library – a framework for building applications that run in the browser	JavaScript	0	0	\N	0	2014-02-26 11:44:46	2014-06-17 17:08:53	2015-10-11 08:14:56
17210833	broccoli-sass	134	https://github.com/jnicklas/broccoli-sass	\N	JavaScript	0	0	\N	0	2014-02-26 10:05:29	2014-02-26 10:12:45	2014-02-26 10:10:23
20968908	broccoli-traceur	134	https://github.com/jnicklas/broccoli-traceur	Traceur is a JavaScript.next to JavaScript-of-today compiler	JavaScript	0	0	\N	0	2014-06-18 13:11:37	2014-06-18 20:23:57	2014-06-18 15:15:36
100391900	buildkite-revparse-bug	134	https://github.com/jnicklas/buildkite-revparse-bug	Test repo to check for a particular bug on buildkite, please ignore	\N	0	0	\N	0	2017-08-15 12:31:25	2017-08-15 12:31:25	2017-08-15 12:42:10
51583404	buildkite_test	134	https://github.com/jnicklas/buildkite_test	Experimenting with buildkite	Ruby	0	0	\N	0	2016-02-12 09:26:32	2016-02-12 09:28:11	2016-02-12 09:32:13
56872124	build_compile	134	https://github.com/jnicklas/build_compile	Helper crate for build scripts which compile to Rust	Rust	0	1	\N	3	2016-04-22 14:07:03	2017-09-20 16:41:55	2016-08-17 13:43:30
31629	capistrano	134	https://github.com/jnicklas/capistrano	Remote multi-server automation tool	Ruby	0	0	\N	3	2008-07-06 12:18:02	2019-08-13 10:28:29	2008-07-08 19:18:43
584940	capybara-envjs	134	https://github.com/jnicklas/capybara-envjs	Capybara driver for envjs gem	Ruby	1	0	\N	2	2010-03-29 12:03:07	2012-12-14 01:06:41	2010-10-24 13:05:55
1278935	capybara_heroku	134	https://github.com/jnicklas/capybara_heroku	A small skeleton to run the capybara test app on Heroku	Ruby	0	0	\N	3	2011-01-21 14:10:37	2013-10-19 12:55:07	2011-08-12 09:27:25
92403672	capybara_table	134	https://github.com/jnicklas/capybara_table	Capybara selectors and matchers for working with HTML tables	Ruby	8	2	\N	18	2017-05-25 10:00:43	2020-11-04 02:55:22	2020-05-07 02:51:16
486520	carrierwave-example-app	134	https://github.com/jnicklas/carrierwave-example-app	An example app showcasing some features of the Ruby file upload library CarrierWave (http://github.com/jnicklas/carrierwave)	Ruby	13	1	\N	29	2010-01-24 15:36:08	2019-07-09 11:07:19	2010-01-24 15:39:38
15076605	celluloid	134	https://github.com/jnicklas/celluloid	Actor-based concurrent object framework for Ruby	Ruby	0	0	\N	0	2013-12-10 10:31:10	2014-02-14 14:33:05	2014-02-14 14:33:04
16374449	celluloid-jeromq	134	https://github.com/jnicklas/celluloid-jeromq	Celluloid bindings to the jeromq library	Ruby	0	0	\N	0	2014-01-30 08:35:21	2014-02-04 11:19:36	2014-02-04 11:19:34
16761524	celluloid-stomp	134	https://github.com/jnicklas/celluloid-stomp	Evented STOMP parser	Ruby	0	0	\N	3	2014-02-12 07:01:41	2019-08-13 12:35:23	2014-02-12 07:02:53
16348423	celluloid-zmq	134	https://github.com/jnicklas/celluloid-zmq	Celluloid actors that talk over the 0MQ protocol	Ruby	0	0	\N	0	2014-01-29 13:14:16	2014-02-04 16:43:59	2014-02-04 06:54:44
34452842	chewy_example	134	https://github.com/jnicklas/chewy_example	Chewy example application	Ruby	0	0	\N	0	2015-04-23 08:43:56	2015-04-23 08:43:57	2015-03-31 04:49:27
11326	chianna	134	https://github.com/jnicklas/chianna	Component based Web Development Framework	Ruby	0	0	\N	3	2008-04-20 09:45:36	2019-08-13 10:23:20	2008-05-03 19:36:23
190536	classy_resources	134	https://github.com/jnicklas/classy_resources	Think resource_controller, except for sinatra.	Ruby	0	0	\N	2	2009-05-01 20:32:36	2019-08-13 11:23:05	2009-02-16 18:41:15
1095184	coffee_compiler	134	https://github.com/jnicklas/coffee_compiler	Compile CoffeeScript from Ruby without shelling out	Ruby	0	0	\N	3	2010-11-19 14:50:39	2013-12-17 02:11:36	2010-11-19 14:54:50
36788	confiture	134	https://github.com/jnicklas/confiture	Configuration Generator	Ruby	0	0	\N	2	2008-07-24 07:05:51	2019-08-13 10:29:50	2008-08-07 10:04:00
340012	contextually	134	https://github.com/jnicklas/contextually	Nice user contexts in your RSpec-Rails controller specs	Ruby	2	0	\N	21	2009-10-16 18:36:19	2014-11-18 21:21:39	2010-01-11 17:05:15
73506015	baremetalgamedotcom	135	https://github.com/richcollins/baremetalgamedotcom	\N	HTML	0	0	\N	0	2016-11-11 17:37:51	2016-11-11 17:43:11	2017-03-21 13:58:08
334514	basekit	135	https://github.com/richcollins/basekit	A portable data structure library.	C	1	0	\N	1	2009-10-12 02:18:12	2012-12-13 00:02:53	2009-10-11 21:22:14
16362145	bitmarkets	135	https://github.com/richcollins/bitmarkets	Bitmessage based p2p marketplace client	\N	0	0	\N	0	2014-01-29 20:57:31	2014-04-16 19:38:26	2014-01-22 01:33:20
34543338	Bitmarkets-1	135	https://github.com/richcollins/Bitmarkets-1	OSX app for Bitmarkets decentralized marketplace	Objective-C	0	0	\N	0	2015-04-24 18:42:39	2018-08-20 18:54:13	2015-04-24 18:44:00
10769926	BTCStream	135	https://github.com/richcollins/BTCStream	Extensions to blockchain's WS API	JavaScript	0	0	\N	0	2013-06-18 15:07:43	2017-05-10 14:27:58	2013-06-19 16:59:10
107675	cappuccino	135	https://github.com/richcollins/cappuccino	My bugfixes & enhancements for Cappuccino	Objective-J	0	0	\N	2	2009-01-14 22:22:20	2019-08-13 10:53:44	2009-03-27 22:28:57
2992455	domino	135	https://github.com/richcollins/domino	simple js UI framework	JavaScript	0	0	\N	1	2011-12-16 01:43:26	2014-04-27 04:50:49	2013-12-11 20:40:04
2157983	get-flash-videos	135	https://github.com/richcollins/get-flash-videos	Download or play videos from various Flash-based video hosting sites, without having to use the Flash player.	Perl	1	0	\N	5	2011-08-04 22:00:55	2014-09-08 19:57:18	2011-08-05 01:33:17
64798655	GridWars	135	https://github.com/richcollins/GridWars	\N	C#	1	23	\N	0	2016-08-02 20:16:52	2019-03-28 20:32:41	2019-03-28 20:32:40
4450771	heroku-buildpack-lua	135	https://github.com/richcollins/heroku-buildpack-lua	Lua Language Pack	Lua	0	0	\N	1	2012-05-25 19:33:46	2013-01-09 06:46:23	2012-02-19 18:36:46
3860976	ideal	135	https://github.com/richcollins/ideal	Javascript modifications inspired by Io	JavaScript	2	1	\N	8	2012-03-28 21:10:31	2016-04-27 11:44:10	2015-08-04 20:56:49
133045	io	135	https://github.com/richcollins/io	Io programming language	C	0	0	\N	2	2009-02-20 01:05:31	2019-08-13 11:02:20	2010-12-15 17:19:54
26286020	line-by-line	135	https://github.com/richcollins/line-by-line	A NodeJS module that helps you reading large text files, line by line, without buffering the files into memory.	\N	0	0	\N	0	2014-11-06 17:26:53	2014-10-03 07:38:28	2014-11-01 18:46:21
24462590	module-example	135	https://github.com/richcollins/module-example	\N	JavaScript	0	0	\N	0	2014-09-25 11:56:42	2014-09-25 11:57:27	2014-09-25 12:06:40
1130671	node	135	https://github.com/richcollins/node	evented I/O for v8 javascript	C++	0	0	\N	1	2010-12-01 23:28:53	2014-10-10 21:45:17	2010-12-01 23:36:17
26289133	node-asana	135	https://github.com/richcollins/node-asana	A node.js client for the Asana API	\N	0	0	\N	0	2014-11-06 18:43:43	2014-11-05 23:42:36	2014-10-24 17:28:11
1259791	node-paperboy	135	https://github.com/richcollins/node-paperboy	A node.js module for delivering static files.	JavaScript	0	0	\N	1	2011-01-16 04:18:46	2012-12-17 16:21:15	2011-01-16 04:20:20
1058245	node-tokyocabinet	135	https://github.com/richcollins/node-tokyocabinet	Tokyo Cabinet binding for Node.js	C++	0	0	\N	1	2010-11-06 22:54:15	2018-06-09 06:46:02	2010-11-10 20:54:28
3860750	oden	135	https://github.com/richcollins/oden	oden makes node more powerful	JavaScript	1	1	\N	2	2012-03-28 20:37:13	2013-12-12 16:37:38	2013-12-12 16:37:36
183252	oia	135	https://github.com/richcollins/oia	a port of Io to Lua	\N	5	0	\N	2	2009-04-23 00:18:23	2020-04-01 05:07:44	2009-04-23 00:14:34
1950253	PhFacebook	135	https://github.com/richcollins/PhFacebook	MacOSX Interface to Facebook graph API	Objective-C	0	0	\N	2	2011-06-24 20:07:08	2013-01-03 16:40:29	2011-06-15 08:02:45
3434854	TransformJS	135	https://github.com/richcollins/TransformJS	A jQuery plugin that provides an abstraction over 2d and 3d transforms - Project Owner: jtaby	JavaScript	0	0	\N	1	2012-02-13 20:34:22	2013-01-07 18:47:58	2012-02-07 00:41:48
686353	vertex.js	135	https://github.com/richcollins/vertex.js	High performance graph database inspired by filesystems	JavaScript	1	0	\N	2	2010-05-25 21:14:25	2012-12-14 15:32:10	2011-01-05 00:42:44
334510	vertexdb	135	https://github.com/richcollins/vertexdb	A graph database on top of tokyocabinet and libevent	C	1	0	\N	2	2009-10-12 02:10:42	2012-12-13 00:02:52	2010-02-04 23:59:52
17726279	apibutler	136	https://github.com/simonjefford/apibutler	Messing around with proxies and things like that	Go	0	13	\N	0	2014-03-13 18:15:36	2014-09-04 06:07:51	2014-09-04 06:07:50
61796073	atlas-terraform-github-tutorial	136	https://github.com/simonjefford/atlas-terraform-github-tutorial	\N	HCL	0	0	\N	0	2016-06-23 07:18:55	2016-06-23 07:18:56	2015-06-09 10:08:58
663542	autotest_example	136	https://github.com/simonjefford/autotest_example	A toy project that demonstrates how to layout a ruby project that works with Autotest	Ruby	0	1	\N	2	2010-05-12 18:43:46	2014-06-21 14:55:43	2010-05-12 18:48:07
58125545	beats	136	https://github.com/simonjefford/beats	:tropical_fish: Beats - Lightweight shippers for Elasticsearch & Logstash 	Go	0	0	\N	0	2016-05-05 08:14:29	2016-05-05 08:14:32	2016-05-10 12:21:22
78105556	beats-forwarder	136	https://github.com/simonjefford/beats-forwarder	A simple forwarder to send beats everywhere through udp, tcp, syslog and third-party	Go	0	0	\N	0	2017-01-05 08:59:14	2017-01-05 08:59:16	2017-01-05 09:05:48
1047524	betabuilder	136	https://github.com/simonjefford/betabuilder	A collection of Rake tasks for managing and distributing iOS ad-hoc builds	Ruby	0	0	\N	1	2010-11-03 08:37:41	2012-12-15 20:37:40	2011-01-24 13:14:12
180868	bucketwise	136	https://github.com/simonjefford/bucketwise	A web-based personal finance manager with a focus on non-OCD budgeting and avoiding credit card debt	Ruby	0	0	\N	2	2009-04-20 12:04:40	2019-08-13 11:19:45	2013-04-28 16:21:24
1045169	bundler	136	https://github.com/simonjefford/bundler	Manage your application's gem dependencies with less pain	Ruby	0	0	\N	1	2010-11-02 14:27:19	2020-01-09 22:11:25	2010-11-09 11:03:44
36578848	caddy	136	https://github.com/simonjefford/caddy	Fast general-purpose HTTP/2 web server for any platform.	Go	0	0	\N	0	2015-05-30 19:55:42	2019-07-02 15:51:56	2015-06-15 19:32:14
903256	delicious_adder	136	https://github.com/simonjefford/delicious_adder	Add items to Delicious Library from your mobile phone	Ruby	0	0	\N	3	2010-09-11 07:14:23	2018-01-08 11:54:50	2010-09-11 07:55:27
70100123	docker	136	https://github.com/simonjefford/docker	Docker - the open-source application container engine	Go	0	0	\N	0	2016-10-05 18:15:52	2016-10-05 18:16:10	2016-10-05 18:06:04
23387094	docprinter	136	https://github.com/simonjefford/docprinter	Github document printing service	Go	0	0	\N	0	2014-08-27 08:24:04	2018-04-03 10:45:28	2015-07-12 16:19:43
2112945	doozerd	136	https://github.com/simonjefford/doozerd	A consistent distributed data store.	Go	0	0	\N	1	2011-07-27 10:33:54	2013-01-03 21:11:09	2011-07-27 10:36:59
181860971	dotnet-docker	136	https://github.com/simonjefford/dotnet-docker	This repo contains the base Docker images for working with .NET Core and the .NET Core Tools.	Dockerfile	0	0	\N	0	2019-04-17 06:36:02	2019-04-17 06:36:04	2019-04-16 18:45:23
185556677	emacs.d	136	https://github.com/simonjefford/emacs.d	\N	Emacs Lisp	0	0	\N	0	2019-05-08 04:39:05	2020-10-25 15:31:24	2020-10-25 15:31:21
23658436	emacsconfig	136	https://github.com/simonjefford/emacsconfig	My Fork of Prelude	Emacs Lisp	0	0	\N	1	2014-09-04 07:40:03	2016-12-01 07:18:30	2015-11-16 07:50:11
566905	emacsconfig-old	136	https://github.com/simonjefford/emacsconfig-old	\N	Emacs Lisp	0	0	\N	2	2010-03-17 14:28:17	2014-09-04 07:39:56	2011-09-23 14:05:14
20061163	ember-cli	136	https://github.com/simonjefford/ember-cli	\N	JavaScript	0	0	\N	0	2014-05-22 10:04:48	2014-12-21 18:22:27	2014-06-30 08:24:25
56390726	ember-cli-materialize	136	https://github.com/simonjefford/ember-cli-materialize	Material Design (via Materialize) for Ember.js Apps	JavaScript	0	0	\N	0	2016-04-16 12:24:47	2016-04-16 12:24:48	2016-04-16 12:26:18
19938415	ember-github-issues	136	https://github.com/simonjefford/ember-github-issues	\N	JavaScript	0	0	\N	0	2014-05-19 07:54:24	2014-05-19 07:54:25	2014-05-14 22:10:52
261587206	emberfire	136	https://github.com/simonjefford/emberfire	The officially supported adapter for using Firebase with Ember	\N	0	0	\N	0	2020-05-05 18:29:51	2020-12-15 11:25:56	2020-04-30 12:14:25
308829	feedparser	136	https://github.com/simonjefford/feedparser	A Cocoa RSS/Atom parser for Mac OS X and the iPhone	Objective-C	1	0	\N	4	2009-09-16 10:24:53	2012-12-12 23:22:50	2009-09-16 10:27:37
67690633	fourthbot	136	https://github.com/simonjefford/fourthbot	\N	Go	0	2	\N	0	2016-09-08 06:50:29	2017-07-05 12:46:50	2017-06-20 06:18:35
108845526	gftest	136	https://github.com/simonjefford/gftest	\N	\N	0	0	\N	0	2017-10-30 10:08:25	2017-10-30 10:08:25	2017-10-30 10:08:37
6121591	GildedRose	136	https://github.com/simonjefford/GildedRose	Gilded Rose Kata - starting in Ruby	Ruby	0	0	\N	0	2012-10-08 05:34:20	2013-01-12 12:00:07	2012-10-08 05:34:33
22378081	git-talk	136	https://github.com/simonjefford/git-talk	\N	\N	0	0	\N	0	2014-07-29 08:51:21	2018-04-03 10:46:53	2014-07-29 08:51:59
12461037	go-exercism	136	https://github.com/simonjefford/go-exercism	A Go based command line tool for exercism.io.	Go	0	0	\N	0	2013-08-29 10:37:19	2014-05-19 07:55:10	2014-05-19 07:55:11
1748208	Go-Redis	136	https://github.com/simonjefford/Go-Redis	Google Go Client and Connectors for Redis	Go	2	0	\N	3	2011-05-14 13:45:58	2014-08-01 13:27:33	2011-05-20 04:57:41
6173392	gobyexample	136	https://github.com/simonjefford/gobyexample	Go by Example	Go	0	0	\N	0	2012-10-11 09:21:24	2013-01-12 13:06:09	2012-10-30 08:11:40
5689636	gooddata.github.com	136	https://github.com/simonjefford/gooddata.github.com	Source of GoodData Developer Network website hosted at GitHub	JavaScript	0	0	\N	0	2012-09-05 13:01:54	2015-06-29 09:20:58	2012-09-05 13:02:19
47492713	Aware	137	https://github.com/josh/Aware	\N	Swift	23	0	\N	136	2015-12-06 08:45:45	2021-01-08 08:22:34	2020-12-27 19:08:54
292074747	brew	137	https://github.com/josh/brew	🍺 The missing package manager for macOS (or Linux)	\N	0	0	\N	0	2020-09-01 15:19:57	2020-09-01 15:20:00	2020-09-01 16:16:47
258078576	CodableCSV	137	https://github.com/josh/CodableCSV	Read and write CSV files row-by-row or through Swift's Codable interface.	\N	1	0	\N	0	2020-04-22 23:56:11	2020-04-22 23:56:13	2020-04-27 19:18:08
4076599	css-explain	137	https://github.com/josh/css-explain	SQL EXPLAIN for CSS selectors	JavaScript	53	0	\N	1091	2012-04-19 12:14:42	2021-01-22 02:45:41	2015-07-25 16:10:44
257428045	csv2json	137	https://github.com/josh/csv2json	A humble CSV tool, friend of jq	Swift	0	0	\N	6	2020-04-20 20:27:27	2020-12-27 19:51:47	2020-12-27 19:51:48
288024565	displayrcd	137	https://github.com/josh/displayrcd	Run a script when your Mac changes displays	Swift	0	0	\N	2	2020-08-16 18:08:28	2020-12-27 20:02:00	2020-12-27 20:02:01
388506	dotfiles	137	https://github.com/josh/dotfiles	\N	Shell	3	0	\N	61	2009-11-28 15:18:14	2021-01-14 19:09:38	2021-01-14 19:09:35
62324	emacs.d	137	https://github.com/josh/emacs.d	My Emacs config	Emacs Lisp	6	0	\N	23	2008-10-13 01:27:01	2021-01-13 16:25:40	2012-08-19 02:09:04
170954230	google-domains-ddns	137	https://github.com/josh/google-domains-ddns	\N	Dockerfile	0	0	\N	1	2019-02-16 00:32:26	2020-12-27 18:39:15	2020-12-27 18:39:13
31754039	heroku-buildpack-cgi	137	https://github.com/josh/heroku-buildpack-cgi	\N	Shell	0	0	\N	2	2015-03-06 02:24:32	2019-08-18 13:40:14	2015-03-10 22:45:07
31841862	heroku-buildpack-none	137	https://github.com/josh/heroku-buildpack-none	\N	Shell	1	0	\N	1	2015-03-08 04:21:38	2020-05-29 04:29:34	2015-03-08 04:27:28
114590261	hksamsungtvremote	137	https://github.com/josh/hksamsungtvremote	HomeKit bridge for Samsung TV	Go	0	0	\N	2	2017-12-18 01:07:46	2020-05-29 04:37:46	2018-01-22 23:17:40
120044053	hktwiliocallbox	137	https://github.com/josh/hktwiliocallbox	\N	Go	0	0	\N	0	2018-02-02 21:56:41	2019-12-18 16:18:38	2019-01-10 21:23:13
250372960	homebrew-core	137	https://github.com/josh/homebrew-core	🍻 Default formulae for the missing package manager for macOS	\N	0	0	\N	0	2020-03-26 18:13:00	2020-03-26 18:13:24	2020-03-28 20:34:23
209692331	homebrew-tap	137	https://github.com/josh/homebrew-tap	Homebrew custom formulas for @josh repositories.	Ruby	0	0	\N	0	2019-09-19 23:54:24	2021-01-03 18:42:56	2021-01-03 18:42:54
207209401	icloud-backup-utils	137	https://github.com/josh/icloud-backup-utils	Scripts creating backups of iCloud data.	Shell	1	0	\N	4	2019-09-08 23:41:16	2020-08-21 04:38:18	2020-08-21 04:38:15
115466242	imdb-trakt-sync	137	https://github.com/josh/imdb-trakt-sync	Sync IMDb to Trakt	Shell	1	0	\N	14	2017-12-26 22:55:19	2021-01-16 19:57:48	2020-12-27 17:11:46
163215510	itunes-trakt	137	https://github.com/josh/itunes-trakt	Sync iTunes Library data to Trakt.	Shell	1	0	\N	1	2018-12-26 18:32:28	2020-12-27 18:48:21	2020-12-27 18:48:19
288283336	josh	137	https://github.com/josh/josh	\N	\N	1	0	\N	1	2020-08-17 17:48:50	2020-08-17 19:07:21	2020-08-17 17:52:23
14473873	jquery-selector-set	137	https://github.com/josh/jquery-selector-set	\N	JavaScript	17	0	\N	219	2013-11-17 18:13:02	2020-11-10 11:00:49	2017-11-08 21:37:14
17035890	jstimezonedetect	137	https://github.com/josh/jstimezonedetect	\N	JavaScript	6	0	\N	8	2014-02-20 18:15:28	2019-08-13 12:36:01	2014-02-20 18:17:26
190477243	Ka-Block	137	https://github.com/josh/Ka-Block	A Safari extension that blocks an artisanal selection of advertising domains.	Swift	0	0	\N	0	2019-06-05 19:27:07	2020-06-26 20:30:10	2020-06-28 15:38:02
28738940	launchdns	137	https://github.com/josh/launchdns	A launchd friendly development DNS server	Shell	7	0	\N	71	2015-01-03 06:32:21	2020-12-19 17:40:19	2019-08-23 19:07:25
9158287	list-unsubscribe	137	https://github.com/josh/list-unsubscribe	Magic "Unsubscribe" IMAP folder	Ruby	6	0	\N	58	2013-04-01 20:28:47	2021-01-10 10:42:29	2015-01-14 23:27:55
9181738	my-ups-cal	137	https://github.com/josh/my-ups-cal	\N	\N	0	0	\N	3	2013-04-02 19:26:29	2019-08-13 12:18:41	2015-03-22 01:57:35
909083	nack	137	https://github.com/josh/nack	Node powered Rack server	CoffeeScript	6	0	\N	178	2010-09-14 01:23:29	2021-01-13 16:29:46	2017-07-12 02:59:48
170983714	offlineimap-gmail	137	https://github.com/josh/offlineimap-gmail	\N	Dockerfile	0	0	\N	2	2019-02-16 07:05:28	2020-12-27 18:44:37	2020-12-27 18:44:35
77409126	overcast-sonos	137	https://github.com/josh/overcast-sonos	Listen to your Overcast podcasts on Sonos.	PHP	16	0	\N	181	2016-12-26 20:06:20	2021-01-13 16:51:49	2019-11-10 14:37:08
25675632	pdftotext	137	https://github.com/josh/pdftotext	Service for extracting text from PDFs	Shell	4	0	\N	8	2014-10-24 04:57:05	2019-10-14 15:21:33	2019-09-26 17:11:00
34579271	postmail	137	https://github.com/josh/postmail	\N	JavaScript	0	0	\N	0	2015-04-25 14:51:35	2019-02-08 23:43:34	2018-05-08 17:13:21
2304650	ActorKit	138	https://github.com/stevedekorte/ActorKit	Safe Objective-C multithreading with actors & futures	Objective-C	12	1	\N	176	2011-08-31 19:47:31	2020-11-28 16:29:53	2020-03-01 17:37:25
99638	basekit	138	https://github.com/stevedekorte/basekit	C based OO portable data structure library 	C	17	0	\N	124	2009-01-02 07:17:44	2020-09-30 13:59:47	2009-10-21 03:21:08
99639	coroutine	138	https://github.com/stevedekorte/coroutine	C multiplatform coroutine implementation via ucontext, fibers or setjmp	C	44	0	\N	243	2009-01-02 07:22:29	2021-01-29 08:24:32	2009-10-21 02:20:12
99640	garbagecollector	138	https://github.com/stevedekorte/garbagecollector	Incremental garbage collector library in C for use by high level language implementions.	C	5	1	\N	97	2009-01-02 07:28:05	2020-12-30 09:50:24	2016-05-12 16:53:10
219063890	GridWars	138	https://github.com/stevedekorte/GridWars	\N	\N	0	0	\N	0	2019-11-01 18:16:55	2019-11-01 18:16:57	2019-03-28 20:32:40
6412432	lua_ios	138	https://github.com/stevedekorte/lua_ios	LuaJIT + OpenGLES + OpenAL + luasocket	C	4	0	\N	13	2012-10-26 22:43:35	2020-08-12 16:02:34	2012-10-26 23:11:47
17496221	ObjcTask	138	https://github.com/stevedekorte/ObjcTask	Alternative NSTask implementation	C	0	0	\N	3	2014-03-06 20:19:41	2015-08-04 12:56:02	2014-03-06 22:27:03
283637	openalkit	138	https://github.com/stevedekorte/openalkit	Objective-C binding for OpenAL on iOS	Objective-C	1	0	\N	15	2009-08-20 21:55:06	2017-05-25 22:36:10	2010-03-22 23:24:58
33757481	Scnr	138	https://github.com/stevedekorte/Scnr	OSX music discovery app, explore related music, remembers likes and dislikes	Objective-C	0	0	\N	1	2015-04-10 22:03:29	2019-10-01 15:18:28	2015-04-21 21:07:23
99593	skipdb	138	https://github.com/stevedekorte/skipdb	C based ordered key-value ACID DB using a skip list data structure	C	28	0	\N	148	2009-01-02 04:22:50	2020-10-31 20:58:19	2015-01-27 20:37:15
277175371	stevedekorte	138	https://github.com/stevedekorte/stevedekorte	profile	\N	0	0	\N	1	2020-07-04 16:46:10	2020-07-05 00:20:06	2020-07-04 16:52:40
232456114	Strvct	138	https://github.com/stevedekorte/Strvct	direct manipulation of structured content	JavaScript	0	0	\N	0	2020-01-07 23:02:28	2020-08-25 17:25:38	2020-08-25 17:25:34
686345	vertex.js	138	https://github.com/stevedekorte/vertex.js	node.js graph db server inspired by filesystems	JavaScript	12	1	\N	215	2010-05-25 21:08:52	2020-11-06 19:55:36	2011-12-01 00:18:36
238509	vertexdb	138	https://github.com/stevedekorte/vertexdb	C based graph db server using tokyocabinet & libevent	C	35	10	\N	292	2009-06-28 22:03:15	2020-10-27 04:35:35	2018-01-21 13:50:39
1492432	5x13	139	https://github.com/leahneukirchen/5x13	a condensed pixel font built on 6x13 ("fixed")	Makefile	1	0	\N	13	2011-03-17 13:40:40	2021-01-13 21:47:23	2017-07-08 15:35:37
7633725	absurd	139	https://github.com/leahneukirchen/absurd	\N	Shell	0	0	\N	0	2013-01-15 19:33:20	2017-07-24 15:39:58	2013-05-16 08:37:19
47509993	adventofcode2015	139	https://github.com/leahneukirchen/adventofcode2015	Advent of Code (adventofcode.com) in K	Ruby	0	0	\N	3	2015-12-06 17:18:19	2016-02-23 12:07:02	2015-12-25 13:36:29
75311503	adventofcode2016	139	https://github.com/leahneukirchen/adventofcode2016	Advent of Code 2016 (adventofcode.com) in K and J	Ruby	0	0	\N	2	2016-12-01 14:33:10	2019-07-15 16:50:21	2016-12-25 12:44:51
112853670	adventofcode2017	139	https://github.com/leahneukirchen/adventofcode2017	adventofcode.com 2017	C++	0	0	\N	2	2017-12-02 13:35:35	2018-03-06 23:14:18	2017-12-25 12:35:45
159960818	adventofcode2018	139	https://github.com/leahneukirchen/adventofcode2018	Advent of Code 2018 (adventofcode.com) in k and Rust	Ruby	1	0	\N	0	2018-12-01 13:54:17	2019-11-28 13:38:17	2019-11-28 13:38:15
225171271	adventofcode2019	139	https://github.com/leahneukirchen/adventofcode2019	Advent of Code (adventofcode.com) in k and Perl 5	Perl	0	0	\N	4	2019-12-01 11:04:22	2019-12-15 21:24:47	2019-12-11 18:29:53
317531973	adventofcode2020	139	https://github.com/leahneukirchen/adventofcode2020	Advent of Code 2020 (adventofcode.com) in J and Clojure	Clojure	0	0	\N	2	2020-12-01 09:20:10	2021-01-29 03:41:03	2020-12-26 09:35:50
56680	amok	139	https://github.com/leahneukirchen/amok	a compact mock library	Ruby	1	0	\N	9	2008-09-26 05:40:56	2019-08-13 10:36:23	2008-10-04 14:09:37
46183377	arr	139	https://github.com/leahneukirchen/arr	(re)arrange and select fields on each line	Groff	0	0	\N	5	2015-11-14 15:02:19	2021-01-15 20:51:24	2016-02-14 13:25:18
184852	flat_filer	140	https://github.com/cheapRoc/flat_filer	Ruby library for handling fixed width record flat files	Ruby	1	0	\N	2	2009-04-24 17:40:39	2019-08-13 11:21:06	2009-09-28 15:39:02
44615285	git-deep	140	https://github.com/cheapRoc/git-deep	Update and/or perform work across multiple git repos within the current directory.	Shell	0	0	\N	0	2015-10-20 13:19:54	2015-10-20 13:21:18	2015-10-20 13:50:56
115207666	ast	139	https://github.com/leahneukirchen/ast	This is the AT&T Software Technology ast software download site from AT&T Research. The AT&T AST OpenSource Software Collection provides an overview and Practical Reusable UNIX Software provides a historical perspective. You can join the ast and uwin mailgroups, or monitor the mail archives. There is also an AT&T internal talk. The man page index contains most of the ast commands and library functions; command man pages are also available at runtime using the --man or --html option of any ast command.	C	1	0	\N	0	2017-12-23 14:25:04	2017-12-23 14:25:10	2017-12-24 11:35:05
303664158	atreus-leah2	139	https://github.com/leahneukirchen/atreus-leah2	\N	\N	0	0	\N	1	2020-10-13 07:16:33	2020-10-14 06:11:19	2020-10-13 07:20:15
223029067	atxec	139	https://github.com/leahneukirchen/atxec	 run command expanding arguments from file or environment	Perl	0	0	\N	5	2019-11-20 18:16:21	2020-02-03 13:07:03	2019-11-20 19:38:29
59494	bacon	139	https://github.com/leahneukirchen/bacon	a small RSpec clone	Ruby	67	11	\N	419	2008-10-04 08:34:43	2021-01-27 23:34:43	2019-02-02 20:41:08
120940786	bcachefs-tools	139	https://github.com/leahneukirchen/bcachefs-tools	http://bcachefs.org	C	0	0	\N	0	2018-02-09 16:26:45	2018-02-09 16:26:47	2018-02-10 19:48:55
256816692	borschtsch	139	https://github.com/leahneukirchen/borschtsch	(experimental)	\N	0	0	\N	1	2020-04-18 14:47:19	2020-04-20 05:06:25	2020-04-18 18:30:36
280864048	btac	139	https://github.com/leahneukirchen/btac	print file in reverse order	C	0	0	\N	3	2020-07-19 09:45:55	2020-07-20 04:47:55	2020-07-19 09:46:07
28560341	CampFahrplan	139	https://github.com/leahneukirchen/CampFahrplan	View the conference schedule of the Chaos Communcation Camp/Congress	Java	0	0	\N	0	2014-12-28 09:32:33	2020-08-19 11:52:40	2014-12-28 09:33:41
169609188	ceph-ansible	139	https://github.com/leahneukirchen/ceph-ansible	Ansible playbooks to deploy Ceph, the distributed filesystem.	Python	0	0	\N	0	2019-02-07 15:08:10	2019-02-07 15:08:13	2019-02-08 12:52:54
208632	challis	139	https://github.com/leahneukirchen/challis	a soft lightweight cloth	Ruby	1	0	\N	22	2009-05-23 20:32:47	2019-08-13 11:26:02	2010-02-16 19:24:03
562596	clitter	139	https://github.com/leahneukirchen/clitter	a ncurses twitter client	Ruby	0	0	\N	7	2010-03-14 21:54:53	2021-01-21 05:06:17	2010-03-14 21:55:09
539945	colfm	139	https://github.com/leahneukirchen/colfm	A console, column-oriented file manager	Ruby	5	1	\N	46	2010-02-28 12:29:36	2019-12-01 20:34:36	2010-04-08 14:01:29
871125	coma	139	https://github.com/leahneukirchen/coma	a console mail user agent | obsolete: use mblaze	Ruby	3	0	\N	13	2010-08-29 21:57:00	2021-01-13 16:29:36	2011-06-02 20:37:41
257	coset-mirror	139	https://github.com/leahneukirchen/coset-mirror	(experimental) Mirror of the coset darcs repository	Ruby	0	0	\N	9	2008-02-03 21:22:22	2019-08-13 10:21:21	2008-03-26 16:11:40
528922	cwm	139	https://github.com/leahneukirchen/cwm	portable version of OpenBSD's cwm(1) window manager	C	27	0	\N	254	2010-02-21 15:19:34	2021-01-26 17:49:45	2020-05-22 16:43:30
53550	daiquiri	139	https://github.com/leahneukirchen/daiquiri	a Rack-based resourceful web framework	\N	0	0	\N	11	2008-09-17 11:26:11	2019-08-13 10:35:25	2008-09-17 11:26:36
233061920	docker-lab-bgp	139	https://github.com/leahneukirchen/docker-lab-bgp	A small BGP lab in Docker	\N	1	0	\N	1	2020-01-10 11:17:18	2020-01-11 15:56:33	2020-01-10 11:17:34
39420	dwm-chris2	139	https://github.com/leahneukirchen/dwm-chris2	Personal dwm fork.	C	0	0	\N	3	2008-08-02 09:24:51	2019-08-13 10:30:39	2012-08-25 12:28:26
233063346	ega	139	https://github.com/leahneukirchen/ega	amateur translation project of Grothendieck's EGA.	\N	0	0	\N	0	2020-01-10 11:24:37	2020-01-10 11:24:39	2020-01-10 11:50:15
17638780	extrace	139	https://github.com/leahneukirchen/extrace	trace exec() calls system-wide	C	5	2	\N	68	2014-03-11 14:03:15	2021-01-16 13:56:34	2019-11-30 19:36:41
6766159	acts-as-taggable-on	140	https://github.com/cheapRoc/acts-as-taggable-on	A tagging plugin for Rails applications that allows for custom tagging along dynamic contexts.	Ruby	0	0	\N	0	2012-11-19 17:47:34	2013-01-13 03:40:17	2012-10-10 03:28:24
47299869	awesome-mixtapes	140	https://github.com/cheapRoc/awesome-mixtapes	Awesome Mixtapes: links to classic underground/electronic music	\N	0	0	\N	1	2015-12-02 23:41:50	2016-06-23 19:06:18	2016-08-15 16:30:27
22358764	capistrano-cook	140	https://github.com/cheapRoc/capistrano-cook	For when you need to use Chef from Capistrano (which probably isn't much)	Ruby	3	2	\N	2	2014-07-28 18:37:08	2017-02-20 10:32:55	2015-12-02 00:32:19
16012065	chef-newrelic-monitoring	140	https://github.com/cheapRoc/chef-newrelic-monitoring	Chef cookbook for enabling monitoring on new relic	Ruby	0	0	\N	0	2014-01-17 19:21:04	2016-06-08 12:33:06	2011-11-10 16:33:31
28146450	chef-ssh	140	https://github.com/cheapRoc/chef-ssh	Chef cookbook for managing some mildly-difficult-to-automate SSH configuration	Ruby	0	0	\N	0	2014-12-17 14:55:35	2014-12-17 14:55:35	2014-12-17 15:03:15
1311195	config-set	140	https://github.com/cheapRoc/config-set	shockingly tiny, pure Ruby, configuration library for your project settings	Ruby	0	0	\N	1	2011-01-31 03:21:40	2015-12-12 19:50:37	2015-12-12 19:50:35
82065803	containerpilot	140	https://github.com/cheapRoc/containerpilot	A service for autodiscovery and configuration of applications running in containers	Go	0	0	\N	0	2017-02-15 11:53:06	2017-02-15 11:53:07	2018-05-02 16:32:06
92887307	coreos-kvm-image-builder	140	https://github.com/cheapRoc/coreos-kvm-image-builder	TEST TEST TEST place for CoreOS running on Triton	\N	0	0	\N	0	2017-05-30 21:17:41	2017-05-30 21:17:41	2017-05-30 21:17:42
130621910	cp-leaky	140	https://github.com/cheapRoc/cp-leaky	Lab environment designed to test and measure ContainerPilot heap/memory profiles and goroutine leaks	Shell	0	0	\N	1	2018-04-22 22:02:11	2019-08-21 12:21:04	2018-04-23 01:35:03
113895183	cp-logging	140	https://github.com/cheapRoc/cp-logging	Test harness for debugging process and container output using ContainerPilot.	Shell	0	0	\N	0	2017-12-11 16:43:45	2017-12-11 16:44:05	2017-12-11 17:05:08
7022940	deployer	140	https://github.com/cheapRoc/deployer	Installs/Configures a deployment user	Ruby	0	0	\N	0	2012-12-05 17:07:19	2014-01-17 19:05:16	2014-01-17 19:05:14
92665313	direnv	140	https://github.com/cheapRoc/direnv	Unclutter your .profile	Go	0	0	\N	0	2017-05-28 11:12:27	2017-05-28 11:12:28	2017-05-08 17:19:15
93213200	distribution	140	https://github.com/cheapRoc/distribution	The Docker toolset to pack, ship, store, and deliver content	Go	0	0	\N	0	2017-06-02 21:26:59	2021-01-27 12:51:07	2017-06-02 10:42:14
162290	emacs-config	140	https://github.com/cheapRoc/emacs-config	My preferred emacs configuration and editing experience.	Emacs Lisp	0	1	\N	4	2009-03-29 04:58:53	2019-10-29 23:49:52	2018-10-17 12:52:13
668476	emacs-xcode	140	https://github.com/cheapRoc/emacs-xcode	A set of tools to make OS-X and iPhone development with emacs pleasant. It simplifies writing objective-c applications and provides utilities to compile and lunch the project.	Emacs Lisp	1	0	\N	1	2010-05-15 15:29:11	2012-12-14 14:56:14	2010-02-18 18:06:56
3112136	ember-flash	140	https://github.com/cheapRoc/ember-flash	Flash message system for Ember.js	JavaScript	5	0	\N	22	2012-01-05 16:12:26	2020-05-24 17:00:18	2014-03-22 15:24:41
94041501	etcd	140	https://github.com/cheapRoc/etcd	A service for autodiscovery and configuration of applications running in containers	Shell	0	0	\N	0	2017-06-11 21:54:46	2017-06-11 21:54:48	2017-06-22 11:05:26
92365744	eventrouter	140	https://github.com/cheapRoc/eventrouter	A simple introspective kubernetes service that forwards events to a specified sink.	Go	0	0	\N	0	2017-05-25 01:48:46	2017-05-25 01:48:47	2017-05-03 14:22:37
110496053	fabio	140	https://github.com/cheapRoc/fabio	A fast, modern, zero-conf load balancing HTTP(S) router for deploying microservices managed by consul.	Go	0	0	\N	0	2017-11-13 01:32:37	2017-11-13 01:32:39	2017-11-10 20:07:58
4360237	git_store	140	https://github.com/cheapRoc/git_store	Git as versioned data store in Ruby	Ruby	0	0	\N	1	2012-05-17 13:02:14	2013-01-09 03:31:34	2012-06-26 16:23:29
123009790	go-getter	140	https://github.com/cheapRoc/go-getter	Package for downloading things from a string URL using a variety of protocols.	Go	0	0	\N	0	2018-02-26 15:18:38	2018-02-26 15:18:40	2018-02-20 00:43:13
131542747	go-grpc-middleware	140	https://github.com/cheapRoc/go-grpc-middleware	Golang gRPC Middlewares: interceptor chaining, auth, logging, retries and more.	Go	0	0	\N	0	2018-04-29 21:58:38	2018-04-29 21:58:40	2018-04-29 18:22:52
104376275	go-nats-streaming	140	https://github.com/cheapRoc/go-nats-streaming	NATS Streaming System	Go	0	0	\N	0	2017-09-21 14:08:20	2017-09-21 14:08:22	2017-08-18 18:00:16
137085224	go-sqlmock	140	https://github.com/cheapRoc/go-sqlmock	Sql mock driver for golang to test database interactions	Go	0	0	\N	0	2018-06-12 11:39:13	2018-06-12 11:39:15	2018-06-10 06:23:42
124300399	gopsutil	140	https://github.com/cheapRoc/gopsutil	psutil for golang	Go	0	0	\N	0	2018-03-07 19:08:30	2018-03-07 19:08:32	2018-02-27 19:58:48
131022680	grpc-zerolog	140	https://github.com/cheapRoc/grpc-zerolog	Implementation of `grpclog.LoggerV2` interface using `zerolog`	Go	0	1	\N	24	2018-04-25 11:55:30	2021-01-03 12:23:17	2018-04-25 12:10:20
110152697	http-echo	140	https://github.com/cheapRoc/http-echo	A tiny go web server that echos what you start it with!	Go	0	0	\N	0	2017-11-09 16:40:29	2017-11-09 16:40:31	2017-05-25 13:39:26
93976559	k8s-bare-metal	140	https://github.com/cheapRoc/k8s-bare-metal	Opinionated guide for building Kubernetes on Triton using Packer, Terraform and Ansible	HCL	2	8	\N	11	2017-06-10 23:18:16	2020-05-26 14:55:11	2017-06-29 16:06:21
133440817	3rd-party	141	https://github.com/technomancy/3rd-party	third party libs for TIC-80 project	C	0	0	\N	0	2018-05-14 22:17:02	2018-05-14 22:17:15	2019-11-26 01:42:31
16792021	atreus	141	https://github.com/technomancy/atreus	column-staggered travel keyboard design	Racket	110	5	\N	625	2014-02-13 02:41:49	2021-01-27 05:51:41	2020-07-17 17:21:22
19518237	atreus-firmware	141	https://github.com/technomancy/atreus-firmware	Firmware for the Atreus keyboard	Emacs Lisp	62	0	\N	89	2014-05-06 23:24:13	2020-08-27 03:42:52	2020-03-08 17:48:16
9549075	better-defaults	141	https://github.com/technomancy/better-defaults	A small number of better defaults for Emacs	Emacs Lisp	87	5	\N	863	2013-04-19 12:59:56	2021-01-09 17:32:00	2020-07-17 17:13:14
76149	bludgeon	141	https://github.com/technomancy/bludgeon	Bludgeon is a tool which will tell you if a given library is so large that you could bludgeon someone to death with a printout of it.	Ruby	2	0	\N	38	2008-11-14 19:16:41	2019-10-25 16:31:13	2014-12-20 16:21:53
314	bus-scheme	141	https://github.com/technomancy/bus-scheme	a Scheme written in Ruby, but implemented on the bus!	Ruby	5	0	\N	34	2008-02-06 16:28:52	2020-02-14 14:13:11	2008-10-28 03:12:44
39677434	bussard	141	https://github.com/technomancy/bussard	Spaceflight programming adventure (MOVED)	Lua	1	0	\N	24	2015-07-25 05:07:21	2020-07-17 16:43:36	2017-12-02 03:37:31
35377779	calandria	141	https://github.com/technomancy/calandria	Unix in voxel-world	Lua	2	8	\N	26	2015-05-10 13:03:07	2020-07-17 16:43:29	2016-06-22 00:46:04
136119012	chopstx	141	https://github.com/technomancy/chopstx	U2F firmware for Tomu board (+ chopstx port)	C	0	0	\N	0	2018-06-05 01:18:03	2018-06-05 01:18:05	2018-06-08 14:23:55
4216638	chortles	141	https://github.com/technomancy/chortles	Calculate the magnitude of a given laugh	Clojure	4	1	\N	12	2012-05-03 14:24:26	2019-08-22 14:16:02	2019-08-22 09:37:42
91126124	circleci.el	141	https://github.com/technomancy/circleci.el	Show build output from CircleCI builds inside Emacs	Emacs Lisp	0	0	\N	17	2017-05-12 17:09:18	2020-07-17 17:03:36	2020-05-22 18:17:00
9483163	clojars-verify	141	https://github.com/technomancy/clojars-verify	Verify checksums of Clojars artifacts	Clojure	0	0	\N	1	2013-04-16 18:36:55	2020-07-17 16:57:18	2013-04-17 17:57:21
380334	clojars-web	141	https://github.com/technomancy/clojars-web	A community repository for open-source Clojure libraries	Clojure	1	0	\N	5	2009-11-21 03:28:36	2020-06-20 03:55:18	2017-12-28 20:32:57
225806	clojure	141	https://github.com/technomancy/clojure	The Clojure programming language	Java	1	0	\N	0	2009-06-12 19:46:52	2018-06-24 06:59:39	2010-12-10 02:56:54
263203	clojure-gem	141	https://github.com/technomancy/clojure-gem	Use Clojure's immutable data structures and Software Transactional Memory from Ruby. Don't be afraid of concurrency.	Ruby	0	0	\N	33	2009-07-29 01:49:04	2019-08-13 11:27:14	2009-11-22 22:31:05
189516	clojure-http-client	141	https://github.com/technomancy/clojure-http-client	An HTTP client for Clojure (DEPRECATED)	Clojure	18	0	\N	84	2009-04-30 14:05:43	2020-09-18 18:29:32	2011-09-13 12:59:15
3692016	clojurewest2012-slides	141	https://github.com/technomancy/clojurewest2012-slides	Slides from Clojure/West 2012	\N	1	0	\N	8	2012-03-12 01:11:24	2016-04-02 19:54:44	2012-03-17 20:36:48
1699081	clucy	141	https://github.com/technomancy/clucy	Clojure interface to Lucene	Clojure	0	0	\N	0	2011-05-03 22:00:05	2013-08-28 14:13:37	2011-05-23 02:06:35
2617902	commodore-night-vision	141	https://github.com/technomancy/commodore-night-vision	\N	Emacs Lisp	5	0	\N	2	2011-10-21 01:29:17	2018-01-22 16:27:37	2014-12-16 01:31:54
126024	concourse	141	https://github.com/technomancy/concourse	A web app for coordinating gatherings. Written in Compojure.	Clojure	0	0	\N	10	2009-02-10 17:26:55	2019-08-13 10:59:54	2009-02-11 02:36:56
36401	conspire	141	https://github.com/technomancy/conspire	A real-time collaborative editing platform built on Git.	Ruby	4	0	\N	46	2008-07-23 01:24:26	2019-08-13 10:29:44	2008-08-12 18:18:00
24254698	cooper	141	https://github.com/technomancy/cooper	HyperCard-ish in Racket	Racket	1	3	\N	38	2014-09-20 02:28:55	2020-07-17 16:54:00	2014-10-09 22:34:44
183712	corkscrew	141	https://github.com/technomancy/corkscrew	Proof-of-concept build system for Clojure.	Clojure	1	0	\N	12	2009-04-23 13:31:40	2020-04-14 16:45:38	2009-09-09 00:37:32
2081803	die-roboter	141	https://github.com/technomancy/die-roboter	The Robots get your work done in an straightforward way.	Clojure	4	2	\N	37	2011-07-21 01:37:49	2018-01-22 17:17:04	2012-05-30 01:18:49
37297137	diginet	141	https://github.com/technomancy/diginet	Minetest mod for higher-level communication between nodes	Lua	1	4	\N	2	2015-06-11 23:14:48	2018-01-22 18:52:39	2015-06-29 12:35:35
27806513	drainbot	141	https://github.com/technomancy/drainbot	Drain Heroku apps to IRC channels	Clojure	0	0	\N	2	2014-12-10 04:54:25	2018-01-22 18:54:21	2014-12-10 05:37:10
917542	durendal	141	https://github.com/technomancy/durendal	A bucket of Emacs tricks for Clojure	Emacs Lisp	6	0	\N	67	2010-09-17 00:56:06	2020-07-04 11:08:45	2011-07-02 01:46:15
14339532	edgestow	141	https://github.com/technomancy/edgestow	GitHub issues over FUSE, theoretically slash eventually	OCaml	1	0	\N	5	2013-11-12 15:23:45	2020-03-28 11:53:05	2013-11-12 15:25:58
22885651	el-get	141	https://github.com/technomancy/el-get	Manage the external elisp bits and pieces upon which you depend!	Emacs Lisp	0	0	\N	0	2014-08-12 14:13:05	2014-08-12 16:11:43	2016-01-28 05:26:34
77734	emacs-starter-kit	141	https://github.com/technomancy/emacs-starter-kit	Because the Emacs defaults are not so great sometimes.	\N	932	23	\N	2895	2008-11-18 15:30:17	2021-01-29 14:47:12	2018-05-28 10:16:17
5577748	travis-ci.github.com	142	https://github.com/kenphused/travis-ci.github.com	the official Travis CI blog & documentation website	Ruby	0	0	\N	0	2012-08-27 19:10:51	2013-01-11 21:54:33	2012-08-27 18:38:05
74583122	v4	142	https://github.com/kenphused/v4	\N	Perl	0	0	\N	0	2016-11-23 12:14:58	2016-11-23 12:15:00	2016-04-28 11:58:58
16427304	3d	143	https://github.com/rubyist/3d	Misc 3d models for printing	\N	1	0	\N	0	2014-02-01 01:01:52	2014-05-25 12:29:59	2014-05-25 12:29:58
17215429	85programmer	143	https://github.com/rubyist/85programmer	Schematics and PCB layout for building an arduino shield for programming the attiny85	\N	0	0	\N	0	2014-02-26 12:39:39	2014-02-26 20:18:46	2014-02-26 20:18:46
11285584	aasm	143	https://github.com/rubyist/aasm	AASM - State machines for Ruby classes	Ruby	7	0	\N	23	2013-07-09 12:04:45	2019-09-10 20:16:24	2013-06-28 17:33:09
274022	AudioBookBinder	143	https://github.com/rubyist/AudioBookBinder	command-line utility for converting audiobooks to m4b format	Objective-C	1	0	\N	2	2009-08-10 12:06:09	2014-05-01 13:09:35	2009-08-10 12:56:09
2115739	backbone-couchdb	143	https://github.com/rubyist/backbone-couchdb	A couchdb connector for backbone with support for real time changes.	JavaScript	0	0	\N	2	2011-07-27 20:02:22	2014-05-01 13:09:27	2011-07-27 20:06:52
45760	campfire-mode	143	https://github.com/rubyist/campfire-mode	Campfire major mode for emacs	Ruby	0	0	\N	8	2008-08-25 10:24:45	2019-08-13 10:32:50	2008-08-25 14:14:31
21960219	circuitbreaker	143	https://github.com/rubyist/circuitbreaker	Circuit Breakers in Go	Go	100	19	\N	921	2014-07-17 19:41:33	2021-01-22 22:17:09	2019-10-21 09:27:19
588497	clearance	143	https://github.com/rubyist/clearance	Rails authentication with email & password.	Ruby	0	0	\N	2	2010-03-31 11:24:33	2015-11-15 12:49:27	2010-03-31 13:00:33
2482714	coffee-mode	143	https://github.com/rubyist/coffee-mode	Emacs Major Mode for CoffeeScript	Emacs Lisp	0	0	\N	2	2011-09-29 12:08:14	2014-05-01 13:09:25	2011-09-29 12:15:47
117610231	dankbar	143	https://github.com/rubyist/dankbar	cheap hack of an i3 status bar thing	Go	0	0	\N	0	2018-01-15 22:25:56	2018-01-15 22:26:43	2018-07-09 21:53:03
1240448	darts	143	https://github.com/rubyist/darts	Dart scoring app written to learn CoffeeScript and Raphael JS	JavaScript	0	0	\N	2	2011-01-11 01:26:31	2014-05-01 13:09:30	2011-01-13 17:40:51
33484400	datasciencecoursera	143	https://github.com/rubyist/datasciencecoursera	datasciencecoursera	\N	0	0	\N	0	2015-04-06 10:51:47	2015-04-06 10:51:47	2015-04-06 10:52:58
33484462	datasharing	143	https://github.com/rubyist/datasharing	The Leek group guide to data sharing 	\N	0	0	\N	1	2015-04-06 10:53:31	2015-05-29 16:53:45	2015-04-02 16:57:23
98836349	dotfiles	143	https://github.com/rubyist/dotfiles	dotfiles	Emacs Lisp	0	0	\N	1	2017-07-30 22:35:12	2018-10-09 07:12:00	2018-05-05 14:58:52
112702	dsp	143	https://github.com/rubyist/dsp	A utility library I'm throwing together while learning DSP with http://www.dspguide.com/	Ruby	0	0	\N	6	2009-01-22 15:54:41	2019-08-13 10:55:29	2009-01-22 16:08:56
5259305	ECSlidingTemplate	143	https://github.com/rubyist/ECSlidingTemplate	A template for using ECSlidingViewController without storyboards	Objective-C	0	0	\N	4	2012-08-01 10:09:11	2014-05-01 13:09:21	2012-08-01 10:10:05
16730115	emacs	143	https://github.com/rubyist/emacs	my emacs config	Emacs Lisp	1	0	\N	1	2014-02-11 10:30:05	2016-03-07 18:51:36	2014-02-11 10:30:44
110617	emacs-config	143	https://github.com/rubyist/emacs-config	My emacs configuration	Emacs Lisp	1	0	\N	4	2009-01-19 17:55:07	2019-08-13 10:54:46	2010-02-02 13:11:40
109809	emacs-starter-kit	143	https://github.com/rubyist/emacs-starter-kit	All the code you need to get started, with an emphasis on dynamic languages.	Emacs Lisp	0	0	\N	2	2009-01-18 11:38:18	2019-08-13 10:54:29	2009-01-18 16:56:46
347535	fakefs	143	https://github.com/rubyist/fakefs	A fake filesystem. Use it in your tests.	Ruby	0	0	\N	1	2009-10-23 16:10:42	2015-11-16 14:34:17	2009-10-26 13:02:33
207174	fakeweb	143	https://github.com/rubyist/fakeweb	A test helper for faking responses to web requests	Ruby	1	0	\N	2	2009-05-21 19:12:39	2015-11-16 14:34:17	2009-06-02 12:25:52
480834	flac2aac	143	https://github.com/rubyist/flac2aac	Convert flacs to aacs and import into iTunes, preserving metadata	\N	0	0	\N	2	2010-01-20 14:48:11	2014-05-01 13:09:33	2010-01-20 14:49:03
105467983	gitguts	143	https://github.com/rubyist/gitguts	Code for the Git Guts articles on killring.io	Go	0	0	\N	0	2017-10-01 16:24:30	2017-10-01 16:24:40	2017-10-01 16:24:38
12879306	go-dnsimple	143	https://github.com/rubyist/go-dnsimple	Go library for accessing the DNSimple API	Go	1	2	\N	5	2013-09-16 18:31:21	2016-02-04 14:09:03	2014-04-11 08:32:42
18476127	go-oracle	143	https://github.com/rubyist/go-oracle	Atom package for interfacing with Go's oracle tool	CoffeeScript	10	20	\N	35	2014-04-05 17:38:48	2018-07-19 10:42:53	2018-06-03 18:41:31
14090158	go.grace	143	https://github.com/rubyist/go.grace	Graceful restart for Go servers.	Go	1	0	\N	0	2013-11-03 15:59:42	2019-03-21 20:38:04	2013-11-04 09:57:26
23287595	gohat	143	https://github.com/rubyist/gohat	Go Heap Dump Analysis Tool	Go	2	0	\N	12	2014-08-24 14:32:12	2020-05-29 04:35:47	2017-08-06 21:57:28
27303910	gopheracademy-web	143	https://github.com/rubyist/gopheracademy-web	Public Website for blog.GopherAcademy.com	CSS	0	0	\N	0	2014-11-29 12:09:34	2014-11-29 12:09:35	2014-11-28 19:27:40
17717056	grohl	143	https://github.com/rubyist/grohl	Combination logging, exception reporting, and metrics library for Go.	Go	0	0	\N	1	2014-03-13 13:33:22	2015-06-13 14:29:19	2014-03-13 14:41:30
2137700	guard-rake	143	https://github.com/rubyist/guard-rake	guard-rake runs a rake task when files change	Ruby	34	11	\N	85	2011-08-01 13:26:56	2020-10-23 08:52:36	2020-06-16 09:30:38
2715467	deploy	144	https://github.com/ogc/deploy	whiskey disk deployment files for our various hosting shizzle	\N	0	0	\N	1	2011-11-05 12:14:42	2013-11-26 20:06:01	2013-01-10 03:20:57
55221	rails_skeleton	144	https://github.com/ogc/rails_skeleton	a skeleton rails app with changes, close to ready to use	Ruby	1	0	\N	2	2008-09-22 13:39:47	2019-08-13 10:35:56	2009-11-22 04:27:56
286532712	.doom.d	145	https://github.com/lazyatom/.doom.d	My Doom Emacs configuration	Emacs Lisp	0	0	\N	0	2020-08-10 14:01:03	2020-08-10 14:03:19	2020-08-10 14:01:16
3952172	a2_printer	145	https://github.com/lazyatom/a2_printer	A ruby gem for talking to a small thermal printer	Ruby	17	1	\N	18	2012-04-06 15:08:00	2020-05-11 06:15:12	2015-08-13 18:31:32
35286253	activejob-lock	145	https://github.com/lazyatom/activejob-lock	Adapt resque-lock with ActiveJob	Ruby	0	0	\N	0	2015-05-08 12:16:43	2015-05-08 12:20:58	2015-05-08 12:20:57
733831	acts_as_hasselhoff	145	https://github.com/lazyatom/acts_as_hasselhoff	You know it. You love it. Now it's on github. As dumb as ever.	Ruby	3	0	\N	13	2010-06-22 10:10:12	2018-06-12 10:39:49	2018-08-28 12:36:05
206060026	aemeredith.com	145	https://github.com/lazyatom/aemeredith.com	\N	CSS	0	0	\N	0	2019-09-03 08:21:41	2019-09-03 08:21:44	2019-09-03 08:24:21
13810	backchat	145	https://github.com/lazyatom/backchat	Your own personal hoodwink'd. Add commenting to any site.	Ruby	1	0	\N	27	2008-05-01 14:25:28	2019-08-13 10:23:53	2008-05-04 07:56:44
18654694	boomerang-rails	145	https://github.com/lazyatom/boomerang-rails	Redirection helpers for rails	Ruby	0	0	\N	0	2014-04-10 19:55:57	2014-04-10 19:56:44	2014-04-10 19:56:41
245821909	cmmid.github.io	145	https://github.com/lazyatom/cmmid.github.io	\N	HTML	0	0	\N	0	2020-03-08 10:42:23	2020-04-29 17:31:19	2020-04-29 17:31:12
325723	contacts	145	https://github.com/lazyatom/contacts	A universal interface to import email contacts from various providers including Yahoo, Gmail, Hotmail, and Plaxo.	Ruby	1	0	\N	2	2009-10-03 15:43:15	2012-12-12 23:49:18	2009-10-03 15:54:29
16386849	docker-ruby-2.0	145	https://github.com/lazyatom/docker-ruby-2.0	A docker image prepared container Ruby 2.0, to be used as a base	Shell	0	0	\N	0	2014-01-30 16:43:30	2014-01-30 17:29:50	2014-01-30 17:29:49
16386234	docker-ruby-build	145	https://github.com/lazyatom/docker-ruby-build	A docker image prepared for building rubies, to be used as a base	Shell	0	0	\N	0	2014-01-30 16:21:28	2014-01-30 16:26:26	2014-01-30 16:26:26
16448417	docker-test-rails-app	145	https://github.com/lazyatom/docker-test-rails-app	A test application for handling Rails with Docker	Ruby	0	0	\N	0	2014-02-02 01:50:19	2014-02-02 02:03:18	2014-02-02 02:03:17
16386146	docker-ubuntu	145	https://github.com/lazyatom/docker-ubuntu	Basic ubuntu set up for installing other things sensibly	Shell	0	0	\N	0	2014-01-30 16:18:30	2014-01-30 18:10:07	2014-01-30 18:10:06
13603264	dockerfiles	145	https://github.com/lazyatom/dockerfiles	Some docker stuff I'm exploring	\N	0	0	\N	0	2013-10-15 18:50:22	2013-10-17 08:16:08	2013-10-15 18:50:22
145967323	dokku	145	https://github.com/lazyatom/dokku	A docker-powered PaaS that helps you build and manage the lifecycle of applications	Shell	0	0	\N	0	2018-08-24 05:50:44	2018-08-24 05:50:47	2019-03-19 14:20:22
173962023	dokku-buildpack-jekyll3-nginx	145	https://github.com/lazyatom/dokku-buildpack-jekyll3-nginx	Jekyll 3 on Dokku	Shell	0	0	\N	0	2019-03-05 11:29:42	2019-03-05 11:31:55	2019-03-05 11:31:54
176128673	dokku-chrome	145	https://github.com/lazyatom/dokku-chrome	A headless chrome service for dokku	Shell	1	0	\N	8	2019-03-17 13:28:25	2021-01-14 16:35:20	2019-03-19 13:54:40
262772961	doom-emacs	145	https://github.com/lazyatom/doom-emacs	An Emacs framework for the stubborn martian hacker	\N	0	0	\N	0	2020-05-10 08:33:29	2020-05-10 08:33:31	2021-01-14 08:09:40
481247	dotfiles	145	https://github.com/lazyatom/dotfiles	My config files for git, zsh and more	Emacs Lisp	1	1	\N	1	2010-01-20 19:57:58	2020-11-23 15:03:45	2020-11-23 15:03:42
10985	engines	145	https://github.com/lazyatom/engines	The Rails Engines plugin, providing engines features to Rails up to 2.3. I recommend you upgrade to Rails 3.1 when it's available, and use the native engine features it provides!	Ruby	22	0	\N	176	2008-04-18 17:56:06	2019-08-29 07:49:02	2015-11-14 22:09:16
182495	freeagent-widget	145	https://github.com/lazyatom/freeagent-widget	A widget for tracking time in FreeAgent	JavaScript	7	5	\N	23	2009-04-22 05:19:55	2019-08-29 07:49:38	2012-02-03 22:01:33
168471	gem-this	145	https://github.com/lazyatom/gem-this	A super-simple tool to help turn existing code into a gem	Ruby	6	1	\N	78	2009-04-05 07:09:15	2020-09-12 03:35:24	2020-03-22 09:55:09
18525322	ghost-harmonia-theme	145	https://github.com/lazyatom/ghost-harmonia-theme	The theme running harmonia.io/blog	CSS	0	0	\N	0	2014-04-07 13:59:11	2015-08-20 07:58:28	2015-08-20 07:58:28
225536	gitnode	145	https://github.com/lazyatom/gitnode	A trivial git browser. Nothing to see here.	Ruby	0	1	\N	1	2009-06-12 14:25:46	2014-03-26 12:09:39	2009-08-06 14:42:32
165120004	golf-scores	145	https://github.com/lazyatom/golf-scores	Tracking ruby golf scores	Ruby	1	0	\N	0	2019-01-10 17:40:22	2019-01-10 19:56:59	2019-01-10 19:56:58
7110436	harmonia-graphs	145	https://github.com/lazyatom/harmonia-graphs	Statsd graphs for harmonia	JavaScript	0	0	\N	0	2012-12-11 09:11:10	2013-09-27 08:40:33	2013-01-16 07:28:27
1129344	hashblue.app	145	https://github.com/lazyatom/hashblue.app	An example API application using the hashblue API	Ruby	0	0	\N	2	2010-12-01 15:27:15	2013-10-16 19:16:56	2010-12-06 14:30:34
145868676	heroku-buildpack-apt	145	https://github.com/lazyatom/heroku-buildpack-apt	\N	Shell	0	0	\N	0	2018-08-23 11:55:50	2020-09-04 12:00:18	2018-08-20 15:03:17
316979179	homebrew-cask	145	https://github.com/lazyatom/homebrew-cask	🍻 A CLI workflow for the administration of macOS applications distributed as binaries	\N	0	0	\N	0	2020-11-29 12:16:34	2020-11-29 12:16:38	2020-11-29 11:29:52
223375	hostess	145	https://github.com/lazyatom/hostess	Create apache virtual hosts simply and easily	Ruby	4	3	\N	35	2009-06-10 07:10:40	2019-11-25 14:30:27	2012-10-27 16:52:43
278558750	18xx	147	https://github.com/jdhuntington/18xx	A platform for playing 18xx games online!	\N	0	0	\N	0	2020-07-10 03:40:05	2020-07-10 03:40:06	2020-07-10 03:51:43
318006861	advent2020	147	https://github.com/jdhuntington/advent2020	\N	Ruby	0	0	\N	0	2020-12-02 19:20:34	2020-12-14 04:18:37	2020-12-14 04:18:34
90918236	angular2-test	147	https://github.com/jdhuntington/angular2-test	\N	C#	0	0	\N	0	2017-05-10 20:51:48	2017-05-10 20:51:49	2017-05-10 20:51:18
4365418	attr_encrypted	147	https://github.com/jdhuntington/attr_encrypted	Generates attr_accessors that encrypt and decrypt attributes	Ruby	0	0	\N	1	2012-05-18 00:23:27	2013-01-09 03:42:19	2011-04-05 17:37:35
48896332	AzStoragePodcast	147	https://github.com/jdhuntington/AzStoragePodcast	Generate a podcast RSS feed from files stored in Azure Blob Storage	PowerShell	0	0	\N	0	2016-01-02 00:38:10	2016-01-02 00:41:25	2016-01-02 00:42:01
45628427	azure-sdk-for-net	147	https://github.com/jdhuntington/azure-sdk-for-net	Microsoft Azure SDK for .NET	C#	0	0	\N	0	2015-11-05 15:41:23	2015-11-05 15:41:51	2015-11-05 05:35:57
33352599	BddIdeas	147	https://github.com/jdhuntington/BddIdeas	\N	C#	0	0	\N	1	2015-04-03 04:34:55	2018-12-10 00:55:16	2015-04-12 18:54:25
203672104	beachball	147	https://github.com/jdhuntington/beachball	The Sunniest Semantic Version Bumper	TypeScript	0	0	\N	0	2019-08-21 19:16:32	2020-03-25 17:12:29	2020-11-20 15:00:16
457533	boardgame-tracker	147	https://github.com/jdhuntington/boardgame-tracker	Webapp to track plays of boardgames	Clojure	0	0	\N	1	2010-01-03 23:33:12	2013-12-08 16:39:36	2010-01-03 23:33:47
288259517	boll	147	https://github.com/jdhuntington/boll	Repo linting	TypeScript	0	0	\N	0	2020-08-17 15:43:36	2020-08-25 21:01:25	2020-08-25 21:01:23
170572881	bootcamp	147	https://github.com/jdhuntington/bootcamp	Forkable Repo for Creating Frontend Bootcamps	TypeScript	0	0	\N	0	2019-02-13 18:14:35	2019-02-25 16:55:30	2019-02-25 16:56:04
113925635	brigade	147	https://github.com/jdhuntington/brigade	Event-based Scripting for Kubernetes.	Go	0	0	\N	0	2017-12-11 22:58:19	2019-03-21 15:17:54	2017-12-14 03:11:14
828	bus-scheme	147	https://github.com/jdhuntington/bus-scheme	a Scheme written in Ruby, but implemented on the bus!	Ruby	0	0	\N	3	2008-02-06 16:28:52	2019-08-13 10:21:27	2008-06-03 02:49:23
54748786	chirpcircle	147	https://github.com/jdhuntington/chirpcircle	Not twitter, not foursquare.	JavaScript	0	3	\N	0	2016-03-25 18:33:55	2020-07-30 09:33:40	2019-11-02 04:20:56
544186	codekatas	147	https://github.com/jdhuntington/codekatas	Coding exercises	Ruby	0	0	\N	1	2010-03-03 04:37:32	2013-09-09 12:38:27	2010-04-30 17:19:14
6574781	codename-chicane	147	https://github.com/jdhuntington/codename-chicane	A shared music player.	Ruby	0	0	\N	0	2012-11-07 04:06:52	2014-01-31 00:53:16	2012-11-07 04:07:12
229147633	dialog-and-menu	147	https://github.com/jdhuntington/dialog-and-menu	\N	TypeScript	0	6	\N	0	2019-12-19 19:19:06	2019-12-19 19:19:18	2020-12-12 00:56:37
188173	dieselisation	147	https://github.com/jdhuntington/dieselisation	An 18xx game engine in Rails	Ruby	0	2	\N	7	2009-04-29 02:20:35	2020-07-25 03:02:07	2020-02-29 05:42:37
68462636	docker-plex-media-server	147	https://github.com/jdhuntington/docker-plex-media-server	Dockerized Plex Media Server	Shell	0	0	\N	0	2016-09-17 13:06:34	2016-09-17 13:06:35	2016-08-18 09:24:32
265800	dotfiles	147	https://github.com/jdhuntington/dotfiles	My dotfiles	Emacs Lisp	1	0	\N	1	2009-07-31 12:37:49	2018-03-06 00:14:42	2009-07-31 13:24:45
327100759	dynamic-package-server	147	https://github.com/jdhuntington/dynamic-package-server	\N	Ruby	0	0	\N	0	2021-01-05 16:38:32	2021-01-08 15:03:53	2021-01-08 15:03:51
313408483	ecosystem-coffeemug	147	https://github.com/jdhuntington/ecosystem-coffeemug	This is a really dumb react component. You shouldn't use it.	TypeScript	0	0	\N	0	2020-11-16 16:39:48	2020-11-20 21:06:30	2020-11-20 21:06:28
44135445	effacious-adventure	147	https://github.com/jdhuntington/effacious-adventure	\N	JavaScript	0	0	\N	0	2015-10-12 18:33:05	2015-10-12 18:34:06	2015-12-15 19:31:08
573608	emacs-starter-kit	147	https://github.com/jdhuntington/emacs-starter-kit	All the code you need to get started, with an emphasis on dynamic languages.	Emacs Lisp	1	0	\N	1	2010-03-22 03:34:55	2012-12-14 00:45:18	2011-08-23 15:21:55
644643	emacs-starter-kit-customization	147	https://github.com/jdhuntington/emacs-starter-kit-customization	.emacs, but my own stuff so that I can keep a proper fork of emacs-starter-kit running.	Emacs Lisp	0	0	\N	1	2010-05-03 12:59:58	2014-03-16 22:49:17	2012-10-26 14:37:28
68680116	exif	147	https://github.com/jdhuntington/exif	Golang (Go) bindings for libexif.	Go	0	0	\N	0	2016-09-20 03:14:22	2016-09-20 03:14:23	2016-09-20 03:18:05
136242683	Expose	147	https://github.com/jdhuntington/Expose	A simple static site generator for photoessays	Perl	0	0	\N	0	2018-06-05 19:43:19	2018-06-05 19:43:21	2018-02-25 16:23:11
271926909	fast-test	147	https://github.com/jdhuntington/fast-test	What's the fastest route to TDD with typescript?	TypeScript	0	2	\N	0	2020-06-12 23:32:54	2020-06-12 23:33:59	2020-07-21 00:01:46
689822	fieldmarshal	147	https://github.com/jdhuntington/fieldmarshal	Simple integration of EC2 instances into your command line environment.  Shared names for EC2 instances.	Ruby	1	0	\N	1	2010-05-27 16:45:58	2012-12-14 15:39:18	2010-09-02 13:24:50
233146978	fluent-ui-react	147	https://github.com/jdhuntington/fluent-ui-react	An ecosystem for building highly customizable enterprise class user interfaces.	TypeScript	0	0	\N	0	2020-01-10 20:26:13	2020-01-27 20:10:05	2020-01-27 21:57:38
138063582	active_presenter	150	https://github.com/sevenwire/active_presenter	The presenter library you already know.	Ruby	1	0	\N	0	2018-06-20 14:16:27	2018-06-20 14:16:29	2018-07-09 22:05:37
138206183	alphadecimal	150	https://github.com/sevenwire/alphadecimal	Base62 encoding and decoding to turn numbers into very compact strings	Ruby	0	0	\N	0	2018-06-21 15:09:35	2018-06-21 15:14:25	2018-06-21 15:14:24
140485649	best_in_place	150	https://github.com/sevenwire/best_in_place	A RESTful unobtrusive jQuery Inplace-Editor and a helper as a Rails Gem	Ruby	0	0	\N	0	2018-07-10 17:47:21	2018-07-21 14:18:49	2018-07-21 14:18:47
47913	bootstrapper	150	https://github.com/sevenwire/bootstrapper	A Rails plugin to assist in bootstrapping and seeding your database.	Ruby	20	0	\N	59	2008-08-31 17:39:19	2019-08-13 10:33:42	2018-07-08 02:54:18
84501	db_branch	150	https://github.com/sevenwire/db_branch	Rails plugin to play nice with git branching and databases.	Ruby	3	0	\N	16	2008-12-03 17:20:56	2019-08-13 10:45:25	2011-08-04 01:50:32
138218850	ezcrypto	150	https://github.com/sevenwire/ezcrypto	Easy Crypto for Ruby	Ruby	0	0	\N	0	2018-06-21 17:33:41	2020-06-12 22:31:53	2018-04-20 15:59:42
322	forgery	150	https://github.com/sevenwire/forgery	Easy and customizable generation of forged data.	Ruby	103	2	\N	783	2008-02-06 20:33:31	2021-01-26 12:07:09	2020-07-23 14:18:23
138677384	gotogether.co	150	https://github.com/sevenwire/gotogether.co	\N	HTML	0	0	\N	0	2018-06-26 00:00:23	2020-06-09 21:17:02	2018-07-03 03:37:05
140053406	in_place_editing	150	https://github.com/sevenwire/in_place_editing	InPlaceEditing plugin	Ruby	0	0	\N	0	2018-07-07 01:45:31	2018-07-10 03:12:34	2018-07-10 03:12:33
138207846	multipass	150	https://github.com/sevenwire/multipass	Bare bones implementation of encoding and decoding MultiPass values for SSO.	Ruby	0	0	\N	0	2018-06-21 15:28:33	2018-06-21 15:28:35	2018-06-21 15:29:16
148193337	sambal	150	https://github.com/sevenwire/sambal	Ruby Samba Client	Ruby	0	0	\N	0	2018-09-10 14:31:22	2020-06-09 21:17:21	2018-09-10 14:33:16
155768156	sevenwire-rubocop	150	https://github.com/sevenwire/sevenwire-rubocop	\N	Ruby	0	4	\N	0	2018-11-01 16:53:29	2020-05-28 05:45:02	2020-05-28 05:45:00
101016309	sevenwire.com	150	https://github.com/sevenwire/sevenwire.com	\N	HTML	0	0	\N	0	2017-08-22 00:18:14	2020-08-10 17:55:46	2018-08-30 23:41:38
136673902	userstamp	150	https://github.com/sevenwire/userstamp	This Rails plugin extends ActiveRecord::Base to add automatic updating of created_by and updated_by attributes of your models in much the same way that the ActiveRecord::Timestamp module updates created_(at/on) and updated_(at/on) attributes.	HTML	0	0	\N	0	2018-06-08 20:11:36	2018-06-08 20:11:38	2018-06-08 20:13:10
37035225	jillandbrandon.com	151	https://github.com/brandonarbini/jillandbrandon.com	\N	JavaScript	0	0	\N	0	2015-06-07 19:48:40	2015-06-08 03:39:39	2015-06-08 17:01:07
314625765	periodic-table	151	https://github.com/brandonarbini/periodic-table	Periodic elements data	\N	0	0	\N	0	2020-11-20 14:36:11	2020-11-20 14:36:13	2018-10-03 16:47:08
20200042	tanner.arbini.com	151	https://github.com/brandonarbini/tanner.arbini.com	Tanner's first website	HTML	0	0	\N	0	2014-05-26 19:28:26	2018-09-22 15:00:47	2018-09-22 15:00:45
9629973	treadmill	151	https://github.com/brandonarbini/treadmill	Control and report via Bluetooth for LifeSpan treadmills.	Ruby	0	2	\N	6	2013-04-23 15:17:33	2020-05-04 22:29:47	2013-04-23 15:22:14
94211	al3x.net	152	https://github.com/al3x/al3x.net	My blog.	HTML	5	0	\N	6	2008-12-20 01:01:12	2020-03-12 05:15:45	2018-02-23 16:08:05
1345159	asciidoc.tmbundle	152	https://github.com/al3x/asciidoc.tmbundle	AsciiDoc TextMate bundle	\N	0	0	\N	2	2011-02-09 03:28:27	2014-01-20 22:33:58	2011-02-09 03:34:00
17382089	atom-language-textile	152	https://github.com/al3x/atom-language-textile	Textile package for the Atom editor.	CoffeeScript	1	0	\N	1	2014-03-03 19:16:27	2017-05-14 09:55:45	2014-03-03 19:50:49
59066783	awesomebits	152	https://github.com/al3x/awesomebits	This is the source code for the Awesome Foundation website	Ruby	0	0	\N	0	2016-05-17 20:39:49	2020-09-07 16:16:47	2017-04-26 16:28:39
1451665	bugly-ruby	152	https://github.com/al3x/bugly-ruby	A wrapper for the Bugly issue tracker's REST API	Ruby	0	0	\N	5	2011-03-07 17:02:12	2013-12-27 00:29:15	2011-03-08 23:38:21
117831	camper	152	https://github.com/al3x/camper	Campfire (37Signals) to Jabber	Ruby	0	0	\N	4	2009-01-30 01:42:24	2019-08-13 10:57:08	2008-12-30 17:31:24
36145509	clj-gapi	152	https://github.com/al3x/clj-gapi	Clojure Google Web Service API Client	Clojure	0	0	\N	0	2015-05-23 19:36:12	2020-09-07 16:14:28	2015-05-23 19:41:46
619043	configgy	152	https://github.com/al3x/configgy	simple config and logging setup for scala	Scala	1	0	\N	4	2010-04-20 02:10:12	2012-12-14 02:10:41	2010-04-20 04:02:18
3781	downforeveryoneorjustme	152	https://github.com/al3x/downforeveryoneorjustme	Is it down for everyone, or just me?	Python	10	2	\N	87	2008-03-13 14:53:29	2020-04-08 22:24:44	2010-01-11 21:09:40
31565926	draper	152	https://github.com/al3x/draper	Decorators/View-Models for Rails Applications	Ruby	0	0	\N	0	2015-03-02 19:07:47	2020-09-07 16:13:35	2014-12-21 21:37:42
4488866	dropwizard	152	https://github.com/al3x/dropwizard	A damn simple library for building production-ready RESTful web services.	Java	0	0	\N	3	2012-05-29 20:25:11	2018-04-05 18:16:29	2012-05-30 01:13:22
21478571	el-get	152	https://github.com/al3x/el-get	Manage the external elisp bits and pieces upon which you depend!	Emacs Lisp	0	0	\N	0	2014-07-03 19:16:42	2014-07-03 19:18:39	2014-07-04 17:46:47
268396	emacs	152	https://github.com/al3x/emacs	My Emacs configuration.	Emacs Lisp	10	0	\N	59	2009-08-04 01:55:33	2020-09-07 16:15:04	2015-10-29 21:22:17
12399553	emerginglangs.com	152	https://github.com/al3x/emerginglangs.com	The website for the annual Emerging Languages Camp event.	CSS	0	0	\N	2	2013-08-27 04:16:10	2014-04-03 17:04:45	2014-04-03 17:04:45
46461	gimmeh_fixtures	152	https://github.com/al3x/gimmeh_fixtures	A Rails plugin that provides a RESTful API to your fixtures so they can be consumed by external applications.	Ruby	0	0	\N	4	2008-08-26 21:55:42	2019-08-13 10:33:06	2008-09-09 21:30:31
780	git-wiki	152	https://github.com/al3x/git-wiki	A wiki engine that uses a Git repository as its data store.	JavaScript	38	0	\N	155	2008-01-29 18:39:42	2020-12-12 16:30:48	2008-04-20 22:52:53
265169	github-contest	152	https://github.com/al3x/github-contest	In it to probably not win it.	\N	0	0	\N	2	2009-07-30 18:41:15	2013-10-28 13:45:50	2009-07-30 18:45:09
456353	gracelessfailures	152	https://github.com/al3x/gracelessfailures	A blog of Scala tips and tricks.	\N	1	0	\N	5	2010-01-02 19:33:32	2013-10-08 06:34:09	2010-09-10 18:14:11
47941653	ground-control	152	https://github.com/al3x/ground-control	Central volunteer and data portal	JavaScript	0	0	\N	0	2015-12-13 21:47:17	2020-09-07 16:16:11	2015-12-23 17:03:08
388680	homebrew	152	https://github.com/al3x/homebrew	Packaging system for Mac OS X 10.5 and above; heavy optimisations, no redundant packages and a bonus beer theme	Ruby	1	0	\N	3	2009-11-28 19:27:38	2013-12-13 23:23:12	2012-05-30 21:36:04
4733543	HPaste	152	https://github.com/al3x/HPaste	HBase DSL for Scala with MapReduce support	Scala	0	0	\N	2	2012-06-20 22:29:34	2013-02-21 23:52:41	2012-05-29 21:55:05
17913515	hubot-github-todos	152	https://github.com/al3x/hubot-github-todos	Team management with Github Issues.	CoffeeScript	0	0	\N	0	2014-03-19 14:23:41	2014-03-19 16:28:53	2014-03-19 16:25:33
1621456	intellij-colors-solarized	152	https://github.com/al3x/intellij-colors-solarized	Solarized Colorscheme for IntelliJ IDEA	Shell	1	0	\N	4	2011-04-15 21:10:28	2016-06-12 12:59:20	2011-04-15 21:12:28
553479	jackhammer	152	https://github.com/al3x/jackhammer	A generic load testing framework in Scala.	Scala	1	0	\N	11	2010-03-08 23:24:01	2018-10-24 14:18:10	2010-04-19 21:21:00
27506618	jenkins-menu	152	https://github.com/al3x/jenkins-menu	Simple menu item for Mac OS X which shows the status of a Jenkins CI server	Objective-C	0	0	\N	0	2014-12-03 18:38:02	2020-09-07 16:13:20	2014-12-03 18:40:07
83429	kestrel	152	https://github.com/al3x/kestrel	tiny queue system based on starling, in scala	Scala	0	0	\N	3	2008-12-02 00:52:46	2019-08-13 10:45:08	2008-11-30 03:51:28
388651	lets_build_a_compiler	152	https://github.com/al3x/lets_build_a_compiler	A toy compiler, built after Crenshaw's 1988 tutorial.	\N	0	0	\N	10	2009-11-28 18:51:28	2017-05-22 01:52:01	2009-11-28 23:41:57
23979554	logrus	152	https://github.com/al3x/logrus	Structured, pluggable logging for Go.	Go	0	0	\N	2	2014-09-12 19:55:06	2014-09-18 02:12:18	2014-09-14 15:55:49
7928	lyrics	152	https://github.com/al3x/lyrics	People sharing lyrics they love.	JavaScript	1	1	\N	6	2008-04-08 20:23:55	2020-03-16 09:07:15	2008-12-02 01:05:23
4901	metatweet	152	https://github.com/al3x/metatweet	Twitter tracking Twitter on Twitter	Ruby	3	0	\N	8	2008-03-21 23:00:42	2019-08-13 10:22:14	2008-03-26 18:25:08
168812228	actions	153	https://github.com/toolmantim/actions	Some experimental GitHub Actions	Shell	0	0	\N	3	2019-02-02 06:43:46	2020-11-29 12:13:30	2019-02-08 03:15:46
20258014	animals-with-light-sabers	153	https://github.com/toolmantim/animals-with-light-sabers	A small site for teaching HTML and CSS (with gifs!)	CSS	0	0	\N	1	2014-05-28 10:17:37	2014-05-28 23:45:59	2014-05-28 10:18:20
189540857	anka-buildkite-plugin	153	https://github.com/toolmantim/anka-buildkite-plugin	Run Buildkite steps inside Veertu Anka Virtual Machines	Shell	0	0	\N	0	2019-05-31 03:34:06	2019-05-31 03:34:09	2019-05-30 15:31:54
161032126	aptly-publish-buildkite-plugin	153	https://github.com/toolmantim/aptly-publish-buildkite-plugin	Publishes Debian packages to OpenSwitch.	Shell	0	0	\N	0	2018-12-09 09:28:23	2018-12-09 09:28:25	2018-12-09 09:29:09
3490530	asset-pipeline-example	153	https://github.com/toolmantim/asset-pipeline-example	Example Rails 3.2 app showing how to: use the asset pipeline, scare unicorns, and activate epic rainbows.	Ruby	4	0	\N	9	2012-02-20 01:34:24	2018-07-16 22:21:10	2012-02-20 04:43:35
133518569	aws-assume-role-buildkite-plugin	153	https://github.com/toolmantim/aws-assume-role-buildkite-plugin	Buildkite plugin to assume IAM role before running command	Shell	0	0	\N	0	2018-05-15 10:15:45	2018-05-15 10:15:46	2018-07-11 22:35:42
161034387	aws-sm-buildkite-plugin	153	https://github.com/toolmantim/aws-sm-buildkite-plugin	Buildkite plugin for working with AWS Secrets Manager	Shell	0	0	\N	0	2018-12-09 09:57:54	2018-12-09 09:57:56	2018-12-09 09:58:10
197185	bananajour	153	https://github.com/toolmantim/bananajour	Local git repository hosting with a friendly web interface and bonjour discovery. It's like your own little adhoc, network-aware github!	Ruby	27	1	\N	602	2009-05-10 11:29:03	2020-11-29 12:13:02	2017-06-15 09:29:14
978488	bankbest.safariextension	153	https://github.com/toolmantim/bankbest.safariextension	A Safari Extension to improve the UI of BankWest Online Banking	JavaScript	0	0	\N	2	2010-10-11 10:07:57	2013-06-15 17:58:49	2010-10-12 01:21:38
47044767	bash-example	153	https://github.com/toolmantim/bash-example	An example repository you can use as a test project with Buildkite	Shell	0	0	\N	0	2015-11-28 22:42:26	2015-11-28 22:42:29	2015-11-28 22:57:08
132341058	bksr	153	https://github.com/toolmantim/bksr	Run and test your Buildkite pipeline steps locally, just as they'd run in CI (discontinued)	JavaScript	1	0	\N	22	2018-05-06 10:29:34	2018-11-28 07:27:34	2018-11-28 07:27:27
138401499	boomper	153	https://github.com/toolmantim/boomper	Bump version numbers in files whenever new releases are published to GitHub.	JavaScript	1	10	\N	33	2018-06-23 10:03:35	2020-11-29 12:13:20	2021-01-24 19:00:46
22241974	buildbox-build-status	153	https://github.com/toolmantim/buildbox-build-status	Super simple standalone, Herokuable Buildbox build server.	\N	0	0	\N	0	2014-07-24 23:25:20	2014-07-24 23:28:16	2014-07-25 02:57:48
169687462	buildkite-agent-action-test	153	https://github.com/toolmantim/buildkite-agent-action-test	\N	HCL	0	0	\N	1	2019-02-08 03:02:50	2019-02-08 10:58:03	2019-02-08 03:22:13
48157757	buildkite-pipeline-test	153	https://github.com/toolmantim/buildkite-pipeline-test	\N	Shell	0	0	\N	0	2015-12-17 04:52:16	2015-12-18 04:58:05	2015-12-18 05:00:08
45087214	bundler	153	https://github.com/toolmantim/bundler	Manage your application's gem dependencies with less pain	Ruby	0	0	\N	0	2015-10-28 01:44:49	2020-01-09 22:13:10	2015-11-05 02:41:02
86818725	capybara-screenshot	153	https://github.com/toolmantim/capybara-screenshot	Automatically save screen shots when a Capybara scenario fails	Ruby	0	0	\N	0	2017-03-31 09:50:50	2017-03-31 09:50:51	2017-03-31 09:51:56
9994018	carlahackett.com	153	https://github.com/toolmantim/carlahackett.com	A Node.js app and finder Commands that @canarycarla uses to update carlahackett.com	HTML	0	1	\N	1	2013-05-10 23:36:14	2020-11-29 12:13:22	2020-12-10 23:04:23
133620453	change-directory-buildkite-plugin	153	https://github.com/toolmantim/change-directory-buildkite-plugin	Changes the working directory before running command	Shell	0	0	\N	0	2018-05-16 03:28:15	2018-05-16 03:28:17	2018-07-12 19:20:56
228269289	circleci-images	153	https://github.com/toolmantim/circleci-images	Scripts to generate images for building projects on CircleCI 2.0	\N	0	0	\N	0	2019-12-15 20:47:20	2019-12-15 20:47:22	2019-12-03 14:34:41
161034476	cloudformation-output-buildkite-plugin	153	https://github.com/toolmantim/cloudformation-output-buildkite-plugin	Collects cloudformation output from an AWS stack and add them as environment variables	Shell	0	0	\N	0	2018-12-09 09:59:02	2018-12-09 09:59:04	2019-04-07 04:52:39
133519971	codeclimate-test-reporter-buildkite-plugin	153	https://github.com/toolmantim/codeclimate-test-reporter-buildkite-plugin	BuildKite plugin to report test coverage to Code Climate	Shell	0	0	\N	0	2018-05-15 10:25:58	2018-05-15 10:26:01	2018-05-15 10:29:05
81032991	coffee-pots	153	https://github.com/toolmantim/coffee-pots	Recording all the fresh pots	Shell	1	1	\N	5	2017-02-05 22:44:01	2017-02-07 02:37:00	2017-02-07 21:48:06
161034156	datadog-event-buildkite-plugin	153	https://github.com/toolmantim/datadog-event-buildkite-plugin	BuildKite plugin to send a deployment event to datadog	Shell	0	0	\N	0	2018-12-09 09:54:53	2018-12-09 09:54:56	2019-01-11 23:10:10
17477341	delayed_job_web	153	https://github.com/toolmantim/delayed_job_web	Resque like web interface for delayed job	Ruby	0	0	\N	0	2014-03-06 09:44:40	2014-04-12 17:36:30	2014-03-23 09:52:47
298807918	docker-ecr-cache-buildkite-plugin	153	https://github.com/toolmantim/docker-ecr-cache-buildkite-plugin	Zero config plugin for caching Docker images in Amazon ECR or Google Container Registry	\N	0	0	\N	0	2020-09-26 09:18:53	2020-09-26 09:18:55	2020-07-09 09:11:02
1384555	doggie-wars-nsw	153	https://github.com/toolmantim/doggie-wars-nsw	App for the apps4nsw hack day	JavaScript	0	0	\N	4	2011-02-18 20:56:12	2018-07-16 22:21:28	2011-02-20 09:16:08
93515291	dotfiles	153	https://github.com/toolmantim/dotfiles	\N	Shell	0	0	\N	2	2017-06-06 09:22:11	2019-09-10 04:32:57	2019-09-10 04:32:55
20396216	emergency-kitten-request	153	https://github.com/toolmantim/emergency-kitten-request	A demonstration of using the Twilio SMS API and the emergencykitten.com API to send messages to those in need	CSS	1	0	\N	0	2014-06-02 04:34:37	2018-07-16 22:20:20	2014-06-03 11:21:45
98063859	emoji-regex	153	https://github.com/toolmantim/emoji-regex	A regular expression to match all Emoji-only symbols as per the Unicode Standard.	JavaScript	0	0	\N	0	2017-07-22 20:42:01	2017-07-22 20:42:02	2017-08-07 14:45:49
969573	activerecord-cachedb-adapter	154	https://github.com/nicksieger/activerecord-cachedb-adapter	ActiveRecord adapter for Intersystems CacheDb	Ruby	0	0	\N	5	2010-10-07 12:18:02	2018-06-21 18:36:56	2010-10-07 12:37:16
2337906	activerecord-jdbc-adapter	154	https://github.com/nicksieger/activerecord-jdbc-adapter	ActiveRecord adapter for JDBC and JRuby.	Ruby	2	0	\N	1	2011-09-06 19:35:51	2018-10-31 18:01:58	2011-09-06 19:38:28
93036	advent-jruby	154	https://github.com/nicksieger/advent-jruby	Code for article on Ruby Advent 2008	Ruby	1	0	\N	9	2008-12-18 18:18:09	2019-08-13 10:48:37	2008-12-19 14:10:23
2358	attachment_fu	154	https://github.com/nicksieger/attachment_fu	Treat an ActiveRecord model as a file attachment, storing its patch, size, content type, etc.	Ruby	0	0	\N	3	2008-01-14 12:51:56	2019-08-13 10:21:42	2008-03-26 16:43:21
1351682	bundler	154	https://github.com/nicksieger/bundler	Manage your application's gem dependencies with less pain	Ruby	0	0	\N	1	2011-02-10 16:14:03	2020-01-09 22:11:28	2011-04-16 17:12:10
1730372	childprocess	154	https://github.com/nicksieger/childprocess	Cross-platform ruby library for managing child processes.	Ruby	0	0	\N	1	2011-05-10 19:00:33	2016-07-03 23:04:03	2011-11-16 18:35:19
4163898	dcell	154	https://github.com/nicksieger/dcell	Easy-to-use distributed concurrent objects in Ruby based on Celluloid and 0MQ	JavaScript	0	0	\N	1	2012-04-27 21:42:37	2013-04-16 21:00:44	2013-04-04 17:25:04
98682289	delayed_job	154	https://github.com/nicksieger/delayed_job	Database based asynchronous priority queue system -- Extracted from Shopify 	Ruby	0	0	\N	0	2017-07-28 16:45:30	2017-07-28 16:45:32	2017-07-29 14:37:44
281158952	departure	154	https://github.com/nicksieger/departure	Percona's pt-online-schema-change runner for ActiveRecord migrations.	\N	0	0	\N	0	2020-07-20 12:45:11	2020-07-20 12:45:12	2020-07-29 14:42:00
82402	drbirb	154	https://github.com/nicksieger/drbirb	Simple IRB-over DRb for poking inside your servers	Ruby	0	1	\N	11	2008-11-29 16:45:49	2019-08-13 10:44:48	2012-06-27 14:11:50
438782	ey-cloud-recipes	154	https://github.com/nicksieger/ey-cloud-recipes	A starter repo for custom chef recipes on EY's cloud platform	Ruby	1	0	\N	1	2009-12-16 01:16:44	2014-02-06 00:52:47	2011-03-09 14:32:50
76307	github-gem	154	https://github.com/nicksieger/github-gem	The official `github` command line helper for simplifying your GitHub experience.	Ruby	0	0	\N	2	2008-11-15 04:36:05	2019-08-13 10:42:48	2008-11-15 04:40:03
21135	gitjour	154	https://github.com/nicksieger/gitjour	Serve git and advertise with bonjour	Ruby	0	0	\N	2	2008-05-31 19:22:18	2019-08-13 10:25:37	2008-06-01 13:57:49
1712099	guard	154	https://github.com/nicksieger/guard	Guard is a command line tool to easily handle events on files modifications (FSEvent / Inotify / Polling support).	Ruby	0	0	\N	1	2011-05-06 13:21:43	2013-01-01 23:51:35	2011-05-06 16:40:46
1712883	guard-jmx	154	https://github.com/nicksieger/guard-jmx	JMX interaction with Guard	Ruby	0	0	\N	1	2011-05-06 16:13:32	2013-09-20 06:43:07	2011-05-06 17:16:58
230634	hello_world	154	https://github.com/nicksieger/hello_world	Hello World Rails Application for testing deployments.	Ruby	1	0	\N	2	2009-06-18 13:58:00	2012-12-12 20:54:35	2009-06-18 13:58:50
59034133	homebrew-core	154	https://github.com/nicksieger/homebrew-core	:beers: Core formulae for the Homebrew package manager	Ruby	0	0	\N	0	2016-05-17 12:20:19	2018-09-06 15:57:41	2019-03-28 21:54:40
954175	java-from-ruby-examples	154	https://github.com/nicksieger/java-from-ruby-examples	Examples from JRubyConf tutorial day	Ruby	0	0	\N	5	2010-10-01 09:59:57	2017-05-27 08:57:59	2010-10-01 15:09:04
47508	jetty-rails	154	https://github.com/nicksieger/jetty-rails	use jetty to run any warbler based rails project	Ruby	2	0	\N	5	2008-08-30 00:21:52	2019-08-13 10:33:33	2008-08-30 00:48:08
301738	jibernate	154	https://github.com/nicksieger/jibernate	A JRuby/Hibernate integration example, maybe eventually a full API	Ruby	2	0	\N	3	2009-09-09 01:47:18	2012-12-12 23:11:07	2009-09-09 07:05:28
2050	jrexml	154	https://github.com/nicksieger/jrexml	JREXML is an add-on for JRuby that uses a Java pull parser library to speed up REXML.	Ruby	2	1	\N	7	2008-03-01 20:03:58	2019-08-13 10:21:40	2020-10-24 07:47:00
2337920	jruby-rack	154	https://github.com/nicksieger/jruby-rack	Rack for JRuby and Java appservers	Ruby	7	0	\N	16	2011-09-06 19:38:52	2017-05-21 00:24:16	2011-09-06 19:40:00
1762165	jruby-sinatra-env	154	https://github.com/nicksieger/jruby-sinatra-env	Simple environment-sniffer Sinatra app for JRuby-Rack	JavaScript	0	0	\N	6	2011-05-17 15:32:07	2019-08-13 11:45:30	2011-06-29 15:11:45
133522	jsonpretty	154	https://github.com/nicksieger/jsonpretty	Command-line JSON pretty-printer	Ruby	7	1	\N	105	2009-02-20 16:03:14	2020-07-28 07:05:53	2010-01-26 12:56:04
1312820	kirk	154	https://github.com/nicksieger/kirk	A Jetty binding for JRuby	Ruby	0	0	\N	1	2011-01-31 14:27:54	2012-12-17 20:20:23	2011-02-12 20:26:52
10272370	lucene	154	https://github.com/nicksieger/lucene	A JRuby wrapper for the Lucene Document Database	Ruby	0	0	\N	0	2013-05-24 15:22:42	2013-05-24 15:22:42	2010-10-20 10:09:50
189892372	me	154	https://github.com/nicksieger/me	Self-aware repo	\N	0	0	\N	0	2019-06-02 17:31:44	2020-12-09 15:13:27	2020-12-09 15:13:25
945551	memcached	154	https://github.com/nicksieger/memcached	A Ruby interface to the libmemcached C client	Ruby	0	0	\N	2	2010-09-28 10:46:57	2016-02-09 20:20:18	2010-09-28 13:24:26
699847	neo4j	154	https://github.com/nicksieger/neo4j	A Graph Database for JRuby. It uses the java lib neo4j as storage and lucene for quering/indexing	Ruby	1	0	\N	2	2010-06-02 17:00:19	2014-08-28 19:02:48	2010-09-30 12:22:56
569473	neo4j-rails	154	https://github.com/nicksieger/neo4j-rails	Neo4j + ActiveModel for Rails 3	Ruby	3	0	\N	29	2010-03-19 03:38:48	2019-08-13 11:32:08	2011-05-23 14:25:15
23076	adhearsion	155	https://github.com/jicksta/adhearsion	Open-source framework for writing voice-enabled applications using Ruby.	Ruby	22	1	\N	175	2008-06-06 23:31:48	2019-08-13 10:26:10	2012-04-02 00:01:06
96261	adhearsion-website	155	https://github.com/jicksta/adhearsion-website	Official Adhearsion.com website	JavaScript	13	0	\N	5	2008-12-24 06:30:39	2019-08-13 10:49:51	2009-05-06 17:54:23
1157	ami-ragel	155	https://github.com/jicksta/ami-ragel	The new Asterisk Manager Interface implementation that uses Ragel and EventMachine	Ruby	3	0	\N	17	2008-02-25 04:39:06	2019-08-13 10:21:31	2008-08-19 00:29:45
97244284	API-Flow	155	https://github.com/jicksta/API-Flow	Universal data structure and converter for API formats (Swagger, RAML, Paw, Postman…)	JavaScript	0	0	\N	0	2017-07-14 11:47:56	2017-07-14 11:47:58	2017-05-17 06:57:09
66226	click-to-call	155	https://github.com/jicksta/click-to-call	Adhearsion Click to Call Example Application	Ruby	1	0	\N	5	2008-10-22 07:45:01	2019-08-13 10:39:01	2008-10-17 03:38:38
4710030	clj-genetic	155	https://github.com/jicksta/clj-genetic	Experimenting with genetic algorithms in Clojure	Clojure	0	0	\N	1	2012-06-19 03:04:45	2013-10-22 00:52:10	2012-07-06 00:19:06
59637883	cljs-electron	155	https://github.com/jicksta/cljs-electron	ClojureScript + Electron + Figwheel + Reagent  = ❤❤❤	Clojure	0	0	\N	0	2016-05-25 03:45:31	2016-05-25 03:45:32	2016-05-13 05:28:51
5203	desk-pbx	155	https://github.com/jicksta/desk-pbx	This is the Adhearsion app I use for my own phone system. At the moment it's pretty useless to people other than me.	Ruby	1	0	\N	7	2008-03-24 19:50:59	2019-08-13 10:22:16	2008-05-08 13:28:20
314110622	differential-datalog	155	https://github.com/jicksta/differential-datalog	An incremental programming language	\N	0	0	\N	0	2020-11-18 23:07:03	2020-11-18 23:07:05	2020-11-18 21:09:55
49823643	dionysus	155	https://github.com/jicksta/dionysus	Ambitious next-gen personal cloud application suite	Clojure	0	0	\N	0	2016-01-17 13:46:13	2016-01-31 18:37:37	2016-01-31 21:16:32
55080208	docker-caradoc	155	https://github.com/jicksta/docker-caradoc	Dockerized version of the OCaml-based PDF parser Caradoc	Shell	0	0	\N	0	2016-03-30 13:47:19	2016-03-30 13:49:42	2016-03-30 13:49:42
1258614	dotfiles	155	https://github.com/jicksta/dotfiles	\N	Shell	0	0	\N	1	2011-01-15 18:14:48	2018-12-27 14:27:11	2018-12-27 14:27:09
8529634	dotjs	155	https://github.com/jicksta/dotjs	~/.js	Ruby	0	0	\N	0	2013-03-02 21:44:14	2013-03-02 21:44:14	2013-01-21 20:13:14
26824225	ember-cli-bootstrap	155	https://github.com/jicksta/ember-cli-bootstrap	ember-cli addon for Twitter Bootstrap	JavaScript	0	0	\N	0	2014-11-18 16:42:36	2014-11-18 16:42:36	2014-10-03 15:19:19
26507858	ember-cli-proxy-fixtures	155	https://github.com/jicksta/ember-cli-proxy-fixtures	Ember CLI Proxy Fixtures	JavaScript	0	0	\N	0	2014-11-11 20:28:55	2019-01-18 16:44:18	2014-11-11 20:31:20
21308911	ember-table	155	https://github.com/jicksta/ember-table	\N	CoffeeScript	0	0	\N	0	2014-06-28 15:48:58	2014-06-27 12:21:16	2014-06-28 17:32:37
3821716	Enchantment	155	https://github.com/jicksta/Enchantment	Experimental WebGL EverQuest-like MMO.	JavaScript	0	0	\N	5	2012-03-24 23:08:29	2019-12-21 22:39:21	2012-04-11 14:09:20
551983	etsy-veganized	155	https://github.com/jicksta/etsy-veganized	Website for browsing Etsy.com, optimized for vegans wanting to buy local, indie clothing	JavaScript	0	0	\N	1	2010-03-08 01:28:16	2013-10-17 11:45:51	2010-04-24 10:14:42
54583470	excon	155	https://github.com/jicksta/excon	Usable, fast, simple HTTP 1.1 for Ruby	Ruby	0	0	\N	0	2016-03-23 15:25:14	2016-03-23 15:25:15	2016-03-21 12:43:58
12337728	fulcrum	155	https://github.com/jicksta/fulcrum	An agile project planning tool	JavaScript	0	0	\N	0	2013-08-24 00:48:23	2014-08-14 21:24:02	2013-08-24 00:50:29
49388438	ganymede	155	https://github.com/jicksta/ganymede	Application development framework for the P2P web	Elm	0	0	\N	0	2016-01-10 20:27:38	2016-02-01 13:41:15	2016-02-01 13:37:01
129425452	gopass	155	https://github.com/jicksta/gopass	The slightly more awesome standard unix password manager for teams	Go	0	0	\N	0	2018-04-13 13:07:32	2018-05-28 10:43:00	2018-04-13 09:49:22
22013885	ic-autocomplete	155	https://github.com/jicksta/ic-autocomplete	accessible ember autocomplete component	\N	0	0	\N	0	2014-07-19 13:27:59	2014-07-14 22:43:40	2014-06-20 17:01:56
1395707	jasmine	155	https://github.com/jicksta/jasmine	DOM-less simple JavaScript testing framework	JavaScript	0	0	\N	1	2011-02-21 22:31:16	2014-11-20 19:31:34	2011-01-26 21:34:24
1395710	jasmine-gem	155	https://github.com/jicksta/jasmine-gem	Jasmine ruby gem	Ruby	0	0	\N	1	2011-02-21 22:32:12	2014-11-20 19:31:04	2011-04-01 00:51:12
82427854	lobsters	155	https://github.com/jicksta/lobsters	Rails code running the Lobsters link aggregation site	Ruby	0	0	\N	0	2017-02-18 23:39:39	2017-02-18 23:39:41	2017-01-30 14:15:46
4428	methodphitamine	155	https://github.com/jicksta/methodphitamine	The Methodphitamine! Creates the implied block argument "it" which makes the refining and enumerating of collections much simpler. For example, User.find(:all).collect &its.contacts.map(&its.last_name.capitalize)	Ruby	7	4	\N	25	2008-03-18 16:58:04	2019-09-10 13:29:50	2013-01-18 16:14:09
583990	mongoid	155	https://github.com/jicksta/mongoid	Ruby ODM framework for MongoDB	Ruby	1	0	\N	1	2010-03-28 19:31:44	2015-07-27 09:13:11	2010-03-28 19:39:19
21597101	notes-backend	155	https://github.com/jicksta/notes-backend	Backend for my Evernote-like Notes app	JavaScript	0	0	\N	0	2014-07-08 00:32:23	2015-12-08 18:56:22	2014-08-10 14:03:41
3268702	omniauth-evernote	155	https://github.com/jicksta/omniauth-evernote	Evernote strategy for OmniAuth	Ruby	0	0	\N	1	2012-01-25 19:26:48	2013-01-06 18:10:39	2012-01-25 19:28:30
4409367	alanturingday	156	https://github.com/joshsusser/alanturingday	\N	\N	1	0	\N	5	2012-05-22 13:21:10	2017-04-05 02:49:43	2012-05-22 13:52:38
1301674	cimonitor	156	https://github.com/joshsusser/cimonitor	Big Visible Chart CI aggregator	Ruby	0	0	\N	2	2011-01-28 02:12:18	2012-12-17 19:42:52	2011-02-22 02:48:16
357388	gemcutter	156	https://github.com/joshsusser/gemcutter	awesome gem hosting.	Ruby	1	0	\N	1	2009-11-01 19:51:06	2012-12-13 00:42:23	2011-04-03 21:20:54
21869015	git_scripts	156	https://github.com/joshsusser/git_scripts	Developer workflow convenience scripts	\N	0	0	\N	0	2014-07-15 14:27:20	2014-07-10 05:38:23	2014-07-13 00:30:30
1655196	informal	156	https://github.com/joshsusser/informal	Easily use any Plain Old Ruby Object as the model for Rails form helpers.	Ruby	15	3	\N	124	2011-04-23 20:28:57	2020-08-05 18:23:36	2011-10-27 09:04:17
21022636	jasmine-react	156	https://github.com/joshsusser/jasmine-react	Unit test your React.js applications with Jasmine	JavaScript	0	0	\N	0	2014-06-19 23:25:12	2014-06-19 23:31:12	2014-06-19 23:29:59
2154	migration_concordance	156	https://github.com/joshsusser/migration_concordance	Ruby on Rails plugin to provide notification when you need to run migrations	Ruby	0	0	\N	15	2008-03-02 17:26:05	2019-08-13 10:21:41	2008-09-24 08:56:10
629119	rails	156	https://github.com/joshsusser/rails	Ruby on Rails	Ruby	1	0	\N	1	2010-04-26 03:14:16	2018-05-17 18:51:36	2018-05-17 18:51:34
2984	range_set	156	https://github.com/joshsusser/range_set	class that supports set operations on ranges. some of my first ruby code, so be warned.	Ruby	1	0	\N	3	2008-03-07 18:54:01	2019-08-13 10:21:51	2008-03-26 17:01:47
346619	refraction	156	https://github.com/joshsusser/refraction	Rack middleware replacement for mod_rewrite	Ruby	7	9	\N	224	2009-10-22 21:10:31	2021-01-24 11:04:54	2010-07-30 12:51:32
643573	sf-vegetarian-restaurants	156	https://github.com/joshsusser/sf-vegetarian-restaurants	A list of awesome vegetarian-friendly restaurants in SF	\N	1	0	\N	1	2010-05-02 19:11:36	2012-12-14 14:11:25	2010-03-30 19:55:42
2601413	snippets	156	https://github.com/joshsusser/snippets	\N	Ruby	0	0	\N	2	2011-10-18 17:40:13	2013-12-22 14:34:33	2011-10-18 17:42:42
19625	teldra_prime	156	https://github.com/joshsusser/teldra_prime	The danceable demo version.	Ruby	1	0	\N	18	2008-05-26 01:55:50	2019-08-13 10:25:14	2008-05-31 19:19:26
14525	validates_existence	156	https://github.com/joshsusser/validates_existence	Rails plugin that provides a validates_existence_of method for ActiveRecord models to check existence of records referenced by belongs_to associations..	Ruby	8	2	\N	33	2008-05-04 21:24:46	2019-08-13 10:24:01	2008-05-04 21:25:50
332747	version_sorter	156	https://github.com/joshsusser/version_sorter	\N	Ruby	1	0	\N	1	2009-10-09 22:05:10	2012-12-12 23:59:42	2009-10-09 22:08:25
11345093	writing	156	https://github.com/joshsusser/writing	bits of writing	Ruby	0	0	\N	2	2013-07-11 12:10:51	2019-08-13 12:23:34	2013-07-11 13:10:17
212075	chef-deploy	157	https://github.com/jcrosby/chef-deploy	Chef Resources and Providers for deploying ruby web apps without capistrano	Ruby	1	0	\N	1	2009-05-27 21:25:49	2012-12-12 20:23:16	2009-05-27 21:30:38
3511930	clj-redis	157	https://github.com/jcrosby/clj-redis	Clojure Redis client library	Clojure	0	0	\N	1	2012-02-22 04:16:14	2013-01-07 21:12:40	2012-02-22 04:22:45
4859	cloudkit	157	https://github.com/jcrosby/cloudkit	An Open Web JSON Appliance	Ruby	29	2	\N	309	2008-03-21 18:36:32	2020-09-22 15:43:05	2011-04-13 23:28:49
20446553	cointrader	157	https://github.com/jcrosby/cointrader	cryptocurrency trading backend	Java	0	0	\N	0	2014-06-03 11:44:22	2014-06-22 00:01:15	2014-06-22 00:01:15
20674511	datasciencecoursera	157	https://github.com/jcrosby/datasciencecoursera	\N	\N	0	0	\N	0	2014-06-10 03:12:05	2014-06-10 03:15:03	2014-06-10 03:15:04
20674631	datasharing	157	https://github.com/jcrosby/datasharing	The Leek group guide to data sharing 	\N	0	0	\N	0	2014-06-10 03:17:12	2014-06-10 03:17:47	2013-11-25 14:08:34
32107042	deployinator	157	https://github.com/jcrosby/deployinator	Deployinate!	Ruby	0	0	\N	0	2015-03-12 19:43:20	2015-03-12 19:43:21	2015-03-12 19:44:39
125636	dm-simpledb-adapter	157	https://github.com/jcrosby/dm-simpledb-adapter	A SimpleDB adapter for DataMapper built on the RightScale gem	Python	0	0	\N	3	2009-02-10 05:38:49	2019-08-13 10:59:48	2009-02-17 14:22:45
342342	domfree	157	https://github.com/jcrosby/domfree	A set of utility methods and modifications to JavaScript that have nothing to do with the DOM	JavaScript	0	0	\N	3	2009-10-19 12:50:25	2021-01-13 16:27:22	2009-10-31 17:28:58
9319	endpointr	157	https://github.com/jcrosby/endpointr	A Leopard UI for testing OAuth endpoints	Objective-C	2	0	\N	22	2008-04-13 02:53:35	2019-08-13 10:22:57	2008-12-28 05:51:21
21629322	fusion-nodes	157	https://github.com/jcrosby/fusion-nodes	The home for nodes contributed by Helium platform partners and community members	JavaScript	0	0	\N	0	2014-07-08 17:59:44	2015-02-12 21:25:32	2014-07-23 22:07:31
107771	jquery-cloudkit	157	https://github.com/jcrosby/jquery-cloudkit	An in-browser queryable JSON store for CloudKit.	JavaScript	4	0	\N	43	2009-01-15 01:33:53	2019-08-13 10:53:47	2010-05-12 13:25:44
168066	jsonquery	157	https://github.com/jcrosby/jsonquery	A JSONQuery implementation in JavaScript	JavaScript	11	0	\N	43	2009-04-04 15:07:10	2019-08-13 11:15:18	2009-04-09 02:55:05
280700	jsonschema	157	https://github.com/jcrosby/jsonschema	A JSONSchema validator	JavaScript	0	0	\N	6	2009-08-18 03:11:33	2013-11-29 08:25:37	2009-08-19 03:21:03
26536	oauth	157	https://github.com/jcrosby/oauth	OAuth implementation for Ruby	Ruby	0	0	\N	3	2008-06-18 19:02:40	2019-08-13 10:27:05	2009-02-01 21:41:26
263888	oauth-plugin	157	https://github.com/jcrosby/oauth-plugin	Rails plugin for OAuth	Ruby	1	0	\N	1	2009-07-29 16:29:15	2012-12-12 21:53:46	2009-07-29 16:37:52
11037808	packer	157	https://github.com/jcrosby/packer	Packer is a tool for creating identical machine images for multiple platforms from a single source configuration.	Go	1	0	\N	0	2013-06-28 17:54:02	2017-04-04 17:26:26	2020-09-02 03:08:59
11612295	pedestal	157	https://github.com/jcrosby/pedestal	The Pedestal web application framework	Clojure	0	0	\N	0	2013-07-23 12:45:06	2013-07-23 13:48:20	2013-07-23 12:46:07
20965295	ProgrammingAssignment2	157	https://github.com/jcrosby/ProgrammingAssignment2	Repository for Programming Assignment 2 for R Programming on Coursera	R	0	0	\N	0	2014-06-18 11:32:41	2014-06-22 16:51:08	2014-06-22 16:51:07
10348081	q	157	https://github.com/jcrosby/q	\N	\N	0	0	\N	0	2013-05-28 20:47:56	2014-05-17 18:09:51	2013-05-28 20:50:09
81832	rack-config	157	https://github.com/jcrosby/rack-config	Shared configuration for cooperative middleware.	Ruby	3	0	\N	24	2008-11-27 21:55:35	2020-10-15 14:05:56	2008-11-28 02:28:41
112401	rack-contrib	157	https://github.com/jcrosby/rack-contrib	Contributed Rack Middleware and Utilities	Ruby	0	0	\N	3	2009-02-05 01:42:15	2019-08-13 10:55:23	2009-11-18 18:02:13
10623906	remotestorage.io	157	https://github.com/jcrosby/remotestorage.io	remoteStorage Website (plus project discussion in the issue tracker)	CoffeeScript	0	0	\N	0	2013-06-11 12:02:08	2013-06-12 11:12:53	2013-06-11 12:02:56
311165	snarl	157	https://github.com/jcrosby/snarl	JavaScript in Disguise	Ruby	0	1	\N	28	2009-09-18 16:37:39	2021-01-13 16:27:09	2009-11-09 00:04:32
304122	spectacular	157	https://github.com/jcrosby/spectacular	A minimal spec library for node.js	JavaScript	3	0	\N	16	2009-09-11 11:41:31	2019-12-06 18:17:49	2010-01-28 00:22:07
8302310	visaje	157	https://github.com/jcrosby/visaje	\N	Clojure	0	0	\N	0	2013-02-19 21:00:09	2013-02-19 21:31:49	2013-02-19 21:08:06
113475323	webpack	157	https://github.com/jcrosby/webpack	A full-featured Webpack + vue-loader setup with hot reload, linting, testing & css extraction.	JavaScript	0	0	\N	0	2017-12-07 14:41:00	2017-12-07 14:41:02	2017-12-07 07:28:36
9664177	XChange	157	https://github.com/jcrosby/XChange	A Financial Exchange Library for Java	Java	0	0	\N	0	2013-04-25 01:59:09	2018-04-06 07:18:50	2013-04-24 10:32:11
208794	address_book_name_inverter	158	https://github.com/thewoolleyman/address_book_name_inverter	address_book_name_inverter to fix mac address book with switched/duplicate first/last names from import	Ruby	0	0	\N	1	2009-05-24 04:27:12	2012-12-12 20:17:41	2009-05-25 21:42:11
16397982	adv_duplicator	158	https://github.com/thewoolleyman/adv_duplicator	Garry's Mod Advance Duplicator Folder	\N	0	0	\N	0	2014-01-31 00:43:22	2014-01-31 01:35:17	2014-01-31 01:35:15
603808	amibuilder	158	https://github.com/thewoolleyman/amibuilder	This project is deprecated. It has been rewritten and improved as "boxbuilder". Please update any links:  http://github.com/thewoolleyman/boxbuilder	\N	0	0	\N	2	2010-04-10 09:29:23	2013-10-11 15:31:31	2010-08-24 02:58:25
94513551	AnnotationExample	158	https://github.com/thewoolleyman/AnnotationExample	simple example of a custom annotation in Java	Java	0	0	\N	0	2017-06-16 03:40:21	2017-06-16 03:40:37	2017-06-16 03:40:36
94412737	app-config	158	https://github.com/thewoolleyman/app-config	Platform Acceleration Lab Spring Cloud Services	\N	0	0	\N	0	2017-06-15 04:33:08	2017-06-15 04:33:08	2017-06-16 23:40:32
95275078	apps-cloud-native-evolution-code	158	https://github.com/thewoolleyman/apps-cloud-native-evolution-code	Code for the Cloud Native evolution	Java	0	0	\N	0	2017-06-24 01:11:56	2017-06-24 01:11:57	2017-06-24 06:49:31
106427094	apps-movie-fun-code	158	https://github.com/thewoolleyman/apps-movie-fun-code	\N	Java	0	0	\N	0	2017-10-10 11:18:24	2017-10-10 11:18:26	2017-10-10 11:26:35
105077170	apps-movie-fun-modernization-code	158	https://github.com/thewoolleyman/apps-movie-fun-modernization-code	debugging	Java	0	0	\N	0	2017-09-27 19:48:30	2017-09-27 19:49:38	2017-09-27 23:28:22
95335579	apps-platform-acceleration-bosh-code	158	https://github.com/thewoolleyman/apps-platform-acceleration-bosh-code	\N	Ruby	0	0	\N	0	2017-06-25 00:12:25	2017-06-25 00:12:27	2017-06-25 04:10:41
95282868	apps-platform-acceleration-spring-configuration-code	158	https://github.com/thewoolleyman/apps-platform-acceleration-spring-configuration-code	A starting point configuration repo. This will allow you to use the Spring Cloud CLI with the defaults.	\N	0	0	\N	0	2017-06-24 04:32:08	2017-03-06 14:25:43	2017-06-24 06:48:30
95990861	apps-platform-acceleration-struts-code	158	https://github.com/thewoolleyman/apps-platform-acceleration-struts-code	\N	Java	0	0	\N	0	2017-07-01 19:38:57	2017-07-01 19:38:58	2017-07-01 20:06:07
94409800	apps-spring-cloud-services-code	158	https://github.com/thewoolleyman/apps-spring-cloud-services-code	repo for the code for the spring cloud services lab	JavaScript	0	0	\N	0	2017-06-15 03:57:54	2017-06-15 03:57:55	2017-06-17 22:38:44
94809654	assignment-submission	158	https://github.com/thewoolleyman/assignment-submission	\N	\N	0	0	\N	0	2017-06-19 15:45:17	2017-06-19 15:45:17	2017-06-19 15:45:39
315690	auto_tagger	158	https://github.com/thewoolleyman/auto_tagger	Helps you automatically create tags for each stage in a multi-stage deploment and deploy from the latest tag from the previous environment	Ruby	1	0	\N	2	2009-09-23 16:50:09	2012-12-12 23:34:04	2009-05-05 13:09:25
16759242	aws-sdk-ruby	158	https://github.com/thewoolleyman/aws-sdk-ruby	The official AWS SDK for Ruby.	Ruby	0	0	\N	0	2014-02-12 05:18:17	2014-02-12 18:20:43	2014-02-12 05:36:22
83070888	bash-example	158	https://github.com/thewoolleyman/bash-example	non-fork copy of buildkite example repo	Shell	0	1	\N	0	2017-02-24 15:28:42	2017-02-24 16:11:11	2017-02-24 16:15:32
168395640	bash-parallel-example	158	https://github.com/thewoolleyman/bash-parallel-example	An example of how to a bash script in parallel on Buildkite	Shell	0	0	\N	0	2019-01-30 16:44:58	2019-01-30 16:45:00	2019-01-23 20:41:36
28421866	bashstyle_examples	158	https://github.com/thewoolleyman/bashstyle_examples	Bash examples following style guide at https://github.com/progrium/bashstyle	Shell	1	0	\N	6	2014-12-23 20:04:27	2018-07-06 18:08:54	2018-06-09 04:38:18
824271	bashtips	158	https://github.com/thewoolleyman/bashtips	My scratch area for figuring out and remembering Bash idioms	\N	0	0	\N	3	2010-08-08 02:44:45	2015-02-26 14:32:03	2010-10-19 02:33:00
168410620	bkautoretry	158	https://github.com/thewoolleyman/bkautoretry	Buildkite Job Autoretry	Kotlin	0	0	\N	0	2019-01-30 18:31:34	2019-01-31 20:33:34	2019-01-31 20:33:33
204101927	bkbuddy	158	https://github.com/thewoolleyman/bkbuddy	Rails 6 + React app to interact with Buildkite API (incomplete)	Ruby	0	0	\N	0	2019-08-24 00:14:38	2019-08-24 00:18:38	2019-11-02 01:41:05
790218	blinksync	158	https://github.com/thewoolleyman/blinksync	blinksync	\N	0	0	\N	1	2010-07-22 01:26:24	2014-11-03 23:34:44	2010-07-22 03:27:16
194582585	blueprint-sass-var-spike	158	https://github.com/thewoolleyman/blueprint-sass-var-spike	\N	Ruby	0	4	\N	0	2019-06-30 22:56:27	2019-06-30 22:56:50	2019-12-19 19:51:27
335054	bookmark_converter	158	https://github.com/thewoolleyman/bookmark_converter	Converts .URL files containing 'URL=' lines into an html page of bookmarks 	Ruby	0	0	\N	2	2009-10-12 14:30:26	2020-09-28 12:14:19	2009-10-12 14:38:02
236848	bootstrap-ruby	158	https://github.com/thewoolleyman/bootstrap-ruby	Simple scripts to install and configure various versions of Ruby from scratch on bare-bones machines.	Shell	0	0	\N	6	2009-06-26 06:18:20	2019-07-11 14:39:43	2010-02-12 05:18:21
29539886	bosh-bootstrap	158	https://github.com/thewoolleyman/bosh-bootstrap	From zero to a running micro BOSH in one command line	Ruby	0	0	\N	0	2015-01-20 14:40:14	2017-03-23 18:51:11	2015-01-21 18:30:37
16746633	bosh-lite	158	https://github.com/thewoolleyman/bosh-lite	A lite development env for BOSH	Shell	0	0	\N	0	2014-02-11 19:42:27	2020-09-23 17:11:48	2014-02-11 19:44:36
751433	boxbuilder	158	https://github.com/thewoolleyman/boxbuilder	Boxbuilder builds boxes!  Basic Bash scripts to bootstrap barebones-OS boxes with chef-solo.  Tracker Project: http://www.pivotaltracker.com/projects/101913	\N	2	0	\N	8	2010-07-01 11:33:41	2017-02-23 23:20:21	2010-12-21 09:59:42
792667	boxbuilder_example_dependency_chef_repo	158	https://github.com/thewoolleyman/boxbuilder_example_dependency_chef_repo	Second example chef repo for boxbuilder.  See main project at http://github.com/thewoolleyman/boxbuilder	Ruby	0	0	\N	1	2010-07-23 02:16:49	2014-02-02 00:21:05	2010-09-12 05:16:07
754035	boxbuilder_example_main_chef_repo	158	https://github.com/thewoolleyman/boxbuilder_example_main_chef_repo	First example chef repo for boxbuilder.  See main project at http://github.com/thewoolleyman/boxbuilder	Ruby	0	0	\N	1	2010-07-02 16:03:18	2013-10-31 10:21:37	2010-09-12 05:16:17
1331696	4tehlulz.biz	159	https://github.com/technicalpickles/4tehlulz.biz	\N	Ruby	1	0	\N	1	2011-02-05 13:25:35	2020-05-20 15:19:06	2011-02-05 13:26:52
142273	ack.vim	159	https://github.com/technicalpickles/ack.vim	Vim plugin for the Perl module / CLI script 'ack'	VimL	1	0	\N	2	2009-03-03 17:32:16	2019-08-13 11:06:06	2009-03-03 17:47:29
255995763	acnh	159	https://github.com/technicalpickles/acnh	🌱Tracking progress + info in Animal Crossing: New Horizons!	\N	0	0	\N	0	2020-04-15 14:54:29	2020-04-15 14:54:31	2020-04-15 16:38:53
10427434	adopt-a-garden	159	https://github.com/technicalpickles/adopt-a-garden	Adopt a Garden, in Savannah, GA	Ruby	1	0	\N	4	2013-06-01 16:41:33	2020-05-29 09:56:29	2013-06-04 21:10:58
171780764	ale	159	https://github.com/technicalpickles/ale	Asynchronous linting/fixing for Vim and Language Server Protocol (LSP) integration	Vim script	0	0	\N	1	2019-02-20 22:51:26	2020-06-13 17:13:15	2019-02-20 23:05:53
130613	amazon_associate	159	https://github.com/technicalpickles/amazon_associate	Amazon Associates API Interface using hpricot	Ruby	1	0	\N	3	2009-02-17 02:11:50	2019-08-13 11:01:26	2009-02-01 19:53:05
324	ambitious-sphinx	159	https://github.com/technicalpickles/ambitious-sphinx	Ambition adapter for Sphinx	Ruby	2	0	\N	13	2008-02-07 03:38:41	2019-08-13 10:21:21	2008-03-26 16:12:32
2544339	appraisal	159	https://github.com/technicalpickles/appraisal	Find out what your Ruby gems are worth. 	Ruby	2	0	\N	2	2011-10-09 17:34:42	2016-09-04 11:21:08	2011-10-09 17:43:31
290593	authlogic_facebook_connect	159	https://github.com/technicalpickles/authlogic_facebook_connect	Extension of the Authlogic library to add Facebook Connect support built upon the excellent facebooker gem	Ruby	1	0	\N	0	2009-08-28 02:07:52	2012-12-12 22:52:06	2009-07-15 22:13:47
382049	autochronic	159	https://github.com/technicalpickles/autochronic	bringing da chronic to your rails models	Ruby	1	0	\N	1	2009-11-22 22:48:49	2016-12-15 07:22:28	2008-04-17 00:30:31
32710284	BabyParse	159	https://github.com/technicalpickles/BabyParse	BabyParse is a fast, reliable CSV parser based on PapaParse (http://PapaParse.com)	JavaScript	0	0	\N	0	2015-03-23 01:04:07	2015-03-23 01:04:07	2015-03-20 15:40:38
185623	bcb4-attendees	159	https://github.com/technicalpickles/bcb4-attendees	TODO	Ruby	1	0	\N	2	2009-04-25 17:52:48	2019-08-13 11:21:23	2009-04-25 17:55:24
27772158	bento	159	https://github.com/technicalpickles/bento	Modularized Packer definitions for building Vagrant baseboxes	Shell	0	0	\N	0	2014-12-09 13:11:01	2017-05-25 11:51:50	2014-12-10 14:03:36
371271	blueprint-layout	159	https://github.com/technicalpickles/blueprint-layout	Rails helpers to generate Blueprint CSS-based structures	Ruby	1	0	\N	2	2009-11-13 04:52:48	2016-09-04 11:47:37	2009-11-13 04:53:20
2692586	bootstrap-generators	159	https://github.com/technicalpickles/bootstrap-generators	Bootstrap-generators provides Twitter Bootstrap generators for Rails 3	Ruby	1	0	\N	2	2011-11-02 01:05:14	2017-06-05 15:13:20	2011-11-02 01:06:25
150265	bootstrapper	159	https://github.com/technicalpickles/bootstrapper	A Rails plugin to assist in bootstrapping and seeding your database.	Ruby	1	0	\N	2	2009-03-13 14:31:28	2019-08-13 11:09:09	2009-03-13 15:42:09
51893	bostonrb	159	https://github.com/technicalpickles/bostonrb	Website for bostonrb.org	Ruby	1	0	\N	3	2008-09-12 01:43:12	2019-08-13 10:34:56	2008-10-12 02:38:50
82620173	botkit-helper-slack	159	https://github.com/technicalpickles/botkit-helper-slack	:loudspeaker: Functions for helping your Slack bot get its point across. 	JavaScript	0	0	\N	0	2017-02-20 22:10:30	2018-08-17 21:17:29	2017-02-28 01:19:19
31511236	bridge_troll	159	https://github.com/technicalpickles/bridge_troll	Event management system for RailsBridge	Ruby	0	0	\N	0	2015-03-01 18:21:25	2015-03-01 18:21:27	2015-03-02 10:55:02
10589753	brigade	159	https://github.com/technicalpickles/brigade	Brigade Platform	Ruby	0	0	\N	0	2013-06-09 18:51:58	2013-06-22 16:30:25	2013-06-22 16:30:25
128482	bringing-vim-to-the-people	159	https://github.com/technicalpickles/bringing-vim-to-the-people	An lo, on the fourth day he did step down from the mountain, and with him VIM did follow . . . .	VimL	1	0	\N	2	2009-02-13 19:46:30	2019-08-13 11:00:48	2009-02-25 19:57:34
517110	bundler	159	https://github.com/technicalpickles/bundler	Gemfiles are fun	Ruby	1	0	\N	2	2010-02-13 22:39:20	2020-01-09 22:11:19	2010-02-18 20:49:32
148955	calais	159	https://github.com/technicalpickles/calais	A Ruby interface to the Open Calais API (http://opencalais.com)	Ruby	1	0	\N	3	2009-03-12 01:46:27	2019-08-13 11:08:40	2008-12-19 05:41:15
6597582	call_for_proposals_2013	159	https://github.com/technicalpickles/call_for_proposals_2013	2013 conference call for proposals	\N	0	0	\N	0	2012-11-08 12:34:51	2013-01-12 23:16:18	2012-11-08 12:41:56
164536	can_flag	159	https://github.com/technicalpickles/can_flag	flag content as inappropriate	Ruby	1	0	\N	3	2009-03-31 17:41:24	2019-08-13 11:14:06	2009-03-31 17:45:10
1520692	capistrano	159	https://github.com/technicalpickles/capistrano	Remote multi-server automation tool	Ruby	1	0	\N	1	2011-03-24 09:23:01	2016-12-15 07:22:32	2011-03-24 09:30:18
2610703	capistrano-benchmark	159	https://github.com/technicalpickles/capistrano-benchmark	Benchmarking for capistrano tasks	Ruby	5	1	\N	8	2011-10-20 00:45:56	2017-05-13 18:35:18	2013-05-16 23:11:46
845204	capistrano-campfire	159	https://github.com/technicalpickles/capistrano-campfire	A tiny shim for using campfire from capistrano	Ruby	6	1	\N	20	2010-08-17 22:13:25	2016-10-19 01:30:03	2015-06-12 13:00:26
716685	capistrano-gitflow	159	https://github.com/technicalpickles/capistrano-gitflow	Capistrano recipe for a deployment workflow based on git tags	Ruby	22	0	\N	104	2010-06-11 20:51:18	2020-09-28 10:29:06	2017-08-17 03:42:31
1332327	capistrano-mountaintop	159	https://github.com/technicalpickles/capistrano-mountaintop	Easily announce capistrano deploys to a Campfire room	Ruby	2	0	\N	10	2011-02-05 17:32:09	2017-05-22 22:58:07	2012-12-10 02:42:32
24823376	au-revoir-utm	160	https://github.com/halbtuerke/au-revoir-utm	Removes crappy utm_ tracking stuff	JavaScript	0	0	\N	0	2014-10-05 15:55:04	2014-10-05 16:07:06	2014-10-05 16:15:05
130510358	Battery-Time-Remaining	160	https://github.com/halbtuerke/Battery-Time-Remaining	Show battery time remaining in Mac OS X 10.8+ Mountain Lion and Mavericks	Objective-C	0	0	\N	0	2018-04-21 17:39:04	2018-04-21 17:39:06	2016-11-20 03:00:52
4816919	Buffet.vim	160	https://github.com/halbtuerke/Buffet.vim	A vimplugin for switching and managing buffer lists	VimL	0	0	\N	1	2012-06-28 01:58:04	2013-01-10 18:53:13	2012-06-28 01:58:51
49332752	cinematic	160	https://github.com/halbtuerke/cinematic	A better way to organize your local movies.	HTML	0	0	\N	0	2016-01-09 14:55:08	2016-01-09 14:55:10	2016-01-09 14:55:46
475108	clyppan	160	https://github.com/halbtuerke/clyppan	Free and Open Source clipboard history application for Mac OS X that's always at your fingertips.	Objective-C	3	1	\N	20	2010-01-16 15:25:50	2020-07-07 14:48:13	2016-10-02 04:20:53
11399651	coin-rb	160	https://github.com/halbtuerke/coin-rb	\N	Ruby	0	0	\N	0	2013-07-14 04:12:25	2013-07-16 09:45:39	2013-07-14 15:25:25
475962	collections	160	https://github.com/halbtuerke/collections	Collection of different Objective-C classes.	Objective-C	1	0	\N	1	2010-01-17 09:00:33	2012-12-13 19:58:54	2010-01-17 09:01:12
10799568	colourco.de	160	https://github.com/halbtuerke/colourco.de	Pick colours based on hsl. Scheme-mode with monochromatic, analogic, complement, triad and quad colours.	CoffeeScript	0	0	\N	0	2013-06-19 13:42:42	2013-06-19 13:42:42	2013-06-12 15:39:02
30106149	company-quickhelp	160	https://github.com/halbtuerke/company-quickhelp	Adds documentation popup to completion candidates	Emacs Lisp	0	0	\N	0	2015-01-31 05:45:26	2019-12-10 12:45:05	2015-01-31 05:59:04
43951995	creevey	160	https://github.com/halbtuerke/creevey	Phoenix Slides	C	0	0	\N	0	2015-10-09 08:42:32	2015-10-09 08:42:34	2015-10-09 08:43:18
32883208	DeDRM_tools	160	https://github.com/halbtuerke/DeDRM_tools	DeDRM tools for ebooks	Python	0	0	\N	0	2015-03-25 15:29:45	2015-03-25 15:29:46	2015-03-25 04:32:28
15788664	design-for-developers-starter-kit	160	https://github.com/halbtuerke/design-for-developers-starter-kit	A starter project for design for developer students	CSS	0	0	\N	0	2014-01-10 02:55:48	2014-01-10 02:55:48	2013-11-08 17:18:41
40788203	dojo_rules	160	https://github.com/halbtuerke/dojo_rules	\N	Ruby	0	0	\N	0	2015-08-15 19:13:09	2015-08-15 19:13:10	2015-08-15 19:25:37
155753	dragandmove	160	https://github.com/halbtuerke/dragandmove	Just playing around with Cocoa	Objective-C	0	0	\N	3	2009-03-21 11:32:06	2019-08-13 11:11:06	2009-03-21 11:32:37
42036025	emacs-evil-bootstrap	160	https://github.com/halbtuerke/emacs-evil-bootstrap	the quickest way to trying out vim in emacs	Emacs Lisp	0	0	\N	0	2015-09-07 03:46:11	2015-09-07 03:46:12	2013-09-18 17:24:28
46722620	encourage-mode.el	160	https://github.com/halbtuerke/encourage-mode.el	Some encouragement is always nice.	Emacs Lisp	2	0	\N	13	2015-11-23 11:40:39	2020-09-22 16:17:48	2015-12-07 13:00:14
44654919	evil-mc	160	https://github.com/halbtuerke/evil-mc	Multiple cursors implementation for evil-mode	Emacs Lisp	0	0	\N	0	2015-10-21 03:37:16	2015-10-21 03:37:17	2015-10-21 05:47:25
34118672	fluxby	160	https://github.com/halbtuerke/fluxby	\N	\N	0	1	\N	2	2015-04-17 10:38:33	2015-04-17 10:39:29	2015-04-17 10:38:33
45423389	github-for-developers-7	160	https://github.com/halbtuerke/github-for-developers-7	\N	\N	0	5	\N	0	2015-11-02 19:30:49	2015-11-02 19:30:49	2015-11-02 19:30:53
22877709	halbtuerke.github.io	160	https://github.com/halbtuerke/halbtuerke.github.io	Build a Jekyll blog in minutes, without touching the command line.	CSS	0	0	\N	0	2014-08-12 10:12:05	2018-05-23 12:35:59	2014-08-12 10:29:10
47987946	helm	160	https://github.com/halbtuerke/helm	Emacs incremental completion and selection narrowing framework	Emacs Lisp	0	0	\N	0	2015-12-14 14:45:00	2015-12-14 14:45:01	2015-12-14 15:01:09
5962220	homebrew	160	https://github.com/halbtuerke/homebrew	The missing package manager for OS X.	Ruby	0	0	\N	0	2012-09-26 04:24:09	2013-01-12 08:21:08	2012-09-26 02:16:36
15613189	hosts	160	https://github.com/halbtuerke/hosts	Extending and consolidating hosts files from a variety of sources like mvps.org, someonewhocares.org, and potentially others.	Python	0	0	\N	0	2014-01-03 13:57:29	2014-01-03 13:57:29	2013-11-12 12:37:40
224569	iCutMyPorn	160	https://github.com/halbtuerke/iCutMyPorn	Extract a portion of a video	Objective-C	2	0	\N	5	2009-06-11 13:12:49	2017-05-18 00:30:41	2010-02-11 09:05:29
11302626	ideavim	160	https://github.com/halbtuerke/ideavim	Vim emulation plug-in for IDEs based on the IntelliJ platform.	Java	0	0	\N	0	2013-07-10 01:46:43	2014-08-05 12:31:32	2014-08-05 12:31:32
10296582	jrnl	160	https://github.com/halbtuerke/jrnl	A simple command line journal application that stores your journal in a plain text file.	Python	0	0	\N	0	2013-05-26 07:41:33	2019-07-03 14:41:31	2013-05-26 07:47:26
10899360	keyboard-maestro-omnifocus-functions	160	https://github.com/halbtuerke/keyboard-maestro-omnifocus-functions	Keyboard Maestro Macros that return information about a selected OmniFocus Task.	\N	1	0	\N	0	2013-06-24 02:18:30	2014-08-04 12:37:47	2013-06-07 12:43:30
10899345	keyboard-maestro_plugins-omnifocus_actions	160	https://github.com/halbtuerke/keyboard-maestro_plugins-omnifocus_actions	Keyboard Maestro Plugins of my OmniFocus functions	\N	0	0	\N	1	2013-06-24 02:16:52	2020-07-12 14:26:00	2013-06-07 12:32:39
4594488	LaTeX-Box	160	https://github.com/halbtuerke/LaTeX-Box	Lightweight Toolbox for LaTeX - New Official repository	VimL	0	0	\N	1	2012-06-08 03:50:30	2013-01-09 12:00:34	2012-06-08 03:51:06
11953700	madeofcode.vim	160	https://github.com/halbtuerke/madeofcode.vim	Pathogen compatible version of https://gist.github.com/joshmattvander/1184058	VimL	0	0	\N	0	2013-08-07 12:42:00	2013-08-07 12:44:21	2013-08-07 12:44:18
670347	abingo	161	https://github.com/ryanb/abingo	Fork of A/Bingo plugin for Rails.	Ruby	18	0	\N	54	2010-05-17 00:44:10	2020-12-23 18:30:40	2010-05-17 01:19:37
30502	acts-as-list	161	https://github.com/ryanb/acts-as-list	NOT MAINTAINED. Gem version of acts_as_list Rails plugin.	Ruby	12	3	\N	65	2008-07-02 02:26:19	2020-11-08 22:24:32	2008-07-21 20:23:14
64947	admiteer	161	https://github.com/ryanb/admiteer	Rails Rumble 2007 project by Jack Canty, Kelli Shaver, and Ryan Bates	\N	5	0	\N	16	2008-10-19 03:22:47	2020-01-08 22:12:25	2008-10-19 03:23:32
33328	association-freezer	161	https://github.com/ryanb/association-freezer	Freeze a belongs_to association in Active Record.	Ruby	3	0	\N	17	2008-07-11 13:47:36	2020-01-08 22:12:30	2008-08-29 18:30:20
145485	blog-screencast	161	https://github.com/ryanb/blog-screencast	Example blog application built in the offical 15 minute Rails screencast.	Ruby	1	0	\N	10	2009-03-07 19:21:04	2020-01-08 22:12:19	2009-03-08 01:43:15
279342972	bookmarklets	161	https://github.com/ryanb/bookmarklets	\N	JavaScript	0	0	\N	0	2020-07-13 12:36:11	2020-07-24 16:52:40	2020-07-24 16:52:38
246357732	bootstrap-glyphicons	161	https://github.com/ryanb/bootstrap-glyphicons	bootstrap glyphicons	\N	0	0	\N	0	2020-03-10 13:54:37	2020-03-10 13:54:38	2013-06-28 04:35:29
375388	cancan	161	https://github.com/ryanb/cancan	Authorization Gem for Ruby on Rails.	Ruby	819	246	\N	6316	2009-11-16 23:04:45	2021-01-30 05:28:46	2019-05-31 00:22:48
478179	cocoa-web-app-example	161	https://github.com/ryanb/cocoa-web-app-example	A Cocoa application to demonstrate the interaction between Objective-C and JavaScript in a WebView.	Objective-C	15	1	\N	95	2010-01-18 21:13:08	2020-12-16 18:13:30	2010-01-19 16:47:47
35299	complex-form-examples	161	https://github.com/ryanb/complex-form-examples	Various ways to handle multi-model forms in Rails.	Ruby	119	6	\N	306	2008-07-18 18:11:39	2020-07-26 06:54:44	2020-02-29 05:33:28
57540	daemon_generator	161	https://github.com/ryanb/daemon_generator	A plugin for creating psuedo-scheduled jobs in Ruby on Rails.	Ruby	2	0	\N	7	2008-09-29 11:21:22	2020-04-03 04:54:58	2008-09-29 11:27:45
886551	dailystamp	161	https://github.com/ryanb/dailystamp	Source code for my Rails Rumble 2009 submission	Ruby	4	0	\N	22	2010-09-03 17:16:56	2020-01-08 22:10:52	2010-12-07 23:44:32
27172	dotfiles	161	https://github.com/ryanb/dotfiles	config files for zsh, bash, completions, gem, git, irb, rails	VimL	855	7	\N	2184	2008-06-20 19:07:15	2021-01-30 05:35:08	2019-11-19 17:05:37
38472053	elixir-lang.github.com	161	https://github.com/ryanb/elixir-lang.github.com	Website for Elixir	CSS	0	0	\N	1	2015-07-03 01:35:14	2020-01-08 22:10:08	2015-07-03 01:38:19
766996	enlighten	161	https://github.com/ryanb/enlighten	Interactive ruby debugger in the browser.	Ruby	4	0	\N	41	2010-07-09 21:02:11	2020-01-08 22:10:46	2011-07-25 16:05:23
14574	exception_logger	161	https://github.com/ryanb/exception_logger	Don't use this fork, instead use the original by defunkt as that has these changes merged in.	Ruby	3	0	\N	20	2008-05-05 02:28:23	2020-01-08 22:12:44	2008-05-05 02:37:09
1003096	govsgo	161	https://github.com/ryanb/govsgo	Rails 3 app for playing the board game Go online.	Ruby	24	28	\N	141	2010-10-18 23:06:34	2020-05-15 22:28:22	2020-11-11 01:31:19
504711	importex	161	https://github.com/ryanb/importex	Import an Excel file using Ruby.	Ruby	21	2	\N	89	2010-02-05 21:49:35	2020-10-30 09:43:31	2010-02-08 15:50:19
2344621	letter_opener	161	https://github.com/ryanb/letter_opener	Preview mail in the browser instead of sending.	Ruby	220	2	\N	3231	2011-09-07 18:17:22	2021-01-25 18:45:23	2021-01-05 15:34:11
627607	maestro	161	https://github.com/ryanb/maestro	Piano exercise game written in MacRuby.	Ruby	1	0	\N	10	2010-04-25 02:20:29	2020-01-08 22:10:53	2011-01-25 05:54:41
7043791	mustard	161	https://github.com/ryanb/mustard	Simple "must" expectations for tests and specs in Ruby.	Ruby	7	1	\N	146	2012-12-06 20:05:40	2020-01-08 22:10:25	2012-12-06 22:11:19
7044707	musts	161	https://github.com/ryanb/musts	Renamed to mustard: https://github.com/ryanb/mustard	\N	0	0	\N	1	2012-12-06 21:21:54	2020-01-08 22:10:26	2012-12-06 21:24:13
65175	myideadrawer	161	https://github.com/ryanb/myideadrawer	Rails Rumble 2008 entry by Ryan Bates and Kelli Shaver	Ruby	4	1	\N	12	2008-10-19 22:19:41	2020-01-08 22:12:23	2008-10-19 21:39:34
468501	nested_form	161	https://github.com/ryanb/nested_form	Rails plugin to conveniently handle multiple models in a single form.	Ruby	500	85	\N	1804	2010-01-12 04:57:26	2021-01-06 18:23:48	2020-12-01 14:01:34
14990	nifty-generators	161	https://github.com/ryanb/nifty-generators	A collection of useful Rails generator scripts.	Ruby	292	64	\N	2003	2008-05-06 15:19:19	2021-01-18 21:39:16	2012-10-16 14:01:23
46728	populator	161	https://github.com/ryanb/populator	Mass populate an Active Record database.	Ruby	50	13	\N	395	2008-08-27 15:35:15	2020-11-27 21:56:05	2017-11-22 18:03:26
1568579	private_pub	161	https://github.com/ryanb/private_pub	Handle pub/sub messaging through private channels in Rails using Faye.	Ruby	233	72	\N	874	2011-04-04 16:03:51	2020-11-22 18:16:20	2016-08-15 06:03:35
1886821	rails	161	https://github.com/ryanb/rails	Ruby on Rails	Ruby	1	0	\N	7	2011-06-12 22:27:30	2020-01-08 22:10:48	2011-06-15 15:17:19
124053	rails-templates	161	https://github.com/ryanb/rails-templates	Template scripts for creating new rails applications.	Ruby	33	0	\N	134	2009-02-07 21:14:02	2020-10-15 10:25:18	2009-11-02 05:16:27
15570	railscasts	161	https://github.com/ryanb/railscasts	railscasts.com in open source (outdated).	Ruby	180	31	\N	757	2008-05-09 01:39:42	2021-01-28 06:38:22	2021-01-11 16:25:40
512671	activerecord-sqlserver-adapter	162	https://github.com/cnix/activerecord-sqlserver-adapter	Fork from original SVN - incorporates improvements from the other github forks	Ruby	1	0	\N	1	2010-02-11 03:37:21	2012-12-13 21:08:00	2008-09-25 11:48:27
607399	aim_status_helper	162	https://github.com/cnix/aim_status_helper	Rails plugin that will display a user's AIM status	Ruby	1	0	\N	1	2010-04-12 18:54:26	2012-12-14 01:48:59	2010-04-12 21:57:26
93726	cnix.github.com	162	https://github.com/cnix/cnix.github.com	\N	\N	0	0	\N	2	2008-12-19 11:35:45	2019-08-13 10:48:53	2011-02-19 07:24:14
120703871	derp	162	https://github.com/cnix/derp	\N	Ruby	0	0	\N	0	2018-02-08 01:10:57	2018-02-08 01:16:12	2018-02-08 01:16:35
1373114	dotfiles	162	https://github.com/cnix/dotfiles	\N	\N	0	0	\N	1	2011-02-16 07:03:13	2014-05-12 03:03:21	2011-11-30 17:33:30
6287	freelancer	162	https://github.com/cnix/freelancer	For your freelancing yo!	JavaScript	0	0	\N	3	2008-03-29 17:32:09	2019-08-13 10:22:27	2008-12-17 16:53:21
527316	github_textmate_theme	162	https://github.com/cnix/github_textmate_theme	Github Theme for Textmate 	\N	1	0	\N	1	2010-02-20 09:22:36	2012-12-13 21:36:01	2008-10-10 17:31:02
10263	git_local	162	https://github.com/cnix/git_local	probably a waste of time	JavaScript	0	0	\N	6	2008-04-16 07:56:42	2019-08-13 10:23:07	2009-01-28 04:35:20
2901610	handy_capper	162	https://github.com/cnix/handy_capper	Ruby library for applying common sailboat racing scoring systems to race results	Ruby	0	0	\N	1	2011-12-02 19:26:04	2014-01-18 04:24:03	2012-05-24 18:26:55
251332	heroku-docs	162	https://github.com/cnix/heroku-docs	Documentation for Heroku, in the form of a Sinatra app serving markdown text files.	Ruby	1	0	\N	1	2009-07-14 19:47:20	2014-02-05 22:48:06	2009-05-14 03:39:40
4747418	hubot	162	https://github.com/cnix/hubot	A customizable, kegerator-powered life embetterment robot.	CoffeeScript	0	0	\N	1	2012-06-22 01:02:08	2017-06-12 12:25:24	2012-06-18 03:09:10
1580023	ismaddoxinsfyet	162	https://github.com/cnix/ismaddoxinsfyet	where's our scro?	Ruby	0	0	\N	1	2011-04-06 21:40:35	2018-09-12 17:35:51	2011-05-29 04:41:31
760041	magick-installer	162	https://github.com/cnix/magick-installer	ImageMagick installer script because macports sucks	Shell	1	0	\N	1	2010-07-06 14:03:31	2012-12-14 18:11:04	2010-12-08 18:26:08
20780505	MNBB	162	https://github.com/cnix/MNBB	Mariners NMEA Black Box	JavaScript	0	0	\N	0	2014-06-12 16:40:04	2014-06-12 17:40:21	2014-06-12 17:30:55
14063402	nesta	162	https://github.com/cnix/nesta	A lightweight CMS, implemented in Sinatra.	Ruby	0	0	\N	0	2013-11-02 06:36:31	2013-11-02 06:36:31	2013-10-25 14:21:28
688934	nifty-generators	162	https://github.com/cnix/nifty-generators	A collection of useful Rails generator scripts.	Ruby	1	0	\N	1	2010-05-27 06:10:49	2012-12-14 15:37:23	2010-05-20 20:24:33
2653418	oauth-plugin	162	https://github.com/cnix/oauth-plugin	Rails plugin for OAuth	Ruby	0	0	\N	1	2011-10-26 17:33:39	2013-01-04 10:36:20	2011-10-26 17:46:08
4149103	rails_upgrade_guide	170	https://github.com/rbazinet/rails_upgrade_guide	\N	Ruby	0	0	\N	0	2012-04-26 12:28:35	2013-11-06 12:26:37	2011-06-18 13:52:43
712377	photo_blog	162	https://github.com/cnix/photo_blog	The app for showcasing my attempted 365 photo project	JavaScript	0	0	\N	1	2010-06-09 17:51:22	2014-01-18 04:24:04	2010-06-09 17:56:36
1627346	rdiorb	162	https://github.com/cnix/rdiorb	Ruby implementation of the rd.io API	Ruby	0	0	\N	1	2011-04-17 15:58:34	2013-01-01 20:09:47	2011-04-13 00:24:51
2567559	ruby-jibeset	162	https://github.com/cnix/ruby-jibeset	Ruby API Wrapper for Jibeset 	Ruby	0	1	\N	1	2011-10-13 03:12:42	2013-10-10 12:32:46	2012-05-26 09:41:33
250349	search_results_comparison	162	https://github.com/cnix/search_results_comparison	demo for dolores labs	Ruby	0	0	\N	1	2009-07-13 18:08:17	2013-10-17 14:00:52	2009-07-13 20:17:58
1372941	vimEnv	162	https://github.com/cnix/vimEnv	vim setup	VimL	0	0	\N	2	2011-02-16 05:44:09	2017-03-17 12:24:38	2013-01-14 12:52:41
71640033	advocate	163	https://github.com/tpitale/advocate	Advocate: Concierge to Help Prevent Homelessness	JavaScript	0	6	\N	0	2016-10-22 11:13:33	2020-09-18 13:22:41	2020-09-18 13:14:49
71640185	advocate-bridge	163	https://github.com/tpitale/advocate-bridge	GH6 Project Bridge	JavaScript	0	4	\N	0	2016-10-22 11:16:27	2020-09-18 13:23:11	2019-09-03 15:23:11
75358952	advocate-provision	163	https://github.com/tpitale/advocate-provision	Docker Compose/Swarm Provisioning for Advocate & Advocate Bridge	Makefile	1	1	\N	0	2016-12-02 01:58:30	2020-09-18 13:26:08	2017-04-25 15:35:06
702898	Analytics-Pusher	163	https://github.com/tpitale/Analytics-Pusher	Push analytics forward to next page rendered, helpers for UJS virtual pageview/event tracking with jQuery	Ruby	0	0	\N	2	2010-06-04 05:22:16	2019-11-01 01:14:14	2010-06-09 11:31:13
10748131	brewmaster	163	https://github.com/tpitale/brewmaster	Configuration driven installation and updating of homebrew/brew-casks/rubies	Ruby	0	0	\N	0	2013-06-17 18:47:48	2019-11-01 01:17:26	2016-11-26 21:08:42
144346276	coap_ex	163	https://github.com/tpitale/coap_ex	CoAP Server/Client with support for Phoenix	Elixir	2	27	\N	12	2018-08-10 22:35:45	2021-01-06 07:44:53	2020-12-31 12:48:12
569191	constant_cache	163	https://github.com/tpitale/constant_cache	Cache Constants	Ruby	7	3	\N	9	2010-03-18 21:54:29	2020-09-18 13:25:53	2016-02-05 14:26:24
183075081	convoy	163	https://github.com/tpitale/convoy	Elixir library to handle common Kinesis behaviors	Elixir	0	2	\N	3	2019-04-23 15:36:43	2020-09-23 15:42:54	2020-09-23 15:42:51
2388259	dispatch	163	https://github.com/tpitale/dispatch	Simplest Multi-project, Capistrano based 1-button deploy	Ruby	0	0	\N	0	2011-09-14 17:44:32	2019-11-01 01:14:00	2011-10-02 22:29:26
238316355	elixir_agent	163	https://github.com/tpitale/elixir_agent	New Relic's Open Source Elixir Agent	\N	0	0	\N	0	2020-02-04 19:03:26	2020-02-04 19:03:28	2020-02-05 14:25:37
55278628	form_bridge	163	https://github.com/tpitale/form_bridge	Simple gem bridging form submissions to JSON	Ruby	0	1	\N	1	2016-04-02 02:02:12	2016-08-25 02:04:40	2016-04-04 00:11:04
12657144	growingdevs.github.io	163	https://github.com/tpitale/growingdevs.github.io	growingdevs.com	CSS	0	0	\N	0	2013-09-06 21:05:28	2018-07-31 01:10:50	2018-07-31 01:10:48
13112248	helper	163	https://github.com/tpitale/helper	Helper is a bot built to be helpful.	Ruby	1	0	\N	0	2013-09-26 00:40:37	2019-11-01 01:18:02	2013-10-04 13:16:12
119717	information_schema	163	https://github.com/tpitale/information_schema	DataMapper Classes to Access information_schema.* in PostgreSQL 8.3	Ruby	0	0	\N	1	2009-02-02 06:10:37	2019-11-01 01:14:49	2009-02-23 16:59:37
2956613	legato	163	https://github.com/tpitale/legato	Google Analytics Reporting API Client for Ruby	Ruby	51	11	\N	408	2011-12-11 01:37:26	2020-08-30 18:17:16	2019-02-11 14:40:42
68989001	legato-ex	163	https://github.com/tpitale/legato-ex	Google Analytics API v4 in Elixir	Elixir	3	1	\N	13	2016-09-23 01:31:52	2020-08-19 04:47:38	2017-07-26 21:06:27
7790606	mail_room	163	https://github.com/tpitale/mail_room	Forward mail from gmail IMAP to a callback URL or job worker, simply.	Ruby	31	4	\N	153	2013-01-24 02:38:48	2020-10-19 11:10:11	2020-10-19 11:10:08
263972	mongolytics	163	https://github.com/tpitale/mongolytics	DO NOT USE! Use MongoDB and it's speed to do basic analytics tracking in Rails	Ruby	3	0	\N	80	2009-07-29 18:02:47	2019-11-01 01:14:26	2009-08-29 20:47:32
191249	net-simple	163	https://github.com/tpitale/net-simple	Simple wrapper around net-ssh and net-scp	Ruby	0	0	\N	2	2009-05-02 23:54:41	2019-11-01 01:15:05	2009-05-03 00:21:14
3857692	net-ssh-gateway	163	https://github.com/tpitale/net-ssh-gateway	A gateway class for tunneling connections via SSH over a forwarded port	Ruby	0	0	\N	1	2012-03-28 14:36:57	2019-11-01 01:15:39	2016-03-24 14:05:40
4221129	pulse	163	https://github.com/tpitale/pulse	n/a	Ruby	0	0	\N	0	2012-05-04 00:03:24	2019-11-01 01:13:50	2012-05-04 10:25:58
697836	rc10-code-samples	163	https://github.com/tpitale/rc10-code-samples	Code Samples	Ruby	0	0	\N	1	2010-06-01 16:28:49	2019-11-01 01:18:59	2010-06-10 09:57:58
17568205	refresh-jekyll	163	https://github.com/tpitale/refresh-jekyll	Jekyll repo for my Refresh presentation	CSS	0	0	\N	0	2014-03-09 13:24:28	2020-09-18 13:25:04	2014-04-17 20:57:53
190044450	rihanna	163	https://github.com/tpitale/rihanna	Rihanna is a high performance postgres-backed job queue for Elixir	Elixir	0	0	\N	0	2019-06-03 13:43:09	2020-12-23 23:38:48	2020-12-23 23:38:46
4375231	simplest_auth	163	https://github.com/tpitale/simplest_auth	Simple implementation of authentication for Rails	Ruby	0	0	\N	0	2012-05-18 23:34:41	2018-06-02 12:26:09	2018-06-02 12:26:14
7996846	simplest_view	163	https://github.com/tpitale/simplest_view	SimplestView gives us the power to split Rails Views out from our Templates	Ruby	1	0	\N	41	2013-02-03 19:23:13	2020-04-14 16:47:21	2015-11-03 13:02:32
11864512	staccato	163	https://github.com/tpitale/staccato	Ruby library to perform server-side tracking into the official Google Analytics Measurement Protocol	Ruby	33	3	\N	377	2013-08-03 11:47:50	2021-01-11 07:31:20	2020-11-27 03:03:08
139920171	staccato-ex	163	https://github.com/tpitale/staccato-ex	Google Analytics Collection API in Elixir	Elixir	3	0	\N	3	2018-07-05 22:52:36	2018-10-25 17:38:36	2018-08-17 12:35:48
21073541	staccato-proxy	163	https://github.com/tpitale/staccato-proxy	Proxy UDP to Google Analytics Collection API	Ruby	0	5	\N	1	2014-06-21 13:46:57	2016-04-29 16:40:45	2016-04-29 16:41:35
42217645	staccato-proxy-elixir	163	https://github.com/tpitale/staccato-proxy-elixir	Elixir version of staccato-proxy	Elixir	0	0	\N	1	2015-09-09 23:42:52	2016-03-28 10:36:14	2016-09-06 03:44:53
11709451	artfully_ose	164	https://github.com/cdcarter/artfully_ose	Open-source Rails engine that powers Artful.ly and Artfully Open Source Edition.	Ruby	0	0	\N	0	2013-07-27 15:52:21	2013-07-27 15:56:06	2013-07-27 15:56:05
334	backpacking	164	https://github.com/cdcarter/backpacking	An Io web framework of sorts	Io	5	0	\N	56	2008-02-08 01:55:18	2020-01-30 04:02:21	2015-11-21 05:33:09
11392998	bitstarter	164	https://github.com/cdcarter/bitstarter	\N	JavaScript	0	0	\N	0	2013-07-13 16:22:33	2013-07-13 17:47:17	2013-07-13 17:47:16
4542012	bootstrap	164	https://github.com/cdcarter/bootstrap	HTML, CSS, and JS toolkit from Twitter	JavaScript	0	0	\N	1	2012-06-03 21:59:52	2013-10-09 09:49:26	2012-06-03 22:01:44
43016485	bootstrap-visualforce-101	164	https://github.com/cdcarter/bootstrap-visualforce-101	\N	\N	0	0	\N	0	2015-09-23 14:34:28	2015-07-27 09:13:37	2014-03-06 14:35:45
1211725	cdcarter.github.com	164	https://github.com/cdcarter/cdcarter.github.com	\N	HTML	0	0	\N	1	2010-12-31 22:13:07	2018-04-25 13:44:42	2018-04-25 13:44:41
11242229	chicago-atlas	164	https://github.com/cdcarter/chicago-atlas	View citywide information about health trends and take action near you to improve your own health.	Ruby	0	0	\N	0	2013-07-07 20:55:00	2013-07-07 20:55:00	2013-06-27 15:25:21
7498117	chill	164	https://github.com/cdcarter/chill	chill plugs ruby code in to CouchDB	HTML	0	0	\N	0	2013-01-08 06:26:22	2017-10-27 22:30:14	2017-11-04 22:22:46
2085697	commonjs-date-formatting	164	https://github.com/cdcarter/commonjs-date-formatting	PHP style strftime date formatting for CommonJS apps.	JavaScript	0	0	\N	1	2011-07-21 18:03:31	2016-12-14 23:27:17	2010-10-26 02:08:49
106034051	cookiecutter-django	164	https://github.com/cdcarter/cookiecutter-django	Cookiecutter Django is a framework for jumpstarting production-ready Django projects quickly.	Python	0	0	\N	0	2017-10-06 14:51:11	2017-10-06 14:51:13	2017-10-05 18:27:12
158487438	cookiecutter-django-rest	164	https://github.com/cdcarter/cookiecutter-django-rest	Build best practiced apis fast with Python3	Python	0	0	\N	0	2018-11-21 01:46:33	2018-11-21 01:46:36	2018-11-20 23:36:03
2016347	couchapp	164	https://github.com/cdcarter/couchapp	Utilities to make standalone CouchDB application development simple	Python	0	0	\N	1	2011-07-08 02:58:10	2013-11-09 17:47:17	2011-07-08 03:00:09
52166855	crowdbuilder	164	https://github.com/cdcarter/crowdbuilder	\N	Apex	0	0	\N	0	2016-02-20 15:52:41	2016-02-20 21:41:57	2016-02-21 20:07:33
49981654	CSV-GitHub-import-export	164	https://github.com/cdcarter/CSV-GitHub-import-export	Import/export GitHub issues from/to CSV files	Ruby	0	0	\N	0	2016-01-19 18:40:52	2016-01-19 18:40:53	2016-01-19 18:41:46
39534368	Cumulus	164	https://github.com/cdcarter/Cumulus	The next version of the Salesforce.com Nonprofit Starter Pack	Apex	0	0	\N	0	2015-07-22 20:02:17	2016-01-29 17:25:27	2017-08-04 14:28:41
44933433	CumulusCI	164	https://github.com/cdcarter/CumulusCI	A reusable set of build and automation scripts to facilitate a best practices based development and release process for managed package development on the Salesforce1 Platform	Python	0	0	\N	0	2015-10-25 20:42:11	2018-09-11 16:47:35	2017-03-08 17:04:06
185270198	CumulusCI-OAuth-Tool	164	https://github.com/cdcarter/CumulusCI-OAuth-Tool	A basic Flask web app to make it easy to get a refresh token to a Salesforce org from your own Connected App	Python	0	0	\N	0	2019-05-06 17:52:51	2019-05-06 17:52:53	2014-10-13 19:55:22
76415147	CumulusCI-Test	164	https://github.com/cdcarter/CumulusCI-Test	Dummy project used to test CumulusCI - CumulusCI will run this project through the whole CI flow to verify everything works	Apex	0	0	\N	0	2016-12-13 23:58:57	2018-09-11 16:58:56	2016-12-13 23:26:02
60026765	declarative-autonaming	164	https://github.com/cdcarter/declarative-autonaming	DLRS gone single object	Apex	0	0	\N	1	2016-05-30 14:13:49	2016-06-01 01:01:16	2016-06-04 16:07:54
46753398	declarative-lookup-rollup-summaries	164	https://github.com/cdcarter/declarative-lookup-rollup-summaries	Declarative Rollup Summaries for Lookups	Apex	0	0	\N	0	2015-11-23 21:03:06	2015-11-23 21:03:09	2017-04-22 19:17:56
43263540	design-system	164	https://github.com/cdcarter/design-system	Salesforce Lightning Design System	JavaScript	0	0	\N	0	2015-09-27 17:26:22	2015-09-27 17:26:25	2015-09-27 17:27:11
136389841	design-system-starter-kit	164	https://github.com/cdcarter/design-system-starter-kit	Rapid prototyping environment using the Salesforce Lightning Design System	HTML	0	0	\N	0	2018-06-06 18:50:02	2018-06-06 18:50:04	2018-05-09 20:20:32
11408368	dino	164	https://github.com/cdcarter/dino	Dino is a ruby gem that helps you bootstrap prototyping with an Arduino	Ruby	0	0	\N	0	2013-07-14 16:53:18	2013-08-01 12:28:47	2013-07-19 19:18:10
148042492	dj-request-correlation	164	https://github.com/cdcarter/dj-request-correlation	x-request-id helpers and more	Python	0	0	\N	0	2018-09-09 13:09:44	2018-09-09 20:54:28	2018-09-09 20:54:26
184929930	django-admin2	164	https://github.com/cdcarter/django-admin2	Extendable, adaptable rewrite of django.contrib.admin	Python	0	0	\N	0	2019-05-04 15:19:14	2019-05-04 15:19:17	2019-03-17 16:21:42
106059487	django-allauth	164	https://github.com/cdcarter/django-allauth	Integrated set of Django applications addressing authentication, registration, account management as well as 3rd party (social) account authentication.	Python	0	0	\N	0	2017-10-06 20:51:55	2017-10-06 20:51:57	2017-11-04 20:17:45
147783709	django-log-request-id	164	https://github.com/cdcarter/django-log-request-id	Django middleware and log filter to attach a unique ID to every log message generated as part of a request	Python	0	0	\N	0	2018-09-07 03:57:21	2018-09-07 11:32:21	2018-09-07 12:53:51
123041127	django-object-actions	164	https://github.com/cdcarter/django-object-actions	A Django app for adding object tools for models in the admin	Python	0	0	\N	0	2018-02-26 19:49:07	2018-02-26 19:49:09	2017-06-16 13:07:05
147787839	django-request-logging	164	https://github.com/cdcarter/django-request-logging	Django middleware that logs http request body.	Python	0	0	\N	0	2018-09-07 04:32:20	2018-09-07 04:32:22	2018-08-27 18:35:20
110619911	django-rest-framework	164	https://github.com/cdcarter/django-rest-framework	Web APIs for Django.	Python	0	0	\N	0	2017-11-13 22:38:37	2017-11-13 22:38:42	2017-11-13 18:21:16
944116	1-Axis-Motion-Control-Move	165	https://github.com/atduskgreg/1-Axis-Motion-Control-Move	syncing processing-controlled arduino with 3d-rendered video from After Effects	Java	0	0	\N	4	2010-09-27 21:13:59	2020-12-06 05:10:50	2010-09-29 13:45:47
1406641	3dsav	165	https://github.com/atduskgreg/3dsav	Code for 3d Sensing and Visualization class.	C++	0	0	\N	1	2011-02-24 10:15:49	2012-12-24 18:48:57	2011-02-24 10:38:35
11000935	animatedDiff	165	https://github.com/atduskgreg/animatedDiff	Processing sketch for creating an animated GIF displaying before and after changes to an image	Processing	0	0	\N	3	2013-06-27 12:43:07	2014-04-23 02:44:04	2013-06-27 16:04:46
3284037	AppropriatingNewTechnologies	165	https://github.com/atduskgreg/AppropriatingNewTechnologies	A half-semester class at ITP. 	\N	0	0	\N	3	2012-01-27 14:25:46	2016-06-21 08:15:40	2012-02-03 07:36:54
80518	archaeopteryx	165	https://github.com/atduskgreg/archaeopteryx	Ruby MIDI DJing/live-coding thing	Ruby	0	0	\N	2	2008-11-24 22:35:24	2019-08-13 10:44:13	2008-11-07 22:49:12
84770	arduino	165	https://github.com/atduskgreg/arduino	a mirror of the arduino svn repo for git users	Java	4	0	\N	10	2008-12-04 02:16:52	2019-08-13 10:45:30	2008-12-29 18:40:21
3488220	ArtOfKinectRecorder	165	https://github.com/atduskgreg/ArtOfKinectRecorder	\N	C#	1	0	\N	1	2012-02-19 18:49:25	2013-06-12 12:14:04	2012-02-19 18:46:01
1957804	atduskgreg.github.io	165	https://github.com/atduskgreg/atduskgreg.github.io	My GitHub Homepage Site Thingy	\N	0	0	\N	1	2011-06-26 20:59:02	2016-09-17 20:06:33	2011-06-26 21:00:53
14279751	atduskmusic.com	165	https://github.com/atduskgreg/atduskmusic.com	Preserved and restored band site for At Dusk	CSS	1	0	\N	1	2013-11-10 14:35:49	2014-01-10 03:00:15	2013-11-16 01:39:58
118543	attachment_fu	165	https://github.com/atduskgreg/attachment_fu	Treat an ActiveRecord model as a file attachment, storing its patch, size, content type, etc.	Ruby	0	0	\N	2	2009-01-31 02:29:15	2019-08-13 10:57:24	2009-01-31 02:48:57
1179112	augmentVideo	165	https://github.com/atduskgreg/augmentVideo	OpenFrameworks Implementation of Greg's ITP Project	C++	0	0	\N	1	2010-12-18 04:12:04	2012-12-16 01:13:54	2010-12-18 04:09:49
1681572	Barrier-Grid-Illusion-Creator	165	https://github.com/atduskgreg/Barrier-Grid-Illusion-Creator	a web app for uploading barrier grid illusions based on qwzybug's code	Ruby	0	0	\N	1	2011-04-29 13:59:57	2016-09-27 00:01:47	2011-04-29 14:05:56
490371	bike_mountain_speedometer	165	https://github.com/atduskgreg/bike_mountain_speedometer	firmware from my pcomp final	\N	2	0	\N	6	2010-01-27 03:59:05	2018-02-19 14:47:11	2010-01-29 01:19:24
2805356	Biomechanic	165	https://github.com/atduskgreg/Biomechanic	The beginnings of a biomechanics visualization tool	Java	6	0	\N	11	2011-11-18 18:32:19	2018-12-01 20:27:01	2012-05-03 16:52:37
7674091	bitly-oauth	165	https://github.com/atduskgreg/bitly-oauth	OAuth Bitly API Wrapper LIbrary	Ruby	1	0	\N	0	2013-01-17 18:53:09	2013-07-23 14:27:44	2013-01-17 18:56:11
17840810	blob-continuity-demo	165	https://github.com/atduskgreg/blob-continuity-demo	\N	Processing	0	0	\N	1	2014-03-17 16:38:42	2018-09-29 10:46:03	2014-03-17 16:39:19
189200	bloopsaphone	165	https://github.com/atduskgreg/bloopsaphone	arcade sounds and chiptunes for ruby and c	C	1	0	\N	12	2009-04-30 05:21:58	2019-08-13 11:22:34	2009-04-30 05:23:14
304397	bloopsbank	165	https://github.com/atduskgreg/bloopsbank	Library of cool sounds for Bloopsaphone	\N	1	0	\N	2	2009-09-11 16:42:42	2014-02-20 06:53:37	2009-09-11 16:43:38
304441	blu	165	https://github.com/atduskgreg/blu	parser for the .blu sound-description format for _why's bloopsaphone	Ruby	0	0	\N	2	2009-09-11 17:28:13	2014-02-22 03:45:31	2009-09-11 17:30:02
29663624	bother	165	https://github.com/atduskgreg/bother	One page framework for teaching bot-making.	JavaScript	4	0	\N	5	2015-01-22 04:02:53	2017-11-29 05:23:37	2016-09-17 20:10:02
22814237	BotScheduler	165	https://github.com/atduskgreg/BotScheduler	\N	PLpgSQL	0	0	\N	2	2014-08-10 14:17:13	2015-03-08 03:29:39	2015-09-06 20:21:56
1482872	Brat-Pack	165	https://github.com/atduskgreg/Brat-Pack	Desktop app to help students manage and deploy Sinatra apps	C++	0	0	\N	2	2011-03-15 11:06:53	2013-11-30 12:09:06	2011-05-26 16:31:14
2705606	CakeMix-Processing	165	https://github.com/atduskgreg/CakeMix-Processing	Processing Library for ITP CakeMix	Java	0	0	\N	1	2011-11-03 20:15:26	2013-01-04 11:50:35	2011-11-01 15:45:46
17815673	cancergame	165	https://github.com/atduskgreg/cancergame	\N	CSS	0	0	\N	0	2014-03-17 00:03:34	2014-03-24 17:53:39	2014-03-24 17:53:38
13234832	case-and-molly	165	https://github.com/atduskgreg/case-and-molly	Unity Game based on Neuromancer. For MIT Fall 2013: Science Fiction to Science Fabrication.	C	3	0	\N	22	2013-10-01 01:34:12	2018-08-18 01:51:27	2014-03-05 18:55:19
5705829	Channels	165	https://github.com/atduskgreg/Channels	Processing library that lets you pull out RGB, brightness, hue, and saturation channels from a PImage	Java	0	0	\N	1	2012-09-06 14:25:52	2016-07-15 09:05:48	2012-09-10 06:14:59
48865871	chartist-plugin-tooltip	165	https://github.com/atduskgreg/chartist-plugin-tooltip	Tooltip plugin for Chartist.js	JavaScript	0	0	\N	0	2015-12-31 22:30:18	2017-05-23 17:33:35	2015-12-31 22:33:59
21947570	chesscomputer	165	https://github.com/atduskgreg/chesscomputer	\N	Python	4	0	\N	6	2014-07-17 12:36:45	2020-07-02 05:45:18	2014-12-06 16:52:12
16442743	chessviz	165	https://github.com/atduskgreg/chessviz	Basic web app for visualizing the output of UCI protocol-compliant chess engines	Python	1	0	\N	1	2014-02-01 19:13:45	2014-04-04 11:48:56	2014-04-04 11:48:55
2669307	Cinemagrapher	165	https://github.com/atduskgreg/Cinemagrapher	OpenFrameworks app to create cinemagraph-style animated GIFs	C	1	0	\N	4	2011-10-29 01:44:42	2019-08-24 10:34:54	2011-10-29 18:54:20
64221	activeform	166	https://github.com/heff/activeform	Prototype form helper	JavaScript	3	0	\N	4	2008-10-17 16:18:18	2019-08-13 10:38:27	2008-10-17 16:23:03
179758262	awesome	166	https://github.com/heff/awesome	😎 Awesome lists about all kinds of interesting topics	\N	0	0	\N	2	2019-04-05 18:40:51	2019-10-29 12:25:29	2019-04-05 08:08:22
7572497	bootstrap	166	https://github.com/heff/bootstrap	Sleek, intuitive, and powerful front-end framework for faster and easier web development.	CSS	0	0	\N	0	2013-01-12 04:28:13	2014-12-14 00:11:36	2014-12-14 00:12:27
43479806	browser-apis-talk	166	https://github.com/heff/browser-apis-talk	\N	JavaScript	0	0	\N	0	2015-10-01 02:22:24	2015-10-01 02:23:53	2015-10-02 18:53:01
9333661	browserstack-cli	166	https://github.com/heff/browserstack-cli	A command line interface for the browserstack api	JavaScript	0	0	\N	0	2013-04-09 20:11:46	2013-04-16 15:44:28	2013-04-09 20:19:07
10676162	buffering	166	https://github.com/heff/buffering	"Buffering is a four-letter word" -- A presentation on web video performance	JavaScript	0	0	\N	0	2013-06-13 18:17:23	2013-11-19 13:12:10	2013-06-19 17:02:25
7580744	calcdeps.js	166	https://github.com/heff/calcdeps.js	A Node.js port of Google Closure library calcdeps.py	JavaScript	0	0	\N	0	2013-01-12 19:27:26	2013-01-14 16:31:18	2013-01-12 19:37:16
36479351	cdn	166	https://github.com/heff/cdn	The video.js CDN	JavaScript	0	0	\N	0	2015-05-28 23:58:10	2015-06-03 01:39:49	2015-09-29 14:08:18
16290078	chg	166	https://github.com/heff/chg	simple changelog/release history manager	JavaScript	5	2	\N	8	2014-01-27 17:33:22	2020-12-29 21:57:15	2019-03-13 21:03:33
179764807	chronos-project.github.io	166	https://github.com/heff/chronos-project.github.io	Static page for Chronos https://chronos-project.github.io	HTML	0	0	\N	0	2019-04-05 19:53:39	2019-04-05 19:53:42	2019-04-05 19:54:43
31436960	codeship-test	166	https://github.com/heff/codeship-test	testing more	\N	0	0	\N	0	2015-02-27 17:08:11	2015-02-27 15:46:48	2015-02-27 17:12:23
10200999	concatenate.js	166	https://github.com/heff/concatenate.js	\N	JavaScript	0	0	\N	0	2013-05-21 14:09:00	2013-05-21 14:15:42	2013-05-21 14:14:00
22498698	contrib	166	https://github.com/heff/contrib	a command-line interface for standardizing the contribution tasks between projects	\N	0	0	\N	0	2014-08-01 03:58:12	2014-07-30 23:01:36	2014-08-01 03:31:11
10372015	contribflow-test	166	https://github.com/heff/contribflow-test	Mock repo for testing contribflow	\N	0	0	\N	0	2013-05-29 21:13:12	2013-06-10 14:07:10	2013-05-30 21:47:21
7594987	contribute-md-template	166	https://github.com/heff/contribute-md-template	The template contribute.md for OSS projects	\N	0	0	\N	0	2013-01-13 21:05:09	2013-01-14 00:37:46	2012-09-27 11:50:55
22094634	contributing	166	https://github.com/heff/contributing	Contributing to Contributors Presentation	JavaScript	0	0	\N	0	2014-07-22 04:18:26	2014-07-22 04:21:02	2014-07-23 19:27:56
20978241	dash.js	166	https://github.com/heff/dash.js	A reference client implementation for the playback of MPEG DASH via Javascript and compliant browsers.	JavaScript	0	0	\N	0	2014-06-18 18:14:01	2014-06-19 18:12:48	2014-06-19 18:05:15
42135676	demuxed.com	166	https://github.com/heff/demuxed.com	Demuxed website	CSS	0	0	\N	0	2015-09-08 16:55:42	2016-05-16 20:54:55	2015-09-08 17:09:54
42749712	docs	166	https://github.com/heff/docs	\N	JavaScript	0	0	\N	0	2015-09-18 19:22:48	2015-09-18 19:22:49	2015-08-24 10:07:51
330024216	dotfiles	166	https://github.com/heff/dotfiles	Setup your Mac and sync it with your other machines.	\N	0	0	\N	0	2021-01-15 18:16:25	2021-01-15 18:16:27	2021-01-15 18:24:18
12146112	dox	166	https://github.com/heff/dox	JavaScript documentation generator for node using markdown and jsdoc	JavaScript	0	0	\N	0	2013-08-15 20:15:05	2013-09-18 07:06:30	2013-08-30 17:53:42
28252963	eme-example	166	https://github.com/heff/eme-example	\N	JavaScript	1	0	\N	0	2014-12-19 23:28:52	2014-12-22 22:59:10	2014-12-22 22:59:10
26786607	encrypted-media	166	https://github.com/heff/encrypted-media	Encrypted Media Extensions	JavaScript	0	0	\N	0	2014-11-17 23:40:22	2014-12-19 21:15:10	2014-12-19 21:28:43
36901788	font	166	https://github.com/heff/font	Icon font used for Video.js	CSS	0	0	\N	0	2015-06-04 20:46:48	2015-06-04 20:46:48	2015-06-04 21:14:42
11462357	frontend-packagers	166	https://github.com/heff/frontend-packagers	Front-End Package Manager Comparison	\N	0	0	\N	0	2013-07-16 20:05:07	2013-07-18 13:18:01	2013-07-17 15:28:14
27899534	grunt	166	https://github.com/heff/grunt	Grunt: The JavaScript Task Runner	JavaScript	0	0	\N	0	2014-12-11 23:08:37	2014-12-11 23:08:38	2014-10-13 01:22:27
12085238	hammer.js	166	https://github.com/heff/hammer.js	A javascript library for multi-touch gestures :// You can touch this	JavaScript	0	0	\N	0	2013-08-13 12:25:57	2014-07-11 09:22:15	2013-07-31 10:36:14
33745322	hexbin	166	https://github.com/heff/hexbin	community curated list of hexagon logos	HTML	0	0	\N	0	2015-04-10 15:55:32	2015-04-10 15:55:33	2015-03-31 17:16:07
93002342	hls.js	166	https://github.com/heff/hls.js	JavaScript HLS client using Media Source Extension	JavaScript	0	0	\N	0	2017-05-31 22:04:43	2017-05-31 22:04:46	2017-06-01 14:45:45
135874144	homeschoolhottie.com	166	https://github.com/heff/homeschoolhottie.com	Matt McClure - The homeschool hottie	HTML	0	0	\N	0	2018-06-03 01:43:54	2018-06-03 18:04:31	2018-06-03 18:04:29
881138	blind-date	167	https://github.com/entryway/blind-date	A git pre-commit hook for making sure you're hitched correctly	\N	0	1	\N	1	2010-09-01 21:28:24	2014-04-27 13:22:26	2010-09-17 16:05:28
2811406	entryway.github.com	167	https://github.com/entryway/entryway.github.com	entryway site	JavaScript	0	0	\N	1	2011-11-19 21:32:34	2013-01-04 14:36:05	2012-09-12 11:59:32
913378	feature-finish	167	https://github.com/entryway/feature-finish	A simple ruby script to finish a git flow feature branch quickly	\N	0	0	\N	1	2010-09-15 16:17:01	2014-04-25 06:11:44	2010-09-15 16:57:27
803518	headwater	167	https://github.com/entryway/headwater	Headwater integrates and automates many tools into one cohesive process workflow. 	JavaScript	0	0	\N	3	2010-07-28 16:22:52	2014-05-17 04:29:19	2010-10-03 12:28:51
919155	hitch	167	https://github.com/entryway/hitch	Git author attribution helper for pair programmers.	Ruby	0	0	\N	1	2010-09-17 16:06:41	2012-12-15 03:40:30	2010-09-17 17:52:05
78473	pebbles	167	https://github.com/entryway/pebbles	The entryway ecommerce engine...	Ruby	2	1	\N	3	2008-11-20 00:25:17	2019-08-13 10:43:29	2011-03-02 14:50:32
934300	pebbles_audio_files	167	https://github.com/entryway/pebbles_audio_files	adds audio files to pebbles	Ruby	0	0	\N	1	2010-09-23 16:35:49	2013-11-17 15:22:16	2010-09-27 18:14:52
1719191	actionmailer-maildir	168	https://github.com/aflatter/actionmailer-maildir	Maildir delivery method for ActionMailer	Ruby	0	0	\N	1	2011-05-08 13:40:09	2017-06-02 17:42:58	2011-05-08 13:46:07
1821441	ancestry	168	https://github.com/aflatter/ancestry	Organise ActiveRecord model into a tree structure	Ruby	1	0	\N	2	2011-05-30 09:55:56	2017-06-02 17:42:59	2011-05-30 10:21:32
1319698	backbone	168	https://github.com/aflatter/backbone	Give your JS App some Backbone with Models, Views, Collections, and Events	JavaScript	0	0	\N	1	2011-02-02 06:44:06	2017-06-02 17:42:58	2011-02-01 13:00:48
1770406	backbone-rails	168	https://github.com/aflatter/backbone-rails	Ships backbone and underscore to your Rails 3.1 application through the new asset pipeline. Rails 3.0 is supported via generators.	Ruby	21	1	\N	99	2011-05-19 05:46:30	2020-07-06 03:26:04	2016-02-18 07:15:15
27342433	broccoli-change-extension	168	https://github.com/aflatter/broccoli-change-extension	A broccoli plugin that changes the extension of each entry in an input tree.	JavaScript	0	0	\N	0	2014-11-30 14:39:18	2014-11-30 14:45:52	2014-11-30 14:45:49
1841396	bulk_api	168	https://github.com/aflatter/bulk_api	\N	Ruby	0	1	\N	2	2011-06-03 05:05:58	2013-01-15 07:53:26	2011-06-14 10:17:28
1854444	bulk_data_source	168	https://github.com/aflatter/bulk_data_source	\N	JavaScript	0	0	\N	1	2011-06-06 09:44:04	2019-08-13 11:46:17	2011-06-06 11:08:09
24105105	bundix	168	https://github.com/aflatter/bundix	Generates a Nix expression for your Bundler-managed application.	Ruby	28	6	\N	9	2014-09-16 12:21:23	2018-03-14 15:23:43	2015-01-28 07:57:48
9937525	celluloid	168	https://github.com/aflatter/celluloid	Actor-based concurrent object framework for Ruby	Ruby	0	0	\N	0	2013-05-08 11:00:37	2013-07-12 05:13:25	2013-07-12 05:13:24
2556252	chat	168	https://github.com/aflatter/chat	A little web chat using Sproutcore 2, nodejs and socket.io.	JavaScript	0	0	\N	1	2011-10-11 12:38:22	2017-06-02 17:42:59	2011-10-11 12:38:49
8266816	chef-brightbox	168	https://github.com/aflatter/chef-brightbox	Brightbox Next Gen Ruby + Passenger / Nginx recipes for Chef.	Ruby	0	0	\N	0	2013-02-18 08:05:00	2013-12-12 03:31:11	2013-01-15 10:26:57
623356	collectdb	168	https://github.com/aflatter/collectdb	DEAD! An erlang server that implements the collectd protocol and saves packets to database.	Erlang	0	1	\N	3	2010-04-22 09:29:11	2017-06-02 17:42:57	2010-04-22 09:52:45
77128699	contentful.rb	168	https://github.com/aflatter/contentful.rb	Ruby client for the Contentful Content Delivery API	Ruby	0	0	\N	0	2016-12-22 06:50:39	2016-12-22 06:50:42	2016-12-22 07:00:54
11284007	cryptosphere	168	https://github.com/aflatter/cryptosphere	Openly federated encrypted cloud storage	JavaScript	0	0	\N	0	2013-07-09 11:07:52	2013-07-09 12:18:38	2013-07-09 11:13:40
11314773	dcell	168	https://github.com/aflatter/dcell	Actor-based distributed objects in Ruby based on Celluloid and 0MQ	JavaScript	0	0	\N	0	2013-07-10 11:49:22	2013-07-10 21:06:30	2013-07-10 21:06:29
1674883	devise_couch_potato	168	https://github.com/aflatter/devise_couch_potato	devise ORM adapter for couch_potato	Ruby	1	0	\N	2	2011-04-28 05:51:13	2017-06-02 17:42:58	2011-05-13 06:36:29
1696498	email-spec	168	https://github.com/aflatter/email-spec	Collection of rspec matchers and cucumber steps for testing email in a ruby app using ActiveMailer or Pony	Ruby	0	0	\N	1	2011-05-03 11:08:26	2017-06-02 17:42:58	2011-05-03 13:12:29
16888	feather	168	https://github.com/aflatter/feather	The simplest blog that works. Make sure you check out the feather-plugins repo as well!	Ruby	0	0	\N	3	2008-05-14 19:36:20	2019-08-13 10:24:35	2008-06-28 07:42:16
18738	feather-plugins	168	https://github.com/aflatter/feather-plugins	This contains various plugins for Feather	Ruby	0	0	\N	3	2008-05-21 20:21:35	2019-08-13 10:25:01	2008-07-13 18:22:50
307634453	gigalixir-action	168	https://github.com/aflatter/gigalixir-action	A GitHub Action for deploying Phoenix applications to Gigalixir	\N	0	0	\N	0	2020-10-27 05:34:07	2020-10-27 05:34:09	2020-10-28 04:37:45
13269747	hash-im	168	https://github.com/aflatter/hash-im	Minimal telehash-based IM (command line)	JavaScript	0	0	\N	0	2013-10-02 08:52:15	2013-10-07 16:26:25	2013-10-07 07:59:54
56156249	hawk-ruby	168	https://github.com/aflatter/hawk-ruby	Ruby implementation of Hawk HTTP authentication scheme	Ruby	0	0	\N	0	2016-04-13 10:54:35	2016-04-13 10:54:35	2015-04-12 16:02:27
520896	homebrew	168	https://github.com/aflatter/homebrew	Packaging system for Mac OS X 10.5 and above; heavy optimisations, no redundant packages and a bonus beer theme	Ruby	1	0	\N	1	2010-02-16 18:56:57	2017-06-02 17:42:57	2010-03-01 10:21:23
3379833	homebrew-alt	168	https://github.com/aflatter/homebrew-alt	Alternate formulae repos for Homebrew	Ruby	0	0	\N	1	2012-02-07 15:56:03	2017-06-02 17:42:59	2012-02-07 16:04:15
72653198	http	168	https://github.com/aflatter/http	HTTP (The Gem! a.k.a. http.rb) - a fast Ruby HTTP client with a chainable API, streaming support, and timeouts	Ruby	0	0	\N	0	2016-11-02 13:25:14	2016-11-02 13:25:15	2016-11-02 13:27:29
30656140	iso	168	https://github.com/aflatter/iso	\N	Ruby	0	0	\N	0	2015-02-11 14:05:06	2019-12-04 12:15:31	2015-02-11 14:05:50
1402169	jsdom	168	https://github.com/aflatter/jsdom	CommonJS implementation of the DOM intended to be platform independent and as minimal/light as possible while completely adhering to the w3c DOM specifications.	JavaScript	0	0	\N	1	2011-02-23 09:52:06	2017-06-02 17:42:58	2011-03-13 10:28:00
11975767	lens-article	168	https://github.com/aflatter/lens-article	The Lens Article Format	JavaScript	0	0	\N	0	2013-08-08 09:30:14	2013-08-08 09:30:47	2013-08-08 09:30:44
3210972	Locker	168	https://github.com/aflatter/Locker	Locker - the "me" platform 	JavaScript	0	0	\N	1	2012-01-18 16:08:16	2013-01-15 07:52:31	2012-01-18 16:10:16
1719015	maildir	168	https://github.com/aflatter/maildir	A ruby library for reading & writing messages in the maildir format	Ruby	0	0	\N	1	2011-05-08 12:44:27	2017-06-02 17:42:58	2011-05-08 14:17:11
34082974	ansible-ffmpeg	169	https://github.com/schofield/ansible-ffmpeg	Ansible role implementation of official FFmpeg compilation guide	\N	0	0	\N	0	2015-04-16 19:03:43	2014-09-13 10:02:00	2015-04-16 19:08:06
48380410	railsbricks	170	https://github.com/rbazinet/railsbricks	Boost your Rails development productivity with RailsBricks	Ruby	0	0	\N	0	2015-12-21 13:53:52	2015-12-21 13:53:53	2015-05-21 21:44:08
33678338	ansible-ffmpeg-build	169	https://github.com/schofield/ansible-ffmpeg-build	Builds ffmpeg, libvpx, libopus, fdk-aac, yasm and x264 built from source on Ubuntu 14.04. For Ansible 1.7.1. Based on the Ubuntu Compilation Guide. 	\N	0	0	\N	0	2015-04-09 12:55:22	2015-03-25 17:13:17	2014-09-18 19:56:25
7120892	descartes	169	https://github.com/schofield/descartes	Introspective dashboard for Graphite	JavaScript	0	0	\N	0	2012-12-11 20:54:12	2013-01-13 13:05:21	2012-11-20 17:09:00
14243705	gene_pool	169	https://github.com/schofield/gene_pool	Generic pooling library for creating connection pools	Ruby	0	0	\N	0	2013-11-08 18:33:35	2013-11-08 18:33:36	2013-10-14 09:08:12
170385907	hello-world	169	https://github.com/schofield/hello-world	simple repository with CI enabled	\N	0	0	\N	0	2019-02-12 18:25:33	2019-02-12 18:25:35	2019-01-15 05:15:09
14243694	persistent_http	169	https://github.com/schofield/persistent_http	Persistent http connections using a connection pool	Ruby	0	0	\N	0	2013-11-08 18:32:59	2013-11-08 18:32:59	2013-10-14 09:09:18
12169873	riak-erlang-client	169	https://github.com/schofield/riak-erlang-client	Erlang clients for Riak.	Erlang	0	0	\N	0	2013-08-16 19:44:46	2013-08-16 19:44:47	2013-08-15 18:46:17
4601142	riak-ruby-client	169	https://github.com/schofield/riak-ruby-client	Ruby client for Riak (previously known as "ripple/riak-client")	Ruby	0	0	\N	1	2012-06-08 16:04:23	2013-01-09 12:16:14	2012-04-25 11:37:44
13974807	riemann	169	https://github.com/schofield/riemann	A network event stream processing system, in Clojure.	Clojure	0	0	\N	0	2013-10-30 00:10:47	2016-02-05 16:09:14	2013-10-29 14:18:03
4600061	risky	169	https://github.com/schofield/risky	A lightweight Ruby ORM for Riak	Ruby	0	0	\N	1	2012-06-08 14:18:40	2013-11-06 03:16:48	2012-06-08 14:31:35
6782103	ruby-collectd	169	https://github.com/schofield/ruby-collectd	Send collectd statistics from your Ruby script	Ruby	0	0	\N	0	2012-11-20 15:34:53	2015-01-16 00:09:20	2011-06-06 16:29:38
6780188	tasseo	169	https://github.com/schofield/tasseo	Live dashboard for Graphite	JavaScript	0	0	\N	0	2012-11-20 13:31:04	2013-01-13 04:00:34	2012-11-14 20:03:10
6762945	vim-config	169	https://github.com/schofield/vim-config	my personal vim configuration	VimL	0	0	\N	0	2012-11-19 13:58:25	2013-01-13 03:35:28	2012-10-30 14:41:52
4744678	xsbt	169	https://github.com/schofield/xsbt	sbt, a build tool for Scala	Scala	0	0	\N	0	2012-06-21 18:31:13	2013-08-15 03:33:30	2012-06-18 09:21:48
25007858	activeadmin	170	https://github.com/rbazinet/activeadmin	The administration framework for Ruby on Rails applications.	Ruby	0	0	\N	0	2014-10-09 17:45:58	2015-02-09 20:03:10	2015-02-09 20:03:10
14178726	acts_as_indexed	170	https://github.com/rbazinet/acts_as_indexed	Acts As Indexed is a plugin which provides a pain-free way to add fulltext search to your Ruby on Rails app	Ruby	0	0	\N	0	2013-11-06 14:46:16	2013-11-06 14:46:16	2013-07-04 13:14:01
13608135	Aloft	170	https://github.com/rbazinet/Aloft	Mac OS X planatarium/astronomy appliacation. Build by Jan-Willem Buurlage and his friends at the University of Utrecht. 	Objective-C	0	0	\N	0	2013-10-15 23:53:20	2013-10-15 23:53:21	2010-10-29 20:47:39
48432415	api-standards	170	https://github.com/rbazinet/api-standards	\N	\N	0	0	\N	0	2015-12-22 11:08:22	2015-12-22 11:08:14	2015-10-13 08:40:55
40034385	ASEColorWriter	170	https://github.com/rbazinet/ASEColorWriter	UIColor -> Adobe Swatch Exchange format for use in Adobe Photoshop/Illustrator/InDesign	Objective-C	0	0	\N	0	2015-08-01 00:46:34	2015-08-01 00:46:35	2014-04-05 12:48:04
7720775	cheddar-ios	170	https://github.com/rbazinet/cheddar-ios	Cheddar for iOS	Objective-C	0	0	\N	0	2013-01-20 17:37:37	2020-07-09 23:32:30	2013-01-19 12:21:58
7720777	cheddar-mac	170	https://github.com/rbazinet/cheddar-mac	Cheddar for Mac	Objective-C	0	0	\N	0	2013-01-20 17:37:52	2020-07-09 23:32:01	2012-12-13 19:14:57
7720779	cheddarkit	170	https://github.com/rbazinet/cheddarkit	Objective-C framework that powers Cheddar for iOS and Cheddar for Mac	Objective-C	0	0	\N	0	2013-01-20 17:37:58	2020-07-09 23:31:52	2012-12-07 23:59:02
48430541	cyclescape	170	https://github.com/rbazinet/cyclescape	Cyclescape - cycle campaign group toolkit	Ruby	0	0	\N	0	2015-12-22 10:23:20	2015-12-22 10:23:22	2015-12-21 06:32:55
245524338	datumfactory_ruby	170	https://github.com/rbazinet/datumfactory_ruby	\N	Ruby	0	0	\N	0	2020-03-06 19:01:30	2020-03-09 17:57:04	2020-03-09 17:57:02
144091262	dev.to	170	https://github.com/rbazinet/dev.to	Where programmers share ideas and help each other grow	Ruby	0	0	\N	0	2018-08-08 23:28:34	2020-07-14 14:00:33	2018-08-08 22:54:51
47833072	docbuilder_gem	170	https://github.com/rbazinet/docbuilder_gem	Ruby gem for the Docbuilder service.	Ruby	0	0	\N	0	2015-12-11 13:06:39	2015-12-11 13:39:24	2015-12-11 13:07:22
249276667	docbuilder_ruby	170	https://github.com/rbazinet/docbuilder_ruby	\N	\N	0	0	\N	0	2020-03-22 18:35:07	2020-03-22 18:35:07	2020-03-22 18:35:08
469837	downforeveryoneorjustme	170	https://github.com/rbazinet/downforeveryoneorjustme	Is it down for everyone, or just me?	Python	1	0	\N	0	2010-01-13 01:25:50	2014-08-01 10:22:58	2010-01-11 21:09:40
15123002	dripper	170	https://github.com/rbazinet/dripper	A simple library that makes it easy to create drip marketing campaigns (or anything that should be performed on an offset schedule)	Ruby	0	0	\N	0	2013-12-11 22:23:49	2013-12-11 22:23:49	2013-08-23 20:09:37
13608250	erfa	170	https://github.com/rbazinet/erfa	Essential Routines for Fundamental Astronomy	C	0	0	\N	0	2013-10-15 23:59:31	2013-10-15 23:59:32	2013-10-05 02:44:14
238846826	fathom	170	https://github.com/rbazinet/fathom	Fathom Lite. Simple, privacy-focused website analytics. Built with Golang & Preact.	\N	0	0	\N	0	2020-02-07 01:55:46	2020-02-07 01:55:48	2019-11-26 19:48:21
72878231	fulcrum	170	https://github.com/rbazinet/fulcrum	An agile project planning tool	JavaScript	0	0	\N	0	2016-11-04 17:18:29	2016-11-04 17:18:30	2016-11-07 11:01:48
10204377	harvested	170	https://github.com/rbazinet/harvested	A Ruby Wrapper for the Harvest API http://www.getharvest.com/api	Ruby	0	0	\N	0	2013-05-21 17:07:36	2015-12-22 11:14:00	2015-12-22 11:13:57
48488159	http-api-design	170	https://github.com/rbazinet/http-api-design	HTTP API design guide extracted from work on the Heroku Platform API	\N	0	0	\N	0	2015-12-23 09:57:24	2015-12-23 04:33:46	2015-12-16 21:36:22
56347124	huginn	170	https://github.com/rbazinet/huginn	Build agents that monitor and act on your behalf.  Your agents are standing by!	Ruby	0	0	\N	0	2016-04-15 17:14:18	2016-04-15 17:14:20	2016-04-15 11:15:59
63192832	irresistible	170	https://github.com/rbazinet/irresistible	Docker Fundamentals Node Sample WebApp	CSS	0	0	\N	0	2016-07-12 18:15:48	2016-07-12 18:15:49	2016-05-24 17:21:10
47437074	mesh-networking	170	https://github.com/rbazinet/mesh-networking	:globe_with_meridians: A Python implementation of the OSI networking layers, eventually with IPv6 mesh-networking support.	C	0	0	\N	0	2015-12-04 23:24:36	2015-12-04 23:24:40	2015-12-04 22:00:29
82191070	mturk	170	https://github.com/rbazinet/mturk	HITs To Work With Mturk	HTML	0	0	\N	0	2017-02-16 12:45:37	2017-02-16 12:45:41	2017-02-14 06:10:09
57381703	OneHourWalker	170	https://github.com/rbazinet/OneHourWalker	OneHourWalker for iOS - a HealthKit demo	Swift	0	0	\N	0	2016-04-29 09:14:24	2016-04-29 09:14:26	2016-03-22 02:07:50
48137467	pipelinedeals_api	170	https://github.com/rbazinet/pipelinedeals_api	This is a ruby wrapper that facilitates use of the PipelineDeals API.	Ruby	0	0	\N	0	2015-12-16 19:56:46	2015-12-16 19:56:46	2015-09-23 00:19:17
47980558	rails-composer	170	https://github.com/rbazinet/rails-composer	Rails Composer. The Rails generator on steroids for starter apps.	Ruby	0	0	\N	0	2015-12-14 12:40:30	2015-12-14 12:40:31	2015-12-14 12:42:50
6906125	railsbp.com	170	https://github.com/rbazinet/railsbp.com	railsbp.com	JavaScript	0	0	\N	0	2012-11-28 15:12:42	2017-05-25 09:42:53	2012-10-16 22:45:56
208432926	aaron_junod_dev	171	https://github.com/tranqy/aaron_junod_dev	\N	Dart	0	0	\N	0	2019-09-14 08:49:09	2019-09-28 09:12:28	2019-09-28 09:12:25
98525630	bitfinex-python	171	https://github.com/tranqy/bitfinex-python	Python 3 module to interact with the Bitfinex API. The end goal is to incorporate both version 1 and 2 of the API into one module.	Python	0	0	\N	0	2017-07-27 07:55:05	2017-07-27 07:55:06	2017-07-26 12:46:08
159498033	christmas-fm-alexa-skill	171	https://github.com/tranqy/christmas-fm-alexa-skill	Bringing you the magic of Christmas, through your Alexa.	JavaScript	0	0	\N	0	2018-11-28 10:22:46	2018-11-28 10:42:49	2018-11-28 10:42:48
30816030	chrome-fast-tab-switcher	171	https://github.com/tranqy/chrome-fast-tab-switcher	React-based extension to quickly switch to other open Chrome tabs with just your keyboard	JavaScript	0	0	\N	0	2015-02-15 00:52:09	2015-02-15 00:52:09	2014-03-07 14:59:41
13296299	dotfiles	171	https://github.com/tranqy/dotfiles	.files, including ~/.osx — sensible hacker defaults for OS X	PHP	0	0	\N	1	2013-10-03 08:26:33	2016-10-09 19:59:02	2013-09-23 06:15:39
56054396	fabric	171	https://github.com/tranqy/fabric	Fabric is a blockchain project in Incubation proposed to the community and documented at https://docs.google.com/document/d/1XECRVN9hXGrjAjysrnuNSdggzAKYm6XESR6KmABwhkE.  Information on what Incubation entails can be found in the Hyperledger Project Lifecycle document (https://github.com/hyperledger/hyperledger/wiki/Project-Lifecycle)	Go	0	0	\N	0	2016-04-12 07:44:10	2016-04-12 07:44:12	2016-04-12 05:52:50
197922934	feathers-blob	171	https://github.com/tranqy/feathers-blob	Feathers service for blob storage, like S3.	JavaScript	0	0	\N	0	2019-07-20 08:45:26	2019-07-20 09:03:27	2019-07-20 09:03:25
1618507	gae-flask-html5	171	https://github.com/tranqy/gae-flask-html5	A Flask skeleton for GAE, using html5 boilerplate for templating.	Python	0	0	\N	1	2011-04-15 07:40:54	2013-10-08 11:26:24	2011-04-13 17:00:11
272022099	graphql-engine	171	https://github.com/tranqy/graphql-engine	Blazing fast, instant realtime GraphQL APIs on Postgres with fine grained access control, also trigger webhooks on database events.	\N	0	0	\N	0	2020-06-13 11:14:30	2020-06-13 11:14:32	2020-06-12 17:55:27
52958291	habitrpg	171	https://github.com/tranqy/habitrpg	A habit tracker app which treats your goals like a Role Playing Game.	JavaScript	0	0	\N	0	2016-03-02 08:38:32	2016-03-02 08:38:40	2016-03-02 08:22:02
461672	hpple	171	https://github.com/tranqy/hpple	An XML/HTML parser for Objective-C, inspired by Hpricot.	Objective-C	1	0	\N	1	2010-01-07 00:21:01	2013-10-08 11:26:22	2009-07-27 16:42:12
48020039	hubot-figlefy	171	https://github.com/tranqy/hubot-figlefy	\N	\N	0	0	\N	0	2015-12-15 02:42:50	2015-12-15 02:42:50	2015-12-15 02:42:50
9184024	KNSemiModalViewController	171	https://github.com/tranqy/KNSemiModalViewController	KNSemiModalViewController	Objective-C	0	0	\N	0	2013-04-02 22:11:52	2013-10-24 17:36:37	2013-04-02 22:18:00
99224359	prezto	171	https://github.com/tranqy/prezto	The configuration framework for Zsh	Shell	0	0	\N	0	2017-08-03 08:12:57	2017-08-03 08:12:59	2018-02-10 11:26:19
98415594	python-bittrex	171	https://github.com/tranqy/python-bittrex	Python bindings for bittrex	Python	0	0	\N	0	2017-07-26 08:30:30	2017-07-26 08:30:32	2017-07-26 08:33:54
63459726	react-routing-mobx-bootstrap-boilerplate	171	https://github.com/tranqy/react-routing-mobx-bootstrap-boilerplate	Simple boilerplate with webpack, react, mobx, react router and css modules	JavaScript	5	1	\N	26	2016-07-15 22:28:24	2018-05-02 05:51:36	2016-07-16 10:15:39
210336990	resume_template	171	https://github.com/tranqy/resume_template	Flutter resume template	Dart	0	0	\N	1	2019-09-23 08:23:16	2019-09-23 13:41:14	2019-09-23 08:23:38
7717849	SlidingMenu	171	https://github.com/tranqy/SlidingMenu	An Android library that allows you to easily create applications with slide-in menus. You may use it in your Android apps provided that you cite this project and include the license in your app. Thanks!	Java	0	0	\N	0	2013-01-20 13:30:54	2013-10-08 11:26:28	2013-01-16 15:32:19
20034264	Specs	171	https://github.com/tranqy/Specs	The CocoaPods Master Repo	Ruby	0	0	\N	0	2014-05-21 16:27:35	2014-05-21 16:40:52	2014-05-21 16:38:37
5964715	TITokenField	171	https://github.com/tranqy/TITokenField	An iOS version of the NSTokenField (See To: field in Mail and Messages).	Objective-C	0	0	\N	0	2012-09-26 08:19:53	2013-10-08 11:26:21	2012-09-26 08:28:57
102276297	trufflesuite.github.io	171	https://github.com/tranqy/trufflesuite.github.io	The Truffle Suite Website. README: https://github.com/trufflesuite/truffleframework.github.io/blob/master/_harp/README.md	HTML	0	0	\N	0	2017-09-03 12:59:56	2017-09-03 12:59:58	2017-09-03 13:01:13
23417933	4bottle	172	https://github.com/robey/4bottle	the final archive format	JavaScript	3	1	\N	119	2014-08-28 03:35:50	2019-09-27 20:08:54	2015-09-08 01:41:10
118791654	adaptive_quickselect	172	https://github.com/robey/adaptive_quickselect	an attempt to rustify the linear median algorithm from https://github.com/andralex/MedianOfNinthers/	Rust	0	0	\N	1	2018-01-24 14:31:38	2019-08-13 14:22:28	2018-01-28 00:47:05
12673681	antsy	172	https://github.com/robey/antsy	draw full-color (xterm-256) ansi graphics into a buffer	TypeScript	0	0	\N	8	2013-09-07 21:17:18	2020-12-16 00:18:27	2020-12-16 00:18:24
126231223	ballvalve	172	https://github.com/robey/ballvalve	adapt streaming data into async iterators	TypeScript	0	0	\N	2	2018-03-21 16:37:41	2020-10-30 04:07:56	2020-10-30 04:07:54
33491936	bitbottle	172	https://github.com/robey/bitbottle	library to read/write the lib4bottle archive format	TypeScript	0	1	\N	1	2015-04-06 13:23:14	2020-07-31 13:59:39	2020-12-13 00:46:28
56402009	bmp2ansi	172	https://github.com/robey/bmp2ansi	convert a BMP file into an xterm-256 ANSI block image	TypeScript	1	0	\N	2	2016-04-16 16:31:24	2020-08-28 01:26:39	2019-12-08 21:42:23
130622048	c3r3s	172	https://github.com/robey/c3r3s	serial 64-bit bootloader for the raspberry pi 3	Rust	3	3	\N	44	2018-04-22 22:04:01	2020-11-21 18:19:35	2018-04-30 14:39:31
7581589	carrot16	172	https://github.com/robey/carrot16	in-browser IDE/assembler/emulator for DCPU-16	CoffeeScript	0	0	\N	0	2013-01-12 20:47:25	2013-12-02 02:00:37	2013-02-24 06:16:56
6378	configgy	172	https://github.com/robey/configgy	simple config and logging setup for scala	Scala	27	8	\N	160	2008-04-02 20:21:25	2019-09-03 17:30:34	2012-05-24 18:21:20
29541034	crow-metrics	172	https://github.com/robey/crow-metrics	small metrics collector for node	TypeScript	2	2	\N	18	2015-01-20 15:04:32	2020-07-01 21:20:40	2020-07-21 06:37:25
76507308	crow-metrics-viz	172	https://github.com/robey/crow-metrics-viz	express plugin that exports and displays crow metrics	TypeScript	0	0	\N	0	2016-12-14 22:03:36	2018-03-20 20:05:25	2018-03-20 20:05:24
4581382	d16bunny	172	https://github.com/robey/d16bunny	DCPU-16 assembler written in coffeescript	CoffeeScript	0	0	\N	2	2012-06-07 02:05:22	2014-12-15 04:16:24	2014-12-15 04:16:24
8430050	dcpu-standards	172	https://github.com/robey/dcpu-standards	discussion about standardizing existing dcpu tools	\N	1	0	\N	0	2013-02-26 07:13:21	2013-11-17 12:24:33	2013-02-26 07:13:21
4010911	deconstruct	172	https://github.com/robey/deconstruct	simple parser for java class files	Scala	0	0	\N	4	2012-04-12 21:40:08	2015-08-02 01:24:56	2012-04-13 00:42:57
216622924	disasm-65c02	172	https://github.com/robey/disasm-65c02	small self-hosting disassembler for the 65C02	Makefile	0	0	\N	0	2019-10-21 14:11:43	2019-10-21 14:13:30	2019-10-21 14:13:25
66861543	display-si	172	https://github.com/robey/display-si	convert/round numbers to human-friendly SI units like "13.4M"	TypeScript	0	0	\N	0	2016-08-29 13:41:31	2016-08-29 13:41:48	2016-12-15 21:03:14
14814206	docker-layercake	172	https://github.com/robey/docker-layercake	recipe for running docker on a mac laptop, with a java+node instance	Shell	0	0	\N	0	2013-11-30 00:53:54	2014-04-01 23:54:04	2013-11-30 01:05:10
40990516	docs	172	https://github.com/robey/docs	Prometheus documentation: content and static site generator	CSS	0	0	\N	0	2015-08-18 15:33:17	2015-08-18 15:33:18	2015-08-18 15:37:13
742448	dvorky	172	https://github.com/robey/dvorky	fussing around with trying to make an android keyboard layout	Scala	0	0	\N	2	2010-06-26 17:35:47	2013-11-17 12:24:31	2010-06-26 19:27:44
104668114	electron	172	https://github.com/robey/electron	demo of a web/js game idea	TypeScript	0	0	\N	0	2017-09-24 15:51:39	2017-09-24 15:56:42	2017-10-23 02:05:09
21110611	font-problems	172	https://github.com/robey/font-problems	command-line tool for reading and writing console bitmap fonts	TypeScript	1	0	\N	30	2014-06-22 22:40:20	2021-01-14 20:37:48	2020-07-12 16:37:21
45853502	funos	172	https://github.com/robey/funos	experiment in writing a unikernel/exokernel	C	0	0	\N	3	2015-11-09 15:11:12	2017-03-22 16:34:21	2015-11-29 18:16:31
88466184	gingersnap	172	https://github.com/robey/gingersnap	stream transforms for snappy compression in rust	Rust	0	0	\N	1	2017-04-17 00:56:19	2017-04-18 09:51:46	2017-04-21 13:59:54
10214343	globwatcher	172	https://github.com/robey/globwatcher	watch a set of files for changes (including create/delete) by glob patterns	JavaScript	1	0	\N	10	2013-05-22 04:30:23	2019-02-01 17:32:52	2016-06-15 10:46:58
290301941	glowball	172	https://github.com/robey/glowball	ESP32 project for running neopixels from a web server	C	0	0	\N	0	2020-08-25 16:13:16	2020-08-26 03:17:58	2020-08-26 03:17:56
525102	growlme	172	https://github.com/robey/growlme	small script to send yourself a growl notification when a command finishes	\N	6	1	\N	56	2010-02-18 20:08:33	2019-08-13 11:31:25	2010-02-19 21:43:51
104141654	json-c	172	https://github.com/robey/json-c	https://github.com/json-c/json-c is the official code repository for json-c.  See the wiki for release tarballs for download.	C	0	0	\N	0	2017-09-19 20:47:42	2017-09-19 20:47:44	2017-09-18 03:22:46
5458147	lcdtext	172	https://github.com/robey/lcdtext	small LCD text driver for arduinos	C++	0	0	\N	0	2012-08-17 19:21:19	2013-12-09 17:15:08	2012-08-17 19:27:23
28953113	lgbtq-technology.github.io	172	https://github.com/robey/lgbtq-technology.github.io	\N	Ruby	0	0	\N	0	2015-01-08 04:52:32	2015-01-08 04:52:33	2015-01-08 04:53:14
84972541	lib4bottle-rs	172	https://github.com/robey/lib4bottle-rs	test project to port lib4bottle to rust	Rust	1	0	\N	1	2017-03-14 13:33:36	2017-03-21 00:52:27	2017-04-15 16:16:37
15080791	ace	173	https://github.com/bkeepers/ace	Ace (Ajax.org Cloud9 Editor)	JavaScript	0	0	\N	0	2013-12-10 13:21:03	2013-12-10 13:21:05	2013-12-09 17:24:56
288017903	acts_as_list	173	https://github.com/bkeepers/acts_as_list	An ActiveRecord plugin for managing lists.	\N	0	0	\N	0	2020-08-16 17:17:58	2020-08-16 17:18:01	2020-08-16 17:23:44
2272448	adapter-git	173	https://github.com/bkeepers/adapter-git	Git adapter for adapter gem.	Ruby	3	0	\N	41	2011-08-26 02:15:25	2020-05-02 18:10:22	2015-07-08 19:01:46
101321043	add-collabs	173	https://github.com/bkeepers/add-collabs	\N	JavaScript	0	0	\N	0	2017-08-24 14:30:59	2017-08-24 14:31:00	2017-08-02 18:13:38
136978256	airport-5ghz	173	https://github.com/bkeepers/airport-5ghz	macOS command line utility to connect to the strongest available 5GHz access point	Swift	0	2	\N	0	2018-06-11 17:37:15	2018-06-11 17:44:37	2018-06-11 17:42:24
27136129	akismet	173	https://github.com/bkeepers/akismet	A Ruby client for the Akismet API	Ruby	0	0	\N	0	2014-11-25 14:54:31	2014-11-25 15:08:54	2014-11-25 15:08:54
149852783	annotation	173	https://github.com/bkeepers/annotation	Convert linter output into annotations for the GitHub Checks API	Go	0	0	\N	8	2018-09-22 03:44:30	2020-05-29 04:41:14	2018-09-22 03:51:40
97834587	apollo-client	173	https://github.com/bkeepers/apollo-client	:rocket: A fully-featured, production ready caching GraphQL client for every server or UI framework	TypeScript	0	0	\N	1	2017-07-20 09:48:48	2018-01-04 19:16:23	2017-07-20 09:48:57
84686127	atom	173	https://github.com/bkeepers/atom	\N	JavaScript	0	0	\N	1	2017-03-11 20:15:14	2017-03-18 12:05:46	2017-03-11 20:17:08
107262517	badge	173	https://github.com/bkeepers/badge	Automatically invite authors of merged pull requests to your organization	JavaScript	0	0	\N	0	2017-10-17 10:00:02	2017-10-17 10:00:04	2017-10-17 10:05:34
14458278	bkeepers.github.io	173	https://github.com/bkeepers/bkeepers.github.io	\N	CSS	5	0	\N	3	2013-11-16 22:27:34	2017-09-16 17:48:37	2018-12-03 18:21:59
9944339	bundler	173	https://github.com/bkeepers/bundler	Manage your application's gem dependencies with less pain	Ruby	0	0	\N	0	2013-05-08 16:37:41	2020-01-09 22:12:06	2015-02-09 01:25:28
266547186	chord-editor	173	https://github.com/bkeepers/chord-editor	Edit song sheets in ChordPro, Chord Sheet, and Ultimate Guitar formats	HTML	0	5	\N	4	2020-05-24 10:31:19	2020-12-02 09:49:31	2020-12-12 15:54:48
13976262	chordpro	173	https://github.com/bkeepers/chordpro	A ruby parser for the chordpro song file format.	Ruby	7	4	\N	26	2013-10-30 01:24:04	2021-01-29 04:24:28	2014-12-30 11:45:22
266607841	ChordSheetJS	173	https://github.com/bkeepers/ChordSheetJS	A JavaScript library for parsing and formatting ChordPro chord sheets	\N	0	0	\N	0	2020-05-24 16:11:40	2020-05-24 16:11:41	2020-04-27 01:12:49
29066047	clahub	173	https://github.com/bkeepers/clahub	Easy contributor license agreements for your GitHub projects.	Ruby	1	0	\N	0	2015-01-10 16:09:24	2015-01-10 16:09:26	2017-01-14 16:02:29
97834333	clojurescript-unraveled	173	https://github.com/bkeepers/clojurescript-unraveled	Ukrainian translation of “ClojureScript Unraveled” by @funcool	\N	0	0	\N	0	2017-07-20 09:46:16	2017-07-11 05:59:49	2017-08-16 11:58:16
27602	codex	173	https://github.com/bkeepers/codex	Simple tool for creating source-code intensive presentations and courses	Ruby	1	0	\N	3	2008-06-22 22:48:09	2019-08-13 10:27:23	2008-11-19 16:44:03
19121867	coffee-script	173	https://github.com/bkeepers/coffee-script	Unfancy JavaScript	CoffeeScript	1	0	\N	0	2014-04-24 16:50:18	2015-01-23 02:13:41	2014-03-18 10:11:29
126115209	compose	173	https://github.com/bkeepers/compose	Middleware composition utility	JavaScript	0	0	\N	0	2018-03-21 00:02:14	2018-03-21 00:02:16	2018-03-08 00:26:16
25079186	dashing-octostatus	173	https://github.com/bkeepers/dashing-octostatus	GitHub Status widget for the dashing dashboard framework	CoffeeScript	1	0	\N	7	2014-10-11 10:30:15	2020-03-31 21:51:58	2014-10-11 10:34:13
97833862	datatogether-superset	173	https://github.com/bkeepers/datatogether-superset	Heroku-backed Superset instance for visualizing live project data.	Python	0	0	\N	0	2017-07-20 09:41:05	2017-07-20 09:41:06	2017-08-13 00:29:48
89314056	dco	173	https://github.com/bkeepers/dco	a GitHub Integration that enforces the Developer Certificate of Origin (DCO) on Pull Requests	JavaScript	0	0	\N	0	2017-04-25 00:37:11	2017-04-25 00:37:13	2018-12-03 18:03:59
51587088	dear-github	173	https://github.com/bkeepers/dear-github	An open letter to GitHub from the maintainers of open source projects	\N	0	0	\N	30	2016-02-12 10:47:50	2019-07-15 19:53:09	2016-02-12 10:59:46
150320032	delete-merged-branch	173	https://github.com/bkeepers/delete-merged-branch	No more manually deleting merged branches, this lovely app does it for you.	JavaScript	0	0	\N	0	2018-09-25 16:39:57	2018-09-25 16:39:59	2018-09-25 16:46:23
32048466	docs	173	https://github.com/bkeepers/docs	Documentation for Atom, built by Atlas, hosted on atom.io	CSS	0	0	\N	0	2015-03-11 21:28:59	2015-03-11 21:28:59	2015-03-11 19:56:22
5160706	dotenv	173	https://github.com/bkeepers/dotenv	A Ruby gem to load environment variables from `.env`. 	Ruby	418	8	\N	5743	2012-07-24 00:38:51	2021-01-30 06:15:17	2021-01-28 23:41:20
17101894	dotenv-deployment	173	https://github.com/bkeepers/dotenv-deployment	Make dotenv more useful in other environments.	Ruby	26	0	\N	100	2014-02-23 01:52:54	2020-12-01 04:07:20	2015-03-13 14:15:03
74836457	dotfiles	173	https://github.com/bkeepers/dotfiles	\N	Shell	0	0	\N	2	2016-11-26 14:16:13	2020-08-06 15:18:36	2020-08-06 15:18:33
97833529	edgi-scripts	173	https://github.com/bkeepers/edgi-scripts	Code scripts for our digital infrastructure.	Python	0	0	\N	0	2017-07-20 09:37:23	2017-07-20 09:37:25	2017-07-20 09:37:32
687812	amqp	174	https://github.com/wilson/amqp	AMQP client implementation in Ruby/EventMachine	Ruby	1	0	\N	1	2010-05-26 15:43:38	2014-04-03 18:58:30	2010-05-26 16:26:31
1667687	arcturus	174	https://github.com/wilson/arcturus	Way ahead of schedule	\N	0	0	\N	1	2011-04-26 18:41:19	2016-09-23 23:51:41	\N
140586	bart	174	https://github.com/wilson/bart	Baobab Health Anti-retroviral Treatment	Ruby	0	0	\N	2	2009-03-01 15:26:42	2019-08-13 11:05:18	2009-03-01 19:48:59
104707576	bsdec2-image-upload	174	https://github.com/wilson/bsdec2-image-upload	Automatically exported from code.google.com/p/bsdec2-image-upload	C	0	0	\N	0	2017-09-25 02:42:07	2017-09-25 02:42:09	2017-08-09 08:49:33
503007	bundler	174	https://github.com/wilson/bundler	Gemfiles are fun	Ruby	1	0	\N	1	2010-02-04 20:23:29	2020-01-09 22:11:18	2010-02-17 14:48:52
140341622	codeclimate-shellcheck	174	https://github.com/wilson/codeclimate-shellcheck	codeclimate-shellcheck is a Code Climate engine that wraps ShellCheck	Haskell	0	0	\N	0	2018-07-09 17:59:35	2019-09-16 17:20:36	2018-07-10 11:16:45
474614	domainatrix	174	https://github.com/wilson/domainatrix	A cruel mistress that uses the public suffix domain list to dominate URLs by canonicalizing, finding the public suffix, and breaking them into their domain parts.	Ruby	1	0	\N	4	2010-01-16 03:41:05	2012-12-13 19:56:28	2010-06-30 01:25:50
2500060	earthquake	174	https://github.com/wilson/earthquake	Twitter terminal client with streaming API support.	Ruby	0	0	\N	1	2011-10-02 13:21:03	2013-01-04 06:47:15	2011-09-29 12:40:59
743685	em-http-request	174	https://github.com/wilson/em-http-request	Asynchronous HTTP Client (EventMachine + Ruby)	Ruby	1	0	\N	1	2010-06-27 16:55:41	2012-12-14 17:33:30	2010-06-27 17:54:47
1926766	enjin	174	https://github.com/wilson/enjin	An open cloud for any altitude.	Ruby	0	0	\N	3	2011-06-20 22:05:06	2015-11-14 15:37:49	2011-10-05 03:57:23
558065	faraday	174	https://github.com/wilson/faraday	experiments in a rest api lib	Ruby	1	0	\N	1	2010-03-11 16:25:01	2012-12-14 00:15:35	2010-07-13 13:29:02
45664	flac2mp3	174	https://github.com/wilson/flac2mp3	Converter for FLAC to MP3	Ruby	0	0	\N	3	2008-08-25 02:12:03	2019-08-13 10:32:48	2008-08-25 16:07:12
104699159	freebsd	174	https://github.com/wilson/freebsd	FreeBSD src tree (read-only mirror)	C	0	0	\N	0	2017-09-25 00:26:45	2017-09-25 00:31:28	2017-10-25 23:58:38
343825	gemcutter	174	https://github.com/wilson/gemcutter	awesome gem hosting.	Ruby	1	0	\N	1	2009-10-20 16:38:01	2012-12-13 00:19:32	2009-10-19 19:15:55
21243	gitjour	174	https://github.com/wilson/gitjour	Serve git and advertise with bonjour	Ruby	0	0	\N	2	2008-06-01 05:15:39	2019-08-13 10:25:39	2008-08-23 22:38:03
3743133	grape	174	https://github.com/wilson/grape	An opinionated micro-framework for creating REST-like APIs in Ruby.	Ruby	0	0	\N	1	2012-03-16 18:14:40	2015-08-03 14:53:41	2012-03-01 13:26:02
230943902	gravitar	174	https://github.com/wilson/gravitar	AWS VPC creation tools	\N	0	0	\N	0	2019-12-30 13:08:15	2020-09-22 13:04:44	2019-12-30 13:18:36
964725	homebrew	174	https://github.com/wilson/homebrew	The missing package manager for OS X.	Ruby	0	0	\N	1	2010-10-05 17:36:17	2013-12-13 23:23:21	2010-10-05 12:38:06
18400	inquisitor	174	https://github.com/wilson/inquisitor	Rubinius demonstration Rails app	Ruby	0	0	\N	3	2008-05-20 18:25:27	2019-08-13 10:24:56	2008-05-30 16:24:10
103983744	kafka-docker	174	https://github.com/wilson/kafka-docker	Dockerfile for Apache Kafka	Shell	0	0	\N	0	2017-09-18 16:40:22	2017-09-18 16:40:24	2017-09-18 16:52:30
104031140	kafka-health-check	174	https://github.com/wilson/kafka-health-check	Health Check for Kafka Brokers.	Go	0	0	\N	0	2017-09-19 02:37:52	2017-09-19 02:37:53	2017-09-24 16:29:17
9254360	marius	174	https://github.com/wilson/marius	A dynamic language experiment with a fun VM	C++	0	0	\N	0	2013-04-05 23:28:27	2013-04-05 23:28:27	2013-04-04 21:35:41
179082451	metabase	174	https://github.com/wilson/metabase	The simplest, fastest way to get business intelligence and analytics  to everyone in your company :yum:	Clojure	0	0	\N	0	2019-04-02 10:21:25	2019-04-02 10:21:41	2019-04-02 10:22:45
686114	mini_fb	174	https://github.com/wilson/mini_fb	control flow is hard	Ruby	1	0	\N	1	2010-05-25 18:24:37	2012-12-14 15:31:34	2010-05-25 18:43:28
1081371	nats	174	https://github.com/wilson/nats	A simple and performant EventMachine based Publish-Subscribe system that just works. 	Ruby	0	0	\N	1	2010-11-15 06:58:57	2014-12-11 21:43:08	2010-11-15 07:49:57
748404	oauth-ruby	174	https://github.com/wilson/oauth-ruby	OAuth for Ruby	Ruby	1	0	\N	1	2010-06-30 02:03:57	2014-10-15 15:02:14	2010-06-30 03:37:42
229830530	packer-csgo	174	https://github.com/wilson/packer-csgo	Packer config for Counter-Strike: Global Offensive	SourcePawn	0	1	\N	0	2019-12-23 19:18:20	2020-03-17 11:53:05	2020-03-19 16:40:42
29007531	packer-nixos	174	https://github.com/wilson/packer-nixos	Packer build process to create a NixOS base image for Docker	Nix	0	0	\N	0	2015-01-09 06:22:27	2015-01-09 06:23:54	2014-01-05 03:21:00
95927399	rails	174	https://github.com/wilson/rails	Ruby on Rails	Ruby	0	0	\N	0	2017-06-30 19:10:52	2017-06-30 19:11:35	2017-07-02 15:54:45
45498	rake	174	https://github.com/wilson/rake	A fork of Rake dedicated to cleanup and simplification where possible	Ruby	0	0	\N	3	2008-08-24 13:58:31	2019-08-13 10:32:43	2008-11-19 21:28:26
305993353	airflow	175	https://github.com/tommorris/airflow	Apache Airflow - A platform to programmatically author, schedule, and monitor workflows	\N	0	0	\N	0	2020-10-21 07:50:32	2020-10-21 07:50:35	2020-10-21 07:24:33
182517793	AllinOne	175	https://github.com/tommorris/AllinOne	All in one Hugo theme	CSS	0	0	\N	0	2019-04-21 07:07:17	2019-04-21 07:07:19	2019-04-21 07:08:07
36862	attention-rdf	175	https://github.com/tommorris/attention-rdf	\N	\N	1	0	\N	3	2008-07-24 12:31:16	2019-08-13 10:29:53	2008-07-24 12:32:18
300380273	avicenna	175	https://github.com/tommorris/avicenna	a minimal academic page for hugo	\N	0	0	\N	0	2020-10-01 15:18:57	2020-10-01 15:18:59	2020-10-01 15:19:13
216854009	awesome-elixir	175	https://github.com/tommorris/awesome-elixir	A curated list of amazingly awesome Elixir and Erlang libraries, resources and shiny things. Updates:	\N	0	0	\N	0	2019-10-22 12:59:53	2019-10-22 12:59:54	2019-10-22 13:03:57
300313318	awesome-lua	175	https://github.com/tommorris/awesome-lua	A curated list of quality Lua packages and resources.	\N	0	0	\N	0	2020-10-01 11:42:04	2020-10-01 11:42:06	2020-10-01 11:43:48
300379255	axiom	175	https://github.com/tommorris/axiom	Axiom - A Hugo Theme	\N	0	0	\N	0	2020-10-01 15:15:33	2020-10-01 15:15:35	2020-10-01 15:15:45
182425269	babifarm	175	https://github.com/tommorris/babifarm	\N	HTML	0	0	\N	0	2019-04-20 12:55:46	2019-04-20 12:55:48	2018-12-22 23:54:39
102358048	Bad-Tools	175	https://github.com/tommorris/Bad-Tools	Excuses for bad programmers.	HTML	0	0	\N	0	2017-09-04 09:17:07	2017-09-04 09:17:08	2017-09-04 09:19:42
182517921	basics	175	https://github.com/tommorris/basics	Hugo theme. Now available from official hugo theme site!	HTML	0	0	\N	0	2019-04-21 07:08:51	2019-04-21 07:08:53	2019-04-21 07:09:10
36881953	bastardhooks	175	https://github.com/tommorris/bastardhooks	Opinionated Git pre-commit hooks (because only vigilance can stop CoffeeScript)	Python	0	0	\N	0	2015-06-04 13:22:00	2016-06-17 12:58:19	2020-06-07 06:54:22
65605605	bees	175	https://github.com/tommorris/bees	BEES BEES BEES BEES BEES BEES BEES BEES BEES BEES BEES BEES BEES BEES BEES BEES	Java	13	2	\N	8	2016-08-13 04:39:21	2020-09-30 04:19:40	2020-07-17 09:58:07
6532323	bibtowiki	175	https://github.com/tommorris/bibtowiki	\N	Ruby	0	0	\N	0	2012-11-04 14:01:39	2013-09-28 10:48:42	2012-11-05 15:38:02
182517386	blackburn	175	https://github.com/tommorris/blackburn	A Hugo theme built using Yahoo's Pure CSS	HTML	0	0	\N	0	2019-04-21 07:02:41	2019-04-21 07:02:44	2019-04-21 07:04:09
12972836	boto	175	https://github.com/tommorris/boto	Python interface to Amazon Web Services	Python	0	0	\N	0	2013-09-20 09:29:51	2013-10-07 08:14:53	2013-09-20 09:30:50
182496521	charaka-hugo-theme	175	https://github.com/tommorris/charaka-hugo-theme	Minimalistic and Responsive blog theme for hugo	JavaScript	0	0	\N	0	2019-04-21 03:06:17	2019-04-21 03:06:19	2019-04-21 03:06:35
34442548	cloc-hook	175	https://github.com/tommorris/cloc-hook	\N	Shell	0	0	\N	0	2015-04-23 05:05:05	2015-04-23 05:08:51	2015-04-23 05:08:50
122058815	conversation-android-quickstart	175	https://github.com/tommorris/conversation-android-quickstart	A repository containing everything you need when getting started with the Nexmo Conversation API and the Android SDK	\N	0	0	\N	0	2018-02-19 09:24:23	2017-12-05 17:24:46	2018-02-19 09:42:55
122064035	conversation-ios-sdk	175	https://github.com/tommorris/conversation-ios-sdk	[READ ONLY] Nexmo Conversation iOS SDK	Swift	0	0	\N	0	2018-02-19 10:09:40	2019-11-13 10:37:27	2018-02-19 10:13:23
191177	dbpedia-tests	175	https://github.com/tommorris/dbpedia-tests	User-created regression and unit tests for dbpedia.org	Ruby	0	0	\N	5	2009-05-02 20:27:07	2019-08-13 11:23:17	2011-12-06 08:02:37
307729792	dendron-template	175	https://github.com/tommorris/dendron-template	Getting started with Dendron	\N	0	0	\N	0	2020-10-27 11:39:09	2020-10-27 11:39:12	2020-11-04 12:48:21
6224539	devise-roles-user-management	175	https://github.com/tommorris/devise-roles-user-management	Example app using Devise Roles(Admin)  to manage Users with CanCan	Ruby	0	0	\N	0	2012-10-15 06:26:57	2013-01-12 14:28:02	2012-10-15 06:27:39
643442	dir2rss	175	https://github.com/tommorris/dir2rss	lightweight server for turning a folder into a feed, primarily for iTunes	Ruby	0	0	\N	1	2010-05-02 17:40:04	2014-01-11 08:39:59	2010-05-04 07:25:02
59116418	django-httpequiv-status	175	https://github.com/tommorris/django-httpequiv-status	Django middleware for implementing meta httpequiv-status	Python	0	0	\N	0	2016-05-18 10:07:55	2016-05-18 10:08:12	2016-05-18 12:46:39
12430132	django-spreadsheetresponsemixin	175	https://github.com/tommorris/django-spreadsheetresponsemixin	View mixin for django, that generates a csv or excel sheet.	Python	0	0	\N	0	2013-08-28 06:44:35	2013-08-28 06:52:16	2013-08-28 06:45:08
83226658	django-two-factor-auth	175	https://github.com/tommorris/django-two-factor-auth	Complete Two-Factor Authentication for Django providing the easiest integration into most Django projects.	Python	0	0	\N	0	2017-02-26 14:20:23	2017-02-26 14:20:25	2017-04-19 14:12:51
321652410	docs.getdbt.com	175	https://github.com/tommorris/docs.getdbt.com	The code behind docs.getdbt.com	\N	0	0	\N	0	2020-12-15 08:51:32	2020-12-15 08:51:34	2020-12-15 12:46:08
171567398	elpushover	175	https://github.com/tommorris/elpushover	\N	Elixir	0	0	\N	0	2019-02-19 20:36:01	2020-05-15 13:41:54	2020-06-07 06:52:52
186045700	ermi-file-format	175	https://github.com/tommorris/ermi-file-format	This repo documents the CSV file format for the ERMI monitoring tool batch services. 	\N	0	0	\N	0	2019-05-10 16:46:28	2019-05-10 16:46:31	2019-05-10 16:47:47
180458354	explore	175	https://github.com/tommorris/explore	Community-curated topic and collection pages on GitHub	Ruby	0	0	\N	0	2019-04-09 19:23:31	2019-04-09 19:23:34	2019-04-19 13:26:56
201459122	11ty.io	176	https://github.com/charlesroper/11ty.io	Documentation site for the Eleventy static site generator.	CSS	0	0	\N	0	2019-08-09 09:00:06	2019-08-09 09:00:09	2019-08-08 19:03:14
32050733	AngularJS_Basic	176	https://github.com/charlesroper/AngularJS_Basic	A simple, experimental AngularJS project.	HTML	0	0	\N	0	2015-03-11 22:34:35	2015-05-04 08:29:59	2015-06-11 05:09:40
198513086	awesome-stock-resources	176	https://github.com/charlesroper/awesome-stock-resources	:city_sunrise: A collection of links for free stock photography, video and Illustration websites	\N	1	0	\N	0	2019-07-23 18:49:13	2019-08-02 05:28:43	2019-08-02 05:28:40
84762273	Bottles.NET	176	https://github.com/charlesroper/Bottles.NET	99 Bottles of OOP in C# and .NET	C#	0	0	\N	0	2017-03-12 19:31:06	2017-03-12 20:23:59	2017-03-17 20:50:08
38785021	CSharp-Fundamentals	176	https://github.com/charlesroper/CSharp-Fundamentals	Playground for Scott Allen's C# Fundamentals Pluralsight course	C#	0	0	\N	0	2015-07-08 20:17:46	2016-07-24 17:45:45	2016-07-24 17:45:44
8120604	discourse	176	https://github.com/charlesroper/discourse	A platform for community discussion. Free, open, simple.	JavaScript	0	0	\N	0	2013-02-10 06:43:30	2013-02-11 20:47:53	2013-02-10 06:44:59
3347190	Djaneiro	176	https://github.com/charlesroper/Djaneiro	Django support for Sublime Text 2	\N	0	0	\N	1	2012-02-03 16:50:05	2013-01-07 15:59:45	2012-02-03 16:57:36
1831567	DobDark-Theme	176	https://github.com/charlesroper/DobDark-Theme	A dark and vibrant syntax theme for Sublime Text.	\N	5	0	\N	8	2011-06-01 09:31:34	2015-01-29 15:08:27	2015-01-29 15:08:27
844250	e2-Zen-Coding-bundle	176	https://github.com/charlesroper/e2-Zen-Coding-bundle	Zen Coding bundle for e2	Python	0	0	\N	1	2010-08-17 14:45:19	2014-03-26 11:27:57	2010-08-17 16:55:52
70088367	geek-mental-help-week	176	https://github.com/charlesroper/geek-mental-help-week	\N	HTML	0	0	\N	0	2016-10-05 15:39:35	2016-10-05 15:39:36	2016-10-05 18:17:26
45702829	github-for-developers-7	176	https://github.com/charlesroper/github-for-developers-7	\N	\N	0	4	\N	0	2015-11-06 17:30:58	2015-11-06 17:30:58	2015-11-06 17:31:04
12018398	guard-jekyll-plus	176	https://github.com/charlesroper/guard-jekyll-plus	A Guard plugin for smarter Jekyll builds	Ruby	0	0	\N	0	2013-08-10 06:08:24	2013-09-11 00:55:22	2013-08-10 06:31:26
40630229	html_elements	176	https://github.com/charlesroper/html_elements	Template using all the HTML elements	HTML	1	0	\N	0	2015-08-12 21:05:48	2015-08-12 21:05:49	2015-08-12 19:08:08
208668555	hylia	176	https://github.com/charlesroper/hylia	Hylia is a lightweight Eleventy starter kit to help you to create your own blog or personal website.	HTML	0	0	\N	0	2019-09-15 20:00:58	2019-09-15 20:09:47	2019-09-15 20:09:45
215058015	IMD-Postcode-Checker	176	https://github.com/charlesroper/IMD-Postcode-Checker	The IMD Postcode Checker is a tiny thing made with lean but boring code, open data, and plenty of ❤️.	PHP	0	0	\N	2	2019-10-14 10:56:39	2020-12-04 20:49:32	2020-12-04 20:49:30
9673563	irecord-training	176	https://github.com/charlesroper/irecord-training	Training documentation for iRecord	Python	0	0	\N	0	2013-04-25 11:23:45	2013-04-25 11:23:45	2013-04-23 05:13:34
80919510	JavaScript30	176	https://github.com/charlesroper/JavaScript30	30 Day Vanilla JS Challenge	HTML	0	0	\N	0	2017-02-04 10:59:08	2017-02-04 10:59:10	2017-02-02 21:02:53
79747892	letter	176	https://github.com/charlesroper/letter	Letter is a simple, highly customizable tool to create letters in your browser.	PHP	0	0	\N	0	2017-01-22 19:44:42	2017-01-22 19:44:44	2017-01-22 14:24:26
4866407	livecss	176	https://github.com/charlesroper/livecss	Live css and sisters colorizing	Python	0	0	\N	1	2012-07-02 21:20:00	2013-01-10 20:47:26	2012-04-19 20:37:17
176750	mapmate-to-recorder	176	https://github.com/charlesroper/mapmate-to-recorder	SQL Queries and other paraphernalia for exporting data from Mapmate to Recorder	\N	0	0	\N	2	2009-04-15 12:53:42	2019-08-13 11:18:13	2015-02-10 13:19:54
4826595	MarkdownEditing	176	https://github.com/charlesroper/MarkdownEditing	Better Markdown editing for Sublime Text 2	Python	1	0	\N	1	2012-06-28 19:46:40	2013-11-19 11:33:34	2013-03-11 19:56:45
314249886	MSEdgeExplainers	176	https://github.com/charlesroper/MSEdgeExplainers	Home for explainer documents originated by the Microsoft Edge team	\N	0	0	\N	0	2020-11-19 10:03:31	2020-11-19 10:03:33	2020-11-16 16:16:24
15090012	OmniMarkupPreviewer	176	https://github.com/charlesroper/OmniMarkupPreviewer	Sublime Text 2&3 plugin to live preview markup files, supported (not limited to) markup formats are markdown, reStructuredText, WikiCreole and textile.	Python	0	0	\N	0	2013-12-10 19:31:16	2013-12-12 05:24:24	2013-12-10 19:54:16
14798757	OSGB_Grids	176	https://github.com/charlesroper/OSGB_Grids	A collection of Ordance Survey National Grids in Shapefile [OSGB 1936] and GeoJSON [WGS84] formats.	\N	15	3	\N	32	2013-11-29 08:37:00	2020-12-28 08:24:41	2015-03-27 20:05:04
5111484	package_control_channel	176	https://github.com/charlesroper/package_control_channel	The default channel file for the Sublime Package Control package manager. Fork, add your repository and send a pull request.	\N	0	0	\N	1	2012-07-19 12:04:43	2013-01-11 05:23:38	2012-07-19 12:11:27
7097771	pelican	176	https://github.com/charlesroper/pelican	Static blog generator in Python, using Markdown/reST syntax	Python	0	0	\N	0	2012-12-10 15:50:41	2013-01-13 12:28:32	2012-12-09 05:30:43
6230768	python_koans	176	https://github.com/charlesroper/python_koans	Python Koans - Learn Python through TDD	Python	0	0	\N	0	2012-10-15 14:05:32	2014-07-30 07:20:11	2014-07-30 07:20:10
4349707	rack-livereload	176	https://github.com/charlesroper/rack-livereload	Bring in livereload.js into handy Rack middleware	JavaScript	0	0	\N	1	2012-05-16 14:22:02	2013-01-09 03:10:55	2012-03-06 16:40:23
9396380	Recorder-6-SQL	176	https://github.com/charlesroper/Recorder-6-SQL	A repository of general and miscellaneous T-SQL queries for Recorder and NBN Data.	\N	0	0	\N	0	2013-04-12 11:42:14	2015-01-12 09:50:10	2015-02-27 07:16:20
325434	ruby-sass-tmbundle	176	https://github.com/charlesroper/ruby-sass-tmbundle	Sass bundle for TextMate compatible editors, including E Text Editor	Ruby	6	0	\N	68	2009-10-03 08:16:13	2020-07-25 00:29:41	2010-10-21 18:00:25
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, login, url, avatar_url, name, email, hireable, company, location, blog, bio, public_repos, public_gists, followers, following, created_at, updated_at) FROM stdin;
1	mojombo	https://api.github.com/users/mojombo	https://avatars.githubusercontent.com/u/1?v=4	Tom Preston-Werner	tom@mojombo.com	\N	@chatterbugapp, @redwoodjs, @preston-werner-ventures 	San Francisco	http://tom.preston-werner.com	\N	62	62	22323	11	2007-10-20 03:24:19	2021-01-12 12:53:34
2	defunkt	https://api.github.com/users/defunkt	https://avatars.githubusercontent.com/u/2?v=4	Chris Wanstrath	\N	\N	\N	\N	http://chriswanstrath.com/	🍔	107	273	21127	210	2007-10-20 03:24:19	2019-11-01 18:56:00
3	pjhyett	https://api.github.com/users/pjhyett	https://avatars.githubusercontent.com/u/3?v=4	PJ Hyett	pj@hyett.com	\N	GitHub, Inc.	San Francisco	https://hyett.com	\N	8	21	8211	30	2008-01-07 15:54:22	2020-12-08 16:24:23
4	wycats	https://api.github.com/users/wycats	https://avatars.githubusercontent.com/u/4?v=4	Yehuda Katz	wycats@gmail.com	\N	Tilde, Inc.	San Francisco	http://yehudakatz.com	\N	232	753	9739	4	2008-01-12 03:38:33	2021-01-28 10:11:55
5	ezmobius	https://api.github.com/users/ezmobius	https://avatars.githubusercontent.com/u/5?v=4	Ezra Zygmuntowicz	\N	\N	Stuffstr PBC	In the NW	http://stuffstr.com	\N	22	106	509	13	2008-01-12 05:51:46	2021-01-22 12:26:10
6	ivey	https://api.github.com/users/ivey	https://avatars.githubusercontent.com/u/6?v=4	Michael D. Ivey	ivey@gweezlebur.com	\N	@RiotGames 	Tuscumbia, AL	http://gweezlebur.com	\N	88	79	117	2	2008-01-12 13:15:00	2021-01-22 12:26:10
7	evanphx	https://api.github.com/users/evanphx	https://avatars.githubusercontent.com/u/7?v=4	Evan Phoenix	evan@phx.io	\N	@hashicorp 	Los Angeles, CA	http://blog.fallingsnow.net	\N	155	441	1366	6	2008-01-12 14:46:24	2021-01-27 22:10:02
17	vanpelt	https://api.github.com/users/vanpelt	https://avatars.githubusercontent.com/u/17?v=4	Chris Van Pelt	vanpelt@gmail.com	\N	crowdflower.com	San Francisco	wandb.com	\N	56	49	145	15	2008-01-13 03:57:18	2021-01-19 17:45:52
18	wayneeseguin	https://api.github.com/users/wayneeseguin	https://avatars.githubusercontent.com/u/18?v=4	Wayne E. Seguin	wayneeseguin@gmail.com	\N	http://starkandwayne.com/	Buffalo, NY		\N	97	95	699	17	2008-01-13 04:02:21	2021-01-22 12:26:10
19	brynary	https://api.github.com/users/brynary	https://avatars.githubusercontent.com/u/19?v=4	Bryan Helmkamp	\N	\N	Code Climate	New York City	http://codeclimate.com	Co-founder and CEO, Code Climate	165	68	633	27	2008-01-13 08:19:47	2021-01-08 19:36:03
20	kevinclark	https://api.github.com/users/kevinclark	https://avatars.githubusercontent.com/u/20?v=4	Kevin Clark	kevin.clark@gmail.com	\N	Cue	\N	http://glu.ttono.us	\N	35	30	91	4	2008-01-13 16:33:26	2021-01-13 14:56:00
21	technoweenie	https://api.github.com/users/technoweenie	https://avatars.githubusercontent.com/u/21?v=4	risk danger olson	technoweenie@hey.com	\N	\N	Colorado		:metal:	176	106	2544	17	2008-01-14 02:33:35	2021-01-12 10:49:43
22	macournoyer	https://api.github.com/users/macournoyer	https://avatars.githubusercontent.com/u/22?v=4	Marc-André Cournoyer	macournoyer@gmail.com	\N	@Shopify 	Montreal, QC, Canada	http://macournoyer.com	I enjoy walks in the park, VMs, neural nets, servers, anything with a loop.	59	55	1104	51	2008-01-14 08:49:35	2021-01-27 11:15:00
23	takeo	https://api.github.com/users/takeo	https://avatars.githubusercontent.com/u/23?v=4	Toby Sterrett	tobysterrett@gmail.com	\N	@zendesk 	Portland, OR	https://zendesk.com/	\N	19	11	81	11	2008-01-14 09:25:49	2021-01-21 21:52:12
25	caged	https://api.github.com/users/caged	https://avatars.githubusercontent.com/u/25?v=4	Justin Palmer	encytemedia@gmail.com	\N	labratrevenge	Portland, OR	http://labratrevenge.com	A series of hacks. Previously @github. \r\n	143	99	2177	43	2008-01-15 02:47:24	2021-01-23 15:07:16
26	topfunky	https://api.github.com/users/topfunky	https://avatars.githubusercontent.com/u/26?v=4	Geoffrey Grosenbach	\N	\N	@hashicorp 	Seattle, USA	https://topfunky.com	Entrepreneur, developer, designer, teacher, athlete. Currently: Director of Education Engineering at @hashicorp. Previously: PeepCode, Pluralsight	72	44	1235	225	2008-01-15 03:40:05	2021-01-27 16:30:40
27	anotherjesse	https://api.github.com/users/anotherjesse	https://avatars.githubusercontent.com/u/27?v=4	Jesse Andrews	anotherjesse@gmail.com	\N	Planet Labs	San Francisco, CA	http://overstimulate.com	\N	109	60	159	35	2008-01-15 05:49:30	2021-01-16 21:23:37
28	roland	https://api.github.com/users/roland	https://avatars.githubusercontent.com/u/28?v=4	Roland	\N	\N	\N	Tirana	http://rolandmai.com/	\N	7	0	18	1	2008-01-15 06:12:51	2021-01-11 02:24:50
29	lukas	https://api.github.com/users/lukas	https://avatars.githubusercontent.com/u/29?v=4	Lukas Biewald	\N	\N	Weights and Biases	San Francisco	lukasbiewald.com	Founder of wandb.com	30	12	440	16	2008-01-15 10:50:02	2021-01-20 20:49:50
30	fanvsfan	https://api.github.com/users/fanvsfan	https://avatars.githubusercontent.com/u/30?v=4	\N	\N	\N	\N	\N		\N	0	0	22	0	2008-01-15 12:15:23	2020-11-06 01:42:37
31	tomtt	https://api.github.com/users/tomtt	https://avatars.githubusercontent.com/u/31?v=4	Tom ten Thij	\N	true	Freelance	Amsterdam	tomtenthij.nl	\N	81	241	38	12	2008-01-15 13:44:31	2021-01-26 08:31:01
32	railsjitsu	https://api.github.com/users/railsjitsu	https://avatars.githubusercontent.com/u/32?v=4	\N	\N	\N	\N	\N		\N	0	0	15	0	2008-01-16 02:57:23	2015-04-09 16:38:43
34	nitay	https://api.github.com/users/nitay	https://avatars.githubusercontent.com/u/34?v=4	Nitay Joffe	\N	\N	\N	\N		\N	7	2	40	0	2008-01-18 12:09:11	2021-01-19 23:41:46
35	kevwil	https://api.github.com/users/kevwil	https://avatars.githubusercontent.com/u/35?v=4	Kevin Williams	\N	\N	Oracle	Broomfield, CO	https://kevwil.github.io/	I enjoy learning, solving problems, and being free to do my own thing.	41	15	41	21	2008-01-19 03:50:12	2020-11-25 14:11:45
36	KirinDave	https://api.github.com/users/KirinDave	https://avatars.githubusercontent.com/u/36?v=4	Dave Fayram	\N	\N	Google	San Francisco, CA	http://kirindave.tumblr.com	No.	74	97	388	10	2008-01-19 06:01:02	2021-01-04 17:31:38
37	jamesgolick	https://api.github.com/users/jamesgolick	https://avatars.githubusercontent.com/u/37?v=4	James Golick	jamesgolick@gmail.com	\N	Normal	New York	http://jamesgolick.com	\N	110	114	612	30	2008-01-19 20:52:30	2019-06-04 21:04:42
38	atmos	https://api.github.com/users/atmos	https://avatars.githubusercontent.com/u/38?v=4	Corey Donohoe	atmos@atmos.org	\N	\N	NYC / South Lake Tahoe	http://www.atmos.org	\N	168	178	1204	166	2008-01-22 07:14:11	2021-01-21 21:14:05
44	errfree	https://api.github.com/users/errfree	https://avatars.githubusercontent.com/u/44?v=4	\N	\N	\N	\N	\N		\N	2	0	0	0	2008-01-24 00:08:37	2020-05-13 03:35:19
45	mojodna	https://api.github.com/users/mojodna	https://avatars.githubusercontent.com/u/45?v=4	Seth Fitzsimmons	seth@mojodna.net	\N	AWS	Bend, OR	http://mojodna.net/	\N	310	80	517	114	2008-01-24 02:40:22	2021-01-25 14:18:00
46	bmizerany	https://api.github.com/users/bmizerany	https://avatars.githubusercontent.com/u/46?v=4	Blake Mizerany	blake.mizerany@gmail.com	\N	\N	\N		\N	157	166	1284	19	2008-01-24 02:44:30	2021-01-22 19:54:41
47	jnewland	https://api.github.com/users/jnewland	https://avatars.githubusercontent.com/u/47?v=4	Jesse Newland	jesse@jnewland.com	true	\N	Austin, TX	http://jnewland.com	💻 🔧 	118	41	678	93	2008-01-25 00:28:12	2021-01-24 14:53:44
48	joshknowles	https://api.github.com/users/joshknowles	https://avatars.githubusercontent.com/u/48?v=4	Josh Knowles	joshknowles@gmail.com	\N	@pivotal	Austin, TX	http://joshknowles.com	\N	9	3	106	43	2008-01-25 19:30:42	2020-06-12 15:05:36
49	hornbeck	https://api.github.com/users/hornbeck	https://avatars.githubusercontent.com/u/49?v=4	John Hornbeck	hornbeck@gmail.com	true	Hashicorp	Lawton, OK	twitter.com/hornbeck	\N	8	35	70	35	2008-01-25 19:49:23	2020-11-30 13:37:25
50	jwhitmire	https://api.github.com/users/jwhitmire	https://avatars.githubusercontent.com/u/50?v=4	Jeff Whitmire	jeff@jwhitmire.com	\N	@stitchfix 	Rochester, NY	http://jwhitmire.com	I like my codez shaken with a twist.	37	18	43	51	2008-01-25 20:07:48	2021-01-20 23:18:35
51	elbowdonkey	https://api.github.com/users/elbowdonkey	https://avatars.githubusercontent.com/u/51?v=4	Michael Buffington	\N	\N	\N	Portland, OR	http://collusioni.st	\N	45	4	26	9	2008-01-25 20:08:20	2020-11-19 18:58:47
52	reinh	https://api.github.com/users/reinh	https://avatars.githubusercontent.com/u/52?v=4	Rein Henrichs	\N	\N	\N	Portland, OR	http://reinh.com	\N	207	183	192	1	2008-01-25 20:16:29	2021-01-12 20:06:31
53	knzconnor	https://api.github.com/users/knzconnor	https://avatars.githubusercontent.com/u/53?v=4	Kenzi Connor	kenzi@cloudcity.io	true	Cloud City Development	Berkeley, CA	http://www.cloudcity.io	CEO Cloud City. Rubyist and js.	29	53	57	10	2008-01-25 20:33:10	2020-10-14 20:39:36
68	bs	https://api.github.com/users/bs	https://avatars.githubusercontent.com/u/68?v=4	Britt Selvitelle	yap@bri.tt	\N	\N	San Fransico, CA	https://bri.tt	\N	31	16	119	49	2008-01-26 23:46:29	2021-01-27 09:37:03
69	rsanheim	https://api.github.com/users/rsanheim	https://avatars.githubusercontent.com/u/69?v=4	Rob Sanheim	\N	\N	\N	Madison, WI, NORTH AMERICA	https://github.com/rsanheim	\N	44	43	178	28	2008-01-27 05:09:47	2021-01-29 17:44:24
70	schacon	https://api.github.com/users/schacon	https://avatars.githubusercontent.com/u/70?v=4	Scott Chacon	schacon@gmail.com	\N	@chatterbugapp 	Berlin, Germany	http://scottchacon.com	\N	191	89	12503	24	2008-01-27 15:19:28	2021-01-21 07:53:33
71	uggedal	https://api.github.com/users/uggedal	https://avatars.githubusercontent.com/u/71?v=4	Eivind Uggedal	\N	true	@vippsas 	Oslo, Norway	http://uggedal.com	I was the 71th to register here	63	42	172	0	2008-01-27 20:18:57	2021-01-28 12:26:10
72	bruce	https://api.github.com/users/bruce	https://avatars.githubusercontent.com/u/72?v=4	Bruce Williams	bruce@github.com	\N	@github	Portland, OR	http://bruce.io	Polyglot programmer, co-creator of Absinthe, the GraphQL toolkit for Elixir.	115	86	292	20	2008-01-28 05:16:45	2020-12-23 00:34:07
73	sam	https://api.github.com/users/sam	https://avatars.githubusercontent.com/u/73?v=4	Sam Smoot	ssmoot@gmail.com	true	Wieck Media	Dallas, TX	http://www.ssmoot.me	\N	40	107	161	5	2008-01-28 17:01:26	2021-01-25 19:01:06
74	mmower	https://api.github.com/users/mmower	https://avatars.githubusercontent.com/u/74?v=4	Matt Mower	self@mattmower.com	\N	The Art of Navigation	Berkshire, England	http://theartofnavigation.co.uk/	\N	73	126	57	1	2008-01-28 17:47:50	2021-01-21 10:56:50
75	abhay	https://api.github.com/users/abhay	https://avatars.githubusercontent.com/u/75?v=4	Abhay Kumar	\N	\N	\N	San Francisco, CA	https://hackshare.com	\N	35	16	63	0	2008-01-28 19:08:23	2021-01-08 12:35:09
76	rabble	https://api.github.com/users/rabble	https://avatars.githubusercontent.com/u/76?v=4	rabble	evan@protest.net	true	Hacker turned manager type	MVD	http://planetary.social/	Founder & CEO of Planetary	26	1	177	38	2008-01-28 21:27:02	2021-01-28 08:58:19
77	benburkert	https://api.github.com/users/benburkert	https://avatars.githubusercontent.com/u/77?v=4	Ben Burkert	ben@benburkert.com	\N	\N	NYC	https://benburkert.com	\N	128	37	167	7	2008-01-28 21:44:14	2021-01-19 16:33:46
78	indirect	https://api.github.com/users/indirect	https://avatars.githubusercontent.com/u/78?v=4	André Arko	andre@arko.net	true	\N	San Francisco	https://arko.net	\N	221	119	897	9	2008-01-29 05:59:27	2021-01-30 06:23:20
79	fearoffish	https://api.github.com/users/fearoffish	https://avatars.githubusercontent.com/u/79?v=4	Jamie van Dyke	jamie@fearoffish.com	true	Fear of Fish	Skipton, UK	http://www.jamievandyke.com/	\N	135	49	36	6	2008-01-29 06:43:10	2021-01-29 15:30:32
80	ry	https://api.github.com/users/ry	https://avatars.githubusercontent.com/u/80?v=4	Ryan Dahl	ry@tinyclouds.org	\N	@denoland 	New York City	http://tinyclouds.org/	\N	38	301	23960	37	2008-01-29 06:50:34	2021-01-29 15:11:02
81	engineyard	https://api.github.com/users/engineyard	https://avatars.githubusercontent.com/u/81?v=4	Engine Yard, Inc.	\N	\N	\N	San Francisco, CA	https://www.engineyard.com	\N	312	25	0	0	2008-01-29 07:51:30	2021-01-07 00:19:46
82	jsierles	https://api.github.com/users/jsierles	https://avatars.githubusercontent.com/u/82?v=4	Joshua Sierles	joshua@joshua.si	true	\N	Sevilla, Spain	https://joshua.si	Tech generalist fighting complexity	156	315	218	0	2008-01-29 09:10:25	2021-01-17 19:17:55
83	tweibley	https://api.github.com/users/tweibley	https://avatars.githubusercontent.com/u/83?v=4	Taylor Weibley	\N	\N	37signals	Florida		\N	12	10	40	2	2008-01-29 11:52:07	2020-06-01 10:46:27
84	peimei	https://api.github.com/users/peimei	https://avatars.githubusercontent.com/u/84?v=4	E. James O'Kelly	james@railsjitsu.com	\N	RailsJitsu, llc.	Palm Springs, CA	http://www.railsjitsu.com	\N	5	0	7	0	2008-01-29 13:44:11	2019-12-15 01:28:34
85	brixen	https://api.github.com/users/brixen	https://avatars.githubusercontent.com/u/85?v=4	Brian Shirai	brian@rubinius.com	true	Rubinius, Inc	Portland, OR	http://rubinius.com	\N	124	1115	328	4	2008-01-29 14:47:55	2020-08-18 14:34:10
87	tmornini	https://api.github.com/users/tmornini	https://avatars.githubusercontent.com/u/87?v=4	Tom Mornini	tom@subledger.com	\N	Subledger	San Francisco	http://subledger.com	\N	15	21	45	7	2008-01-29 16:43:39	2020-11-28 02:49:43
88	outerim	https://api.github.com/users/outerim	https://avatars.githubusercontent.com/u/88?v=4	Lee Jensen	lee@outerim.com	\N	Big Cartel	SL,UT	outerim.tumblr.com	\N	22	10	18	1	2008-01-29 16:48:32	2021-01-21 14:48:43
89	daksis	https://api.github.com/users/daksis	https://avatars.githubusercontent.com/u/89?v=4	R	\N	\N	Thunderbolt Labs	San Francisco, CA, USA	thunderboltlabs.com	\N	5	8	59	27	2008-01-29 17:18:16	2020-12-09 19:05:07
90	sr	https://api.github.com/users/sr	https://avatars.githubusercontent.com/u/90?v=4	Simon Rozet	me@simonrozet.com	true	@salesforce	Europe	http://atonie.org	\N	130	55	530	195	2008-01-29 18:37:53	2021-01-25 19:32:25
91	lifo	https://api.github.com/users/lifo	https://avatars.githubusercontent.com/u/91?v=4	Pratik	pratiknaik@gmail.com	\N	Basecamp	Allen, TX		\N	16	86	595	54	2008-01-29 21:09:30	2021-01-20 11:47:07
92	rsl	https://api.github.com/users/rsl	https://avatars.githubusercontent.com/u/92?v=4	Russell Norris	sconds@gmail.com	\N	@fracturedatlas	Atlanta, GA	http://luckysneaks.com/	\N	35	117	61	9	2008-01-29 21:13:36	2021-01-25 12:38:15
93	imownbey	https://api.github.com/users/imownbey	https://avatars.githubusercontent.com/u/93?v=4	Ian Ownbey	ian.ownbey@coinbase.com	\N	\N	San Francisco, CA	http://twitter.com/iano	\N	55	44	66	66	2008-01-29 21:13:44	2021-01-21 19:30:12
94	dylanegan	https://api.github.com/users/dylanegan	https://avatars.githubusercontent.com/u/94?v=4	Dylan Egan	\N	\N	\N	Sydney, Australia	http://dylanegan.com	\N	54	32	112	0	2008-01-29 21:15:18	2021-01-21 18:41:36
95	jm	https://api.github.com/users/jm	https://avatars.githubusercontent.com/u/95?v=4	Jeremy McAnally	jeremymcanally@gmail.com	\N	@sequoiacapital	Orlando, FL	http://jeremymcanally.com	I make stuff.	123	62	492	31	2008-01-29 21:15:32	2021-01-12 16:00:00
100	kmarsh	https://api.github.com/users/kmarsh	https://avatars.githubusercontent.com/u/100?v=4	Kevin Marsh	kevin.marsh@gmail.com	\N	\N	Toledo, OH	https://kevinmarsh.com	\N	53	30	50	18	2008-01-29 21:48:24	2021-01-15 15:28:11
101	jvantuyl	https://api.github.com/users/jvantuyl	https://avatars.githubusercontent.com/u/101?v=4	Jayson Vantuyl	jayson@aggressive.ly	true	\N	San Francisco, California, USA	http://souja.net	\N	59	15	40	12	2008-01-29 23:11:50	2021-01-22 02:19:00
102	BrianTheCoder	https://api.github.com/users/BrianTheCoder	https://avatars.githubusercontent.com/u/102?v=4	Brian Smith	wbsmith83@gmail.com	\N	DSTLD	Santa Monica,CA	http://brianthecoder.com	\N	109	184	80	32	2008-01-30 00:22:32	2020-11-06 01:09:16
103	freeformz	https://api.github.com/users/freeformz	https://avatars.githubusercontent.com/u/103?v=4	Edward Muller	edward_muller@icloud.com	\N	Fastly	West Linn, OR	http://icanhazdowntime.org	SEM @Fastly  -  Formerly @SalesForce/@Heroku, @engineyard, Interlix, Geekerz, @learningpatterns & UBS (Via PaineWebber)	211	72	181	27	2008-01-30 04:19:57	2021-01-29 21:21:44
104	hassox	https://api.github.com/users/hassox	https://avatars.githubusercontent.com/u/104?v=4	Daniel Neighman	dneighman@gmail.com	\N	@atomic-labs	San Francisco		\N	155	113	331	74	2008-01-30 04:31:06	2021-01-27 14:18:21
105	automatthew	https://api.github.com/users/automatthew	https://avatars.githubusercontent.com/u/105?v=4	automatthew	automatthew@gmail.com	\N	\N	\N		\N	21	13	69	16	2008-01-30 17:00:58	2021-01-02 19:58:33
106	queso	https://api.github.com/users/queso	https://avatars.githubusercontent.com/u/106?v=4	Josh Owens	Joshua.owens@gmail.com	true	Kickstand	Cincinnati, Oh	http://joshowens.dev/	\N	80	106	333	23	2008-01-30 17:48:45	2021-01-25 16:02:50
107	lancecarlson	https://api.github.com/users/lancecarlson	https://avatars.githubusercontent.com/u/107?v=4	Lance Carlson	\N	true	HealPay	Ann Arbor, MI	http://www.healpay.com	\N	126	34	87	97	2008-01-30 17:53:29	2021-01-20 00:39:49
108	drnic	https://api.github.com/users/drnic	https://avatars.githubusercontent.com/u/108?v=4	Dr Nic Williams	drnicwilliams@gmail.com	\N	Stark & Wayne LLC @starkandwayne 	Brisbane, Australia	http://starkandwayne.com	CEO of Stark & Wayne, Cloud Foundry Champion	632	252	1654	10	2008-01-30 21:19:18	2021-01-17 02:02:10
109	lukesutton	https://api.github.com/users/lukesutton	https://avatars.githubusercontent.com/u/109?v=4	Luke Matthew Sutton	\N	\N	\N	South Australia	lukematthewsutton.com	\N	15	59	37	4	2008-01-31 02:01:02	2021-01-18 23:55:26
110	danwrong	https://api.github.com/users/danwrong	https://avatars.githubusercontent.com/u/110?v=4	Dan Webb	\N	\N	Twitter	London	http://danwebb.net	\N	32	37	319	31	2008-01-31 06:51:31	2019-12-06 13:02:47
111	hcatlin	https://api.github.com/users/hcatlin	https://avatars.githubusercontent.com/u/111?v=4	Hampton Catlin	hampton@hamptoncatlin.com	true	@VeueLive	New York, NY		\r\n    I invent stuff and make jokes.\r\n	68	36	588	5	2008-01-31 15:03:51	2021-01-25 09:43:56
112	jfrost	https://api.github.com/users/jfrost	https://avatars.githubusercontent.com/u/112?v=4	Jeff Frost	\N	\N	Procore Technologies	\N		\N	7	63	11	0	2008-01-31 20:14:27	2020-12-08 11:41:50
113	mattetti	https://api.github.com/users/mattetti	https://avatars.githubusercontent.com/u/113?v=4	Matt Aimonetti	\N	\N	@Splice	Los Angeles, CA	https://matt.aimonetti.net	Splice cofounder	279	349	964	9	2008-01-31 20:56:31	2021-01-29 01:01:44
114	ctennis	https://api.github.com/users/ctennis	https://avatars.githubusercontent.com/u/114?v=4	Caleb Tennis	c@leb.tennis	\N	\N	Columbus Indiana	https://caleb.tennis	\N	23	8	21	0	2008-01-31 21:43:14	2021-01-28 17:58:44
115	lawrencepit	https://api.github.com/users/lawrencepit	https://avatars.githubusercontent.com/u/115?v=4	Lawrence Pit	lawrence.pit@gmail.com	\N	\N	\N		\N	27	30	22	6	2008-01-31 21:57:16	2021-01-25 20:03:16
116	marcjeanson	https://api.github.com/users/marcjeanson	https://avatars.githubusercontent.com/u/116?v=4	Marc Jeanson	github@marcjeanson.com	\N	Redline Software Inc.	\N	redlinesoftware.com	\N	34	6	33	15	2008-01-31 23:27:19	2020-11-30 22:47:13
117	grempe	https://api.github.com/users/grempe	https://avatars.githubusercontent.com/u/117?v=4	Glenn Rempe	\N	\N	\N	San Francisco, CA	https://www.rempe.us/	Dad, traveler, programmer, Startup CEO, interested in cryptography, blockchain, security, integrity. xVP @Tierion; @accenture; http://keybase.io/grempe	32	9	88	11	2008-02-01 02:12:42	2021-01-04 12:34:46
118	peterc	https://api.github.com/users/peterc	https://avatars.githubusercontent.com/u/118?v=4	Peter Cooper	git@peterc.org	\N	@realCooperpress 	United Kingdom	http://twitter.com/peterc	\N	53	180	628	34	2008-02-01 23:00:36	2021-01-15 08:11:12
119	ministrycentered	https://api.github.com/users/ministrycentered	https://avatars.githubusercontent.com/u/119?v=4	Ministry Centered Technologies	\N	\N	\N	Carlsbad, CA	https://planning.center	\N	91	2	0	0	2008-02-02 01:50:26	2021-01-04 15:51:46
120	afarnham	https://api.github.com/users/afarnham	https://avatars.githubusercontent.com/u/120?v=4	Aaron Farnham	\N	\N	@foreflight 	Houston, TX		\N	36	12	24	20	2008-02-02 03:11:03	2021-01-27 14:09:31
121	up_the_irons	https://api.github.com/users/up_the_irons	https://avatars.githubusercontent.com/u/121?v=4	Garry Dolley	\N	\N	ARP Networks, Inc.	Los Angeles	https://arpnetworks.com	\N	32	4	29	1	2008-02-02 08:59:51	2021-01-19 07:20:16
122	cristibalan	https://api.github.com/users/cristibalan	https://avatars.githubusercontent.com/u/122?v=4	Cristi Balan	cristibalan@gmail.com	true	\N	Bucharest		\N	24	18	77	35	2008-02-02 09:29:45	2021-01-27 20:13:47
123	heavysixer	https://api.github.com/users/heavysixer	https://avatars.githubusercontent.com/u/123?v=4	Mark Daggett	\N	true	Humansized Inc.	Kansas City	http://www.humansized.com	\N	46	27	81	36	2008-02-02 13:06:53	2021-01-13 12:42:26
124	brosner	https://api.github.com/users/brosner	https://avatars.githubusercontent.com/u/124?v=4	Brian Rosner	brosner@gmail.com	\N	Reddit, Inc.	Denver, CO	https://brosner.com	Senior Software Engineer / Infrastructure	112	22	825	109	2008-02-02 17:03:54	2020-12-08 09:39:27
125	danielmorrison	https://api.github.com/users/danielmorrison	https://avatars.githubusercontent.com/u/125?v=4	Daniel Morrison	daniel@collectiveidea.com	\N	Collective Idea @collectiveidea 	Holland, MI	http://daniel.collectiveidea.com/blog	Founder of @collectiveidea.	22	21	105	19	2008-02-02 17:46:35	2021-01-25 14:05:56
126	danielharan	https://api.github.com/users/danielharan	https://avatars.githubusercontent.com/u/126?v=4	Daniel Haran	chebuctonian@gmail.com	true	\N	Montreal, QC, Canada	http://danielharan.com/	\N	33	31	81	36	2008-02-02 19:42:21	2021-01-22 12:26:10
127	kvnsmth	https://api.github.com/users/kvnsmth	https://avatars.githubusercontent.com/u/127?v=4	Kevin Smith	\N	\N	\N	\N	https://kvnsmth.xyz	\N	33	16	110	97	2008-02-02 20:00:03	2021-01-26 22:13:27
128	collectiveidea	https://api.github.com/users/collectiveidea	https://avatars.githubusercontent.com/u/128?v=4	Collective Idea	\N	\N	\N	Holland, MI	https://collectiveidea.com	We build software to solve real problems.	160	7	0	0	2008-02-02 20:34:46	2020-07-08 10:52:16
129	canadaduane	https://api.github.com/users/canadaduane	https://avatars.githubusercontent.com/u/129?v=4	Duane Johnson	duane.johnson@gmail.com	\N	\N	Salt Lake City, UT, USA	http://keybase.io/canadaduane/	Artist, inventor, software engineer, hardware hacker, founder of Make Salt Lake and Relm.US, Inc.	182	51	107	18	2008-02-02 21:25:39	2021-01-28 15:29:51
130	nate	https://api.github.com/users/nate	https://avatars.githubusercontent.com/u/130?v=4	Nate Sutton	nate@sutton.me	\N	Outpace Systems	Milwaukee, WI	http://twitter.com/fowlduck	\N	101	72	61	2	2008-02-03 02:20:22	2021-01-30 00:26:26
131	dstrelau	https://api.github.com/users/dstrelau	https://avatars.githubusercontent.com/u/131?v=4	Dean Strelau	\N	\N	@honeycombio	Minneapolis, MN		I am the old man that yells at the cloud.	41	72	64	44	2008-02-03 12:59:12	2021-01-28 23:30:30
132	sunny	https://api.github.com/users/sunny	https://avatars.githubusercontent.com/u/132?v=4	Sunny Ripert	\N	\N	Cults.	Paris, France	http://sunfox.org/	The internets.	181	132	166	119	2008-02-03 13:43:43	2021-01-25 11:53:39
133	dkubb	https://api.github.com/users/dkubb	https://avatars.githubusercontent.com/u/133?v=4	Dan Kubb	github@dan.kubb.ca	true	Test Double	Mission, BC, Canada		\N	42	101	514	10	2008-02-03 18:40:13	2021-01-28 18:27:03
134	jnicklas	https://api.github.com/users/jnicklas	https://avatars.githubusercontent.com/u/134?v=4	Jonas Nicklas	jonas@jnicklas.com	\N	JNicklas Consulting	Gothenburg, Sweden	https://blog.jnicklas.com/	Freelance developer working with Rust, Elixir, Phoenix, Ruby, Rails, JavaScript among other things. Open source enthusiast. Dancer.	138	93	801	7	2008-02-03 18:43:50	2021-01-28 13:44:57
135	richcollins	https://api.github.com/users/richcollins	https://avatars.githubusercontent.com/u/135?v=4	Rich Collins	richcollins@gmail.com	\N	Cofactor Software	San Francisco	http://www.cofactorsoftware.com/	\N	25	56	48	4	2008-02-03 19:11:25	2021-01-14 13:06:30
136	simonjefford	https://api.github.com/users/simonjefford	https://avatars.githubusercontent.com/u/136?v=4	Simon Jefford	\N	\N	\N	Oxford, UK	http://sjjdev.com	\N	79	48	19	3	2008-02-03 19:35:34	2021-01-21 12:30:34
137	josh	https://api.github.com/users/josh	https://avatars.githubusercontent.com/u/137?v=4	Joshua Peek	\N	\N	\N	San Francisco, CA		\N	45	0	2332	167	2008-02-03 20:05:54	2021-01-12 14:36:57
138	stevedekorte	https://api.github.com/users/stevedekorte	https://avatars.githubusercontent.com/u/138?v=4	Steve Dekorte	steve@dekorte.com	\N	voluntary.net	San Francisco	http://dekorte.com	voluntary.net lead,\r\niolanguage.org author	14	0	626	9	2008-02-03 21:10:34	2020-12-08 19:54:30
139	leahneukirchen	https://api.github.com/users/leahneukirchen	https://avatars.githubusercontent.com/u/139?v=4	Leah Neukirchen	leah@vuxu.org	\N	\N	Munich, Germany	http://leahneukirchen.org/	she/her · they/them	138	8	900	8	2008-02-03 21:13:58	2021-01-22 12:26:10
140	cheapRoc	https://api.github.com/users/cheapRoc	https://avatars.githubusercontent.com/u/140?v=4	Justin Reagor	\N	true	\N	Philadelphia, PA	https://www.youtube.com/watch?v=LVfwKtZZpjQ	\N	69	163	45	10	2008-02-04 13:09:45	2021-01-11 12:43:16
141	technomancy	https://api.github.com/users/technomancy	https://avatars.githubusercontent.com/u/141?v=4	Phil Hagelberg	phil@hagelb.org	\N	\N	USA	https://technomancy.us/colophon	Tryin' to catch the last train out of Omelas. My newer code is on https://git.sr.ht/~technomancy	149	52	1913	0	2008-02-04 22:17:41	2021-01-26 00:19:00
142	kenphused	https://api.github.com/users/kenphused	https://avatars.githubusercontent.com/u/142?v=4	Ken Nordquist	\N	\N	\N	Orlando, FL	http://geekystuff.net	\N	2	1	6	0	2008-02-05 01:18:09	2021-01-30 13:46:34
143	rubyist	https://api.github.com/users/rubyist	https://avatars.githubusercontent.com/u/143?v=4	Scott Barron	\N	\N	\N	Ohio		I've narrowed the activity to terminal 23.	68	37	348	0	2008-02-05 13:03:25	2021-01-19 19:38:22
144	ogc	https://api.github.com/users/ogc	https://avatars.githubusercontent.com/u/144?v=4	OGC	\N	\N	\N	Nashville, TN	http://www.ogtastic.com/	\N	2	7	0	0	2008-02-05 15:24:58	2020-02-17 20:56:23
145	lazyatom	https://api.github.com/users/lazyatom	https://avatars.githubusercontent.com/u/145?v=4	James Adam	james@lazyatom.com	\N	@exciting-io 	London, UK	interblah.net	I'm interested in simple systems that produce & manage complex behaviours.	81	57	170	17	2008-02-05 21:18:56	2021-01-15 13:55:41
147	jdhuntington	https://api.github.com/users/jdhuntington	https://avatars.githubusercontent.com/u/147?v=4	JD Huntington	jdhuntington@gmail.com	\N	Microsoft	Redmond, WA	http://jdhuntington.com	\N	91	20	47	21	2008-02-06 16:33:55	2021-01-18 15:44:23
148	nwebb	https://api.github.com/users/nwebb	https://avatars.githubusercontent.com/u/148?v=4	\N	\N	\N	\N	\N		\N	0	0	4	0	2008-02-06 18:03:44	2018-02-10 06:05:35
149	nsutton	https://api.github.com/users/nsutton	https://avatars.githubusercontent.com/u/149?v=4	\N	\N	\N	\N	\N		\N	0	0	4	0	2008-02-06 18:40:02	2019-06-04 21:07:39
150	sevenwire	https://api.github.com/users/sevenwire	https://avatars.githubusercontent.com/u/150?v=4	Sevenwire	\N	\N	\N	Costa Mesa, CA	sevenwire.com	\N	14	1	0	0	2008-02-06 18:42:32	2019-11-24 03:56:08
151	brandonarbini	https://api.github.com/users/brandonarbini	https://avatars.githubusercontent.com/u/151?v=4	Brandon Arbini	b@arbini.dev	\N	\N	Costa Mesa, CA		\N	4	6	20	3	2008-02-06 19:03:05	2021-01-25 04:18:39
152	al3x	https://api.github.com/users/al3x	https://avatars.githubusercontent.com/u/152?v=4	Alex Payne	al3x@al3x.net	\N	\N	Portland, Oregon, USA	https://al3x.net/	\N	47	44	1054	53	2008-02-06 23:44:36	2021-01-27 17:37:08
153	toolmantim	https://api.github.com/users/toolmantim	https://avatars.githubusercontent.com/u/153?v=4	Tim Lucas	t@toolmantim.com	\N	\N	Melbourne, Australia	http://toolmantim.com	\N	95	104	384	64	2008-02-07 01:21:59	2021-01-19 08:05:01
154	nicksieger	https://api.github.com/users/nicksieger	https://avatars.githubusercontent.com/u/154?v=4	Nick Sieger	nick@nicksieger.com	\N	@sportngin 	Minneapolis, MN, USA	http://blog.nicksieger.com/	\N	73	224	219	14	2008-02-07 02:07:21	2021-01-20 15:16:46
155	jicksta	https://api.github.com/users/jicksta	https://avatars.githubusercontent.com/u/155?v=4	Jay Phillips	\N	true	\N	Austin, TX		\N	55	40	87	15	2008-02-07 02:09:16	2020-12-17 15:38:05
156	joshsusser	https://api.github.com/users/joshsusser	https://avatars.githubusercontent.com/u/156?v=4	Josh Susser	josh@hasmanythrough.com	\N	\N	San Francisco, CA	http://blog.hasmanythrough.com	\N	16	40	277	11	2008-02-07 02:09:59	2020-09-25 16:23:09
157	jcrosby	https://api.github.com/users/jcrosby	https://avatars.githubusercontent.com/u/157?v=4	Jon Crosby	jon@joncrosby.me	\N	Medium	SF Bay Area, CA	http://joncrosby.me	\N	28	13	181	17	2008-02-07 02:11:51	2021-01-27 14:57:27
158	thewoolleyman	https://api.github.com/users/thewoolleyman	https://avatars.githubusercontent.com/u/158?v=4	Chad Woolley	thewoolleyman@gmail.com	\N	\N	Tucson, AZ	http://thewoolleyweb.com	Professional full-stack polyglot coder/sysadmin for 25+ years, from mainframes to cloud computing.	189	58	102	47	2008-02-07 02:12:01	2021-01-09 19:08:15
159	technicalpickles	https://api.github.com/users/technicalpickles	https://avatars.githubusercontent.com/u/159?v=4	Josh Nichols	technicalpickles@github.com	\N	@github 	Savannah, GA	http://technicalpickles.com	\r\n    Principal Whimsy Engineer for myself, Staff Software Engineer for @github. Hobby hobbyist, husband, father, he/him\r\n	251	297	848	95	2008-02-07 03:38:06	2021-01-28 17:03:24
160	halbtuerke	https://api.github.com/users/halbtuerke	https://avatars.githubusercontent.com/u/160?v=4	Patrick	\N	\N	\N	\N	http://schreibloga.de	\N	73	42	38	32	2008-02-07 12:18:19	2021-01-10 12:38:49
161	ryanb	https://api.github.com/users/ryanb	https://avatars.githubusercontent.com/u/161?v=4	Ryan Bates	ryan@railscasts.com	\N	RailsCasts	Southern Oregon	http://railscasts.com	\N	55	62	7200	97	2008-02-07 20:42:25	2021-01-14 00:13:18
162	cnix	https://api.github.com/users/cnix	https://avatars.githubusercontent.com/u/162?v=4	Claude Nix	claude@seadated.com	\N	Holloman Hills Farm	Ivor, VA	hollomanhillsfarm.com	\N	22	22	27	15	2008-02-07 21:24:03	2020-11-24 09:09:38
163	tpitale	https://api.github.com/users/tpitale	https://avatars.githubusercontent.com/u/163?v=4	Tony Pitale	tpitale@gmail.com	true	@newrelic	Saint Louis, MO	http://tpitale.com	\N	38	101	111	70	2008-02-07 22:12:26	2020-12-22 20:10:50
164	cdcarter	https://api.github.com/users/cdcarter	https://avatars.githubusercontent.com/u/164?v=4	Christian Carter	christian.carter@salesforce.com	\N	Salesforce.com	\N	goslings.tech	\N	86	35	34	15	2008-02-08 01:54:32	2020-06-17 17:02:38
165	atduskgreg	https://api.github.com/users/atduskgreg	https://avatars.githubusercontent.com/u/165?v=4	Greg Borenstein	borenstein@fastmail.fm	\N	Riot Games	Los Angeles, CA	http://gregborenstein.com	\N	228	529	649	39	2008-02-08 02:27:27	2021-01-06 22:27:09
166	heff	https://api.github.com/users/heff	https://avatars.githubusercontent.com/u/166?v=4	Steve Heffernan	\N	\N	Video.js & Mux	San Francisco	http://mux.com	Author of @videojs, co-founder of @zencoder and @muxinc. I hack on video.	74	8	287	12	2008-02-08 02:35:18	2021-01-23 21:22:17
167	entryway	https://api.github.com/users/entryway	https://avatars.githubusercontent.com/u/167?v=4	entryway	\N	\N	\N	floyd, virginia	http://www.entryway.net	\N	7	14	0	0	2008-02-08 12:25:48	2019-06-04 21:11:06
168	aflatter	https://api.github.com/users/aflatter	https://avatars.githubusercontent.com/u/168?v=4	Alexander Flatter	alex@tevim.com	\N	@tevim 	Hamburg, Germany	https://alex.flatter.io	Software engineer, entrepreneur & product thinker.	62	14	60	33	2008-02-08 14:26:22	2020-12-07 06:05:05
169	schofield	https://api.github.com/users/schofield	https://avatars.githubusercontent.com/u/169?v=4	Grant Schofield	grant@surlysoft.com	\N	Infra at Humio	North Bay	surlysoft.com	\N	14	5	13	0	2008-02-08 17:09:53	2021-01-27 20:13:06
170	rbazinet	https://api.github.com/users/rbazinet	https://avatars.githubusercontent.com/u/170?v=4	Rob Bazinet	rbazinet@stillriversoftware.com	true	http://stillriversoftware.com	Woodstock, CT	https://accidentaltechnologist.com	Entrepreneur, Ruby on Rails specialist, Go, long-time .NET and bootstrapping at http://stillriversoftware.com . Community editor at InfoQ. Runner and Dad.	42	32	34	124	2008-02-08 19:13:43	2021-01-18 10:53:07
171	tranqy	https://api.github.com/users/tranqy	https://avatars.githubusercontent.com/u/171?v=4	Aaron Junod	\N	\N	Geezeo	Vernon, CT	http://twitter.com/tranqy	Somewhere between product guy and engineer.	21	9	17	3	2008-02-08 19:33:59	2021-01-27 22:40:09
172	robey	https://api.github.com/users/robey	https://avatars.githubusercontent.com/u/172?v=4	Robey Pointer	robeypointer@gmail.com	\N	\N	San José, CA	http://robey.lag.net	Just one more thing...	69	54	516	16	2008-02-08 20:53:26	2021-01-21 19:26:21
173	bkeepers	https://api.github.com/users/bkeepers	https://avatars.githubusercontent.com/u/173?v=4	Brandon Keepers	brandon@opensoul.org	true	\N	I’m on a boat	http://opensoul.org	\N	180	80	1700	52	2008-02-09 14:42:49	2021-01-30 14:41:46
174	wilson	https://api.github.com/users/wilson	https://avatars.githubusercontent.com/u/174?v=4	Wilson Bilkovich	wilsonb@gmail.com	\N	\N	New York, NY	https://twitter.com/defiler	Software Engineer. Space Barbarian. Feminist. Reader. I like languages for machines, humans, and others. The gods made Heavy Metal and it's never gonna die.	47	66	65	7	2008-02-09 17:51:44	2021-01-14 13:31:29
175	tommorris	https://api.github.com/users/tommorris	https://avatars.githubusercontent.com/u/175?v=4	Tom Morris	tom@tommorris.org	\N	\N	London	https://tommorris.org/	I hit the keyboard and things sometimes happen.	148	345	203	67	2008-02-09 20:33:01	2021-01-11 09:13:07
176	charlesroper	https://api.github.com/users/charlesroper	https://avatars.githubusercontent.com/u/176?v=4	Charles Roper	charles@roper.im	\N	Field Studies Council	UK		\N	42	102	28	27	2008-02-10 17:35:27	2021-01-26 21:59:20
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
-- Name: repositories TokenUser; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.repositories
    ADD CONSTRAINT "TokenUser" FOREIGN KEY (user_id) REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE CASCADE;


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

