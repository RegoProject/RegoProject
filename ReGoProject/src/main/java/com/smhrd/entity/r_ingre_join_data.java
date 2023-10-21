package com.smhrd.entity;

import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;

import lombok.Data;

@Data
@DynamicInsert  
@DynamicUpdate
public class r_ingre_join_data {
	
	private String ingreName;
	private String ingreAmount;

}
