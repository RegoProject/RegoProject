package com.smhrd.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.smhrd.entity.r_ingre_join_data;
import com.smhrd.entity.r_msg_join_data;
import com.smhrd.entity.r_recipe;
import com.smhrd.mapper.r_recipeMapper;

@Service
@Transactional
public class r_recipeService {
	
	@Autowired
	private r_recipeMapper recMapper;
	
	public r_recipeService(r_recipeMapper recMapper) {
		this.recMapper = recMapper;
	}
	
	// 레시피 전체 보유재료 조인 dao
	public List<r_ingre_join_data> selectRecipeIngre(int rcpIdx){
		List<r_ingre_join_data> result = recMapper.selectRecipeIngre(rcpIdx);
		return result;
	}
	
	public List<r_msg_join_data> selectRecipeMsg(int rcpIdx){
		List<r_msg_join_data> result = recMapper.selectRecipeMsg(rcpIdx);
		return result;
	}
	
	
	public r_recipe selectRecipe(String rcpName) {
		r_recipe recipeResult = recMapper.selectRecipe(rcpName);
		return recipeResult;
		
	}

	
}
