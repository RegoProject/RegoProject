package com.smhrd.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.smhrd.entity.BoardVO;

@Repository
public interface BoardRepository extends JpaRepository<BoardVO, String> {




}


