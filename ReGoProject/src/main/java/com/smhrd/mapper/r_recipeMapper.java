package com.smhrd.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.smhrd.entity.r_ingre_join_data;
import com.smhrd.entity.r_msg_join_data;

@Mapper
public interface r_recipeMapper {

	// 레시피 상세 뷰 재료 조회
	public List<r_ingre_join_data> selectRecipeIngre(int rcpIdx);
	
	// 레시피 상세 뷰 조미료 조회
	public List<r_msg_join_data> selectRecipeMsg(int rcpIdx);
	
	
	

	

}
