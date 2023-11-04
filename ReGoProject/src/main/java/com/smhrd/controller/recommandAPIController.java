package com.smhrd.controller;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.client.RestTemplate;

import com.smhrd.entity.r_my_ingredients;
import com.smhrd.entity.r_my_msg;

@Component
@Controller
public class recommandAPIController {
	
	
	public ResponseEntity<String> recommendAPI(List<r_my_ingredients> ingreList, List<r_my_msg> msgList) {
	    try {
	    	System.out.println("오니");
	        // 필요한 데이터 추출 및 구성
	        List<Integer> ingreIdxList = new ArrayList<>();
	        List<Integer> msgIdxList = new ArrayList<>();

	        for (r_my_ingredients ingre : ingreList) {
	            ingreIdxList.add(ingre.getIngreIdx());
	        }

	        for (r_my_msg msg : msgList) {
	            msgIdxList.add(msg.getMsgIdx());
	        }

	        List<Integer> userIngredients = new ArrayList<>();
	        userIngredients.addAll(ingreIdxList);
	        userIngredients.addAll(msgIdxList);

	        // API 서버에 요청할 URL
	        String apiUrl = "http://15.165.250.150:5000/recommend";
	        
	     // 요청 바디를 JSON 형식으로 구성
	        Map<String, Object> requestBody = new HashMap<>();
	        requestBody.put("user_ing", userIngredients);


	        // API 서버로 POST 요청 보내기
	        RestTemplate restTemplate = new RestTemplate();
	        HttpHeaders headers = new HttpHeaders();
	        headers.setContentType(MediaType.APPLICATION_JSON);
	        HttpEntity<Map<String, Object>> requestEntity = new HttpEntity<>(requestBody, headers);
	        ResponseEntity<String> response = restTemplate.exchange(apiUrl, HttpMethod.POST, requestEntity, String.class);

	        return ResponseEntity.ok(response.getBody());
	    } catch (Exception e) {
	        // 오류 처리
	        return ResponseEntity.status(500).body("Error: " + e.getMessage());
	    }
	}

}
