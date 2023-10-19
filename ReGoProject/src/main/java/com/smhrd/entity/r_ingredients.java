package com.smhrd.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

import lombok.Data;

// 재료 테이블

@Entity 
@Data
public class r_ingredients {

	
	// 식재료 순번
	@Id
	@Column
    private int ingreIdx;

    // 식재료명
	@Column
    private String ingreName;

    // 식재료 사진
	@Column
    private String ingreImg;
}
