package com.phos.controller;

import javax.servlet.http.HttpSession;

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
	
	
	@Autowired
	MemberService memberService;
	

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login() {
		
		return "member/login";
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(Member vo, HttpSession session) throws Exception {
		Member mvo = memberService.login(vo);
		if(mvo!=null) { //로그인 성공
			session.setAttribute("mvo", mvo); // 객체바인딩 -> ${!empty mvo}
		}
		
		return "redirect:/index";

	}
	
	
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String register(Member vo, RedirectAttributes rttr) throws Exception {
		
		memberService.register(vo);
		System.out.print(vo);
		
		return "redirect:/member/login";
	}
	
	
}
