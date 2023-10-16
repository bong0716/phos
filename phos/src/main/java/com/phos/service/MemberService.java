package com.phos.service;

import org.springframework.stereotype.Service;
import org.springframework.validation.BindException;

import com.phos.entity.Member;

@Service
public interface MemberService {

	
	 void register(Member vo) throws BindException;
	 Member login(String email, String password) throws Exception;
	 boolean isEmailDuplicated(String email);
	 Member findByAll(String email);

}
