package com.phos.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.phos.entity.Member;
import com.phos.mapper.MemberMapper;

@Service
public class MemberServiceImpl implements MemberService {
		  
		@Autowired
		MemberMapper memberMapper;
		
		
		// 이메일 중복 여부 확인 메서드
	    public boolean isEmailDuplicated(String email){
	        // 데이터베이스에서 이메일 주소로 회원을 조회합니다.
	        String existingMember = memberMapper.findByEmail(email);
	        // 조회 결과가 null이 아니면 이미 존재하는 이메일이므로 중복으로 처리합니다.
	        return existingMember != null;
	    }
		
	
		@Override
	    public void register(Member vo) throws Exception {
			 memberMapper.insertMember(vo);
			  
		}

		@Override
		public Member login(Member vo) throws Exception {
			Member mvo = memberMapper.login(vo);
			
			return mvo;
		}
}
