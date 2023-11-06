package com.smhrd.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.smhrd.entity.r_comment;

@Repository
public interface r_commentRepository extends JpaRepository<r_comment, String> {

	public List<r_comment> findByRbIdx(int rbIdx);
	
	public void deleteByCustIdAndRmtIdx(String custId, int rmtIdx);
	
	
	 @Modifying
	    @Query("UPDATE r_comment c SET c.rmtContent = :rmtComment WHERE c.custId = :custId AND c.rmtIdx = :rmtIdx")
	    void updateComment(@Param("custId") String custId, @Param("rmtIdx") int rmtIdx, @Param("rmtComment") String rmtComment);


}


