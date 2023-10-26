package com.smhrd.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.smhrd.entity.r_ingre_join_data;
import com.smhrd.entity.r_ingredients;
import com.smhrd.entity.r_member;
import com.smhrd.service.r_ingredientsService;
import com.smhrd.service.r_memberService;

@RestController
public class SearchController {
	@Autowired
	r_ingredientsService ingreService;

	@Autowired
	r_memberService memService;

	List<r_ingredients> ingreList = null;

	@RequestMapping("/ingreSearch")
	public ResponseEntity<List<r_ingredients>> searchIngre(String ingreName, HttpSession session, Model model) {
		// System.out.println(ingreName);
		// System.out.println("오냐영");

		try {
			if (ingreName != null) {

				List<r_ingredients> ingreList = ingreService.ingreSearch(ingreName);

				if (ingreList != null) {
					System.out.println(ingreName);
					// ajax 응답 해주기 json형식으로
					return ResponseEntity.ok(ingreList);

				} else {
					// ajax 응답 해주기
					return ResponseEntity.noContent().build();
				}
			} else {
				return ResponseEntity.noContent().build();
			}

		} catch (Exception e) {
			e.printStackTrace();
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
		}

	}

	@RequestMapping("/searchMyIngre")
	public ResponseEntity<?> searchIngre(r_member member, String ingreName, HttpSession session, Model model) {
	    member = (r_member) session.getAttribute("user");
	    try {
	        if (ingreName != null) {
	            if (memService.searchMyIngre(member.getCustId(), ingreName) != null) {
	                List<r_ingre_join_data> searchMyIngre = memService.searchMyIngre(member.getCustId(), ingreName);

	                if (searchMyIngre != null && !searchMyIngre.isEmpty()) {
	                    Map<String, String> responseMap = new HashMap<>();
	                    for (r_ingre_join_data ingredient : searchMyIngre) {
	                        if (ingredient.getIngreAmount() == 1) {
	                            responseMap.put(ingredient.getIngreName(), "1");
	                        } else {
	                            responseMap.put(ingredient.getIngreName(), "0");
	                        }
	                    }
	                    responseMap.put("type", "searchMyIngre"); // 응답 유형 추가
	                    return ResponseEntity.ok(responseMap);
	                }
	            }

	            List<r_ingredients> ingreList = ingreService.ingreSearch(ingreName);

	            if (ingreList != null) {
	                Map<String, Object> responseMap = new HashMap<>();
	                responseMap.put("type", "searchIngre"); // 응답 유형 추가
	                responseMap.put("data", ingreList); // 데이터 추가
	                return ResponseEntity.ok(responseMap);
	            }
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
	}



}
