package com.phos.mapper;

import java.util.List;

import com.phos.entity.Board;
import com.phos.entity.PagingVO;

public interface BoardMapper {
	
	public List<Board> findAllByUserEmail(String email);
	public Board getDetailByBoardNum (int boardNum);
	public void insertBoard(Board board);
	public void deleteBoard(int boardNum);
	public int countBoard(String email);
	public List<Board> selectBoard(PagingVO vo);
	public int countAll();
	public List<Board> selectAll(PagingVO vo);
	public void updateReply(Board board);
}
