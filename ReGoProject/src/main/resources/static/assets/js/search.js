
// 재료 DB 검색기능 ( 사용자 연관 X 사이트 디비 조회 )
$(document).ready(function() {
  const inputElement = $('#ingreName'); // 모달창 내의 input 요소 선택
  const searchList = $('#searchList');


  inputElement.on('input', function() {
    const searchTerm = inputElement.val();
    console.log(searchTerm);
    if (searchTerm.trim() !== '') {
    $.ajax({
      url: '/ingreSearch',
      method: 'GET',
      data: { ingreName: searchTerm },
      success: function(results) {
        console.log(results);
        updateSearchResults(results);
      },
      error: function(xhr, status, error) {
        console.error('AJAX 오류:', error);
      }
    });
   }else{
	   searchList.empty();
	   
   }
  });

  function updateSearchResults(results) {
	  const searchList = $('#searchList');

    searchList.empty();

    if (results.length > 0) {
      $.each(results, function(index, result) {
        const listItem = $('<li>').text(result.ingreName);
        listItem.on('click', function() {
          // 사용자가 항목을 선택했을 때 실행할 작업을 추가합니다.
        });
        searchList.append(listItem);
      });
    } else {
      const noResultsMessage = $('<li>').text('일치하는 항목이 없습니다.');
      searchList.append(noResultsMessage);
    }
  }
});
