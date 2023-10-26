<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>레시피 리스트 페이지</h1>
<a href="/goMain">메인</a>
<c:forEach var="recipe" items="${recipe}">
	<li>
		<a href="goProductcell.do?prod_seq=${products.prod_seq}" class="image_container">
		<img class="hover_image" src="${products.prod_img}" alt="랄로!?">
		</a>
		<div><span>${products.prod_name}</span></div>
		<div><strong>${products.prod_price}원</strong></div>
	</li>
</c:forEach>

</body>
</html>