create table counter(
	cdate	date not null,
	mcnt	number default 0,
	icnt	number default 0,
	hcnt	number default 0,
	ecnt	number default 0
);

create table event(
	edate	date not null,
	mno		number references member(mno)
);

select *
from suyo

select *
from COUNTER

select *
from event

insert into counter (cdate)
values(to_char(sysdate, 'yyyy-mm-dd'));

insert into counter (edate)
values(to_char(sysdate - 1, 'yyyy-mm-dd'));

insert into counter (cdate)
values(to_char(sysdate - 2, 'yyyy-mm-dd'));

insert into counter (cdate)
values(to_char(sysdate - 3, 'yyyy-mm-dd'));

insert into counter (cdate)
values(to_char(sysdate - 4, 'yyyy-mm-dd'));

insert into counter (cdate)
values(to_char(sysdate - 5, 'yyyy-mm-dd'));

insert into counter (cdate)
values(to_char(sysdate - 6, 'yyyy-mm-dd'));

insert into counter (cdate)
values(to_char(sysdate - 7, 'yyyy-mm-dd'));

insert into counter (cdate)
values(to_char(sysdate + 1, 'yyyy-mm-dd'));

insert into counter (cdate)
values(to_char(sysdate + 2, 'yyyy-mm-dd'));

insert into counter (cdate)
values(to_char(sysdate + 3, 'yyyy-mm-dd'));
insert into counter (cdate)
values(to_char(sysdate + 4, 'yyyy-mm-dd'));
insert into counter (cdate)
values(to_char(sysdate + 5, 'yyyy-mm-dd'));
insert into counter (cdate)
values(to_char(sysdate + 6, 'yyyy-mm-dd'));
insert into counter (cdate)
values(to_char(sysdate + 7, 'yyyy-mm-dd'));


drop table event

select *
from counter

update counter  set mcnt = 0, icnt = 0 , hcnt = 0, ecnt = 0
where cdate = to_char(sysdate + 1, 'yyyy-mm-dd');

drop table counter;

select *
from member;

INSERT INTO diet(dietno, scode, dietdate, maindish, sidedish)
VALUES(diet_no.NEXTVAL,1,'2017-06-12', '계란장조림','잡곡밥김치국<br/>숙주나물<br/>깍두기<br/>새우브로콜리죽');
INSERT INTO diet(dietno, scode, dietdate, maindish, sidedish)
VALUES(diet_no.NEXTVAL,2,'2017-06-12', '돈까스','유부장국<br/>꽃게칠리강정<br/>브로콜리참깨샐러드<br/>깍두기');
INSERT INTO diet(dietno, scode, dietdate, maindish, sidedish)
VALUES(diet_no.NEXTVAL,3,'2017-06-12', '소불고기','두부조림<br/>미역국<br/>명엽채볶음<br/>겉절이<br/>흑미밥<br/>김치');
INSERT INTO diet(dietno, scode, dietdate, maindish, sidedish)
VALUES(diet_no.NEXTVAL,4,'2017-06-12', '열무비빔밥','우렁강된장<br/>시래기된장국<br/>햄야채볶음<br/>그린샐러드<br/>김치');

INSERT INTO diet(dietno, scode, dietdate, maindish, sidedish)
VALUES(diet_no.NEXTVAL,1,'2017-06-13', '떡만두국','잡곡밥<br/>새우살호박볶음<br/>묵은지멸치지짐<br/>깍두기<br/>그린샐러드');
INSERT INTO diet(dietno, scode, dietdate, maindish, sidedish)
VALUES(diet_no.NEXTVAL,2,'2017-06-13', '캘리포니아롤','미니우동<br/>장어강정<br/>핫도그<br/>단무지');
INSERT INTO diet(dietno, scode, dietdate, maindish, sidedish)
VALUES(diet_no.NEXTVAL,3,'2017-06-13', '닭살데리야끼볶음','단호박팥찜<br/>된장찌개<br/>연근조림<br/>미나리초무침<br/>흑미밥');
INSERT INTO diet(dietno, scode, dietdate, maindish, sidedish)
VALUES(diet_no.NEXTVAL,4,'2017-06-13', '잔치국수','잡곡밥<br/>보쌈<br/>어묵볶음<br/>콩나물무침<br/>김치');

INSERT INTO diet(dietno, scode, dietdate, maindish, sidedish)
VALUES(diet_no.NEXTVAL,1,'2017-06-14', '닭개장','잡곡밥<br/>두부조림<br/>구이김<br/>깍두기<br/>시나몬빵');
INSERT INTO diet(dietno, scode, dietdate, maindish, sidedish)
VALUES(diet_no.NEXTVAL,2,'2017-06-14', '크림파스타', '미역장국<br/>두부떡갈비강정<br/>사과식빵피자<br/>쌀밥<br/>오이피클');
INSERT INTO diet(dietno, scode, dietdate, maindish, sidedish)
VALUES(diet_no.NEXTVAL,3,'2017-06-14', '제육볶음','두부떡갈비강정<br/>새우젓호박국<br/>미역초무침<br/>깻잎지무침<br/>흑미밥<br/>김치');
INSERT INTO diet(dietno, scode, dietdate, maindish, sidedish)
VALUES(diet_no.NEXTVAL,4,'2017-06-14', '닭감자조림','잡곡밥<br/>콩나물국<br/>잡채<br/>오이냉채<br/>김치');

INSERT INTO diet(dietno, scode, dietdate, maindish, sidedish)
VALUES(diet_no.NEXTVAL,1,'2017-06-15', '소불고기','잡곡밥<br/>북어해장국<br/>겉절이<br/>김치<br/>크로와상');
INSERT INTO diet(dietno, scode, dietdate, maindish, sidedish)
VALUES(diet_no.NEXTVAL,2,'2017-06-15', '함박스테이크','크림스프<br/>감자튀김<br/>사과<br/>감귤음료<br/>오이피클<br/>김치');
INSERT INTO diet(dietno, scode, dietdate, maindish, sidedish)
VALUES(diet_no.NEXTVAL,3,'2017-06-15', '고등어조림','동그랑땡<br/>배추국<br/>크랜베리멸치볶음<br/>청경채겉절이<br/>콩나물밥<br/>깍두기');
INSERT INTO diet(dietno, scode, dietdate, maindish, sidedish)
VALUES(diet_no.NEXTVAL,4,'2017-06-15', '설렁탕','잡곡밥<br/>제육볶음<br/>고구마튀김<br/>양배추쌈<br/>깍두기');

INSERT INTO diet(dietno, scode, dietdate, maindish, sidedish)
VALUES(diet_no.NEXTVAL,1,'2017-06-16', '단호박죽','잡곡밥<br/>계란찜<br/>깻잎무침<br/>김치<br/>우거지국');
INSERT INTO diet(dietno, scode, dietdate, maindish, sidedish)
VALUES(diet_no.NEXTVAL,2,'2017-06-16', '짜장밥','해물찜<br/>실곤약야채볶음<br/>단무지무침<br/>계란찜');
INSERT INTO diet(dietno, scode, dietdate, maindish, sidedish)
VALUES(diet_no.NEXTVAL,3,'2017-06-16', '감자탕','코다리무조림<br/>버섯볶음<br/>마늘쫑볶음<br/>부추겉절이<br/>흑미밥<br/>김치');
INSERT INTO diet(dietno, scode, dietdate, maindish, sidedish)
VALUES(diet_no.NEXTVAL,4,'2017-06-16', '냄비라면','김밥');

select*FROM diet;
