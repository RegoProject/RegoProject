package com.smhrd.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

import lombok.Data;

// 레시피 테이블

@Entity 
@Data
public class r_recipe {
	
    // 레시피 순번 
	@Id
	@Column
	private int rcpIdx;

    // 레시피 명
	@Column
    private String rcpName;

    // 레시피 조리순서
	@Column
    private String rcpContent;

    // 난이도
	@Column
    private String rcpLevel;

    // 동영상 URL
	@Column
    private String rcpUrl;

    // 이미지 경로1
	@Column
    private String rcpImg1;

    // 이미지 경로2
	@Column
    private String rcpImg2;

    // 이미지 경로3
	@Column
    private String rcpImg3;

    // 이미지 경로4
	@Column
    private String rcpImg4;

    // 이미지 경로5
	@Column
    private String rcpImg5;
	
	@Column
	private String rcpTime;


}
