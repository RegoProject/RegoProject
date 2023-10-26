package com.smhrd.controller;

import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.smhrd.entity.r_member;
import com.smhrd.repository.r_memberrRepository;

@Controller
public class BoardController {

	@RequestMapping("/goBoardList")
	public String goList() {
		return "board/list";
	}
	
	@RequestMapping("/boardAddList")
	public String addList() {
		
		return "board/addList";
	}
	
	@RequestMapping("/goBoardForm")
	public String goForm() {
		
		return "board/form";
	}
	
	@RequestMapping("/goBoardView")
	public String goView() {
		
		return "board/view";
	}
	

	
	
}

