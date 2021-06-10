package com.cyco.project.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.cyco.member.vo.PositionVo;
import com.cyco.project.service.ProjectService;
import com.cyco.project.vo.AdrVO;
import com.cyco.project.vo.FieldVO;
import com.cyco.project.vo.P_DurationVO;
import com.cyco.project.vo.ProjectVO;
import com.cyco.project.vo.SkillVO;

@Controller
@RequestMapping(value="project")
public class ProjectController {
	
	@Autowired
	private ProjectService service;
	
	
	
	@RequestMapping(value="list")
	public String getProjectList() {
		System.out.println("this is /list");
		List<ProjectVO> plist = service.getProjectList();
		System.out.println(plist);
		
		return "Project/ProjectList";
	}
	
	
	@RequestMapping(value="create",method = RequestMethod.GET)
	public String ProjectAdd(Model model) {
		
		List<AdrVO> AdrList = service.getAdr();
		List<FieldVO> FieldList = service.getProjectField();
		List<SkillVO> SkillList = service.getSkill();
		List<PositionVo> PositionList = service.getPosition();
		List<P_DurationVO> DurationList = service.getDuration();
		
		
		
		model.addAttribute("AdrList", AdrList);
		model.addAttribute("FieldList", FieldList);
		model.addAttribute("SkillList", SkillList);
		model.addAttribute("PositionList", PositionList);
		model.addAttribute("DurationList", DurationList);
		
		return "Project/ProjectCreate";
	}
	
	@RequestMapping(value="create",method = RequestMethod.POST)
	public String ProjectAdd() {
		
		
		
		System.out.println("프로젝트 생성 하기");
		
		return null;
	}
	
}
