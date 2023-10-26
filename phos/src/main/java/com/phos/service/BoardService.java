package com.phos.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.phos.entity.Board;
import com.phos.entity.PagingVO;

@Service
public interface BoardService {
		
	List<Board> getList(String email);
	Board getDetail(int boardNum);
	void insertBoard(Board board);
	void deleteBoard(int boardNum);
	public int countBoard(String email);
	public List<Board> selectBoard(PagingVO vo);
}
