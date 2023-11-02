package com.phos.service;

import javax.mail.MessagingException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindException;

import com.phos.entity.Member;
import com.phos.mapper.MemberMapper;

import lombok.RequiredArgsConstructor;
import mail.MailHandler;
import validator.memberValidator;

import com.phos.config.WebSecurityConfig;

@Service
@ComponentScan("com.phos.config")
@RequiredArgsConstructor
public class MemberServiceImpl implements MemberService {
		  
		private final MemberMapper memberMapper;
		private final JavaMailSender mailSender;
		
		WebSecurityConfig webSecurityConfig = new WebSecurityConfig();
		
		
	    public boolean isEmailDuplicated(String email){
	        String existingMember = memberMapper.findByEmail(email);
	        return existingMember != null;
	    }
		
	
		@Override
	    public void register(Member vo) throws BindException {
			String encodedPassword = webSecurityConfig.getPasswordEncoder().encode(vo.getPassword());
			vo.setPassword(encodedPassword);
			memberMapper.insertMember(vo);
		}

		@Override
		public Member login(String email, String password) throws Exception {
			String encodedPassword = memberMapper.findByPassword(email);
			boolean check = webSecurityConfig.getPasswordEncoder().matches(password, encodedPassword);
			Member member;
			if(check)
				member = memberMapper.login(email, encodedPassword);
			else
				member = null;
			 
			return member;
		}

		@Override
		public Member findByAll(String email) {
			Member mvo = memberMapper.findByAll(email);
			return mvo;
		}

		@Override
		public void deleteMember(String email) {
			memberMapper.deleteMember(email);
		}

		@Override
		public void updateMember(Member vo) {
			memberMapper.updateMember(vo);
		}
		
		@Override
	    public void updatePw(Member vo){
			String encodedPassword = webSecurityConfig.getPasswordEncoder().encode(vo.getPassword());
			vo.setPassword(encodedPassword);
			memberMapper.updatePw(vo);
		}

		@Override
		public void sendMail(Member mvo, int num) throws Exception {
			MailHandler sendMail = new MailHandler(mailSender);
			sendMail.setSubject("[포스축구아카데미] 비밀번호 변경 인증 이메일입니다.");
			sendMail.setText(
					"<h1>포스축구아카데미 메일 인증</h1>" + 
					"<br>안녕하세요 회원님" +
					"<br>비밀번호 변경 인증번호는 " + num + " 입니다."
					);
			sendMail.setFrom("hjyoon0716@gmail.com", "포스축구아카데미");
			sendMail.setTo(mvo.getEmail());
			sendMail.send();
		}
}
