// �Խ��� ���̺� ����

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

// ���� �Խ��� ������ ����
create SEQUENCE seq_notice;

// ������ ������ ���
DROP SEQUENCE SEQ_NOTICE;

// ���� DB  ����
create table t_noticeFile(
    noticeFileName varchar2(500),
    noticeNo number,
    uuid varchar2(100),
    originalFileName varchar2(500),
    RegDate date default sysdate,
    constraint pk_noticeFile primary key(noticeFileName),
    constraint fk_noticeFile foreign key(noticeNo) references t_noticeBoard(noticeNo)
);

// Ŀ�´�Ƽ �Խ���
create table t_commuBoard(
    commuNo number,
    commuWriter varchar2(20) not null,
    commuTitle varchar2(100) not null,
    commuContent varchar2(4000) not null,
    commuRegDate date default sysdate,
    commuHit number default 0,
    replyCnt number default 0,
    constraint pk_community primary key(com muNo)
    );
    

// Ŀ�´�Ƽ �Խ��� �׽�Ʈ �� ���� �ϴ��� ����� ������
alter table t_commuBoard ADD replyCnt number default 0 not null;
alter table t_commuBoard modify replyCnt null;
alter table t_commuBoard modify commuWriter varchar2(50);


// Ŀ�´�Ƽ �Խ��� ������ ����
CREATE SEQUENCE seq_commu;

// ��� �Խ���
create table t_commuReply(
    replyNo number,
    commuNo number,
    replyWriter varchar2(50),
    replyContent varchar2(1000),
    rePlyRegDate date default sysdate,
    constraint pk_reply primary key(replyNo),
    constraint fk_reply foreign key(commuNo) references t_commuBoard(commuNo)
);

// ��� �Խ��� ������ ����
CREATE SEQUENCE seq_reply;

// �׽�Ʈ �Է�
insert into t_noticeBoard values(seq_notice.nextval, 'ȫ�浿', 'ȫ�浿 �׽�Ʈ1', 'ȫ�浿 �׽�Ʈ����', sysdate, 1, 0);

// �׽�Ʈ �Է� -> ���
insert into t_noticeBoard (noticeNo, noticeWriter, noticeTitle, noticecontent, noticeLevel) (select seq_notice.nextval,noticeWriter, noticeTitle, noticecontent, noticeLevel from t_noticeBoard);

// ����Ŭ select �� ��Ʈ + rownum ���
select /*+INDEX_DESC(t_noticeBoard PK_NOTICE) */ rownum rn, noticeNo, noticetitle, noticecontent from t_noticeBoard where rownum > 10 and rownum <=20;


// ����Ŭ select �� ��Ʈ+ rownum + �ζ��� �� ���
select noticeNo, noticeTitle, noticeWriter, noticeRegDate from (select  /*+INDEX_DESC(t_noticeBoard PK_NOTICE) */ rownum rn, noticeNo, noticeTitle, noticeWriter, noticeRegDate from t_noticeBoard where rownum <=20) where rn > 0;

//���� �ֽ� �Խù���ȣ ��ȸ
select max(noticeNo) from t_noticeBoard;



// �Խ��� ��ȸ�� ���� ����
update t_noticeBoard set noticeHit = noticeHit+1 where noticeNo = 1;


// ���� �����̸��÷� ���ڼ�
alter table t_noticeFile modify noticeFileName varchar2(500);
    


select noticeNo from t_noticeBoard order by noticeNo desc;

select * from t_noticeFile;

select * from t_commuBoard; 

commit;


SELECT * FROM USER_SEQUENCES;
SELECT LAST_NUMBER FROM USER_SEQUENCES WHERE SEQUENCE_NAME = 'SEQ_NOTICE';

select * from t_noticeBoard order by noticeNo asc;
insert into t_noticeBoard(noticeNo, noticeWriter, noticeTitle, noticeContent,noticeLevel)
 values(seq_notice.nextval, '���׽���', 'add�Լ��׽�Ʈ', 'add�Լ�sql �׽�Ʈ��22', 0);
 
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