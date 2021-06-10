package com.cyco.project.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


import com.cyco.project.service.ProjectService;
import com.cyco.project.vo.P_DurationVO;
import com.cyco.common.vo.AdrVo;
import com.cyco.common.vo.P_FieldVo;
import com.cyco.common.vo.PositionVo;
import com.cyco.common.vo.SkillVo;
import com.cyco.project.service.ProjectService;
import com.cyco.project.vo.PmemberCountVo;
import com.cyco.project.vo.V_PjAdrField_Join_V_PDetail;
import com.cyco.project.vo.V_PjSk;

@Controller
@RequestMapping(value="project")
public class ProjectController {
	
	@Autowired
	private ProjectService service;
	
	
	@RequestMapping(value="list")
	public String getProjectList(Model m) {
		System.out.println("this is /list");
		// 프로젝트 리스트 첫 페이지
		// 모든 프로젝트 리스트 바로 뿌려주기.
		List<V_PjAdrField_Join_V_PDetail> project_list = service.getProjectList("");
		
		//각 프로젝트의 기술스택 리스트
		List<V_PjSk> pjsk_list = service.getPjSkList();
		
		//지역 리스트
		List<AdrVo> adr_list = service.getAdrList();
		
		//분야 리스트
		List<P_FieldVo> field_list = service.getFieldList();
		
		//기술스택 리스트
		List<SkillVo> skill_list =service.getSkillList();
		
		//프로젝트 멤버 자리 개수 리스트
		List<PmemberCountVo> membercount_list = service.getPmemberCountList();
		
		
		
		m.addAttribute("project_list",project_list);
		m.addAttribute("pjsk_list",pjsk_list);
		m.addAttribute("adr_list",adr_list);
		m.addAttribute("field_list",field_list);
		m.addAttribute("skill_list",skill_list);
		m.addAttribute("membercount_list",membercount_list);
		
		
		
		System.out.println(project_list);
		System.out.println(adr_list);
		System.out.println(field_list);
		System.out.println(skill_list);
		
		return "Project/ProjectList";
	}
	
	
	@RequestMapping(value="create",method = RequestMethod.GET)
	public String ProjectAdd(Model model) {
		
		List<AdrVo> AdrList = service.getAdrList();
		List<P_FieldVo> FieldList = service.getFieldList();
		List<SkillVo> SkillList = service.getSkillList();
		List<PositionVo> PositionList = service.getPositionList();
		List<P_DurationVO> DurationList = service.getDurationList();
		
		
		
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
