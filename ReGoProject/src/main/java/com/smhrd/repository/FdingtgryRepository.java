package com.smhrd.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.smhrd.entity.FdingtgryVO;

@Repository
public interface FdingtgryRepository extends JpaRepository<FdingtgryVO, String> {




}


