package com.smhrd.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.smhrd.entity.RcppageVO;

@Repository
public interface RcpingrdRepository extends JpaRepository<RcppageVO, String> {




}


