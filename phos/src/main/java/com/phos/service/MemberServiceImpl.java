package com.phos.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindException;

import com.phos.entity.Member;
import com.phos.mapper.MemberMapper;
import com.phos.security.WebSecurityConfig;

@Service
public class MemberServiceImpl implements MemberService {
		  
		@Autowired
		MemberMapper memberMapper;
		
		WebSecurityConfig webSecurityConfig = new WebSecurityConfig();
		
		
	    public boolean isEmailDuplicated(String email){
	        String existingMember = memberMapper.findByEmail(email);
	       
	        return existingMember != null;
	    }
		
	
		@Override
	    public void register(Member vo) throws BindException {
			 memberMapper.insertMember(vo);
			  
		}

		@Override
		public boolean login(String email, String password) throws Exception {
			String encodedPassword = memberMapper.findByPassword(email);
			boolean check = webSecurityConfig.getPasswordEncoder().matches(password, encodedPassword);
			
			return check;
		}


		@Override
		public Member findByAll(String email) {
			Member mvo = memberMapper.findByAll(email);
			
			return mvo;
		}
}
