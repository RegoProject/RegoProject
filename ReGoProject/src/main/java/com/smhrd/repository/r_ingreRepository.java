package com.smhrd.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.smhrd.entity.r_ingredients;


@Repository
public interface r_ingreRepository extends JpaRepository<r_ingredients, String> {

	public Optional<r_ingredients> findByIngreName(String ingreName);


}


