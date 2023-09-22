package com.phos.entity;

import java.security.Timestamp;
import java.sql.Date;

import lombok.Data;

@Data
public class Member {
    private int memberNum;
    private String username;
    private String email;
    private String phone;
    private String password;
    private Date birthdate;
    private Timestamp registrationDate;
}

