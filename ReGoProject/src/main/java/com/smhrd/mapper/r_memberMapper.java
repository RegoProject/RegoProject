package com.smhrd.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.smhrd.entity.r_ingre_join_data;
import com.smhrd.entity.r_msg_join_data;
import com.smhrd.entity.r_my_msg;

@Mapper
public interface r_memberMapper {

	// 나의 재료 + 재료 카테고리 조인 dao
	public List<r_ingre_join_data> myIngredients(String custId);

	// 나의 조미료 + 조미료 카테고리 조인 dao
	public List<r_msg_join_data> myMsg(String custId);

	// 조미료 검색창 비동기 확인용 dao
	public List<r_ingre_join_data> searchMyIngre(String custId,String ingreName);
	
	// 조미료 추가 dao
	public void insertMyMsg(String custId, Integer msgIdx);

	// 조미료 개별조회 dao
	public r_my_msg selectMyMsg(String custId, int msgIdx);
	
	// 조미료 업데이트 dao
	public void updateMyMsg(r_my_msg existingMsg);
	

	
	
}
