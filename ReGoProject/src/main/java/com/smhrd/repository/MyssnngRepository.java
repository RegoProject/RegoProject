package com.smhrd.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.smhrd.entity.MyssnngVO;

@Repository
public interface MyssnngRepository extends JpaRepository<MyssnngVO, String> {




}


