package com.smhrd.entity;

import javax.persistence.Entity;
import javax.persistence.Id;

import lombok.Data;

// 레시피 테이블

@Entity 
@Data
public class r_recipe {
	
    // 레시피 순번 
	@Id
	private int rcpIdx;

    // 레시피 명 
    private String rcpName;

    // 레시피 조리순서 
    private String rcpContent;

    // 난이도 
    private int rcpLevel;

    // 동영상 URL 
    private String rcpUrl;

    // 이미지 경로1 
    private String rcpImg1;

    // 이미지 경로2 
    private String rcpImg2;

    // 이미지 경로3 
    private String rcpImg3;

    // 이미지 경로4 
    private String rcpImg4;

    // 이미지 경로5 
    private String rcpImg5;


}
