--회원
select * from member;
create table member(
	mem_id varchar2(20),
	mem_pw varchar2(20) not null,
	mem_nick varchar2(20) not null,
	mem_age number(3),
	mem_gen varchar2(2),
	constraint member_mem_id_pk primary key(mem_id),
	constraint member_mem_nick_UK UNIQUE(mem_nick)
);

--지역
create table location(
	loc_name varchar2(20),
	loc number(1),
	constraint location_loc_pk primary key(loc)
);
insert into location values('테스트지역',1);

--drop table location
--drop sequence location_loc_num_seq

--지역 시퀀스
create sequence location_loc_num_seq increment by 1 start with 1 maxvalue 99999 nocache nocycle;

--조회내역
create table see(
	mem_id varchar2(20),
	ts_num number(10),
    constraint see_mem_id_pk primary key(mem_id),
	constraint see_fk1 foreign key(mem_id) references member(mem_id),
    constraint see_fk2 foreign key(ts_num) references ts(ts_num)
);

drop table see
select * from see

--선호도
create table mem_score(
    mem_num number(10),
	mem_id varchar2(20),
	mem_score number(1),
    constraint mem_score_mem_num_pk primary key(mem_num),
	constraint mem_score_fk foreign key(mem_id) references member(mem_id)
 );

--선호도 시퀀스
create sequence mem_score_mem_num_seq increment by 1 start with 1 maxvalue 99999 nocache nocycle;

--찜 목록
create table visit_like(
    visit_num number(10),
	mem_id varchar2(20) not null,
	mem_like varchar2(20),
    constraint visit_like_visit_num_pk primary key(visit_num),
	constraint visit_like_fk foreign key(mem_id) references member(mem_id)
);
drop table visit_like
select * from VISIT_LIKE
--찜 목록 시퀀스
create sequence visit_like_visit_num_seq increment by 1 start with 1 maxvalue 99999 nocache nocycle;

--관광지
create table ts(
    ts_num number(10),
	ts_name varchar2(20) not null,
	ts_tel number(20),
    ts_time varchar2(20),
    ts_ct varchar2(20),
    ts_add varchar2(40) not null,
    ts_loc number(5) not null,
    ts_img clob,
    ts_info varchar2(800),
    constraint ts_ts_num_pk primary key(ts_num),
	constraint ts_fk foreign key(ts_loc) references location(loc)
);


drop table ts
drop sequence ts_ts_num_seq

select * from TS
insert into ts values(ts_ts_num_seq.nextval, '테스트이름',123,'테스트시간','테스트ct','테스트add',1,'https://www.google.com/imgres?imgurl=https%3A%2F%2Ft1.daumcdn.net%2Fthumb%2FR720x0%2F%3Ffname%3Dhttp%3A%2F%2Ft1.daumcdn.net%2Fbrunch%2Fservice%2Fuser%2F2D9%2Fimage%2FnGbkJwBs8Ou3Cv5DbxApRbMZ2XQ.jpg&imgrefurl=https%3A%2F%2Fbrunch.co.kr%2F%40bong%2F94&tbnid=kOVXG2M028p-AM&vet=12ahUKEwi4r-T56uz1AhUXAqYKHaCOClAQMygAegUIARDPAQ..i&docid=kCTXM1I4MxMnPM&w=720&h=540&q=%EA%B4%80%EA%B4%91%EC%A7%80&ved=2ahUKEwi4r-T56uz1AhUXAqYKHaCOClAQMygAegUIARDPAQ','테스트info');
--관광지 시퀀스
create sequence ts_ts_num_seq increment by 1 start with 1 maxvalue 99999 nocache nocycle;

--주차장
create table p(
       p_num number(10),
       p_name varchar2(20) not null,
       p_tel number(20),
       p_time varchar2(20),
       p_ct varchar2(20),
       p_add varchar2(40) not null,
       p_loc number(5) not null,
       p_img clob,
       p_info varchar2(800),
       constraint p_p_num_pk primary key(p_num),
       constraint p_fk foreign key(p_loc) references location(loc)       
);

--주차장 시퀀스
create sequence p_p_num_seq increment by 1 start with 1 maxvalue 99999 nocache nocycle;

--식당
create table res(
       res_num number(10),
       res_name varchar2(20) not null,
       res_tel number(20),
       res_time varchar2(20),
       res_ct varchar2(20),
       res_add varchar2(40) not null,
       res_loc number(5) not null,
       res_img clob,
       res_info varchar2(800),
       constraint res_res_num_pk primary key(res_num),
       constraint res_fk foreign key(res_loc) references location(loc)       
);

--식당 시퀀스
create sequence res_res_num_seq increment by 1 start with 1 maxvalue 99999 nocache nocycle;

--카페
create table cf(
       cf_num number(10),
       cf_name varchar2(20) not null,
       cf_tel number(20),
       cf_time varchar2(20),
       cf_ct varchar2(20),
       cf_add varchar2(40) not null,
       cf_loc number(5) not null,
       cf_img clob,
       cf_info varchar2(800),
       constraint cf_cf_num_pk primary key(cf_num),
       constraint cf_fk foreign key(cf_loc) references location(loc)       
);

--카페 시퀀스
create sequence cf_cf_num_seq increment by 1 start with 1 maxvalue 99999 nocache nocycle;

--리뷰 게시판
create table review(
      mem_id varchar2(20),
      re_title varchar2(20),
      re_content varchar2(800),
      re_date date,
      constraint review_mem_id_pk primary key(mem_id),
      constraint review_fk foreign key(mem_id) references member(mem_id)
)


select * from MEMBER
select * from LOCATION
select * from SEE
select * from MEM_SCORE
select * from VISIT_LIKE
select * from TS
select * from P
select * from RES
select * from CF
select * from REVIEW


drop table ts








