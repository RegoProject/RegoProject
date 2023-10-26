package com.smhrd.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.smhrd.entity.r_msg;

@Repository
public interface r_recipe_msgRepository extends JpaRepository<r_msg, String> {




}


