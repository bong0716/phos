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
import com.phos.entity.PagingVO;
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
	public String list(PagingVO vo, Model model
			,@RequestParam(value="nowPage", required=false)String nowPage
			,@RequestParam(value="cntPerPage", required=false)String cntPerPage
			,HttpSession session) {
		
		Member mvo = (Member) session.getAttribute("mvo");
		if (mvo == null) {
	        model.addAttribute("message", "로그인이 필요한 서비스입니다.");
	        return "redirect:/member/login"; 
	    }
		
		int total = boardService.countBoard(mvo.getEmail());
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "5";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) { 
			cntPerPage = "5";
		}
		vo = new PagingVO(mvo.getEmail(), total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		model.addAttribute("paging", vo);
		
		List<Board> boardList = boardService.selectBoard(vo);
		if (boardList == null) {
			return "board/list";
		}  
		model.addAttribute("boardList", boardList);
		model.addAttribute("username", mvo != null ? mvo.getUsername() : "");
		model.addAttribute("board_user_email", mvo != null ? mvo.getEmail() : "");
		return "board/list";
	}
	
	@PostMapping("/list")
	public String list(@ModelAttribute("board") Board boardVo) {
		boardService.insertBoard(boardVo);
		return "redirect:/board/list";
	}
	
	@GetMapping("detail")
	public String detail(
			@RequestParam("no") int boardNum
			,Model model
			,HttpSession session) {
		
		Board data = boardService.getDetail(boardNum);
		Member mvo = (Member) session.getAttribute("mvo");
		model.addAttribute("data", data);
		model.addAttribute("username", mvo != null ? mvo.getUsername() : "");
		return "/board/detail";
	}
	
	@GetMapping("delete")
	public String delete(@RequestParam("no") int boardNum){
				boardService.deleteBoard(boardNum);
				return "redirect:/board/list";
	}
	
}
