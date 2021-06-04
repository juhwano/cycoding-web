package com.cyco.project.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/projectlist")
public class ProjectController {
	
	@RequestMapping("/")
	public String getProjectList() {
		
		return null;
	}
	
}
