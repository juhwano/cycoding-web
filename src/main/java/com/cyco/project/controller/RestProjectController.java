package com.cyco.project.controller;

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

@RestController
@RequestMapping("/ajaxproject")
public class RestProjectController {

	@Autowired
	private ProjectService service;
	
	@RequestMapping(value="/filter", method = RequestMethod.GET)
	public String getFiltedProjectList(@RequestBody Map<String, String> data){
		//data : view에서 선택한 필터링
		//field_code , adr_code , p_state
		System.out.println("this is /filter");
		System.out.println("field_code : " + data.get("field_code"));
		System.out.println("adr_code : " + data.get("adr_code"));
		System.out.println("p_state : " + data.get("p_state"));
		System.out.println("skill_code : " + data.get("skill_code"));
		
		
		String skill_code = data.get("skill_code");

		
		
		List<String> Flist= service.getFilteredProjectList(data);
		
		System.out.println("Flist : " +Flist);
		
		//skill_code에 값이 있을경우
		if(!data.get("skill_code").equals("")) {
			List<String> list = service.getFilteredProjectSkillList(skill_code);
			System.out.println("skill list : " + list);
			Flist.addAll(list);
		}
		System.out.println("after Flist : "+Flist);
		
//		service.getProjectList(Flist);
		
		return null;
	}
}
