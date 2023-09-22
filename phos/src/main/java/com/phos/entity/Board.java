package com.phos.entity;

import java.util.Date;

import lombok.Data;
// 고객정보 Entity
@Data
public class Board {
	   private int board_num;          // 글번호
	    private String board_id;         // 글 작성자
	    private String board_subject;     // 글 제목
	    private String board_content;     // 글 내용
	    private String board_file;         // 첨부파일 이름
	    private int board_re_ref;         // 글 그룹번호
	    private int board_re_lev;         // 답변글 깊이
	    private int board_re_seq;         // 답변글 순서
	    private int board_count;         // 글 조회수
	    private Date board_date;
}
