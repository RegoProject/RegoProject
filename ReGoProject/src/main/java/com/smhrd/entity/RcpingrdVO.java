package com.smhrd.entity;

import javax.persistence.Entity;
import javax.persistence.Id;

import lombok.Data;

// 레시피재료 테이블

@Entity 
@Data
public class RcpingrdVO {

	
	@Id
	private Long id;
}
