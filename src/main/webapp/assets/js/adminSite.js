
 $(document).ready(function(){
	
    $("#skillInput").keydown(function(key){
        console.log("skillInput");
              if (key.keyCode == 13) {// keyCode 13 : Enter키
                console.log("enter keydown");
                var skill_name = $(this).val();
				var tagslist = document.querySelectorAll('input[name=skill_name]');
				console.log(tagslist)
				var check=false;
				
				if(skill_name.trim()==""){
					check=true;
					swal({
                        text:"기술 이름을 입력해주세요.",
                        icon:"warning"
                     })
                     .then(()=>{
						swal.close();
						$('#skillInput').val('');
                        $('#skillInput').focus();
                     });
				}
				else{
				$.each(tagslist, function(index,val){
					console.log(val.value);
					console.log(skill_name);
					if(val.value == skill_name){
						check=true; 
						swal({
                                text:"중복되는 이름이 존재합니다.",
                                icon:"error"
                             })
                             .then(()=>{
								$('#skillInput').val('');
                                $('#skillInput').focus();
                             });
						
					}
				})
				}
				if(!check){
                $.ajax({
                    type:"get",
                    url:"/ajaxadmin/skill",
                    data:{name:skill_name},
                     dataType:"text",
                     success:function(result){
             console.log("result : " + result);
                         if(result=="true"){
                             swal({
                                text:"중복되는 이름이 존재합니다.",
                                icon:"error"
                             })
                             .then(()=>{
								$('#skillInput').val('');
                                $('#skillInput').focus();
                             });
                             
                         }else if(result=="false"){
                            $('#skillInput').val('');
                             //새로만들어진 tag는 new라는 클래스를 붙여준다.
                             let tags="<div class='tags new'>"
                             tags +="<input type='text' name='skill_name' value='"+skill_name+"' readonly='readonly'>"
                             tags += "<input type='text' name='skill_enabled' value='1' hidden=''>"
                             tags +="</div>"
                             $('#skill_tagarea').append(tags);
                         }
                     }
                })
			}
           
        }
    })

	 $(document).on("click",".tags",function(){
		
		//새로만들어진 태그가 아니라면
		if(!$(this).hasClass("new")){
        	$(this).addClass("updated");
		}

        var update = $(this).addClass("clicked")[0].children[1];
        $(update).attr("value","0");
        
        $(this).removeClass("tags");
 		$(this).addClass("clicked");
        $("#skill_selectedarea").append($(this));
    });

      //클릭하면 태그 선택 해제
      $(document).on("click",".clicked",function(){
          
			//새로만들어진 태그가 아니라면
			if(!$(this).hasClass("new")){
	        	$(this).addClass("updated");
			}

          var update = $(this).addClass("clicked")[0].children[1];
          $(update).attr("value","1");
            
          $(this).removeClass("clicked");
          $(this).addClass("tags");
          
          $("#skill_tagarea").append($(this));
      });

	$(document).on("click","#skillBtn",function(){
		
		
        var newtags = document.querySelectorAll('.new');
		var updatedtags = document.querySelectorAll('.updated');
		var new_arr=[];
		var update_arr=[];

		if(newtags.length>0 || updatedtags.length>0){
			
		//새로 추가된 태그들
        if(newtags.length>0){
            $.each(newtags, function(index, value){
                console.log(index);
                var insert_json={};
                $.each(value.children, function(ind,atr){
                    insert_json[atr.name]=atr.value;
                })
                new_arr.push(insert_json)
            })
            console.log(new_arr)
        }
      
		
		//활성화 여부가 업데이트된 태그들
        if(updatedtags.length>0){
            $.each(updatedtags, function(index, value){
                var update_json={};
                $.each(value.children, function(ind,atr){
                    update_json[atr.name]=atr.value;
                })
                update_arr.push(update_json);
            })
            console.log(update_arr)
        }
		var data={};
		data["new"]=new_arr;
		data["update"]=update_arr;
		console.log(data);
        $.ajax({
            type:"post",
            url:"/ajaxadmin/skill",
			contentType: "application/json",
            data:JSON.stringify(data),
            dataType:"json",
            success:function(result){
                 swal({
                        text:"추가 : "+result.add+"개\n"
							+"수정 : "+result.update+"개\n"
							+"완료 되었습니다.",
                        icon:"success"
                     })
                     .then(()=>{
						window.location.reload();
                     });
            }
        })
	}
	else{
		  swal({
                text:"수정할 내역이 없습니다.",
                icon:"error"
             })
	}
    })
})