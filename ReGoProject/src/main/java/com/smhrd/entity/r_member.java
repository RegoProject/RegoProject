package com.smhrd.entity;

import java.security.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

import lombok.Data;

// 회원정보 테이블

@Entity // 이 DTO를 Table이라 지정하겠다.
@Data
public class r_member {
	// JAP : NO SQL
	// ORM(Objec Relationl Mapping)
	// JAVA객체 <--> DB Table
	// DTO 생성 == DB에 Table 생성
	// DTO 필드 --> 컬럼

	// 고객 아이디 
	@Id // primary key 를 지정하는 어노테이션
    private String cust_id;

    // 고객 비밀번호 
    private String cust_pw;

    // 고객 이름 
    private String cust_name;

    // 고객 연락처 
    private String cust_phone;

    // 고객 이메일 
    private String cust_email;

    // 고객 주소 
    private String cust_addr;

    // 고객 프로필사진 
    private String cust_img;

    // 고객 보유코인 
    private Integer cust_coin;

    // 고객 경험치 
    private Integer cust_exp;

    // 고객 가입일자 
    private Timestamp cust_joindate;














}
