package com.phos.service;

import org.springframework.stereotype.Service;

import com.phos.entity.Member;

@Service
public interface MemberService {

	
	 void register(Member vo) throws Exception;
	 boolean login(String email, String password) throws Exception;
	 boolean isEmailDuplicated(String email);
	 Member findByAll(String email);

}
