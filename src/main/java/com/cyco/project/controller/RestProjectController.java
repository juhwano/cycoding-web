package com.cyco.project.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.cyco.project.service.ProjectService;
import com.cyco.project.vo.ProjectNameVo;
import com.cyco.project.vo.V_PjAdrField_Join_V_PDetail;

import net.sf.json.JSONArray;

@RestController
@RequestMapping("ajaxproject")
public class RestProjectController {

	@Autowired
	private ProjectService service;
	
	@RequestMapping(value="filter", method = RequestMethod.GET)
	public List<V_PjAdrField_Join_V_PDetail> getFiltedProjectList(@RequestBody Map<String, String> data){
		
		//리턴할 List객체 초기화
		List<V_PjAdrField_Join_V_PDetail> list =null;
		
		List<String> FSK_list;
		
		
		//data : view에서 선택한 필터링
		System.out.println(data.toString());

		//3개필터링(분야, 지역, 상태)
		List<String> Flist= service.getFilteredProjectList(data);
		
		
		//결과 Flist가 null이라는건 input이 하나도 없다는 뜻.
		//빈 배열로 초기화 해준다.
//		if(Flist==null) {
//			Flist = new ArrayList<String>();
//		}
		
		
		//skill_code에 값이 있을 경우
//		if(!data.get("skill_code").equals("")) {
			
			//기술 필터링
			//위에서받은 Flist도 같이 넣어준다.
//		Flist = service.getFilteredProjectSkillList(data,Flist);
		Flist = service.getFilteredProjectSkillList(data,Flist);
			System.out.println("skill list : " + Flist);
//		}
		
//		Flist : 3개를 필터링 한 값이 있고
//		FSK_list skill을 필터링 한 값이 있으면
		if(Flist!=null) {
			 list =service.getProjectList(Flist,data.get("p_state"));
		}
		else if(Flist == null) {
			list = service.getProjectList(data.get("p_state"));
		}
		return list;
	}
	
	@RequestMapping(value = "search", method=RequestMethod.GET)
	public List<V_PjAdrField_Join_V_PDetail> getSearchedProjectList(@RequestParam Map<String,String> projectname){
		//리턴할 List객체 초기화
		System.out.println(projectname);
		List<V_PjAdrField_Join_V_PDetail> searched_list =null;
		searched_list = service.getSearchedProjectList(projectname);
		
		return searched_list;
		
	}
}
