<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html :class="{ 'theme-dark': dark }" x-data="data()" lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>REGO HOME</title>
<script src="/assets/js/init-alpine.js"></script>
<script src="/assets/js/focus-trap.js"></script>
<script src="/assets/js/slide.js" defer></script>
<link
	href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap"
	rel="stylesheet" />

<link rel="stylesheet" href="/assets/css/homeCopy.css" />
<link rel="stylesheet" href="/assets/css/main.css" />
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

	


</head>

<body>
	<!-- <h1>${user.custId}님 환영합니다</h1> 
<a href="/goCommunity">게시판</a>
<br>
<a href="/goMypage">마이페이지</a>
<br>
<form action="/goMyIngreList" method="post">
<input type="hidden" id="${user.custId }" value="${user.custId }">
<button type="submit">내식재료</button>
</form>

<br>
<form action="/goMyMsgList" method="post">
<input type="hidden" id="${user.custId }" value="${user.custId }">
<button type="submit">내조미료</button>
</form>
<br>
<a href="/goRecList">레시피</a>
<br>
<a href="/logout">로그아웃</a>  -->




	<div class="flex h-screen bg-gray-50 dark:bg-gray-900"
		:class="{ 'overflow-hidden': isSideMenuOpen }">
		<!-- Desktop sidebar 여기 사이에있는 aside 코드 전부 지워야함-->

		<!-- 여기 사이에있는 코드지워야함-->

		<!-- Mobile sidebar -->

		<!-- Backdrop -->
		<div x-show="isSideMenuOpen"
			x-transition:enter="transition ease-in-out duration-150"
			x-transition:enter-start="opacity-0"
			x-transition:enter-end="opacity-100"
			x-transition:leave="transition ease-in-out duration-150"
			x-transition:leave-start="opacity-100"
			x-transition:leave-end="opacity-0"
			class="fixed inset-0 z-10 flex items-end bg-black bg-opacity-50 sm:items-center sm:justify-center"></div>
		<!--x-show="isSideMenuOpen에 있는" md:hidden 지워줘야함-->
		<aside
			class="fixed inset-y-0 z-20 flex-shrink-0 w-64 mt-16 overflow-y-auto bg-white dark:bg-gray-800"
			x-show="isSideMenuOpen"
			x-transition:enter="transition ease-in-out duration-150"
			x-transition:enter-start="opacity-0 transform -translate-x-20"
			x-transition:enter-end="opacity-100"
			x-transition:leave="transition ease-in-out duration-150"
			x-transition:leave-start="opacity-100"
			x-transition:leave-end="opacity-0 transform -translate-x-20"
			@click.away="closeSideMenu" @keydown.escape="closeSideMenu">
			<div class="py-4 text-gray-500 dark:text-gray-400">
				<a class="ml-6 text-lg font-bold text-gray-800 dark:text-gray-200"
					href="#"> Coin : (숫자) 개 </a>
				<ul class="mt-6">
					<li class="relative px-6 py-2"><span
						class="absolute inset-y-0 left-0 w-1 bg-purple-600 rounded-tr-lg rounded-br-lg"
						aria-hidden="true"></span> <a
						class="inline-flex items-center w-full text-sm font-semibold text-gray-800 transition-colors duration-150 hover:text-gray-800 dark:hover:text-gray-200 dark:text-gray-100"
						href="/goMain"> <svg class="w-5 h-5" aria-hidden="true"
								fill="none" stroke-linecap="round" stroke-linejoin="round"
								stroke-width="2" viewBox="0 0 24 24" stroke="currentColor">
                <path
									d="M3 12l2-2m0 0l7-7 7 7M5 10v10a1 1 0 001 1h3m10-11l2 2m-2-2v10a1 1 0 01-1 1h-3m-6 0a1 1 0 001-1v-4a1 1 0 011-1h2a1 1 0 011 1v4a1 1 0 001 1m-6 0h6">
                </path>
              </svg> <span class="ml-4">홈</span>
					</a></li>
				</ul>
				<ul>
					<li class="relative px-6 py-2"><a
						class="inline-flex items-center w-full text-sm font-semibold transition-colors duration-150 hover:text-gray-800 dark:hover:text-gray-200"
						href="/goRecList"> <svg class="w-5 h-5" aria-hidden="true"
								fill="none" stroke-linecap="round" stroke-linejoin="round"
								stroke-width="2" viewBox="0 0 24 24" stroke="currentColor">
                <path
									d="M9 5H7a2 2 0 00-2 2v12a2 2 0 002 2h10a2 2 0 002-2V7a2 2 0 00-2-2h-2M9 5a2 2 0 002 2h2a2 2 0 002-2M9 5a2 2 0 012-2h2a2 2 0 012 2m-3 7h3m-3 4h3m-6-4h.01M9 16h.01">
                </path>
              </svg> <span class="ml-4">레시피</span>
					</a></li>
					<li class="relative px-6 py-2"><a
						class="inline-flex items-center w-full text-sm font-semibold transition-colors duration-150 hover:text-gray-800 dark:hover:text-gray-200"
						href="/goCommunity"> <svg class="w-5 h-5" aria-hidden="true"
								fill="none" stroke-linecap="round" stroke-linejoin="round"
								stroke-width="2" viewBox="0 0 24 24" stroke="currentColor">
                <path
									d="M19 11H5m14 0a2 2 0 012 2v6a2 2 0 01-2 2H5a2 2 0 01-2-2v-6a2 2 0 012-2m14 0V9a2 2 0 00-2-2M5 11V9a2 2 0 012-2m0 0V5a2 2 0 012-2h6a2 2 0 012 2v2M7 7h10">
                </path>
              </svg> <span class="ml-4">커뮤니티</span>
					</a></li>
					<li class="relative px-6 py-2"><a
						class="inline-flex items-center w-full text-sm font-semibold transition-colors duration-150 hover:text-gray-800 dark:hover:text-gray-200"
						href="/goMypage"> <svg class="w-5 h-5" aria-hidden="true"
								fill="none" stroke-linecap="round" stroke-linejoin="round"
								stroke-width="2" viewBox="0 0 24 24" stroke="currentColor">
                <path d="M11 3.055A9.001 9.001 0 1020.945 13H11V3.055z"></path>
                <path d="M20.488 9H15V3.512A9.025 9.025 0 0120.488 9z"></path>
              </svg> <span class="ml-4">마이페이지</span>
					</a></li>
					<li class="relative px-6 py-2"><a
						class="inline-flex items-center w-full text-sm font-semibold transition-colors duration-150 hover:text-gray-800 dark:hover:text-gray-200"
						href="/logout"> <svg class="w-5 h-5" aria-hidden="true"
								fill="none" stroke-linecap="round" stroke-linejoin="round"
								stroke-width="2" viewBox="0 0 24 24" stroke="currentColor">
                <path d="M11 3.055A9.001 9.001 0 1020.945 13H11V3.055z"></path>
                <path d="M20.488 9H15V3.512A9.025 9.025 0 0120.488 9z"></path>
              </svg> <span class="ml-4">로그아웃</span>
					</a></li>
			</div>
		</aside>
		<div class="flex flex-col flex-1 w-full">
			<header class="z-10 bg-white shadow-md dark:bg-gray-800 py-2">
				<div
					class="container flex py-2 items-center justify-between h-full px-6 mx-auto text-purple-600 dark:text-purple-300">
					<!-- Mobile hamburger button안에 md:hidden 지워야함-->
					<button class="p-1 mr-5 -ml-1 rounded-md focus:outline-none"
						@click="toggleSideMenu" aria-label="Menu">
						<svg class="w-6 h-6" aria-hidden="true" fill="currentColor"
							viewBox="0 0 20 20">
              <path fill-rule="evenodd"
								d="M3 5a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1zM3 10a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1zM3 15a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1z"
								clip-rule="evenodd"></path>
            </svg>
					</button>

					<div class="flex justify-center flex-1 lg:mr-32">

						<a href="/goMain"> <img id="logo"
							src="/assets/img/regoLogo.png" width="80px" height="80px"
							style="margin: auto;">
						</a>

					</div>
					<ul class="flex items-center flex-shrink-0 space-x-6">
						<!-- Theme toggler -->
						<li class="flex">
							<button class="rounded-md focus:outline-none"
								@click="toggleTheme" aria-label="Toggle color mode">
								<template x-if="!dark">
									<svg class="w-5 h-5" aria-hidden="true" fill="currentColor"
										viewBox="0 0 20 20">
                    <path
											d="M17.293 13.293A8 8 0 016.707 2.707a8.001 8.001 0 1010.586 10.586z"></path>
                  </svg>
								</template>
								<template x-if="dark">
									<svg class="w-5 h-5" aria-hidden="true" fill="currentColor"
										viewBox="0 0 20 20">
                    <path fill-rule="evenodd"
											d="M10 2a1 1 0 011 1v1a1 1 0 11-2 0V3a1 1 0 011-1zm4 8a4 4 0 11-8 0 4 4 0 018 0zm-.464 4.95l.707.707a1 1 0 001.414-1.414l-.707-.707a1 1 0 00-1.414 1.414zm2.12-10.607a1 1 0 010 1.414l-.706.707a1 1 0 11-1.414-1.414l.707-.707a1 1 0 011.414 0zM17 11a1 1 0 100-2h-1a1 1 0 100 2h1zm-7 4a1 1 0 011 1v1a1 1 0 11-2 0v-1a1 1 0 011-1zM5.05 6.464A1 1 0 106.465 5.05l-.708-.707a1 1 0 00-1.414 1.414l.707.707zm1.414 8.486l-.707.707a1 1 0 01-1.414-1.414l.707-.707a1 1 0 011.414 1.414zM4 11a1 1 0 100-2H3a1 1 0 000 2h1z"
											clip-rule="evenodd"></path>
                  </svg>
								</template>
							</button>
						</li>
						<!-- Profile menu -->
						<li class="relative">
							<button
								class="align-middle rounded-full focus:shadow-outline-purple focus:outline-none"
								@click="toggleProfileMenu" @keydown.escape="closeProfileMenu"
								aria-label="Account" aria-haspopup="true">
								<!-- 기본이미지 경로 넣어줘야해요 -->
								<img class="object-cover w-8 h-8 rounded-full"
									src="/assets/img/login/defaultProfileImg.png"
									alt="" aria-hidden="true" />
							</button>
							<template x-if="isProfileMenuOpen">
								<ul x-transition:leave="transition ease-in duration-150"
									x-transition:leave-start="opacity-100"
									x-transition:leave-end="opacity-0"
									@click.away="closeProfileMenu"
									@keydown.escape="closeProfileMenu"
									class="absolute right-0 w-56 p-2 mt-2 space-y-2 text-gray-600 bg-white border border-gray-100 rounded-md shadow-md dark:border-gray-700 dark:text-gray-300 dark:bg-gray-700"
									aria-label="submenu">
									<li class="flex"><a
										class="inline-flex items-center w-full px-2 py-1 text-sm font-semibold transition-colors duration-150 rounded-md hover:bg-gray-100 hover:text-gray-800 dark:hover:bg-gray-800 dark:hover:text-gray-200"
										href="/goMypage"> <svg class="w-4 h-4 mr-3"
												aria-hidden="true" fill="none" stroke-linecap="round"
												stroke-linejoin="round" stroke-width="2" viewBox="0 0 24 24"
												stroke="currentColor">
                        <path
													d="M11 16l-4-4m0 0l4-4m-4 4h14m-5 4v1a3 3 0 01-3 3H6a3 3 0 01-3-3V7a3 3 0 013-3h7a3 3 0 013 3v1">
                        </path>
                      </svg> <span>마이페이지</span>
									</a></li>
									<li class="flex"><a
										class="inline-flex items-center w-full px-2 py-1 text-sm font-semibold transition-colors duration-150 rounded-md hover:bg-gray-100 hover:text-gray-800 dark:hover:bg-gray-800 dark:hover:text-gray-200"
										href="/logout"> <svg class="w-4 h-4 mr-3"
												aria-hidden="true" fill="none" stroke-linecap="round"
												stroke-linejoin="round" stroke-width="2" viewBox="0 0 24 24"
												stroke="currentColor">
                        <path
													d="M11 16l-4-4m0 0l4-4m-4 4h14m-5 4v1a3 3 0 01-3 3H6a3 3 0 01-3-3V7a3 3 0 013-3h7a3 3 0 013 3v1">
                        </path>
                      </svg> <span>로그아웃</span>
									</a></li>
								</ul>
							</template>
						</li>
					</ul>
				</div>
			</header>
			<main class="h-full overflow-y-auto">
				<div class="container px-6 mx-auto grid">
					<!-- search -->
					<div class="py-4 mb-2">
					<select name="#" id="searchSelect" class="selectH-5">
						<option value="전체">전체</option>
						<option value="보유재료">보유재료</option>
						<option value="보유조미료">보유조미료</option>
						<option value="레시피">레시피</option>
					</select> 
					<input id="btnDisplayMode" class="search" type="text"
						placeholder="검색어 입력"> <button class="searchBtn" type="button" value="#">검색</button>
				</div>
					<div class="slideshow-container py-4">
						<div class="mySlides fade">
							<div class="slidT2">고기의 유통기한이 얼마 남지 않았습니다!</div>
							<img class="simg" src="/assets/img/foodBanner4.png"
								style="width: 100%">
						</div>

						<div class="mySlides fade">
							<div class="slidT">우유의 유통기한이 얼마 남지 않았습니다!</div>
							<img class="simg" src="/assets/img/foodBanner5.png"
								style="width: 100%">
						</div>

						<div class="mySlides fade">
							<div class="slidT">REGO와 함께 냉장고를 관리 해보세요!</div>
							<img class="simg" src="/assets/img/foodBanner1.jpg"
								style="width: 100%">
						</div>

						<div class="mySlides fade">
							<div class="slidT">REGO와 함께 맛있는 음식을 만들어요!</div>
							<img class="simg" src="/assets/img/foodBanner3.png"
								style="width: 100%">
						</div>

						<div class="mySlides fade">
							<div class="slidT2">REGO와 함께 즐거운 시간 보내요!</div>
							<img class="simg" src="/assets/img/foodBanner2.png"
								style="width: 100%">
						</div>

					</div>

					<div style="text-align: center" class="mb-6">
						<span class="dot"></span> <span class="dot"></span> <span
							class="dot"></span> <span class="dot"></span> <span class="dot"></span>
					</div>

					<div class="food">
						<a href="/goMyIngreList">
							<div class="Seasoning" style="display: inline-block">
								<div>
									<img id="igd" src="/assets/img/ingredient.png">
								</div>
								<p calss="font">식재료</p>
							</div>
						</a> <a href="/goMyMsgList">
							<div class="ingredient" style="display: inline-block">
								<div>
									<img id="ss" src="/assets/img/seasoning.png">
								</div>
								<p calss="font">조미료</p>
							</div>
						</a>
					</div>
					<div>
						<br> <a href="/goRecommendList">
							<div class="recipeRc" style="display: inline-block">
								<div>
									<img id="ss" src="/assets/img/recipe.png">
								</div>
								<p calss="font">레시피 추천</p>
							</div>
						</a> <a href="#">
							<div @click="openModal" class="addItem" id="addItemBtn"
								style="display: inline-block">
								<div>
									<img id="ss" src="/assets/img/add-button.png">
								</div>
								<p calss="font">항목추가</p>
							</div>
						</a> <br>
						<br>
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
			@click.away="closeModal" @keydown.escape="closeModal"
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
			<div class="mt-4 mb-6">
				<!-- Modal title -->
				<p
					class="mb-2 text-lg font-semibold text-gray-700 dark:text-gray-300">
					재료 조미료 추가</p>
				<!-- Modal description -->
				<p class="text-sm text-gray-700 dark:text-gray-400">재료와 조미료를 추가하는 모달창입니다.</p>
			</div>


			<div class="mt-4 mb-6 text-center">
				<h2 class="subtitle">재료</h2>

				<!-- 사진으로 추가하는 태그 -->
				<div>
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
							value="" style="left: 0;">
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
					        @click.away="closeSecModal"
					        @keydown.escape="closeSecModal"
					        class="w-full px-6 py-4 overflow-hidden bg-white rounded-t-lg dark:bg-gray-800 sm:rounded-lg sm:m-4 sm:max-w-xl"
					        role="dialog"
					        id="secModal"
					      style="height : 100%">
					      
					     
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
			<div class="mt-4 text-center">
				<input id="ingreName2" name="ingreName"class="h-12 searchModal"
							value="" style="left: 0;">
							<ul id="searchList2" class=""></ul>
				</div>
			
					<div class="mt-4">
						<button id="cancleSecModal" @click="closeSecModal"
							class="w-full h-12 text-sm font-medium leading-5 text-white text-gray-700 transition-colors duration-150 border border-gray-300 rounded-lg dark:text-gray-400 sm:px-4 sm:py-2 sm:w-auto active:bg-transparent hover:border-gray-500 focus:border-gray-500 active:text-gray-500 focus:outline-none focus:shadow-outline-gray"
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
					
		
					<div class="pl-5 checkContainer text-center">
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
<script src="/assets/js/msgModal.js"></script> <!-- msg 모달 js -->
<script src="/assets/js/searchModal.js"></script> <!-- 재료검색 모달 js -->


<script type="text/javaScript">
//모달 열기
function openIngreModal() {
  var modal = document.getElementById("ingreAPIModal");
  modal.style.display = "block";
}

//모달 닫기
function closeIngreModal() {
  var modal = document.getElementById("ingreAPIModal");
  modal.style.display = "none";
}

//취소 버튼 클릭 시 확인창 표시
$('#cancleIngreAPIModal').click(function() {
  if (confirm("정말 취소하시겠습니까? 취소 시 사진을 재 업로드 해야합니다.")) {
    // 확인 버튼을 눌렀을 때 모달 닫기
    closeIngreModal();
    // goMain 요청 매핑으로 이동
    window.location.href = '/goMain'; // 요청 매핑 URL로 수정
  }
});

//처리중입니다. 모달 표시
function showLoadingModal() {
    document.getElementById("ingreAPIloadingModal").style.display = "block";
}

// 모달 숨김
function hideLoadingModal() {
    document.getElementById("ingreAPIloadingModal").style.display = "none";
}


// 파일 업로드 버튼 클릭 시 파일 선택 창 열기
$('#uploadButton').click(function() {
  $('#addIngreFile').click();
});


//파일 선택 시 이벤트
$('#addIngreFile').change(function() {
  var selectedFile = this.files[0];
  var formData = new FormData();
  formData.append('file', selectedFile);
  // 응답 받는동안 모달창 띄우기 
  showLoadingModal();
  

  // ingreAPI로 파일을 업로드
  $.ajax({
    url: '/ingreAPI', // ingreAPI로 보내기
    type: 'POST',
    data: formData,
    processData: false,
    contentType: false,
    success: function(response) {
      // 성공 시 처리
      console.log(response);
      hideLoadingModal();     
      
      // 응답받은 후에 검색창용 모달창 불러와서 이름 수정할수있게 기능 만들어서 호출하기 
      // 응답을 UL에 추가
      appendResponseToList(response);
      openIngreModal();
      enableEditAndDeleteButtons();
      
    },
    error: function(xhr, status, error) {
    alert('오류')
      // 오류 시 처리
      console.log(error);
    }
  });
});


$(document).ready(function() {
	  // "삭제" 버튼을 클릭하면 해당 항목을 목록에서 제거
	  $('#ingreResponeList').on('click', 'li .delete-button', function() {
	    event.preventDefault(); // 이벤트의 기본 동작 막기
	    event.stopPropagation(); // 이벤트 전파 중지
	    $(this).closest('li').remove();
	  });
	});

function appendResponseToList(response) {
	  var resultArray = response.result;
	  var ul = document.getElementById("ingreResponeList");

	  while (ul.firstChild) {
	    ul.removeChild(ul.firstChild);
	  }

	  resultArray.forEach(function (item, index) {
		    var li = document.createElement("li");
		    var inputElement = document.createElement("input");
		    inputElement.type = "text";
		    inputElement.value = item;
		    inputElement.disabled = true;
		    inputElement.name = "ingreName"; 
		    inputElement.className="h-12 ingreAPIInput";
		    li.appendChild(inputElement);


	    var saveButton = document.createElement("button");
	    saveButton.textContent = "수정";
	    saveButton.className = "h-12 text-sm font-medium leading-5 text-white transition-colors duration-150 bg-purple-600 border border-transparent rounded-lg sm:w-full sm:px-4 sm:py-2 active:bg-purple-600 hover:bg-purple-700 focus:outline-none focus:shadow-outline-purple save-button" 
	    li.appendChild(saveButton);

	    var deleteButton = document.createElement("button");
	    deleteButton.textContent = "삭제";
	    deleteButton.className = "h-12 text-sm font-medium leading-5 text-white transition-colors duration-150 bg-red-600 border border-transparent rounded-lg sm:w-full sm:px-4 sm:py-2 active:bg-purple-600 hover:bg-purple-700 focus:outline-none focus:shadow-outline-purple delete-button"; // CSS 클래스 추가
	    li.appendChild(deleteButton);

	    ul.appendChild(li);
	  });

	  
	}

function enableEditAndDeleteButtons() {
	  // "저장" 버튼을 클릭하면 해당 항목의 입력 필드를 활성화하고 버튼 이름을 "수정"으로 변경
	  $('.save-button').click(function() {
	    var inputElement = $(this).closest('li').find('input');
	    var buttonText = $(this).text(); // 현재 버튼의 텍스트 가져오기

	    if (buttonText === "저장") {
	      // "저장" 버튼을 클릭한 경우
	      inputElement.prop('disabled', true);
	      $(this).text("수정"); // 버튼 텍스트를 "수정"으로 변경
	    } else {
	      // "수정" 버튼을 클릭한 경우
	      inputElement.prop('disabled', false);
	      inputElement.focus(); // 입력 필드에 포커스를 줌
	      $(this).text("저장"); // 버튼 텍스트를 "저장"으로 변경
	    }
	  });
	}


</script>








</html>