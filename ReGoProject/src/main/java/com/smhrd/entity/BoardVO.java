package com.smhrd.entity;

import javax.persistence.Entity;
import javax.persistence.Id;

import lombok.Data;

// 게시판 테이블

@Entity 
@Data
public class BoardVO {
	
	@Id
	private Long id;

}
