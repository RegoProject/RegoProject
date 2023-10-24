package com.smhrd.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.smhrd.entity.r_ingredients;
import com.smhrd.mapper.r_ingredientsMapper;

@Service
@Transactional
public class r_ingredientsService {
	
	@Autowired
	private r_ingredientsMapper ingreMapper;
	
	public r_ingredientsService(r_ingredientsMapper ingreMapper) {
		this.ingreMapper = ingreMapper;
	}
	

	// 재료 검색창 (재료카테고리에 사용자가 입력하는 재료가 있는지 없는지 확인하는 용도)
	public List<r_ingredients> ingreSearch(String ingreName){
		List<r_ingredients> ingreSearchList = ingreMapper.ingreSearch(ingreName);
		
		return ingreSearchList;
	}
	
	
}
