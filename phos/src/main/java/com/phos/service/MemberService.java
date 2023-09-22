package com.phos.service;

import org.springframework.stereotype.Service;

import com.phos.entity.Member;

@Service
public interface MemberService {

	
	 void register(Member vo) throws Exception;
	 Member login(Member vo) throws Exception;

}
