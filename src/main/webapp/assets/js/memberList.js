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
         //data: {position:position},
         type: 'get',
         //dataType: 'text',
         success: function(memberList) {
            console.log(memberList);

            $.each(memberList, function(index, member) {
	
			for(var index = 0; index < 8 ; index++){
	               var card = "<div class='col-12 col-md-6 col-lg-4 mb-5'>";
	               card += "<div class='card shadow'> <div class='m_img'>";
	               card += "<img class='m_img_size' src='$&#123;pageContext.request.contextPath&#125;/assets/img/ain_test/" + member.m_image + "'> </div>";
	               card += "<div class='card-body'>";
	               card += "<h3 class='h5 card-title mt-3'>" + member.m_nick + "</h3>";
	               card += "<p class='card-text'>";
	               card += "- 선호포지션: " + member.position + " <br> - 기술스택: " + member.skill;
	               card += "</p> </div> </div> </div>";
	               $(card_section).append(card);
               }
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

            $.each(memberList, function(index, member) {
               var card = "<div class='col-12 col-md-6 col-lg-4 mb-5'>";
               card += "<div class='card shadow'> <div class='m_img'>";
               card += "<img class='m_img_size' src='${pageContext.request.contextPath}/assets/img/ain_test/" + member.m_image + "'> </div>";
               card += "<div class='card-body'>";
               card += "<h3 class='h5 card-title mt-3'>" + member.m_nick + "</h3>";
               card += "<p class='card-text'>";
               card += "- 선호포지션: " + member.position + " <br> - 기술스택: " + member.skill;
               card += "</p> </div> </div> </div>";
               $(card_section).append(card);

            })
            
            var cardNum = $('.cardNum').length;
            if (cardNum < endIndex) {
               $(".moreBtn").css('display', 'none');
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
      moreRead(startIndex);
   })

   function moreRead(index) {
      $.ajax({
         url: "memberMore",
         type: 'get',
         success: function(memberList) {

            $.each(memberList, function(index, member) {
               //let cardList = "";
               //console.log("index세는중: "+index);
               //console.log("member로우넘: " + member.rownum);

               if (startIndex <= member.rownum && member.rownum <= endIndex) {
                  let card = "<div class='col-12 col-md-6 col-lg-4 mb-5'>";
                  card += "<div class='card shadow'> <div class='m_img'>";
                  card += "<img class='m_img_size' src='${pageContext.request.contextPath}/assets/img/ain_test/" + member.m_image + "'> </div>";
                  card += "<div class='card-body'>";
                  card += "<h3 class='h5 card-title mt-3'>" + member.m_nick + "</h3>";
                  card += "<p class='card-text'>";
                  card += "- 선호포지션: " + member.position + " <br> - 기술스택: " + member.skill;
                  card += "</p> </div> </div> </div>";
                  $(card_section).append(card);
               }

            })
            
            //더보기버튼 지우기
               //노출된 카드 개수
               var new_cardNum = $('.cardNum').length + indexStep;
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