package com.smhrd.controller;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.smhrd.entity.r_member;
import com.smhrd.repository.MemberRepository;

@Controller
public class MemberController {

	@Autowired
	private MemberRepository repo;
	r_member member = new r_member();
	
	// goMain 이라는 요청을 받으면 main.jsp
	@RequestMapping("/goMain")
	public String goMain() {
		
		
		return "views/main";
	}
	
	@RequestMapping("/goLogin")
	public String goLogin() {
		
		
		return "views/login";
	}
	
	@RequestMapping("/goUpdate")
	public String goUpdate() {
		
		
		return "update";
	}
	

	@RequestMapping("/goJoin")
	public String goJoin() {

		return "views/join";
		
	}
	
	
	@RequestMapping("/join")
	public String join(r_member member) {
		
		

		
		// 3. View 선택
		
		return "redirect:/goMain";
		
	}
	

	@RequestMapping("/login")
	public String login(String custId, String custPw, HttpSession session) {
		// 1. 수집
		
		// 2. 기능 정의 및 실행
		System.out.println("이거머임"+custId);
		member = repo.findByCustIdAndCustPw(custId, custPw);
		System.out.println(member);
		if ( member != null) {
			System.out.println(member);
			session.setAttribute("user", member );
			System.out.println(custId);
			
		}

		// 3. View 선택
		
		return "redirect:/goMain";
		
	}
	
	
	/* 비밀번호 찾기 */
	@RequestMapping("/goFindPw")
	public String goFind() {
		
		return "views/find";
	}
	
	@RequestMapping("/update")
	public String update(r_member member ,HttpSession session ) {
		// 1. 수집
		
		// 2. 기능 정의 및 실행
		member = repo.save(member);
		
		if ( member != null ) {
			session.setAttribute("user", member);
			
		}
		
		// 3. View 선택
		return "redirect:/goMain";
		
	}
	
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		
		session.removeAttribute("user");
		
		return "redirect:/goMain";
	}
	
	
	
	
}
