package com.smhrd.entity;

import java.security.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import lombok.Data;

// 마이냉장고 테이블

@Entity 
@Data
public class r_my_ingredients {

	
	// 냉장고 번호 
	@Id
	@Column
	@GeneratedValue(strategy = GenerationType.IDENTITY) // Auto Increment로 설정
    private int rmrNum;

    // 고객 아이디
	@Column
    private String custId;

    // 재료카테고리 순번
	@Column
    private int ingreIdx;

    // 재료 보유량
	@Column
    private int ingreAmount;

    // 재료 등록일
	@Column
    private String createdAt;
}
