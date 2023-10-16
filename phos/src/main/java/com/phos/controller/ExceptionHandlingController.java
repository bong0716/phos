package com.phos.controller;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

import com.phos.config.BindExceptionWithViewName;

@ControllerAdvice
public class ExceptionHandlingController {
	@ExceptionHandler(BindExceptionWithViewName.class)
	protected String handleBadRequest(BindExceptionWithViewName e, Model model) {
		model.addAttribute("errors", e);
		return e.getViewName();
	}
}
