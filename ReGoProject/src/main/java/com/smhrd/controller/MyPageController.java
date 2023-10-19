package com.smhrd.controller;

import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.smhrd.entity.MemberVO;
import com.smhrd.repository.MemberRepository;

@Controller
public class MyPageController {

	@Autowired
	private MemberRepository repo;
	MemberVO member = new MemberVO();
	
	@RequestMapping("/goMyList")
	public String goList() {
		
		
		return "mypage/list";
	}
	
	@RequestMapping("/goMyForm")
	public String goForm() {
		
		
		return "mypage/form";
	}
	
	@RequestMapping("/goMyView")
	public String goView() {
		// 내 게시글 상세보기
		
		return "mypage/view";
	}
	
	@RequestMapping("/goMyAddList")
	public String goAddList() {
		// 내 게시글 상세보기
		
		return "mypage/addList";
	}
	
}
