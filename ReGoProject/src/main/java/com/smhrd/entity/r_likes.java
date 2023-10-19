package com.smhrd.entity;

import java.security.Timestamp;

import javax.persistence.Entity;
import javax.persistence.Id;

import lombok.Data;

// 좋아요 테이블

@Entity 
@Data
public class r_likes {

	
	// 좋아요 순번 
	@Id
    private int rlikeIdx;

    // 고객 아이디 
    private String custId;

    // 게시글 순번 
    private int rbIdx;

    // 좋아요 작성일자 
    private Timestamp createdAt;
}
