/* 리뷰 작성용 카드 */
let reviewCard; 
/* 리뷰 작성 모달 테이블 */
var reviewWriteTable = $('.reviewWriteTable');

/* 리뷰 작성 모달 */
$(".reviewWrite").on("click",function(){
	
	var projectid = $(this).attr('id');
	console.log("프로젝트아이디"+projectid);
	
	
	$.ajax({
        url:"ajax/writeReviewMember?projectid="+projectid,
        type:"get",
        dataType:"text",
        success:function(data){
            console.log("팀원목록"+data);
            
            memberList = JSON.parse(data);
            
            reviewWriteTable.empty();
            
            /*for(let i = 0; i < memberList.length; i++) {*/
             $.each(memberList, function(index, member){
				if(member.position_name == '팀장') {
					
				reviewCard =	"	<tr>	"
				reviewCard +=	"	<input type='hidden' name='review_member' value='"+member.teamleader+"'>	"
				reviewCard +=	"	<input type='hidden' name='review_member' value='"+member.project_id+"'>	"
				reviewCard +=	"	<td>"+member.member_nickname+"</td>	"
				reviewCard +=	"	<td>팀장 <i class='fas fa-crown leaderIcon'></i></td>	"
				reviewCard +=	"	<td><input type='text' name='review_content' class='writeReviewContent form-control'></td>	"
				reviewCard +=	"	<td><div class='star-input'>	"
				reviewCard +=	"	<input type='hidden' name='review_grade' class='gradesubmit' value=''>	"
				reviewCard +=	"	<span class='input'> 	"
				reviewCard +=	"	<input type='radio' name='star-input' value='1' id='p1'> <label for='p1'>1</label> 	"
				reviewCard +=	"	<input type='radio' name='star-input' value='2' id='p2'> <label for='p2'>2</label> 	"
				reviewCard +=	"	<input type='radio' name='star-input' value='3' id='p3'> <label for='p3'>3</label>  "
				reviewCard +=	"	<input type='radio' name='star-input' value='4' id='p4'> <label for='p4'>4</label>	"
				reviewCard +=	"	<input type='radio' name='star-input' value='5' id='p5'> <label for='p5'>5</label> 	"
				reviewCard +=	"	</span>	"
				reviewCard +=	"	</div>	"
				reviewCard +=	"	</td>	"
				reviewCard +=	"	</tr>	"
				
				reviewWriteTable.append(reviewCard);
				}
				
			})
				
			$.each(memberList, function(index, member){
				if(member.position_name != '팀장') {
					
				reviewCard =	"	<tr>	"
				reviewCard +=	"	<input type='hidden' name='review_member' value='"+member.teammember+"'>	"
				reviewCard +=	"	<input type='hidden' name='review_member' value='"+member.project_id+"'>	"
				reviewCard +=	"	<td>"+member.member_nickname+"</td>	"
				reviewCard +=	"	<td>"+member.position_name+"</td>	"
				reviewCard +=	"	<td><input type='text' name='review_content' class='writeReviewContent form-control'></td>	"
				reviewCard +=	"	<td><div class='star-input'>	"
				reviewCard +=	"	<input type='hidden' name='review_grade' class='gradesubmit' value=''>	"
				reviewCard +=	"	<span class='input'> 	"
				reviewCard +=	"	<input type='radio' name='star-input' value='1' id='p1'> <label for='p1'>1</label> 	"
				reviewCard +=	"	<input type='radio' name='star-input' value='2' id='p2'> <label for='p2'>2</label> 	"
				reviewCard +=	"	<input type='radio' name='star-input' value='3' id='p3'> <label for='p3'>3</label>  "
				reviewCard +=	"	<input type='radio' name='star-input' value='4' id='p4'> <label for='p4'>4</label>	"
				reviewCard +=	"	<input type='radio' name='star-input' value='5' id='p5'> <label for='p5'>5</label> 	"
				reviewCard +=	"	</span>	"
				reviewCard +=	"	</div>	"
				reviewCard +=	"	</td>	"
				reviewCard +=	"	</tr>	"
				
				reviewWriteTable.append(reviewCard);
				}
			})
            
        },
        error:function(xhr){
            console.log(xhr);
        }

    });
    
})


/*별점 : .star-input*/
/*출처 : http://codepen.io/naradesign/pen/zxPbOw*/
var starRating = function(){
		var $star = $(".star-input"),
		    $result = $star.find("output>b");
			
		  	$(document)
		  	.on("focusin", ".star-input>.input", 
				function(){
		   		 $(this).addClass("focus");
		 	})
				 
		   	.on("focusout", ".star-input>.input", function(){
		    	var $this = $(this);
		    	setTimeout(function(){
		      		if($this.find(":focus").length === 0){
		       			$this.removeClass("focus");
		     	 	}
		   		}, 100);
		 	 })
		  
		    .on("change", ".star-input :radio", function(){
		    	$result.text($(this).next().text());
		    	
		    	var grade_code = $('.star-input>.input').find(":checked").val()
		
		    	$('.gradesubmit').val($('.star-input>.input').find(":checked").val());
		  	})
		    .on("mouseover", ".star-input label", function(){
		    	$result.text($(this).text());
		    })
		    .on("mouseleave", ".star-input>.input", function(){
		    	var $checked = $star.find(":checked");
		    		if($checked.length === 0){
		     	 		$result.text("0");
		   		 	} else {
		     	 		$result.text($checked.next().text());
		    		}
		  	});
		};

		starRating();