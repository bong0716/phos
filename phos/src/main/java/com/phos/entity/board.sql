-- 게시판 테이블
 
CREATE TABLE board (
  board_num INT NOT NULL AUTO_INCREMENT,
  board_id VARCHAR(50),
  board_subject VARCHAR(100),
  board_content VARCHAR(2000),
  board_file VARCHAR(100),
  board_re_ref INT,
  board_re_lev INT,
  board_re_seq INT,
  board_count INT,
  board_date DATE,
  PRIMARY KEY (board_num)
);

 
-- board_num : 게시물 글번호
-- board_id : 글작성자 ID
-- board_subject : 글 제목
-- board_content : 글 내용
-- board_file : 첨부파일 이름
-- Board_re_ref : 글 그룹번호
-- Board_re_lev : 답변글 깊이
-- Board_re_seq : 답변글 순서
-- Board_count : 글 조회수
-- Board_date 작성날짜
 
 
-- 게시판 시퀀스
 
create sequence BOARD_NUM; 
 
-- 제약조건 추가

ALTER TABLE BOARD
ADD CONSTRAINT fk_board_member
FOREIGN KEY (board_id)
REFERENCES MEMBERS(email);


