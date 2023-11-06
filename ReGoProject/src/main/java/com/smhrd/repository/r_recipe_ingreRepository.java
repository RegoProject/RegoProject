package com.smhrd.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.smhrd.entity.r_recipe;
import com.smhrd.entity.r_recipe_ingredients;

@Repository
public interface r_recipe_ingreRepository extends JpaRepository<r_recipe_ingredients, String> {

// 레시피 재료 테이블
	


}


