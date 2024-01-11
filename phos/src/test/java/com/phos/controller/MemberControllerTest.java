package com.phos.controller;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.Mockito;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;

import com.phos.entity.Member;
import com.phos.service.MemberService;

public class MemberControllerTest {
	
	@InjectMocks
	private MemberController memberController;
	
	@Mock
	private MemberService memberService;
	
	private MockMvc mockMvc;
	
	@BeforeEach
	public void init() {
		mockMvc = MockMvcBuilders.standaloneSetup(memberController).build();
	}
	
	

	private Member signUpRequest() {
	    Member member = new Member();
	    member.setEmail("test");
	    member.setPassword("1234");
	    return member;
	}
	

}
