package com.smhrd.entity;

import java.security.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import lombok.Data;

// 댓글 테이블


@Entity 
@Data
public class r_comment {
	// 댓글 순번 
	@Id
	@Column
	@GeneratedValue(strategy = GenerationType.IDENTITY) // Auto Increment로 설정
    private int rmtIdx;

    // 원글 순번 
	@Column
    private int rbIdx;

    // 댓글 내용 
	@Column
    private String rmtContent;

    // 댓글 작성일자
	@Column
    private String createdAt;

    // 댓글 수정일자
	@Column
    private String updatedAt;

    // 댓글 작성자
	@Column
    private String custId;

    // 댓글 상태
	@Column
    private String rmtStatus;
}
