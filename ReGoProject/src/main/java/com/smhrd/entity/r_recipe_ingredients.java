package com.smhrd.entity;

import javax.persistence.Entity;
import javax.persistence.Id;

import lombok.Data;

// 레시피재료 테이블

@Entity 
@Data
public class r_recipe_ingredients {

    // 재료 순번 
	@Id
    private int rcp_ingre_idx;

    // 레시피 순번 
    private int rcp_idx;

    // 식재료 순번 
    private int ingre_idx;

    // 식재료 투입량 
    private Integer ingre_amount;
}
