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
  <script src="/assets/js/init-alpine.js"></script>
  <script src="/assets/js/focus-trap.js"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.min.css" />
  <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.min.js" defer></script>
  <link rel="stylesheet" href="./assets/css/regorecipedetails_f.css" />
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
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
      <main class="h-full overflow-y-auto">
         <div class="container px-6 mx-auto grid">

            <br>
            <button>
              <img src="./assets/img/left.png" class="backBtn">
            </button>
            <p class="myfont">상세 레시피</p>
            <br>
            <header class="flexitem">
              <div class="container">
    
              
              <br>
              <div class="videocon">
                <video playsinline="" controls=""
                  poster="https://static.wtable.co.kr/image/production/service/recipe/1923/f513c7bf-0572-475c-95b7-b98771ab7618.jpg?size=890x500"
                  src="https://video.wtable.co.kr/video/production/service/recipe/1923/886fe196-6697-42c8-851d-d7e01967e80d.mp4">
                  <source
                    src="https://video.wtable.co.kr/video/production/service/recipe/1923/886fe196-6697-42c8-851d-d7e01967e80d.mp4"
                    type="video/mp4" style="margin: auto;" class="videorcp">
                </video>
                <source
                  src="https://video.wtable.co.kr/video/production/service/recipe/1923/886fe196-6697-42c8-851d-d7e01967e80d.mp4"
                  type="video/mp4">
              </div>
              <br><br>
              <div class="rcpcontent">
                <h2 class="rcptitle">${recipe.rcpName}</h2>
                <br>

                <p class="rcpd">난이도  :  ${recipe.rcpLevel }</p>
                <p class="rcpt">소요시간  : ${recipe.rcpTime }</p>

                

              </div>
              <br>
              <div class="rcpm flex-container">
                <h5 class="rcpmt">재료</h5>
                <button><img src="/assets/img/caution.png" class="smimg"></button>
              </div>
              <br>
              <div class="rcping"></div>
              <!-- 슬라이싱 작업만 남았어용 -->
              <p class="basic"><c:out value="${ingreJson}" /></p>
              
              <br>
              <div class="rcpm flex-container">
                <h5 class="rcpmt">조미료</h5>
                <button><img src="/assets/img/caution.png" class="smimg"></button>
              </div>
              <br>
              <div class="rcping"></div>
              <!-- 슬라이싱 작업만 남았어용 -->
              <p class="basic"><c:out value="${msgJson}" /></p>
              
            </div>
            
            
            
            <br><br>
            <div class="rcpm flex-container">
              <h5 class="rcpmt">레시피</h5>
            </div>

            <br>
            <div class="rcping"></div>
            

            <!-- 슬라이싱 작업만 남았어용 -->
            <!-- 조리순서 반복문 어떤것 기준으로 순서를 슬라이싱 할지 모르겠음-->
            <c:forEach var="content" items="${content}">
            <p class="rcpstep">${content }</p>
			</c:forEach>

          </div>
          <br><br><br>
          <!-- 요리성공 api 관련 html 코드 추가 -->
        <br><br><br><br><br>
        <c:if test="${YorN eq 'no' }">
        <p class="foodcom">👨‍🍳 완성 사진을 올려보세요!</p>
        <br>
        <form id =uploadForm  method="post" enctype="multipart/form-data">
        <div>
          <input type="file" name="file" id="file">
          <input type="hidden" name="recipe" value= "${recipe.rcpName}" >
          <br><br><br><br><br>
        </div>
        <div class="foodsub">
            <button class="filesub">제출</button>
        </div>
        </form>
        </c:if>
        
        <br><br><br><br>
         </div>
        </header>
        </div>
      </main>
    </div>
  </div>
</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
$(document).ready(function() {
   // $("#profilePhoto").click(function() {
   //     $("#fileInput").click(); // 파일 선택 창을 띄웁니다.
   // });

   // $("#fileInput").change(function() { // 파일이 선택되면 자동으로 submit 합니다.
   //     $("#uploadForm").submit();
   // });

    $("#uploadForm").submit(function(event) {
        event.preventDefault();
        var formData = new FormData(this);
        
        $.ajax({
            url: "/recSuccess",
            type: "POST",
            data: formData,
            contentType: false,
            processData: false,
            success: function(res) {
            	console.log(res)
            	if(res==="true"){
            		if (confirm(`요리성공! 100코인지급되었습니다! 메인페이지로 이동하시겠습니까?`)) {
            	        window.location.href = "/recipeSuccess?rcpIdx="+${recipe.rcpIdx}; // mypage로 이동
            	    }
            		
            	}else{
            		
            		alert("요리실패!");
            		
            	}
            	
            	
                
            },
            error: function(e) {
                console.log("에러 발생");
            }
        });
    });
});
</script>

</html>