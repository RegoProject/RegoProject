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
    private int rmt_idx;

    // 원글 순번 
    private int rb_idx;

    // 댓글 내용 
    private String rmt_content;

    // 댓글 작성일자 
    private Timestamp created_at;

    // 댓글 수정일자 
    private Timestamp updated_at;

    // 댓글 작성자 
    private String cust_id;

    // 댓글 상태 
    private String rmt_status;
}
