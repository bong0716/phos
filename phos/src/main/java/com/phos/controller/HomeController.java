package com.phos.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.phos.entity.Member;
import com.phos.service.MemberService;


@Controller
public class HomeController {
	
	private MemberService memberService;

	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String home(
			@SessionAttribute(name = "mvo", required = false) Member mvo,
            @RequestParam(name = "message", required = false, defaultValue = "") String message,
            Model model) {
			
			model.addAttribute("username", mvo != null ? mvo.getUsername() : "");
			model.addAttribute("message", message);
			return "pages/home";
	}
	
	@RequestMapping(value = "/facility", method = RequestMethod.GET)
	public String facility() {
		
		return "pages/facility";
	}
	
	
	
	
}
