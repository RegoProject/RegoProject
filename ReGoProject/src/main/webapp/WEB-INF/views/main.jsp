<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html :class="{ 'theme-dark': dark }" x-data="data()" lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>REGO HOME</title>

<script src="/assets/js/focus-trap.js"></script>
<script src="/assets/js/slide.js" defer></script>
<link
	href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap"
	rel="stylesheet" />

<link rel="stylesheet" href="/assets/css/homeCopy.css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.min.css" />
<!--폰트어썸 라이브러리 / 체크박스용 라이브러리-->
<link rel="stylesheet" href="/assets/css/checkbox.css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css">
	<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.min.js"
	defer></script>
    <script src="https://cdn.jsdelivr.net/gh/alpinejs/alpine@v2.x.x/dist/alpine.min.js" defer></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
   <link rel="stylesheet" href="/assets/css/regomain_f.css" />
   <script src="/assets/js/regomain_f.js"></script>

	


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
        <div class="GyeonggiBatangfont py-4 text-gray-500 dark:text-gray-400">
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
            <br><br>

            <div class="slideshow-container">
              <div class="mySlides fade">
                <div class="slidT2">
                </div>
                <img class="simg" src="./assets/img/food2.jpg" style="width:100%">
              </div>



            </div>
             
            <!-- <div style="text-align:center">
              <span class="dot"></span>
              <span class="dot"></span>
              <span class="dot"></span>
              <span class="dot"></span>
            </div>  --> 
            <br>
            <div class="foodtext">
              <p class="myrg">나의 냉장고</p>
            </div>
            <br>
            <div class="food">
              <div>
                <a href="/goMyIngreList">
                  <div class="Seasoning" style="display:inline-block">
                    <div>
                      <img id="igd" src="./assets/img/fooddonation.png">
                    </div>
                    <br>
                    <p class="font">식재료</p>
                  </div>
                </a>
                <a href="/goMyMsgList">
                  <div class="ingredient" style="display:inline-block">
                    <div>
                      <img id="ss" src="./assets/img/Seasoning.png">
                    </div>
                    <br>
                    <p class="font">조미료</p>
                  </div>
                </a>
              </div>
              <div>
                <br>
                <div class="foodtext">
                  <p class="myrg">레시피</p>
                </div>
                <br>
                <div class="food">
                  <div>
                    <a href="/goRecommendList">
                      <div class="recipeRc" style="display:inline-block">
                        <div>
                          <img id="igd" src="./assets/img/recipe.png">
                        </div>
                        <br>
                        <p class="font">레시피추천</p>
                    </a>
                  </div>
                  <a href="#">
                    <div @click="openModal" class="ingIcon" style="display:inline-block">
                      <div>
                        <img id="ss" src="./assets/img/add.png">
                      </div>
                      <br>
                      <p class="font">항목추가</p>
                    </div>
                  </a>
                  <div>
                    <br><br>
                  </div>
                </div>
              </div>
            </div>
          </div>
      </div>
      </main>
    </div>
  </div>


	<!-- homecopy랑 css 연관됨 -->
	<!-- Modal backdrop. This what you want to place close to the closing body tag -->
	
	<div x-show="isModalOpen" 
		x-transition:enter="transition ease-out duration-150"
		x-transition:enter-start="opacity-0"
		x-transition:enter-end="opacity-100"
		x-transition:leave="transition ease-in duration-150"
		x-transition:leave-start="opacity-100"
		x-transition:leave-end="opacity-0"
		class="fixed inset-0 z-30 flex items-end bg-black bg-opacity-50 sm:items-center sm:justify-center">
		<!-- Modal -->
		<div x-show="isModalOpen"
			x-transition:enter="transition ease-out duration-150"
			x-transition:enter-start="opacity-0 transform translate-y-1/2"
			x-transition:enter-end="opacity-100"
			x-transition:leave="transition ease-in duration-150"
			x-transition:leave-start="opacity-100"
			x-transition:leave-end="opacity-0  transform translate-y-1/2"
			@click.away="" @keydown.escape="closeModal"
			class="w-full px-6 py-4 overflow-hidden bg-white rounded-t-lg dark:bg-gray-800 sm:rounded-lg sm:m-4 sm:max-w-xl"
			role="dialog" id="modal">

			<!-- Remove header if you don't want a close icon. Use modal body to place modal tile. -->
			<header class="flex justify-end">
				<button
					class="inline-flex items-center justify-center w-6 h-6 text-gray-400 transition-colors duration-150 rounded dark:hover:text-gray-200 hover: hover:text-gray-700"
					aria-label="close" @click="closeModal">
					<svg class="w-4 h-4" fill="currentColor" viewBox="0 0 20 20"
						role="img" aria-hidden="true">
              <path
							d="M4.293 4.293a1 1 0 011.414 0L10 8.586l4.293-4.293a1 1 0 111.414 1.414L11.414 10l4.293 4.293a1 1 0 01-1.414 1.414L10 11.414l-4.293 4.293a1 1 0 01-1.414-1.414L8.586 10 4.293 5.707a1 1 0 010-1.414z"
							clip-rule="evenodd" fill-rule="evenodd"></path>
            </svg>
				</button>
			</header>
			<!-- Modal body -->
			<div class="mt-4 mb-6 GyeonggiBatangfont">
				<!-- Modal title -->
				<p
					class="mb-2 text-lg font-semibold text-gray-700 dark:text-gray-300 ">
					재료 조미료 추가</p>
				<!-- Modal description -->
				<p class="text-sm text-gray-700 dark:text-gray-400">재료와 조미료를 추가하는 기능입니다.</p>
			</div>


			<div class="mt-4 mb-6 text-center GyeonggiBatangfont">
				<h2 class="subtitle">재료</h2>

				<!-- 사진으로 추가하는 태그 -->
				<div class="GyeonggiBatangfont">
					<input type="file" id="addIngreFile" style="display: none;">
					<button id="uploadButton"
						class="h-12 text-sm font-medium leading-5 text-white transition-colors duration-150 bg-purple-600 border border-transparent rounded-lg sm:w-auto sm:px-4 sm:py-2 active:bg-purple-600 hover:bg-purple-700 focus:outline-none focus:shadow-outline-purple"
						style="box-sizing: border-box; left: 0;">사진 업로드</button>
						<div id="ingreAPIloadingModal" class="addModal">
					    <div class="modal-content">
					        <p>잠시만 기다려 주세요...</p>
					    </div>
					    </div>
					    
					    <div id="ingreAPIModal" class="addModal" >
					    <div class="w-full modal-content">
						<div class="mt-4 text-center">
							<ul id="ingreResponeList" class=""></ul>
							
							</div>
						
								<div class="mt-4 pl-1_5">
								<button id="sendAPIResult"
										class="w-full h-12 text-sm font-medium leading-5 text-white transition-colors duration-150 bg-purple-600 border border-transparent rounded-lg sm:w-full sm:px-4 sm:py-2 active:bg-purple-600 hover:bg-purple-700 focus:outline-none focus:shadow-outline-purple"
										>적용</button>
									<button id="cancleIngreAPIModal"
										class="w-full h-12 text-sm font-medium leading-5 text-white text-gray-700 transition-colors duration-150 border border-gray-300 rounded-lg dark:text-gray-400 sm:px-4 sm:py-2 sm:w-auto active:bg-transparent hover:border-gray-500 focus:border-gray-500 active:text-gray-500 focus:outline-none focus:shadow-outline-gray"
										>취소</button>
								</div>
								    </div>
								    <!-- height 100 ,width 64% -->
				
					     </div>
					

				
				<!-- 글자로 추가하는 태그 -->
					<div class="mt-4 text-center">
						<input id="ingreName" name="ingreName" @click="openSecModal" class="h-12 searchModal"
							value="" style="left: 0;" placeholder="재료를 검색해주세요.">
						<ul id="searchList" class=""></ul>
      						
					 
					</div>



				<div class="mt-4">
					<h2 class="subtitle">조미료</h2>
					<div class="mt-4">
						<button @click="openTrdModal"
							class="w-full h-12 text-sm font-medium leading-5 text-white transition-colors duration-150 bg-purple-600 border border-transparent rounded-lg sm:w-full sm:px-4 sm:py-2 active:bg-purple-600 hover:bg-purple-700 focus:outline-none focus:shadow-outline-purple"
							id="msgAdd">조미료추가</button>

					</div>
					<div class="mt-4">
						<button id="cancleModal" @click="closeModal"
							class="w-full h-12 text-sm font-medium leading-5 text-white text-gray-700 transition-colors duration-150 border border-gray-300 rounded-lg dark:text-gray-400 sm:px-4 sm:py-2 sm:w-auto active:bg-transparent hover:border-gray-500 focus:border-gray-500 active:text-gray-500 focus:outline-none focus:shadow-outline-gray"
							>취소</button>
					</div>
				</div>
			</div>
					<div
					  x-show="isSecModalOpen"
					  x-transition:enter="transition ease-out duration-150"
					  x-transition:enter-start="opacity-0 transform translate-y-1/2"
					  x-transition:enter-end="opacity-100"
					  x-transition:leave="transition ease-in duration-150"
					  x-transition:leave-start="opacity-100"
					  x-transition:leave-end="opacity-0 transform translate-y-1/2"
					  class="fixed inset-0 z-40 flex items-end bg-black bg-opacity-50 sm:items-center sm:justify-center"
					>
					
					      <div
					        x-show="isSecModalOpen"
					        x-transition:enter="transition ease-out duration-150"
					        x-transition:enter-start="opacity-0 transform translate-y-1/2"
					        x-transition:enter-end="opacity-100"
					        x-transition:leave="transition ease-in duration-150"
					        x-transition:leave-start="opacity-100"
					        x-transition:leave-end="opacity-0  transform translate-y-1/2"
					        @click.away=""
					        @keydown.escape="closeSecModal"
					        class="w-full px-6 py-4 overflow-hidden bg-white rounded-t-lg dark:bg-gray-800 sm:rounded-lg sm:m-4 sm:max-w-xl"
					        role="dialog"
					        id="secModal"
					      >
					      
					     
					<header class="flex justify-end">
				<button
					class="inline-flex items-center justify-center w-6 h-6 text-gray-400 transition-colors duration-150 rounded dark:hover:text-gray-200 hover: hover:text-gray-700"
					aria-label="close" @click="closeModal">
					<svg class="w-4 h-4" fill="currentColor" viewBox="0 0 20 20"
						role="img" aria-hidden="true">
              <path
							d="M4.293 4.293a1 1 0 011.414 0L10 8.586l4.293-4.293a1 1 0 111.414 1.414L11.414 10l4.293 4.293a1 1 0 01-1.414 1.414L10 11.414l-4.293 4.293a1 1 0 01-1.414-1.414L8.586 10 4.293 5.707a1 1 0 010-1.414z"
							clip-rule="evenodd" fill-rule="evenodd"></path>
            </svg>
				</button>
				
			</header>
			<div class="mt-4">
				<input id="ingreName2" name="ingreName"class="h-12 searchModal"
							value="" style="left: 0;" placeholder="재료를 검색해주세요.">
							<ul id="searchList2" class=""></ul>
					<div id="cart">
					   	 <h3>장바구니</h3>
					    <ul id="cartList"></ul>
					</div>
				</div>
			
					<div class="mt-4">
					<button id="secModalSubmitBtn" 
							class="w-full h-12 text-sm font-medium leading-5 text-white transition-colors duration-150 bg-purple-600 border border-transparent rounded-lg sm:w-full sm:px-4 sm:py-2 active:bg-purple-600 hover:bg-purple-700 focus:outline-none focus:shadow-outline-purple submitBtn"
							>적용</button>
						<button id="cancleSecModal" @click="closeSecModal"
							class="w-full h-12 text-sm font-medium leading-5 text-white text-gray-700 transition-colors duration-150 border border-gray-300 rounded-lg dark:text-gray-400 sm:px-4 sm:py-2 sm:w-auto active:bg-transparent hover:border-gray-500 focus:border-gray-500 active:text-gray-500 focus:outline-none focus:shadow-outline-gray cancleBtn"
							>취소</button>
					</div>
					 </div>

					 
				</div>

			<div x-show="isTrdModalOpen"
				x-transition:enter="transition ease-out duration-150"
				x-transition:enter-start="opacity-0 transform translate-y-1/2"
				x-transition:enter-end="opacity-100"
				x-transition:leave="transition ease-in duration-150"
				x-transition:leave-start="opacity-100"
				x-transition:leave-end="opacity-0 transform translate-y-1/2"
				class="fixed inset-0 z-50 flex items-end bg-black bg-opacity-50 sm:items-center sm:justify-center">
				<!-- 세 번째 모달 내용 -->
				
				<div x-show="isTrdModalOpen"
					x-transition:enter="transition ease-out duration-150"
					x-transition:enter-start="opacity-0 transform translate-y-1/2"
					x-transition:enter-end="opacity-100"
					x-transition:leave="transition ease-in duration-150"
					x-transition:leave-start="opacity-100"
					x-transition:leave-end="opacity-0  transform translate-y-1/2"
					@click.away="" @keydown.escape="closeTrdModal"
					class="w-full px-6 py-4 overflow-hidden bg-white rounded-t-lg dark:bg-gray-800 sm:rounded-lg sm:m-4 sm:max-w-xl"
					role="dialog" id="trdModal">
					<!-- 조미료 추가(trdModal) 버튼 -->
					
		
					<div class="GyeonggiBatangfont pl-5 checkContainer text-center">
					<h2>조미료 추가입니다.</h2>
						<ul class="ks-cboxtags">
							<!-- value 는 조미료 카테고리의 인덱스 값입니다. -->
							<li><input type="checkbox" id="checkbox1" value="1" name="msgIdx">		<label for="checkbox1">간장</label></li>
							<li><input type="checkbox" id="checkbox2" value="2" name="msgIdx">		<label for="checkbox2">소금</label></li>
							<li><input type="checkbox" id="checkbox3" value="3" name="msgIdx">		<label for="checkbox3">참기름</label></li>
							<li><input type="checkbox" id="checkbox4" value="4" name="msgIdx">		<label for="checkbox4">조미료1</label></li>
							<li><input type="checkbox" id="checkbox5" value="5" name="msgIdx">		<label for="checkbox5">조미료2</label></li>
							<li><input type="checkbox" id="checkbox6" value="6" name="msgIdx">		<label for="checkbox6">조미료3</label></li>
							<li><input type="checkbox" id="checkbox7" value="7" name="msgIdx">		<label for="checkbox7">조미료4</label></li>
							<li><input type="checkbox" id="checkbox8" value="8" name="msgIdx">		<label for="checkbox8">조미료5</label></li>
							<li><input type="checkbox" id="checkbox9" value="9" name="msgIdx">		<label for="checkbox9">조미료6</label></li>
							<li><input type="checkbox" id="checkbox10" value="10" name="msgIdx">	<label for="checkbox10">조미료7</label></li>
							<li><input type="checkbox" id="checkbox11" value="11" name="msgIdx">	<label for="checkbox11">조미료8</label></li>
							<li><input type="checkbox" id="checkbox12" value="12" name="msgIdx">	<label for="checkbox12">조미료9</label></li>
							<li><input type="checkbox" id="checkbox13" value="13" name="msgIdx">	<label for="checkbox13">조미료10</label></li>
							<li><input type="checkbox" id="checkbox14" value="14" name="msgIdx">	<label for="checkbox14">조미료11</label></li>
							<li><input type="checkbox" id="checkbox15" value="15" name="msgIdx">	<label for="checkbox15">조미료12</label></li>
							<li><input type="checkbox" id="checkbox16" value="16" name="msgIdx">	<label for="checkbox16">조미료13</label></li>
							<li><input type="checkbox" id="checkbox17" value="17" name="msgIdx">	<label for="checkbox17">조미료14</label></li>
							<li><input type="checkbox" id="checkbox18" value="18" name="msgIdx">	<label for="checkbox18">조미료15</label></li>
							<li><input type="checkbox" id="checkbox19" value="19" name="msgIdx">	<label for="checkbox19">조미료16</label></li>
							<li><input type="checkbox" id="checkbox20" value="20" name="msgIdx">	<label for="checkbox20">조미료17</label></li>
							<li><input type="checkbox" id="checkbox21" value="21" name="msgIdx">	<label for="checkbox21">조미료18</label></li>
							<li><input type="checkbox" id="checkbox22" value="22" name="msgIdx">	<label for="checkbox22">조미료19</label></li>
							<li><input type="checkbox" id="checkbox23" value="23" name="msgIdx">	<label for="checkbox23">조미료20</label></li>
							<li><input type="checkbox" id="checkbox24" value="24" name="msgIdx">	<label for="checkbox24">조미료21</label></li>
							<li><input type="checkbox" id="checkbox25" value="25" name="msgIdx">	<label for="checkbox25">조미료22</label></li>
							<li><input type="checkbox" id="checkbox26" value="26" name="msgIdx">	<label for="checkbox26">조미료23</label></li>
							<li><input type="checkbox" id="checkbox27" value="27" name="msgIdx">	<label for="checkbox27">조미료24</label></li>
							<li><input type="checkbox" id="checkbox28" value="28" name="msgIdx">	<label for="checkbox28">조미료25</label></li>
							<li><input type="checkbox" id="checkbox29" value="29" name="msgIdx">	<label for="checkbox29">조미료26</label></li>
							<li><input type="checkbox" id="checkbox30" value="30" name="msgIdx">	<label for="checkbox30">조미료27</label></li>
						</ul>

					</div>
				<div class="pl-1_5">
					<button id="msgSubmit" type="submit"
						class="w-full h-12 text-sm font-medium leading-5 text-white transition-colors duration-150 bg-purple-600 border border-transparent rounded-lg sm:w-auto sm:px-4 sm:py-2 active:bg-purple-600 hover:bg-purple-700 focus:outline-none focus:shadow-outline-purple">
						적용</button>
						<div id="loadingModal" class="addModal">
					    <div class="modal-content">
					        <p>잠시만 기다려 주세요...</p>
					    </div>
						</div>
				
					<button id="cancleTrdModal" @click="closeTrdModal"
							class="w-full h-12 text-sm font-medium leading-5 text-white text-gray-700 transition-colors duration-150 border border-gray-300 rounded-lg dark:text-gray-400 sm:px-4 sm:py-2 sm:w-auto active:bg-transparent hover:border-gray-500 focus:border-gray-500 active:text-gray-500 focus:outline-none focus:shadow-outline-gray "
						>취소</button>
					</div>	
				</div>


			</div>



		</div>
	</div>
	</div>
	</main>
	</div>
	</div>
</body>


<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src="/assets/js/init-alpine.js"></script>
<script src="/assets/js/msgModal.js"></script> <!-- msg 모달 js -->
<script src="/assets/js/searchModal.js"></script> <!-- 재료검색 모달 js -->
<script src="/assets/js/ingreAPI.js"></script> <!-- 식재료 API js -->


<script type="text/javaScript">



</script>








</html>