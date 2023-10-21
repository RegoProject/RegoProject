package com.smhrd.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.smhrd.entity.r_ingre_join_data;
import com.smhrd.mapper.r_memberMapper;

@Service
@Transactional
public class r_memberService {
	
	@Autowired
	private r_memberMapper memMapper;
	
	public r_memberService(r_memberMapper memMapper) {
		this.memMapper = memMapper;
	}
	
	public List<r_ingre_join_data> myIngredients(String custId){
		System.out.println("여기까지안온다");
		List<r_ingre_join_data> memIngreList = memMapper.myIngredients(custId);
		System.out.println(memIngreList);
		
		return memIngreList;
		
	}
	
	

}
