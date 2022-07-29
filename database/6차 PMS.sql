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