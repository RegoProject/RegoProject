package com.smhrd.entity;

import javax.persistence.Entity;
import javax.persistence.Id;

import lombok.Data;

// 팔로우 테이블

@Entity 
@Data
public class FollowVO {

	@Id
	private Long id;
}
