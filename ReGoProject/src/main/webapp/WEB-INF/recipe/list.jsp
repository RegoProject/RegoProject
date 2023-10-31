<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html :class="{ 'theme-dark': dark }" x-data="data()" lang="en">
<head>
	<meta charset="UTF-8">
	<!-- 이거 절대빼먹으면 안돼요 !! -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<!-- 이거 절대빼먹으면 안돼요 !! -->
	<title>Insert title here</title>
	<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap" rel="stylesheet" />
	<script src="https://cdn.jsdelivr.net/gh/alpinejs/alpine@v2.x.x/dist/alpine.min.js" defer></script>
	<script src="/assets/js/init-alpine.js"></script>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.min.css" />
	<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.min.js" defer></script>
	<!--  <script src="jquery.min.js"></script> -->
	<link rel="stylesheet" href="/assets/css/recipe.css" />

</head>

  
<body>

<!-- <a href="/goMain">메인</a> -->
<!--  <c:forEach var="recipe" items="${recipe}">
   <li>
      <a href="/?prod_seq=${products.prod_seq}" class="image_container">
      <img class="hover_image" src="${products.prod_img}" alt="랄로!?">
      </a>
      <div><span>${products.prod_name}</span></div>
      <div><strong>${products.prod_price}원</strong></div>
   </li>
</c:forEach>
-->
  <div class="flex h-screen bg-gray-50 dark:bg-gray-900" :class="{ 'overflow-hidden': isSideMenuOpen }">
    <!-- Backdrop -->
    <div x-show="isSideMenuOpen" x-transition:enter="transition ease-in-out duration-150"
      x-transition:enter-start="opacity-0" x-transition:enter-end="opacity-100"
      x-transition:leave="transition ease-in-out duration-150" x-transition:leave-start="opacity-100"
      x-transition:leave-end="opacity-0"
      class="fixed inset-0 z-10 flex items-end bg-black bg-opacity-50 sm:items-center sm:justify-center"></div>
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
    <div class="flex flex-col flex-1 w-full ">
      <header class="z-10 py-4 bg-white shadow-md dark:bg-gray-800">
        <div
          class="container flex items-center justify-between h-full px-6 mx-auto text-purple-600 dark:text-purple-300">
          <button class="p-1 mr-5 -ml-1 rounded-md focus:outline-none" @click="toggleSideMenu" aria-label="Menu">
            <svg class="w-6 h-6" aria-hidden="true" fill="currentColor" viewBox="0 0 20 20">
              <path fill-rule="evenodd"
                d="M3 5a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1zM3 10a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1zM3 15a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1z"
                clip-rule="evenodd"></path>
            </svg>
          </button>

          <div class="flex justify-center flex-1 lg:mr-32">
            <div></div>
            <a href="/goMain">
              <img id="logo" src="/assets/img/regoLogo.png" width="80px" height="80px" style="margin: auto;">
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
                <!-- 프로필 영역인데 custImg가 null이면 기본이미지 나오게 , 아니면 본인 이미지 나오게 처리 해줘야함 ${custImg ne null}  -->
                <img class="object-cover w-8 h-8 rounded-full"
                  src="/assets/img/login/defaultProfileImg.png" 
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
      <main class="#"> <!--  h-full overflow-y-auto -->
        <br><br>
        <div class="container px-6 mx-auto grid"> <!-- grid이후부터 flex-container margin:auto 삭제해봄 : 해봤는데 문제가 아니어서 되돌려놈..-->
        
        
        
          <div class="grid-container" id="rcp_list">
          
          <!-- 반복문 돌리는곳  -->
          <!--  <div class="addItem4" style="display:inline-block">
              <a href="#">
                <img class="recipeImg" src="/assets/img/dduk.jpg">
                <p class="title">떡볶이</p>
                <br>
                <div class="flex-row display:inline-block;">
                  <img src="/assets/img/star_gray.png" class="dimg">
                  <p class="Difficulty">난이도</p>
                  <div class="flex-row display:inline-block;">
                    <img src="/assets/img/clock_gray.png" class="timg">
                    <p class="time">시간</p>
                  </div>
                </div>
              </a>
            </div>
           -->
           
            
           
            
            <!-- 반복문 돌리는곳  -->

            
            <c:forEach var="recipe" items="${recipe}">
            	<div class="addItem4" style="display:inline-block" >
            		<a href="/goRecView?rcpIdx=${recipe.rcpIdx}">
            		<!-- 이미지 경로는 imagePath/uploadedImage/ 이하폴더로 해주세요
            		imagePath/uploadedImage/food/${recipe.rcpImg1} (배포용)
            			테스트는 아무데서나 해도됩니다. -->
                		<img class="recipeImg" src="/assets/img/dduk.jpg">
                		<p class="title">${recipe.rcpName}</p>
              		</a>
                	<br>
                	<div class="flex-row display:inline-block;">
                  		<img src="/assets/img/star_gray.png" class="dimg">
                 	 	<p class="Difficulty">난이도</p>
                  		<div class="flex-row display:inline-block;">
                    		<img src="/assets/img/clock_gray.png" class="timg">
                    		<p class="time">시간</p>
                 		</div>
               		</div>
               	</div>
               
               	</c:forEach>
             	
            
            



          </div>
        </div> 
    </div>
    </main>
  </div>
  </div>



</body>
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<script type="text/javaScript">

$(document).ready(function() {
	console.log("여기는오나요")
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
            	console.log("여기는오나요2")
                if (data.length === 0) {
                    // 더 이상 데이터가 없으면 무한 스크롤 중지
                    $(window).off('scroll', loadMoreData);
                    return;
                }
                console.log(data);
                let ul = $('#rcp_list');
                 // tr 변수를 초기화
                for (let i = 0; i < data.length; i++) {
                	let tr = "<div class='addItem4' style='display:inline-block' >";
                    tr += "<a href='/goRecView?rcpIdx=" + data[i].rcpIdx + "'>";
                    tr += "<img class='recipeImg' src='imagePath/uploadedImage/food/" + data[i].rcpImg1 + "' alt='#'>";
                    tr += "<p class='title'>" + data[i].rcpName + "</p>";
                    tr += "</a> ";
                    tr += "<br>";
                    tr += "<div class='flex-row display:inline-block'>";
                    tr += "<img src='/assets/img/star_gray.png' class='dimg'>";
                    tr += "<p class='Difficulty'>난이도</p>";
                    tr += "<div class='flex-row display:inline-block'>";
                    tr += "<img src='/assets/img/clock_gray.png' class='timg'>";
                    tr += "<p class='time'>시간</p>";
                    tr += "</div>";
                    tr += "</div>";
                    tr += "</div>";
                    ul.append(tr);
                }
                
                page++;
                loading = false; // 다음 페이지로 이동
            },
            error: function() {
                alert('데이터를 불러오는데 실패했습니다.');
                loading = false;
            }
        });
    }

    // 스크롤 이벤트를 감지하여 무한 스크롤 동작
    $(window).scroll(function() {
    	console.log("스크롤오나요")
       if ($(window).scrollTop() + $(window).height() >= $(document).height() - 100) {
            loadMoreData(); // 스크롤이 끝에 도달하면 새로운 데이터를 불러옴
        }
    });
});
</script>
</html>