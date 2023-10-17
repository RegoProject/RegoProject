package com.smhrd.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.smhrd.entity.CooksuccynVO;

@Repository
public interface CooksuccynRepository extends JpaRepository<CooksuccynVO, String> {




}


