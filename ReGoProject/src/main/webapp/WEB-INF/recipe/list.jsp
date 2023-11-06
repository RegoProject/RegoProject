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
	<link rel="stylesheet" href="./assets/css/regorecipe_f.css" />

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
             <h1 class="coinnum">${user.custCoin }개</h1>
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
       <main class="#">
          <div class="container px-6 mx-auto grid">

            <br>
            <br>
            <div class="search">
            <form class="search-container" action="#">
              <input type="text" class="search-bar" placeholder="검색어 입력">
              <a href="#"><img class="search-icon"
                  src="http://www.endlessicons.com/wp-content/uploads/2012/12/search-icon.png"></a>
            </form>
          </div>
        
          
          
          
            <p class="myfont">레시피</p>
            <br>
            <div class="grid-container" id="rcp_list">
            
                   <c:choose>
    <c:when test="${empty recipe}">
        <div class="#">검색 결과가 없습니다.</div>
    </c:when>
    <c:otherwise>
        <c:forEach var="recipe" items="${recipe}">
            <div class="addItem4" style="display:inline-block" >
                <a href="/goRecView?rcpIdx=${recipe.rcpIdx}">
                    <img class="recipeImg" src="/recipe/${recipe.rcpImg1}">
                    <p class="title">${recipe.rcpName}</p>
                </a>
                <br>
                <div class="flex-row display:inline-block;">
                    <img src="/assets/img/star_gray.png" class="dimg">
                    <p class="Difficulty">${recipe.rcpLevel }</p>
                    <div class="flex-row display:inline-block;">
                        <img src="/assets/img/clock_gray.png" class="timg">
                        <p class="time">${recipe.rcpTime }</p>
                    </div>
                </div>
            </div>
        </c:forEach>
    </c:otherwise>
</c:choose>
             	  
          </div>
        </div> 
    </div>
    </main>
  </div>
  </div>



</body>
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
 <script src="./assets/js/regorecipe_f.js"></script>
<script type="text/javaScript">

$(document).ready(function() {
	console.log("여기는오나요")
    let page = 2; // 초기 페이지
    let stopControl =${stop}; 
    let loading = false;
    console.log(stopControl);    

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
                    tr += "<img class='recipeImg' src='/recipe/" + data[i].rcpImg1 + "' alt='#'>";
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
    	   if(stopControl){
               loadMoreData();
           }
        }
    });
});
</script>
</html>