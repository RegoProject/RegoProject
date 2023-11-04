package com.smhrd.entity;

import java.security.Timestamp;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

import lombok.Data;

// 팔로우 테이블

@Entity 
@Data
public class r_follow {

	
	// 팔로잉 순번 
	@Id
	@Column
    private int rflIdx;

    // 팔로워(하는사람)
	@Column
    private String follower;

    // 팔로이(당하는사람)
	@Column
    private String followee;

    // 팔로잉 날짜
	@Column
    private Date createdAt;
}
