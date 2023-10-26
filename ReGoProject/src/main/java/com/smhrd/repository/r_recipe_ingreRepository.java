package com.smhrd.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.smhrd.entity.r_recipe;

@Repository
public interface r_recipe_ingreRepository extends JpaRepository<r_recipe, String> {

// 레시피 재료 테이블
	


}


