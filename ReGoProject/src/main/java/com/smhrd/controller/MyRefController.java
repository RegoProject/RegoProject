package com.smhrd.controller;

import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.smhrd.entity.r_member;
import com.smhrd.repository.MemberRepository;

@Controller
public class MyRefController {

	@RequestMapping("/goIngreList")
	public String goIngreList() {
		
		
		return "myref/ingreList";
	}
	
	@RequestMapping("/goMsgList")
	public String goMsgList() {
		
		
		return "myref/msgList";
	}
	
	@RequestMapping("/goMyRefForm")
	public String goForm() {
		// 마이냉장고에 폼이 필요한가? 나는 잘 모르겠음 모달창으로 할거면... 흠
		
		
		return "myref/form";
	}
	
	@RequestMapping("/goMyRefView")
	public String goView() {
		// 마이 냉장고의 상세보기? 필요한지 잘모르겠는데 일단 만들어놈
		
		
		return "myref/view";
	}
	
	
	
	
	
}
