package com.smhrd.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.smhrd.entity.r_board;
import com.smhrd.entity.r_recipe;

@Repository
public interface r_recipeRepository extends JpaRepository<r_recipe, Integer> {

// 레시피 모체(페이지) 테이블
// 레시피 번호, 레시피이름, 레시피조리순서, 레시피 동영상url,  레시피난이도, 레시피 썸네일 1,2,3,4,5
	public List<r_recipe> findTop5ByOrderByRcpIdxAsc();
 	//public List<r_recipe> findRecordsBetweenRcpIdx(int startIdx, int endIdx);
	public List<r_recipe> findByRcpIdxBetweenOrderByRcpIdxAsc(int startIdx, int endIdx);
	public List<r_recipe> findTop10ByOrderByRcpIdxAsc();
	public List<r_recipe> findByRcpNameAndRcpContentAndRcpImg1AndRcpLevelAndRcpTime(
		        String rcpName, String rcpContent, String rcpImg1, String rcpLevel, String rcpTime);
	

	 
	@Query(value="SELECT * From r_recipe WHERE rcpName LIKE :search", nativeQuery = true)
	public List<r_recipe> findByRcpNameContaining(@Param("search")String search);
	
	
	public r_recipe findByRcpIdx(int rcpIdx);
	
	
	public r_recipe findByRcpName(String rcpName);

		
}


