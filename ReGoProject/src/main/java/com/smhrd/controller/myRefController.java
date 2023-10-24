package com.smhrd.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.smhrd.entity.r_ingre_join_data;
import com.smhrd.entity.r_member;
import com.smhrd.entity.r_msg_join_data;
import com.smhrd.service.r_memberService;

@Controller
public class myRefController {
	r_ingre_join_data myIngre = new r_ingre_join_data();
	
	@Autowired
	r_memberService memService;
	
	
	@RequestMapping("/goMyIngreList")
	public String goIngreList(r_member member, HttpSession session, Model model) {
		member = (r_member) session.getAttribute("user");
		try {
			List<r_ingre_join_data> myIngre = memService.myIngredients(member.getCustId());
			
			if(myIngre != null ) {
				// ajax 응답 해주기?
				model.addAttribute("myIngre", myIngre);
			}else {
				// ajax 응답 해주기
				System.out.println("냉장고가 비어있습니다.");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "myref/ingreList";
	}
	
	@RequestMapping("/goMyMsgList")
	public String goMsgList(r_member member, HttpSession session, Model model) {
		member = (r_member) session.getAttribute("user");
		try {
			List<r_msg_join_data> myMsg = memService.myMsg(member.getCustId());
			
			if(myMsg != null ) {
				// ajax 응답 해주기?
				model.addAttribute("myMsg", myMsg);
			}else {
				// ajax 응답 해주기
				System.out.println("조미료가 비어있습니다.");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
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
	
	
	@RequestMapping("/searchMyIngre")
	public String searchIngre(r_member member,  String ingreName, HttpSession session, Model model) {
		
		member = (r_member) session.getAttribute("user");
		try {
			r_ingre_join_data searchMyIngre = memService.searchMyIngre(member.getCustId(), ingreName);
			
			if(searchMyIngre != null ) {
				// ajax 응답 해주기?
				
				if(searchMyIngre.getIngreAmount()==1) {
					// 재료가 있음
					
				}
				
				
			}else {
				// ajax 응답 해주기
				System.out.println("조미료가 비어있습니다.");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return "";
	}
	
	
	
	
}
