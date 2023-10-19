package com.smhrd.entity;

import javax.persistence.Entity;
import javax.persistence.Id;

import lombok.Data;

// 레시피 재료양 테이블

@Entity 
@Data
public class r_recipe_ingredients {

    // 재료 순번 
	@Id
    private int rcpIngreIdx;

    // 레시피 순번 
    private int rcpIdx;

    // 식재료 순번 
    private int ingreIdx;

    // 식재료 투입량 
    private Integer ingreAmount;
}
