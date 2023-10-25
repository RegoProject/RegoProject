package com.smhrd.controller;

import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;
import java.util.Optional;
import java.util.UUID;

import javax.servlet.http.HttpServletResponse;
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

		return "views/update";
	}

	@RequestMapping("/goJoin")
	public String goJoin() {

		return "views/join";

	}

	@RequestMapping("/join")
	public String join(@ModelAttribute r_member member, @RequestParam("custImg1") MultipartFile Img, @RequestParam("custAddr1") String custAddr1,
			@RequestParam("custAddr2") String custAddr2) {
		
		String addr= member.getCustAddr();
		String custAddr = addr +"/"+custAddr1 +"/"+custAddr2;
		System.out.println(custAddr);
		
		// 회원가입 이미지 저장
		String uuid = UUID.randomUUID().toString(); // 0123-4567-asdf-qwercat.jpg
		System.out.println(uuid);
		// 2. uuid + file 이름, 저장할 이름을 생성
		String filename = uuid + "_" + Img.getOriginalFilename();
		System.out.println(filename);
		// 3. 어디에 저장할지
		String savePath = "src/main/resources/static/";
		Path path = Paths.get(savePath + filename);
		// 4. 위에서 만든 내용을 기반으로 경로 Path 객체 만들기
		// Path path = Paths.get(savePath+"\\"+ filename);
		System.out.println(path);
		try {
			Files.copy(Img.getInputStream(), path);
			member.setCustImg(filename);
			member.setCustAddr(custAddr);
			repo.save(member);

			System.out.println("성공이야?");

		} catch (Exception e) {
			e.printStackTrace();
		}
		// 2. 기능 정의 및 실행

		// 3. View 선택

		return "redirect:/goLogin";

	}

	@RequestMapping("/login")
	public void login(@RequestParam("custId") String custId, @RequestParam("custPw") String custPw, HttpSession session,
			HttpServletResponse response) {

		

		member = repo.findByCustIdAndCustPw(custId, custPw);
		System.out.println(member);
		if (member != null) {

			session.setAttribute("user", member);
			try {

				response.setContentType("text/plain; charset=UTF-8");
				response.getWriter().write("success");
			} catch (Exception e) {

			}

		} else {
			try {
				response.setContentType("text/plain; charset=UTF-8");
				response.getWriter().write("fail");

			} catch (Exception e) {

			}
		}		
	}	



	@RequestMapping("/goFindPw")
	public String goFind() {

		return "views/find";
	}

	@RequestMapping("/update")
	public String update(r_member member, HttpSession session) {
		// 1. 수집

		// 2. 기능 정의 및 실행
		member = repo.save(member);

		if (member != null) {
			session.setAttribute("user", member);

		}

		// 3. View 선택
		return "redirect:/goMypage";

	}

	@RequestMapping("/logout")
	public String logout(HttpSession session) {

		session.removeAttribute("user");

		// jsp에서 jsp로 넘어갈때? redirect
		return "redirect:/goLogin";
	}
	@RequestMapping("/idCheck")
	public void idCheck(@RequestParam("id") String custId ,r_member member ,HttpServletResponse response  ) {
		
		Optional<r_member> id = repo.findById(custId);
		
		System.out.println("여기오나요?");
		
		 try {
		        response.setContentType("text/plain; charset=UTF-8");
		        if (!id.isPresent()) {
		            response.getWriter().write("true");
		        } else {
		            response.getWriter().write("false");
		        }
		    } catch (Exception e) {
		        // 예외 처리
		    }
		
		
		
	}

}
