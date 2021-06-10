$(function() {

			var memberNum = 1;

			// 포지션 추가 버튼
			$('.PositionAdd').click(function() {

				if (memberNum < 10) {
					$('#PositionBox').append(selectBox);
					memberNum++;
				}

				if (memberNum == 10) {
					swal("맴버는 10명이상의 구인이 불가능합니다.", "", "error");
				}

			})

			// 포지션 삭제 버튼
			$('.PositionDel').click(function() {
				if (memberNum > 1) {
					var DelNum = $('.project_boxdiv').last()[0].children[1].children[1];
					
					$('.project_boxdiv').last().remove();
					
					memberNum -= $(DelNum).text();
				}

			})

			// 맴버 + - 버튼 클릭 이벤트
			$(document).off("click").on('click', '.BtnWarp', function() {

				var UpBtn = $(this)[0].children[0];
				var DownBtn = $(this)[0].children[2];
				var Count = $(this)[0].children[1];

				// + 이벤트
				$(UpBtn).off("click").click(function() {

					if (memberNum < 10) {

						var Count_ = parseInt($(Count).text()) + 1;

						$(Count).text(Count_);

						memberNum++;

					} else {
						swal("맴버는 10명이상의 구인이 불가능합니다.", "", "error");
					}

				})

				// - 이벤트
				$(DownBtn).off("click").click(function() {

					if (parseInt($(Count).text()) > 1) {
						var Count_ = parseInt($(Count).text()) - 1;

						$(Count).text(Count_);

						memberNum--;
					}

				})

			})
			
			
			// 스킬 셀렉트
			//클릭하면 태그 선택
	        $(document).on("click",".tags",function(){

	            let name = $(this).text();
	            selected= $(".clicked");


                $(this).addClass("clicked");
                $(this).removeClass("tags");
                $("#selectedarea").append($(this));
            


	        });

              //클릭하면 태그 선택 해제
              $(document).on("click",".clicked",function(){

                  let name = $(this).text();
           
                  $(this).removeClass("clicked");
                  $(this).addClass("tags");
                  $("#tagarea").append($(this));
              });

             $('#target_img').click(function (e) {
               
                 $('#file').click();
             }); 
             
             
             $('#file').change(function(event) {
         		var reader = new FileReader();

         		reader.onload = function(event) {
         			$('#target_img').attr("src", event.target.result);
					
         		}

         		reader.readAsDataURL(event.target.files[0]);
         	})

	                
		})