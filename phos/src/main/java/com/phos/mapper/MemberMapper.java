package com.phos.mapper;

import org.apache.ibatis.annotations.Param;

import com.phos.entity.Member;


public interface MemberMapper {
	// 고객등록 메서드
	  public void insertMember(Member vo) throws Exception;
	  public Member login(@Param("email") String email, @Param("password") String password) throws Exception;
	  public String findByEmail(String email);
	  public String findByPassword(String email);
	  public Member findByAll(String email);
}
