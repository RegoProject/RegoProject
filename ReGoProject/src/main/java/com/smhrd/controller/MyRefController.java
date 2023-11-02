package com.smhrd.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.smhrd.entity.r_ingre_join_data;
import com.smhrd.entity.r_member;
import com.smhrd.entity.r_msg_join_data;
import com.smhrd.entity.r_my_msg;
import com.smhrd.repository.r_my_msgRepository;
import com.smhrd.service.r_memberService;

@Controller
public class MyRefController {
	r_ingre_join_data myIngre = new r_ingre_join_data();
	
	@Autowired
	r_memberService memService;
	
	@Autowired
	private r_my_msgRepository myMsgRepo;
	
	
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
	
	
	// 컨트롤러에서 클라이언트로부터 JSON 형식으로 전송된 데이터를 받을 수 있는 방법은 다음과 같습니다.
	@RequestMapping(value = "/addMySelectedMsg", method = RequestMethod.POST)
	public String addMyMsg(@RequestBody List<r_my_msg> selectedMsgs, r_member member, HttpSession session) {
	    // 사용자 정보를 가져오는 코드 (session에서 또는 필요한 방식으로)
		  member = (r_member) session.getAttribute("user");

	    if (member == null) {
	        // 사용자 정보가 없으면 처리할 수 없음
	        return "redirect:/login"; // 또는 다른 적절한 처리
	    }

	    // 클라이언트로부터 전송된 조미료 정보를 반복 처리
	    for (r_my_msg selectedMsg : selectedMsgs) {
	        int msgIdx = selectedMsg.getMsgIdx();
	        int msgAmount = selectedMsg.getMsgAmount();

	        r_my_msg existingMsg = memService.selectMyMsg(member.getCustId(), msgIdx);

	        if (existingMsg != null) {
	            // 이미 존재하는 조미료인 경우
	            memService.updateMyMsg(member.getCustId(), msgIdx, msgAmount);
	        } else {
	            // 조미료가 DB에 없는 경우, 새로 추가
	            memService.insertMyMsg(member.getCustId(), msgIdx, msgAmount);
	        }
	    }

	    return "views/main";
	}

	
	


	    
	
	
	@RequestMapping("/addMyIngre")
	public String addMyIngre() {
		
		return "";
		
	}
	
	@RequestMapping("/selectMyAllMsg")
	@ResponseBody
	public List<r_my_msg> selectMyAllMsg(r_member member , HttpSession session) {
		member = (r_member) session.getAttribute("user");
		List<r_my_msg> result = myMsgRepo.findByCustId(member.getCustId());
		
		
		return result;
		
	}
	

	
	
}
