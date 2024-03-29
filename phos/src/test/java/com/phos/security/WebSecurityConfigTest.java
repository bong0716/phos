package com.phos.security;


import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.web.servlet.MockMvc;

import com.phos.config.SecurityConfig;
import com.phos.controller.MemberController;

import static org.assertj.core.api.Assertions.assertThat;

import org.aspectj.lang.annotation.Before;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;

public class WebSecurityConfigTest {
	
	@Autowired
	private MockMvc mockMvc;
	
	@Autowired
	private MemberController memberController;
	
	SecurityConfig webSecurityConfig = new SecurityConfig();

	@Before(value = "accessLoginPage")
	public void setup() {
		if (memberController == null) {
	        System.out.println("널");
	    }
	    mockMvc = MockMvcBuilders.standaloneSetup(memberController).build();
	}
	
	@Test
    @DisplayName("패스워드 암호화 테스트")
    void encodeTest() {
        // given
        String rawPW = "1234";

        // when
        String encodePW = webSecurityConfig.getPasswordEncoder().encode(rawPW);

        // then
        assertThat(rawPW).isNotEqualTo(encodePW);
    }
	
	@Test
    @DisplayName("패스워드 일치 테스트")
    void matchTest() {
        // given
        String rawPW = "1234";
        String encodePW = webSecurityConfig.getPasswordEncoder().encode(rawPW);
        String inputPW = "1234";

        // when
        Boolean check = webSecurityConfig.getPasswordEncoder().matches(inputPW, encodePW);

        // then
        assertThat(check).isEqualTo(true);
    }
	
	@Test
    @DisplayName("패스워드 불일치 테스트")
    void notMatchTest() {
        // given
        String originalPW = "1234"; // 설정한 PW의 원본
        String inputPW = "123456"; // 입력한 PW의 원본
        String encodePW = webSecurityConfig.getPasswordEncoder().encode(originalPW); // 설정한 PW를 인코딩한 값

        // when
        Boolean check = webSecurityConfig.getPasswordEncoder().matches(inputPW, encodePW); 
        // 입력한 PW와 설정한 PW를 인코딩한 값을 matches()를 통해 비교한다.
        // originalPW와 inputPW가 다르기 때문에 false 나와야 함.

        // then
        assertThat(check).isEqualTo(false);
    }


}
