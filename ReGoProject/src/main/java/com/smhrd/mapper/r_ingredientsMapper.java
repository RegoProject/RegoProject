package com.smhrd.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.smhrd.entity.r_ingredients;

@Mapper
public interface r_ingredientsMapper {
	
	public List<r_ingredients> ingreSearch(String ingreName);
	

	
	

}
