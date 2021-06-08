package com.cyco.project.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cyco.project.service.ProjectService;
import com.cyco.project.vo.ProjectVO;

@Controller
@RequestMapping(value="project")
public class ProjectController {
	
	@Autowired
	private ProjectService service;
	
	
	
	@RequestMapping(value="list")
	public String getProjectList() {
		System.out.println("this is /list");
		// 프로젝트 리스트 첫 페이지
		// 모든 프로젝트 리스트 바로 뿌려주기.
		List<ProjectVO> plist = service.getProjectList();
		System.out.println(plist);
		
		return "Project/ProjectList";
	}
}
