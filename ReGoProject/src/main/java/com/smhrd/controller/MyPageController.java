package com.smhrd.controller;

import java.io.File;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.smhrd.entity.r_board;
import com.smhrd.entity.r_member;
import com.smhrd.repository.r_boardRepository;
import com.smhrd.repository.r_memberrRepository;

@Controller
public class MyPageController {
	

	@Autowired
	private r_memberrRepository repo;
	@Autowired
	private r_boardRepository repo1;
	
	
	@RequestMapping("/goMyForm")
	public String goForm() {
		
		
		return "mypage/form";
	}
	
	@RequestMapping("/goMyView")
	public String goView() {
		// 내 게시글 상세보기
		
		return "mypage/view";
	}
	
	@RequestMapping("/goMyAddList")
	public String goAddList() {
		// 내 게시글 상세보기
		
		return "mypage/addList";
	}
	@RequestMapping("/goMypage")
	public String goMypage(HttpSession session ,Model model  ) {
		r_member user =(r_member)session.getAttribute("user");
		String custId =user.getCustId();
		
		
		List<r_board> list= repo1.findByCustId(custId);
		model.addAttribute("board",list);
		model.addAttribute("who", "my");
		
		return "mypage/mypage1";
	}
	@RequestMapping("/goYourpage")
	public String goYourpage(HttpSession session, Model model, @RequestParam("custId")String custId) {
		r_member member= (r_member)session.getAttribute("user");
		String custId2 = member.getCustId();
		
		
		if(custId.equals(custId2)) {
			
			return "redirect:/goMypage";
		}else {
			
			List<r_board> list =repo1.findByCustId(custId);
			model.addAttribute("board", list);
			model.addAttribute("who", "you");
			return "mypage/mypage1";
		}
		
		
		
	}
	
	
	
	@RequestMapping("/updateProfileImage")
    public void updateProfileImage(@RequestParam("file") MultipartFile file ,HttpServletResponse response , HttpSession session, HttpServletRequest request ) {
	// 이미지파일 넣기 난이도★★★ ㅋㅋㅋㅋ 고생하셨어요
			// 1. UUID 생성 : 16글자 랜덤한 문자열		
			String uuid =  UUID.randomUUID().toString(); // 0123-4567-asdf-qwercat.jpg
			System.out.println(uuid);
			
			// 2. uuid + file 이름, 저장할 이름을 생성
			String filename = uuid + "_" + file.getOriginalFilename();
			System.out.println(filename);

			// 3. 어디에 저장할지 
			
			String savePath = "/home/ubuntu/uploadedImage";
			System.out.println(savePath);
			
//			Path path = Paths.get(savePath + filename);
			// 4. 위에서 만든 내용을 기반으로 경로 Path 객체 만들기
			//Path path = Paths.get(savePath+"\\"+ filename);
//			System.out.println(path);
			r_member member = (r_member)session.getAttribute("user");
			try {
//				Files.copy( file.getInputStream(), path);
				File f = new File(savePath + "/" + filename);
				file.transferTo(f);
				
				
				response.setContentType("text/plain; charset=UTF-8");	
				response.getWriter().write(filename);
				member.setCustImg(filename);
				repo.save(member);			
				session.setAttribute("user", member);
				
				
				System.out.println("성공이야?");
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			
        
        
    }
	
}
