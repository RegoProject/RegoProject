package com.smhrd.entity;

import java.security.Timestamp;

import javax.persistence.Entity;
import javax.persistence.Id;

import lombok.Data;

// 마이조미료 테이블


@Entity 
@Data
public class r_my_msg {
	
	// 냉장고 번호 
	@Id
    private int rmr_num;

    // 고객 아이디 
    private String cust_id;

    // 조미료카테고리 순번 
    private int msg_idx;

    // 조미료 보유량 
    private Integer msg_amount;

    // 조미료 등록일 
    private Timestamp created_at;
}
