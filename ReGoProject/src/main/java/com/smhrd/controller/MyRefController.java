package com.smhrd.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.smhrd.entity.r_ingre_join_data;
import com.smhrd.entity.r_member;
import com.smhrd.service.r_memberService;

@Controller
public class MyRefController {
	r_ingre_join_data myIngre = new r_ingre_join_data();
	
	@Autowired
	r_memberService memService;
	
	
	@RequestMapping("/goMyIngreList")
	public String goIngreList( r_member member, HttpSession session, Model model) {
		member = (r_member) session.getAttribute("user");
		System.out.println(member.getCustId());
		
		try {
			System.out.println("여기는 오나요");
			List<r_ingre_join_data> myIngre = memService.myIngredients(member.getCustId());
			model.addAllAttributes(myIngre);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
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
