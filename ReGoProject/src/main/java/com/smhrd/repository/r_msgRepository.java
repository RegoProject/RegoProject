package com.smhrd.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.smhrd.entity.r_ingredients;

@Repository
public interface r_msgRepository extends JpaRepository<r_ingredients, String> {




}


