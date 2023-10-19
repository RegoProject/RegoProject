package com.smhrd.entity;

import java.security.Timestamp;

import javax.persistence.Entity;
import javax.persistence.Id;

import lombok.Data;

// 요리성공YN 테이블

@Entity 
@Data
public class r_cooking {

	// 요리 순번
	@Id
    private int rcIdx;

    // 고객 아이디 
    private String custId;

    // 레시피 순번 
    private int rcpIdx;

    // 레시피 사진 
    private String rcpImg;

    // 성공 여부 
    private String rcYn;

    // 작성 날짜 
    private Timestamp createdAt;
}
