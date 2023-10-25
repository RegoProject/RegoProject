<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
	.rounded-image {
    border-radius: 50%; /* 50%로 설정하여 이미지를 동그랗게 만듭니다. */
    width: 100px; /* 이미지의 너비 */
    height: 100px; /* 이미지의 높이 */
}

</style>

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<a href="javascript:window.history.back();">뒤로가기</a>
<br>
<h1>게시글 리스트(무한스크롤) 보기페이지</h1>
<a href="/goMain">메인</a>
<br>
<a href="/goBoardForm">게시글수정폼버튼</a>
<br>
<a href="/goBoardView">게시글 상세뷰</a>
<br>
<a href="/boardAddList">게시글 addList 확인용(사용은안함)</a>

<h1>마이페이지</h1>
<h2>${user.custId}</h2>
<form id="uploadForm" enctype="multipart/form-data">
    <img id="profilePhoto" src="/${user.custImg}" alt="#" class="rounded-image">
    <input type="file" name="file" id="fileInput" style="display: none;">
    <input type="submit" value="Upload" style="display: none;">
</form>
<a href="/goUpdate">회원정보수정</a>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
$(document).ready(function() {
    $("#profilePhoto").click(function() {
        $("#fileInput").click(); // 파일 선택 창을 띄웁니다.
    });

    $("#fileInput").change(function() { // 파일이 선택되면 자동으로 submit 합니다.
        $("#uploadForm").submit();
    });

    $("#uploadForm").submit(function(event) {
        event.preventDefault();
        var formData = new FormData(this);
        
        $.ajax({
            url: "/updateProfileImage",
            type: "POST",
            data: formData,
            contentType: false,
            processData: false,
            success: function(res) {
            	setTimeout(function() {
                    console.log("파일 업로드 성공");
                    console.log(res);
                    
                    $("#profilePhoto").attr("src", res);
                },2500 );
            	// 다듬을때하기 -> 배포할때 업로드가 바로바로 돼서 바로 프로젝트가 새로고침되게끔 해야함
            },
            error: function(e) {
                console.log("에러 발생");
            }
        });
    });
});
</script>
</body>
</html>
    
    


