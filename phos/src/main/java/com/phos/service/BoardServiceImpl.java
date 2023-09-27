package com.phos.service;

import java.util.Collections;
import java.util.List;

import org.springframework.stereotype.Service;

import com.phos.entity.Board;
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

}
