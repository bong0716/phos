package com.phos.controller;

import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindException;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.phos.config.BindExceptionWithViewName;
import com.phos.entity.Member;
import com.phos.security.WebSecurityConfig;
import com.phos.service.MemberService;

import lombok.RequiredArgsConstructor;
import validator.memberValidator;


@Controller
@RequiredArgsConstructor
@RequestMapping("/member/*")
public class MemberController {
	
	private final MessageSource messageSource;
	private MemberService memberService;
	private final memberValidator memberValidator;
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	WebSecurityConfig webSecurityConfig = new WebSecurityConfig();
	
	
	@InitBinder
	public void init(WebDataBinder dataBinder) {
	    dataBinder.addValidators(memberValidator);
	}
	
	
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String register( 
			@Validated @ModelAttribute("member") Member member, 
	        BindingResult bindingResult,
	        Locale locale,
	        Model model) throws BindException {
	   
	    /*boolean isEmailDuplicated = memberService.isEmailDuplicated(vo.getEmail());

	    if (isEmailDuplicated) {
	    	model.addAttribute("message", "이미 사용 중인 이메일 주소입니다.");
	        return "redirect:/member/login"; 
	    } else {
		
		
			String encodedPassword = webSecurityConfig.getPasswordEncoder().encode(vo.getPassword());
			vo.setPassword(encodedPassword);
	        memberService.register(vo);
	        model.addAttribute("message", "회원가입이 완료되었습니다.");
	        return "redirect:/member/login";
			} */
		
		if(bindingResult.hasErrors()) {
			throw new BindExceptionWithViewName(bindingResult, "member/register", messageSource, locale);
		}
		
		String encodedPassword = webSecurityConfig.getPasswordEncoder().encode(member.getPassword());
		member.setPassword(encodedPassword);
        memberService.register(member);
        model.addAttribute("message", "회원가입이 완료되었습니다.");
		return "redirect:/member/login";
	}

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login( @RequestParam(name = "message", required = false, defaultValue = "") String message,
			Model model) {
		
		model.addAttribute("message", message);
		
		return "member/login";
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(Member vo, HttpSession session, Model model) throws Exception {
	    
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
