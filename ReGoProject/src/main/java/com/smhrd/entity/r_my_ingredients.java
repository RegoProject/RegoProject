package com.smhrd.entity;

import javax.persistence.Entity;
import javax.persistence.Id;

import lombok.Data;

// 마이냉장고 테이블

@Entity 
@Data
public class r_my_ingredients {

	@Id
	private Long id;
}
