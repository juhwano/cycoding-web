package com.cyco.project.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cyco.common.vo.AdrVo;
import com.cyco.common.vo.P_FieldVo;
import com.cyco.common.vo.SkillVo;
import com.cyco.project.service.ProjectService;
import com.cyco.project.vo.V_PjAdrField_Join_V_PDetail;

@Controller
@RequestMapping(value="project/")
public class ProjectController {
	
	@Autowired
	private ProjectService service;
	
	
	
	@RequestMapping(value="list")
	public String getProjectList(Model m) {
		System.out.println("this is /list");
		// 프로젝트 리스트 첫 페이지
		// 모든 프로젝트 리스트 바로 뿌려주기.
		List<V_PjAdrField_Join_V_PDetail> project_list = service.getProjectList();
		List<AdrVo> adr_list = service.getAdrList();
		List<P_FieldVo> field_list = service.getFieldList();
		List<SkillVo> skill_list =service.getSkillList();
		
		m.addAttribute("project_list",project_list);
		m.addAttribute("adr_list",adr_list);
		m.addAttribute("field_list",field_list);
		m.addAttribute("skill_list",skill_list);
		
		
		return "Project/ProjectList";
	}
}
