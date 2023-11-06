<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html :class="{ 'theme-dark': dark }" x-data="data()" lang="en">

<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>REGO HOME</title>
  <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap" rel="stylesheet" />
  <script src="https://cdn.jsdelivr.net/gh/alpinejs/alpine@v2.x.x/dist/alpine.min.js" defer></script>
  <script src="./assets/js/init-alpine.js"></script>
  <script src="/assets/js/focus-trap.js"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.min.css" />
  <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.min.js" defer></script>
  <script src="jquery.min.js"></script> 
   <link rel="stylesheet" href="./assets/css/regocommunity_f.css" />
   

  

</head>

<body>
  <div class="content">
    <div class="flex h-screen bg-gray-50 dark:bg-gray-900" :class="{ 'overflow-hidden': isSideMenuOpen }">
      <!-- Desktop sidebar 여기 사이에있는 aside 코드 전부 지워야함-->

      <!-- 여기 사이에있는 코드지워야함-->

      <!-- Mobile sidebar -->

      <!-- Backdrop -->
      <div x-show="isSideMenuOpen" x-transition:enter="transition ease-in-out duration-150"
        x-transition:enter-start="opacity-0" x-transition:enter-end="opacity-100"
        x-transition:leave="transition ease-in-out duration-150" x-transition:leave-start="opacity-100"
        x-transition:leave-end="opacity-0"
        class="fixed inset-0 z-10 flex items-end bg-black bg-opacity-50 sm:items-center sm:justify-center"></div>
      <!--x-show="isSideMenuOpen에 있는" md:hidden 지워줘야함-->
      <aside class="fixed inset-y-0 z-20 flex-shrink-0 w-64 mt-16 overflow-y-auto bg-white dark:bg-gray-800"
        x-show="isSideMenuOpen" x-transition:enter="transition ease-in-out duration-150"
        x-transition:enter-start="opacity-0 transform -translate-x-[-20px]"
        x-transition:enter-end="opacity-100 transform translate-x-0"
        x-transition:leave="transition ease-in-out duration-150"
        x-transition:leave-start="opacity-100 transform translate-x-0"
        x-transition:leave-end="opacity-0 transform -translate-x-[-20px]" @click.away="closeSideMenu"
        @keydown.escape="closeSideMenu">
        <div class="py-4 text-gray-500 dark:text-gray-400">
          <a class="ml-6 text-lg font-bold text-gray-800 dark:text-gray-200" href="#">
             <img src="./assets/img/coin.png" class="coin"> 
             <br>
             <h1 class="coinnum">123 개</h1>
          </a>
          <br><br>
          <ul class="mt-6">
            <li class="relative px-6 py-3">
              <span class="absolute inset-y-0 left-0 w-1 bg-purple-600 rounded-tr-lg rounded-br-lg"
                aria-hidden="true"></span>
              <a class="inline-flex items-center w-full text-sm font-semibold text-gray-800 transition-colors duration-150 hover:text-gray-800 dark:hover:text-gray-200 dark:text-gray-100"
                href="/goMain">
                <img src="./assets/img/home.png" class="myicon">
                <span class="ml-4">홈</span>
              </a>
            </li>
          </ul>
          <ul>
            <li class="relative px-6 py-3">
              <a class="inline-flex items-center w-full text-sm font-semibold transition-colors duration-150 hover:text-gray-800 dark:hover:text-gray-200"
                href="/goRecList">
                <img src="./assets/img/recipem.png" class="myicon">
                <span class="ml-4">레시피</span>
              </a>
            </li>
            <li class="relative px-6 py-3">
              <a class="inline-flex items-center w-full text-sm font-semibold transition-colors duration-150 hover:text-gray-800 dark:hover:text-gray-200"
                href="/goCommunity">
                <img src="./assets/img/community.png" class="myicon">
                <span class="ml-4">커뮤니티</span>
              </a>
            </li>
            <li class="relative px-6 py-3">
              <a class="inline-flex items-center w-full text-sm font-semibold transition-colors duration-150 hover:text-gray-800 dark:hover:text-gray-200"
                href="/goMypage">
                <img src="./assets/img/mypage.png" class="myicon">
                <span class="ml-4">마이페이지</span>
              </a>
            </li>
            <li class="relative px-6 py-3">
              <a class="inline-flex items-center w-full text-sm font-semibold transition-colors duration-150 hover:text-gray-800 dark:hover:text-gray-200"
                href="/logout">
                <img src="./assets/img/logout.png" class="myicon">
                <span class="ml-4">로그아웃</span>
              </a>
            </li>

        </div>
      </aside>
      <div class="flex flex-col flex-1 w-full">
        <header class="z-10 py-2 bg-white">
          <div class="container flex items-center justify-between h-full px-6 mx-auto text-purple-600">
            <!-- Mobile hamburger button안에 md:hidden 지워야함-->
            <div class="flex items-center justify-center">
              <button class="p-1 mr-5 -ml-1 rounded-md focus:outline-none" @click="toggleSideMenu" aria-label="Menu">
                <svg class="w-6 h-6" aria-hidden="true" fill="currentColor" viewBox="0 0 20 20">
                  <path fill-rule="evenodd"
                    d="M3 5a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1zM3 10a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1zM3 15a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1z"
                    clip-rule="evenodd"></path>
                </svg>
              </button>
            </div>
            <div class="lg:mr-32" style="margin: auto;">
              <a href="/goMain">
                <img id="logo" src="./assets/img/logo.png" width="100px" height="100px" style="margin: auto;">
              </a>
            </div>

            <ul class="flex items-center flex-shrink-0 space-x-6">
              <!-- Profile menu -->
              <li class="relative">
                <button class="align-middle rounded-full focus:shadow-outline-purple focus:outline-none"
                  @click="toggleProfileMenu" @keydown.escape="closeProfileMenu" aria-label="Account"
                  aria-haspopup="true">
                  <img class="object-cover w-8 h-8 rounded-full"
                    src="https://images.unsplash.com/photo-1502378735452-bc7d86632805?ixlib=rb-0.3.5&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=200&fit=max&s=aa3a807e1bbdfd4364d1f449eaa96d82"
                    alt="" aria-hidden="true" />
                </button>
                <template x-if="isProfileMenuOpen">
                  <ul x-transition:leave="transition ease-in duration-150" x-transition:leave-start="opacity-100"
                    x-transition:leave-end="opacity-0" @click.away="closeProfileMenu" @keydown.escape="closeProfileMenu"
                    class="absolute right-0 w-56 p-2 mt-2 space-y-2 text-gray-600 bg-white border border-gray-100 rounded-md shadow-md dark:border-gray-700 dark:text-gray-300 dark:bg-gray-700"
                    aria-label="submenu">
                    <li class="flex">
                      <a class="inline-flex items-center w-full px-2 py-1 text-sm font-semibold transition-colors duration-150 rounded-md hover:bg-gray-100 hover:text-gray-800 dark:hover:bg-gray-800 dark:hover:text-gray-200"
                        href="/goMypage">
                        <img src="./assets/img/mypage.png" class="usericon">
                        <span class="mytext">마이페이지</span>
                      </a>
                    </li>
                    <li class="flex">
                      <a class="inline-flex items-center w-full px-2 py-1 text-sm font-semibold transition-colors duration-150 rounded-md hover:bg-gray-100 hover:text-gray-800 dark:hover:bg-gray-800 dark:hover:text-gray-200"
                        href="/logout">
                        <img src="./assets/img/logout.png" class="usericon">
                        <span class="mytext">로그아웃</span>
                      </a>
                    </li>
                  </ul>
                </template>
              </li>
            </ul>
          </div>
        </header>
      <main class="#"> <!--  class="h-full overflow-y-auto"  -->
        <div class="container px-6 mx-auto grid">
        <!-- search -->
      <div class="search">
            <form class="search-container" action="/boardSearch" method="post">
              <input type="text" class="search-bar" placeholder="검색어 입력" name="search">
              <a href="#"><img class="search-icon"
                  src="http://www.endlessicons.com/wp-content/uploads/2012/12/search-icon.png"></a>
            </form>
            <div>
            <a href="/goBoardForm"><img src="./assets/img/more.png" class="writeimg"></a>
          </div>
          </div>

         <!-- 피드 -->
            <p class="myfont">커뮤니티</p>
            <br>
            <section class="mycontainer">
              <c:forEach var="board" items="${board}" varStatus="status">
              <div class="card">
                <div class="card-header">
                  <div class="profile-img">
                    <a href="/goYourpage?custId=${board.custId}"> 
                    <img src="${userImg[status.index]}" class="profileimg">
                  </div>
                  <div class="profile-info">
                    <div class="name">
                      <p class="userid">${board.custId}</p>
                    </div>
                  </div>
                </div>
  
                <div class="content">
                  <img src="${board.rbImg}" width="100%" height="400" />
                </div>
  
                <div class="card-footer">
                  <c:if test="${likes.contains(board.rbIdx) }" >
                  <div class="likes" id="${board.rbIdx}">
                    <button class="likeBtn" data-status="unlike" value="${board.rbIdx}"><img src="./assets/img/redheart.png" class="likeimg"></button>
                    <p class="liketext">좋아요 ${likeCnt[status.index]}개</p>
                  </div>
                </c:if>
                <c:if test="${not likes.contains(board.rbIdx) }" >
                <div class="likes" id= "${board.rbIdx}">
                  <button class="likeBtn" data-status="like" value="${board.rbIdx}"><img src="./assets/img/heart.png" class="likeimg"></button>
                  <p class="liketext">좋아요 ${likeCnt[status.index]}개</p>
                </div>
              </c:if>
                  <br>
                  <div class="description">
                    <p class="context">${board.rbContent }</p>
                  </div>
                  <br><br>
                  <div class="comments">
                    <p class="username">wonseo</p>
                    <p class="usercomment">좋은 사진 감사합니다!</p>
                  </div>
                </div>
              </div>
            </c:forEach>
            </section>
            <br><br>
             
  </main>
  </div>
  </div>
</body>

<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<script type="text/javaScript">


$(document).ready(function(){
	  let page = 1; // 초기 페이지
	  let loading = false;
	  let stopControl = ${stop}; 
	  
	  console.log(stop);
	    function loadMoreData() {
	    	
	        if (loading) return; // 이미 로딩 중이면 중복 실행 방지
	        loading = true;
	        console.log(page);
	        $.ajax({
	            url: '/loadMoreBoard', // 데이터를 불러올 엔드포인트
	            type: 'GET',
	            data: { "page": page }, // 현재 페이지 정보를 서버에 전달
	            success: function(res) {
	            	var list = res.list;
					if (list.length === 0) {
	                	
	                    $(window).off('scroll', loadMoreData);
	                    return;
	                }
	            	console.log(res);
	            	

	                 // 'list'에 해당하는 데이터
	                var likes = res.likes; // 'likes'에 해당하는 데이터
	                var likeCnt = res.likeCnt;
	                var uImg =  res.userImg;
	                
	                
	                
	                
	                
	            	var container = $("#bbc");
	            	for (var i = 0; i < 10; i++) {
	            	    
	            		var card= "<div class='card'>";
	            	    card +=  "<div class='card-header'>";
	            	    card +=  "<div class='profile-img'>";
	            	    card +=  "<a href='/goYourpage?custId="+list[i].custId +"'>"; 
	            	    card +=  "<img src='" + uImg[i] + "' class='profileimg'></a>" ;
	            	    card +=  "</div>"; 
	            	    card +=  "<div class='profile-info'>"; 
	            	    card +=  "<div class='name'><p class='userid'>"+ list[i].custId +"</p></div></div>";
	            	 	card +=  "<div class='content'>"; 
	            	    card +=  "<img src='" + list[i].rbImg + "' width='100%' height='400' />" ;
	            	    card +=  "</div>" ;
	            	    card +=  "<div class='card-footer'>" ;
	            	    if (likes.includes(list[i].rbIdx)) {
	                        
	                        card += "<div class='likes' id='"+ list[i].rbIdx +"'>";	                       
	                        card += "<button class='likeBtn' data-status='unlike' value='" +list[i].rbIdx +"'>";
	                        card += "<img src='./assets/img/redheart.png' class='likeimg'>" +"</button>";
	                        card += "<p class='liketext'>좋아요" + likeCnt[i] + "개</p></div>"
	                    } else {
	                    	card += "<div class='likes' id='"+ list[i].rbIdx +"'>";	                       
	                        card += "<button class='likeBtn' data-status='like' value='" +list[i].rbIdx +"'>";
	                        card += "<img src='./assets/img/heart.png' class='likeimg'>" +"</button>";
	                        card += "<p class='liketext'>좋아요" + likeCnt[i] + "개</p></div>"	    	
	                    }
	            	    card += "<br><div class='description'><p class='context'>"+list[i].rbContent + "</p></div>"
	            	    card += "<br><br><div class='comments'><p class='username'>wonseo</p><p class='usercomment'>좋은사진감사합니다!</p></div></div></div>"
	            	    console.log("여기와1?");
	            	    container.append(card);
	            	}
	            	
	                
	            	
	                page++;
	                loading = false; // 다음 페이지로 이동
	                // 데이터를 화면에 추가하는 코드 작성
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
	            if(!stopControl){
	        	console.log("스크롤끝");
	        	loadMoreData();
	            }
	            
	            // 스크롤이 끝에 도달하면 새로운 데이터를 불러옴
	        }
	    });
	
	
	
	
	
   
    $(document).on('click', '.likeBtn', function(){
    
    	var rbIdx = parseInt($(this).val());
        var status = $(this).data('status');
        if (status === 'like') {
            // 좋아요 상태일 때 처리
            console.log("좋아요를 눌렀습니다!");
        } else if (status === 'unlike') {
            // 언라이크 상태일 때 처리
            console.log("언라이크를 눌렀습니다!");
        }
        $.ajax({
            type: "POST",
            url: "/likeUnlike",
            data: {
                rbidx: rbIdx,
                status: status
            },
            success: function(response) {
            	//json형식의 문자열을 보내서 Json 타입으로 변환
            	var res = JSON.parse(response);
                
            	var rbidx = res.rbidx;
                var status = res.status;
                var likeCount = res.likeCount;
                console.log(status);
                if(status === "like"){
                	console.log("여까지오냐?")
                	let div = $("#"+rbidx);
                	div.empty();               	
                	
                	let tr = "<button class='likeBtn' data-status='unlike' value='" + rbidx + "'><img src='./assets/img/redheart.png' class='likeimg'></button>";
                	tr += "<p class='liketext'>좋아요"+likeCount +"개</p>";
                	
                	div.append(tr);      		              	
                }else{
                	let div = $("#"+rbidx);
                	div.empty();
                	
                	let tr = "<button class='likeBtn' data-status='like' value='" + rbidx + "'><img src='./assets/img/heart.png' class='likeimg'></button>";
                	tr += "<p class='liketext'>좋아요"+likeCount +"개</p>";                	
                	div.append(tr);   
                	
                }
            	
                console.log("좋아요 정보가 성공적으로 전송되었습니다.");
            },
            error: function(error) {
                console.error("좋아요 정보 전송 중 오류가 발생했습니다.", error);
            }
        });
    });
});
</script>


</html>