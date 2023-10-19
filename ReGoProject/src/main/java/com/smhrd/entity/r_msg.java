package com.smhrd.entity;

import javax.persistence.Entity;
import javax.persistence.Id;

import lombok.Data;

// 조미료이미지 테이블


@Entity 
@Data
public class r_msg {
	
    // 조미료 순번 
	@Id
    private int msg_idx;

    // 조미료 명 
    private String msg_name;

    // 조미료 이미지 
    private String msg_img;
}
