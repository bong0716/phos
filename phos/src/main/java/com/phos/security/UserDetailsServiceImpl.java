package com.phos.security;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.phos.entity.Member;
import com.phos.mapper.MemberMapper;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
public class UserDetailsServiceImpl implements UserDetailsService{
		
	@Autowired
	private final MemberMapper memberMapper;
	
	@Override
	public UserDetails loadUserByUsername (String username) throws UsernameNotFoundException {
			Member mvo = memberMapper.findByAll(username);
			
			SecurityUser securityUser = new SecurityUser();
			
			if( mvo != null) {
				securityUser.setName(mvo.getUsername());
				securityUser.setUsername(mvo.getEmail());
				securityUser.setPassword(mvo.getPassword());
				securityUser.setAuthorities(Arrays.asList(new SimpleGrantedAuthority(mvo.getRole().toString())));
			}
			return securityUser;
	}
}
