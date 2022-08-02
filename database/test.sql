/*
cmd창 실행
sqlplus
system/1111
CREATE USER p06 IDENTIFIED BY 1111;
grant dba to p06;
*/

drop table issue;
drop table jobplan;
drop table jobmember;
drop table participants;
drop table notice;
drop table project;
drop table member;

create table member(
    mid number primary key,
    email varchar2(50),
    password varchar2(20),
    name varchar2(30),
    auth varchar2(10),
    accessdate date
);
insert into member values (1, 'skawns848@naver.com', '123123', '조남준', '관리자', sysdate);
INSERT INTO MEMBER values(2, 'test@gmail.com', 'zxc!23123', '홍길동', 'ADMIN', sysdate);
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
    ppid number primary key,
    pauth varchar2(10),
    pid number,
    mid number
);
insert into participants values (1, 'PM', 1, 1);
insert into participants values (2, 'Developer', 1, 2);
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
    required number,
    pid number
);
insert into jobplan
values (
        1, '대시보드 차트 적용',
        to_date('2022-07-28','YYYY-MM-DD'), to_date('2022-07-30','YYYY-MM-DD'),
        to_date('2022-07-28','YYYY-MM-DD'), to_date('2022-08-02','YYYY-MM-DD'),
        '대시보드에 lib활용하여 데이터를 차트형식으로 표시하기', '진행중',
        to_date('2022-07-28','YYYY-MM-DD'), to_date('2022-07-28','YYYY-MM-DD'),
        null, 1
);
select * from jobplan;

create table jobmember(
                          jmid number primary key,
                          jid number,
                          ppid number,
                          progress number
);
insert into jobmember values (1, 1, 1, 50);
insert into jobmember values (2, 1, 2, 70);
select * from jobmember;

create table issue(
    iid number primary key,
    ititle varchar2(200),
    icontent varchar2(1000),
    iprogress varchar2(10),
    iregdate date,
    iuptdate date,
    jmid number
);
insert into issue
values (1, '차트구현 지연', '개인적인 사정으로 인한 대시보드 차트 일정 지연', '해결',
        to_date('2022-07-29','YYYY-MM-DD'), to_date('2022-08-02','YYYY-MM-DD'),
        1);
insert into issue
values (2, '테스트 이슈1', '테스트 이슈사항 내용1', '해결중',
           to_date('2022-08-01','YYYY-MM-DD'), to_date('2022-08-01','YYYY-MM-DD'),
           1);
insert into issue
values (3, '테스트 이슈2', '테스트 이슈사항 내용2', '해결중',
        to_date('2022-08-01','YYYY-MM-DD'), to_date('2022-08-03','YYYY-MM-DD'),
        2);
select * from issue;
--delete from issue where iid = 2;

select iid, jname, ititle, iprogress, name, iuptdate
from issue i, jobmember jm, jobplan jp,
     (select * from member m, participants pp where m.mid = pp.mid) m
where i.jmid = jm.jmid and jm.jid = jp.jid and jm.ppid = m.ppid and jp.pid = 1
order by iuptdate;