create table t_member (
    id varchar2(20),
    pwd varchar2(20) not null,
    name varchar2(20) not null,
    email varchar2(50) not null,
    joinDate date default sysdate,
    memberType number not null,
    constraint pk_t_member primary key (id)
);

select * from t_member;

alter table t_member add memberType number default 0;

commit;