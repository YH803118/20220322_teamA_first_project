// 게시판 테이블 생성

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

// 공지 게시판 시퀀스 생성
create SEQUENCE seq_notice;

// 시퀀스 삭제시 사용
DROP SEQUENCE SEQ_NOTICE;

// 파일 DB  생성
create table t_noticeFile(
    noticeFileName varchar2(500),
    noticeNo number,
    uuid varchar2(100),
    originalFileName varchar2(500),
    RegDate date default sysdate,
    constraint pk_noticeFile primary key(noticeFileName),
    constraint fk_noticeFile foreign key(noticeNo) references t_noticeBoard(noticeNo)
);

// 커뮤니티 게시판
create table t_commuBoard(
    commuNo number,  
    commuId varchar2(30),
    commuWriter varchar2(20) not null,
    commuTitle varchar2(100) not null,
    commuContent varchar2(4000) not null,
    commuRegDate date default sysdate,
    commuHit number default 0,
    replyCnt number default 0,
    constraint pk_community primary key(commuNo),
    constraint fk_community foreign key(commuId) reference t_member(id)
    );
    
alter table t_commuBoard ADD commuId varchar2(100);

select * from t_commuBoard;


// 커뮤니티 게시판 테스트 및 수정 하느라 사용한 쿼리문
alter table t_commuBoard ADD replyCnt number default 0 not null;
alter table t_commuBoard modify replyCnt null;
alter table t_commuBoard modify commuWriter varchar2(50);


// 커뮤니티 게시판 시퀀스 생성
CREATE SEQUENCE seq_commu;

// 댓글 게시판
create table t_commuReply(
    replyNo number,
    commuNo number,
    replyId varchar2(50),
    replyWriter varchar2(50),
    replyContent varchar2(1000),
    rePlyRegDate date default sysdate,
    constraint pk_reply primary key(replyNo),
    constraint fk_reply foreign key(commuNo) references t_commuBoard(commuNo),
    constraint fk_reply_id foreign key(replyId) references t_commuBoard(commuId)
);

commit;
// 댓글 게시판 시퀀스 생성
CREATE SEQUENCE seq_reply;

alter table t_commuReply add replyId varchar2(50) not null;

select * from t_commu;
select * from t_commuReply;
commit;
delete from t_commuReply where commuNo = '25';

// 테스트 입력
insert into t_noticeBoard values(seq_notice.nextval, '홍길동', '홍길동 테스트1', '홍길동 테스트내용', sysdate, 1, 0);

// 테스트 입력 -> 재귀
insert into t_noticeBoard (noticeNo, noticeWriter, noticeTitle, noticecontent, noticeLevel) (select seq_notice.nextval,noticeWriter, noticeTitle, noticecontent, noticeLevel from t_noticeBoard);

// 오라클 select 문 힌트 + rownum 사용
select /*+INDEX_DESC(t_noticeBoard PK_NOTICE) */ rownum rn, noticeNo, noticetitle, noticecontent from t_noticeBoard where rownum > 10 and rownum <=20;


// 오라클 select 문 힌트+ rownum + 인라인 뷰 사용
select noticeNo, noticeTitle, noticeWriter, noticeRegDate from (select  /*+INDEX_DESC(t_noticeBoard PK_NOTICE) */ rownum rn, noticeNo, noticeTitle, noticeWriter, noticeRegDate from t_noticeBoard where rownum <=20) where rn > 0;

//가장 최신 게시물번호 조회
select max(noticeNo) from t_noticeBoard;



// 게시판 조회수 증가 쿼리
update t_noticeBoard set noticeHit = noticeHit+1 where noticeNo = 1;


// 수정 파일이름컬럼 글자수
alter table t_noticeFile modify noticeFileName varchar2(500);
    


select noticeNo from t_noticeBoard order by noticeNo desc;

select * from t_noticeFile;

select * from t_commuBoard; 

commit;


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


select noticeNo, noticeTitle, noticeWriter, noticeRegDate, noticeHit
				  from (
				  select  /*+INDEX_DESC(t_noticeBoard PK_NOTICE) */
				    rownum rn, noticeNo, noticeTitle, noticeWriter, noticeRegDate, noticeHit
				from t_noticeBoard where (noticeTitle like '%add%') and rownum <=20
				) where rn > 10;
                
                

alter table t_noticeBoard modify noticeFileName null;
alter table t_noticeBoard add(noticeHit number default 0);
select * from t_noticeBoard;    

select * from t_commuBoard;

 select commuNo, commuWriter, commuTitle, commuRegDate, commuHit, replyCnt
				  from (
				  select  /*+INDEX_DESC(t_commuBoard pk_community) */
				    rownum rn, commuNo, commuWriter, commuTitle, commuRegDate, commuHit, replyCnt
				from t_commuBoard where rownum <=20
				) where rn > 10;
                
                
                
create table t_member(
    id varchar2(20) primary key,
    pwd varchar2(40),
    name varchar2(10),
    email varchar2(100),
    joinDate date default sysdate,
    memberType number 
);
commit;

drop table t_member;

create table t_calendar(
    scheduleDate date,
    scheduleEnd date,
    schedule varchar2(30),
    scheduleDetail varchar(100)
);


create table lecture(
lectNo number primary key,
lectName varchar2(50),
name varchar2(20),
lectDay varchar2(20),
begin number,
end number
);

create table apply(
lectInfo varchar2(100),
id varchar2(20),
CONSTRAINT appl primary key(lectInfo,id)
);

commit;

alter table t_commuboard add constraint fk_commuity foreign key(commuId) references t_member(id);
alter table t_commuReply add constraint fk_reply_id foreign key(replyId) references t_member(id);
 constraint fk_reply_id foreign key(replyId) references t_commuBoard(commuId)
