package com.smhrd.controller;

import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

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
		// 1. 수집
		
		// 2. 기능 정의 및 실행
		repo.save(member);
		
		// 3. View 선택
		
		return "redirect:/goLogin";
		
	}
	

	@RequestMapping("/login")
	public String login(String custId, String custPw, HttpSession session) {
		
		member = repo.findByCustIdAndCustPw(custId, custPw);
		if ( member != null) {
			session.setAttribute("user", member );
		}

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
