--회원
select * from member;
create table member(
   mem_id varchar2(30),
   mem_pw varchar2(20) not null,
   mem_nick varchar2(20) not null,
   mem_age number(3),
   mem_gen varchar2(6),
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
   see_num number(10),
   mem_id varchar2(20),
   ts_num number(10),
   constraint see_see_num_pk primary key(see_num),
   constraint see_fk1 foreign key(mem_id) references member(mem_id),
    constraint see_fk2 foreign key(ts_num) references ts(ts_num)
);
create sequence see_see_num_seq increment by 1 start with 1 maxvalue 99999 nocache nocycle;


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
   mem_id varchar2(30) not null,
   mem_like varchar2(200),
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
   ts_name varchar2(400) not null,
   ts_tel varchar2(100),
    ts_time varchar2(500),
    ts_ct varchar2(200),
    ts_add varchar2(100) not null,
    ts_loc number(5),
    ts_img clob,
    ts_info clob,
    ts_views number(10) default 0,
    ts_lat varchar2(20),
    ts_lng varchar2(20),
    constraint ts_ts_num_pk primary key(ts_num),
   constraint ts_fk foreign key(ts_loc) references location(loc)
);

drop table ts
drop sequence ts_ts_num_seq

select * from TS
insert into ts values(ts_ts_num_seq.nextval, '테스트이름',123,'테스트시간','테스트ct','테스트add',1,'https://www.google.com/imgres?imgurl=https%3A%2F%2Ft1.daumcdn.net%2Fthumb%2FR720x0%2F%3Ffname%3Dhttp%3A%2F%2Ft1.daumcdn.net%2Fbrunch%2Fservice%2Fuser%2F2D9%2Fimage%2FnGbkJwBs8Ou3Cv5DbxApRbMZ2XQ.jpg&imgrefurl=https%3A%2F%2Fbrunch.co.kr%2F%40bong%2F94&tbnid=kOVXG2M028p-AM&vet=12ahUKEwi4r-T56uz1AhUXAqYKHaCOClAQMygAegUIARDPAQ..i&docid=kCTXM1I4MxMnPM&w=720&h=540&q=%EA%B4%80%EA%B4%91%EC%A7%80&ved=2ahUKEwi4r-T56uz1AhUXAqYKHaCOClAQMygAegUIARDPAQ','테스트info');

select * from TS
insert into ts values(ts_ts_num_seq.nextval, '테스트이름',123,'테스트시간','테스트ct','테스트add',1,'https://www.google.com/imgres?imgurl=https%3A%2F%2Ft1.daumcdn.net%2Fthumb%2FR720x0%2F%3Ffname%3Dhttp%3A%2F%2Ft1.daumcdn.net%2Fbrunch%2Fservice%2Fuser%2F2D9%2Fimage%2FnGbkJwBs8Ou3Cv5DbxApRbMZ2XQ.jpg&imgrefurl=https%3A%2F%2Fbrunch.co.kr%2F%40bong%2F94&tbnid=kOVXG2M028p-AM&vet=12ahUKEwi4r-T56uz1AhUXAqYKHaCOClAQMygAegUIARDPAQ..i&docid=kCTXM1I4MxMnPM&w=720&h=540&q=%EA%B4%80%EA%B4%91%EC%A7%80&ved=2ahUKEwi4r-T56uz1AhUXAqYKHaCOClAQMygAegUIARDPAQ','테스트info');

--관광지 시퀀스
create sequence ts_ts_num_seq increment by 1 start with 1 maxvalue 99999 nocache nocycle;

--주차장
create table p(
       p_num number(10),
       p_name varchar2(400) not null,
       p_tel varchar2(100),
       p_ct varchar2(200),
       p_add varchar2(100) not null,
       p_loc number(5),
       p_lat varchar2(20),
       p_lng varchar2(20),
       constraint p_p_num_pk primary key(p_num),
       constraint p_fk foreign key(p_loc) references location(loc)       
);

--주차장 시퀀스
create sequence p_p_num_seq increment by 1 start with 1 maxvalue 99999 nocache nocycle;

drop table p
drop sequence p_p_num_seq
--식당
create table res(
       res_num number(10),
       res_name varchar2(400) not null,
       res_tel varchar2(100),
       res_time varchar2(500),
       res_ct varchar2(200),
       res_add varchar2(150) not null,
       res_loc number(5),
       res_img clob,
       res_info clob,
       res_lat varchar2(20),
       res_lng varchar2(20),
       constraint res_res_num_pk primary key(res_num),
       constraint res_fk foreign key(res_loc) references location(loc)       
);

--식당 시퀀스
create sequence res_res_num_seq increment by 1 start with 1 maxvalue 99999 nocache nocycle;

drop table res
drop sequence res_res_num_seq
--카페
create table cf(
       cf_num number(10),
       cf_name varchar2(400) not null,
       cf_tel varchar2(100),
       cf_time varchar2(500),
       cf_ct varchar2(200),
       cf_add varchar2(100) not null,
       cf_loc number(5),
       cf_img clob,
       cf_lat varchar2(20),
       cf_lng varchar2(20),
       constraint cf_cf_num_pk primary key(cf_num),
       constraint cf_fk foreign key(cf_loc) references location(loc)       
);

--카페 시퀀스
create sequence cf_cf_num_seq increment by 1 start with 1 maxvalue 99999 nocache nocycle;

drop table cf
drop sequence cf_cf_num_seq

-- 숙박 테이블
create table accom(
       accom_num number(10),
       accom_name varchar2(400) not null,
       accom_tel varchar2(100),
       accom_time varchar2(500),
       accom_ct varchar2(200),
       accom_add varchar2(100) not null,
       accom_loc number(5),
       accom_img clob,
       accom_info clob,
       accom_lat varchar2(20),
       accom_lng varchar2(20),
       accom_views number(10),
       constraint accom_accom_num_pk primary key(accom_num),
       constraint accom_fk foreign key(accom_loc) references location(loc)       
);

create sequence accom_accom_num_seq increment by 1 start with 1 maxvalue 99999 nocache nocycle;

drop table review
--리뷰 게시판
select * from review
create table review(
      re_num number(10),
      visit_name varchar2(400) not null,
      mem_nick varchar2(20) not null,
      re_title varchar2(100) not null,
      re_content varchar2(1100) not null,
      re_img blob,
      re_date date default sysdate,
      constraint review_re_num_pk primary key(re_num)
)
create sequence review_re_num_seq increment by 1 start with 1 maxvalue 99999 nocache nocycle;


--테마 관광
create table theme(
      theme_num number(10),
      theme_name varchar2(400) not null,
      theme_ct varchar2(200),
      theme_course varchar2(400) not null,
      theme_dis varchar2(400),
      theme_img clob,
      constraint theme_theme_num_pk primary key(theme_num)
)

--테마 관광 시퀀스
create sequence theme_theme_num_seq increment by 1 start with 1 maxvalue 99999 nocache nocycle;

--인기검색어 저장
drop table popularSearchWord
create table popularSearchWord(
	word varchar2(100),
	word_count number(10) default 0,
    constraint popularSearchWord_word_pk primary key(word)
)
select * from popularSearchWord

drop table theme
drop sequence theme_theme_num_seq

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
select * from theme
select * from accom

drop table ts

select ts_name, ts_views from ts order by desc ts_views where ROWNUM <=10
select ts_name, ts_img from (select ts_name, ts_img from ts order by  ts_views desc) where ROWNUM <=10
select * from ACCOM order by accom_num


commit
drop table imageadd

alter table res add res_views number(10) default 0
alter table cf add cf_views number(10) default 0
alter table p add p_views number(10) default 0
select * from res

select ts_name, ts_tel, ts_time, ts_add, ts_img from ts