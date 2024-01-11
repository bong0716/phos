package com.phos.entity;

import java.sql.Timestamp;
import java.sql.Date;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.Range;

import lombok.Data;

@Data
public class Member {
	
    private int member_num;
    
    @NotBlank
    private String username;
    
    @NotBlank
    @Email
    private String email;
    
    @NotBlank
    private String phone;
    
    @NotBlank
    @Length(min = 8, max = 20)
    private String password;
    
    @NotNull
    private Date birthdate;
    private Date registration_date;
    
    private Role role;
}

