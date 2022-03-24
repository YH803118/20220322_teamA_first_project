create table t_noticeBoard(
    noticeNo number,
    noticeWriter varchar2(20) not null,
    noticeTitle varchar2(100) not null,
    noticeContent varchar2(4000) not null,
    noticeFileName varchar2(50),
    noticeRegDate date default sysdate,
    noticeLevel number default 0,
    noticeHit number default 0,
    constraint pk_notice primary key(noticeNo)
    );
    


commit;

insert into t_noticeBoard values(1, '홍길동', '홍길동 테스트1', '홍길동 테스트내용', null, sysdate, 0);



alter table t_noticeBoard modify noticeFileName null;
alter table t_noticeBoard add(noticeHit number default 0);
select * from t_noticeBoard;    

insert into t_noticeBoard (noticeNo, noticeWriter, noticeTitle, noticecontent, noticefilename, noticeLevel) (select seq_notice.nextval,noticeWriter, noticeTitle, noticecontent, noticefilename, noticeLevel from t_noticeBoard);

create SEQUENCE seq_notice;

alter table t_noticeBoard RENAME constraint SYS_C008425 TO pk_notice;

select /*+INDEX_DESC(t_noticeBoard PK_NOTICE) */ rownum rn, noticeNo, noticetitle, noticecontent from t_noticeBoard where rownum > 10 and rownum <=20;

select noticeNo, noticeTitle, noticeWriter, noticeRegDate from (select  /*+INDEX_DESC(t_noticeBoard PK_NOTICE) */ rownum rn, noticeNo, noticeTitle, noticeWriter, noticeRegDate from t_noticeBoard where rownum <=20) where rn > 10;

select * from t_noticeBoard where noticeNo = 1;
