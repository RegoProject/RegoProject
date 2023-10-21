package com.smhrd.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.smhrd.entity.r_ingre_join_data;
import com.smhrd.entity.r_member;

@Mapper
public interface r_memberMapper {

	
	public List<r_ingre_join_data> myIngredients(String custId);
	
	
}
