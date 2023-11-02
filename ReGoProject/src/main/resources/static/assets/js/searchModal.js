
/*	$(document).ready(function() {
		const inputElement = $('#ingreName'); // 모달창 내의 input 요소 선택
		const searchList = $('#searchList');

		inputElement.on('input', function() {
			const searchTerm = inputElement.val();
			if (searchTerm.trim() !== '') {
				$.ajax({
					url : '/searchMyIngre',
					method : 'POST',
					data : {
						ingreName : searchTerm,
						custId : '${user.custId}'
					},
					success : function(results) {
						updateSearchResults(results);
						console.log(results)
					},
					error : function(xhr, status, error) {
						console.error('AJAX 오류:', error);
					}
				});
			} else {
				searchList.empty();

			}
		});
		
		
		
		function updateSearchResults(results) {
		    const searchList = $('#searchList');
		    searchList.empty();

		    // 결과의 유형을 확인합니다.
		    if (results.type === 'searchIngre') {
		        // searchIngre 유형일 경우
		        results.data.forEach(function(result) {
		            const ingreName = result.ingreName;
		            const ingreIdx = result.ingreIdx;
		            const ingreImg = result.ingreImg;

		            const listItem = $('<li>').text(ingreName);
		            const addButton = $('<button>').text('추가').addClass('w-1/2 px-5 text-sm font-medium leading-5 text-white transition-colors duration-150 bg-purple-600 border border-transparent rounded-lg sm:w-auto sm:px-4 sm:py-2 active:bg-purple-600 hover:bg-purple-700 focus:outline-none focus:shadow-outline-purple');

		            addButton.on('click', function() {
		                // 추가 버튼을 누를 때 처리를 추가합니다.
		                // 예: 클릭 이벤트 핸들러
		            });

		            listItem.append(addButton);
		            searchList.append(listItem);
		        });
		    } else if (results.type === 'searchMyIngre') {
		        // searchMyIngre 유형일 경우
		        for (const ingreName in results) {
		            if (ingreName !== 'type') {
		                const ingreAmount = results[ingreName];

		                const listItem = $('<li>').text(ingreName + ' ');

		                if (ingreAmount === '1') {
		                    const textSpan = $('<span>').text(' 보유중');
		                    textSpan.css('color', 'red');
		                    listItem.append(textSpan);
		                } else {
		                    const addButton = $('<button>').text('추가').addClass('w-1/2 px-5 text-sm font-medium leading-5 text-white transition-colors duration-150 bg-purple-600 border border-transparent rounded-lg sm:w-auto sm:px-4 sm:py-2 active:bg-purple-600 hover:bg-purple-700 focus:outline-none focus:shadow-outline-purple');

		                    addButton.on('click', function() {
		                        // 추가 버튼을 누를 때 처리를 추가합니다.
		                        // 예: 클릭 이벤트 핸들러
		                    });

		                    listItem.append(addButton);
		                }

		                listItem.addClass('text-center');
		                searchList.append(listItem);
		            }
		        }
		    }
		}

	});
	
	*/
	

// 재료 검색창 눌렀을때 나오는 모달창 실제 기능이 여기서 작동함 윗 코드는 안씀 다른데서 재활용 해도 됩니다.
/////////////////////////////////////////////////////////////////////////////////// 
	
	
	
	$(document).ready(function() {
		const inputElement = $('#ingreName2'); // 모달창 내의 input 요소 선택
		const searchList = $('#searchList2');

		inputElement.on('input', function() {
			const searchTerm = inputElement.val();
			if (searchTerm.trim() !== '') {
				$.ajax({
					url : '/searchMyIngre',
					method : 'POST',
					data : {
						ingreName : searchTerm,
						custId : '${user.custId}'
					},
					success : function(results) {
						updateSearchResults(results);
					},
					error : function(xhr, status, error) {
						console.error('AJAX 오류:', error);
					}
				});
			} else {
				searchList.empty();

			}
		});
		
		
		
		function updateSearchResults(results) {
		    const searchList = $('#searchList2');
		    searchList.empty();

		    // 결과의 유형을 확인합니다.
		    if (results.type === 'searchIngre') {
		        // searchIngre 유형일 경우
		        results.data.forEach(function(result) {
		            const ingreName = result.ingreName;
		            const ingreIdx = result.ingreIdx;
		            const ingreImg = result.ingreImg;

		            const listItem = $('<li>').text(ingreName);
		            const addButton = $('<button>').text('추가').addClass('w-1/2 px-5 text-sm font-medium leading-5 text-white transition-colors duration-150 bg-purple-600 border border-transparent rounded-lg sm:w-auto sm:px-4 sm:py-2 active:bg-purple-600 hover:bg-purple-700 focus:outline-none focus:shadow-outline-purple');

		            addButton.on('click', function() {
		                // 추가 버튼을 누를 때 처리를 추가합니다.
		                // 예: 클릭 이벤트 핸들러
		            });

		            listItem.append(addButton);
		            searchList.append(listItem);
		        });
		    } else if (results.type === 'searchMyIngre') {
		        // searchMyIngre 유형일 경우
		        for (const ingreName in results) {
		            if (ingreName !== 'type') {
		                const ingreAmount = results[ingreName];

		                const listItem = $('<li>').text(ingreName + ' ');

		                if (ingreAmount === '1') {
		                    const textSpan = $('<span>').text(' 보유중');
		                    textSpan.css('color', 'red');
		                    listItem.append(textSpan);
		                } else {
		                    const addButton = $('<button>').text('추가').addClass('w-1/2 px-5 text-sm font-medium leading-5 text-white transition-colors duration-150 bg-purple-600 border border-transparent rounded-lg sm:w-auto sm:px-4 sm:py-2 active:bg-purple-600 hover:bg-purple-700 focus:outline-none focus:shadow-outline-purple');

		                    addButton.on('click', function() {
		                        // 추가 버튼을 누를 때 처리를 추가합니다.
		                        // 예: 클릭 이벤트 핸들러
		                    });

		                    listItem.append(addButton);
		                }

		                listItem.addClass('text-center');
		                searchList.append(listItem);
		            }
		        }
		    }
		}

	});
	
	