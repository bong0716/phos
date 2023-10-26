package com.phos.service;

import java.util.Collections;
import java.util.List;

import org.springframework.stereotype.Service;

import com.phos.entity.Board;
import com.phos.entity.PagingVO;
import com.phos.mapper.BoardMapper;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class BoardServiceImpl implements BoardService{

	
	 private final BoardMapper boardMapper;

	 public BoardServiceImpl(BoardMapper boardMapper) {
	        this.boardMapper = boardMapper;
	 }
	
	@Override
	public List<Board> getList(String email) {
		List<Board> list = boardMapper.findAllByUserEmail(email);
		return list;
	}

	@Override
	public Board getDetail(int boardNum) {
		Board detail = boardMapper.getDetailByBoardNum(boardNum);
		return detail;
	}

	@Override
	public void insertBoard(Board board) {
		boardMapper.insertBoard(board);
	}

	@Override
	public void deleteBoard(int boardNum) {
		boardMapper.deleteBoard(boardNum);
	}
	
	@Override
	public int countBoard(String email) {
		return boardMapper.countBoard(email);
	}

	@Override
	public List<Board> selectBoard(PagingVO vo) {
		return boardMapper.selectBoard(vo);
	}

}
