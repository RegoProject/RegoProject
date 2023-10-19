package com.smhrd.entity;

import javax.persistence.Entity;
import javax.persistence.Id;

import lombok.Data;

// 재료이미지 테이블

@Entity 
@Data
public class IngrdimgVO {

	@Id
	private Long id;
}
