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
    private int rmr_num;

    // 고객 아이디 
    private String cust_id;

    // 재료카테고리 순번 
    private int ingre_idx;

    // 재료 보유량 
    private Integer ingre_amount;

    // 재료 등록일 
    private Timestamp created_at;
}
