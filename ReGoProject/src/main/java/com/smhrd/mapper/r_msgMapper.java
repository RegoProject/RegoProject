package com.smhrd.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.smhrd.entity.r_msg;

@Mapper
public interface r_msgMapper {

	
	public r_msg msgExistSearch(String msgName);
}
