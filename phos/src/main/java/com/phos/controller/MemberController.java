package com.phos.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.phos.entity.Member;
import com.phos.service.MemberService;


@Controller
@RequestMapping("/member/*")
public class MemberController {
	
	private MemberService memberService;
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	public MemberController(MemberService memberService) {
		this.memberService = memberService;
	}

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login() {
		
		return "member/login";
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(Member vo, HttpSession session, RedirectAttributes rttr) throws Exception {
		Member mvo = memberService.login(vo);
		
		if(mvo != null) { //로그인 성공
			session.setAttribute("mvo", mvo); // 객체바인딩 -> ${!empty mvo}
			logger.debug("Login successful. Member: {}", mvo.getUsername());
		}else if (mvo == null) {
			rttr.addAttribute("message", "없는 아이디이거나 비밀번호가 틀렸습니다.");
		}
		
		
		return "redirect:/index";

	}
	
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session, RedirectAttributes rttr) {
		session.invalidate(); // 세션 무효화(로그아웃)
		
		rttr.addAttribute("message", "로그아웃되었습니다.");
		
		return "redirect:/index";
	}
	
	
	
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String register(Member vo, RedirectAttributes rttr) throws Exception {
		
		memberService.register(vo);
		System.out.print(vo);
		
		return "redirect:/member/login";
	}
	
	
}
