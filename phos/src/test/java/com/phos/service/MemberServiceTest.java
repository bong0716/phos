package com.phos.service;

import static org.mockito.Mockito.times;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;

import java.net.BindException;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;
import org.springframework.security.crypto.password.PasswordEncoder;

import com.phos.entity.Member;
import com.phos.mapper.MemberMapper;
import com.phos.service.MemberServiceImpl;

public class MemberServiceTest {
	
	@InjectMocks
    private MemberServiceImpl memberService;

    @Mock
    private MemberMapper memberMapper;

    @Mock
    private PasswordEncoder passwordEncoder;

    @BeforeEach
    public void setup() {
        MockitoAnnotations.initMocks(this);
    }

    @DisplayName("회원 가입 테스트")
    @Test
    void registerTest() throws BindException, org.springframework.validation.BindException {
        // given
        Member testMember = new Member();
        testMember.setEmail("test@test.com");
        testMember.setPassword("password123");

        // 가짜 비밀번호 인코딩 결과 설정
        String encodedPassword = "encodedPassword";
        when(passwordEncoder.encode(testMember.getPassword())).thenReturn(encodedPassword);

        // when
        memberService.register(testMember);

        // then
        // memberMapper의 insertMember 메서드가 한 번 호출되었는지 검증
        verify(memberMapper, times(1)).insertMember(testMember);

    }
}
