package com.smhrd.repository;


import java.util.List;

import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.smhrd.entity.r_board;
import com.smhrd.entity.r_likes;

@Repository
public interface r_boardRepository extends JpaRepository<r_board, String> {

	public List<r_board> findFirst10ByCustIdOrderByCreatedAtDesc(String custId);
	public List<r_board> findAllByOrderByCreatedAtDesc(Pageable pageable);
	//public List<r_board> findNext10ByCustIdOrderByCreatedAtDesc(String writer, int page);
	
	@Query(value = "SELECT * FROM r_board ORDER BY created_at DESC LIMIT :n", nativeQuery = true)
	public List<r_board> findTopNByCreatedAtDesc(@Param("n") int n);
	
	public List<r_board> findByCustId(String custId);
	
	@Query(value="SELECT * From r_board WHERE rbContent LIKE :search ORDER BY createdAt DESC", nativeQuery = true)
	public List<r_board> findByRbContentContainingOrderByCreatedAtDesc(@Param("search")String search);
	
	@Modifying
	@Query("DELETE FROM r_board b WHERE b.rbIdx = ?1 AND b.custId = ?2")
    public void deleteByRbIdxAndCustId(int rbIdx, String custId);
	
}


