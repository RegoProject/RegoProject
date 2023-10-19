package com.smhrd.entity;

import java.security.Timestamp;

import javax.persistence.Entity;
import javax.persistence.Id;

import lombok.Data;

// 레시피 조미료양 테이블

@Entity 
@Data
public class r_recipe_msg {

    // 재료 순번 
	@Id
    private int rcpIngreIdx;

    // 레시피 순번 
    private int rcpIdx;

    // 식재료 순번 
    private int msgIdx;

    // 식재료 투입량 
    private Integer msgAmount;
}
