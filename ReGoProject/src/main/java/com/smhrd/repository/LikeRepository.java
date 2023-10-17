package com.smhrd.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.smhrd.entity.LikeVO;

@Repository
public interface LikeRepository extends JpaRepository<LikeVO, String> {




}


