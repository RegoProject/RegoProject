package com.smhrd.controller;


import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.apache.tomcat.util.codec.binary.Base64;
import org.apache.tomcat.util.http.fileupload.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.smhrd.entity.r_member;

import com.smhrd.entity.r_recipe;
import com.smhrd.repository.r_recipeRepository;



@Controller
public class RecipeController {
	
	@Autowired
	private r_recipeRepository repo;
	
	@RequestMapping("/goRecList")
	public String goList(Model model) {
		//List<r_recipe> list = repo.findAll();
		List<r_recipe> list=  repo.findTop10ByOrderByRcpIdxAsc();
		
		
		model.addAttribute("recipe",list);
		return "recipe/list";
	}
	
	@RequestMapping("/goRecForm")
	public String goForm() {
		// 레시피 수정폼이 필요한가 모르겠다
		// 관리자용으로 남겨놔야하나?
		
		return "recipe/form";
	}
	
	
	@RequestMapping("/goRecView")
	public String goView() {
		// 레시피 상세뷰
		
		
		return "recipe/view";
	}
	
	@RequestMapping("/goRecommendList")
	public String goRecommendList(r_member member, Model model) {
	
		
		
	//	model.addAttribute("recipeRecommed",recRecommendlist);
		return "recipe/recommendList";
	}
	
	// 래정오빠 레시피 전체목록 페이지는 사진 사이즈때문에 스크롤이 적용이 안되는것같아서 한 페이지당 호출하는 개수를 늘려야될것같아요 10개정도로
	// 커뮤니티는 한 게시글이 차지하는 화면 비율이 커서 로드하자마자 기능실행이 돼서 스크롤이 정상작동 합니다.
	@RequestMapping("/loadMoreData")
	public void loadMoreRcp(@RequestParam("page") int page, HttpServletResponse response ) {
		System.out.println(page);
		int start = page*10-9;
		System.out.println(start);
		int end=page*10;
		List<r_recipe> list= repo.findByRcpIdxBetweenOrderByRcpIdxAsc(start, end);
		System.out.println(list.size());
		ObjectMapper mapper = new ObjectMapper();
		String json;
        try {        	
        		
        	
            json = mapper.writeValueAsString(list);
            response.setContentType("application/json;charset=UTF-8");
            response.getWriter().write(json);
            
        } catch (Exception e) {
            e.printStackTrace();
        }
		
	}
	@RequestMapping("/recSuccess")
	public void recSuccess(@RequestParam("file") MultipartFile file ) {
		Map<String, Object> map = new HashMap<>();
		RestTemplate restTemplate  = new RestTemplate();
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.APPLICATION_JSON);
		try {
			byte[] fileBytes = file.getBytes();	        
		    byte[] encodedBytes = Base64.encodeBase64(fileBytes);
		    String encodedFile = new String(encodedBytes);
		    String recipe = "김치볶음밥";
			map.put("label", recipe );
			map.put("image", encodedFile);
			
			HttpEntity<Map<String,Object>> requestEntity = new HttpEntity<>(map, headers);
			String flaskUrl = "http://172.30.1.23:5000/upload"; 
			ResponseEntity<String> responseEntity = restTemplate.postForEntity(flaskUrl, requestEntity, String.class);
	        //ResponseEntity<String> response 
	        //     = restTemplate.exchange(flaskUrl, HttpMethod.POST,requestEntity,String.class);
		    
			
		} catch (Exception e) {
			
		}	
		
		 
	     
		
	}
	
	
	
	
}
