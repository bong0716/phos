package com.phos.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.phos.entity.Board;

@Service
public interface BoardService {
		
	List<Board> getList(String email);
}
