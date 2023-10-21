package com.smhrd.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.smhrd.entity.r_ingre_join_data;
import com.smhrd.entity.r_msg_join_data;

@Mapper
public interface r_memberMapper {

	// 나의 재료 + 재료 카테고리 조인 dao
	public List<r_ingre_join_data> myIngredients(String custId);

	// 나의 조미료 + 조미료 카테고리 조인 dao
	public List<r_msg_join_data> myMsg(String custId);
	
	
}
