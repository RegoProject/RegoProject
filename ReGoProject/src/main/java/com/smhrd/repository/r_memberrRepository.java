package com.smhrd.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.smhrd.entity.r_member;

@Repository
public interface r_memberrRepository extends JpaRepository<r_member, String> {
	// JPA의 DAO(Repository)는 interface로 구현
	// JpaRepository interface를 상속 받음
	// extends JpaRepository<Table 역할의 DTO , primary의 자료형 >
	
	// JPA : NO SQL
	// 기본적으로 사용자들이 많이 사용하는 기능들을 미리 정의해둔 interface를 상속 받아 사용
	// --> 우리가 코딩을 하지 않아도 기본적인 메소드들을 사용할 수 있다.
	
	// findAll() : select * from member;
	// findById(String id) : select * from member where email = #{email};
	// save(Member member) : insert , update 
	// Member.email이 DB에 존재한다면, update
	// 없다면 , insert
	
	
	// 로그인 : select * from member where email = #{email} and pw = #{pw}
	// 우리가 직접 메소드 만들기 가능
	
	// find(select) By(where) And(and) SQL문 처리 해줌!
	public r_member findByCustIdAndCustPw(String custId, String custPw);
	// 메소드의 이름을 기반으로 SQL문을 생성
	// 카멜 기법으로만 만들어야함
	// By절에 있는 컬럼의 이름이 잘 일치해야 한다.
	
	
	
	// 간단한 기능들을 빠르고 쉽게 만들수 있지만..
	// 서브쿼리나 조인할때.... 
	// @Query("SQL문") // 단점 한줄로 적어야한다. 가시성이 너무 떨어짐
	// public Member ~~();
	// 프로젝트의 SQL 조회 복잡도에 따라서 Mybatis , JPA 골라서 사용하자
	// @Query("update m set pw = m.pw , tel = m.tel , address = m.address where email = m.email ")
	// public Member update(Member member);
	
	// public Member updateByEmailSetPwTelAddress(String email, String pw, String address, String tel);

}


