package com.phos.mapper;

import java.util.List;

import com.phos.entity.Board;

public interface BoardMapper {
	
	public List<Board> findAllByUserEmail(String email);
	public Board getDetailByBoardNum (int boardNum);
	public void insertBoard(Board board);
	public void deleteBoard(int boardNum);
}
