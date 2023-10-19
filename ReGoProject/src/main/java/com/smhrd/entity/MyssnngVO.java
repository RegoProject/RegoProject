package com.smhrd.entity;

import javax.persistence.Entity;
import javax.persistence.Id;

import lombok.Data;

// 마이조미료 테이블


@Entity 
@Data
public class MyssnngVO {

	@Id
	private Long id;
}
