--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.20
-- Dumped by pg_dump version 12.0

-- Started on 2021-01-05 13:35:55

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

--
-- TOC entry 190 (class 1259 OID 16446)
-- Name: booking; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.booking (
    id bigint NOT NULL,
    parking_id bigint,
    vehicle_id bigint,
    ts_from timestamp without time zone NOT NULL,
    ts_till timestamp without time zone NOT NULL,
    payment boolean NOT NULL
);


ALTER TABLE public.booking OWNER TO postgres;

--
-- TOC entry 189 (class 1259 OID 16444)
-- Name: booking_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.booking_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.booking_id_seq OWNER TO postgres;

--
-- TOC entry 2153 (class 0 OID 0)
-- Dependencies: 189
-- Name: booking_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.booking_id_seq OWNED BY public.booking.id;


--
-- TOC entry 186 (class 1259 OID 16417)
-- Name: parking; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.parking (
    id bigint NOT NULL,
    number integer NOT NULL,
    total integer NOT NULL,
    cost numeric(10,2) NOT NULL,
    latitude numeric(10,8),
    longtitude numeric(10,8),
    address character varying(255) NOT NULL
);


ALTER TABLE public.parking OWNER TO postgres;

--
-- TOC entry 185 (class 1259 OID 16415)
-- Name: parking_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.parking_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.parking_id_seq OWNER TO postgres;

--
-- TOC entry 2154 (class 0 OID 0)
-- Dependencies: 185
-- Name: parking_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.parking_id_seq OWNED BY public.parking.id;


--
-- TOC entry 188 (class 1259 OID 16425)
-- Name: vehicle; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.vehicle (
    id bigint NOT NULL,
    number character varying(32)
);


ALTER TABLE public.vehicle OWNER TO postgres;

--
-- TOC entry 187 (class 1259 OID 16423)
-- Name: vehicle_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.vehicle_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.vehicle_id_seq OWNER TO postgres;

--
-- TOC entry 2155 (class 0 OID 0)
-- Dependencies: 187
-- Name: vehicle_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.vehicle_id_seq OWNED BY public.vehicle.id;


--
-- TOC entry 2015 (class 2604 OID 16449)
-- Name: booking id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.booking ALTER COLUMN id SET DEFAULT nextval('public.booking_id_seq'::regclass);


--
-- TOC entry 2013 (class 2604 OID 16463)
-- Name: parking id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.parking ALTER COLUMN id SET DEFAULT nextval('public.parking_id_seq'::regclass);


--
-- TOC entry 2014 (class 2604 OID 16428)
-- Name: vehicle id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vehicle ALTER COLUMN id SET DEFAULT nextval('public.vehicle_id_seq'::regclass);


--
-- TOC entry 2146 (class 0 OID 16446)
-- Dependencies: 190
-- Data for Name: booking; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.booking (id, parking_id, vehicle_id, ts_from, ts_till, payment) VALUES (1, 20, 2, '2021-01-03 21:38:12.623', '2021-01-03 22:56:12.623', false);
INSERT INTO public.booking (id, parking_id, vehicle_id, ts_from, ts_till, payment) VALUES (2, 20, 1, '2021-01-04 14:07:23.027', '2021-01-04 16:00:08.929', true);
INSERT INTO public.booking (id, parking_id, vehicle_id, ts_from, ts_till, payment) VALUES (3, 1, 1, '2021-01-04 16:01:26.376', '2021-01-04 16:03:24.006', true);
INSERT INTO public.booking (id, parking_id, vehicle_id, ts_from, ts_till, payment) VALUES (4, 10, 2, '2021-01-04 16:21:00.295', '2021-01-04 18:01:00.295', false);
INSERT INTO public.booking (id, parking_id, vehicle_id, ts_from, ts_till, payment) VALUES (5, 1, 1, '2021-01-04 17:34:05.255', '2021-01-04 17:35:05.255', false);
INSERT INTO public.booking (id, parking_id, vehicle_id, ts_from, ts_till, payment) VALUES (6, 5, 1, '2021-01-04 17:59:47.991', '2021-01-04 18:14:47.991', false);
INSERT INTO public.booking (id, parking_id, vehicle_id, ts_from, ts_till, payment) VALUES (7, 5, 1, '2021-01-04 18:01:24.621', '2021-01-04 18:16:24.621', false);
INSERT INTO public.booking (id, parking_id, vehicle_id, ts_from, ts_till, payment) VALUES (8, 5, 1, '2021-01-04 18:11:37.889', '2021-01-04 18:31:37.889', false);
INSERT INTO public.booking (id, parking_id, vehicle_id, ts_from, ts_till, payment) VALUES (9, 5, 1, '2021-01-04 18:13:45.33', '2021-01-04 18:33:45.33', false);
INSERT INTO public.booking (id, parking_id, vehicle_id, ts_from, ts_till, payment) VALUES (10, 5, 1, '2021-01-04 21:33:38.612', '2021-01-04 21:33:53.723', true);


--
-- TOC entry 2142 (class 0 OID 16417)
-- Dependencies: 186
-- Data for Name: parking; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.parking (id, number, total, cost, latitude, longtitude, address) VALUES (1, 1003, 37, 40.00, 54.19294150, 37.61803850, 'г.Тула ,Ленина, д. площадь');
INSERT INTO public.parking (id, number, total, cost, latitude, longtitude, address) VALUES (2, 1006, 11, 40.00, 54.19547350, 37.61353450, 'г.Тула ,Денисовский переулок, д. 8-10');
INSERT INTO public.parking (id, number, total, cost, latitude, longtitude, address) VALUES (3, 1017, 26, 40.00, 54.19333350, 37.61281900, 'г.Тула ,улица Советская, д. 16');
INSERT INTO public.parking (id, number, total, cost, latitude, longtitude, address) VALUES (4, 1021, 5, 40.00, 54.18949900, 37.62302150, 'г.Тула ,улица Советская, д. 88а');
INSERT INTO public.parking (id, number, total, cost, latitude, longtitude, address) VALUES (5, 1001, 8, 40.00, 54.19069150, 37.62502500, 'г.Тула ,Чапаевский, д. проезд');
INSERT INTO public.parking (id, number, total, cost, latitude, longtitude, address) VALUES (6, 1001, 14, 40.00, 54.19120050, 37.62514350, 'г.Тула ,Менделеевская улица, д. 2А');
INSERT INTO public.parking (id, number, total, cost, latitude, longtitude, address) VALUES (7, 1001, 32, 40.00, 54.19084200, 37.62565350, 'г.Тула ,Глеба Успенского, д. сквер');
INSERT INTO public.parking (id, number, total, cost, latitude, longtitude, address) VALUES (8, 1001, 12, 40.00, 54.19347788, 37.61994306, 'г.Тула ,Менделеевская улица, д. 13');
INSERT INTO public.parking (id, number, total, cost, latitude, longtitude, address) VALUES (9, 1001, 14, 40.00, 54.19456300, 37.61771100, 'г.Тула ,площадь Ленина, д. 2');
INSERT INTO public.parking (id, number, total, cost, latitude, longtitude, address) VALUES (10, 1004, 15, 40.00, 54.19426481, 37.61482984, 'г.Тула ,улица Фридриха Энгельса, д. 2-6');
INSERT INTO public.parking (id, number, total, cost, latitude, longtitude, address) VALUES (11, 1004, 8, 40.00, 54.19361200, 37.61410950, 'г.Тула ,улица Фридриха Энгельса, д. 8');
INSERT INTO public.parking (id, number, total, cost, latitude, longtitude, address) VALUES (12, 1005, 5, 40.00, 54.19599850, 37.61555150, 'г.Тула ,улица Союзная, д. 2-4a');
INSERT INTO public.parking (id, number, total, cost, latitude, longtitude, address) VALUES (13, 1005, 6, 40.00, 54.19637900, 37.61447650, 'г.Тула ,улица Союзная, д. 4б');
INSERT INTO public.parking (id, number, total, cost, latitude, longtitude, address) VALUES (14, 1007, 24, 40.00, 54.19608400, 37.61622650, 'г.Тула ,Благовещенский переулок , д. улица Союзная, 2/2');
INSERT INTO public.parking (id, number, total, cost, latitude, longtitude, address) VALUES (15, 1009, 39, 40.00, 54.19307750, 37.62238850, 'г.Тула ,Садовый, д. переулок');
INSERT INTO public.parking (id, number, total, cost, latitude, longtitude, address) VALUES (16, 1010, 27, 40.00, 54.19195500, 37.62707400, 'г.Тула ,улица Дзержинского, д. 15-17');
INSERT INTO public.parking (id, number, total, cost, latitude, longtitude, address) VALUES (17, 1010, 4, 40.00, 54.19169550, 37.62736800, 'г.Тула ,улица Дзержинского, д. 12');
INSERT INTO public.parking (id, number, total, cost, latitude, longtitude, address) VALUES (18, 1010, 2, 40.00, 54.19134350, 37.62814500, 'г.Тула ,улица Советская, д. 108');
INSERT INTO public.parking (id, number, total, cost, latitude, longtitude, address) VALUES (19, 1010, 2, 40.00, 54.19117900, 37.62856350, 'г.Тула ,улица Дзержинского, д. 16а');
INSERT INTO public.parking (id, number, total, cost, latitude, longtitude, address) VALUES (20, 1011, 5, 40.00, 54.19273050, 37.62580800, 'г.Тула ,улица Никитская, д. 11');
INSERT INTO public.parking (id, number, total, cost, latitude, longtitude, address) VALUES (21, 1013, 3, 40.00, 54.19042950, 37.62013200, 'г.Тула ,улица Советская, д. 74');
INSERT INTO public.parking (id, number, total, cost, latitude, longtitude, address) VALUES (22, 1013, 10, 40.00, 54.18937100, 37.61904150, 'г.Тула ,улица Жуковского, д. 10-20');
INSERT INTO public.parking (id, number, total, cost, latitude, longtitude, address) VALUES (23, 1013, 10, 40.00, 54.18847700, 37.61810300, 'г.Тула ,улица Жуковского, д. 22-30');
INSERT INTO public.parking (id, number, total, cost, latitude, longtitude, address) VALUES (24, 1013, 7, 40.00, 54.18767850, 37.61724600, 'г.Тула ,улица Жуковского, д. 34-36');
INSERT INTO public.parking (id, number, total, cost, latitude, longtitude, address) VALUES (25, 1013, 9, 40.00, 54.19012700, 37.61998400, 'г.Тула ,улица Жуковского, д. 1-5');
INSERT INTO public.parking (id, number, total, cost, latitude, longtitude, address) VALUES (26, 1012, 7, 40.00, 54.19174500, 37.61955900, 'г.Тула ,улица Тургеневская, д. 7а/ улица Советская,53а');
INSERT INTO public.parking (id, number, total, cost, latitude, longtitude, address) VALUES (27, 1012, 10, 40.00, 54.19095400, 37.61876400, 'г.Тула ,Тургеневская улица, д. 9');
INSERT INTO public.parking (id, number, total, cost, latitude, longtitude, address) VALUES (28, 1012, 8, 40.00, 54.19044100, 37.61820200, 'г.Тула ,улица Тургеневская, д. 13');
INSERT INTO public.parking (id, number, total, cost, latitude, longtitude, address) VALUES (29, 1012, 2, 40.00, 54.19274050, 37.62057750, 'г.Тула ,Тургеневская улица, д. 1-3');
INSERT INTO public.parking (id, number, total, cost, latitude, longtitude, address) VALUES (30, 1012, 12, 40.00, 54.18922750, 37.61691000, 'г.Тула ,улица Тургеневская, д. 17 - 29');
INSERT INTO public.parking (id, number, total, cost, latitude, longtitude, address) VALUES (31, 1012, 8, 40.00, 54.18825300, 37.61586300, 'г.Тула ,Тургеневская улица, д. 31');
INSERT INTO public.parking (id, number, total, cost, latitude, longtitude, address) VALUES (32, 1012, 4, 40.00, 54.18841300, 37.61586850, 'г.Тула ,Тургеневская улица, д. 32');
INSERT INTO public.parking (id, number, total, cost, latitude, longtitude, address) VALUES (33, 1012, 2, 40.00, 54.19243250, 37.62025800, 'г.Тула ,Тургеневская улица, д. 5');
INSERT INTO public.parking (id, number, total, cost, latitude, longtitude, address) VALUES (34, 1012, 10, 40.00, 54.18694750, 37.61445950, 'г.Тула ,Тургеневская улица, д. 37а - 41');
INSERT INTO public.parking (id, number, total, cost, latitude, longtitude, address) VALUES (35, 1012, 13, 40.00, 54.18721100, 37.61457400, 'г.Тула ,Тургеневская улица, д. 38-42');
INSERT INTO public.parking (id, number, total, cost, latitude, longtitude, address) VALUES (36, 1012, 3, 40.00, 54.19223900, 37.62005550, 'г.Тула ,Тургеневская улица, д. 5a-7');
INSERT INTO public.parking (id, number, total, cost, latitude, longtitude, address) VALUES (37, 1012, 7, 40.00, 54.18618550, 37.61364500, 'г.Тула ,Тургеневская улица, д. 47а');
INSERT INTO public.parking (id, number, total, cost, latitude, longtitude, address) VALUES (38, 1012, 10, 40.00, 54.18533650, 37.61270500, 'г.Тула ,Тургеневская улица, д. 49-63');
INSERT INTO public.parking (id, number, total, cost, latitude, longtitude, address) VALUES (39, 1012, 12, 40.00, 54.18568100, 37.61291300, 'г.Тула ,Тургеневская улица, д. 46-50');
INSERT INTO public.parking (id, number, total, cost, latitude, longtitude, address) VALUES (40, 1012, 23, 40.00, 54.18367000, 37.61076150, 'г.Тула ,Тургеневская улица, д. 62-74');
INSERT INTO public.parking (id, number, total, cost, latitude, longtitude, address) VALUES (41, 1012, 27, 40.00, 54.18990950, 37.61747200, 'г.Тула ,улица Советская, д. 68 – улица Тургеневская, 12 – 24');
INSERT INTO public.parking (id, number, total, cost, latitude, longtitude, address) VALUES (42, 1012, 24, 40.00, 54.18361900, 37.61088500, 'г.Тула ,Тургеневская улица, д. 69');
INSERT INTO public.parking (id, number, total, cost, latitude, longtitude, address) VALUES (43, 1012, 4, 40.00, 54.18430300, 37.61161550, 'г.Тула ,улица Тургеневская, д. 67');
INSERT INTO public.parking (id, number, total, cost, latitude, longtitude, address) VALUES (44, 1012, 2, 40.00, 54.18996800, 37.61770450, 'г.Тула ,улица Тургеневская, д. 15');
INSERT INTO public.parking (id, number, total, cost, latitude, longtitude, address) VALUES (45, 1012, 4, 40.00, 54.18292600, 37.61012600, 'г.Тула ,Тургеневская улица, д. 79-83');
INSERT INTO public.parking (id, number, total, cost, latitude, longtitude, address) VALUES (46, 1014, 8, 40.00, 54.18965450, 37.62152000, 'г.Тула ,улица Пирогова, д. 2-6');
INSERT INTO public.parking (id, number, total, cost, latitude, longtitude, address) VALUES (47, 1014, 16, 40.00, 54.18843900, 37.62018600, 'г.Тула ,улица Пирогова, д. 10-20');
INSERT INTO public.parking (id, number, total, cost, latitude, longtitude, address) VALUES (48, 1014, 13, 40.00, 54.18707550, 37.61889650, 'г.Тула ,Центральный, д. рынок');
INSERT INTO public.parking (id, number, total, cost, latitude, longtitude, address) VALUES (49, 1014, 23, 40.00, 54.18891950, 37.62091600, 'г.Тула ,улица Пирогова, д. 3-15');
INSERT INTO public.parking (id, number, total, cost, latitude, longtitude, address) VALUES (50, 1016, 5, 40.00, 54.19239250, 37.61460050, 'г.Тула ,ул. Советская, д. 60');
INSERT INTO public.parking (id, number, total, cost, latitude, longtitude, address) VALUES (51, 1016, 13, 40.00, 54.19159500, 37.61372000, 'г.Тула ,Каминского, д. 24в');
INSERT INTO public.parking (id, number, total, cost, latitude, longtitude, address) VALUES (52, 1016, 6, 40.00, 54.19045600, 37.61263850, 'г.Тула ,Центральный переулок, д. 7');
INSERT INTO public.parking (id, number, total, cost, latitude, longtitude, address) VALUES (53, 1016, 2, 40.00, 54.19127500, 37.61350050, 'г.Тула ,Центральный переулок, д. 9');
INSERT INTO public.parking (id, number, total, cost, latitude, longtitude, address) VALUES (54, 1015, 12, 40.00, 54.18906300, 37.61232550, 'г.Тула ,пр. Ленина, д. 28');
INSERT INTO public.parking (id, number, total, cost, latitude, longtitude, address) VALUES (55, 1015, 9, 40.00, 54.18957700, 37.61108150, 'г.Тула ,улица Каминского, д. 24A');
INSERT INTO public.parking (id, number, total, cost, latitude, longtitude, address) VALUES (56, 1018, 31, 40.00, 54.19294250, 37.61126900, 'г.Тула ,улица Демонстрации, д. 1-1a');
INSERT INTO public.parking (id, number, total, cost, latitude, longtitude, address) VALUES (57, 1018, 8, 40.00, 54.19278900, 37.60981700, 'г.Тула ,улица Демонстрации, д. 1Б');
INSERT INTO public.parking (id, number, total, cost, latitude, longtitude, address) VALUES (58, 1018, 4, 40.00, 54.19294900, 37.61028200, 'г.Тула ,улица Демонстрации, д. 2-4');
INSERT INTO public.parking (id, number, total, cost, latitude, longtitude, address) VALUES (59, 1020, 13, 40.00, 54.19939800, 37.61210450, 'г.Тула ,улица Советская, д. 2');
INSERT INTO public.parking (id, number, total, cost, latitude, longtitude, address) VALUES (60, 1020, 12, 40.00, 54.19877700, 37.61135000, 'г.Тула ,улица Советская, д. 4');
INSERT INTO public.parking (id, number, total, cost, latitude, longtitude, address) VALUES (61, 1020, 8, 40.00, 54.19360694, 37.61289464, 'г.Тула ,улица Советская, д. 29');
INSERT INTO public.parking (id, number, total, cost, latitude, longtitude, address) VALUES (62, 1020, 11, 40.00, 54.19174000, 37.62821100, 'г.Тула ,улица Советская, д. 110');
INSERT INTO public.parking (id, number, total, cost, latitude, longtitude, address) VALUES (63, 1020, 4, 40.00, 54.19217950, 37.62873250, 'г.Тула ,улица Советская, д. 112');
INSERT INTO public.parking (id, number, total, cost, latitude, longtitude, address) VALUES (64, 1022, 6, 40.00, 54.18466350, 37.60795550, 'г.Тула ,проспект Ленина, д. 46');
INSERT INTO public.parking (id, number, total, cost, latitude, longtitude, address) VALUES (65, 1022, 10, 40.00, 54.18388650, 37.60752700, 'г.Тула ,проспект Ленина, д. 57');
INSERT INTO public.parking (id, number, total, cost, latitude, longtitude, address) VALUES (66, 1022, 51, 40.00, 54.18281700, 37.60602600, 'г.Тула ,проспект Ленина, д. 52-54');
INSERT INTO public.parking (id, number, total, cost, latitude, longtitude, address) VALUES (67, 1022, 26, 40.00, 54.18038300, 37.60338200, 'г.Тула ,проспект Ленина, д. 64');
INSERT INTO public.parking (id, number, total, cost, latitude, longtitude, address) VALUES (68, 1022, 49, 40.00, 54.17926700, 37.60213800, 'г.Тула ,проспект Ленина, д. 66');
INSERT INTO public.parking (id, number, total, cost, latitude, longtitude, address) VALUES (69, 1022, 2, 40.00, 54.17999250, 37.60330450, 'г.Тула ,проспект Ленина, д. 77');
INSERT INTO public.parking (id, number, total, cost, latitude, longtitude, address) VALUES (70, 1022, 2, 40.00, 54.18041250, 37.60375700, 'г.Тула ,проспект Ленина, д. 77');
INSERT INTO public.parking (id, number, total, cost, latitude, longtitude, address) VALUES (71, 1022, 6, 40.00, 54.18214750, 37.60558250, 'г.Тула ,проспект Ленина, д. 65');
INSERT INTO public.parking (id, number, total, cost, latitude, longtitude, address) VALUES (72, 1023, 22, 40.00, 54.19613450, 37.61049050, 'г.Тула ,Красноармейский проспект, д. 1');
INSERT INTO public.parking (id, number, total, cost, latitude, longtitude, address) VALUES (73, 1023, 8, 40.00, 54.19634350, 37.60983400, 'г.Тула ,Красноармейский проспект, д. 4');
INSERT INTO public.parking (id, number, total, cost, latitude, longtitude, address) VALUES (74, 1023, 13, 40.00, 54.19638600, 37.60754800, 'г.Тула ,Красноармейский проспект, д. 5');
INSERT INTO public.parking (id, number, total, cost, latitude, longtitude, address) VALUES (75, 1023, 24, 40.00, 54.19662100, 37.60502050, 'г.Тула ,Красноармейский проспект, д. 7');
INSERT INTO public.parking (id, number, total, cost, latitude, longtitude, address) VALUES (76, 1023, 50, 40.00, 54.19677950, 37.60484700, 'г.Тула ,Красноармейский проспект, д. 8');
INSERT INTO public.parking (id, number, total, cost, latitude, longtitude, address) VALUES (77, 1023, 26, 40.00, 54.19680300, 37.60300550, 'г.Тула ,Красноармейский проспект, д. 9-11');
INSERT INTO public.parking (id, number, total, cost, latitude, longtitude, address) VALUES (78, 1023, 11, 40.00, 54.19706100, 37.59994550, 'г.Тула ,Красноармейский проспект, д. 13');
INSERT INTO public.parking (id, number, total, cost, latitude, longtitude, address) VALUES (79, 1023, 32, 40.00, 54.19764100, 37.59315300, 'г.Тула ,Красноармейский проспект, д. 19-21');
INSERT INTO public.parking (id, number, total, cost, latitude, longtitude, address) VALUES (80, 1001, 10, 40.00, 54.19466200, 37.61781150, 'г.Тула ,улица Менделеевская, д. 8');
INSERT INTO public.parking (id, number, total, cost, latitude, longtitude, address) VALUES (81, 1010, 5, 40.00, 54.19343150, 37.62353500, 'г.Тула ,улица Дзержинского, д. 1');
INSERT INTO public.parking (id, number, total, cost, latitude, longtitude, address) VALUES (82, 1010, 3, 40.00, 54.19322200, 37.62411550, 'г.Тула ,улица Дзержинского, д. 3');
INSERT INTO public.parking (id, number, total, cost, latitude, longtitude, address) VALUES (83, 1010, 5, 40.00, 54.19272950, 37.62500350, 'г.Тула ,улица Дзержинского, д. 4-6');
INSERT INTO public.parking (id, number, total, cost, latitude, longtitude, address) VALUES (84, 1010, 12, 40.00, 54.19195400, 37.62678000, 'г.Тула ,улица Дзержинского, д. 10');
INSERT INTO public.parking (id, number, total, cost, latitude, longtitude, address) VALUES (85, 1010, 11, 40.00, 54.19139650, 37.62836200, 'г.Тула ,улица Советская, д. 110');
INSERT INTO public.parking (id, number, total, cost, latitude, longtitude, address) VALUES (86, 1019, 66, 40.00, 54.19262150, 37.61268150, 'г.Тула ,ул. Демонстрации, д. 1г');
INSERT INTO public.parking (id, number, total, cost, latitude, longtitude, address) VALUES (87, 1022, 12, 40.00, 54.17851650, 37.60133450, 'г.Тула ,проспект Ленина, д. 68');
INSERT INTO public.parking (id, number, total, cost, latitude, longtitude, address) VALUES (88, 1022, 6, 40.00, 54.18171950, 37.60510750, 'г.Тула ,проспект Ленина, д. 65');
INSERT INTO public.parking (id, number, total, cost, latitude, longtitude, address) VALUES (89, 1023, 13, 40.00, 54.19640700, 37.60911650, 'г.Тула ,Красноармейский проспект, д. 4');
INSERT INTO public.parking (id, number, total, cost, latitude, longtitude, address) VALUES (90, 1023, 16, 40.00, 54.19826800, 37.58773950, 'г.Тула ,Красноармейский проспект, д. 38');
INSERT INTO public.parking (id, number, total, cost, latitude, longtitude, address) VALUES (91, 1023, 11, 40.00, 54.19656950, 37.60780400, 'г.Тула ,Красноармейский проспект, д. 6');
INSERT INTO public.parking (id, number, total, cost, latitude, longtitude, address) VALUES (92, 1023, 12, 40.00, 54.19780750, 37.59304650, 'г.Тула ,Красноармейский проспект, д. 32');
INSERT INTO public.parking (id, number, total, cost, latitude, longtitude, address) VALUES (93, 1012, 2, 40.00, 54.19285300, 37.62051550, 'г.Тула ,Тургеневская улица, д. 2');
INSERT INTO public.parking (id, number, total, cost, latitude, longtitude, address) VALUES (94, 1012, 23, 40.00, 54.19204800, 37.61968550, 'г.Тула ,ул. Советская, д. 47');
INSERT INTO public.parking (id, number, total, cost, latitude, longtitude, address) VALUES (95, 1015, 7, 40.00, 54.18702650, 37.61739400, 'г.Тула ,улица Каминского, д. 4 - 4б');
INSERT INTO public.parking (id, number, total, cost, latitude, longtitude, address) VALUES (96, 1015, 13, 40.00, 54.18755050, 37.61609450, 'г.Тула ,улица Каминского, д. 6 - 8');
INSERT INTO public.parking (id, number, total, cost, latitude, longtitude, address) VALUES (97, 1015, 16, 40.00, 54.18820200, 37.61446250, 'г.Тула ,улица Каминского, д. 12');
INSERT INTO public.parking (id, number, total, cost, latitude, longtitude, address) VALUES (98, 1015, 17, 40.00, 54.18826450, 37.61406900, 'г.Тула ,проспект Ленина, д. 35');
INSERT INTO public.parking (id, number, total, cost, latitude, longtitude, address) VALUES (99, 1015, 12, 40.00, 54.18747050, 37.61596450, 'г.Тула ,улица Каминского, д. 7 - 11');
INSERT INTO public.parking (id, number, total, cost, latitude, longtitude, address) VALUES (100, 1015, 11, 40.00, 54.18686000, 37.61750250, 'г.Тула ,улица Каминского, д. 1 - 5');
INSERT INTO public.parking (id, number, total, cost, latitude, longtitude, address) VALUES (101, 1001, 52, 40.00, 54.19088950, 37.62467250, 'г.Тула ,ул. Менделеевская, 1, д. ул. Советская, 59');
INSERT INTO public.parking (id, number, total, cost, latitude, longtitude, address) VALUES (102, 2001, 162, 100.00, 54.19721750, 37.61330850, 'г.Тула ,улица Союзная, д. улица Благовещенская');
INSERT INTO public.parking (id, number, total, cost, latitude, longtitude, address) VALUES (103, 1001, 2, 40.00, 54.19185950, 37.62374550, 'г.Тула ,улица Никитская, д. 8');
INSERT INTO public.parking (id, number, total, cost, latitude, longtitude, address) VALUES (104, 1002, 2, 40.00, 54.19519600, 37.61604100, 'г.Тула ,улица Революции, д. 2');
INSERT INTO public.parking (id, number, total, cost, latitude, longtitude, address) VALUES (105, 1002, 23, 40.00, 54.19574700, 37.61638050, 'г.Тула ,Крестовоздвиженская площадь, д. 1');
INSERT INTO public.parking (id, number, total, cost, latitude, longtitude, address) VALUES (106, 1016, 3, 40.00, 54.19168418, 37.61395148, 'г.Тула ,улица Ленина, д. 18');
INSERT INTO public.parking (id, number, total, cost, latitude, longtitude, address) VALUES (107, 1016, 15, 40.00, 54.18984300, 37.61193850, 'г.Тула ,переулок Центральный, д. 9а');
INSERT INTO public.parking (id, number, total, cost, latitude, longtitude, address) VALUES (108, 1001, 4, 40.00, 54.19275700, 37.62143600, 'г.Тула ,улица Менделеевская, д. 11');
INSERT INTO public.parking (id, number, total, cost, latitude, longtitude, address) VALUES (109, 1020, 20, 40.00, 54.18994650, 37.62385350, 'г.Тула ,улица Советская, д. 88');
INSERT INTO public.parking (id, number, total, cost, latitude, longtitude, address) VALUES (110, 1001, 18, 40.00, 54.19372300, 37.61974250, 'г.Тула ,улица Менделеевская, д. 8');


--
-- TOC entry 2144 (class 0 OID 16425)
-- Dependencies: 188
-- Data for Name: vehicle; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.vehicle (id, number) VALUES (2, 'ТЕ123А');
INSERT INTO public.vehicle (id, number) VALUES (1, 'РА057В');
INSERT INTO public.vehicle (id, number) VALUES (3, 'КМ777Р');


--
-- TOC entry 2156 (class 0 OID 0)
-- Dependencies: 189
-- Name: booking_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.booking_id_seq', 10, true);


--
-- TOC entry 2157 (class 0 OID 0)
-- Dependencies: 185
-- Name: parking_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.parking_id_seq', 110, true);


--
-- TOC entry 2158 (class 0 OID 0)
-- Dependencies: 187
-- Name: vehicle_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.vehicle_id_seq', 1, false);


--
-- TOC entry 2021 (class 2606 OID 16451)
-- Name: booking booking_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.booking
    ADD CONSTRAINT booking_pkey PRIMARY KEY (id);


--
-- TOC entry 2017 (class 2606 OID 16422)
-- Name: parking parking_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.parking
    ADD CONSTRAINT parking_pkey PRIMARY KEY (id);


--
-- TOC entry 2019 (class 2606 OID 16430)
-- Name: vehicle vehicle_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vehicle
    ADD CONSTRAINT vehicle_pkey PRIMARY KEY (id);


--
-- TOC entry 2023 (class 2606 OID 16452)
-- Name: booking booking_parking_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.booking
    ADD CONSTRAINT booking_parking_id_fkey FOREIGN KEY (parking_id) REFERENCES public.parking(id);


--
-- TOC entry 2022 (class 2606 OID 16457)
-- Name: booking booking_vehicle_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.booking
    ADD CONSTRAINT booking_vehicle_id_fkey FOREIGN KEY (vehicle_id) REFERENCES public.vehicle(id);


-- Completed on 2021-01-05 13:35:56

--
-- PostgreSQL database dump complete
--

