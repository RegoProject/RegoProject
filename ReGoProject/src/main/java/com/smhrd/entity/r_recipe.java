package com.smhrd.entity;

import javax.persistence.Entity;
import javax.persistence.Id;

import lombok.Data;

// 레시피 페이지뷰  테이블

@Entity 
@Data
public class r_recipe {
	@Id
	private Long id;
}
