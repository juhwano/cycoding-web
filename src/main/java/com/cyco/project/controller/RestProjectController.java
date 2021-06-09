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
import com.cyco.project.vo.ProjectVO;

@RestController
@RequestMapping("/ajaxproject")
public class RestProjectController {

	@Autowired
	private ProjectService service;
	
	@RequestMapping(value="/filter", method = RequestMethod.GET)
	public List<ProjectVO> getFiltedProjectList(@RequestBody Map<String, String> data){
		//data : view에서 선택한 필터링
		//field_code , adr_code , p_state
		System.out.println("this is /filter");
		System.out.println("field_code : " + data.get("field_code"));
		System.out.println("adr_code : " + data.get("adr_code"));
		System.out.println("p_state : " + data.get("p_state"));
		System.out.println("skill_code : " + data.get("skill_code"));
		
		System.out.println(data.toString());

		//3개필터링(분야, 지역, 상태)
		List<String> Flist= service.getFilteredProjectList(data);
		//결과 
		if(Flist==null) {
			Flist = new ArrayList<String>();
		}
		
		System.out.println("Flist : " +Flist);
		
		
		//skill_code에 값이 있을경우
		if(!data.get("skill_code").equals("")) {
			
			//기술 필터링
			//위에서받은 Flist도 같이 넣어준다.
			Flist = service.getFilteredProjectSkillList(data,Flist);
			System.out.println("skill list : " + Flist);
		}
		System.out.println("after Flist : "+Flist);
		
		List<ProjectVO> list =service.getProjectList(Flist);
		
		return list;
	}
}
