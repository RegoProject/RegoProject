package com.smhrd.controller;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.Base64;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;

import java.util.Optional;
import java.util.Set;
import java.util.Base64;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.smhrd.entity.r_ingre_join_data;
import com.smhrd.entity.r_ingredients;
import com.smhrd.entity.r_member;
import com.smhrd.entity.r_msg;
import com.smhrd.entity.r_msg_join_data;
import com.smhrd.entity.r_my_ingredients;
import com.smhrd.entity.r_my_msg;
import com.smhrd.entity.r_recipe;
import com.smhrd.repository.r_cookingRepository;
import com.smhrd.repository.r_ingreRepository;
import com.smhrd.repository.r_msgRepository;
import com.smhrd.repository.r_my_ingreRepository;
import com.smhrd.repository.r_my_msgRepository;
import com.smhrd.repository.r_recipeRepository;
import com.smhrd.service.r_recipeService;

@Controller
public class RecipeController {

	@Autowired
	private recommandAPIController recAPI;

	@Autowired
	private r_recipeRepository repo;

	@Autowired
	private r_my_msgRepository myMsgRepo;

	@Autowired
	private r_my_ingreRepository myIngreRepo;

	@Autowired
	private r_recipeService recService;
	@Autowired
	private r_cookingRepository cooking;

	// 레시피데이터 데이터베이스 추가하는코드
	@RequestMapping("/recipeInsert")
	public void recipeInsert() {

		String csvFile = "C:/Users/user/Desktop/recipe.csv"; // 실제 CSV 파일 경로로 변경
		String csvFile2 = "C:/Users/user/Desktop/leveltime.csv";
		String line = "";
		String line2 = "";
		// CSV 파일의 열 구분자

		List<String[]> rows2 = new ArrayList<>();

		List<String[]> rows = new ArrayList<>();

		try (BufferedReader br = new BufferedReader(new InputStreamReader(new FileInputStream(csvFile2), "utf-8"))) {

			while ((line2 = br.readLine()) != null) {
				String[] data = line2.split(",");

				// 빈 값이 아닌 경우에만 추가
				if (data.length > 0 && !data[0].isEmpty()) {
					rows2.add(data);
				}
			}

		} catch (IOException e) {
			e.printStackTrace();
		}

		try (BufferedReader br = new BufferedReader(new InputStreamReader(new FileInputStream(csvFile), "EUC-KR"))) {

			while ((line = br.readLine()) != null) {
				String[] data = line.split("\",\"");
				rows.add(data);
			}

		} catch (IOException e) {
			e.printStackTrace();
		}
		rows.remove(0);
		rows2.remove(0);

		for (int i = 0; i < rows.size(); i++) {
			r_recipe recipe = new r_recipe();
			String[] recipeNameList = rows.get(i)[0].split(",");

			System.out.println(recipeNameList[0]);
			String rcpImg = rows2.get(i)[0] + ".jpg";
			String rcpLevel = rows2.get(i)[1];
			String rcpTime = rows2.get(i)[2];
			String recipeContent = rows.get(i)[2].replaceAll("[\\[\\].]", "");
			recipe.setRcpIdx(i + 1);
			recipe.setRcpName(rows2.get(i)[0]);
			recipe.setRcpContent(recipeContent);
			recipe.setRcpImg1(rcpImg);
			recipe.setRcpLevel(rcpLevel);
			recipe.setRcpTime(rcpTime);

			repo.save(recipe);

		}
	}

	@RequestMapping("/goRecList")
	public String goList(Model model) {
		// List<r_recipe> list = repo.findAll();

		List<r_recipe> list = repo.findTop10ByOrderByRcpIdxAsc();

		model.addAttribute("stop", "true");
		model.addAttribute("recipe", list);
		return "recipe/list";
	}

	@RequestMapping("/goRecForm")
	public String goForm() {

		// 레시피 수정폼이 필요한가 모르겠다
		// 관리자용으로 남겨놔야하나?

		return "recipe/form";
	}

	@RequestMapping("/goRecView")
	public String goView(@RequestParam("rcpIdx") int rcpIdx, Model model) throws JsonProcessingException {

		r_recipe recipe = repo.findByRcpIdx(rcpIdx);

		String[] contentList = recipe.getRcpContent().split("', '");
		ArrayList<String> contentList2 = new ArrayList<>();
		System.out.println(contentList[0]);
		for (int i = 0; i < contentList.length; i++) {

			String content = contentList[i].replace("'", "");
			content = content.replace("\"", "");
			if (i == 0) {
				content = (i + 1) + ". " + content;
			} else {
				content = i + 1 + ". " + content;
			}

			contentList2.add(content);
			System.out.println(content);
		}
		model.addAttribute("content", contentList2);
		model.addAttribute("recipe", recipe);
		// 레시피 상세뷰
		ObjectMapper objectMapper = new ObjectMapper();

		// 1. 레시피인덱스로 r_recipe_ingredients , r_ingredients 조인한 재료정보(재료정보) 리스트에 담아주기

		List<r_ingre_join_data> ingreResult = recService.selectRecipeIngre(rcpIdx);
		List<String> ingredientsList = new ArrayList<>();
		for (r_ingre_join_data ingredient : ingreResult) {
			ingredientsList.add(ingredient.getIngreName());
		}
		String ingreJson = objectMapper.writeValueAsString(ingredientsList);

		// 2. 레시피인덱스로 r_recipe_msg , r_msg 조인한 조미료정보(조미료이름)
		List<String> msgList = new ArrayList<>();
		List<r_msg_join_data> msgResult = recService.selectRecipeMsg(rcpIdx);
		for (r_msg_join_data msg : msgResult) {
			msgList.add(msg.getMsgName());
		}
		String msgJson = objectMapper.writeValueAsString(msgList);

		// JSON 형식으로 담아주기 -> 재료 : 값 / 조미료 : 값

		// result는 그대로 model로 보내도될듯
		
		model.addAttribute("msgJson", msgJson);
		model.addAttribute("ingreJson", ingreJson);
		model.addAttribute("content", contentList2);
		model.addAttribute("recipe", recipe);

		return "recipe/view";
	}


	// 래정오빠 레시피 전체목록 페이지는 사진 사이즈때문에 스크롤이 적용이 안되는것같아서 한 페이지당 호출하는 개수를 늘려야될것같아요 10개정도로
	// 커뮤니티는 한 게시글이 차지하는 화면 비율이 커서 로드하자마자 기능실행이 돼서 스크롤이 정상작동 합니다.
	@RequestMapping("/loadMoreData")
	public void loadMoreRcp(@RequestParam("page") int page, HttpServletResponse response) {
		System.out.println(page);
		int start = page * 10 - 9;
		System.out.println(start);
		int end = page * 10;
		List<r_recipe> list = repo.findByRcpIdxBetweenOrderByRcpIdxAsc(start, end);
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
		System.out.println("????왜여기오냐");

	}

	@RequestMapping("/recSuccess")
	public void recSuccess(HttpServletResponse response, @RequestParam("file") MultipartFile multipartFile,
			@RequestParam("recipe") String recipeName) {
		Map<String, String> map = new HashMap<>();
		RestTemplate restTemplate = new RestTemplate();
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.APPLICATION_JSON);
		String result = "";
		System.out.println(recipeName);
		try {
			// MultipartFile을 File로 변환
			File file = convertMultipartFileToFile(multipartFile);

			FileInputStream fileInputStreamReader = new FileInputStream(file);
			byte[] bytes = new byte[(int) file.length()];
			fileInputStreamReader.read(bytes);
			String encodedfile = Base64.getEncoder().encodeToString(bytes);

			map.put("label", recipeName);
			map.put("image", encodedfile);

			HttpEntity<Map<String, String>> requestEntity = new HttpEntity<>(map, headers);
			String flaskUrl = "http://15.165.250.150:5000/success";
			ResponseEntity<String> responseEntity = restTemplate.postForEntity(flaskUrl, requestEntity, String.class);

			System.out.println(responseEntity.getBody());
			String responseBody = responseEntity.getBody();
			ObjectMapper objectMapper = new ObjectMapper();
			JsonNode jsonNode = objectMapper.readTree(responseBody);

			boolean results = jsonNode.get("results").asBoolean();
			System.out.println(results);

			System.out.println(responseEntity.getHeaders());
			System.out.println(responseEntity.getStatusCode());
			result = responseEntity.getBody();
			System.out.println("성공");

			result = String.valueOf(results);
			
			response.getWriter().write(result);
			

			// 파일 사용이 끝나면 삭제
			file.delete();
		} catch (Exception e) {
			System.out.println("실패인가?");
			e.printStackTrace();
		}

	}

	private File convertMultipartFileToFile(MultipartFile multipartFile) throws IOException {
		File file = new File(multipartFile.getOriginalFilename());
		FileOutputStream fos = new FileOutputStream(file);
		fos.write(multipartFile.getBytes());
		fos.close();
		return file;
	}

	@RequestMapping("/recipeSearch")
	public String boardSearch(Model model, @RequestParam("search") String search) {
		List<r_recipe> recipelist = new ArrayList<>();
		List<String> ngrams = generateNGrams(search, 2);
		for (int i = 0; i < ngrams.size(); i++) {
			String search1 = "";
			search1 = "%" + ngrams.get(i) + "%";

			List<r_recipe> list = repo.findByRcpNameContaining(search1);
			for (int j = 0; j < list.size(); j++) {
				recipelist.add(list.get(j));

			}
		}
		List<r_recipe> uniqueRecipeList = new ArrayList<>();
		Set<Integer> rcpIdxSet = new HashSet<>();

		for (r_recipe recipe : recipelist) {
			if (!rcpIdxSet.contains(recipe.getRcpIdx())) {
				uniqueRecipeList.add(recipe);
				rcpIdxSet.add(recipe.getRcpIdx());
			}
		}

		model.addAttribute("recipe", uniqueRecipeList);
		model.addAttribute("stop", "false");

		return "recipe/list";
	}

	public static List<String> generateNGrams(String text, int n) {
		List<String> ngrams = new ArrayList<>();
		String[] words = text.split("\\s+");
		for (String word : words) {
			for (int i = 0; i <= word.length() - n; i++) {
				ngrams.add(word.substring(i, i + n));
			}
		}
		return ngrams;
	}

	@RequestMapping("/goRecommendList")
	public String goRecommendList(HttpSession session, Model model) {
		r_member member = (r_member) session.getAttribute("user");

		List<r_my_ingredients> ingreList = myIngreRepo.findByCustId(member.getCustId());
		List<r_my_msg> msgList = myMsgRepo.findByCustId(member.getCustId());
		System.out.println(ingreList);

		if (ingreList.isEmpty() || msgList.isEmpty()) {
			// 사용자가 신규 사용자인 경우, 메인 페이지로 리다이렉트 또는 다른 처리 수행
			// 에러페이지 만들어서 보내주자
			return "redirect:/goMain";
		}

		System.out.println("리스트 비어있으면 여긴 오면 안돼");
		// recommendAPIController 호출
		ResponseEntity<String> responseEntity = recAPI.recommendAPI(ingreList, msgList);

		if (responseEntity.getStatusCode() == HttpStatus.OK) {
			String response = responseEntity.getBody();
			System.out.println(response);
			ObjectMapper objectMapper = new ObjectMapper();
			List<String> rcpNames = new ArrayList<>();

			try {
				JsonNode rootNode = objectMapper.readTree(response);
				JsonNode recipeNode = rootNode.get("recipe");

				if (recipeNode.isArray()) {
					for (JsonNode recipe : recipeNode) {
						rcpNames.add(recipe.asText());
					}
				}
			} catch (IOException e) {
				e.printStackTrace(); // 예외 처리를 적절하게 수행해야 합니다.
			}

			// recService.selectRecipe를 사용하여 레시피 정보 얻기
			List<r_recipe> recommendList = new ArrayList<>();
			for (String rcpName : rcpNames) {
				r_recipe recipe = recService.selectRecipe(rcpName);
				if (recipe != null) {
					recommendList.add(recipe);
				}
			}

			System.out.println(recommendList);
			model.addAttribute("recommendList", recommendList);
			return "recipe/recommendList";
		} else {
			// 오류 처리
			return "redirect:/goMain"; // 오류 페이지로 리다이렉트 또는 다른 처리 수행
		}
	}
	@RequestMapping("/recipeSuccess")
	public String recipeScucess(@RequestParam("custId")String custId ) {
		
		
		
		cooking.save(null);
		
		
		return "views/main";
		
	}
	
	

}