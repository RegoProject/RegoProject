package com.smhrd.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.smhrd.entity.r_ingre_join_data;
import com.smhrd.entity.r_ingredients;
import com.smhrd.entity.r_member;
import com.smhrd.entity.r_msg;
import com.smhrd.entity.r_msg_join_data;
import com.smhrd.entity.r_my_ingredients;
import com.smhrd.entity.r_my_msg;
import com.smhrd.mapper.r_msgMapper;
import com.smhrd.repository.r_ingreRepository;
import com.smhrd.repository.r_my_ingreRepository;
import com.smhrd.repository.r_my_msgRepository;
import com.smhrd.service.r_ingredientsService;
import com.smhrd.service.r_memberService;

@Controller
public class MyRefController {
	r_ingre_join_data myIngre = new r_ingre_join_data();
	
	@Autowired
	r_memberService memService;
	
	@Autowired
	r_ingredientsService ingreService;
	
	@Autowired
	r_msgMapper msgMapper;
	
	@Autowired
	private r_my_msgRepository myMsgRepo;
	
	@Autowired
	private r_my_ingreRepository myIngreRepo;
	
	@Autowired
	private r_ingreRepository ingreRepo;
	

	

	
	
	@RequestMapping("/goMyIngreList")
	public String goIngreList(r_member member, HttpSession session, Model model) {
		member = (r_member) session.getAttribute("user");
		  if (member == null) {
		        // 세션이 종료되었거나 사용자가 로그인하지 않았을 때 로그인 페이지로 리다이렉트
		        return "redirect:/goLogin";
		    }
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
		  if (member == null) {
		        // 세션이 종료되었거나 사용자가 로그인하지 않았을 때 로그인 페이지로 리다이렉트
		        return "redirect:/goLogin";
		    }
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
	        return "redirect:/goLogin"; // 또는 다른 적절한 처리
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
	public String addMyIngre(@RequestBody List<String> ingreList, r_member member, HttpSession session) {
		
		System.out.println(ingreList);
	    // 사용자 정보를 가져오는 코드 (session에서 또는 필요한 방식으로)
		  member = (r_member) session.getAttribute("user");

		  if (member == null) {
		        // 사용자 정보가 없으면 처리할 수 없음
		        return "redirect:/goLogin"; // 또는 다른 적절한 처리
		    }
		  
		    for (String ingreName : ingreList) {
		    	// 재료카테고리에서 재료 인덱스번호 찾는용
		        r_ingredients findIngre = ingreService.ingreExistSearch(ingreName);
		        
		        // 있는지 조회
		        r_my_ingredients existingIngre = memService.selectMyIngre(member.getCustId(), findIngre.getIngreIdx());
		            	
			    int ingreIdx = findIngre.getIngreIdx();
			    
		        

		        if (existingIngre != null) {
		            // 행이 이미 존재하는 재료인 경우
		            memService.updateMyIngre(member.getCustId(), ingreIdx, 1);
		        } else {
		            // 재료가 DB에 없는 경우, 새로 추가
		            memService.insertMyIngre(member.getCustId(), ingreIdx, 1);
		        }
		        
		       
		    }
		    return "views/main";
		   } 
	  

	    

	
	
	@RequestMapping("/selectMyAllMsg")
	@ResponseBody
	public List<r_my_msg> selectMyAllMsg(r_member member , HttpSession session) {
		member = (r_member) session.getAttribute("user");
		
		List<r_my_msg> result = myMsgRepo.findByCustId(member.getCustId());
		
		
		return result;
		
	}
	
	@RequestMapping("/saveInputValues")
	@ResponseBody
	public Map<String, Object> saveInputValues(@RequestBody List<String> inputData, HttpSession session, r_member member) throws JsonMappingException, JsonProcessingException {
	    member = (r_member) session.getAttribute("user");
	    List<String> failedIngredients = new ArrayList<>();
	    List<String> successfulIngredients = new ArrayList<>(); // 성공한 재료 목록을 따로 저장
	    Set<String> uniqueInputData = new HashSet<>(inputData);
	    
	    // 식재료 카테고리에 존재하는 식재료명인지 사전 검사 
	    for (String ingreName : uniqueInputData) {
	        r_ingredients ingre = ingreService.ingreExistSearch(ingreName);
	        
	        if (ingre != null) {
	        	// 사전검사 완료된 목록에 저장
	            successfulIngredients.add(ingreName); 

	            // 중복 체크
	            r_my_ingredients myIngredient = myIngreRepo.findByCustIdAndIngreIdx(member.getCustId(), ingre.getIngreIdx());
	            
	            // 내 재료 목록에 행이 존재하면 ingreAmount 0-> 1처리 
	            if (myIngredient != null && myIngredient.getRmrNum() != 0) {
	                myIngredient.setIngreAmount(1);
	                myIngreRepo.save(myIngredient);
	            } else {
	                // 내 재료 목록에 행이 존재하지 않는다면 새로운 행으로 저장
	                myIngredient = new r_my_ingredients();
	                myIngredient.setCustId(member.getCustId());
	                myIngredient.setIngreIdx(ingre.getIngreIdx());
	                myIngredient.setIngreAmount(1);
	                myIngreRepo.save(myIngredient);
	            }
	            
	        } else {
	            // 식재료 카테고리에서 조회가 되지 않는 재료를 추가하지 못하는 식재료(실패) 목록에 추가
	            failedIngredients.add(ingreName);
	        }
	    }
	    Map<String, Object> response = new HashMap<>();
	    response.put("message", "값들이 저장되었습니다.");
	    response.put("successfulIngredients", successfulIngredients);
	    response.put("failedIngredients", failedIngredients);

	    return response;
	}
	
	
	@RequestMapping("/searchMyRef")
	@ResponseBody
	public Map<String, Object> searchMyRef(HttpSession session, r_member member, Model model) {
		member = (r_member) session.getAttribute("user");
		
		
		List<r_my_ingredients> ingreList = myIngreRepo.findByCustId(member.getCustId());
		List<r_my_msg> msgList = myMsgRepo.findByCustId(member.getCustId());
		
		
		// model에 각각 담아주고싶어 "ingre" , ingreList / "msg" , msgList
		
	    Map<String, Object> responseData = new HashMap<>();
	    responseData.put("ingre", ingreList);
	    responseData.put("msg", msgList);
		
		
		return responseData;
	}
	
	@RequestMapping(value = "/deleteIngreList", method = RequestMethod.POST)
	public void deleteIngredients(@RequestBody List<String> ingreList, HttpSession session , r_member member, HttpServletResponse response) throws IOException {
		System.out.println("들옴?");
	    member = (r_member) session.getAttribute("user");
	    System.out.println("들옴?");
	    System.out.println(ingreList);

	    r_ingredients ingre; 
	    try {
	        // ingredients 목록을 사용하여 삭제 작업을 수행합니다.
	        for (String ingredient : ingreList) {
	            ingre = ingreService.ingreExistSearch(ingredient);
	            memService.updateMyIngreZero(member.getCustId(), ingre.getIngreIdx());
	            // 재료 삭제 또는 다른 작업을 수행하는 코드를 작성하세요.
	            // 예: ingredient를 기반으로 데이터베이스에서 해당 재료를 삭제
	        }

			response.setContentType("text/plain; charset=UTF-8");
			response.getWriter().write("success");
	      
	        
	    } catch (Exception e) {
	        e.printStackTrace();
	        // 오류 발생 시 "error"를 반환
			response.setContentType("text/plain; charset=UTF-8");
			response.getWriter().write("error");
	       
	    }
	}
	
	

	@RequestMapping(value = "/deleteMsgList", method = RequestMethod.POST)
	public void deleteMsgList(@RequestBody List<String> msgList, HttpSession session , r_member member, HttpServletResponse response) throws IOException {
		System.out.println("들옴?");
	    member = (r_member) session.getAttribute("user");
	    System.out.println("들옴?");
	    System.out.println(msgList);

	    r_msg msgs; 
	    try {
	        // ingredients 목록을 사용하여 삭제 작업을 수행합니다.
	        for (String msg : msgList) {
	            msgs = msgMapper.msgExistSearch(msg);
	            memService.updateMyMsgZero(member.getCustId(), msgs.getMsgIdx());
	            // 재료 삭제 또는 다른 작업을 수행하는 코드를 작성하세요.
	            // 예: ingredient를 기반으로 데이터베이스에서 해당 재료를 삭제
	        }

			response.setContentType("text/plain; charset=UTF-8");
			response.getWriter().write("success");
	      
	        
	    } catch (Exception e) {
	        e.printStackTrace();
	        // 오류 발생 시 "error"를 반환
			response.setContentType("text/plain; charset=UTF-8");
			response.getWriter().write("error");
	       
	    }
	}


}
