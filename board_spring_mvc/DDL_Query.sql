CREATE TABLE member(mno NUMBER PRIMARY KEY,
					grade CHAR DEFAULT 'N',
                    password VARCHAR2(255) NOT NULL,
                    mname VARCHAR2(255) NOT NULL,
                    phone VARCHAR2(255) NOT NULL,
                    email VARCHAR2(255) NOT NULL);

                    
create table suyo (
					
					dietno NUMBER references diet(dietno),
					mno NUMBER REFERENCES member(mno)
)

delete from suyo where mno=3333;

select * from suyo where mno=3333;

select s.dietno, s.mno, d.dietdate
from suyo s, (	select dietno, dietdate
				from diet
				) d
where s.dietno = d.dietno;

select * from diet;

select * from suyo
order by dietno;

select * from suyo
order by mno, dietno;

delete from suyo where mno=1111;

insert into suyo(dietno, mno) values(21, 1111);
insert into suyo(dietno, mno) values(22, 1111);
insert into suyo(dietno, mno) values(23, 1111);
insert into suyo(dietno, mno) values(24, 1111);
insert into suyo(dietno, mno) values(25, 1111);
insert into suyo(dietno, mno) values(26, 1111);
insert into suyo(dietno, mno) values(27, 1111);
insert into suyo(dietno, mno) values(28, 1111);
insert into suyo(dietno, mno) values(29, 1111);
insert into suyo(dietno, mno) values(30, 1111);
insert into suyo(dietno, mno) values(31, 1111);
insert into suyo(dietno, mno) values(32, 1111);
insert into suyo(dietno, mno) values(33, 1111);
insert into suyo(dietno, mno) values(34, 1111);
insert into suyo(dietno, mno) values(35, 1111);
insert into suyo(dietno, mno) values(36, 1111);
insert into suyo(dietno, mno) values(37, 1111);
insert into suyo(dietno, mno) values(38, 1111);
insert into suyo(dietno, mno) values(39, 1111);
insert into suyo(dietno, mno) values(40, 1111);

alter table member add prefer varchar2(2000)

select di.dietno "dietNo", count(*) "suyoCountAll"
from SUYO su, diet di
where di.dietno = su.dietno(+)
group by di.dietno
order by di.dietno;

select di.dietno "dietNo", count(*) "suyoCountAll"
from SUYO su, diet di
where di.dietno = su.dietno(+) 



select * from diet;

insert into SUYO(dietno, mno) values(27, 2222);
                    
insert into member(mno, grade, password, mname, phone, email)
values(1111, 'n', '1234', 'kdn', '010-1234-5432', 'kdn@kdn.com');

CREATE TABLE REVIEWBOARD(RNO number,
						 MNO number,
                         SPOINT number,
                         COMMENTS VARCHAR2(2000),
                         FNO number,
                         FNAME VARCHAR2(255),
                         REGDATE date);
                      
create table rankingboard(rkno number,
						  rkname number,
						  imag  varchar2(255)
						 );

                         
                         
                         
drop table reviewboard;
                         
show reviewboard;
select * from reivewboard;


select * from member;

CREATE TABLE noticeBoard(nno NUMBER PRIMARY KEY,
						mno NUMBER REFERENCES member(mno),
                        title VARCHAR2(255) NOT NULL,
                        CONTENTS VARCHAR2(2000),
                        ndate date
                        );
                        
insert into noticeBoard (nno, mno, title, contents, ndate)
values(noticeboard_no.nextval, 1111, '첫번째 게시글', '안녕하세요~~~~', sysdate);
insert into noticeBoard (nno, mno, title, contents, ndate)
values(noticeboard_no.nextval, 1111, '두번째 게시글', '안녕하세요~~~~!!!!!!!', sysdate);

select * from noticeBoard;

CREATE TABLE upload(uno NUMBER PRIMARY KEY,
					rfilename VARCHAR2(2000),
                    sfilename VARCHAR2(2000),
                    nno NUMBER REFERENCES noticeBoard(nno)
                    );


CREATE TABLE schedule(scode NUMBER PRIMARY KEY,
					  sname VARCHAR2(255) NOT NULL
                      );

CREATE TABLE food(fno NUMBER PRIMARY KEY,
					fname VARCHAR2(255) NOT NULL,
                    image VARCHAR2(2000)
					);

CREATE TABLE anoBoard(ano NUMBER PRIMARY KEY,
					  anopw VARCHAR2(255) NOT NULL,
                      anotitle VARCHAR2(255) NOT NULL,
                      anocontents VARCHAR2(2000),
                      anodate DATE
                      );

CREATE TABLE foodMenu(fmno NUMBER PRIMARY KEY,
					  fmdate DATE NOT NULL,
                      fno NUMBER REFERENCES food(fno),
                      scode NUMBER REFERENCES schedule(scode)
                      );

CREATE TABLE review(rno NUMBER PRIMARY KEY,
					mno NUMBER REFERENCES member(mno),
              		regdate DATE NOT NULL,
                    spoint NUMBER DEFAULT 0,
                    comments VARCHAR2(2000),
                    fmno NUMBER REFERENCES foodMenu(fmno)
                    );


CREATE TABLE psurvey(pno NUMBER PRIMARY KEY,
					mno NUMBER REFERENCES member(mno),
                    fno NUMBER REFERENCES food(fno),
                    etc VARCHAR2(2000)
                    );

CREATE TABLE dsurvey(dno NUMBER PRIMARY KEY,
					mno NUMBER REFERENCES member(mno),
                    scode NUMBER REFERENCES schedule(scode),
                    ddate DATE
                    );

CREATE TABLE alram(pno NUMBER REFERENCES psurvey(pno),
                   mno NUMBER REFERENCES member(mno),
                   fmno NUMBER REFERENCES foodmenu(fmno)
                   );

CREATE OR REPLACE TRIGGER alram_trigger
BEFORE INSERT OR UPDATE
ON alram
FOR EACH ROW
DECLARE
	check_fmno NUMBER; check_pno NUMBER; check_mno NUMBER;
BEGIN
	SELECT f.fmno, p.pno, p.MNO
    INTO check_fmno, check_pno, check_mno
    FROM foodmenu f, psurvey p
    WHERE f.FNO = p.FNO ;

    IF updating THEN
    	UPDATE alram SET pno=check_pno, fmno=check_fmno
        WHERE mno = check_mno;
    END IF;
END;

CREATE TABLE DIET(
	dietno NUMBER PRIMARY KEY,
  scode NUMBER REFERENCES schedule(scode),
  dietdate DATE NOT NULL,
  maindish VARCHAR2(50) NOT NULL,
  sidedish VARCHAR2(2000) NOT NULL
  );

CREATE SEQUENCE diet_no;

INSERT INTO schedule(scode,sname) VALUES(1,'아침');
INSERT INTO schedule(scode,sname) VALUES(2,'일품');
INSERT INTO schedule(scode,sname) VALUES(3,'한식');
INSERT INTO schedule(scode,sname) VALUES(4,'저녁');


INSERT INTO diet(dietno, scode, dietdate, maindish, sidedish)
VALUES(diet_no.NEXTVAL,1,'2017-06-05', '계란장조림','잡곡밥김치국<br/>숙주나물<br/>깍두기<br/>새우브로콜리죽');
INSERT INTO diet(dietno, scode, dietdate, maindish, sidedish)
VALUES(diet_no.NEXTVAL,2,'2017-06-05', '돈까스','유부장국<br/>꽃게칠리강정<br/>브로콜리참깨샐러드<br/>깍두기');
INSERT INTO diet(dietno, scode, dietdate, maindish, sidedish)
VALUES(diet_no.NEXTVAL,3,'2017-06-05', '소불고기','두부조림<br/>미역국<br/>명엽채볶음<br/>겉절이<br/>흑미밥<br/>김치');
INSERT INTO diet(dietno, scode, dietdate, maindish, sidedish)
VALUES(diet_no.NEXTVAL,4,'2017-06-05', '열무비빔밥','우렁강된장<br/>시래기된장국<br/>햄야채볶음<br/>그린샐러드<br/>김치');

INSERT INTO diet(dietno, scode, dietdate, maindish, sidedish)
VALUES(diet_no.NEXTVAL,1,'2017-06-06', '떡만두국','잡곡밥<br/>새우살호박볶음<br/>묵은지멸치지짐<br/>깍두기<br/>그린샐러드');
INSERT INTO diet(dietno, scode, dietdate, maindish, sidedish)
VALUES(diet_no.NEXTVAL,2,'2017-06-06', '캘리포니아롤','미니우동<br/>장어강정<br/>핫도그<br/>단무지');
INSERT INTO diet(dietno, scode, dietdate, maindish, sidedish)
VALUES(diet_no.NEXTVAL,3,'2017-06-06', '닭살데리야끼볶음','단호박팥찜<br/>된장찌개<br/>연근조림<br/>미나리초무침<br/>흑미밥');
INSERT INTO diet(dietno, scode, dietdate, maindish, sidedish)
VALUES(diet_no.NEXTVAL,4,'2017-06-06', '잔치국수','잡곡밥<br/>보쌈<br/>어묵볶음<br/>콩나물무침<br/>김치');

INSERT INTO diet(dietno, scode, dietdate, maindish, sidedish)
VALUES(diet_no.NEXTVAL,1,'2017-06-07', '닭개장','잡곡밥<br/>두부조림<br/>구이김<br/>깍두기<br/>시나몬빵');
INSERT INTO diet(dietno, scode, dietdate, maindish, sidedish)
VALUES(diet_no.NEXTVAL,2,'2017-06-07', '크림파스타', '미역장국<br/>두부떡갈비강정<br/>사과식빵피자<br/>쌀밥<br/>오이피클');
INSERT INTO diet(dietno, scode, dietdate, maindish, sidedish)
VALUES(diet_no.NEXTVAL,3,'2017-06-07', '제육볶음','두부떡갈비강정<br/>새우젓호박국<br/>미역초무침<br/>깻잎지무침<br/>흑미밥<br/>김치');
INSERT INTO diet(dietno, scode, dietdate, maindish, sidedish)
VALUES(diet_no.NEXTVAL,4,'2017-06-07', '닭감자조림','잡곡밥<br/>콩나물국<br/>잡채<br/>오이냉채<br/>김치');

INSERT INTO diet(dietno, scode, dietdate, maindish, sidedish)
VALUES(diet_no.NEXTVAL,1,'2017-06-08', '소불고기','잡곡밥<br/>북어해장국<br/>겉절이<br/>김치<br/>크로와상');
INSERT INTO diet(dietno, scode, dietdate, maindish, sidedish)
VALUES(diet_no.NEXTVAL,2,'2017-06-08', '함박스테이크','크림스프<br/>감자튀김<br/>사과<br/>감귤음료<br/>오이피클<br/>김치');
INSERT INTO diet(dietno, scode, dietdate, maindish, sidedish)
VALUES(diet_no.NEXTVAL,3,'2017-06-08', '고등어조림','동그랑땡<br/>배추국<br/>크랜베리멸치볶음<br/>청경채겉절이<br/>콩나물밥<br/>깍두기');
INSERT INTO diet(dietno, scode, dietdate, maindish, sidedish)
VALUES(diet_no.NEXTVAL,4,'2017-06-08', '설렁탕','잡곡밥<br/>제육볶음<br/>고구마튀김<br/>양배추쌈<br/>깍두기');

INSERT INTO diet(dietno, scode, dietdate, maindish, sidedish)
VALUES(diet_no.NEXTVAL,1,'2017-06-09', '단호박죽','잡곡밥<br/>계란찜<br/>깻잎무침<br/>김치<br/>우거지국');
INSERT INTO diet(dietno, scode, dietdate, maindish, sidedish)
VALUES(diet_no.NEXTVAL,2,'2017-06-09', '짜장밥','해물찜<br/>실곤약야채볶음<br/>단무지무침<br/>계란찜');
INSERT INTO diet(dietno, scode, dietdate, maindish, sidedish)
VALUES(diet_no.NEXTVAL,3,'2017-06-09', '감자탕','코다리무조림<br/>버섯볶음<br/>마늘쫑볶음<br/>부추겉절이<br/>흑미밥<br/>김치');
INSERT INTO diet(dietno, scode, dietdate, maindish, sidedish)
VALUES(diet_no.NEXTVAL,4,'2017-06-09', '냄비라면','김밥');

INSERT INTO diet(dietno, scode, dietdate, maindish, sidedish)
VALUES(diet_no.NEXTVAL,1,'2017-06-12', '두부조림','잡곡밥<br/>아욱국<br/>배추나물<br/>김치<br/>그린샐러드');
INSERT INTO diet(dietno, scode, dietdate, maindish, sidedish)
VALUES(diet_no.NEXTVAL,2,'2017-06-12', '카레','소고기미역국<br/>김말이<br/>치킨텐더또띠아<br/>깍두기');
INSERT INTO diet(dietno, scode, dietdate, maindish, sidedish)
VALUES(diet_no.NEXTVAL,3,'2017-06-12', '오징어볶음', '잡채<br/>소고기미역국<br/>숙주무침<br/>열무된장무침<br/>취나물밥<br/>김치');
INSERT INTO diet(dietno, scode, dietdate, maindish, sidedish)
VALUES(diet_no.NEXTVAL,4,'2017-06-12', '치즈불닭', '잡곡밥<br/>순두부찌개<br/>애호박볶음<br/>파래김구이<br/>김치');

INSERT INTO diet(dietno, scode, dietdate, maindish, sidedish)
VALUES(diet_no.NEXTVAL,1,'2017-06-13', '계란말이','잡곡밥<br/>시래기된장국<br/>겉절이<br/>김치<br/>크로와상');
INSERT INTO diet(dietno, scode, dietdate, maindish, sidedish)
VALUES(diet_no.NEXTVAL,2,'2017-06-13', '메밀소바','생선까스<br/>야채튀김<br/>볶음밥<br/>단무지');
INSERT INTO diet(dietno, scode, dietdate, maindish, sidedish)
VALUES(diet_no.NEXTVAL,3,'2017-06-13', '연포탕', '두부계란전<br/>어묵볶음<br/>꼬시래기<br/>오이나물<br/>흑미밥<br/>김치');
INSERT INTO diet(dietno, scode, dietdate, maindish, sidedish)
VALUES(diet_no.NEXTVAL,4,'2017-06-13', '갈비탕', '잡곡밥<br/>떡갈비<br/>우엉채조림<br/>마늘쫑무침<br/>깍두기');

INSERT INTO diet(dietno, scode, dietdate, maindish, sidedish)
VALUES(diet_no.NEXTVAL,1,'2017-06-14', '메추리알장조림','잡곡밥<br/>오징어찌개<br/>두부신김치무침<br/>깍두기<br/>단호박죽');
INSERT INTO diet(dietno, scode, dietdate, maindish, sidedish)
VALUES(diet_no.NEXTVAL,2,'2017-06-14', '짬뽕', '새우튀김<br/>순대강정<br/>가쓰오장국<br/>오복지무침');
INSERT INTO diet(dietno, scode, dietdate, maindish, sidedish)
VALUES(diet_no.NEXTVAL,3,'2017-06-14', '제육볶음', '김치부추전<br/>들깨시래기국<br/>상추쌈<br/>콩나물무침<br/>흑미밥<br/>포기김치');
INSERT INTO diet(dietno, scode, dietdate, maindish, sidedish)
VALUES(diet_no.NEXTVAL,4,'2017-06-14', '닭감자조림', '잡곡밥<br/>계란파국<br/>짜장소스<br/>얼갈이나물<br/>김치');

INSERT INTO diet(dietno, scode, dietdate, maindish, sidedish)
VALUES(diet_no.NEXTVAL,1,'2017-06-15', '삼치구이','잡곡밥<br/>소고기무국<br/>구이김<br/>포기김치<br/>찐고구마');
INSERT INTO diet(dietno, scode, dietdate, maindish, sidedish)
VALUES(diet_no.NEXTVAL,2,'2017-06-15', '돈코츠라멘','오꼬노미야끼<br/>비빔야채만두<br/>김치볶음밥<br/>장아찌');
INSERT INTO diet(dietno, scode, dietdate, maindish, sidedish)
VALUES(diet_no.NEXTVAL,3,'2017-06-15', '백숙', '꽈리고추감자조림<br/>중국식가지볶음<br/>명엽채볶음<br/>오이고추된장무침<br/>흑미밥<br/>열무김치');
INSERT INTO diet(dietno, scode, dietdate, maindish, sidedish)
VALUES(diet_no.NEXTVAL,4,'2017-06-15', '부대찌개', '잡곡밥<br/>새송이버섯볶음<br/>김치전<br/>겉절이<br/>김치');

INSERT INTO diet(dietno, scode, dietdate, maindish, sidedish)
VALUES(diet_no.NEXTVAL,1,'2017-06-16', '오징어볶음','잡곡밥<br/>김치찌개<br/>참나물무침<br/>깍두기<br/>콩나물김치국');
INSERT INTO diet(dietno, scode, dietdate, maindish, sidedish)
VALUES(diet_no.NEXTVAL,2,'2017-06-16', '치즈오븐스파게티','우동장국<br/>피자모닝빵<br/>연어샐러드<br/>추가밥<br/>오이피클');
INSERT INTO diet(dietno, scode, dietdate, maindish, sidedish)
VALUES(diet_no.NEXTVAL,3,'2017-06-16', '고등어구이', '순대떡강정<br/>조개살배추국<br/>도토리묵무침<br/>근대나물<br/>흑미밥<br/>깍두기');
INSERT INTO diet(dietno, scode, dietdate, maindish, sidedish)
VALUES(diet_no.NEXTVAL,4,'2017-06-16', '잔치국수', '김밥');



select * from diet;









SELECT * FROM foodmenu;
SELECT * FROM psurvey;

CREATE SEQUENCE dsurvey_no;
CREATE SEQUENCE anoboard_no;
CREATE SEQUENCE food_no;
CREATE SEQUENCE foodmenu_no;
CREATE SEQUENCE noticeboard_no;
CREATE SEQUENCE psurvey_no;
CREATE SEQUENCE review_no;
CREATE SEQUENCE reviewboard_no;
CREATE SEQUENCE schedule_no;
CREATE SEQUENCE upload_no;
CREATE SEQUENCE rankingboard_no;
=======
CREATE TABLE member(mno NUMBER PRIMARY KEY,
					grade CHAR DEFAULT 'N',
                    password VARCHAR2(255) NOT NULL,
                    mname VARCHAR2(255) NOT NULL,
                    phone VARCHAR2(255) NOT NULL,
                    email VARCHAR2(255) NOT NULL);

insert into member(mno, grade, password, mname, phone, email)
values(1111, 'n', '1234', 'kdn', '010-1234-5432', 'kdn@kdn.com');

CREATE TABLE REVIEWBOARD(RNO number,
						 MNO number,
                         SPOINT number,
                         COMMENTS VARCHAR2(2000),
                         FNO number,
                         FNAME VARCHAR2(255),
                         REGDATE date);
                      
create table rankingboard(rkno number,
						  rkname number,
						  imag  varchar2(255)
						 );

                         
                         
                         
drop table reviewboard;
                         
show reviewboard;
select * from reivewboard;


select * from member;

CREATE TABLE noticeBoard(nno NUMBER PRIMARY KEY,
						mno NUMBER REFERENCES member(mno),
                        title VARCHAR2(255) NOT NULL,
                        CONTENTS VARCHAR2(2000),
                        ndate date
                        );
                        
insert into noticeBoard (nno, mno, title, contents, ndate)
values(noticeboard_no.nextval, 1111, '첫번째 게시글', '안녕하세요~~~~', sysdate);
insert into noticeBoard (nno, mno, title, contents, ndate)
values(noticeboard_no.nextval, 1111, '두번째 게시글', '안녕하세요~~~~!!!!!!!', sysdate);

select * from noticeBoard;

CREATE TABLE upload(uno NUMBER PRIMARY KEY,
					rfilename VARCHAR2(2000),
                    sfilename VARCHAR2(2000),
                    nno NUMBER REFERENCES noticeBoard(nno)
                    );


CREATE TABLE schedule(scode NUMBER PRIMARY KEY,
					  sname VARCHAR2(255) NOT NULL
                      );

CREATE TABLE food(fno NUMBER PRIMARY KEY,
					fname VARCHAR2(255) NOT NULL,
                    image VARCHAR2(2000)
					);

CREATE TABLE anoBoard(ano NUMBER PRIMARY KEY,
					  anopw VARCHAR2(255) NOT NULL,
                      anotitle VARCHAR2(255) NOT NULL,
                      anocontents VARCHAR2(2000),
                      anodate DATE
                      );

CREATE TABLE foodMenu(fmno NUMBER PRIMARY KEY,
					  fmdate DATE NOT NULL,
                      fno NUMBER REFERENCES food(fno),
                      scode NUMBER REFERENCES schedule(scode)
                      );

CREATE TABLE review(rno NUMBER PRIMARY KEY,
					mno NUMBER REFERENCES member(mno),
              		regdate DATE NOT NULL,
                    spoint NUMBER DEFAULT 0,
                    comments VARCHAR2(2000),
                    fmno NUMBER REFERENCES foodMenu(fmno)
                    );


CREATE TABLE psurvey(pno NUMBER PRIMARY KEY,
					mno NUMBER REFERENCES member(mno),
                    fno NUMBER REFERENCES food(fno),
                    etc VARCHAR2(2000)
                    );

CREATE TABLE dsurvey(dno NUMBER PRIMARY KEY,
					mno NUMBER REFERENCES member(mno),
                    scode NUMBER REFERENCES schedule(scode),
                    ddate DATE
                    );

CREATE TABLE alram(pno NUMBER REFERENCES psurvey(pno),
                   mno NUMBER REFERENCES member(mno),
                   fmno NUMBER REFERENCES foodmenu(fmno)
                   );

CREATE OR REPLACE TRIGGER alram_trigger
BEFORE INSERT OR UPDATE
ON alram
FOR EACH ROW
DECLARE
	check_fmno NUMBER; check_pno NUMBER; check_mno NUMBER;
BEGIN
	SELECT f.fmno, p.pno, p.MNO
    INTO check_fmno, check_pno, check_mno
    FROM foodmenu f, psurvey p
    WHERE f.FNO = p.FNO ;

    IF updating THEN
    	UPDATE alram SET pno=check_pno, fmno=check_fmno
        WHERE mno = check_mno;
    END IF;
END;

CREATE TABLE DIET(
	dietno NUMBER PRIMARY KEY,
  scode NUMBER REFERENCES schedule(scode),
  dietdate DATE NOT NULL,
  maindish VARCHAR2(50) NOT NULL,
  sidedish VARCHAR2(2000) NOT NULL
  );

CREATE SEQUENCE diet_no;

INSERT INTO schedule(scode,sname) VALUES(1,'아침');
INSERT INTO schedule(scode,sname) VALUES(2,'일품');
INSERT INTO schedule(scode,sname) VALUES(3,'한식');
INSERT INTO schedule(scode,sname) VALUES(4,'저녁');


INSERT INTO diet(dietno, scode, dietdate, maindish, sidedish)
VALUES(diet_no.NEXTVAL,1,'2017-06-05', '계란장조림','잡곡밥김치국<br/>숙주나물<br/>깍두기<br/>새우브로콜리죽');
INSERT INTO diet(dietno, scode, dietdate, maindish, sidedish)
VALUES(diet_no.NEXTVAL,2,'2017-06-05', '돈까스','유부장국<br/>꽃게칠리강정<br/>브로콜리참깨샐러드<br/>깍두기');
INSERT INTO diet(dietno, scode, dietdate, maindish, sidedish)
VALUES(diet_no.NEXTVAL,3,'2017-06-05', '소불고기','두부조림<br/>미역국<br/>명엽채볶음<br/>겉절이<br/>흑미밥<br/>김치');
INSERT INTO diet(dietno, scode, dietdate, maindish, sidedish)
VALUES(diet_no.NEXTVAL,4,'2017-06-05', '열무비빔밥','우렁강된장<br/>시래기된장국<br/>햄야채볶음<br/>그린샐러드<br/>김치');

INSERT INTO diet(dietno, scode, dietdate, maindish, sidedish)
VALUES(diet_no.NEXTVAL,1,'2017-06-06', '떡만두국','잡곡밥<br/>새우살호박볶음<br/>묵은지멸치지짐<br/>깍두기<br/>그린샐러드');
INSERT INTO diet(dietno, scode, dietdate, maindish, sidedish)
VALUES(diet_no.NEXTVAL,2,'2017-06-06', '캘리포니아롤','미니우동<br/>장어강정<br/>핫도그<br/>단무지');
INSERT INTO diet(dietno, scode, dietdate, maindish, sidedish)
VALUES(diet_no.NEXTVAL,3,'2017-06-06', '닭살데리야끼볶음','단호박팥찜<br/>된장찌개<br/>연근조림<br/>미나리초무침<br/>흑미밥');
INSERT INTO diet(dietno, scode, dietdate, maindish, sidedish)
VALUES(diet_no.NEXTVAL,4,'2017-06-06', '잔치국수','잡곡밥<br/>보쌈<br/>어묵볶음<br/>콩나물무침<br/>김치');

INSERT INTO diet(dietno, scode, dietdate, maindish, sidedish)
VALUES(diet_no.NEXTVAL,1,'2017-06-07', '닭개장','잡곡밥<br/>두부조림<br/>구이김<br/>깍두기<br/>시나몬빵');
INSERT INTO diet(dietno, scode, dietdate, maindish, sidedish)
VALUES(diet_no.NEXTVAL,2,'2017-06-07', '크림파스타', '미역장국<br/>두부떡갈비강정<br/>사과식빵피자<br/>쌀밥<br/>오이피클');
INSERT INTO diet(dietno, scode, dietdate, maindish, sidedish)
VALUES(diet_no.NEXTVAL,3,'2017-06-07', '제육볶음','두부떡갈비강정<br/>새우젓호박국<br/>미역초무침<br/>깻잎지무침<br/>흑미밥<br/>김치');
INSERT INTO diet(dietno, scode, dietdate, maindish, sidedish)
VALUES(diet_no.NEXTVAL,4,'2017-06-07', '닭감자조림','잡곡밥<br/>콩나물국<br/>잡채<br/>오이냉채<br/>김치');

INSERT INTO diet(dietno, scode, dietdate, maindish, sidedish)
VALUES(diet_no.NEXTVAL,1,'2017-06-08', '소불고기','잡곡밥<br/>북어해장국<br/>겉절이<br/>김치<br/>크로와상');
INSERT INTO diet(dietno, scode, dietdate, maindish, sidedish)
VALUES(diet_no.NEXTVAL,2,'2017-06-08', '함박스테이크','크림스프<br/>감자튀김<br/>사과<br/>감귤음료<br/>오이피클<br/>김치');
INSERT INTO diet(dietno, scode, dietdate, maindish, sidedish)
VALUES(diet_no.NEXTVAL,3,'2017-06-08', '고등어조림','동그랑땡<br/>배추국<br/>크랜베리멸치볶음<br/>청경채겉절이<br/>콩나물밥<br/>깍두기');
INSERT INTO diet(dietno, scode, dietdate, maindish, sidedish)
VALUES(diet_no.NEXTVAL,4,'2017-06-08', '설렁탕','잡곡밥<br/>제육볶음<br/>고구마튀김<br/>양배추쌈<br/>깍두기');

INSERT INTO diet(dietno, scode, dietdate, maindish, sidedish)
VALUES(diet_no.NEXTVAL,1,'2017-06-09', '단호박죽','잡곡밥<br/>계란찜<br/>깻잎무침<br/>김치<br/>우거지국');
INSERT INTO diet(dietno, scode, dietdate, maindish, sidedish)
VALUES(diet_no.NEXTVAL,2,'2017-06-09', '짜장밥','해물찜<br/>실곤약야채볶음<br/>단무지무침<br/>계란찜');
INSERT INTO diet(dietno, scode, dietdate, maindish, sidedish)
VALUES(diet_no.NEXTVAL,3,'2017-06-09', '감자탕','코다리무조림<br/>버섯볶음<br/>마늘쫑볶음<br/>부추겉절이<br/>흑미밥<br/>김치');
INSERT INTO diet(dietno, scode, dietdate, maindish, sidedish)
VALUES(diet_no.NEXTVAL,4,'2017-06-09', '냄비라면','김밥');

INSERT INTO diet(dietno, scode, dietdate, maindish, sidedish)
VALUES(diet_no.NEXTVAL,1,'2017-06-12', '두부조림','잡곡밥<br/>아욱국<br/>배추나물<br/>김치<br/>그린샐러드');
INSERT INTO diet(dietno, scode, dietdate, maindish, sidedish)
VALUES(diet_no.NEXTVAL,2,'2017-06-12', '카레','소고기미역국<br/>김말이<br/>치킨텐더또띠아<br/>깍두기');
INSERT INTO diet(dietno, scode, dietdate, maindish, sidedish)
VALUES(diet_no.NEXTVAL,3,'2017-06-12', '오징어볶음', '잡채<br/>소고기미역국<br/>숙주무침<br/>열무된장무침<br/>취나물밥<br/>김치');
INSERT INTO diet(dietno, scode, dietdate, maindish, sidedish)
VALUES(diet_no.NEXTVAL,4,'2017-06-12', '치즈불닭', '잡곡밥<br/>순두부찌개<br/>애호박볶음<br/>파래김구이<br/>김치');

INSERT INTO diet(dietno, scode, dietdate, maindish, sidedish)
VALUES(diet_no.NEXTVAL,1,'2017-06-13', '계란말이','잡곡밥<br/>시래기된장국<br/>겉절이<br/>김치<br/>크로와상');
INSERT INTO diet(dietno, scode, dietdate, maindish, sidedish)
VALUES(diet_no.NEXTVAL,2,'2017-06-13', '메밀소바','생선까스<br/>야채튀김<br/>볶음밥<br/>단무지');
INSERT INTO diet(dietno, scode, dietdate, maindish, sidedish)
VALUES(diet_no.NEXTVAL,3,'2017-06-13', '연포탕', '두부계란전<br/>어묵볶음<br/>꼬시래기<br/>오이나물<br/>흑미밥<br/>김치');
INSERT INTO diet(dietno, scode, dietdate, maindish, sidedish)
VALUES(diet_no.NEXTVAL,4,'2017-06-13', '갈비탕', '잡곡밥<br/>떡갈비<br/>우엉채조림<br/>마늘쫑무침<br/>깍두기');

INSERT INTO diet(dietno, scode, dietdate, maindish, sidedish)
VALUES(diet_no.NEXTVAL,1,'2017-06-14', '메추리알장조림','잡곡밥<br/>오징어찌개<br/>두부신김치무침<br/>깍두기<br/>단호박죽');
INSERT INTO diet(dietno, scode, dietdate, maindish, sidedish)
VALUES(diet_no.NEXTVAL,2,'2017-06-14', '짬뽕', '새우튀김<br/>순대강정<br/>가쓰오장국<br/>오복지무침');
INSERT INTO diet(dietno, scode, dietdate, maindish, sidedish)
VALUES(diet_no.NEXTVAL,3,'2017-06-14', '제육볶음', '김치부추전<br/>들깨시래기국<br/>상추쌈<br/>콩나물무침<br/>흑미밥<br/>포기김치');
INSERT INTO diet(dietno, scode, dietdate, maindish, sidedish)
VALUES(diet_no.NEXTVAL,4,'2017-06-14', '닭감자조림', '잡곡밥<br/>계란파국<br/>짜장소스<br/>얼갈이나물<br/>김치');

INSERT INTO diet(dietno, scode, dietdate, maindish, sidedish)
VALUES(diet_no.NEXTVAL,1,'2017-06-15', '삼치구이','잡곡밥<br/>소고기무국<br/>구이김<br/>포기김치<br/>찐고구마');
INSERT INTO diet(dietno, scode, dietdate, maindish, sidedish)
VALUES(diet_no.NEXTVAL,2,'2017-06-15', '돈코츠라멘','오꼬노미야끼<br/>비빔야채만두<br/>김치볶음밥<br/>장아찌');
INSERT INTO diet(dietno, scode, dietdate, maindish, sidedish)
VALUES(diet_no.NEXTVAL,3,'2017-06-15', '백숙', '꽈리고추감자조림<br/>중국식가지볶음<br/>명엽채볶음<br/>오이고추된장무침<br/>흑미밥<br/>열무김치');
INSERT INTO diet(dietno, scode, dietdate, maindish, sidedish)
VALUES(diet_no.NEXTVAL,4,'2017-06-15', '부대찌개', '잡곡밥<br/>새송이버섯볶음<br/>김치전<br/>겉절이<br/>김치');

INSERT INTO diet(dietno, scode, dietdate, maindish, sidedish)
VALUES(diet_no.NEXTVAL,1,'2017-06-16', '오징어볶음','잡곡밥<br/>김치찌개<br/>참나물무침<br/>깍두기<br/>콩나물김치국');
INSERT INTO diet(dietno, scode, dietdate, maindish, sidedish)
VALUES(diet_no.NEXTVAL,2,'2017-06-16', '치즈오븐스파게티','우동장국<br/>피자모닝빵<br/>연어샐러드<br/>추가밥<br/>오이피클');
INSERT INTO diet(dietno, scode, dietdate, maindish, sidedish)
VALUES(diet_no.NEXTVAL,3,'2017-06-16', '고등어구이', '순대떡강정<br/>조개살배추국<br/>도토리묵무침<br/>근대나물<br/>흑미밥<br/>깍두기');
INSERT INTO diet(dietno, scode, dietdate, maindish, sidedish)
VALUES(diet_no.NEXTVAL,4,'2017-06-16', '잔치국수', '김밥');



select * from diet;









SELECT * FROM foodmenu;
SELECT * FROM psurvey;

CREATE SEQUENCE dsurvey_no;
CREATE SEQUENCE anoboard_no;
CREATE SEQUENCE food_no;
CREATE SEQUENCE foodmenu_no;
CREATE SEQUENCE noticeboard_no;
CREATE SEQUENCE psurvey_no;
CREATE SEQUENCE review_no;
CREATE SEQUENCE reviewboard_no;
CREATE SEQUENCE schedule_no;
CREATE SEQUENCE upload_no;
CREATE SEQUENCE rankingboard_no;
>>>>>>> branch 'master' of https://github.com/YuraKo/KDN_FoodCourt-NEW-.git
