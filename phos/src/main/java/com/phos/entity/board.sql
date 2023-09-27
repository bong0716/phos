-- 게시판 테이블
 
CREATE TABLE board (
  board_num INT NOT NULL AUTO_INCREMENT,
  board_user_email VARCHAR(50),
  board_subject VARCHAR(100),
  board_content VARCHAR(2000),
  board_re_ref INT,
  board_re_lev INT,
  board_re_seq INT,
  board_count INT,
  board_date DATE,
  board_replyStatus BOOLEAN DEFAULT FALSE, -- 기본값을 false로 설정
  PRIMARY KEY (board_num),
  FOREIGN KEY (board_user_email) REFERENCES members(email) ON DELETE CASCADE -- 외래 키 제약 조건 추가
);

INSERT INTO board (board_user_email, board_subject, board_content, board_re_ref, board_re_lev, board_re_seq, board_count, board_date, board_replyStatus)
VALUES ('1234@naver.com', 'Subject 2', 'Content 1', 0, 0, 0, 0, '2023-09-27', 1);

INSERT INTO board (board_user_email, board_subject, board_content, board_re_ref, board_re_lev, board_re_seq, board_count, board_date, board_replyStatus)
VALUES ('4321@naver.com', 'Subject 2', 'Content 1', 0, 0, 0, 0, '2023-09-27', 1);

select * from board 
delete from board

drop table board

-- board_num : 게시물 글번호
-- board_id : 글작성자 ID
-- board_subject : 글 제목
-- board_content : 글 내용
-- Board_re_ref : 글 그룹번호
-- Board_re_lev : 답변글 깊이
-- Board_re_seq : 답변글 순서
-- Board_count : 글 조회수
-- Board_date 작성날짜
-- Board_replyStatus : 답변상태 
 
-- 게시판 시퀀스
 
create sequence BOARD_NUM; 
 
-- 제약조건 추가

ALTER TABLE BOARD
ADD CONSTRAINT fk_board_member
FOREIGN KEY (board_id)
REFERENCES MEMBERS(email);


