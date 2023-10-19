package com.smhrd.entity;

import javax.persistence.Entity;
import javax.persistence.Id;

import lombok.Data;

// 재료이미지 테이블

@Entity 
@Data
public class r_ingredients {

	@Id
	private Long id;
}
