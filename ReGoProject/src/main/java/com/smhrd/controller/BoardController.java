package com.smhrd.controller;


import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.PageRequest;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.smhrd.entity.r_board;
import com.smhrd.entity.r_likes;
import com.smhrd.entity.r_member;
import com.smhrd.repository.r_boardRepository;
import com.smhrd.repository.r_likeRepository;
import com.smhrd.repository.r_memberrRepository;

@Controller
public class BoardController {
	
	@Autowired
	private r_boardRepository repo;
	@Autowired
	private r_likeRepository repo1;
	@Autowired
	private r_memberrRepository repo2;
	
	@RequestMapping("/goBoardList")
	public String goList() {
		
		return "board/list";
	}
	
	@RequestMapping("/boardAddList")
	public String addList() {
		
		return "board/addList";
	}
	
	@RequestMapping("/goBoardForm")
	public String goForm() {
		
		return "board/form";
	}
	
	@RequestMapping("/goBoardView")
	public String goView() {
		
		return "board/view";
	}
	//커뮤니티 게시판 테스트용
	@RequestMapping("/testList")
	public String testList(Model model ) {
		int page= 0;
		
		Pageable pageable = PageRequest.of(page, 10);
		
		List<r_board> list =repo.findAllByOrderByCreatedAtDesc(pageable);
		model.addAttribute("board",list);
		
		return "board/listtest";
	}
	@RequestMapping("/goCommunity")
	public String community(Model model , HttpSession session ) {
		
		int page= 0;
		r_member member =(r_member)session.getAttribute("user");
		Pageable pageable = PageRequest.of(page, 10);
		System.out.println(member.getCustId());
		String custId = member.getCustId();
		
		List<r_board> list =repo.findAllByOrderByCreatedAtDesc(pageable);
		int offset = page*10;		
		List<r_likes> list1 =repo1.findLikesByCustId(custId, offset);
		
		
		
		List<Integer> likes = new ArrayList<Integer>();
		
		
		for(int i = 0 ; i<list1.size() ; i++) {
			int rbIdx = list1.get(i).getRbIdx();
			likes.add(rbIdx);
		}
		
		List<Integer> likeCnt= new ArrayList<Integer>();
		for(int i= 0 ;  i<list.size(); i++) {
			int idx = list.get(i).getRbIdx();
			List<r_likes> likeCount = repo1.findAllByRbIdx(idx);
			likeCnt.add(likeCount.size());
		}
		List<String> userImg=  new ArrayList<String>();
		
		for(int i=0 ; i< list.size(); i++) {
			String custid =  list.get(i).getCustId();
			
			r_member user = repo2.findByCustId(custid);
			
			String img = user.getCustImg();
			userImg.add(img);			
		}
			
			
		System.out.println(likes);
		System.out.println(likeCnt);
		System.out.println(userImg);
		
		model.addAttribute("board",list);
		model.addAttribute("likes", likes);
		model.addAttribute("likeCnt", likeCnt);
		model.addAttribute("userImg",userImg);
		
		
		
		return "board/community";
	}
	
	@Transactional   //뭔줄모르겠는데 그냥 붙이니깐 삭제가됨...(?)
	@RequestMapping("/likeUnlike")
	public void likeUnlike(@RequestParam("rbidx") int rbidx , @RequestParam("status") String status ,HttpSession session,HttpServletResponse response) {
		
		r_member user= (r_member)session.getAttribute("user");
		String custId = user.getCustId();
		r_likes like = new r_likes();
		
		System.out.println(status);
		System.out.println(rbidx);
		
		
		
		if("like".equals(status)) {
			System.out.println("확인2");
			// entity에 createdAt이 String이라서 변환중
			LocalDateTime now = LocalDateTime.now();
			DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
			String formattedDateTime = now.format(formatter);
			like.setCreatedAt(formattedDateTime);
			like.setCustId(custId);
			like.setRbIdx(rbidx);
			
			repo1.save(like);
			
		}else {
			repo1.deleteByCustIdAndRbIdx(custId, rbidx);
		}
		List<r_likes> likeCount = repo1.findAllByRbIdx(rbidx);
		
		 String responseJson = "{\"rbidx\": " + rbidx + ", \"status\": \"" + status + "\", \"likeCount\": " + likeCount.size() + "}";

		    try {
		        response.getWriter().write(responseJson);
		    } catch (IOException e) {
		        e.printStackTrace();
		    }	
		
		
	}
	@RequestMapping("/loadMoreBoard")
	public void loadMoreBoard(@RequestParam("page") int page , HttpSession session , HttpServletResponse response) {
		
		System.out.println(page);
		r_member member =(r_member)session.getAttribute("user");
		String custId = member.getCustId();
		System.out.println(custId);
		Pageable pageable = PageRequest.of(page, 10);
		List<r_board> list= repo.findAllByOrderByCreatedAtDesc(pageable);
		
		int offset = page*10;		
		List<r_likes> list1 =repo1.findLikesByCustId(custId, offset);
		
		List<Integer> likes = new ArrayList<Integer>();
		List<Integer> likeCnt= new ArrayList<Integer>();
		for(int i= 0 ;  i<list.size(); i++) {
			int idx = list.get(i).getRbIdx();
			List<r_likes> likeCount = repo1.findAllByRbIdx(idx);
			likeCnt.add(likeCount.size());
		}
		List<String> userImg=  new ArrayList<String>();
		
		for(int i=0 ; i< list.size(); i++) {
			String custid =  list.get(i).getCustId();
			
			r_member user = repo2.findByCustId(custid);
			
			String img = user.getCustImg();
			userImg.add(img);			
		}
		
		
			for(int i = 0 ; i<list1.size() ; i++) {
				int rbIdx = list1.get(i).getRbIdx();
				likes.add(rbIdx);
			}
			System.out.println(list);
			System.out.println(likes);
			System.out.println(likeCnt);
			System.out.println(userImg);
			
			 Gson gson = new Gson();
			    String jsonList = gson.toJson(list);
			    String jsonLikes = gson.toJson(likes);
			    String jsonLikeCnt = gson.toJson(likeCnt);
			    String jsonImg= gson.toJson(userImg);
			    
			    // JSON 응답을 클라이언트로 전송
			    try {
			        response.setContentType("application/json");
			        response.setCharacterEncoding("UTF-8");
			        response.getWriter().write("{\"list\":" + jsonList + ", \"likes\":" + jsonLikes + ",\"likeCnt\":"+jsonLikeCnt+",\"userImg\":"+jsonImg+ "}");
			    } catch (IOException e) {
			        e.printStackTrace();
			    }
		
		
		
	}
	

	
	
}

