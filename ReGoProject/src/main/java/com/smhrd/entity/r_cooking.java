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
    private int rc_idx;

    // 고객 아이디 
    private String cust_id;

    // 레시피 순번 
    private int rcp_idx;

    // 레시피 사진 
    private String rcp_img;

    // 성공 여부 
    private String rc_yn;

    // 작성 날짜 
    private Timestamp created_at;
}
