package com.phos.service;

import java.io.UnsupportedEncodingException;
import java.net.MalformedURLException;
import java.net.URISyntaxException;
import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.validation.BindException;

import com.phos.entity.Member;
import com.phos.entity.PagingVO;

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
	 public List<Member> selectAll(PagingVO pagingInfo);
	 public int countAll();
}
