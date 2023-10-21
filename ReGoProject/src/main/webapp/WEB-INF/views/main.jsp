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
<a href="/goMyRefList">내냉장고</a>
<br>
<a href="/goRecList">레시피</a>
<br>

</body>
</html>