package com.smhrd.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.smhrd.entity.SsnngimgVO;

@Repository
public interface SsnngimgRepository extends JpaRepository<SsnngimgVO, String> {




}


