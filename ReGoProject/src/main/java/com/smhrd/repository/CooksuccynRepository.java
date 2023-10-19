package com.smhrd.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.smhrd.entity.r_cooking;

@Repository
public interface CooksuccynRepository extends JpaRepository<r_cooking, String> {




}


