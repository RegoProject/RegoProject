package com.smhrd.entity;

import java.security.Timestamp;

import javax.persistence.Entity;
import javax.persistence.Id;

import lombok.Data;

// 마이냉장고 테이블

@Entity 
@Data
public class r_my_ingredients {

	@Id
	// 냉장고 번호 
    private int rmrNum;

    // 고객 아이디 
    private String custId;

    // 재료카테고리 순번 
    private int ingreIdx;

    // 재료 보유량 
    private Integer ingreAmount;

    // 재료 등록일 
    private Timestamp createdAt;
}
