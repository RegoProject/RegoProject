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
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.min.css" />
  <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.min.js" defer></script>
  <!-- <script src="jquery.min.js"></script> -->
  <link rel="stylesheet" href="/assets/css/community.css" />

  

</head>

<body>
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
      x-transition:enter-start="opacity-0 transform -translate-x-20" x-transition:enter-end="opacity-100"
      x-transition:leave="transition ease-in-out duration-150" x-transition:leave-start="opacity-100"
      x-transition:leave-end="opacity-0 transform -translate-x-20" @click.away="closeSideMenu"
      @keydown.escape="closeSideMenu">
      <div class="py-4 text-gray-500 dark:text-gray-400">
        <a class="ml-6 text-lg font-bold text-gray-800 dark:text-gray-200" href="#">
          Coin : (숫자) 개
        </a>
        <ul class="mt-6">
          <li class="relative px-6 py-3">
            <span class="absolute inset-y-0 left-0 w-1 bg-purple-600 rounded-tr-lg rounded-br-lg"
              aria-hidden="true"></span>
            <a class="inline-flex items-center w-full text-sm font-semibold text-gray-800 transition-colors duration-150 hover:text-gray-800 dark:hover:text-gray-200 dark:text-gray-100"
              href="/goMain">
              <svg class="w-5 h-5" aria-hidden="true" fill="none" stroke-linecap="round" stroke-linejoin="round"
                stroke-width="2" viewBox="0 0 24 24" stroke="currentColor">
                <path
                  d="M3 12l2-2m0 0l7-7 7 7M5 10v10a1 1 0 001 1h3m10-11l2 2m-2-2v10a1 1 0 01-1 1h-3m-6 0a1 1 0 001-1v-4a1 1 0 011-1h2a1 1 0 011 1v4a1 1 0 001 1m-6 0h6">
                </path>
              </svg>
              <span class="ml-4">홈</span>
            </a>
          </li>
        </ul>
        <ul>
          <li class="relative px-6 py-3">
            <a class="inline-flex items-center w-full text-sm font-semibold transition-colors duration-150 hover:text-gray-800 dark:hover:text-gray-200"
              href="/goRecList">
              <svg class="w-5 h-5" aria-hidden="true" fill="none" stroke-linecap="round" stroke-linejoin="round"
                stroke-width="2" viewBox="0 0 24 24" stroke="currentColor">
                <path
                  d="M9 5H7a2 2 0 00-2 2v12a2 2 0 002 2h10a2 2 0 002-2V7a2 2 0 00-2-2h-2M9 5a2 2 0 002 2h2a2 2 0 002-2M9 5a2 2 0 012-2h2a2 2 0 012 2m-3 7h3m-3 4h3m-6-4h.01M9 16h.01">
                </path>
              </svg>
              <span class="ml-4">레시피</span>
            </a>
          </li>
          <li class="relative px-6 py-3">
            <a class="inline-flex items-center w-full text-sm font-semibold transition-colors duration-150 hover:text-gray-800 dark:hover:text-gray-200"
              href="/goCommunity">
              <svg class="w-5 h-5" aria-hidden="true" fill="none" stroke-linecap="round" stroke-linejoin="round"
                stroke-width="2" viewBox="0 0 24 24" stroke="currentColor">
                <path
                  d="M19 11H5m14 0a2 2 0 012 2v6a2 2 0 01-2 2H5a2 2 0 01-2-2v-6a2 2 0 012-2m14 0V9a2 2 0 00-2-2M5 11V9a2 2 0 012-2m0 0V5a2 2 0 012-2h6a2 2 0 012 2v2M7 7h10">
                </path>
              </svg>
              <span class="ml-4">커뮤니티</span>
            </a>
          </li>
          <li class="relative px-6 py-3">
            <a class="inline-flex items-center w-full text-sm font-semibold transition-colors duration-150 hover:text-gray-800 dark:hover:text-gray-200"
              href="/goMypage">
              <svg class="w-5 h-5" aria-hidden="true" fill="none" stroke-linecap="round" stroke-linejoin="round"
                stroke-width="2" viewBox="0 0 24 24" stroke="currentColor">
                <path d="M11 3.055A9.001 9.001 0 1020.945 13H11V3.055z"></path>
                <path d="M20.488 9H15V3.512A9.025 9.025 0 0120.488 9z"></path>
              </svg>
              <span class="ml-4">마이페이지</span>
            </a>
          </li>
          <li class="relative px-6 py-3">
            <a class="inline-flex items-center w-full text-sm font-semibold transition-colors duration-150 hover:text-gray-800 dark:hover:text-gray-200"
              href="/logout">
              <svg class="w-5 h-5" aria-hidden="true" fill="none" stroke-linecap="round" stroke-linejoin="round"
                stroke-width="2" viewBox="0 0 24 24" stroke="currentColor">
                <path d="M11 3.055A9.001 9.001 0 1020.945 13H11V3.055z"></path>
                <path d="M20.488 9H15V3.512A9.025 9.025 0 0120.488 9z"></path>
              </svg>
              <span class="ml-4">로그아웃</span>
            </a>
          </li>

      </div>
    </aside>
    <div class="flex flex-col flex-1 w-full">
      <header class="z-10 py-4 bg-white shadow-md dark:bg-gray-800">
        <div
          class="container flex items-center justify-between h-full px-6 mx-auto text-purple-600 dark:text-purple-300">
          <!-- Mobile hamburger button안에 md:hidden 지워야함-->
          <button class="p-1 mr-5 -ml-1 rounded-md focus:outline-none" @click="toggleSideMenu" aria-label="Menu">
            <svg class="w-6 h-6" aria-hidden="true" fill="currentColor" viewBox="0 0 20 20">
              <path fill-rule="evenodd"
                d="M3 5a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1zM3 10a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1zM3 15a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1z"
                clip-rule="evenodd"></path>
            </svg>
          </button>

          <div class="flex justify-center flex-1 lg:mr-32">

            <a href="/goMain">

              <img id="logo" src="./assets/img/regoJJIN.png" width="80px" height="80px" style="margin: auto;">

             

            </a>

          </div>
          <ul class="flex items-center flex-shrink-0 space-x-6">
            <!-- Theme toggler -->
            <li class="flex">
              <button class="rounded-md focus:outline-none" @click="toggleTheme" aria-label="Toggle color mode">
                <template x-if="!dark">
                  <svg class="w-5 h-5" aria-hidden="true" fill="currentColor" viewBox="0 0 20 20">
                    <path d="M17.293 13.293A8 8 0 016.707 2.707a8.001 8.001 0 1010.586 10.586z"></path>
                  </svg>
                </template>
                <template x-if="dark">
                  <svg class="w-5 h-5" aria-hidden="true" fill="currentColor" viewBox="0 0 20 20">
                    <path fill-rule="evenodd"
                      d="M10 2a1 1 0 011 1v1a1 1 0 11-2 0V3a1 1 0 011-1zm4 8a4 4 0 11-8 0 4 4 0 018 0zm-.464 4.95l.707.707a1 1 0 001.414-1.414l-.707-.707a1 1 0 00-1.414 1.414zm2.12-10.607a1 1 0 010 1.414l-.706.707a1 1 0 11-1.414-1.414l.707-.707a1 1 0 011.414 0zM17 11a1 1 0 100-2h-1a1 1 0 100 2h1zm-7 4a1 1 0 011 1v1a1 1 0 11-2 0v-1a1 1 0 011-1zM5.05 6.464A1 1 0 106.465 5.05l-.708-.707a1 1 0 00-1.414 1.414l.707.707zm1.414 8.486l-.707.707a1 1 0 01-1.414-1.414l.707-.707a1 1 0 011.414 1.414zM4 11a1 1 0 100-2H3a1 1 0 000 2h1z"
                      clip-rule="evenodd"></path>
                  </svg>
                </template>
              </button>
            </li>
            <!-- Profile menu -->
            <li class="relative">
              <button class="align-middle rounded-full focus:shadow-outline-purple focus:outline-none"
                @click="toggleProfileMenu" @keydown.escape="closeProfileMenu" aria-label="Account" aria-haspopup="true">
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
                      <svg class="w-4 h-4 mr-3" aria-hidden="true" fill="none" stroke-linecap="round"
                        stroke-linejoin="round" stroke-width="2" viewBox="0 0 24 24" stroke="currentColor">
                        <path
                          d="M11 16l-4-4m0 0l4-4m-4 4h14m-5 4v1a3 3 0 01-3 3H6a3 3 0 01-3-3V7a3 3 0 013-3h7a3 3 0 013 3v1">
                        </path>
                      </svg>
                      <span>마이페이지</span>
                    </a>
                  </li>
                  <li class="flex">
                    <a class="inline-flex items-center w-full px-2 py-1 text-sm font-semibold transition-colors duration-150 rounded-md hover:bg-gray-100 hover:text-gray-800 dark:hover:bg-gray-800 dark:hover:text-gray-200"
                      href="/logout">
                      <svg class="w-4 h-4 mr-3" aria-hidden="true" fill="none" stroke-linecap="round"
                        stroke-linejoin="round" stroke-width="2" viewBox="0 0 24 24" stroke="currentColor">
                        <path
                          d="M11 16l-4-4m0 0l4-4m-4 4h14m-5 4v1a3 3 0 01-3 3H6a3 3 0 01-3-3V7a3 3 0 013-3h7a3 3 0 013 3v1">
                        </path>
                      </svg>
                      <span>로그아웃</span>
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
          <br><br>

          <!-- 여기서부터 코드 추가 되었음 -->
          <!-- search -->
          <input class="search" type="text" placeholder="검색어 입력">
          <button>
            <img src="./assets/img/search_black.png" class="searchimg">
          </button>
          <br>
          <!-- 커뮤니티 피드 -->
          <section class="container" id="bbc">
          <c:forEach var="board" items="${board}" varStatus="status">
            <div class="card">
              <div class="card-header">
                <div class="profile-img">
                  <a href="/goMypage?custId=${board.custId}"> 
                  <img src="${userImg[status.index]}" class="profileimg">
                  </a>
                </div>
                <div class="profile-info">
                  <div class="name"><p class="userid">${board.custId}</p></div>
                </div>
              </div>
        
              <div class="content">
                <img src="${board.rbImg}" width="100%" height="400" />
              </div>
        
              <div class="card-footer">
              <c:if test="${likes.contains(board.rbIdx) }" >
                <div class="likes" id= "${board.rbIdx}">
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
        </div>
    </div>
  </div>
  </main>
  </div>
  </div>
</body>

<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<script type="text/javaScript">


$(document).ready(function(){
	  let page = 1; // 초기 페이지
	  let loading = false;

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
	            	    card +=  "<a href='/goMypage?custId="+list[i].custId +"'>"; 
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
	            console.log("스크롤끝");
	        	loadMoreData(); // 스크롤이 끝에 도달하면 새로운 데이터를 불러옴
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