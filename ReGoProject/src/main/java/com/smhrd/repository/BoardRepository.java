package com.smhrd.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.smhrd.entity.r_board;

@Repository
public interface BoardRepository extends JpaRepository<r_board, String> {




}


