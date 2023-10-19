package com.smhrd.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.smhrd.entity.r_recipe;

@Repository
public interface RcppageRepository extends JpaRepository<r_recipe, String> {




}


