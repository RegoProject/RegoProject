package com.smhrd.entity;

import javax.persistence.Entity;
import javax.persistence.Id;

import lombok.Data;

// 마이조미료 테이블


@Entity 
@Data
public class r_my_msg {

	@Id
	private Long id;
}
