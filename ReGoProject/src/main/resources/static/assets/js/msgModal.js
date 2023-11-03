// 취소버튼 누르면 모달 다시 초기화 시켜야하는 코드 필요함

//처리중입니다. 모달 표시
function showLoadingModal() {
    document.getElementById("loadingModal").style.display = "block";
}

// 모달 숨김
function hideLoadingModal() {
    document.getElementById("loadingModal").style.display = "none";
}

var userMsgInfo;

//페이지 로드시마다 조미료 정보 가져오는 함수
function fetchUserMsgInfo() {
 // Ajax 요청을 보냅니다.
 $.ajax({
     type: "GET",
     url: "/selectMyAllMsg",
     success: function (data) {
         // 요청이 완료되면 사용자 조미료 정보를 userMsgInfo에 저장합니다.
         userMsgInfo = data;
         console.log(userMsgInfo);
         initializeCheckboxes(); // 페이지 로드 후 체크박스 초기화
     },
     error: function (err) {
         console.error("에러 발생: " + err);
     }
 });
}

//페이지 로드 시 조미료 정보 가져오기
fetchUserMsgInfo();

//적용 버튼을 클릭할 때
$("#msgSubmit").click(function () {
	//적용버튼 비활성화
	$("#msgSubmit").prop("disabled", true);
	
	showLoadingModal();
	
	
 var selectedMsgs = [];

 // 모든 체크박스를 반복하면서 선택된 항목을 확인합니다.
 $('input[name="msgIdx"]').each(function () {
     var msgIdx = $(this).val();
     var msgAmount = $(this).is(":checked") ? 1 : 0;
     selectedMsgs.push({ msgIdx: msgIdx, msgAmount: msgAmount });
 });

 // 서버로 선택된 조미료 정보를 전송합니다.
 $.ajax({
     type: "POST",
     url: "/addMySelectedMsg", // 적절한 엔드포인트를 지정하세요.
     data: JSON.stringify(selectedMsgs), // 선택된 조미료 정보를 JSON 형식으로 전송합니다.
     contentType: "application/json; charset=utf-8",
     success: function (response) {
         console.log("성공했나요");
         // 적용버튼 다시 활성화
         $("#msgSubmit").prop("disabled", false);
         hideLoadingModal();
         fetchUserMsgInfo(); // 서버 응답 후 체크박스 초기화
         location.reload();
     },
     error: function (err) {
         console.error("에러 발생: " + err);
      // 에러 발생 시도 "적용" 버튼을 다시 활성화
         $("#msgSubmit").prop("disabled", false);
         hideLoadingModal();
     }
 });
});

//체크박스를 업데이트하는 함수
function initializeCheckboxes() {
    // 각 Checkbox를 반복합니다.
    $('input[name="msgIdx"]').each(function () {
        var msgIdx = $(this).val(); // Checkbox의 value를 가져옵니다.
        var msgAmount = getMsgAmountById(msgIdx);

        // msgAmount가 1이면 Checkbox를 체크합니다.
        if (msgAmount === 1) {
            $(this).prop('checked', true);
        }
    });
}

//msgIdx에 해당하는 msgAmount를 찾는 함수
function getMsgAmountById(msgIdx) {
    if (userMsgInfo) {
        for (var i = 0; i < userMsgInfo.length; i++) {
            if (userMsgInfo[i].msgIdx == msgIdx) {
                return userMsgInfo[i].msgAmount;
            }
        }
    }
    // 해당하는 데이터를 찾지 못하면 기본값 0으로 처리합니다.
    return 0;
}

// 취소 버튼을 클릭할 때
$("#cancleTrdModal").click(function() {
    initializeCheckboxes(); // 체크박스 초기화
    // 여기에서 필요한 추가 작업 수행
});
