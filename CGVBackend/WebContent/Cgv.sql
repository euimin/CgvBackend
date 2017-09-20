
/* Drop Tables */

DROP TABLE FAQ CASCADE CONSTRAINTS;
DROP TABLE LEASE CASCADE CONSTRAINTS;
DROP TABLE LIKES CASCADE CONSTRAINTS;
DROP TABLE LOST CASCADE CONSTRAINTS;
DROP TABLE QNA CASCADE CONSTRAINTS;
DROP TABLE REVIEW CASCADE CONSTRAINTS;
DROP TABLE WISH CASCADE CONSTRAINTS;
DROP TABLE MEMBERS CASCADE CONSTRAINTS;
DROP TABLE RESERVE CASCADE CONSTRAINTS;
DROP TABLE SCREENING CASCADE CONSTRAINTS;
DROP TABLE STILL CASCADE CONSTRAINTS;
DROP TABLE TRAILER CASCADE CONSTRAINTS;
DROP TABLE MOVIE CASCADE CONSTRAINTS;
DROP TABLE NEWS CASCADE CONSTRAINTS;
DROP TABLE NONMEMBER CASCADE CONSTRAINTS;
DROP TABLE PRICE CASCADE CONSTRAINTS;
DROP TABLE SEAT CASCADE CONSTRAINTS;
DROP TABLE SCREEN CASCADE CONSTRAINTS;
DROP TABLE THEATER CASCADE CONSTRAINTS;




/* Create Tables */

CREATE TABLE FAQ
(
	no number NOT NULL,
	category varchar2(20) NOT NULL,
	title varchar2(100) NOT NULL,
	postdate date DEFAULT sysdate NOT NULL,
	visitcount number DEFAULT 0 NOT NULL,
	content nvarchar2(1000) NOT NULL,
	PRIMARY KEY (no)
);


CREATE TABLE LEASE
(
	no number NOT NULL,
	theater nvarchar2(20) NOT NULL,
	leasedate date NOT NULL,
	hour number NOT NULL,
	people number NOT NULL,
	content varchar2(2400) NOT NULL,
	name nvarchar2(10) NOT NULL,
	phone varchar2(11) NOT NULL,
	email varchar2(30) NOT NULL,
	writedate date DEFAULT sysdate NOT NULL,
	PRIMARY KEY (no)
);


CREATE TABLE LIKES
(
	no number NOT NULL,
	review_no number NOT NULL,
	id varchar2(20) NOT NULL,
	regidate date DEFAULT sysdate NOT NULL,
	PRIMARY KEY (no)
);


CREATE TABLE LOST
(
	no number NOT NULL,
	id varchar2(20) NOT NULL,
	place nvarchar2(30) NOT NULL,
	lostdate date NOT NULL,
	hour number NOT NULL,
	minute number,
	type nvarchar2(4) NOT NULL,
	color nvarchar2(10),
	title varchar2(100) NOT NULL,
	content varchar2(2400) NOT NULL,
	writedate date DEFAULT sysdate NOT NULL,
	PRIMARY KEY (no)
);


CREATE TABLE MEMBERS
(
	id varchar2(20) NOT NULL,
	name varchar2(20) NOT NULL,
	password varchar2(20) NOT NULL,
	birth date NOT NULL,
	phone varchar2(13) NOT NULL,
	email varchar2(30) NOT NULL,
	regidate date DEFAULT sysdate NOT NULL,
	gender varchar2(1) NOT NULL,
	nickname nvarchar2(10) UNIQUE,
	profilepicture varchar2(30),
	PRIMARY KEY (id)
);


CREATE TABLE MOVIE
(
	movie_code varchar2(20) NOT NULL,
	title nvarchar2(30) NOT NULL,
	engtitle varchar2(30),
	poster varchar2(30),
	director nvarchar2(10) NOT NULL,
	actor nvarchar2(50) NOT NULL,
	genre nvarchar2(20) NOT NULL,
	rating nvarchar2(20) NOT NULL,
	runningtime number NOT NULL,
	country nvarchar2(20) NOT NULL,
	releasedate date NOT NULL,
	website varchar2(20),
	summary nvarchar2(1000) NOT NULL,
	PRIMARY KEY (movie_code)
);


CREATE TABLE NEWS
(
	no number NOT NULL,
	category varchar2(20) NOT NULL,
	title varchar2(100) NOT NULL,
	postdate date DEFAULT sysdate NOT NULL,
	visitcount number DEFAULT 0 NOT NULL,
	content nvarchar2(1000) NOT NULL,
	PRIMARY KEY (no)
);


CREATE TABLE NONMEMBER
(
	nonmember_id varchar2(20) NOT NULL,
	name varchar2(20) NOT NULL,
	birth varchar2(6) NOT NULL,
	phone varchar2(13) NOT NULL,
	password varchar2(4) NOT NULL,
	PRIMARY KEY (nonmember_id)
);


CREATE TABLE PRICE
(
	no number NOT NULL,
	week nvarchar2(2) NOT NULL,
	time nvarchar2(5) NOT NULL,
	type varchar2(8) NOT NULL,
	price number NOT NULL,
	PRIMARY KEY (no)
);


CREATE TABLE QNA
(
	no number NOT NULL,
	id varchar2(20) NOT NULL,
	category nvarchar2(2) NOT NULL,
	theater nvarchar2(20) NOT NULL,
	title varchar2(100) NOT NULL,
	content varchar2(2400) NOT NULL,
	filename varchar2(50),
	writedate date DEFAULT sysdate NOT NULL,
	PRIMARY KEY (no)
);


CREATE TABLE RESERVE
(
	code varchar2(20) NOT NULL,
	screening_code varchar2(20) NOT NULL,
	id nvarchar2(20) NOT NULL,
	people nvarchar2(30) NOT NULL,
	seat varchar2(10) NOT NULL,
	seatnumber varchar2(31) NOT NULL,
	reservedate date DEFAULT sysdate NOT NULL,
	PRIMARY KEY (code)
);


CREATE TABLE REVIEW
(
	review_no number NOT NULL,
	movie_code varchar2(20) NOT NULL,
	id varchar2(20) NOT NULL,
	feedback varchar2(1) NOT NULL,
	content varchar2(140) NOT NULL,
	writedate date DEFAULT sysdate NOT NULL,
	directionpoint varchar2(1),
	storypoint varchar2(1),
	visualpoint varchar2(1),
	actingpoint varchar2(1),
	soundtrackpoint varchar2(1),
	PRIMARY KEY (review_no)
);


CREATE TABLE SCREEN
(
	screen_code varchar2(20) NOT NULL,
	theater_code varchar2(20) NOT NULL,
	no number NOT NULL,
	seats number NOT NULL,
	PRIMARY KEY (screen_code)
);


CREATE TABLE SCREENING
(
	screening_code varchar2(20) NOT NULL,
	screen_code varchar2(20) NOT NULL,
	movie_code varchar2(20) NOT NULL,
	screeningdate date NOT NULL,
	time varchar2(5) NOT NULL,
	PRIMARY KEY (screening_code)
);


CREATE TABLE SEAT
(
	seatnumber varchar2(3) NOT NULL,
	screen_code varchar2(20) NOT NULL,
	seat varchar2(11) NOT NULL,
	PRIMARY KEY (seatnumber, screen_code)
);


CREATE TABLE STILL
(
	no number NOT NULL,
	movie_code varchar2(20) NOT NULL,
	filename varchar2(50) NOT NULL,
	PRIMARY KEY (no)
);


CREATE TABLE THEATER
(
	theater_code varchar2(20) NOT NULL,
	name nvarchar2(20) NOT NULL,
	region nvarchar2(10) NOT NULL,
	transportationinfo varchar2(500) NOT NULL,
	parkinginfo varchar2(500) NOT NULL,
	playrooms number NOT NULL,
	seats number NOT NULL,
	addr1 varchar2(50) NOT NULL,
	addr2 varchar2(50),
	roadaddr1 varchar2(50) NOT NULL,
	roadaddr2 varchar2(50),
	PRIMARY KEY (theater_code)
);


CREATE TABLE TRAILER
(
	no number NOT NULL,
	movie_code varchar2(20) NOT NULL,
	filename varchar2(50) NOT NULL,
	PRIMARY KEY (no)
);


CREATE TABLE WISH
(
	no number NOT NULL,
	movie_code varchar2(20) NOT NULL,
	id varchar2(20) NOT NULL,
	regidate date DEFAULT sysdate NOT NULL,
	PRIMARY KEY (no)
);



/* Create Foreign Keys */

ALTER TABLE LIKES
	ADD FOREIGN KEY (id)
	REFERENCES MEMBERS (id)
;


ALTER TABLE LOST
	ADD FOREIGN KEY (id)
	REFERENCES MEMBERS (id)
;


ALTER TABLE QNA
	ADD FOREIGN KEY (id)
	REFERENCES MEMBERS (id)
;


ALTER TABLE REVIEW
	ADD FOREIGN KEY (id)
	REFERENCES MEMBERS (id)
;


ALTER TABLE WISH
	ADD FOREIGN KEY (id)
	REFERENCES MEMBERS (id)
;


ALTER TABLE REVIEW
	ADD FOREIGN KEY (movie_code)
	REFERENCES MOVIE (movie_code)
;


ALTER TABLE SCREENING
	ADD FOREIGN KEY (movie_code)
	REFERENCES MOVIE (movie_code)
;


ALTER TABLE STILL
	ADD FOREIGN KEY (movie_code)
	REFERENCES MOVIE (movie_code)
;


ALTER TABLE TRAILER
	ADD FOREIGN KEY (movie_code)
	REFERENCES MOVIE (movie_code)
;


ALTER TABLE WISH
	ADD FOREIGN KEY (movie_code)
	REFERENCES MOVIE (movie_code)
;


ALTER TABLE LIKES
	ADD FOREIGN KEY (review_no)
	REFERENCES REVIEW (review_no)
;


ALTER TABLE SCREENING
	ADD FOREIGN KEY (screen_code)
	REFERENCES SCREEN (screen_code)
;


ALTER TABLE SEAT
	ADD FOREIGN KEY (screen_code)
	REFERENCES SCREEN (screen_code)
;


ALTER TABLE RESERVE
	ADD FOREIGN KEY (screening_code)
	REFERENCES SCREENING (screening_code)
;


ALTER TABLE SCREEN
	ADD FOREIGN KEY (theater_code)
	REFERENCES THEATER (theater_code)
;

---------------------------------------------------------------------------------------------------------------

DROP SEQUENCE SEQ_RESERVECODE;
DROP SEQUENCE SEQ_SCREENINGCODE;
DROP SEQUENCE SEQ_SCREENCODE;
DROP SEQUENCE SEQ_MOVIECODE;
DROP SEQUENCE SEQ_THEATERCODE;
DROP SEQUENCE SEQ_FAQNO;
DROP SEQUENCE SEQ_NEWSNO;
DROP SEQUENCE SEQ_CLICK_COUNT;
DROP SEQUENCE SEQ_QNANO;
DROP SEQUENCE SEQ_LOSTNO;
DROP SEQUENCE SEQ_RENTALNO;
DROP SEQUENCE SEQ_REVIEW;


--예약 테이블
CREATE SEQUENCE SEQ_RESERVECODE
  START WITH 1
  INCREMENT BY 1
  MAXVALUE 10000
  MINVALUE 1
  NOCACHE
  NOCYCLE;

--상영 테이블
CREATE SEQUENCE SEQ_SCREENINGCODE
  START WITH 1
  INCREMENT BY 1
  MAXVALUE 10000
  MINVALUE 1
  NOCACHE
  NOCYCLE;

--상영관 테이블
CREATE SEQUENCE SEQ_SCREENCODE
  START WITH 1
  INCREMENT BY 1
  MAXVALUE 10000
  MINVALUE 1
  NOCACHE
  NOCYCLE;

--영화 테이블
CREATE SEQUENCE SEQ_MOVIECODE
  START WITH 1
  INCREMENT BY 1
  MAXVALUE 10000
  MINVALUE 1
  NOCACHE
  NOCYCLE;


--극장 테이블
CREATE SEQUENCE SEQ_THEATERCODE
  START WITH 1
  INCREMENT BY 1
  MAXVALUE 10000
  MINVALUE 1
  NOCACHE
  NOCYCLE;

--자주찾는질문 테이블
CREATE SEQUENCE SEQ_FAQNO
  START WITH 1
  INCREMENT BY 1
  MAXVALUE 10000
  MINVALUE 1
  NOCACHE
  NOCYCLE;

--공지 뉴스 테이블
CREATE SEQUENCE SEQ_NEWSNO
  START WITH 1
  INCREMENT BY 1
  MAXVALUE 10000
  MINVALUE 1
  NOCACHE
  NOCYCLE;

CREATE SEQUENCE SEQ_CLICK_COUNT
  START WITH 1
  INCREMENT BY 1
  MAXVALUE 10000
  MINVALUE 1
  NOCACHE
  NOCYCLE;

--일대일 문의 테이블
CREATE SEQUENCE SEQ_QNANO
  START WITH 1
  INCREMENT BY 1
  MAXVALUE 10000
  MINVALUE 1
  NOCACHE
  NOCYCLE;

--분실물 문의 테이블
CREATE SEQUENCE SEQ_LOSTNO
  START WITH 1
  INCREMENT BY 1
  MAXVALUE 10000
  MINVALUE 1
  NOCACHE
  NOCYCLE;

--렌탈 테이블
CREATE SEQUENCE SEQ_RENTALNO
  START WITH 1
  INCREMENT BY 1
  MAXVALUE 10000
  MINVALUE 1
  NOCACHE
  NOCYCLE;

--리뷰 테이블
CREATE SEQUENCE SEQ_REVIEW
  START WITH 1
  INCREMENT BY 1
  MAXVALUE 10000
  MINVALUE 1
  NOCACHE
  NOCYCLE;


--회원 테이블
INSERT INTO MEMBERS VALUES('HANSOIN1','낭만님','1004','2000-12-13','01012345678','HANSOIN.COM',SYSDATE,'M','STAR','없음');
INSERT INTO MEMBERS VALUES('HANSOIN2','의민님','1004','2000-12-18','01012345678','HANSOIN.COM',SYSDATE,'F','STAR1','없음');
INSERT INTO MEMBERS VALUES('HANSOIN3','미영님','1004','2000-12-19','01012345678','HANSOIN.COM',SYSDATE,'F','STAR2','없음');
INSERT INTO MEMBERS VALUES('HANSOIN4','지열님','1004','2000-12-16','01012345678','HANSOIN.COM',SYSDATE,'M','STAR3','없음');
INSERT INTO MEMBERS VALUES('HANSOIN5','욱정님','1004','2000-12-15','01012345678','HANSOIN.COM',SYSDATE,'M','STAR4','없음');
INSERT INTO MEMBERS VALUES('HANSOIN6','태호님','1004','2000-12-17','01012345678','HANSOIN.COM',SYSDATE,'M','STAR5','없음');
INSERT INTO MEMBERS VALUES('HANSOIN7','순성님','1004','2000-12-14','01012345678','HANSOIN.COM',SYSDATE,'M','STAR6','없음');

--영화 테이블
insert into movie values(SEQ_MOVIECODE.nextval,'택시운전사','taxi_driver','taxi_poster','택시 감독','택시 배우','가족','15세 관람가','120','한국','2017-08-04','CGV','택시영화입니다');
insert into movie values(SEQ_MOVIECODE.nextval,'보트운전사','boat_driver','boat_poster','보트 감독','보트 배우','공포','15세 관람가','120','미국','2017-08-08','CGV.co.kr','보트영화입니다');
insert into movie values(SEQ_MOVIECODE.nextval,'버스운전사','bus_driver','bus_poster','버스 감독','버스 배우','드라마','12세 관람가','100','일본','2017-08-10','CGV.co.kr','버스영화입니다');
insert into movie values(SEQ_MOVIECODE.nextval,'비행기운전사','airplain_driver','airplain_poster','비행기 감독','비행기 배우','SF','전체 관람가','100','중국','2017-08-13','CGV.co.kr','비행기영화입니다');
insert into movie values(SEQ_MOVIECODE.nextval,'크레인운전사','crane_driver','crane_poster','크레인 감독','크레인 배우','멜로','청소년 관람불가','100','홍콩','2017-08-11','CGV.co.kr','크레인영화입니다');
insert into movie values(SEQ_MOVIECODE.nextval,'굴삭기운전사','forkcrane_driver','forkcrane_poster','굴삭기 감독','굴삭기 배우','멜로','청소년 관람불가','100','홍콩','2017-08-21','CGV.co.kr','굴삭기영화입니다');
insert into movie values(SEQ_MOVIECODE.nextval,'오토바이운전사','motor_driver','motor_poster','오토바이 감독','오토바이 배우','미스테리','청소년 관람불가','110','영국','2017-08-22','CGV.co.kr','오토바이영화입니다');

--극장 테이블
insert into theater values(SEQ_THEATERCODE.nextval,'강남CGV','서울', '지하철타고오세요','주차장없음','8','1600', '서울특별시 강남구 역삼동 814-6 스타플렉스', null, '서울특별시 강남구 강남대로 438 (역삼동)', null);
insert into theater values(SEQ_THEATERCODE.nextval,'구로CGV','서울', '차타고오세요','주차장제공','7','1400', '서울특별시 강남구 역삼동 814-6 스타플렉스', null, '서울특별시 강남구 강남대로 438 (역삼동)', null);
insert into theater values(SEQ_THEATERCODE.nextval,'강변CGV','서울', '버스타고오세요','주차장제공','6','1200', '서울특별시 강남구 역삼동 814-6 스타플렉스', null, '서울특별시 강남구 강남대로 438 (역삼동)', null);
insert into theater values(SEQ_THEATERCODE.nextval,'대학로CGV','서울', '비행기타고오세요','주차장없음','10','2000', '서울특별시 강남구 역삼동 814-6 스타플렉스', null, '서울특별시 강남구 강남대로 438 (역삼동)', null);
insert into theater values(SEQ_THEATERCODE.nextval,'군자CGV','서울', '굴삭기타고오세요','주차장제공','5','1000', '서울특별시 강남구 역삼동 814-6 스타플렉스', null, '서울특별시 강남구 강남대로 438 (역삼동)', null);
insert into theater values(SEQ_THEATERCODE.nextval,'신도림CGV','서울', '오토바이타고오세요','주차장없음','9','1800', '서울특별시 강남구 역삼동 814-6 스타플렉스', null, '서울특별시 강남구 강남대로 438 (역삼동)', null);
insert into theater values(SEQ_THEATERCODE.nextval,'영등포CGV','서울', '배타고오세요','주차장제공','6','1100', '서울특별시 강남구 역삼동 814-6 스타플렉스', null, '서울특별시 강남구 강남대로 438 (역삼동)', null);

--상영관 테이블(극장테이블 자식)
insert into screen values(SEQ_SCREENCODE.nextval,'3','5','150');
insert into screen values(SEQ_SCREENCODE.nextval,'2','6','120');
insert into screen values(SEQ_SCREENCODE.nextval,'5','4','240');
insert into screen values(SEQ_SCREENCODE.nextval,'4','3','200');
insert into screen values(SEQ_SCREENCODE.nextval,'3','2','140');
insert into screen values(SEQ_SCREENCODE.nextval,'5','3','100');
insert into screen values(SEQ_SCREENCODE.nextval,'3','6','130');

--상영 테이블(상영관 테이블 자식, 영화테이블 자식)
insert into screening values(SEQ_SCREENINGCODE.nextval,'4','2','2017-10-31','20:00');
insert into screening values(SEQ_SCREENINGCODE.nextval,'3','6','2017-11-21','17:00');
insert into screening values(SEQ_SCREENINGCODE.nextval,'5','7','2017-12-01','18:30');
insert into screening values(SEQ_SCREENINGCODE.nextval,'7','6','2017-01-05','21:30');
insert into screening values(SEQ_SCREENINGCODE.nextval,'2','5','2017-02-04','10:30');
insert into screening values(SEQ_SCREENINGCODE.nextval,'4','3','2017-03-04','12:30');
insert into screening values(SEQ_SCREENINGCODE.nextval,'6','4','2017-08-04','16:30');


--예매 테이블(상영 테이블 자식)
insert into reserve values(SEQ_RESERVECODE.nextval,'4','HANSOIN1','2','prime','K5,K6',sysdate);
insert into reserve values(SEQ_RESERVECODE.nextval,'5','HANSOIN2','4','standard','I9,I10',sysdate);
insert into reserve values(SEQ_RESERVECODE.nextval,'3','HANSOIN3','3','economy','D10',sysdate);
insert into reserve values(SEQ_RESERVECODE.nextval,'4','HANSOIN4','3','prime','K7,K8,K9',sysdate);
insert into reserve values(SEQ_RESERVECODE.nextval,'5','HANSOIN5','4','standard','F7,F8,F9,F10',sysdate);
insert into reserve values(SEQ_RESERVECODE.nextval,'6','HANSOIN6','7','economy','C1',sysdate);
insert into reserve values(SEQ_RESERVECODE.nextval,'7','HANSOIN7','2','economy','D5,D6',sysdate);






--자주찾는질문 테이블
insert into faq values(SEQ_FAQNO.nextval,'할인혜택','제목1',default,default,'내용없음');
insert into faq values(SEQ_FAQNO.nextval,'영화관이용','제목2',default,default,'내용없음');
insert into faq values(SEQ_FAQNO.nextval,'특별관','제목3',default,default,'내용없음');
insert into faq values(SEQ_FAQNO.nextval,'할인혜택','제목4',default,default,'내용없음');
insert into faq values(SEQ_FAQNO.nextval,'기프트샵','제목5',default,default,'내용없음');
insert into faq values(SEQ_FAQNO.nextval,'홈페이지','제목6',default,default,'내용없음');
insert into faq values(SEQ_FAQNO.nextval,'모바일','제목7',default,default,'내용없음');

--공지 뉴스 테이블
insert into news values(SEQ_NEWSNO.nextval,'극장','제목1',SYSDATE,SEQ_CLICK_COUNT.nextval,'내용없음');
insert into news values(SEQ_NEWSNO.nextval,'기타','제목2',SYSDATE,SEQ_CLICK_COUNT.nextval,'내용없음');
insert into news values(SEQ_NEWSNO.nextval,'시스템점검','제목3',SYSDATE,SEQ_CLICK_COUNT.nextval,'내용없음');
insert into news values(SEQ_NEWSNO.nextval,'극장','제목4',SYSDATE,SEQ_CLICK_COUNT.nextval,'내용없음');
insert into news values(SEQ_NEWSNO.nextval,'행사/이벤트','제목5',SYSDATE,SEQ_CLICK_COUNT.nextval,'내용없음');
insert into news values(SEQ_NEWSNO.nextval,'극장','제목6',SYSDATE,SEQ_CLICK_COUNT.nextval,'내용없음');
insert into news values(SEQ_NEWSNO.nextval,'기타','제목7',SYSDATE,SEQ_CLICK_COUNT.nextval,'내용없음');

--일대일문의 테이블(회원 자식)
INSERT INTO QNA(NO,ID,CATEGORY,THEATER,TITLE,CONTENT,WRITEDATE) VALUES(SEQ_QNANO.NEXTVAL,'HANSOIN1','문의','선택하지않음','제목1','내용없음',SYSDATE);
INSERT INTO QNA(NO,ID,CATEGORY,THEATER,TITLE,CONTENT,WRITEDATE) VALUES(SEQ_QNANO.NEXTVAL,'HANSOIN2','불만','선택하지않음','제목2','내용없음',SYSDATE);
INSERT INTO QNA(NO,ID,CATEGORY,THEATER,TITLE,CONTENT,WRITEDATE) VALUES(SEQ_QNANO.NEXTVAL,'HANSOIN3','칭찬','선택하지않음','제목3','내용없음',SYSDATE);
INSERT INTO QNA(NO,ID,CATEGORY,THEATER,TITLE,CONTENT,WRITEDATE) VALUES(SEQ_QNANO.NEXTVAL,'HANSOIN4','제안','선택하지않음','제목4','내용없음',SYSDATE);
INSERT INTO QNA(NO,ID,CATEGORY,THEATER,TITLE,CONTENT,WRITEDATE) VALUES(SEQ_QNANO.NEXTVAL,'HANSOIN5','불만','선택하지않음','제목5','내용없음',SYSDATE);
INSERT INTO QNA(NO,ID,CATEGORY,THEATER,TITLE,CONTENT,WRITEDATE) VALUES(SEQ_QNANO.NEXTVAL,'HANSOIN6','문의','선택하지않음','제목6','내용없음',SYSDATE);
INSERT INTO QNA(NO,ID,CATEGORY,THEATER,TITLE,CONTENT,WRITEDATE) VALUES(SEQ_QNANO.NEXTVAL,'HANSOIN7','제안','선택하지않음','제목7','내용없음',SYSDATE);




--분실물 문의 테이블(회원 자식)
INSERT INTO LOST VALUES(SEQ_LOSTNO.NEXTVAL,'HANSOIN1','CGV강남','2017-05-05','20','20','핸드폰','노랑','제목없음','내용없음',SYSDATE);
INSERT INTO LOST VALUES(SEQ_LOSTNO.NEXTVAL,'HANSOIN2','CGV강변','2017-05-06','21','20','지갑','남색','제목없음','내용없음',SYSDATE);
INSERT INTO LOST VALUES(SEQ_LOSTNO.NEXTVAL,'HANSOIN3','CGV강동','2017-05-07','10','20','가방','하늘색','제목없음','내용없음',SYSDATE);
INSERT INTO LOST VALUES(SEQ_LOSTNO.NEXTVAL,'HANSOIN4','CGV신도림','2017-05-08','11','30','의류','녹색','제목없음','내용없음',SYSDATE);
INSERT INTO LOST VALUES(SEQ_LOSTNO.NEXTVAL,'HANSOIN5','CGV대학로','2017-05-09','20','50','책','빨강','제목없음','내용없음',SYSDATE);
INSERT INTO LOST VALUES(SEQ_LOSTNO.NEXTVAL,'HANSOIN6','CGV군자','2017-05-15','16','50','우산','파랑','제목없음','내용없음',SYSDATE);
INSERT INTO LOST VALUES(SEQ_LOSTNO.NEXTVAL,'HANSOIN7','CGV명동','2017-05-25','17','20','귀금속','노랑','제목없음','내용없음',SYSDATE);


--단체대관 문의 테이블
INSERT INTO LEASE VALUES(SEQ_RENTALNO.NEXTVAL,'특별관','2017-10-10','12','1','내용없음','낭만님','01012345678','HANSOIN1.naver.com',SYSDATE);
INSERT INTO LEASE VALUES(SEQ_RENTALNO.NEXTVAL,'특별관','2017-10-12','16','2','내용없음','의민님','01012345678','HANSOIN2.naver.com',SYSDATE);
INSERT INTO LEASE VALUES(SEQ_RENTALNO.NEXTVAL,'특별관','2017-10-13','17','2','내용없음','미영님','01012345678','HANSOIN3.naver.com',SYSDATE);
INSERT INTO LEASE VALUES(SEQ_RENTALNO.NEXTVAL,'일반관','2017-10-15','18','3','내용없음','지열님','01012345678','HANSOIN4.naver.com',SYSDATE);
INSERT INTO LEASE VALUES(SEQ_RENTALNO.NEXTVAL,'일반관','2017-10-16','19','3','내용없음','태호님','01012345678','HANSOIN5.naver.com',SYSDATE);
INSERT INTO LEASE VALUES(SEQ_RENTALNO.NEXTVAL,'일반관','2017-10-18','20','4','내용없음','욱정님','01012345678','HANSOIN6.naver.com',SYSDATE);
INSERT INTO LEASE VALUES(SEQ_RENTALNO.NEXTVAL,'일반관','2017-10-19','21','4','내용없음','순성님','01012345678','HANSOIN7.naver.com',SYSDATE);



--리뷰 테이블
INSERT INTO REVIEW(REVIEW_NO,MOVIE_CODE,ID,FEEDBACK,CONTENT,WRITEDATE) VALUES(SEQ_REVIEW.NEXTVAL,'7','HANSOIN1','u','내용없음',SYSDATE);
INSERT INTO REVIEW(REVIEW_NO,MOVIE_CODE,ID,FEEDBACK,CONTENT,WRITEDATE) VALUES(SEQ_REVIEW.NEXTVAL,'6','HANSOIN2','u','내용없음',SYSDATE);
INSERT INTO REVIEW(REVIEW_NO,MOVIE_CODE,ID,FEEDBACK,CONTENT,WRITEDATE) VALUES(SEQ_REVIEW.NEXTVAL,'5','HANSOIN3','u','내용없음',SYSDATE);
INSERT INTO REVIEW(REVIEW_NO,MOVIE_CODE,ID,FEEDBACK,CONTENT,WRITEDATE) VALUES(SEQ_REVIEW.NEXTVAL,'4','HANSOIN4','u','내용없음',SYSDATE);
INSERT INTO REVIEW(REVIEW_NO,MOVIE_CODE,ID,FEEDBACK,CONTENT,WRITEDATE) VALUES(SEQ_REVIEW.NEXTVAL,'3','HANSOIN5','u','내용없음',SYSDATE);
INSERT INTO REVIEW(REVIEW_NO,MOVIE_CODE,ID,FEEDBACK,CONTENT,WRITEDATE) VALUES(SEQ_REVIEW.NEXTVAL,'2','HANSOIN6','u','내용없음',SYSDATE);
INSERT INTO REVIEW(REVIEW_NO,MOVIE_CODE,ID,FEEDBACK,CONTENT,WRITEDATE) VALUES(SEQ_REVIEW.NEXTVAL,'2','HANSOIN7','u','내용없음',SYSDATE);

--좌석 테이블(상영관 테이블 자식)
insert into seat values('K1', '5', 'prime');
insert into seat values('B5', '2', 'economy');
insert into seat values('F8', '3', 'standard');
insert into seat values('E11', '4', 'standard');
insert into seat values('L13', '6', 'prime');
insert into seat values('J18', '7', 'prime');
insert into seat values('A6', '4', 'economy');










