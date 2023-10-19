package com.smhrd.entity;

import javax.persistence.Entity;
import javax.persistence.Id;

import lombok.Data;

// 재료카테고리 테이블

@Entity 
@Data
public class FdingtgryVO {

	@Id
	private Long id;
}
