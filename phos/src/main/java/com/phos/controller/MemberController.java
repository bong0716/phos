package com.phos.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.phos.entity.Member;
import com.phos.security.WebSecurityConfig;
import com.phos.service.MemberService;


@Controller
@RequestMapping("/member/*")
public class MemberController {
	
	private MemberService memberService;
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	WebSecurityConfig webSecurityConfig = new WebSecurityConfig();

	
	public MemberController(MemberService memberService) {
		this.memberService = memberService;
	}
	
	
	
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String register(Member vo, Model model) throws Exception {
	   
	    boolean isEmailDuplicated = memberService.isEmailDuplicated(vo.getEmail());

	    if (isEmailDuplicated) {
	    	model.addAttribute("message", "이미 사용 중인 이메일 주소입니다.");
	        return "redirect:/member/login"; 
	    } else {
			String encodedPassword = webSecurityConfig.getPasswordEncoder().encode(vo.getPassword());
			vo.setPassword(encodedPassword);
	        memberService.register(vo);
	        model.addAttribute("message", "회원가입이 완료되었습니다.");
	        return "redirect:/member/login";
	    }
	}

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login( @RequestParam(name = "message", required = false, defaultValue = "") String message,
			Model model) {
		
		model.addAttribute("message", message);
		
		return "member/login";
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(Member vo, HttpSession session, RedirectAttributes rttr, Model model) throws Exception {
	    
		Boolean check = memberService.login(vo.getEmail(), vo.getPassword());
	    if (check) { 
	    	Member mvo = memberService.findByAll(vo.getEmail());
	        session.setAttribute("mvo", mvo);
	        return "redirect:/index";
	    } else {
	        model.addAttribute("message", "없는 아이디이거나 비밀번호가 틀렸습니다.");
	        return "member/login"; 
	    }
	}

	
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session, RedirectAttributes rttr) {
		session.invalidate(); 
		
		rttr.addAttribute("message", "로그아웃되었습니다.");
		
		return "redirect:/index";
	}
	
}
