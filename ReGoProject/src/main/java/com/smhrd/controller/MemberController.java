package com.smhrd.controller;

import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.smhrd.entity.MemberVO;
import com.smhrd.repository.MemberRepository;

@Controller
public class MemberController {

	@Autowired
	private MemberRepository repo;
	MemberVO member = new MemberVO();
	// goMain 이라는 요청을 받으면 main.jsp
	
	@RequestMapping("/goMain")
	public String goMain() {
		
		
		return "views/main";
	}
	
	@RequestMapping("/goUpdate")
	public String goUpdate() {
		
		
		return "update";
	}
	

	@RequestMapping("/join")
	public String join(MemberVO member) {
		// 1. 수집
		
		// 2. 기능 정의 및 실행
		repo.save(member);
		
		// 3. View 선택
		
		return "redirect:/goMain";
		
	}
	

	@RequestMapping("/login")
	public String login(String email, String pw, HttpSession session) {
		// 1. 수집
		
		// 2. 기능 정의 및 실행
		member = repo.findByEmailAndPw(email, pw);
		System.out.println(member);
		if ( member != null) {
			session.setAttribute("user", member );
			System.out.println(email);
			
		}
		// 3. View 선택
		
		return "redirect:/goMain";
		
	}
	
	@RequestMapping("/update")
	public String update(MemberVO member ,HttpSession session ) {
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
