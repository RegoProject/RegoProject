<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>${user.custId}님 환영합니다</h1> 
<a href="/goBoardList">게시판</a>
<br>
<a href="/goMypage">마이페이지</a>
<br>
<form action="/goMyIngreList" method="post">
<input type="hidden" id="${user.custId }" value="${user.custId }">
<button type="submit">내식재료</button>
</form>

<br>
<form action="/goMyMsgList" method="post">
<input type="hidden" id="${user.custId }" value="${user.custId }">
<button type="submit">내조미료</button>
</form>
<br>
<a href="/goRecList">레시피</a>
<br>
<a href="/logout">로그아웃</a>

</body>
</html>