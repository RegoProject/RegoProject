package com.smhrd.controller;


import java.util.Base64;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.multipart.MultipartFile;

@RestController
@RequestMapping("/ingreAPI")
public class ingreAPIController {
	
	  @PostMapping
	  public ResponseEntity<String> ingreSendAPI(@RequestParam("file") MultipartFile file) {
		  System.out.println("들어옴?");
	    try {
	      // 파일을 Base64로 인코딩

	      String base64Data = Base64.getEncoder().encodeToString(file.getBytes());
	      
          // API 서버로 요청 보내기
	      
	      String apiUrl = "http://15.165.250.150:5000/ing_predict";
          String requestBody = "{\"image\": \"" + base64Data + "\"}";

          // API 서버로 POST 요청 보내기
          RestTemplate restTemplate = new RestTemplate();
          ResponseEntity<String> response = restTemplate.postForEntity(apiUrl, requestBody, String.class);
          // API 서버로부터 받은 응답을 반환

          return response;
          
	    } catch (Exception e) {
	      // 오류 발생 시 처리
	      return new ResponseEntity<>("Error", HttpStatus.INTERNAL_SERVER_ERROR);
	    }
	  }
	
	

}
