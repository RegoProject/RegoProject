package com.smhrd.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.smhrd.entity.r_ingre_join_data;
import com.smhrd.entity.r_member;
import com.smhrd.entity.r_msg_join_data;
import com.smhrd.entity.r_my_msg;
import com.smhrd.service.r_memberService;

@Controller
public class MyRefController {
	r_ingre_join_data myIngre = new r_ingre_join_data();
	
	@Autowired
	r_memberService memService;
	
	
	@RequestMapping("/goMyIngreList")
	public String goIngreList(r_member member, HttpSession session, Model model) {
		member = (r_member) session.getAttribute("user");
		try {
			List<r_ingre_join_data> myIngre = memService.myIngredients(member.getCustId());
			  if (myIngre != null) {
		            List<r_ingre_join_data> filteredIngre = new ArrayList<>();

		            for (r_ingre_join_data ingreData : myIngre) {
		                if (ingreData.getIngreAmount() == 1) {
		                    filteredIngre.add(ingreData);
		                }
		            }

		            model.addAttribute("myIngre", filteredIngre);
		        } else {
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
				 List<r_msg_join_data> filteredMsg = new ArrayList<>();
				 
				 for (r_msg_join_data msgData : myMsg) {
		                if (msgData.getMsgAmount() == 1) {
		                    filteredMsg.add(msgData);
		                }
		            }
				 
				model.addAttribute("myMsg", filteredMsg);
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
	
	
	// 카테고리 내에서 여러개 추가하는용
	@RequestMapping("/addMySelectedMsg")
	public String addMyMsg(r_member member, HttpSession session, @RequestParam("msgIdx") List<Integer> msgIdxList) {
	    System.out.println(msgIdxList);
	    member = (r_member) session.getAttribute("user");
	    
	    // 1행 인서트 되는건 확인하고 다중 추가용 만드는중
	    // 다중행 추가되는거 확인함
	    // 기존 보유조미료 있을때 어떻게 처리되는지 해봐야함
	    
	    for (Integer msgIdx : msgIdxList) {
        // r_my_msg 테이블에서 해당 사용자와 msgIdx로 조회
        r_my_msg existingMsg = memService.selectMyMsg(member.getCustId(), msgIdx);

        if (existingMsg != null) {
            // 이미존재하면 업데이트 처리 -> 이거 무조건 오류남 사전 쿼리 확인하고 값 어떻게 들어갈지 생각해서 고칠것
            memService.updateMyMsg(existingMsg);
        } else {
            
            memService.insertMyMsg(member.getCustId(), msgIdx);
        }
    }
	    return "views/main";
	    
	    
	    
	  

	    
	    
	    
	}
	
	
	@RequestMapping("/addMyIngre")
	public String addMyIngre() {
		
		return "";
		
	}
	
	
	
	
	
}
