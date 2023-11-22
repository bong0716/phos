package com.phos.service;

import java.io.UnsupportedEncodingException;
import java.net.MalformedURLException;
import java.net.URISyntaxException;

import org.springframework.stereotype.Service;
import org.springframework.validation.BindException;

import com.phos.entity.Member;

@Service
public interface MemberService {

	 void register(Member vo) throws BindException;
	 Member login(String email, String password) throws Exception;
	 boolean isEmailDuplicated(String email);
	 Member findByAll(String email);
	 void deleteMember(String email);
	 void updateMember(Member vo);
	 void updatePw(Member vo);
	 void sendMail(Member mvo, int num) throws Exception;
	 public String getNaverAuthorizeUrl(String type) 
			 throws URISyntaxException, MalformedURLException, UnsupportedEncodingException;

}
