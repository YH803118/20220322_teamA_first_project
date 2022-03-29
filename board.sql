create table t_noticeBoard(
    noticeNo number,
    noticeWriter varchar2(20) not null,
    noticeTitle varchar2(100) not null,
    noticeContent varchar2(4000) not null,
    noticeRegDate date default sysdate,
    noticeLevel number default 0,
    noticeHit number default 0,
    constraint pk_notice primary key(noticeNo)
    );

commit;

insert into t_noticeBoard values(seq_notice.nextval, '홍길동', '홍길동 테스트1', '홍길동 테스트내용', sysdate, 1, 0);



alter table t_noticeBoard modify noticeFileName null;
alter table t_noticeBoard add(noticeHit number default 0);
select * from t_noticeBoard;    

insert into t_noticeBoard (noticeNo, noticeWriter, noticeTitle, noticecontent, noticeLevel) (select seq_notice.nextval,noticeWriter, noticeTitle, noticecontent, noticeLevel from t_noticeBoard);



alter table t_noticeBoard RENAME constraint SYS_C008425 TO pk_notice;

select /*+INDEX_DESC(t_noticeBoard PK_NOTICE) */ rownum rn, noticeNo, noticetitle, noticecontent from t_noticeBoard where rownum > 10 and rownum <=20;

select noticeNo, noticeTitle, noticeWriter, noticeRegDate from (select  /*+INDEX_DESC(t_noticeBoard PK_NOTICE) */ rownum rn, noticeNo, noticeTitle, noticeWriter, noticeRegDate from t_noticeBoard where rownum <=20) where rn > 0;

select * from t_noticeBoard where noticeNo = 1;

select * from t_noticeBoard;


update t_noticeBoard set noticeHit = noticeHit+1 where noticeNo = 1;


create table t_noticeFile(
    noticeFileName varchar2(500),
    noticeNo number,
    uuid varchar2(100),
    originalFileName varchar2(500),
    RegDate date default sysdate,
    constraint pk_noticeFile primary key(noticeFileName),
    constraint fk_noticeFile foreign key(noticeNo) references t_noticeBoard(noticeNo)
);
commit;

alter table t_noticeFile modify noticeFileName varchar2(500);
    
select max(noticeNo) from t_noticeBoard;

select noticeNo from t_noticeBoard order by noticeNo desc;

select * from t_noticeFile;
DROP SEQUENCE SEQ_NOTICE;
create SEQUENCE seq_notice;


SELECT * FROM USER_SEQUENCES;
SELECT LAST_NUMBER FROM USER_SEQUENCES WHERE SEQUENCE_NAME = 'SEQ_NOTICE';

select * from t_noticeBoard order by noticeNo asc;
insert into t_noticeBoard(noticeNo, noticeWriter, noticeTitle, noticeContent,noticeLevel)
 values(seq_notice.nextval, '김테스터', 'add함수테스트', 'add함수sql 테스트중22', 0);
 
delete from t_noticeBoard where noticeNo > 11;

select * from t_noticeFile;

select count(*) from t_noticeBoard;

alter table t_noticeFile modify noticeNo not null;

select * from t_noticeBoard;

select noticeNo, noticeTitle, noticeWriter, noticeRegDate from (select  /*+INDEX_DESC(t_noticeBoard noticeRegDate) */ rownum rn, noticeNo, noticeTitle, noticeWriter, noticeRegDate from t_noticeBoard where noticeLevel =  0 and rownum <=5);