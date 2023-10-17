package com.smhrd.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.smhrd.entity.IngrdimgVO;

@Repository
public interface IngrdimgRepository extends JpaRepository<IngrdimgVO, String> {




}


