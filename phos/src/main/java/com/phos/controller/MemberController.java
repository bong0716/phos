package com.phos.controller;

import java.io.UnsupportedEncodingException;
import java.net.MalformedURLException;
import java.net.URISyntaxException;
import java.util.Locale;
import java.util.Random;

import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindException;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.phos.config.BindExceptionWithViewName;
import com.phos.entity.Member;
import com.phos.config.SecurityConfig;
import com.phos.service.MemberService;

import lombok.RequiredArgsConstructor;
import mail.MailHandler;
import validator.memberValidator;


@Controller
@RequiredArgsConstructor
@RequestMapping("/member/*")
public class MemberController {
	
	private final MessageSource messageSource;
	private final MemberService memberService;
	private final memberValidator memberValidator;
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	SecurityConfig webSecurityConfig = new SecurityConfig();
	
	@InitBinder
	public void init(WebDataBinder dataBinder) {
	    dataBinder.addValidators(memberValidator);
	}
	
	@PostMapping("/register")
	public String register(@Validated @ModelAttribute("member") Member memberDto,
	                       BindingResult bindingResult,
	                       Locale locale,
	                       Model model) throws BindException {

	    if (bindingResult.hasErrors()) {
	        throw new BindExceptionWithViewName(bindingResult, "member/login", messageSource, locale);
	    }

	    memberService.register(memberDto);
	    model.addAttribute("message", "회원가입이 완료되었습니다.");
	    return "redirect:/member/login";
	}

	@GetMapping("/login")
	public String login(@RequestParam(name = "message", defaultValue = "") String message
						,Model model) {
		
		model.addAttribute("message", message);
		return "member/login";
	}
	
	@PostMapping("/login")
	public String login(Member mvo
						,HttpSession session
						,Model model) throws Exception {

		Member member = memberService.login(mvo.getEmail(), mvo.getPassword());
	    if (member != null) { 
	        session.setAttribute("mvo", member);
	        return "redirect:/index";
	    } else {
	        model.addAttribute("message", "없는 이메일이거나 비밀번호가 틀렸습니다.");
	        return "member/login"; 
	    }
	}

	@GetMapping("/logout")
	public String logout(HttpSession session
						 ,RedirectAttributes rttr) {
		
		session.invalidate(); 
		rttr.addAttribute("message", "로그아웃되었습니다.");
		return "redirect:/index";
	}
	
	@GetMapping("/myPage")
	public String myPage(HttpSession session
						 ,Model model
						 ,@RequestParam(name = "message", defaultValue = "") String message) {
					
		Member mvo = (Member) session.getAttribute("mvo");
		model.addAttribute("mvo", mvo);
		model.addAttribute("username", mvo.getUsername());
		model.addAttribute("message", message);
		return "member/myPage";
	}
	
	@PostMapping("/update")
	public String update(HttpSession session
						 ,Member mvo
				         ,Model model) {
		
		memberService.updateMember(mvo);
		model.addAttribute("message", "수정 완료되었습니다.");
		Member member = memberService.findByAll(mvo.getEmail());
		session.setAttribute("mvo", mvo);
		return "redirect:/index";
	}
	
	@PostMapping("/delete")
	public String delete(HttpSession session
						 ,Member mvo
						 ,Model model) throws Exception {
		
		Member sessionMvo = (Member) session.getAttribute("mvo");
		Member member = memberService.login(mvo.getEmail(), mvo.getPassword());
	    if (member != null && mvo.getEmail().equals(sessionMvo.getEmail())) { 
	    	memberService.deleteMember(mvo.getEmail());
	    	session.invalidate(); 
	    	model.addAttribute("message", "탈퇴가 정상적으로 완료되었습니다.");
	        return "redirect:/index";
	    } else {
	        model.addAttribute("message", "이메일이나 비밀번호가 틀렸습니다.");
	        return "member/myPage"; 
	    }
	}
	
	
	@GetMapping("/pwFind")
	public String findPassword() {
		return "member/pwFind";
	}
	

	@PostMapping("/pwFind")
	public String findPassword(Member mvo
							  ,Model model) throws Exception {
		
		Member member = memberService.findByAll(mvo.getEmail());
		if(member != null && member.getUsername().equals(mvo.getUsername())) {
			Random r = new Random();
			int num = r.nextInt(999999);
			memberService.sendMail(mvo, num);
			
			model.addAttribute("num", num);
			model.addAttribute("email", mvo.getEmail());
			return "member/pwAuth";
		}
		else {
			model.addAttribute("message", "없는 이메일이거나 이름이 틀립니다.");
			return "member/pwFind";
		}
	}
	
	@PostMapping("/pwAuth")
	public String authPw(@RequestParam(value="authNum") String authNum
					   	,@RequestParam(value = "num") String num
						,String email
						,Model model) {
		
		if(authNum.equals(num)) {
			model.addAttribute(email);
			return "member/pwNew";
		}else {
			model.addAttribute("message", "인증번호가 틀립니다. 다시 입력해주세요.");
			return "member/pwAuth";
		}
	}
	
	@PostMapping("/pwNew")
	public String pwNew(Member mvo
						,Model model) {
		
		memberService.updatePw(mvo);
		model.addAttribute("message", "비밀번호가 성공적으로 변경되었습니다.");
		return "member/login";
	}
	
	@GetMapping("/naverLogin")
	public void naverLogin(HttpServletRequest request, 
						   HttpServletResponse response) 
		throws MalformedURLException, UnsupportedEncodingException, URISyntaxException {
		
		String url = memberService.getNaverAuthorizeUrl("authorize");
        try {
            response.sendRedirect(url);
        } catch (Exception e) {
            e.printStackTrace();
        }
	}
	
}
