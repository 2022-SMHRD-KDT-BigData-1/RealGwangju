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
      re_content varchar2(800),
      re_date date,
      constraint review_mem_id_pk primary key(mem_id),
      constraint review_fk foreign key(mem_id) references member(mem_id)
)

-- 이미지 경로 저장
create table imageadd(
      imgadd clob not null,
      imgname varchar2(20),
      imgct varchar2(20) not null,
      constraint imageadd_imgname_pk primary key(imgname)
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
select * from imageadd

drop table review

--insert into imageadd values(
--UTL_RAW.CAST_TO_RAW(TO_BLOB(LPAD( ))
--			, '무등산132', '무등산1'
--)


--UPDATE imgadd
--SET B_BOL = TO_BLOB('data:image/jpeg;base64,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') || TO_CLOB('QonPlRSnaFU4Zy1diGxHMLLerux3w/L/MPMLWb7Y/WdzW4BrKgwzIc7nBHop4t4Ins3rs8Q2okDCjUCQpyhQOkmSQRhOhCIKh04Qp1A6ZydA5yBwLKnjRDTCsPqcFSxj7QueteuR2/LF72szekUZamcuT2dVnBNCJxQlUOkEgnVCRNCEIwjNA9Fh35XB3AymcmQ+x1bCDB3ESi5LM2RipGQm+77LTK7S9nXh3nxvDNapFGpFWQlMjQygFJFCSCAFEpsdAMiBM2HEFVfmLPk34W/EoToGPE3+y0aNJjmlzNdIPHqnlE8bPqlkQVHBDXqO/lKq5yVzurXbOJBPfHt9lUq3V4U5F1B8ogwdFnjpLxUcyyrVFqYlgiyzqjE41nSq9CpHBRFHQ6IIUSoQTymCRRKdqaE7EeVGenpuIcCN11vYTFB4vr6rDp6Kwx0LWdcc95mm8UaoYbFTZ3ir2YLpL15dZsvsxQyncUyqFKSZJUFi4c05ALC0Wv+rTv81jiutjEluYNBJde03BMC/GAsDEMyOI3bui413/P/ABP85aex8UcxbNiJ8P8AJWCXKfAV8r2niY/6hHupHTWeytarjIJDhcEju3eUIP8AiGFUdt2qHg4A98QfRZvziEv1c57l0HzxuKZ2J6LCbXKMV0PFo1HjXyUD8rryqvzULX6qLImdSHFVatNSykQjU9KsJKcsQZEa6BoRgIgxEGozaBgupnJgxPvhGaNjQpQ1RNClaUKIKzh8UQQ0gwd/AqEOCPOtT056kv1fe+NyD53JBVfLWHiPYKGVq6rnMTiz83kkq3zElPKr4T/FulXn6xv77m3l5LO2sLtMzAhXXYYSCbHtGCeJgWG6+/iqWPZ2IiIIJEzvO/vlW/Ez60zymulKNoXN6WntVudlOoOh/uE+oWUaUrawzc2GcDuzR3HMqdBkrVc83ks/xnGiUhTK2f8AhkJw3JGvJkhhRBhWkcMgNBReqbWo8qmyQU+VQ6hyp8imypoQ6gc1DlVgtQFqp1EgaN6leETWodRAomlSGmibTVTpmKQiydrUZbZGbR5v9Nk8D5ICU+fsMEfzeRhClSQsySSSy0s1Xlpib5DABmYga94UREg21F7qTEUw5scWuEt3COPcoabCOMWH51XRwZAcpmFV8T2XuHP1ujpvXN6udnW3sarZ7NZv7H2UVFmVxbwJHgpdjM1edACB6n0CmxeHLX5/pfc8nc+uvitfxxtnlYJqKFGwqQFQA5qFzVIUDkED2IGCeu9WHKB1jPj7IvTFqEtRuKElGojIQkKSULigiDZKNrEbGQpAFS1EGooUkJ4RnoA1O5EUDyihd+hh/wBzx5/smagfU/02f1EeqYOUqxLKSizp1F4ukyPH3SGhP5oEkl0eZzu0v4nh6JN0SSXO/Xsn/Mdfhf4bP6QrGK/hxwCSS6V4/wCs1iJJJYdadC5JJADlE9JJFiJmiYpJIsCEt6SSsVKEYSSUQkkklQJQuSSRIr1P4bf+Yf8A2TDROkpW8/EKSSSjb//Z')
--;
--
--update
--set clob_col =  TO_BLOB(dbms_lob.substr('data:image/jpeg;base64,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', 4000, 1)) || TO_BLOB(dbms_lob.substr(data:image/jpeg;base64,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,4000,1))

select UTL_RAW.CAST_TO_VARCHAR2(imgadd), imgname, imgct  from imageadd







