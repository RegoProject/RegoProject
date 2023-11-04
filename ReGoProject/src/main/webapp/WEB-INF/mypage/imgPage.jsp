<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <style>
  .rounded-image {
    border-radius: 50%;
    width: 500px; /* 이미지의 크기를 조절할 수 있습니다. */
    height: 500px; /* 이미지의 크기를 조절할 수 있습니다. */
    object-fit: cover; /* 이미지가 동그랗게 잘리지 않게 설정합니다. */
  }
</style>
<title>Insert title here</title>
</head>
<body>



  <img src="${imgUrl}" alt="이미지 설명" class="rounded-image">


</body>
</html>