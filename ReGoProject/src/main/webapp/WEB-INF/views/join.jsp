<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html :class="{ 'theme-dark': dark }" x-data="data()" lang="en">

<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Create account - Windmill Dashboard</title>
  <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap" rel="stylesheet" />
  <link rel="stylesheet" href="/assets/css/join.css" />
  <script src="https://cdn.jsdelivr.net/gh/alpinejs/alpine@v2.x.x/dist/alpine.min.js" defer></script>

  <script src="/assets/js/join.js"></script>

</head>

<body>
 <div class="flex items-center min-h-screen p-6 bg-gray-50 dark:bg-gray-900">
    <div class="flex-1 h-full max-w-4xl mx-auto overflow-hidden bg-white rounded-lg dark:bg-gray-800">
      <div class="loginLogo">
        <img class="logo" src="./assets/img/regoLogo.png" width="150px" height="150px" style="margin: auto;">
      </div>
      <div class="flex flex-col overflow-y-auto md:flex-row">
        <div class="h-32 md:h-auto md:w-1/2">
          <!-- 회원가입 이미지 사진 -->
          <img aria-hidden="true" class="object-cover w-full h-full dark:hidden" src="./assets/img/로그인음식사진.jpg"
            alt="Office" />
        </div>
        <div class="flex items-center justify-center p-6 sm:p-12 md:w-1/2">
          <div class="w-full">
            <!-- 회원가입 제목 -->
            <h1 class="mb-4 text-xl font-semibold text-gray-700 dark:text-gray-200">
              회원가입
            </h1>
            <!-- 아이디 입력 -->
            <form action="/join" method="post" enctype="multipart/form-data">
              <label class="block text-sm">
                <span class="text-gray-700 dark:text-gray-400">아이디</span>
                <input
                  class="block w-full mt-1 text-sm dark:border-gray-600 dark:bg-gray-700 focus:border-green-400 focus:outline-none focus:shadow-outline-green dark:text-gray-300 dark:focus:shadow-outline-gray form-input"
                  placeholder="아이디 입력" id="checkId" name="custId" />
                <p id="checkResult"></p>
              </label>
              <!-- 비밀번호 입력 -->
              <label class="block mt-4 text-sm">
                <span class="text-gray-700 dark:text-gray-400">비밀번호</span>
                <input
                  class="block w-full mt-1 text-sm dark:border-gray-600 dark:bg-gray-700 focus:border-green-400 focus:outline-none focus:shadow-outline-green dark:text-gray-300 dark:focus:shadow-outline-gray form-input"
                  placeholder="비밀번호 입력" type="password" id="password" name="custPw" />
              </label>
              <!-- 비밀번호 확인 -->
              <label class="block mt-4 text-sm">
                <span class="text-gray-700 dark:text-gray-400">비밀번호 확인</span>
                <input
                  class="block w-full mt-1 text-sm dark:border-gray-600 dark:bg-gray-700 focus:border-green-400 focus:outline-none focus:shadow-outline-green dark:text-gray-300 dark:focus:shadow-outline-gray form-input"
                  placeholder="비밀번호 입력" type="password" id="checkPassword" />
                <p id="passChecking"></p>
              </label>
              <!-- 이름 입력 -->
              <label class="block mt-4 text-sm">
                <span class="text-gray-700 dark:text-gray-400">
                  이름
                </span>
                <input
                  class="block w-full mt-1 text-sm dark:border-gray-600 dark:bg-gray-700 focus:border-green-400 focus:outline-none focus:shadow-outline-green dark:text-gray-300 dark:focus:shadow-outline-gray form-input"
                  placeholder="이름 입력" type="text" name="custName" />
              </label>
              <!-- 핸드폰 번호 입력 -->
              <label class="block mt-4 text-sm">
                <span class="text-gray-700 dark:text-gray-400">
                  핸드폰 번호
                </span>
                <input
                  class="block w-full mt-1 text-sm dark:border-gray-600 dark:bg-gray-700 focus:border-green-400 focus:outline-none focus:shadow-outline-green dark:text-gray-300 dark:focus:shadow-outline-gray form-input"
                  placeholder="핸드폰 번호 입력" type="text" name="custPhone" />
              </label>
              <!-- 이메일 입력 -->
              <label class="block mt-4 text-sm">
                <span class="text-gray-700 dark:text-gray-400">
                  이메일
                </span>
                <input
                  class="block w-full mt-1 text-sm dark:border-gray-600 dark:bg-gray-700 focus:border-green-400 focus:outline-none focus:shadow-outline-green dark:text-gray-300 dark:focus:shadow-outline-gray form-input"
                  placeholder="이메일 입력" type="email" name="custEmail"/>
              </label>
              <!-- 주소 입력 -->
              <label class="block mt-4 text-sm">
                <span class="text-gray-700 dark:text-gray-400">
                  주소
                </span>
                <input
                  class="block w-full mt-1 text-sm dark:border-gray-600 dark:bg-gray-700 focus:border-green-400 focus:outline-none focus:shadow-outline-green dark:text-gray-300 dark:focus:shadow-outline-gray form-input"
                  placeholder="우편번호" type="text" id="sample6_postcode" name="custAddr"/>
                <input value="우편번호 찾기" id="post_btn" type="button"
                     onclick="sample6_execDaumPostcode()"
                  class="block w-full px-4 py-2 mt-4 text-sm font-medium leading-5 text-center text-white transition-colors duration-150 bg-purple-600 border border-transparent rounded-lg active:bg-green-600 hover:bg-green-700 focus:outline-none focus:shadow-outline-green">
                <input
                  class="block w-full mt-1 text-sm dark:border-gray-600 dark:bg-gray-700 focus:border-green-400 focus:outline-none focus:shadow-outline-green dark:text-gray-300 dark:focus:shadow-outline-gray form-input"
                  placeholder="주소 입력" type="text" id="sample6_address" name="custAddr1" />
                <input
                  class="block w-full mt-1 text-sm dark:border-gray-600 dark:bg-gray-700 focus:border-green-400 focus:outline-none focus:shadow-outline-green dark:text-gray-300 dark:focus:shadow-outline-gray form-input"
                  placeholder="상세주소 입력" type="text" id="sample6_detailAddress" name="custAddr2"/>
                <a id="sample6_extraAddress" sytle="display: none;"></a>
              </label>
              <!-- 프로필사진 첨부 -->
              <label class="block mt-4 text-sm">
                <span class="text-gray-700 dark:text-gray-400">
                  프로필사진
                </span>
                <input
                  class="block w-full mt-1 text-sm dark:border-gray-600 dark:bg-gray-700 focus:border-green-400 focus:outline-none focus:shadow-outline-green dark:text-gray-300 dark:focus:shadow-outline-gray form-input"
                  type="file"  name="custImg1"/>
              </label>

              <!-- 회원가입 버튼 -->
              <input type="submit" value="회원가입"
                class="block w-full px-4 py-2 mt-4 text-sm font-medium leading-5 text-center text-white transition-colors duration-150 bg-purple-600 border border-transparent rounded-lg active:bg-green-600 hover:bg-green-700 focus:outline-none focus:shadow-outline-green">
            </form>



            <hr class="my-8" />
            <!-- 카카오톡 로그인 버튼 -->
            <button
              class="flex items-center justify-center w-full px-4 py-2 text-sm font-medium leading-5 text-white text-gray-700 transition-colors duration-150 border border-gray-300 rounded-lg dark:text-gray-400 active:bg-transparent hover:border-gray-500 focus:border-gray-500 active:text-gray-500 focus:outline-none focus:shadow-outline-gray">
              카카오톡으로 회원가입
            </button>
            <!-- 계정 있을 때 로그인 하기 -->
            <p class="mt-4">
              <a class="text-sm font-medium text-purple-600 dark:text-purple-400 hover:underline" href="#">
                계정이 이미 있으신가요? 로그인
              </a>
            </p>
          </div>
        </div>
      </div>
    </div>
  </div>
  <script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
  <script type="text/javascript">
  $(document).ready(function(){
	    var input = $('#checkId');
	    input.on('input', idCheck);
	    
	    var checkPassword = $('#checkPassword');
	    
	    checkPassword.on('input', chPassword);
	});

	function idCheck(){
	    console.log('여기오나?')
	    var value = $("#checkId").val();

	    if (value === '') {
	        $('#checkResult').hide();
	        return;
	    }

	    $.ajax({
	        url : '/idCheck',
	        type: 'post',
	        data: {
	            "id" : value
	        },
	        success : function(res){
	            if(res == "true"){
	                console.log("사용가능해요");
	                $('#checkResult').html('사용가능합니다').css("color","Blue" ).css("font-size" , "13px").show();
	            } else {
	                console.log("사용중");
	                $('#checkResult').html('사용중인ID입니다').css("color","red").css("font-size" , "12px").show();
	            }
	        },
	        error : function(e){
	            alert('실패')
	        }
	    });
	}
	function chPassword() {
	    var pass = $('#password').val();
	    var checkPass = $('#checkPassword').val();
	    
	    console.log("여까지오냐고");
	    if (checkPass === '') {
	        $('#passChecking').hide();
	        return;
	    }

	    if (pass === checkPass) {
	    	$('#passChecking').html('비밀번호가 일치합니다').css("color","blue").css("font-size" , "13px").show();
	        
	    } else {
	    	$('#passChecking').html('비밀번호가 일치하지 않습니다').css("color","red").css("font-size" , "12px").show();	        
	    }
	}
			
			
			</script>
			
   
   <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
   <script>
      function sample6_execDaumPostcode() {
         new daum.Postcode(
               {
                  oncomplete : function(data) {
                     // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                     // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                     // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                     var addr = ''; // 주소 변수
                     var extraAddr = ''; // 참고항목 변수

                     //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                     if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                        addr = data.roadAddress;
                     } else { // 사용자가 지번 주소를 선택했을 경우(J)
                        addr = data.jibunAddress;
                     }

                     // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                     if (data.userSelectedType === 'R') {
                        // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                        // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                        if (data.bname !== ''
                              && /[동|로|가]$/g.test(data.bname)) {
                           extraAddr += data.bname;
                        }
                        // 건물명이 있고, 공동주택일 경우 추가한다.
                        if (data.buildingName !== ''
                              && data.apartment === 'Y') {
                           extraAddr += (extraAddr !== '' ? ', '
                                 + data.buildingName
                                 : data.buildingName);
                        }
                        // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                        if (extraAddr !== '') {
                           extraAddr = ' (' + extraAddr + ')';
                        }
                        // 조합된 참고항목을 해당 필드에 넣는다.
                        document.getElementById("sample6_extraAddress").value = extraAddr;

                     } else {
                        document.getElementById("sample6_extraAddress").value = '';
                     }

                     // 우편번호와 주소 정보를 해당 필드에 넣는다.
                     document.getElementById('sample6_postcode').value = data.zonecode;
                     document.getElementById("sample6_address").value = addr;
                     // 커서를 상세주소 필드로 이동한다.
                     document.getElementById("sample6_detailAddress")
                           .focus();
                  }
               }).open();
      }
   </script>
  
  
</body>

</html>
