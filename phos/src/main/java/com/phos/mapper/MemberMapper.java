package com.phos.mapper;

import com.phos.entity.Member;


public interface MemberMapper {
	// 고객등록 메서드
	  public void insertMember(Member vo) throws Exception;
	  public Member login(Member vo) throws Exception;
}
