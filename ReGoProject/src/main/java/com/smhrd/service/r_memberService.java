package com.smhrd.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.smhrd.entity.r_ingre_join_data;
import com.smhrd.entity.r_msg_join_data;
import com.smhrd.entity.r_my_ingredients;
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
	public List<r_ingre_join_data> searchMyIngreList(String custId, String ingreName){
		List<r_ingre_join_data> searchMyIngre = memMapper.searchMyIngreList(custId,ingreName);
		
		return searchMyIngre;
	}
	// 재료 개별 조회 dao
	public r_my_ingredients selectMyIngre(String custId, int ingreIdx){
		r_my_ingredients result = memMapper.selectMyIngre(custId,ingreIdx);
		
		return result;

	}
	// 조미료 개별 조회 dao
	public r_my_msg selectMyMsg(String custId, int msgIdx){
		r_my_msg result = memMapper.selectMyMsg(custId,msgIdx);
		
		return result;

	}
	// 조미료 추가 dao
	public void insertMyMsg(String custId, Integer msgIdx , Integer msgAmount){
		memMapper.insertMyMsg(custId,msgIdx,msgAmount);

	}
	
	// 재료 추가 dao
	public void insertMyIngre(String custId, Integer ingreIdx, Integer ingreAmount){
		memMapper.insertMyIngre(custId,ingreIdx,ingreAmount);

	}

	// 조미료 업데이트 dao 1->0
	public void updateMyMsgZero(String custId, Integer msgIdx) {
		memMapper.updateMyMsgZero(custId,msgIdx);
		
	}
	
	// 재료 업데이트 dao 1->0
	public void updateMyIngreZero(String custId, Integer ingreIdx) {
			memMapper.updateMyIngreZero(custId,ingreIdx);
			
	}
	
	// 조미료 업데이트 dao 0->1
	public void updateMyMsg(String custId, Integer msgIdx, Integer msgAmount) {
		memMapper.updateMyMsg(custId,msgIdx,msgAmount);
		
	}
	// 재료 업데이트 dao 0->1
	public void updateMyIngre(String custId, Integer ingreIdx, Integer ingreAmount) {
		memMapper.updateMyIngre(custId,ingreIdx,ingreAmount);
			
	}
	
	public void updateAllMsgZero(String custId) {
		memMapper.updateAllMsgZero(custId);
		
	}
	
	

	
}
