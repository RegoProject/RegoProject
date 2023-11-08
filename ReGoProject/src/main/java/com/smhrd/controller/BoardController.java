package com.smhrd.controller;


import java.io.File;
import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.smhrd.entity.r_board;
import com.smhrd.entity.r_comment;
import com.smhrd.entity.r_likes;
import com.smhrd.entity.r_member;
import com.smhrd.repository.r_boardRepository;
import com.smhrd.repository.r_commentRepository;
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
	@Autowired
	private r_commentRepository commentRepo;
	
	@RequestMapping("/goBoardList")
	public String goList() {
		
		return "board/list";
	}
	
	@RequestMapping("/boardAddList")
	public String addList() {
		
		return "board/addList";
	}
	
	//게시글 작성페이지
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
		System.out.println(list.get(0).getCreatedAt());
		
		model.addAttribute("board",list);
		model.addAttribute("likes", likes);
		model.addAttribute("likeCnt", likeCnt);
		model.addAttribute("userImg",userImg);
		model.addAttribute("stop", "false");
		
		
		return "board/community";
	}
	
	@RequestMapping("/getComments")
	public ResponseEntity<List<r_comment>> getComments(@RequestParam("rbIdx") int rbIdx , Model model) {
		System.out.println("들어옴?");
	    List<r_comment> comments = commentRepo.findByRbIdx(rbIdx);

	    System.out.println(comments);
	    model.addAttribute("comment",comments);
	    // 댓글 데이터를 JSON 형식으로 반환
	    return new ResponseEntity<>(comments, HttpStatus.OK);
	}
	
	@RequestMapping(value = "/addComment", method = RequestMethod.POST)
	public ResponseEntity<String> addComment(@RequestParam int rbIdx, @RequestParam String rmtContent, HttpSession session, r_member member) {
		member = (r_member) session.getAttribute("user");
	    r_comment newComment = new r_comment();
	    newComment.setRbIdx(rbIdx);
	    newComment.setCustId(member.getCustId()); // 로그인한 사용자 아이디 또는 세션에서 가져온 사용자 아이디 사용
	    newComment.setRmtContent(rmtContent);
	    
	    commentRepo.save(newComment); // CommentService에 댓글 저장 로직 추가
	    
	    return new ResponseEntity<>("댓글이 등록되었습니다.", HttpStatus.OK);
	}
	
	 
	@RequestMapping("/deleteComment")
	@Transactional
	public ResponseEntity<String> getComments(HttpSession session, r_member member, @RequestParam("rmtIdx") int rmtIdx) {
		member = (r_member) session.getAttribute("user");
		 if (member == null) {
		        return new ResponseEntity<>("로그인이 필요합니다.", HttpStatus.UNAUTHORIZED);
		    }
		 
	    r_comment comment = commentRepo.findByRmtIdx(rmtIdx);
	    if (comment == null || !comment.getCustId().equals(member.getCustId())) {
	        return new ResponseEntity<>("댓글을 삭제할 권한이 없습니다.", HttpStatus.FORBIDDEN);
	    }

		

	    try {
	        commentRepo.deleteByCustIdAndRmtIdx(member.getCustId(), rmtIdx);
	        return new ResponseEntity<>("삭제에 성공하였습니다.", HttpStatus.OK);
	    } catch (Exception e) {
	        return new ResponseEntity<>("삭제에 실패하였습니다.", HttpStatus.BAD_REQUEST);
	    }
	}
	
	@RequestMapping(value = "/updateComment", method = RequestMethod.POST)
	@Transactional
	public ResponseEntity<String> updateComment(HttpSession session,r_member member, @RequestParam("rmtIdx") int rmtIdx, @RequestParam("rmtComment") String rmtComment) {
		member = (r_member) session.getAttribute("user");
	
		 try {
		        // 댓글 업데이트 로직을 수행 (JPA 메소드 활용)
		        commentRepo.updateComment(member.getCustId(), rmtIdx, rmtComment);
		        return new ResponseEntity<>("수정에 성공하였습니다.", HttpStatus.OK);
		    } catch (Exception e) {
		        return new ResponseEntity<>("수정에 실패하였습니다.", HttpStatus.BAD_REQUEST);
		    }
	}
	
	
	@Transactional   //뭔줄모르겠는데 그냥 붙이니깐 삭제가됨...(?)
	@RequestMapping("/likeUnlike")
	public void likeUnlike(@RequestParam("rbidx") int rbidx , @RequestParam("status") String status ,HttpSession session,HttpServletResponse response) {
		
		r_member user= (r_member)session.getAttribute("user");
		
		
		
		String custId = user.getCustId();
		r_likes like = new r_likes();
		

		
		
		
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
		

		r_member member =(r_member)session.getAttribute("user");
		String custId = member.getCustId();

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
	@RequestMapping("/boardSearch")
	public String boardSearch(@RequestParam("search") String search ,Model model,HttpSession session) {
		
		System.out.println(search);
		String search1 = "%"+search+"%";
		
		r_member member=(r_member)session.getAttribute("user");
		
	    if (member == null) {
	        // 세션이 종료되었거나 사용자가 로그인하지 않았을 때 로그인 페이지로 리다이렉트
	        return "redirect:/goLogin";
	    }

		String custId= member.getCustId();
		List<r_board> list= repo.findByRbContentContainingOrderByCreatedAtDesc(search1);
		List<r_likes> list1= repo1.findLikesByCustId2(custId, search1);
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
			
		System.out.println(list);	
		System.out.println(likes);
		System.out.println(likeCnt);
		System.out.println(userImg);
		
		model.addAttribute("board",list);
		model.addAttribute("likes", likes);
		model.addAttribute("likeCnt", likeCnt);
		model.addAttribute("userImg",userImg);
		model.addAttribute("stop", "true");
		
		
		return "board/community";	
	}
	@RequestMapping("/boardWrite")
	public String bardWrite(@RequestParam("boardImg") MultipartFile file , @RequestParam("boardContent") String boardContent ,HttpSession session ) {
		
		r_member member= (r_member)session.getAttribute("user");
		  if (member == null) {
		        // 세션이 종료되었거나 사용자가 로그인하지 않았을 때 로그인 페이지로 리다이렉트
		        return "redirect:/goLogin";
		    }
		String custId=  member.getCustId();
		r_board board = new r_board();
		board.setCustId(custId);
		board.setRbLikes(0);
		board.setRbViews(0);
		board.setRbStatus("A");
		board.setRbContent(boardContent);
		String uuid =  UUID.randomUUID().toString(); // 0123-4567-asdf-qwercat.jpg
		System.out.println(uuid);
		
		// 2. uuid + file 이름, 저장할 이름을 생성
		String filename = uuid + "_" + file.getOriginalFilename();
		System.out.println(filename);

		// 3. 어디에 저장할지 
		
		String savePath = "/home/ubuntu/uploadedImage/profileImg/boardImg";
		try {
			
			File f = new File(savePath + "/" + filename);
			file.transferTo(f);
			board.setRbImg(filename);
			board.setCreatedAt(new Date()); 
			System.out.println(filename);
			repo.save(board);
			
			
			
			System.out.println("성공");
			
		} catch (Exception e) {
			System.out.println("실패");
			e.printStackTrace();
		}
		
		
		
		return "redirect:/goCommunity";
	}
		
		
		
}

