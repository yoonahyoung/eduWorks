-- 전사 공지 게시판 페이징처리
select
       count(*)
  from tb_board
 where board_category = 1
   and board_status = 'Y';
   
-- 전사 공지 게시판 공지게시글 조회
select
       board_no
     , board_title
     , m.mem_name as "b_writer"
     , m.dept_code
     , board_en_date
     , board_count
  from tb_board b
  join tb_member m on(b.board_writer = m.mem_no)
 where board_category = 1
   and board_status = 'Y'
   and board_top = 'Y';

-- 전사 공지 게시판 조회
select
       board_no
     , board_title
     , m.mem_name as "b_writer"
     , m.dept_code
     , board_en_date
     , board_count
  from tb_board b
  join tb_member m on(b.board_writer = m.mem_no)
 where board_category = 1
   and board_status = 'Y'
 order
    by 1 desc;
    
-- 조회수 증가
update 
       tb_board
   set board_count = board_count+1
 where board_no = 3
   and board_status = 'Y';

-- 전사 공지 상세조회
select
       board_no
     , board_title
     , board_content
     , board_writer
     , m.mem_name as "b_writer"
     , board_count
     , to_char(board_en_date, 'YYYY/MM/DD HH24:MI') as "board_en_date"
     , j.job_name
  from tb_board b
  join tb_member m on(b.board_writer = m.mem_no)
  join tb_job j using(job_code)
 where board_no = 3
   and board_category = 1
   and board_status = 'Y';

-- 상세 조회 시 댓글 리스트 조회

WITH rw (reply_no, reply_depth, reply_parent, reply_content, reply_writer, reply_date) AS
(
    SELECT
           reply_no
         , reply_depth
         , reply_parent
         , reply_content
         , reply_writer
         , reply_date
    FROM tb_reply

    UNION ALL

    SELECT
           r1.reply_no
         , r1.reply_depth
         , r1.reply_parent
         , r1.reply_content
         , r1.reply_writer
         , r1.reply_date
    FROM
        tb_reply r1
        JOIN tb_member m
          ON m.mem_name = r1.reply_writer
)
select 
       reply_no
     , reply_depth
     , reply_parent
     , reply_content
     , m1.mem_name as "reply_writer"
     , to_date(r2.reply_date, 'YY-MM-DD HH24:MI') as "reply_date"
  from rw r2
  left outer join tb_member m1
    on r2.reply_writer = m1.mem_name
 where r2.reply_type = 4
   and r2.re_board_no = 1
 start with r2.reply_parent = 0     /* 원글일경우 부모댓글번호를 0으로 넣어둔다면 */
connect by prior r2.reply_no = r2.reply_parent;     /* 해당 댓글을 참조하는 하위 댓글을 연결해서 조회하겠다는 의미 */

select 
		       reply_no
		     , re_board_no
		     , reply_depth
		     , reply_parent
		     , reply_content
		     , reply_writer
		     , reply_job
		     , to_char(reply_date, 'YY-MM-DD HH24:MI') as "reply_date"
		  from tb_reply
		 where reply_type = 4
		   and re_board_no = 3
		 start with reply_parent = 0
		connect by prior reply_no = reply_parent
		order siblings by reply_no asc, reply_parent asc;
        
-- 댓글 등록
	insert
  		  into tb_reply
  		  (
  		  	reply_no
  		  , reply_type
  		  , re_board_no
  		  , reply_depth
  		  , reply_parent
  		  , reply_content
  		  , reply_writer
  		  , reply_job
  		  , reply_date
  		  )
  		  values
  		  (
  		  	seq_reno.nextval
  		  , 4
  		  , #{reBoardNo}
  		  , #{replyDepth}
  		  , #{replyParent}
  		  , #{replyContent}
  		  , #{replyWriter}
  		  , #{replyJob}
  		  , sysdate
  		  );



-- 첨부파일 조회
select
       at_no
     , at_ref_bno
     , at_origin_name
     , at_change_name
     , at_path
     , at_upload_date
  from tb_attachment
 where at_ref_bno = ?
   and at_category = 3
   and at_status = 'Y';
   
select seq_bono.currval from dual;

select
			   count(*)
		  from tb_board
		 where board_category = 3
		   and board_status = 'Y';
           
           
select
  			   count(*)
  		  from tb_reply
  		 where reply_type = 4
  		   and re_board_no = 30
  		   and reply_blind = 'ㅎㅇ'
  		   and reply_status = 'Y';
           
select
		       board_no 
		     , mem_no
		  from tb_like;
          
select
			   board_no
			 , board_title
			 , m.mem_name as "b_writer"
			 , to_char(board_en_date, 'YYYY-MM-DD') as "board_en_date"
			 , board_count
		  from tb_board b
		  join tb_member m on(b.board_writer = m.mem_no)
		 where board_category = 3
		   and board_status = 'Y'
		 order
		 	by 1 desc;
            
            select
		       board_no 
		     , count(*) as "like_count"
		  from tb_like
		 group by board_no
		 order by 2 desc;

select
		       re_board_no 
		     , count(*) as "reply_count"
		  from tb_reply
         where reply_type = 4
           and reply_status = 'Y'
		 group by re_board_no
		 order by 2 desc;

ALTER TABLE TB_MAIL ADD MAIL_TYPE VARCHAR2(1) default '2' not null;
COMMENT ON COLUMN "TB_MAIL"."MAIL_TYPE" IS '중요메일 : 1, 일반메일 : 2';



select
			   board_no
			 , board_title
			 , m.mem_name as "b_writer"
			 , to_char(board_en_date, 'YYYY-MM-DD') as "board_en_date"
			 , board_count
		  from tb_board b
		  join tb_member m on(b.board_writer = m.mem_no)
		 where board_category = 3
		   and board_status = 'Y'
		 order
		 	by 1 desc;
            
ALTER TABLE TB_REPORT MODIFY RPT_ST_DATE DATE null;
ALTER TABLE TB_REPORT MODIFY RPT_ST_DATE default null;
commit;
alter table TB_REPORT drop column RPT_ST_DATE;
ALTER TABLE TB_REPORT add RPT_ST_DATE DATE null;
COMMENT ON COLUMN "TB_REPORT"."RPT_ST_DATE" IS '신고 처리 날짜';
commit;


select
       rpt_no
     , decode(rpt_ref_cat, 1, '게시글', 2, '댓글') as "RPT_REF_CAT"
     , rpt_board_no
     , board_title
     , rpt_mem_no
     , rpt_reason
     , rpt_date
     , rpt_status
  from tb_report r
  join tb_rpt_rsn rs using(rpt_reason_no)
  join tb_board b on(r.rpt_board_no = b.board_no);
            


select
       decode(rpt_ref_cat, 1, '게시글', 2, '댓글') as "rpt_ref_cat"
     , rpt_board_no
     , count(*) as "REPORT_COUNT"
     , rpt_status
  from tb_report r
 group by rpt_ref_cat, rpt_board_no,rpt_status
 order by 3 desc;



create or replace view vw_report 
as select
           decode(rpt_ref_cat, 1, '게시글', 2, '댓글') as "RPT_REF_CAT"
         , rpt_board_no
         , board_title
         , rpt_status
         , count(*) as "REPORT_COUNT"
      from tb_report r
      join tb_board b on(r.rpt_board_no = b.board_no)
     group by rpt_ref_cat, rpt_board_no, board_title, rpt_status
     order by 3 desc;


select 
       rpt_ref_cat
     , rpt_board_no
     , board_title
     , report_count
  from vw_report v;
  
  
select
       decode(rpt_ref_cat, 1, '게시글', 2, '댓글') as "RPT_REF_CAT"
     , rpt_board_no
     , rpt_status
  from tb_report r
  join tb_rpt_rsn rs using(rpt_reason_no)
  join tb_reply rpl on (r.rpt_board_no = rpl.reply_no)
union
select
       decode(rpt_ref_cat, 1, '게시글', 2, '댓글') as "RPT_REF_CAT"
     , rpt_board_no
     , rpt_status
  from tb_report r
  join tb_rpt_rsn rs using(rpt_reason_no)
  join tb_board b on(r.rpt_board_no = b.board_no);
  
  
update tb_report
  		   set rpt_status = 'Y',
  		       rpt_st_date = sysdate
  		 where rpt_ref_cat = 1
  		   and rpt_board_no = 30;
           
SELECT * FROM DBA_users;

select
			   student_no
			 , student_name
			 , student_id
			 , student_phone
			 , student_email
			 , student_birth
			 , student_gender
			 , student_en_date
			 , class_no
			 , class_title as class_name
		  from tb_student s
		  join tb_class c using(class_no)
		 order
		 	by student_en_date desc;


select
		       reg_no
		     , class_no
		     , student_no
		     , class_title
		     , class_start_date
		     , class_end_date
		     , to_char('300000000', 'FM999,999,999') as "class_fee"
		  from tb_reg_class r
		  join tb_class c using(class_no)
		 where student_no = 3;
  

select
       count(*)
  from tb_student s
  join tb_reg_class rc using(student_no)
  join tb_class c using(class_no)
 where c.mem_no = 500016
   and rc.reg_status = 2;
  
select
       student_no
     , student_name
     , class_title
     , student_email
  from tb_student s
  join tb_reg_class rc using(student_no)
  join tb_class c using(class_no)
 where c.mem_no = 500016
   and reg_status = 2;


select
       count(*)
  from tb_reg_class
 where reg_status = 1;
 

select
       reg_no
     , class_title
     , reg_date
     , mem_name
     , student_id
     , student_name
  from tb_reg_class r
  join tb_class c using(class_no)
  join tb_student s using(student_no)
  join tb_member m using(mem_no)
 where reg_status = 1;


update tb_reg_class
   set reg_status = #{regStatus}
 where reg_no = #{regNo};



select
		       student_no
		     , student_name
		     , student_id
		     , class_title
		     , student_email
		  from tb_student s
		  join tb_reg_class rc using(student_no)
		  join tb_class c using(class_no)
		 where c.mem_no = 500016
		   and reg_status = 2
		 order by reg_date desc;


commit;





    select 
          al_target_mno
         , al_category
         , al_board_no
         , al_content
         , sum(count((select distinct substr(to_char(al_date, 'YYYY-MM-DD'), 1, 10)  from tb_alarm where al_target_mno=500001)) as al_date 
         , al_read_date
         , count(al_content)
      from tb_alarm
     where al_target_mno =500001
     group by al_target_mno, al_category, al_board_no, al_content, al_date, al_read_date;
     
     
 
 select distinct substr(to_char(al_date, 'YYYY-MM-DD'), 1, 10)  as al_date from tb_alarm where al_target_mno=500001;
 
 
  select  row_number() over (order by trunc(al_date) desc) as al_no
         , al_target_mno
         , al_category
         , al_board_no
         , al_content
         , trunc(al_date) as al_date
         , al_read_date
         , count(al_content)
      from tb_alarm
     where al_target_mno =500001
     group by al_target_mno, al_category, al_board_no, al_content, trunc(al_date), al_read_date
    order by trunc(al_date);

select   al_target_mno
         , al_category
         , al_board_no
         , al_content
         , al_date
         , al_read_date
         , count(al_content)
      from tb_alarm
     where al_target_mno =500001
     group by al_target_mno, al_category, al_board_no,al_date, al_content, al_read_date
     order by al_date desc;
     
select al_target_mno, al_category, al_board_no, al_content, to_char(al_date, 'YY/MM/DD')
  from tb_alarm;



select al_no,al_target_mno, al_category, al_board_no, board_category, board_status, al_content, al_date, al_read_date, count, dense_rank() over (order by al_no) as "list_no"
from(
select LISTAGG(al_no, ',') WITHIN GROUP(ORDER BY al_no desc) as al_no
     , al_target_mno
     , al_category
     , al_board_no
     , board_category
     , board_status
     , al_content
     , to_char(al_date, 'YY/MM/DD') as al_date
     , al_read_date
     , count(*) as count
  from tb_alarm a
  join tb_board b on (a.al_board_no = b.board_no)
 where al_target_mno = '500001'
 group by al_target_mno, al_category, al_board_no, board_category, board_status, al_content, to_char(al_date, 'YY/MM/DD'), al_read_date
 order by 1 desc);
 
 
 
 create view vw_alarm as
 select LISTAGG(al_no, ',') WITHIN GROUP(ORDER BY al_no desc) as al_no, al_target_mno
        , al_category, al_board_no, al_board_cat, al_content, to_char(al_date, 'YY/MM/DD') as al_date, al_read_date
        , count(*) as count
  from tb_alarm
 group by al_target_mno, al_category, al_board_no, al_board_cat, al_content, to_char(al_date, 'YY/MM/DD'), al_read_date
 order by 1 desc;
 
select al_no, al_target_mno, al_category, al_board_no, al_board_cat, al_content, al_date, al_read_date, count, row_number() over (order by al_no)
  from vw_alarm;
 
 
 -- => 알람리스트 뿌리기 
 
-- 알람하나 클릭시 알람읽음처리
--> dao 쪽에서는 String alNos => ${ alNos }
update tb_alarm
  set al_read_date = sysdate
 where al_no in (5,6,7,8,9,10,11,12,13,14);
 
ALTER TABLE TB_REPLY ADD REPLY_WNO VARCHAR2(30);
COMMENT ON COLUMN "TB_REPLY"."REPLY_WNO" IS '신고 알람용 댓글 작성자';
ALTER TABLE "TB_REPLY" ADD CONSTRAINT "FK_TB_REPLY_TO_TB_MEM" FOREIGN KEY (
	"REPLY_WNO"
)
REFERENCES "TB_MEMBER" (
	"MEM_NO"
);


select 
			   al_no
			 , al_target_mno
			 , al_category
			 , al_board_no
			 , board_category
			 , board_status
			 , al_content
			 , al_date
			 , al_read_date
			 , count
			 , dense_rank() over (order by al_no) as "list_no"
		 from(
			select LISTAGG(al_no, ',') WITHIN GROUP(ORDER BY al_no desc) as al_no
			     , al_target_mno
			     , al_category
			     , al_board_no
			     , board_category
			     , board_status
			     , al_content
			     , to_char(al_date, 'YY/MM/DD') as al_date
			     , al_read_date
			     , count(*) as count
			  from tb_alarm a
			  left join tb_board b on (a.al_board_no = b.board_no)
			 where al_target_mno = 500009
			 group by al_target_mno, al_category, al_board_no, board_category, board_status, al_content, to_char(al_date, 'YY/MM/DD'), al_read_date
			 )
             order by 8 desc, 1 desc;
             
delete 
		  from tb_alarm
		 where al_no in (1, 2);
         
         
select reply_wno
  from tb_reply r
 where reply_no = 54;


select
       decode(rpt_ref_cat, 1, '게시글', 2, '댓글') as "rpt_ref_cat"
     , rpt_board_no
     , count(*) as "rpt_count"
     , rpt_status
  from tb_report r
 group by rpt_ref_cat, rpt_board_no, rpt_status
 order by 3 desc;


--select LISTAGG(rpt_no, ',') WITHIN GROUP(ORDER BY rpt_count desc) as rpt_no
--       , rpt_ref_cat
--       , rpt_board_no
--       , rpt_count
--       , rpt_status
--from(;
select
       decode(rpt_ref_cat, 1, '게시글', 2, '댓글') as rpt_ref_cat
     , rpt_board_no
     , count(*) as rpt_count
     , rpt_status
     , LISTAGG(rpt_no, ',') WITHIN GROUP(ORDER BY rpt_status desc) as rpt_no
  from tb_report r
 group by rpt_ref_cat, rpt_board_no, rpt_status
 order by 3 desc
 ;
 
select 
       rpt_no
     , rpt_board_no
     , rpt_mem_no
  from tb_report
 where rpt_no in (10,4,6,15,20,5,1)
   and rpt_status = 'N';
   
   select distinct
		       rpt_no
		     , rpt_board_no
		     , rpt_mem_no
		     , rpt_ref_cat
		     , board_title
  		  from tb_report r
  		  join tb_board b on(r.rpt_board_no = b.board_no)
		   and rpt_status = 'N';
   
   
select distinct
       rpt_board_no
     , rpt_mem_no
     , reply_content
     , rpt_ref_cat
  from tb_report r
  join tb_reply p on(r.rpt_board_no = p.reply_no)
 where rpt_no in (11,13,15)
   and rpt_status = 'N';
   
   
   
   