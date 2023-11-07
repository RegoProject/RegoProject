package com.smhrd.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.smhrd.entity.r_ingre_join_data;
import com.smhrd.entity.r_msg_join_data;
import com.smhrd.entity.r_my_ingredients;
import com.smhrd.entity.r_my_msg;

@Mapper
public interface r_memberMapper {

	// 나의 재료 + 재료 카테고리 조인 dao
	public List<r_ingre_join_data> myIngredients(String custId);

	// 나의 조미료 + 조미료 카테고리 조인 dao
	public List<r_msg_join_data> myMsg(String custId);
	
	// 재료 개별조회 dao
	public r_my_ingredients selectMyIngre(String custId, int ingreIdx);

	// 조미료 검색창 비동기 확인용 dao
	public List<r_ingre_join_data> searchMyIngreList(String custId,String ingreName);
	
	// 조미료 추가 dao
	public void insertMyMsg(String custId, Integer msgIdx ,Integer msgAmount);
	
	// 재료 추가 dao
	public void insertMyIngre(String custId, Integer ingreIdx ,Integer ingreAmount);
	

	// 조미료 개별조회 dao
	public r_my_msg selectMyMsg(String custId, int msgIdx);
	
	// 조미료 업데이트 dao 1->0
	public void updateMyMsgZero(String custId, Integer msgIdx );
	
	// 조미료 업데이트 dao 0->1
	public void updateMyMsg(String custId, Integer msgIdx, Integer msgAmount);
	
	// 재료 업데이트 dao 0->1
	public void updateMyIngre(String custId, Integer ingreIdx ,Integer ingreAmount);
	
	// 재료 업데이트 dao 1->0
	public void updateMyIngreZero(String custId, Integer ingreIdx );
	
		

	// 조미료 업데이트 dao 1->0
	public void updateAllMsgZero(String custId);
	
	
	
	
}
