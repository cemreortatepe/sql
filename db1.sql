--
-- PostgreSQL database dump
--

-- Dumped from database version 15.1
-- Dumped by pg_dump version 15.1

-- Started on 2022-11-25 16:29:25

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
-- TOC entry 225 (class 1259 OID 24656)
-- Name: addresses; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.addresses (
    id integer NOT NULL,
    name character varying NOT NULL,
    street_id integer NOT NULL,
    customer_id integer NOT NULL
);


ALTER TABLE public.addresses OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 24655)
-- Name: addresses_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.addresses ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.addresses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 250 (class 1259 OID 24848)
-- Name: brands; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.brands (
    id integer NOT NULL,
    name character varying NOT NULL,
    type character varying NOT NULL
);


ALTER TABLE public.brands OWNER TO postgres;

--
-- TOC entry 249 (class 1259 OID 24847)
-- Name: brands_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.brands ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.brands_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 215 (class 1259 OID 24579)
-- Name: categories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.categories (
    id integer NOT NULL,
    name character varying NOT NULL,
    type character varying NOT NULL
);


ALTER TABLE public.categories OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 24578)
-- Name: categories_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.categories ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 221 (class 1259 OID 24630)
-- Name: cities; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cities (
    id integer NOT NULL,
    name character varying NOT NULL,
    country_id integer
);


ALTER TABLE public.cities OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 24629)
-- Name: cities_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.cities ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.cities_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 219 (class 1259 OID 24622)
-- Name: countries; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.countries (
    id integer NOT NULL,
    name character varying NOT NULL
);


ALTER TABLE public.countries OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 24621)
-- Name: countries_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.countries ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.countries_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 227 (class 1259 OID 24669)
-- Name: customers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customers (
    id integer NOT NULL,
    name character varying NOT NULL,
    surname character varying NOT NULL,
    email character varying NOT NULL
);


ALTER TABLE public.customers OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 24668)
-- Name: customers_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.customers ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.customers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 231 (class 1259 OID 24694)
-- Name: discount; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.discount (
    id integer NOT NULL,
    value money NOT NULL,
    type character varying NOT NULL,
    date date NOT NULL
);


ALTER TABLE public.discount OWNER TO postgres;

--
-- TOC entry 230 (class 1259 OID 24693)
-- Name: discount_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.discount ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.discount_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 237 (class 1259 OID 24728)
-- Name: order_details; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.order_details (
    id integer NOT NULL,
    order_id integer NOT NULL,
    product_id integer NOT NULL,
    shipper_id integer NOT NULL,
    seller_id integer NOT NULL
);


ALTER TABLE public.order_details OWNER TO postgres;

--
-- TOC entry 236 (class 1259 OID 24727)
-- Name: order_details_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.order_details ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.order_details_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 229 (class 1259 OID 24682)
-- Name: orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orders (
    id integer NOT NULL,
    order_time date NOT NULL,
    quantity money NOT NULL,
    customer_id integer NOT NULL,
    discount_id integer NOT NULL
);


ALTER TABLE public.orders OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 24681)
-- Name: orders_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.orders ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.orders_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 233 (class 1259 OID 24707)
-- Name: payments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.payments (
    id integer NOT NULL,
    count money NOT NULL,
    type character varying NOT NULL,
    name character varying NOT NULL,
    order_id integer NOT NULL
);


ALTER TABLE public.payments OWNER TO postgres;

--
-- TOC entry 232 (class 1259 OID 24706)
-- Name: payments_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.payments ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.payments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 217 (class 1259 OID 24587)
-- Name: products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.products (
    id integer NOT NULL,
    name character varying NOT NULL,
    unit_price money NOT NULL,
    stock integer NOT NULL,
    category_id integer NOT NULL
);


ALTER TABLE public.products OWNER TO postgres;

--
-- TOC entry 252 (class 1259 OID 24856)
-- Name: products_brands; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.products_brands (
    id integer NOT NULL,
    product_id integer NOT NULL,
    brand_id integer NOT NULL
);


ALTER TABLE public.products_brands OWNER TO postgres;

--
-- TOC entry 251 (class 1259 OID 24855)
-- Name: products_brands_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.products_brands ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.products_brands_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 216 (class 1259 OID 24586)
-- Name: products_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.products ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.products_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 244 (class 1259 OID 24797)
-- Name: products_sellers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.products_sellers (
    id integer NOT NULL,
    product_id integer NOT NULL,
    seller_id integer NOT NULL
);


ALTER TABLE public.products_sellers OWNER TO postgres;

--
-- TOC entry 243 (class 1259 OID 24796)
-- Name: products_sellers_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.products_sellers ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.products_sellers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 242 (class 1259 OID 24784)
-- Name: refunds; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.refunds (
    id integer NOT NULL,
    type character varying NOT NULL,
    description character varying NOT NULL,
    order_details_id integer NOT NULL
);


ALTER TABLE public.refunds OWNER TO postgres;

--
-- TOC entry 241 (class 1259 OID 24783)
-- Name: refunds_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.refunds ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.refunds_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 239 (class 1259 OID 24749)
-- Name: sellers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sellers (
    id integer NOT NULL,
    name character varying NOT NULL,
    rating character varying NOT NULL,
    follower_count integer NOT NULL
);


ALTER TABLE public.sellers OWNER TO postgres;

--
-- TOC entry 238 (class 1259 OID 24748)
-- Name: sellers_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.sellers ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.sellers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 240 (class 1259 OID 24756)
-- Name: sellers_order_details; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sellers_order_details (
    id integer NOT NULL,
    sellers_id integer NOT NULL,
    order_details_id integer NOT NULL
);


ALTER TABLE public.sellers_order_details OWNER TO postgres;

--
-- TOC entry 235 (class 1259 OID 24720)
-- Name: shippers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.shippers (
    id integer NOT NULL,
    name character varying NOT NULL,
    mail character varying NOT NULL,
    telephone integer NOT NULL
);


ALTER TABLE public.shippers OWNER TO postgres;

--
-- TOC entry 234 (class 1259 OID 24719)
-- Name: shippers_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.shippers ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.shippers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 246 (class 1259 OID 24813)
-- Name: shopping_cart; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.shopping_cart (
    id integer NOT NULL,
    total_price money NOT NULL,
    quantity integer NOT NULL,
    product_id integer NOT NULL
);


ALTER TABLE public.shopping_cart OWNER TO postgres;

--
-- TOC entry 245 (class 1259 OID 24812)
-- Name: shopping_cart_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.shopping_cart ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.shopping_cart_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 248 (class 1259 OID 24824)
-- Name: shopping_cart_products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.shopping_cart_products (
    id integer NOT NULL,
    products_id integer NOT NULL,
    shopping_cart_id integer NOT NULL
);


ALTER TABLE public.shopping_cart_products OWNER TO postgres;

--
-- TOC entry 247 (class 1259 OID 24823)
-- Name: shopping_cart_products_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.shopping_cart_products ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.shopping_cart_products_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 223 (class 1259 OID 24643)
-- Name: street; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.street (
    id integer NOT NULL,
    name character varying NOT NULL,
    city_id integer NOT NULL
);


ALTER TABLE public.street OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 24642)
-- Name: street_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.street ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.street_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 254 (class 1259 OID 24872)
-- Name: sub_categories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sub_categories (
    id integer NOT NULL,
    name character varying NOT NULL,
    type character varying NOT NULL
);


ALTER TABLE public.sub_categories OWNER TO postgres;

--
-- TOC entry 253 (class 1259 OID 24871)
-- Name: sub_categories_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.sub_categories ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.sub_categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 3488 (class 0 OID 24656)
-- Dependencies: 225
-- Data for Name: addresses; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.addresses (id, name, street_id, customer_id) OVERRIDING SYSTEM VALUE VALUES (1, 'ev', 1, 1);
INSERT INTO public.addresses (id, name, street_id, customer_id) OVERRIDING SYSTEM VALUE VALUES (2, 'yazlık', 3, 1);
INSERT INTO public.addresses (id, name, street_id, customer_id) OVERRIDING SYSTEM VALUE VALUES (4, 'iş', 4, 2);


--
-- TOC entry 3513 (class 0 OID 24848)
-- Dependencies: 250
-- Data for Name: brands; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.brands (id, name, type) OVERRIDING SYSTEM VALUE VALUES (1, 'adidas', 'spor');


--
-- TOC entry 3478 (class 0 OID 24579)
-- Dependencies: 215
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.categories (id, name, type) OVERRIDING SYSTEM VALUE VALUES (1, 'giyim', 'ihtiyaç');
INSERT INTO public.categories (id, name, type) OVERRIDING SYSTEM VALUE VALUES (4, 'yiyecek', 'ihtiyaç
');
INSERT INTO public.categories (id, name, type) OVERRIDING SYSTEM VALUE VALUES (5, 'Ev Aletleri', 'ihtiyaç');


--
-- TOC entry 3484 (class 0 OID 24630)
-- Dependencies: 221
-- Data for Name: cities; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.cities (id, name, country_id) OVERRIDING SYSTEM VALUE VALUES (1, 'İstanbul', 1);
INSERT INTO public.cities (id, name, country_id) OVERRIDING SYSTEM VALUE VALUES (2, 'İzmir', 1);
INSERT INTO public.cities (id, name, country_id) OVERRIDING SYSTEM VALUE VALUES (3, 'Cambridge', 2);


--
-- TOC entry 3482 (class 0 OID 24622)
-- Dependencies: 219
-- Data for Name: countries; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.countries (id, name) OVERRIDING SYSTEM VALUE VALUES (1, 'Türkiye');
INSERT INTO public.countries (id, name) OVERRIDING SYSTEM VALUE VALUES (2, 'İngiltere');


--
-- TOC entry 3490 (class 0 OID 24669)
-- Dependencies: 227
-- Data for Name: customers; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.customers (id, name, surname, email) OVERRIDING SYSTEM VALUE VALUES (1, 'Hilal', 'Kırlı', 'hilal.kirli@etiya.com');
INSERT INTO public.customers (id, name, surname, email) OVERRIDING SYSTEM VALUE VALUES (2, 'Cemre', 'Ortatepe', 'cemre.ortatepe@etiya.com');


--
-- TOC entry 3494 (class 0 OID 24694)
-- Dependencies: 231
-- Data for Name: discount; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.discount (id, value, type, date) OVERRIDING SYSTEM VALUE VALUES (4, '£100.00', '%20', '2022-01-01');
INSERT INTO public.discount (id, value, type, date) OVERRIDING SYSTEM VALUE VALUES (5, '£200.00', '%25', '2021-01-01');


--
-- TOC entry 3500 (class 0 OID 24728)
-- Dependencies: 237
-- Data for Name: order_details; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.order_details (id, order_id, product_id, shipper_id, seller_id) OVERRIDING SYSTEM VALUE VALUES (1, 2, 1, 2, 2);


--
-- TOC entry 3492 (class 0 OID 24682)
-- Dependencies: 229
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.orders (id, order_time, quantity, customer_id, discount_id) OVERRIDING SYSTEM VALUE VALUES (2, '2022-04-03', '£300.00', 1, 4);
INSERT INTO public.orders (id, order_time, quantity, customer_id, discount_id) OVERRIDING SYSTEM VALUE VALUES (3, '2022-10-17', '£450.00', 2, 5);


--
-- TOC entry 3496 (class 0 OID 24707)
-- Dependencies: 233
-- Data for Name: payments; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.payments (id, count, type, name, order_id) OVERRIDING SYSTEM VALUE VALUES (1, '£500.00', 'cash', 'kapıdan ödeme', 3);
INSERT INTO public.payments (id, count, type, name, order_id) OVERRIDING SYSTEM VALUE VALUES (2, '£700.00', 'credit card', 'mobil ödeme', 2);


--
-- TOC entry 3480 (class 0 OID 24587)
-- Dependencies: 217
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.products (id, name, unit_price, stock, category_id) OVERRIDING SYSTEM VALUE VALUES (1, 'Tişört', '£15.00', 100, 1);
INSERT INTO public.products (id, name, unit_price, stock, category_id) OVERRIDING SYSTEM VALUE VALUES (3, 'Şort', '£50.00', 50, 4);


--
-- TOC entry 3515 (class 0 OID 24856)
-- Dependencies: 252
-- Data for Name: products_brands; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.products_brands (id, product_id, brand_id) OVERRIDING SYSTEM VALUE VALUES (1, 1, 1);


--
-- TOC entry 3507 (class 0 OID 24797)
-- Dependencies: 244
-- Data for Name: products_sellers; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.products_sellers (id, product_id, seller_id) OVERRIDING SYSTEM VALUE VALUES (1, 1, 1);


--
-- TOC entry 3505 (class 0 OID 24784)
-- Dependencies: 242
-- Data for Name: refunds; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.refunds (id, type, description, order_details_id) OVERRIDING SYSTEM VALUE VALUES (1, '1', 'hatalı ürün', 1);


--
-- TOC entry 3502 (class 0 OID 24749)
-- Dependencies: 239
-- Data for Name: sellers; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.sellers (id, name, rating, follower_count) OVERRIDING SYSTEM VALUE VALUES (1, 'nike.aş', '8.5', 500);
INSERT INTO public.sellers (id, name, rating, follower_count) OVERRIDING SYSTEM VALUE VALUES (2, 'adidas.aş', '7.8', 400);


--
-- TOC entry 3503 (class 0 OID 24756)
-- Dependencies: 240
-- Data for Name: sellers_order_details; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.sellers_order_details (id, sellers_id, order_details_id) VALUES (1, 1, 1);


--
-- TOC entry 3498 (class 0 OID 24720)
-- Dependencies: 235
-- Data for Name: shippers; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.shippers (id, name, mail, telephone) OVERRIDING SYSTEM VALUE VALUES (1, 'yurtiçi', 'yurtiçi@hotmail.com', 3);
INSERT INTO public.shippers (id, name, mail, telephone) OVERRIDING SYSTEM VALUE VALUES (2, 'aras', 'aras@hotmail.com', 4);


--
-- TOC entry 3509 (class 0 OID 24813)
-- Dependencies: 246
-- Data for Name: shopping_cart; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.shopping_cart (id, total_price, quantity, product_id) OVERRIDING SYSTEM VALUE VALUES (1, '£100.00', 5, 3);


--
-- TOC entry 3511 (class 0 OID 24824)
-- Dependencies: 248
-- Data for Name: shopping_cart_products; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.shopping_cart_products (id, products_id, shopping_cart_id) OVERRIDING SYSTEM VALUE VALUES (1, 1, 1);


--
-- TOC entry 3486 (class 0 OID 24643)
-- Dependencies: 223
-- Data for Name: street; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.street (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (1, 'Atatürk ', 1);
INSERT INTO public.street (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (2, 'Mustafa Kemal', 1);
INSERT INTO public.street (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (3, 'Kıbrıs', 2);
INSERT INTO public.street (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (4, 'Rose', 3);


--
-- TOC entry 3517 (class 0 OID 24872)
-- Dependencies: 254
-- Data for Name: sub_categories; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3523 (class 0 OID 0)
-- Dependencies: 224
-- Name: addresses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.addresses_id_seq', 4, true);


--
-- TOC entry 3524 (class 0 OID 0)
-- Dependencies: 249
-- Name: brands_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.brands_id_seq', 1, true);


--
-- TOC entry 3525 (class 0 OID 0)
-- Dependencies: 214
-- Name: categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.categories_id_seq', 5, true);


--
-- TOC entry 3526 (class 0 OID 0)
-- Dependencies: 220
-- Name: cities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cities_id_seq', 3, true);


--
-- TOC entry 3527 (class 0 OID 0)
-- Dependencies: 218
-- Name: countries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.countries_id_seq', 2, true);


--
-- TOC entry 3528 (class 0 OID 0)
-- Dependencies: 226
-- Name: customers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.customers_id_seq', 2, true);


--
-- TOC entry 3529 (class 0 OID 0)
-- Dependencies: 230
-- Name: discount_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.discount_id_seq', 5, true);


--
-- TOC entry 3530 (class 0 OID 0)
-- Dependencies: 236
-- Name: order_details_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.order_details_id_seq', 1, true);


--
-- TOC entry 3531 (class 0 OID 0)
-- Dependencies: 228
-- Name: orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.orders_id_seq', 3, true);


--
-- TOC entry 3532 (class 0 OID 0)
-- Dependencies: 232
-- Name: payments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.payments_id_seq', 2, true);


--
-- TOC entry 3533 (class 0 OID 0)
-- Dependencies: 251
-- Name: products_brands_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.products_brands_id_seq', 1, true);


--
-- TOC entry 3534 (class 0 OID 0)
-- Dependencies: 216
-- Name: products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.products_id_seq', 3, true);


--
-- TOC entry 3535 (class 0 OID 0)
-- Dependencies: 243
-- Name: products_sellers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.products_sellers_id_seq', 1, true);


--
-- TOC entry 3536 (class 0 OID 0)
-- Dependencies: 241
-- Name: refunds_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.refunds_id_seq', 1, true);


--
-- TOC entry 3537 (class 0 OID 0)
-- Dependencies: 238
-- Name: sellers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sellers_id_seq', 2, true);


--
-- TOC entry 3538 (class 0 OID 0)
-- Dependencies: 234
-- Name: shippers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.shippers_id_seq', 2, true);


--
-- TOC entry 3539 (class 0 OID 0)
-- Dependencies: 245
-- Name: shopping_cart_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.shopping_cart_id_seq', 1, true);


--
-- TOC entry 3540 (class 0 OID 0)
-- Dependencies: 247
-- Name: shopping_cart_products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.shopping_cart_products_id_seq', 1, true);


--
-- TOC entry 3541 (class 0 OID 0)
-- Dependencies: 222
-- Name: street_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.street_id_seq', 4, true);


--
-- TOC entry 3542 (class 0 OID 0)
-- Dependencies: 253
-- Name: sub_categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sub_categories_id_seq', 1, false);


--
-- TOC entry 3283 (class 2606 OID 24662)
-- Name: addresses addresses_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.addresses
    ADD CONSTRAINT addresses_pkey PRIMARY KEY (id);


--
-- TOC entry 3309 (class 2606 OID 24854)
-- Name: brands brands_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.brands
    ADD CONSTRAINT brands_pkey PRIMARY KEY (id);


--
-- TOC entry 3273 (class 2606 OID 24583)
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);


--
-- TOC entry 3279 (class 2606 OID 24636)
-- Name: cities cities_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cities
    ADD CONSTRAINT cities_pkey PRIMARY KEY (id);


--
-- TOC entry 3277 (class 2606 OID 24628)
-- Name: countries countries_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.countries
    ADD CONSTRAINT countries_pkey PRIMARY KEY (id);


--
-- TOC entry 3285 (class 2606 OID 24675)
-- Name: customers customers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_pkey PRIMARY KEY (id);


--
-- TOC entry 3289 (class 2606 OID 24700)
-- Name: discount discount_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.discount
    ADD CONSTRAINT discount_pkey PRIMARY KEY (id);


--
-- TOC entry 3295 (class 2606 OID 24732)
-- Name: order_details order_details_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_details
    ADD CONSTRAINT order_details_pkey PRIMARY KEY (id);


--
-- TOC entry 3287 (class 2606 OID 24686)
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);


--
-- TOC entry 3291 (class 2606 OID 24713)
-- Name: payments payments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payments
    ADD CONSTRAINT payments_pkey PRIMARY KEY (id);


--
-- TOC entry 3311 (class 2606 OID 24860)
-- Name: products_brands products_brands_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products_brands
    ADD CONSTRAINT products_brands_pkey PRIMARY KEY (id);


--
-- TOC entry 3275 (class 2606 OID 24593)
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);


--
-- TOC entry 3303 (class 2606 OID 24801)
-- Name: products_sellers products_sellers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products_sellers
    ADD CONSTRAINT products_sellers_pkey PRIMARY KEY (id);


--
-- TOC entry 3301 (class 2606 OID 24790)
-- Name: refunds refunds_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.refunds
    ADD CONSTRAINT refunds_pkey PRIMARY KEY (id);


--
-- TOC entry 3299 (class 2606 OID 24772)
-- Name: sellers_order_details sellers_order_details_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sellers_order_details
    ADD CONSTRAINT sellers_order_details_pkey PRIMARY KEY (id);


--
-- TOC entry 3297 (class 2606 OID 24755)
-- Name: sellers sellers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sellers
    ADD CONSTRAINT sellers_pkey PRIMARY KEY (id);


--
-- TOC entry 3293 (class 2606 OID 24726)
-- Name: shippers shippers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shippers
    ADD CONSTRAINT shippers_pkey PRIMARY KEY (id);


--
-- TOC entry 3305 (class 2606 OID 24817)
-- Name: shopping_cart shopping_cart_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shopping_cart
    ADD CONSTRAINT shopping_cart_pkey PRIMARY KEY (id);


--
-- TOC entry 3307 (class 2606 OID 24828)
-- Name: shopping_cart_products shopping_cart_products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shopping_cart_products
    ADD CONSTRAINT shopping_cart_products_pkey PRIMARY KEY (id);


--
-- TOC entry 3281 (class 2606 OID 24649)
-- Name: street street_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.street
    ADD CONSTRAINT street_pkey PRIMARY KEY (id);


--
-- TOC entry 3313 (class 2606 OID 24878)
-- Name: sub_categories sub_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sub_categories
    ADD CONSTRAINT sub_categories_pkey PRIMARY KEY (id);


--
-- TOC entry 3317 (class 2606 OID 24676)
-- Name: addresses addresses_customer_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.addresses
    ADD CONSTRAINT addresses_customer_id_fk FOREIGN KEY (customer_id) REFERENCES public.customers(id) NOT VALID;


--
-- TOC entry 3318 (class 2606 OID 24663)
-- Name: addresses addresses_street_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.addresses
    ADD CONSTRAINT addresses_street_id_fk FOREIGN KEY (street_id) REFERENCES public.street(id);


--
-- TOC entry 3315 (class 2606 OID 24637)
-- Name: cities cities_country_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cities
    ADD CONSTRAINT cities_country_id FOREIGN KEY (country_id) REFERENCES public.countries(id);


--
-- TOC entry 3322 (class 2606 OID 24733)
-- Name: order_details order_details_order_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_details
    ADD CONSTRAINT order_details_order_id_fk FOREIGN KEY (order_id) REFERENCES public.orders(id);


--
-- TOC entry 3323 (class 2606 OID 24738)
-- Name: order_details order_details_product_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_details
    ADD CONSTRAINT order_details_product_id_fk FOREIGN KEY (product_id) REFERENCES public.products(id) NOT VALID;


--
-- TOC entry 3324 (class 2606 OID 24743)
-- Name: order_details order_details_shipper_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_details
    ADD CONSTRAINT order_details_shipper_id_fk FOREIGN KEY (shipper_id) REFERENCES public.shippers(id) NOT VALID;


--
-- TOC entry 3319 (class 2606 OID 24687)
-- Name: orders orders_customer_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_customer_id_fk FOREIGN KEY (customer_id) REFERENCES public.customers(id);


--
-- TOC entry 3320 (class 2606 OID 24701)
-- Name: orders orders_discount_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_discount_id_fk FOREIGN KEY (discount_id) REFERENCES public.discount(id) NOT VALID;


--
-- TOC entry 3321 (class 2606 OID 24714)
-- Name: payments payments_order_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payments
    ADD CONSTRAINT payments_order_id_fk FOREIGN KEY (order_id) REFERENCES public.orders(id);


--
-- TOC entry 3314 (class 2606 OID 24594)
-- Name: products product_category_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT product_category_fk FOREIGN KEY (category_id) REFERENCES public.categories(id);


--
-- TOC entry 3333 (class 2606 OID 24866)
-- Name: products_brands products_brands_brand_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products_brands
    ADD CONSTRAINT products_brands_brand_id_fk FOREIGN KEY (brand_id) REFERENCES public.brands(id);


--
-- TOC entry 3334 (class 2606 OID 24861)
-- Name: products_brands products_brands_product_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products_brands
    ADD CONSTRAINT products_brands_product_id_fk FOREIGN KEY (product_id) REFERENCES public.products(id);


--
-- TOC entry 3328 (class 2606 OID 24802)
-- Name: products_sellers products_sellers_product_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products_sellers
    ADD CONSTRAINT products_sellers_product_id_fk FOREIGN KEY (product_id) REFERENCES public.products(id);


--
-- TOC entry 3329 (class 2606 OID 24807)
-- Name: products_sellers products_sellers_seller_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products_sellers
    ADD CONSTRAINT products_sellers_seller_id_fk FOREIGN KEY (seller_id) REFERENCES public.sellers(id);


--
-- TOC entry 3327 (class 2606 OID 24791)
-- Name: refunds refunds_order_details_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.refunds
    ADD CONSTRAINT refunds_order_details_id_fk FOREIGN KEY (order_details_id) REFERENCES public.order_details(id);


--
-- TOC entry 3325 (class 2606 OID 24778)
-- Name: sellers_order_details sellers_order_details_order_details_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sellers_order_details
    ADD CONSTRAINT sellers_order_details_order_details_id_fk FOREIGN KEY (order_details_id) REFERENCES public.order_details(id) NOT VALID;


--
-- TOC entry 3326 (class 2606 OID 24773)
-- Name: sellers_order_details sellers_order_details_sellers_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sellers_order_details
    ADD CONSTRAINT sellers_order_details_sellers_id_fk FOREIGN KEY (sellers_id) REFERENCES public.sellers(id) NOT VALID;


--
-- TOC entry 3330 (class 2606 OID 24818)
-- Name: shopping_cart shopping_cart_product_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shopping_cart
    ADD CONSTRAINT shopping_cart_product_id_fk FOREIGN KEY (product_id) REFERENCES public.products(id);


--
-- TOC entry 3331 (class 2606 OID 24829)
-- Name: shopping_cart_products shopping_cart_products_products_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shopping_cart_products
    ADD CONSTRAINT shopping_cart_products_products_id_fk FOREIGN KEY (products_id) REFERENCES public.products(id);


--
-- TOC entry 3332 (class 2606 OID 24834)
-- Name: shopping_cart_products shopping_cart_products_shopping_cart_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shopping_cart_products
    ADD CONSTRAINT shopping_cart_products_shopping_cart_id_fk FOREIGN KEY (shopping_cart_id) REFERENCES public.shopping_cart(id);


--
-- TOC entry 3316 (class 2606 OID 24650)
-- Name: street street_city_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.street
    ADD CONSTRAINT street_city_id_fk FOREIGN KEY (city_id) REFERENCES public.cities(id);


-- Completed on 2022-11-25 16:29:25

--
-- PostgreSQL database dump complete
--

