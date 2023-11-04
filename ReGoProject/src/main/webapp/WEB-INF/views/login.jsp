<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>


<html :class="{ 'theme-dark': dark }" x-data="data()" lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>REGO Login</title>
    <link
      href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap"
      rel="stylesheet"
    />
    <link rel="stylesheet" href="/assets/css/login.css" />
    <script
      src="https://cdn.jsdelivr.net/gh/alpinejs/alpine@v2.x.x/dist/alpine.min.js"
      defer></script>
    <script src="/assets/js/init-alpine.js"></script>
  </head>
  <body>
    <div class="GyeonggiBatangfont flex items-center min-h-screen p-6 bg-gray-50 dark:bg-gray-900">
      <div
        class="flex-1 h-full max-w-4xl mx-auto overflow-hidden bg-white rounded-lg shadow-xl dark:bg-gray-800">
        <div class="flex flex-col overflow-y-auto md:flex-row">
          <div class="h-32 md:h-auto md:w-1/2">
            <!-- 로그인 이미지 사진 -->
            <img aria-hidden="true"class="object-cover w-full h-full dark:hidden"src="/assets/img/login/login.jpg"alt="Office"/>
          </div>
          <div class="flex items-center justify-center p-6 sm:p-12 md:w-1/2">
            <div class="w-full">
              <!-- 로그인 제목 -->
              <h1 class="mb-4 text-xl font-semibold text-gray-700 dark:text-gray-200">
              로그인
              </h1>
              <form  method="post" id="loginform">
              <!-- 아이디 입력 창 -->
              <label class="block text-sm">
                <span class="text-gray-700 dark:text-gray-400">아이디</span>
                <input class="block w-full mt-1 text-sm dark:border-gray-600 dark:bg-gray-700 focus:border-green-400 focus:outline-none focus:shadow-outline-green dark:text-gray-300 dark:focus:shadow-outline-gray form-input"
                  placeholder="아이디 입력" name="custId"  id="username" />
              </label>
              <!-- 비밀번호 입력 창 -->
              <label class="block mt-4 text-sm">
                <span class="text-gray-700 dark:text-gray-400">비밀번호</span>
                <input
                  class="block w-full mt-1 text-sm dark:border-gray-600 dark:bg-gray-700 focus:border-green-400 focus:outline-none focus:shadow-outline-green dark:text-gray-300 dark:focus:shadow-outline-gray form-input"
                  placeholder="비밀번호 입력"
                  type="password" name="custPw" id="password"
                />
              </label>

             <!-- 로그인 버튼 -->
              <button type="submit"
                class="block w-full px-4 py-2 mt-4 text-sm font-medium leading-5 text-center text-white transition-colors duration-150 bg-purple-600 border border-transparent rounded-lg active:bg-purple-600 hover:bg-purple-700 focus:outline-none focus:shadow-outline-purple"
               
              >
                로그인
              </button>

              <hr class="my-8" />
              <!-- 카카오톡 로그인 버튼 -->
              <button
                class="flex items-center justify-center w-full px-4 py-2 text-sm font-medium leading-5 text-white text-gray-700 transition-colors duration-150 border border-gray-300 rounded-lg dark:text-gray-400 active:bg-transparent hover:border-gray-500 focus:border-gray-500 active:text-gray-500 focus:outline-none focus:shadow-outline-gray"
              >
                카카오톡으로 로그인
              </button>
              <!-- 비밀번호 찾기 -->
              <p class="mt-4">
                <a
                  class="text-sm font-medium text-purple-600 dark:text-purple-400 hover:underline"
                  href="/goFindPw"
                >
                  비밀번호 찾기
                </a>
              </p>
              <!-- 회원가입 -->
              <p class="mt-1">
                <a
                  class="text-sm font-medium text-purple-600 dark:text-purple-400 hover:underline"
                  href="/goJoin"
                >
                  회원가입
                </a>
              </p>
            </div>
            </form>
          </div>
        </div>
      </div>
    </div>
  </body>
</html>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script>
$("#loginform").submit(function(event) {
	
	event.preventDefault();
    var custId = $('#username').val();
    var custPw = $('#password').val();

    $.ajax({
        type: 'POST',
        url: '/login', // 로그인 처리를 담당하는 컨트롤러의 URL
        data: {
            custId: custId,
            custPw: custPw
        },
        success: function(response) {
        	
            // 로그인 성공 시 수행할 동작
            if (response === 'success') {
                // 로그인 성공 시 메인 페이지로 이동 등의 동작
                console.log("로그인성공");
                window.location.href = 'goMain';
            } else {
                // 로그인 실패 시 수행할 동작
                console.log("로그인실패");
                swal("로그인 실패");
                // 여기서 실패 메시지를 표시하거나 다른 동작을 수행할 수 있습니다.
            }
        },
        error: function() {
            // AJAX 요청이 실패했을 때 수행할 동작
            console.log('AJAX request failed');
        }
    });
});
</script>

