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
	private int rcp_idx;

    // 레시피 명 
    private String rcp_name;

    // 레시피 조리순서 
    private String rcp_content;

    // 난이도 
    private int rcp_level;

    // 동영상 URL 
    private String rcp_url;

    // 이미지 경로1 
    private String rcp_img1;

    // 이미지 경로2 
    private String rcp_img2;

    // 이미지 경로3 
    private String rcp_img3;

    // 이미지 경로4 
    private String rcp_img4;

    // 이미지 경로5 
    private String rcp_img5;


}
