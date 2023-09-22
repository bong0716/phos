package com.phos.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
@RequestMapping("/board/*")
public class BoardController {
	

	@RequestMapping(value = "/board", method = RequestMethod.GET)
	public String home() {
		
		return "board/list";
	}
	
	
	
}
