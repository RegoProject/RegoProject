package com.smhrd.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.smhrd.entity.r_cooking;
import com.smhrd.entity.r_follow;

@Repository
public interface r_cookingRepository extends JpaRepository<r_cooking, String> {
	
	public List<r_cooking> findByRcpIdxAndCustId(int rcpIdx, String custId);
	




}


