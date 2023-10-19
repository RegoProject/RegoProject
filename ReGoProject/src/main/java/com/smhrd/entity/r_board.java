package com.smhrd.entity;

import java.security.Timestamp;

import javax.persistence.Entity;
import javax.persistence.Id;

import lombok.Data;

// 게시판 테이블

@Entity 
@Data
public class r_board {
	
	
    // 글 순번 
	@Id
    private int rb_idx;

    // 글 내용 
    private String rb_content;

    // 글 첨부파일 
    private String rb_img;

    // 글 작성일자 
    private Timestamp created_at;

    // 글 수정일자 
    private Timestamp updated_at;

    // 글 상태 
    private String rb_status;

    // 글 작성자 
    private String cust_id;

    // 글 조회수 
    private Integer rb_views;

    // 글 추천수 
    private Integer rb_likes;

}
