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
    Swal.fire({
        icon: 'warning',
        title: '취소 확인',
        text: '정말 취소하시겠습니까? 취소 시 사진을 재 업로드 해야합니다.',
        showCancelButton: true,
        confirmButtonText: '확인',
        cancelButtonText: '취소',
    }).then((result) => {
        if (result.isConfirmed) {
            // 확인 버튼을 클릭했을 때 실행할 작업
            closeIngreModal();
            window.location.href = '/goMain'; // 요청 매핑 URL로 수정
        }
    });
});




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
  // 로딩 애니메이션을 포함한 SweetAlert2 커스텀 모달 표시
Swal.fire({
    title: '사진을 분석하는 중 입니다.',
    html: '<div class="loading-container">' +
            '<div class="loading-spinner"></div>' +
          '</div>',
    allowEscapeKey: false,
    allowOutsideClick: false,
    showConfirmButton: false,
    onBeforeOpen: () => {
        Swal.showLoading();
    }
});
  

  // ingreAPI로 파일을 업로드
  $.ajax({
    url: '/ingreAPI', // ingreAPI로 보내기
    type: 'POST',
    data: formData,
    processData: false,
    contentType: false,
    success: function(response) {
      // 성공 시 처리
       Swal.close();
      
      // 응답받은 후에 검색창용 모달창 불러와서 이름 수정할수있게 기능 만들어서 호출하기 
      // 응답을 UL에 추가
      appendResponseToList(response);
      openIngreModal();

      
    },
    error: function(xhr, status, error) {
   Swal.fire({
    icon: 'error',
    title: '오류 발생',
    text: '서버에서 데이터를 가져오는 동안 오류가 발생했습니다.',
    showConfirmButton: true
});
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
	  
	  var maxItems = 15; // 최대 항목 수

	  // 체크하여 추가 버튼 활성화/비활성화
	  function checkAddButton() {
	    var liElements = ul.getElementsByTagName("li");
	    if (liElements.length >= maxItems) {
	      addIngredientButton.disabled = true;
	    } else {
	      addIngredientButton.disabled = false;
	    }
	    
	  }

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
	    deleteButton.className = "h-12 text-sm font-medium leading-5 text-white transition-colors duration-150 bg-red-yj border border-transparent rounded-lg sm:w-full sm:px-4 sm:py-2 active:bg-purple-600 hover:bg-purple-700 focus:outline-none focus:shadow-outline-purple delete-button"; // CSS 클래스 추가
	    li.appendChild(deleteButton);

	    ul.appendChild(li);
	  });

	  var addIngredientButton = document.createElement("button");
	  addIngredientButton.textContent = "추가";
	  addIngredientButton.className = "h-12 text-sm font-medium leading-5 text-white transition-colors duration-150 bg-green-600 border border-transparent rounded-lg sm:w-full sm:px-4 sm:py-2 active:bg-green-600 hover:bg-green-700 focus:outline-none focus:shadow-outline-green add-ingredient-button";
	  
	  
	  addIngredientButton.addEventListener("click", function () {
		    var liElements = ul.getElementsByTagName("li");
		    if (liElements.length < maxItems) {
		      var newLi = document.createElement("li");
		      var newInputElement = document.createElement("input");
		      newInputElement.type = "text";
		      newInputElement.disabled = true; // 새로운 항목은 비활성화된 상태로 시작
		      newInputElement.name = "ingreName";
		      newInputElement.className = "h-12 ingreAPIInput";
		      newLi.appendChild(newInputElement);

		      var newSaveButton = document.createElement("button");
		      newSaveButton.textContent = "수정"; // 시작 버튼 텍스트를 "수정"으로 설정
		      newSaveButton.className = "h-12 text-sm font-medium leading-5 text-white transition-colors duration-150 bg-purple-600 border border-transparent rounded-lg sm:w-full sm:px-4 sm:py-2 active:bg-purple-600 hover:bg-purple-700 focus:outline-none focus:shadow-outline-purple save-button";
		      newLi.appendChild(newSaveButton);

		      var newDeleteButton = document.createElement("button");
		      newDeleteButton.textContent = "삭제";
		      newDeleteButton.className = "h-12 text-sm font-medium leading-5 text-white transition-colors duration-150 bg-red-yj border border-transparent rounded-lg sm:w-full sm:px-4 sm:py-2 active:bg-purple-600 hover:bg-purple-700 focus:outline-none focus:shadow-outline-purple delete-button";
		      newLi.appendChild(newDeleteButton);

		      ul.appendChild(newLi);
		      // 체크하여 추가 버튼 활성화/비활성화
		      checkAddButton();
		    }
		  });
		  checkAddButton();
		  ul.appendChild(addIngredientButton);
		}


//"저장" 버튼 클릭 이벤트 핸들러
function toggleSaveButton(button) {
  var inputElement = $(button).closest('li').find('input');
  var buttonText = $(button).text(); // 현재 버튼의 텍스트 가져오기

  if (buttonText === "수정") {
    // "수정" 버튼을 클릭한 경우
    inputElement.prop('disabled', false);
    inputElement.focus(); // 입력 필드에 포커스를 줌
    $(button).text("저장"); // 버튼 텍스트를 "저장"으로 변경
  } else {
    // "저장" 버튼을 클릭한 경우
    inputElement.prop('disabled', true);
    $(button).text("수정"); // 버튼 텍스트를 "수정"으로 변경
  }
}

$(document).ready(function() {
  // "수정" 버튼 클릭 이벤트 핸들러를 등록
  $('#ingreResponeList').on('click', 'li .save-button', function() {
    toggleSaveButton(this); // 현재 클릭한 버튼에 대한 처리
  });
  // 나머지 코드 ...
});



//"적용" 버튼 클릭 이벤트 핸들러
$('#sendAPIResult').click(function() {
  var inputValues = []; // 입력된 값들을 저장할 배열

  // 각 <input> 요소에서 값을 가져와 배열에 추가
  $('.ingreAPIInput').each(function() {
    inputValues.push($(this).val());
  });

  var inputData = JSON.stringify(inputValues);
  console.log(inputData);
  // 배열에 저장된 값들을 서버로 전송
  $.ajax({
    url: '/saveInputValues', // 서버의 저장 엔드포인트 URL로 수정
    type: 'POST',
    contentType: 'application/json', // JSON 데이터를 전송한다고 명시
    data: inputData,
     success: function(response) {
        console.log(response.message);

        var message = '';

        if (response.successfulIngredients.length > 0) {
            message += '성공한 재료: ' + response.successfulIngredients.join(', ') + '\n';
        }

        if (response.failedIngredients.length === 0) {
            message += '실패한 재료가 없습니다.';
        } else {
            message += '다음 재료는 존재하지 않습니다: ' + response.failedIngredients.join(', ');
        }

       Swal.fire({
    icon: response.successfulIngredients.length > 0 ? 'success' : 'error',
    title: response.successfulIngredients.length > 0 ? '성공' : '오류',
    html: message,
    showConfirmButton: true,
}).then((result) => {
    if (result.isConfirmed) {
        window.location.href = '/goMain'; // 성공하거나 오류 발생 시 goMain 페이지로 이동
    }
});
    },
    error: function(xhr, status, error) {
      // 오류 시 처리
   
     Swal.fire({
    icon: 'error',
    title: '오류 발생',
    text: '서버에서 데이터를 가져오는 동안 오류가 발생했습니다.',
    showConfirmButton: true,
}).then((result) => {
    if (result.isConfirmed) {
        window.location.href = '/goMain'; // 오류 발생 시 goMain 페이지로 이동
    }
});
    }
  });
});
