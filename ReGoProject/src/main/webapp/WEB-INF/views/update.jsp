<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>update 페이지</h1>
<li><h5>업데이트</h5></li>
			<form action="/update" method="post">
				<li><input readonly id="checkInput" type="text"
					 value=${user.custId} name="custId"></li>
				<p id="checkResult"></p>
				<li><input type="password" placeholder="변경할비밀번호를 입력하세요" name="custPw" value=${user.custPw }></li>
				<li><input type="text" value=${user.custName } placeholder=${user.custName }  name="custName" value=${user.custName }></li>
				<li><input type="email" value=${user.custEmail } placeholder=${user.custEmail } name="custEmail" value=${user.custEmail }></li>
				<li><input type="text" placeholder=${user.custAddr } name="custAddr" value=${user.custAddr }></li>
				<li><input type="text" placeholder=${user.custPhone } name="custPhone" value=${user.custPhone }></li>
				<li><input type="text" value=${user.custImg }  name="custImg" style="display: none;"></li>
			    <li><input type="date" value=${user.custJoindate }  name="custJoindate" style="display: none;"></li>
				<li><input type="submit" value="가입하기" class="button fit"></li>
			</form>	

</body>
</html>