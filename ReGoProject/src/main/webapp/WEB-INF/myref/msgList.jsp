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
	<h1>내 냉장고 조미료 리스트 페이지</h1>
	<table border="1">
		<c:forEach var="msg" items="${myMsg}"> 
			<tr>
				<td>${msg.msgName}</td>
				<td>${msg.msgAmount}</td>
			</tr>
		</c:forEach>
	</table>
	<a href="/goMain">메인</a>
</body>
</html>