package com.smhrd.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.smhrd.entity.ReplyVO;

@Repository
public interface ReplyRepository extends JpaRepository<ReplyVO, String> {




}


