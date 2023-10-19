package com.smhrd.entity;

import javax.persistence.Entity;
import javax.persistence.Id;

import lombok.Data;

// 재료 테이블

@Entity 
@Data
public class r_ingredients {

	
	// 식재료 순번
	@Id
    private int ingreIdx;

    // 식재료 명 
    private String ingreName;

    // 식재료 사진 
    private String ingreImg;
}
