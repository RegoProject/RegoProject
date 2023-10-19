package com.smhrd.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.smhrd.entity.r_recipe_msg;

@Repository
public interface FdingtgryRepository extends JpaRepository<r_recipe_msg, String> {




}


