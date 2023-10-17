package com.smhrd.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.smhrd.entity.MyrfrgrVO;

@Repository
public interface MyrfrgrRepository extends JpaRepository<MyrfrgrVO, String> {




}


