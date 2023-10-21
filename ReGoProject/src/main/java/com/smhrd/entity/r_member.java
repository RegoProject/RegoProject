package com.smhrd.entity;


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;

import lombok.Data;

// 회원정보 테이블

@Entity // 이 DTO를 Table이라 지정하겠다.
@Data
@DynamicInsert
@DynamicUpdate
public class r_member {
	// JAP : NO SQL
	// ORM(Objec Relationl Mapping)
	// JAVA객체 <--> DB Table
	// DTO 생성 == DB에 Table 생성
	// DTO 필드 --> 컬럼

	// 고객 아이디 
	@Id // primary key 를 지정하는 어노테이션
	@Column
    private String custId;

    // 고객 비밀번호 
	@Column
    private String custPw;

    // 고객 이름 
	@Column
    private String custName;

    // 고객 연락처 
	@Column
    private String custPhone;

    // 고객 이메일 
	@Column
    private String custEmail;

    // 고객 주소 
	@Column
    private String custAddr;

    // 고객 프로필사진 
	@Column
    private String custImg;

    // 고객 보유코인 
	@Column
    private int custCoin;

    // 고객 경험치 
	@Column
    private int custExp;

    // 고객 가입일자 
	@Column
    private String custJoindate;
	















}
