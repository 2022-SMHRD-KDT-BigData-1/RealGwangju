--회원
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

--찜 목록 시퀀스
create sequence visit_like_visit_num_seq increment by 1 start with 1 maxvalue 99999 nocache nocycle;

--관광지
create table ts(
    ts_num number(10),
	ts_name varchar2(20) not null,
	ts_tel number(20),
    ts_time varchar2(20),
    ts_ct varchar2(20),
    ts_loc number(5) not null,
    constraint ts_ts_num_pk primary key(ts_num),
	constraint ts_fk foreign key(ts_loc) references location(loc)
);

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
       constraint cf_cf_num_pk primary key(cf_num),
       constraint cf_fk foreign key(cf_loc) references location(loc)       
);

--카페 시퀀스
create sequence cf_cf_num_seq increment by 1 start with 1 maxvalue 99999 nocache nocycle;

--리뷰 게시판
create table review(
      mem_id varchar2(20),
      re_title varchar2(20),
      re_content blob,
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




