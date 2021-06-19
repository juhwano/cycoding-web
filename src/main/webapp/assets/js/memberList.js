$(document).ready(function() {
   /* 회원카드 공간 */
   var card_section = $('#card_section');

   /* 포지션select */
   $(".m_sel").change(function() {
      console.log('셀렉트')


      card_section.empty();

      var position = $(".m_sel").val()

      console.log(position)

      $.ajax({
         url: "memberPosition/" + position,
         type: 'get',
         success: function(memberList) {
            console.log(memberList);
			if(memberList.length>0){
				$('#memberNickname').val('');
				$('.zerocontainer').css('display', 'none');

            $.each(memberList, function(index, member) {
	               let card = '<div class="cardNum">'
					 card += '<div class="card shadow">'
					 card += '<div class="m_img">'
					 card += '<img class="m_img_size"'
					 card += 'src="'+'/resources/upload/' + member.m_image + '">'
					 card += '</div>'
					 card += '<div class="card-body">'
					 card += '<h3 class="h5 mt-3 card-title">' + member.m_nick + '</h3>'
					 card += '<p class="card-text">' + member.position + '</p>'
					 card += '<p class="tags"># '+ member.skill +'</p>'
					 card += '<a href="memberdetailpage?memberid='+member.m_id+'" class="card_link">VIEW MORE</a>'
					 card += '</div> </div> </div>'
	               $(card_section).append(card);
            })
            
            startIndex = 1;
   			endIndex = 8;
            
            //더보기버튼 지우기
            //노출된 카드 개수
            var new_cardNum = $('.cardNum').length;
            if (new_cardNum < endIndex) {
            $(".moreBtn").css('display', 'none');
                 endIndex = endIndex+indexStep;
            }
         }
			else{
				$('.zerocontainer').css('display', 'block');
			}
		}

      })

   })

   /* 닉네임검색 */
   $("#memberSearch").click(function() {
      console.log('닉네임검색')

      var memberNickname = $("#memberNickname").val()
      console.log("검색할닉네임: " + memberNickname);

      if (memberNickname == "") {
         alert('검색어를 입력해주세요 😥')
         return;
      }

      card_section.empty();

      var searchurl = "memberSearch/" + memberNickname;

      $.ajax({
         url: searchurl,
         type: 'get',
         success: function(memberList) {
            console.log(memberList);
			if(memberList.length>0){
				$('.zerocontainer').css('display', 'none');
				$('.m_sel').val('전체').prop('selected', true);
            $.each(memberList, function(index, member) {
               let card = '<div class="cardNum">'
					 card += '<div class="card shadow">'
					 card += '<div class="m_img">'
					 card += '<img class="m_img_size"'
					 card += 'src="${pageContext.request.contextPath}/resources/upload/' + member.m_image + '">'
					 card += '</div>'
					 card += '<div class="card-body">'
					 card += '<h3 class="h5 mt-3 card-title">' + member.m_nick + '</h3>'
					 card += '<p class="card-text">' + member.position + '</p>'
					 card += '<p class="tags"># '+ member.skill +'</p>'
					 card += '<a href="memberdetailpage?memberid='+member.m_id+'" class="card_link">VIEW MORE</a>'
					 card += '</div> </div> </div>'
               $(card_section).append(card);

            })
            
            var cardNum = $('.cardNum').length;
            if (cardNum < endIndex) {
               $(".moreBtn").css('display', 'none');
            }
			}
			else{
				$('.zerocontainer').css('display', 'block');
			}
         }

      })

      $("#memberNickname").val('');

   })

   /* 탑버튼 */
   $(function() {
      $(window).scroll(function() {
         if ($(this).scrollTop() > 280) {
            $('#topBtn').fadeIn();
         } else {
            $('#topBtn').fadeOut();
         }
      });
      $("#topBtn").click(function() {
         $('html, body').animate({
            scrollTop: 0
         }, 10);
         return false;
      });
   });


   /* 더보기 memberMore.cy */
   //더보기 인덱스
   var startIndex = 1;
   var endIndex = 8;
   var indexStep = 8;

   //목록 마지막이면 더보기 버튼 없애기
   var cardNum = $('.cardNum').length;
   console.log("cardNum"+cardNum);
   console.log("endIndex"+endIndex);
   if (cardNum < endIndex) {
      $(".moreBtn").css('display', 'none');
      endIndex = endIndex+indexStep;
   }

   //더보기 클릭
   $(".moreBtn").click(function() {
      startIndex += indexStep;
      endIndex += indexStep;
      moreRead();
   })

   function moreRead() {
      $.ajax({
         url: "memberMore",
         type: 'get',
         success: function(memberList) {

            $.each(memberList, function(index, member) {
               //let cardList = "";
               //console.log("index세는중: "+index);
               //console.log("member로우넘: " + member.rownum);

               if (startIndex <= member.rownum && member.rownum <= endIndex) {
                  let card = '<div class="cardNum">'
					 card += '<div class="card shadow">'
					 card += '<div class="m_img">'
					 card += '<img class="m_img_size"'
					 card += 'src="${pageContext.request.contextPath}/resources/upload/' + member.m_image + '">'
					 card += '</div>'
					 card += '<div class="card-body">'
					 card += '<h3 class="h5 mt-3 card-title">' + member.m_nick + '</h3>'
					 card += '<p class="card-text">' + member.position + '</p>'
					 card += '<p class="tags"># '+ member.skill +'</p>'
					 card += '<a href="memberdetailpage?memberid='+member.m_id+'" class="card_link">VIEW MORE</a>'
					 card += '</div> </div> </div>'
                  $(card_section).append(card);
               }

            })
            
            //더보기버튼 지우기
               //노출된 카드 개수
               var new_cardNum = $('.cardNum').length;
               console.log("new_cardNum"+new_cardNum);
 			   console.log("endIndex"+endIndex);
               if (new_cardNum < endIndex) {
                  $(".moreBtn").css('display', 'none');
                  endIndex = endIndex+indexStep;
            	}
         }
      })
   }
})