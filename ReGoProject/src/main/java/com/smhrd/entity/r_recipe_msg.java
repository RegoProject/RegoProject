package com.smhrd.entity;

import java.security.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

import lombok.Data;

// 레시피 조미료양 테이블

@Entity 
@Data
public class r_recipe_msg {

    // 조미료 순번 
	@Id
	@Column
    private int rcpMsgIdx;

    // 레시피 순번
	@Column
    private int rcpIdx;

    // 식재료 순번 
	@Column
    private int msgIdx;

    // 식재료 투입량
	@Column
    private float msgAmount;
}
