$(document).ready(function() {
	console.log("오냐?")
$(".deletebtn").click(function() {
	console.log("오냐")
    var ingreList = [];

    $("input[type=checkbox]:checked").each(function() {
    	console.log("오냐2")
        ingreList.push($(this).val());
    });

    if (ingreList.length > 0) {
    		 // "삭제중" 모달 띄우기
            var deletingModal = Swal.fire({
                icon: "info",
                title: "삭제 중",
                text: "잠시만 기다려주세요...",
                showConfirmButton: false,
                allowOutsideClick: false,
                allowEscapeKey: false
            });
        $.ajax({
            type: "POST",
            url: "/deleteIngreList",
            contentType: "application/json",
            data: JSON.stringify(ingreList),
            success: function(response) {
            
                    deletingModal.close(); // "삭제중" 모달 닫기
            	console.log(response)
                if (response == "success") {
                	 Swal.fire({
                         icon: "success",
                         title: "성공",
                         text: "선택한 재료가 삭제되었습니다.",
                         showConfirmButton: true
                     }).then(function() {
                         location.reload();
                     });
                } else if (response == "error") {
                	console.log(response)
                    Swal.fire({
                        icon: "error",
                        title: "오류",
                        text: "삭제 중 오류가 발생했습니다.",
                        showConfirmButton: true
                    });
                }
            },
            error: function(err) {
            	console.log(err)
            	
                    deletingModal.close(); // "삭제중" 모달 닫기
                Swal.fire({
                    icon: "error",
                    title: "오류",
                    text: "서버와 통신 중 오류가 발생했습니다.",
                    showConfirmButton: true
                });
            }
        });
    } else {
        Swal.fire({
            icon: "warning",
            title: "알림",
            text: "삭제할 재료를 선택하세요.",
            showConfirmButton: true
        });
    }
});

	});
  