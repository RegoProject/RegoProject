package com.smhrd.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.smhrd.entity.r_follow;

@Repository
public interface FollowRepository extends JpaRepository<r_follow, String> {




}


