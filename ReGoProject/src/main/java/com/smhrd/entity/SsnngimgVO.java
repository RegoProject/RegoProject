package com.smhrd.entity;

import javax.persistence.Entity;
import javax.persistence.Id;

import lombok.Data;

// 조미료이미지 테이블


@Entity 
@Data
public class SsnngimgVO {
	@Id
	private Long id;
}
