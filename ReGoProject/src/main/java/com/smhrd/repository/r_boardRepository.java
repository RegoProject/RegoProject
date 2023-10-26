package com.smhrd.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.smhrd.entity.r_board;

@Repository
public interface r_boardRepository extends JpaRepository<r_board, String> {

	public List<r_board> findFirst10ByCustIdOrderByCreatedAtDesc(String custId);
	
	//public List<r_board> findNext10ByCustIdOrderByCreatedAtDesc(String writer, int page);
	
}


