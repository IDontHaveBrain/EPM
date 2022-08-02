/*
cmd창 실행
sqlplus
system/1111
CREATE USER p06 IDENTIFIED BY 1111;
grant dba to p06;
*/

CREATE TABLE member(
	email varchar2(50),
	password varchar2(20),
	name varchar2(30),
	auth varchar2(10),
	accessdate date
);

INSERT INTO MEMBER values('test@gmail.com', 'zxc!23123', '홍길동', 'ADMIN', sysdate);

SELECT * FROM MEMBER;

create table notice(
                       nid number primary key,
                       pid number,
                       ntitle varchar2(200),
                       ncontent varchar2(1000),
                       nregdate date,
                       nuptdate date
);
insert into notice values (1, 1, '공지사항1', '공지사항 게시판 테스트용 데이터 입니다.', sysdate, sysdate);
insert into notice values (2, 1, '공지사항2', '두번째 테스트 데이터 입니다.', sysdate, sysdate);
insert into notice values (3, 1, '공지사항3', '세번째 테스트 데이터 입니다.', sysdate, sysdate);
select * from notice;

-- 재환
create table jobplan(
    jid number primary key,
    jname varchar2(200),
    jstart date,
    jend date,
    realstart date,
    realend date,
    content varchar2(1000),
    jprogress varchar2(10),
    jregdate date,
    juptdate date,
    required number
);

INSERT INTO jobplan VALUES (1,'업무이름',sysdate,sysdate,sysdate,sysdate,'내용','검토',sysdate,sysdate,1);
INSERT INTO jobplan VALUES (2,'리스트테스트',sysdate,sysdate,sysdate,sysdate,'내용2','취소',sysdate,sysdate,1);
INSERT INTO jobplan VALUES (3,'리스트테스트2',sysdate,sysdate,sysdate,sysdate,'내용3','완료',sysdate,sysdate,3);
INSERT INTO jobplan VALUES (4,'리스트테스트3',sysdate,sysdate,sysdate,sysdate,'내용4','진행중',sysdate,sysdate,4);
INSERT INTO jobplan VALUES (5,'업무이름',to_date('2015-11-03','YYYY-MM-DD'),
					to_date('2015-11-03','YYYY-MM-DD'),to_date('2017-08-02','YYYY-MM-DD'),
					to_date('2015-11-06','YYYY-MM-DD'),'내용입니다!','52%',
					to_date('2015-11-07','YYYY-MM-DD'),
					to_date('2015-11-08','YYYY-MM-DD'),5);
				
SELECT * FROM jobplan;
--
