package com.phos.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class HomeController {
	

	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String home() {
		
		return "pages/home";
	}
	
	@RequestMapping(value = "/facility", method = RequestMethod.GET)
	public String facility() {
		
		return "pages/facility";
	}
	
	
	
	
}
