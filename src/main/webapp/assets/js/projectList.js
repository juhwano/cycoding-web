let card;
 let step=6;
 let start = 6;
 let count;
 
 /* 페이지 모두 로딩 후 실행 */
 $(document).ready(function(){
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
    /* 필터링 함수 실행 */
    function filter(adr_code,field_code,skill_code,p_state){
        $.ajax({
            url:'/ajaxproject/filter',
            type: 'get',
            dataType:"text",
            data: {
                adr_code : adr_code,
                field_code :field_code,
                skill_code :skill_code,
                p_state :p_state
            },
            success:function(filtered_list){
                project_list = JSON.parse(filtered_list);

                /* 카드모은 div 비우고 moreBtn함수를 이용해 카드 달기 */
                $('#card_section').empty();
                start=0;
                moreBtn(project_list, start);
                                 
            }
        })
    }


     /* 검색 함수 실행 */
     function search(project_name){
         $.ajax({
             url:'/ajaxproject/search',
             type: 'get',
             dataType:"text",
             data: {projectname:project_name},
             success:function(membercount_list){
                 project_list = JSON.parse(membercount_list);
                 
                 /* 카드모은 div 비우고 moreBtn함수를 이용해 카드 달기 */
                 $('.form-select').val('').prop('selected', true);
                 $('#card_section').empty();
                 start=0;
                 moreBtn(project_list, start);
                 
             }
         })
     }
     
     /*더보기버튼 - 카드달아주는 함수 project_list : 프로젝트 리스트   current : 뿌려줄 시작 인덱스*/
     function moreBtn(project_list, current){
         /* 프로젝트 리스트가 존재 할 때만 함수 실행*/
         if(!project_list.length>0){
             //리스트는 없는데 더보기버튼이 있으면 안되기때문에 none
             $('#moreBtn').css('display', 'none');
             
         }
         else{
             //리스트가 존재한다면 더보기버튼 보여주기.
             $('#moreBtn').css('display', 'inline-block');
             /*
                 project_list 뿌리기
                 
                 end : 이번 for문의 끝
             */
             for(start =current+step; current<start; current++){
                     
                     
     card=		"	<!--	프로젝트카트	start	-->							"
     card+=		"	<div	class='col-12	col-md-6	col-lg-4	mb-5	cardNum'>					"
     card+=		"	<div	class='card	shadow'>								"
     card+=		"	<!--	카드헤더:	모집상태,분야,조회수	-->							"
     card+=		"	<div	class='card-header'>									"
     card+=		"	<div	class='p_state'>"+project_list[current].p_state+"	- "+project_list[current].field_name+"</div>"
     card+=		"	<div	class='p_views'><i	class='fas	fa-eye'>"+project_list[current].p_views+"	</i></div>					"
     card+=		"	</div>										"
     card+=		"	<!--	프로젝트이미지	-->								"
     card+=		"	<div	class='m_img'>									"
     card+=		"	<div	class='m_img_top'>									"
     card+=		"	<i	class='far	fa-heart	bookmark'></i>							"
     card+=		"	</div>										"
     card+=		"	<a href='/project/detail?project_id="+project_list[current].project_id+"'><img	class='m_img_size'	src='/assets/img/projectimg/"+project_list[current].p_image+"'></a>							"
     card+=		"	</div>										"
     card+=		"	<!--	프로젝트이름,	주언어	-->							"
     card+=		"	<div	class='card-body'>									"
     card+=		"	<a href='/project/detail?project_id="+project_list[current].project_id+"'><h3	class='h5	card-title	mt-3'>"+project_list[current].p_title+"</h3></a>"
     card+=		"	<div	class='p_footer'>									"
     card+=		"	<p	class='card-text	p_skill'>기술스택: "     
     /*기술스택, 모집인원 for문 시작*/
         for(let sk=0; sk<pjsk_list.length; sk++	){
             if(project_list[current].project_id == pjsk_list[sk].project_id){
                 card+=pjsk_list[sk].skill_name +" ";
             }
         }
     card+=		"</p>										"
     card+=		"	<p	class='card-text	p_team_memNum'>모집인원:								"
     
         for(let mem=0; mem<membercount_list.length; mem++	){
             if(project_list[current].project_id == membercount_list[mem].project_id){
                 card+=membercount_list[mem].m_count +"/"+ membercount_list[mem].total_count;
             }
         }										
     card+=		"	</p>										"
     card+=		"	</div>										"
     card+=		"	</div>										"
     card+=		"	</div>										"
     card+=		"	</div>										"
     card+=		"	<!--	프로젝트카드end	-->								"
     
                 /* card_section에 for문을 돌면서 card 추가 */
                 $('#card_section').append(card)
                 
                 /* 
                     리스트의 마지막이라면 현재 index를 start변수에 넣고 
                     더보기버튼 display : none
                 */
                     
                     if(current<project_list.length){
                         
                     }
                     if(current == project_list.length-1){
                         start=current;
                         $('#moreBtn').css('display', 'none');
                         break;
                     }
                 }
                 }
     }
     /* 더보기버튼 */
     $('#moreBtn').click(function(){
         moreBtn(project_list,start)
		
     })
     
     /* 이름으로 검색 : Enter키 눌리면 #searchIcon.click 이벤트 발생 */
     $("#ProjectNameSearch").keydown(function(key){
          if (key.keyCode == 13) {// keyCode 13 : Enter키
             $('#searchIcon').click()
         }
     })
     
     /* 검색 아이콘이 눌렸을때 이벤트 */
     $('#searchIcon').click(function(){
         //input태그의 값을 변수에 담에주고 search()함수 호출
         let project_name = $('#ProjectNameSearch').val();
         search(project_name);
     })

     /* 필터 select태그 선택시 이벤트 */
    $('.form-select').change(function (e) { 
         let adr_code = $('#adrSelect option:selected').val();
         let field_code = $('#fieldSelect option:selected').val();
         let skill_code = $('#skillSelect option:selected').val();
         let p_state = $('#stateSelect option:selected').val();
         
         filter(adr_code, field_code, skill_code, p_state);
     });
     
    /* new Swiper('.swiper-container', {

	slidesPerView : 3, // 동시에 보여줄 슬라이드 갯수
	spaceBetween : 30, // 슬라이드간 간격
	slidesPerGroup : 3, // 그룹으로 묶을 수, slidesPerView 와 같은 값을 지정하는게 좋음

	// 그룹수가 맞지 않을 경우 빈칸으로 메우기
	// 3개가 나와야 되는데 1개만 있다면 2개는 빈칸으로 채워서 3개를 만듬
	loopFillGroupWithBlank : true,

	loop : false, // 무한 반복

	pagination : { // 페이징
		el : '.swiper-pagination',
		clickable : true, // 페이징을 클릭하면 해당 영역으로 이동, 필요시 지정해 줘야 기능 작동
	},
	navigation : { // 네비게이션
		nextEl : '.swiper-button-next', // 다음 버튼 클래스명
		prevEl : '.swiper-button-prev', // 이번 버튼 클래스명
	},
	  breakpoints: { //반응형 조건 속성
        640: { //640 이상일 경우
          slidesPerView: 3, //레이아웃 2열
		  spaveBetween:10,
        },
        768: {
          slidesPerView: 3,
 			spaveBetween:20,
        },
        1024: {
          slidesPerView: 3,
			 spaveBetween:30,
        },
      }
});*/
   var swiper = new Swiper(".mySwiper", {
        slidesPerView: 3,
        spaceBetween: 30,
        slidesPerGroup: 3,
        loop: false,
        loopFillGroupWithBlank: true,
        pagination: {
          el: ".swiper-pagination",
          clickable: true,
        },
        navigation: {
          nextEl: ".swiper-button-next",
          prevEl: ".swiper-button-prev",
        },
      });
     
 })