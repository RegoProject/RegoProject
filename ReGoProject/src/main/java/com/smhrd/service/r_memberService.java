package com.smhrd.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.smhrd.entity.r_ingre_join_data;
import com.smhrd.entity.r_msg_join_data;
import com.smhrd.mapper.r_memberMapper;

@Service
@Transactional
public class r_memberService {
	
	@Autowired
	private r_memberMapper memMapper;
	
	public r_memberService(r_memberMapper memMapper) {
		this.memMapper = memMapper;
	}
	
	// 재료 조인 dao
	public List<r_ingre_join_data> myIngredients(String custId){
		List<r_ingre_join_data> memIngreList = memMapper.myIngredients(custId);
		
		return memIngreList;
	}
	
	// 재료 조인 dao
	public List<r_msg_join_data> myMsg(String custId){
		List<r_msg_join_data> memMsgList = memMapper.myMsg(custId);
		
		return memMsgList;
	}
	

}
