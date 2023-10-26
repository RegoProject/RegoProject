package com.smhrd.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.smhrd.entity.r_recipe;

@Repository
public interface r_recipeRepository extends JpaRepository<r_recipe, String> {

// 레시피 모체(페이지) 테이블
// 레시피 번호, 레시피이름, 레시피조리순서, 레시피 동영상url,  레시피난이도, 레시피 썸네일 1,2,3,4,5


}


