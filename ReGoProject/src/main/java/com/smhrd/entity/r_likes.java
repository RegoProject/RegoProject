package com.smhrd.entity;

import javax.persistence.Entity;
import javax.persistence.Id;

import lombok.Data;

// 좋아요 테이블

@Entity 
@Data
public class r_likes {

	@Id
	private Long id;
}
