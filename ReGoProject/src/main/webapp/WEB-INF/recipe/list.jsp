<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>레시피 리스트 페이지</h1>
<a href="/goMain">메인</a>
<ul id="rcp_list">
<c:forEach var="recipe" items="${recipe}">
	<li>
		<a href="/goRecView?rcpIdx=${recipe.rcpIdx}" class="image_container">
		<img class="hover_image" src="${recipe.rcpImg1}" alt="#">
		</a>
		<div><span>${recipe.rcpName}</span></div>
		
	</li>
</c:forEach>
</ul>

</body>
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<script>
$(document).ready(function() {
    let page = 2; // 초기 페이지
    let loading = false;
    function loadMoreData() {
    	if (loading) return; // 이미 로딩 중이면 중복 실행 방지
        loading = true;
    	console.log(page);
        $.ajax({
            url: '/loadMoreData', // 데이터를 불러올 엔드포인트
            type: 'GET',
            data: { "page": page }, // 현재 페이지 정보를 서버에 전달
            success: function(data) {
            	
            	if (data.length === 0) {
                    // 더 이상 데이터가 없으면 무한 스크롤 중지
                    $(window).off('scroll', loadMoreData);
                    return;
                }
                console.log(data);
                let ul = $('#rcp_list');
                for (let i = 0; i < data.length; i++) {

                	
                      tr = "<li>";
                      tr += "<a href="+"'/goRecView?rcpIdx="+data[i].rcpIdx+"' class='image_container'>"
                      tr += "<img class='hover_image' src='"+data[i].rcpImg1+"' alt='#'>"
                      tr += "</a>" 
                      tr += "<div><span>"+data[i].rcpName+"</span></div>"
                      tr += "</li>";  

                    
                    ul.append(tr)
                 }
            	// 받아온 데이터를 화면에 추가
                
                page++;
                loading = false;// 다음 페이지로 이동
            },
            error: function() {
                alert('데이터를 불러오는데 실패했습니다.');
                loading = false;
            }
        });
    }

    // 스크롤 이벤트를 감지하여 무한 스크롤 동작
    $(window).scroll(function() {
        if ($(window).scrollTop() + $(window).height() >= $(document).height() - 100) {
            loadMoreData(); // 스크롤이 끝에 도달하면 새로운 데이터를 불러옴
        }
    });
});
</script>
</html>