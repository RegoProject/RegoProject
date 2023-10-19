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
    private int rbIdx;

    // 글 내용 
    private String rbContent;

    // 글 첨부파일 
    private String rbImg;

    // 글 작성일자 
    private Timestamp createdAt;

    // 글 수정일자 
    private Timestamp updatedAt;

    // 글 상태 
    private String rbStatus;

    // 글 작성자 
    private String custId;

    // 글 조회수 
    private Integer rbViews;

    // 글 추천수 
    private Integer rbLikes;

}
