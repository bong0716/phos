package com.phos.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.phos.entity.Board;
import com.phos.entity.Member;
import com.phos.service.BoardService;
import com.phos.service.MemberService;


@Controller
@RequestMapping("/board/*")
public class BoardController {
	
	private BoardService boardService;

	public BoardController(BoardService boardService) {
		this.boardService = boardService;
	}

	
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String list(Model model, HttpSession session) {
		
		Member mvo = (Member) session.getAttribute("mvo");
		if (mvo == null) {
	        model.addAttribute("message", "로그인이 필요한 서비스입니다.");
	        return "redirect:/member/login"; 
	    }
		
		String email = mvo.getEmail();
		List boardList = boardService.getList(email);
		if (boardList == null) {
			return "board/list";
		} 
		model.addAttribute("boardList", boardList);
		
		return "board/list";
	}
	
	@RequestMapping(value = "/list", method = RequestMethod.POST)
	public String list() {
		
		
		
		return "redirect:/board/list";
	}
	
	
	
}
