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
	
	
	
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String register(Member vo, RedirectAttributes rttr) throws Exception {
	    // 이메일 중복 확인 로직을 구현합니다.
	    boolean isEmailDuplicated = memberService.isEmailDuplicated(vo.getEmail());

	    if (isEmailDuplicated) {
	        // 이메일이 중복되는 경우
	        rttr.addFlashAttribute("error", "이미 사용 중인 이메일 주소입니다.");
	        return "redirect:/member/login"; // 중복되면 회원가입 페이지로 다시 리다이렉트
	    } else {
	        // 이메일이 중복되지 않는 경우 회원 가입을 처리합니다.
	        memberService.register(vo);
	        rttr.addFlashAttribute("message", "회원가입이 완료되었습니다.");
	        return "redirect:/index";
	    }
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
	
}
