package com.phos.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.phos.entity.Member;
import com.phos.mapper.MemberMapper;

@Service
public class MemberServiceImpl implements MemberService {
		  
		  @Autowired
		  MemberMapper memberMapper;
	
		  // 고객등록 메서드
		  public void register(Member vo) throws Exception {
			  memberMapper.insertMember(vo);
			  
		  }

		@Override
		public Member login(Member vo) throws Exception {
			Member mvo = memberMapper.login(vo);
			
			return mvo;
		}
}
