/*
cmd창 실행
sqlplus
system/1111
CREATE USER p06 IDENTIFIED BY 1111;
grant dba to p06;
*/

drop table jobplan;
drop table participants;
drop table notice;
drop table project;
drop table member;

create table member(
    email varchar2(50) primary key,
    password varchar2(20),
    name varchar2(30),
    auth varchar2(10),
    accessdate date
);
insert into member values ('skawns848@naver.com', '123123', '조남준', '관리자', sysdate);
select * from member;

create table project(
    pid number primary key,
    pname varchar2(200),
    pcomment varchar2(500),
    pstart date,
    pend date,
    pregdate date
);
insert into project values (1, 'PMS', '프로젝트 관리 시스템', to_date('2022-07-20','YYYY-MM-DD'), to_date('2022-08-23','YYYY-MM-DD'), to_date('2022-07-20','YYYY-MM-DD'));
select * from project;

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

create table participants(
    pid number,
    email varchar2(50),
    pauth varchar2(10)
);
insert into participants values (1,'skawns848@naver.com', null);
select * from participants;

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
insert into jobplan
values (
        1, '대시보드 차트 적용', 1, 'skawns848@naver.com',
        to_date('2022-07-28','YYYY-MM-DD'), to_date('2022-07-30','YYYY-MM-DD'),
        to_date('2022-07-28','YYYY-MM-DD'), to_date('2022-07-30','YYYY-MM-DD'),
        '대시보드에 lib활용하여 데이터를 차트형식으로 표시하기', null,
        to_date('2022-07-28','YYYY-MM-DD'), to_date('2022-07-28','YYYY-MM-DD'),
        null
);
select * from jobplan;
