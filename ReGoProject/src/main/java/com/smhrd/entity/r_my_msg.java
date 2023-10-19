package com.smhrd.entity;

import java.security.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

import lombok.Data;

// 마이조미료 테이블


@Entity 
@Data
public class r_my_msg {
	
	// 냉장고 번호 
	@Id
	@Column
    private int rmrNum;

    // 고객 아이디
	@Column
    private String custId;

    // 조미료카테고리 순번
	@Column
    private int msgIdx;

    // 조미료 보유량
	@Column
    private Integer msgAmount;

    // 조미료 등록일
	@Column
    private Timestamp createdAt;
}
