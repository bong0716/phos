package com.phos.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.phos.entity.Board;
import com.phos.entity.Member;
import com.phos.service.BoardService;
import com.phos.service.MemberService;

import lombok.RequiredArgsConstructor;
import validator.memberValidator;


@Controller
@RequiredArgsConstructor
@RequestMapping("/board/*")
public class BoardController {
	
	private final BoardService boardService;

	@GetMapping("/list")
	public String list(Model model, HttpSession session) {
		
		Member mvo = (Member) session.getAttribute("mvo");
		if (mvo == null) {
	        model.addAttribute("message", "로그인이 필요한 서비스입니다.");
	        return "redirect:/member/login"; 
	    }
		
		List<Board> boardList = boardService.getList(mvo.getEmail());
		if (boardList == null) {
			return "board/list";
		}  
		model.addAttribute("boardList", boardList);
		model.addAttribute("username", mvo != null ? mvo.getUsername() : "");
		return "board/list";
	}
	
	@PostMapping("/list")
	public String list(@ModelAttribute("board") Board boardVo) {
		
		return "redirect:/board/list";
	}
	
	@GetMapping("detail")
	public String detail(
			@ModelAttribute("no") int boardNum,
			Model model, 
			HttpSession session) {
		
		Board data = boardService.getDetail(boardNum);
		Member mvo = (Member) session.getAttribute("mvo");
		model.addAttribute("data", data);
		model.addAttribute("username", mvo != null ? mvo.getUsername() : "");
		return "/board/detail";
	}
	
}
