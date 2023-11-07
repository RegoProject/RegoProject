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
 
  <link rel="stylesheet" href="./assets/css/regomypage_f.css" />

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
      <main class="h-full overflow-y-auto GyeonggiBatangfont">
        <div class="container px-6 mx-auto grid">
          <br>
            <br>

            <p class="myfont">마이페이지</p>
          <header>
           	
    		
            <div class="myContainer">
            <c:if test="${who eq 'you'}">
              <div class="profile">
                <div class="profile-image">
              
                <form id="uploadForm" enctype="multipart/form-data">
				<!-- 문제생기면 imagePath/ -->
    			
    			<img id="profilePhoto" src="imagePath/uploadedImage/profileImg/${user1.custImg}" alt="#" class="rounded-image">
    			<input type="file" name="file" id="fileInput" style="display: none;">
    			<input type="submit" value="Upload" style="display: none;">
				</form>                  
                </div>
                <div class="profile-user-settings">
                  <h1 class="profile-user-name" style="font-size:18px">${user1.custName}</h1> 
                 <c:if test="${choose eq 'yes' }">                             
       			 	<a href="#"><button class="btn profile-edit-btn followBtn" id="follow"  >팔로우</button></a>
       			 	<a href="#"><button class="btn profile-edit-btn followBtn" id="unfollow" style="display: none;" >팔로우취소</button></a>   			
    			 </c:if>
    			 <c:if test ="${choose eq 'no' }">
    			 	<a href="#"><button class="btn profile-edit-btn followBtn" id="follow" style="display: none;" >팔로우</button></a>
       			 	<a href="#"><button class="btn profile-edit-btn followBtn" id="unfollow" >팔로우취소</button></a>  
    			 </c:if>
                </div>
                <br>
                <div class="profile-stats">
                  <ul>
                    <li><span class="profile-stat-count">${boardCnt }</span> 게시글</li>
                    <li><span class="profile-stat-count">${follow }</span> 팔로워</li>
                    <li><span class="profile-stat-count">${following }</span> 팔로잉</li>
                  </ul>
                </div>
                <br>
                <div class="profile-bio">
                </div>
              </div>
            </c:if>
            <c:if test="${who eq 'my'}">
              <div class="profile">
                <div class="profile-image">
              
                <form id="uploadForm" enctype="multipart/form-data">
				<!-- 문제생기면 imagePath/ -->
    			
    			<img id="profilePhoto" src="/imagePath/uploadedImage/profileImg/${user.custImg}" alt="#" class="rounded-image">
    			<input type="file" name="file" id="fileInput" style="display: none;">
    			<input type="submit" value="Upload" style="display: none;">
				</form>                  
                </div>
                <div class="profile-user-settings">
                  <h1 class="profile-user-name" style="font-size:18px">${user.custName}</h1>  
                  <div class="profile-button">               
       			 <a href="/goUpdate"><button class="btn profile-edit-btn">회원정보수정</button></a>  			
    			</div>
                </div>
                <br>
                <div class="profile-stats">
                  <ul>
                    <li><span class="profile-stat-count">${boardCnt }</span> 게시글</li>
                    <li><span class="profile-stat-count">${follow }</span> 팔로워</li>
                    <li><span class="profile-stat-count">${following }</span> 팔로잉</li>
                  </ul>
                </div>
                <br>
                <div class="profile-bio">
                </div>
              </div>
            </c:if>
            </div>
         
          
            <!-- End of container -->
          </header>
          <main>
            <div class="mycontainer">
              <div class="gallery">
              <c:forEach var="board" items="${board}" varStatus="status">
                <div class="gallery-item" tabindex="0">
                 <a><img src="${board.rbImg}"></a>
                </div>
              </c:forEach>  
                
                <!-- End of gallery -->
              <!-- End of container -->
          </main>
        </div>
      </main>
    </div>
  </div>
  


</body>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>



<script>
$(document).ready(function() {
	
	
	$("#profilePhoto").click(function() {
		if(${who eq 'you'}){
			var src= $('#profilePhoto').attr('src');
			window.open('/imgPage?imgSrc='+src, '새 창 이름', 'width=800,height=600');
		}else{ 
			console.log("여기마이페이지입니다.");
        $("#fileInput").click(); // 파일 선택 창을 띄웁니다.
		} 
    });
	
    $(document).on('click', '.followBtn', function(){
    	
    	 
    	var action = $(this).text();
    	var custId = ${user1.custId};
    	
    	$.ajax({
    	        url: '/follow',
    	        type: 'POST',
    	        data: {"custId": custId  , "action" : action},
    	        success: function(response) {
    	                	            
                	if (response === "follow") {
                    	$("#follow").hide(); 
                    	$("#unfollow").show(); 
                	} else if (response === "unfollow") {
                    	$("#unfollow").hide(); 
                    	$("#follow").show(); // 팔로우 버튼을 표시합니다
               		}
            	
    	        },
    	        error: function(e) {
                    console.log("에러 발생");
                }
    	    });
        
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
            	console.log(res)
                setTimeout(function() {
                    window.location.reload();
                }, 2500);
            	// 다듬을때하기 -> 배포할때 업로드가 바로바로 돼서 바로 프로젝트가 새로고침되게끔 해야함
            },
            error: function(e) {
                console.log("에러 발생");
            }
        });
    });
});
</script>

</html>