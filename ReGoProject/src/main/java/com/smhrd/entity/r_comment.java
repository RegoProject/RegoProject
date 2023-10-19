package com.smhrd.entity;

import java.security.Timestamp;

import javax.persistence.Entity;
import javax.persistence.Id;

import lombok.Data;

// 댓글 테이블


@Entity 
@Data
public class r_comment {
	// 댓글 순번 
	@Id
    private int rmtIdx;

    // 원글 순번 
    private int rbIdx;

    // 댓글 내용 
    private String rmtContent;

    // 댓글 작성일자 
    private Timestamp createdAt;

    // 댓글 수정일자 
    private Timestamp updatedAt;

    // 댓글 작성자 
    private String custId;

    // 댓글 상태 
    private String rmtStatus;
}