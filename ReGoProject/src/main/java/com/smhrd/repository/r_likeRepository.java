package com.smhrd.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.smhrd.entity.r_likes;

@Repository
public interface r_likeRepository extends JpaRepository<r_likes, Integer> {
	
	
	public List<r_likes> findByCustId(String custId);
	// void saveByCustIdAndRbIdx(String custId, int rbIdx);
	
	r_likes save(r_likes like);
	void deleteByCustIdAndRbIdx(String custId, int rbIdx);
	
	public List<r_likes> findAllByRbIdx(int rbIdx);
	
	@Query(value = "SELECT * FROM r_likes l JOIN (SELECT rbIdx FROM r_board ORDER BY createdAt DESC LIMIT 10 OFFSET :offset) b ON l.rbIdx = b.rbIdx WHERE l.custId = :custId", nativeQuery = true)
	public List<r_likes> findLikesByCustId(@Param("custId") String custId, @Param("offset") int offset);

}


