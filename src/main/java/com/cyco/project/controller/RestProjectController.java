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
	
	@RequestMapping(value="", method = RequestMethod.GET)
	public String getFiltedProjectList(@RequestBody Map<String, String> data){
		System.out.println("this is /filter");
		System.out.println("field_code : " + data.get("field_code"));
		System.out.println("adr_code : " + data.get("adr_code"));
		System.out.println("p_state : " + data.get("p_state"));
		
		List<String> list= service.getFiltedProjectList(data);
		service.getProjectList(list);
		
		return null;
	}
}
