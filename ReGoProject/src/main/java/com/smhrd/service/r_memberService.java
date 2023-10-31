package com.smhrd.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.smhrd.entity.r_ingre_join_data;
import com.smhrd.entity.r_msg_join_data;
import com.smhrd.entity.r_my_msg;
import com.smhrd.mapper.r_memberMapper;

@Service
@Transactional
public class r_memberService {
	
	@Autowired
	private r_memberMapper memMapper;
	
	public r_memberService(r_memberMapper memMapper) {
		this.memMapper = memMapper;
	}
	
	// 사용자 전체 보유재료 조인 dao
	public List<r_ingre_join_data> myIngredients(String custId){
		List<r_ingre_join_data> memIngreList = memMapper.myIngredients(custId);
		
		return memIngreList;
	}
	
	// 사용자 전체 보유조미료 조인 dao
	public List<r_msg_join_data> myMsg(String custId){
		List<r_msg_join_data> memMsgList = memMapper.myMsg(custId);
		
		return memMsgList;
	}
	
	// 재료검색창 조회 dao
	public List<r_ingre_join_data> searchMyIngre(String custId, String ingreName){
		List<r_ingre_join_data> searchMyIngre = memMapper.searchMyIngre(custId,ingreName);
		
		return searchMyIngre;
	}
	
	// 조미료 개별 조회 dao
	public r_my_msg selectMyMsg(String custId, int msgIdx){
		r_my_msg result = memMapper.selectMyMsg(custId,msgIdx);
		
		return result;

	}
	// 조미료 추가 dao
	public void insertMyMsg(String custId, Integer msgIdx){
		memMapper.insertMyMsg(custId,msgIdx);

	}

	// 조미료 업데이트 dao
	public void updateMyMsg(r_my_msg existingMsg) {
		
		
	}
	

	
}
