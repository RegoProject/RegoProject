package com.smhrd.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.smhrd.entity.FollowVO;

@Repository
public interface FollowRepository extends JpaRepository<FollowVO, String> {




}


