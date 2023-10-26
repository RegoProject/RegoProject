package com.smhrd.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.smhrd.entity.r_likes;

@Repository
public interface r_likeRepository extends JpaRepository<r_likes, String> {




}


