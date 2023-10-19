package com.smhrd.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.smhrd.entity.r_comment;

@Repository
public interface ReplyRepository extends JpaRepository<r_comment, String> {




}


