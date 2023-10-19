package com.smhrd.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

import lombok.Data;


// 회원관리 테이블

@Entity // 이 DTO를 Table이라 지정하겠다.
@Data
public class r_member {
	// JAP : NO SQL
	// ORM(Objec Relationl Mapping)
	// JAVA객체 <--> DB Table
	// DTO 생성 == DB에 Table 생성
	// DTO 필드 --> 컬럼

	// 이메일
	@Id // primary key 를 지정하는 어노테이션
	@Column(length = 100, updatable = false) // column의 상세 특징을 정의
	private String email;
	
	
	// 비밀번호
	
	private String pw;

	// 전화번호
	private String tel;

	// 집주소
	private String address;














}
