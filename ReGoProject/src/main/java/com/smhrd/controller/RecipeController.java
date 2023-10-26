package com.smhrd.controller;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.smhrd.entity.r_member;
import com.smhrd.entity.r_recipe;
import com.smhrd.repository.MemberRepository;
import com.smhrd.repository.RcppageRepository;

@Controller
public class RecipeController {
	
	@Autowired
	private RcppageRepository repo;
	
	@RequestMapping("/goRecList")
	public String goList(Model model) {
		
		List<r_recipe> list=  repo.findAll();
		
		model.addAttribute("recipe",list);
		return "recipe/list";
	}
	
	@RequestMapping("/goRecForm")
	public String goForm() {
		// 레시피 수정폼이 필요한가 모르겠다
		// 관리자용으로 남겨놔야하나?
		
		return "recipe/form";
	}
	
	
	@RequestMapping("/goRecView")
	public String goView() {
		// 레시피 상세뷰
		
		
		return "recipe/form";
	}
	
	
	
	
}
