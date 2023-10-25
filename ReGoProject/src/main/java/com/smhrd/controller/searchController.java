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
public class searchController {
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
	public ResponseEntity<Map<String, String>> searchIngre(r_member member, String ingreName, HttpSession session, Model model) {
		System.out.println("들어오는지 확인");
		member = (r_member) session.getAttribute("user");
		Map<String, String> responseMap = new HashMap<>();
		try {
			if (ingreName != null) {
				System.out.println("들어오는지 확인 이프문안");
				List<r_ingre_join_data> searchMyIngre = memService.searchMyIngre(member.getCustId(), ingreName);

				  if (searchMyIngre != null && !searchMyIngre.isEmpty()) {
		                for (r_ingre_join_data ingredient : searchMyIngre) {
		                    if (ingredient.getIngreAmount() == 1) {
		                        responseMap.put(ingredient.getIngreName(), "1");
		                    } else {
		                        responseMap.put(ingredient.getIngreName(), "0");
		                    }
		                }

		                return ResponseEntity.ok(responseMap);
		                
				} else {
					// ajax 응답 해주기
	                responseMap.put("message", "검색 결과가 없습니다.");
	                return ResponseEntity.ok(responseMap);
				}
			} else {

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
	}

}
