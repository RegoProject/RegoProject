package com.smhrd.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.smhrd.entity.r_ingredients;
import com.smhrd.entity.r_msg;

@Repository
public interface r_msgRepository extends JpaRepository<r_msg, String> {


	public r_msg findByMsgName(String msgName);

}


