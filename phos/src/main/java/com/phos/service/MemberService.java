package com.phos.service;

import org.springframework.stereotype.Service;

import com.phos.entity.Member;

@Service
public interface MemberService {

	
	public void register(Member vo) throws Exception;
	public Member login(Member vo) throws Exception;

}
