package com.smhrd.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.smhrd.entity.r_ingredients;
import com.smhrd.service.r_ingredientsService;


@RestController
public class searchController {
	@Autowired
	r_ingredientsService ingreService;
	
	
	List<r_ingredients> ingreList = null;
	
	
	@RequestMapping("/ingreSearch")
	public ResponseEntity<List<r_ingredients>> searchIngre(@RequestParam("ingreName") String ingreName, HttpSession session, Model model) {
		System.out.println(ingreName);
		System.out.println("오냐영");
		
		try {
			if(ingreName != null) {
				
				List<r_ingredients> ingreList = ingreService.ingreSearch(ingreName);
				
				if(ingreList != null ) {
					System.out.println(ingreName);
					// ajax 응답 해주기 json형식으로
					

					 return ResponseEntity.ok(ingreList);
					
				}else {
					// ajax 응답 해주기
					return ResponseEntity.noContent().build();
					
				}
			}else {
				return null;
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
			  return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
		}
		
		

	}
	

}
