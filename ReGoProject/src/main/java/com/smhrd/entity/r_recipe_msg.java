package com.smhrd.entity;

import java.security.Timestamp;

import javax.persistence.Entity;
import javax.persistence.Id;

import lombok.Data;

// 조미료 카테고리 테이블

@Entity 
@Data
public class r_recipe_msg {

    // 재료 순번 
	@Id
    private int rcp_ingre_idx;

    // 레시피 순번 
    private int rcp_idx;

    // 식재료 순번 
    private int msg_idx;

    // 식재료 투입량 
    private Integer msg_amount;
}
