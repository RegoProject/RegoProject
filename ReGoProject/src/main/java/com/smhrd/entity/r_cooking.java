package com.smhrd.entity;

import javax.persistence.Entity;
import javax.persistence.Id;

import lombok.Data;

// 요리성공YN 테이블

@Entity 
@Data
public class r_cooking {

	@Id
	private Long id;
}
