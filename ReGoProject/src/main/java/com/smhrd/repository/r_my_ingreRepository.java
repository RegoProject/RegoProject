package com.smhrd.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.smhrd.entity.r_my_ingredients;

@Repository
public interface r_my_ingreRepository extends JpaRepository<r_my_ingredients, String> {

	public r_my_ingredients findByCustIdAndIngreIdx(String custId, int ingreIdx);


}


