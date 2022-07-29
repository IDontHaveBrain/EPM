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