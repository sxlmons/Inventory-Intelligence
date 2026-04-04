pg_dump: warning: there are circular foreign-key constraints on this table:
pg_dump: detail: category
pg_dump: hint: You might not be able to restore the dump without using --disable-triggers or temporarily dropping the constraints.
pg_dump: hint: Consider using a full dump instead of a --data-only dump to avoid this problem.
--
-- PostgreSQL database dump
--

\restrict vf6Jghvez1HrFCOF8ZWzdC2WaU7pShJtMDXLIvdBXbPbQPkFWUKCz8Wr3ny0Fkg

-- Dumped from database version 17.9 (Debian 17.9-1.pgdg13+1)
-- Dumped by pg_dump version 17.9 (Debian 17.9-1.pgdg13+1)

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
-- Data for Name: category; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: vendor; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: product; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: inventory; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: vendorinventorylot; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- PostgreSQL database dump complete
--

\unrestrict vf6Jghvez1HrFCOF8ZWzdC2WaU7pShJtMDXLIvdBXbPbQPkFWUKCz8Wr3ny0Fkg

