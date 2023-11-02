package com.smhrd.entity;


import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

import lombok.Data;

// 게시판 테이블

@Entity 
@Data
public class r_board {
	
	
    // 글 순번 
	@Id
	@Column
    private int rbIdx;

    // 글 내용 
	@Column
    private String rbContent;

    // 글 첨부파일 
	@Column
    private String rbImg;

    // 글 작성일자 
	@Column
    private Date createdAt;

    // 글 수정일자 
	@Column
    private Date updatedAt;

    // 글 상태 
	@Column
    private String rbStatus;

    // 글 작성자 
	@Column
    private String custId;

    // 글 조회수 
	@Column
    private int rbViews;

    // 글 추천수 
	@Column
    private int rbLikes;

}
