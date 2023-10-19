package com.smhrd.entity;

import javax.persistence.Entity;
import javax.persistence.Id;

import lombok.Data;

// 댓글 테이블


@Entity 
@Data
public class r_comment {
	@Id
	private Long id;
}
