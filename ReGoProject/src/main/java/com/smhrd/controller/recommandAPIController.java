package com.smhrd.controller;

import javax.servlet.http.HttpSession;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.smhrd.entity.r_member;

@RestController
@RequestMapping("/recommandAPI")
public class recommandAPIController {
	

    @PostMapping
    public ResponseEntity<String> recommandAPI(HttpSession session, r_member member) {
    	member = (r_member) session.getAttribute("user");
        try {
        	// 사용자 재료, 조미료 조회
            member.getCustId();

            // API 서버에 요청 아래형식
            // body = {
            // 'user_ing': [106, 6, 34, 16, 149, 77, 109]
            //	}
            
            
            // API 응답값 받아서 (메뉴 이름으로 받을것임) rcpIdx 번호 추출
            String responseJson = "{\"recipe\": [\"양배추 덮밥\", \"Item2\", \"Item3\"]}";
            
            // 레시피 추천 페이지에 해당 인덱스 번호로 불러오게 해야되는데 어떻게 할지 생각좀
            
            
           
           

            return ResponseEntity.ok(responseJson);
        } catch (Exception e) {
            // 오류 처리
            return ResponseEntity.status(500).body("Error: " + e.getMessage());
        }
    }

}
