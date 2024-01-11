package com.phos.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.validation.BindException;

import com.phos.entity.Member;
import com.phos.entity.PagingVO;


public interface MemberMapper {
	// 고객등록 메서드
	  public void insertMember(Member vo) throws BindException;
	  public Member login(@Param("email") String email, @Param("password") String password) throws Exception;
	  public String findByEmail(String email);
	  public String findByPassword(String email);
	  public Member findByAll(String email);
	  public void deleteMember(String email);
	  public void updateMember(Member vo);
	  public void updatePw(Member vo);
	  public List<Member> selectAll(PagingVO pagingInfo);
	  public int countAll();
}
