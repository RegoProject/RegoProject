package com.smhrd.controller;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.smhrd.entity.r_member;
import com.smhrd.repository.MemberRepository;

@Controller
public class MemberController {

	@Autowired
	private MemberRepository repo;
	r_member member = new r_member();
	
	// goMain 이라는 요청을 받으면 main.jsp
	@RequestMapping("/goMain")
	public String goMain() {
		
		
		return "views/main";
	}
	
	@RequestMapping("/goLogin")
	public String goLogin() {
		
		
		return "views/login";
	}
	
	@RequestMapping("/goUpdate")
	public String goUpdate() {
		
		
		return "update";
	}
	

	@RequestMapping("/goJoin")
	public String goJoin() {

		return "views/join";
		
	}
	
	
	@RequestMapping("/join")
	public String join(@ModelAttribute r_member member, @RequestParam("custImg1") MultipartFile Img) {
		
		

		
		//회원가입 이미지 저장
		String uuid =  UUID.randomUUID().toString(); // 0123-4567-asdf-qwercat.jpg
		System.out.println(uuid);
		// 2. uuid + file 이름, 저장할 이름을 생성
		String filename = uuid + "_" + Img.getOriginalFilename();
		System.out.println(filename);
		// 3. 어디에 저장할지 
		String savePath = "src/main/resources/static/";
		Path path = Paths.get(savePath + filename);
		// 4. 위에서 만든 내용을 기반으로 경로 Path 객체 만들기
		//Path path = Paths.get(savePath+"\\"+ filename);
		System.out.println(path);
		try {
			Files.copy( Img.getInputStream(), path);
			member.setCustImg(filename);
			repo.save(member);
			
			 System.out.println("성공이야?");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		// 2. 기능 정의 및 실행
		
		
		// 3. View 선택
		
		return "redirect:/goMain";
		
	}
	

	@RequestMapping("/login")
	public String login(String custId, String custPw, HttpSession session) {
		// 1. 수집
		
		// 2. 기능 정의 및 실행
		member = repo.findByCustIdAndCustPw(custId, custPw);
		if ( member != null) {
			session.setAttribute("user", member );
			
		}

		// 3. View 선택
		
		return "redirect:/goMain";
		
	}
	
	
	/* 비밀번호 찾기 */
	@RequestMapping("/goFindPw")
	public String goFind() {
		
		return "views/find";
	}
	
	@RequestMapping("/update")
	public String update(r_member member ,HttpSession session ) {
		// 1. 수집
		
		// 2. 기능 정의 및 실행
		member = repo.save(member);
		
		if ( member != null ) {
			session.setAttribute("user", member);
			
		}
		
		// 3. View 선택
		return "redirect:/goMain";
		
	}
	
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		
		session.removeAttribute("user");
		
		// jsp에서 jsp로 넘어갈때? redirect 
		return "redirect:/goLogin";
	}
	
	
	
	
}
