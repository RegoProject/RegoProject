package com.smhrd.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.smhrd.entity.r_follow;

@Repository
public interface r_followRepository extends JpaRepository<r_follow, String> {
	
	public List<r_follow> findByFollowee(String followee);
	public List<r_follow> findByFollower(String follower);
	public void deleteByFollowerAndFollowee(String follower, String followee);
//	public void saveByFollowerAndFollowee(String follower, String followee);
	public List<r_follow> findByFollowerAndFollowee(String follower, String followee);
	




}


