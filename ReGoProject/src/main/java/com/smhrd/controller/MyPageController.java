package com.smhrd.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.smhrd.entity.r_board;
import com.smhrd.entity.r_follow;
import com.smhrd.entity.r_member;
import com.smhrd.repository.r_boardRepository;
import com.smhrd.repository.r_followRepository;
import com.smhrd.repository.r_memberrRepository;

@Controller
public class MyPageController {
	
	
	@Autowired
	private r_memberrRepository repo;
	@Autowired
	private r_boardRepository repo1;
	@Autowired
	private r_followRepository repo2;
	
	
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
		  if (user == null) {
		        // 세션이 종료되었거나 사용자가 로그인하지 않았을 때 로그인 페이지로 리다이렉트
		        return "redirect:/goLogin";
		    }
		String custId =user.getCustId();
		
		
		List<r_board> list= repo1.findByCustId(custId);
		List<r_follow> list1= repo2.findByFollowee(custId);
		List<r_follow> list2= repo2.findByFollower(custId);
		
		model.addAttribute("boardCnt", list.size());
		model.addAttribute("board",list);
		model.addAttribute("who", "my");
		model.addAttribute("follow", list1.size());
		model.addAttribute("following" , list2.size());
		model.addAttribute("user1", user);
		return "mypage/mypage1";
	}
	@RequestMapping("/goYourpage")
	public String goYourpage(HttpSession session, Model model, @RequestParam("custId")String custId) {
		r_member member= (r_member)session.getAttribute("user");
		
		  if (member == null) {
		        // 세션이 종료되었거나 사용자가 로그인하지 않았을 때 로그인 페이지로 리다이렉트
		        return "redirect:/goLogin";
		    }
		String custId2 = member.getCustId();
		
		
		
		if(custId.equals(custId2)) {
			
			return "redirect:/goMypage";
		}else {
			String fff= "";
			List<r_follow> follow =repo2.findByFollowerAndFollowee(custId2, custId);
			if(follow.size()==0) {				
					fff = "yes";
			}else {
				fff= "no";				
			}
			
			r_member who = repo.findByCustId(custId);
			List<r_board> list =repo1.findByCustId(custId);
			List<r_follow> list1= repo2.findByFollowee(custId);
			List<r_follow> list2= repo2.findByFollower(custId);
			model.addAttribute("choose" , fff);
			model.addAttribute("boardCnt", list.size());
			model.addAttribute("board", list);
			model.addAttribute("user1" ,who);
			model.addAttribute("who", "you");
			model.addAttribute("follow", list1.size());
			model.addAttribute("following" , list2.size());
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
			
			String savePath = "/imagePath/uploadedImage/profileImg";
			System.out.println(savePath);
			
		
			
			r_member member = (r_member)session.getAttribute("user");
			try {
				
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
	@Transactional
	@RequestMapping("/follow")
	public void follow(@RequestParam("custId") String custId ,@RequestParam("action")String action , HttpSession session  , HttpServletResponse response) {
		r_follow fol= new r_follow();
		r_member member = (r_member)session.getAttribute("user");
		String cust1 = member.getCustId();
		String result ="";
		if(action.equals("팔로우")) {
			System.out.println(action);
			fol.setCreatedAt(new Date());
			fol.setFollowee(custId);
			fol.setFollower(cust1);
			repo2.save(fol);
			result ="follow";
			
			
		}else {
			System.out.println(action);
			repo2.deleteByFollowerAndFollowee(cust1, custId);
			result ="unfollow";
		}
		
		 try {
		        response.getWriter().write(result);
		    } catch (IOException e) {
		        e.printStackTrace();
		    }
		
		
		
		
	}
	@RequestMapping("/imgPage")
	public String yourPage(Model model ,@RequestParam("imgSrc")String src ) {
	    
	    model.addAttribute("imgUrl", src);
	    return "mypage/imgPage";
	}
	
}
