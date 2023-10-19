package com.smhrd.entity;

import javax.persistence.Entity;
import javax.persistence.Id;

import lombok.Data;

// 조미료카테고리 테이블


@Entity 
@Data
public class r_msg {
	
    // 조미료 순번 
	@Id
    private int msgIdx;

    // 조미료 명 
    private String msgName;

    // 조미료 이미지 
    private String msgImg;
}
