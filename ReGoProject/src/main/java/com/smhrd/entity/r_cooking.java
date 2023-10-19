package com.smhrd.entity;

import java.security.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

import lombok.Data;

// 요리성공YN 테이블

@Entity 
@Data
public class r_cooking {

	// 요리 순번
	@Id
	@Column
    private int rcIdx;

    // 고객 아이디 
	@Column
    private String custId;

    // 레시피 순번
	@Column
    private int rcpIdx;

    // 레시피 사진
	@Column
    private String rcpImg;

    // 성공 여부
	@Column
    private String rcYn;

    // 작성 날짜
	@Column
    private String createdAt;
}
