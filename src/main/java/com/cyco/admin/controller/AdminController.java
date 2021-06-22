package com.cyco.admin.controller;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.cyco.admin.service.AdminService;
import com.cyco.common.vo.P_FieldVo;
import com.cyco.common.vo.PositionVo;
import com.cyco.common.vo.SkillVo;

@RequestMapping("/admin")
@Controller
public class AdminController {
	
	@Autowired
	private AdminService service;
	
	@RequestMapping(value="member", method=RequestMethod.GET)
	public String memberManage() {
		
		
		
		return "Admin/MemberMange";
	}
	@RequestMapping(value="/site", method=RequestMethod.GET)
	public String siteManage(Model m) {
		/*
			필요한 데이터들 : 
			1. 기술리스트
			2. 분야리스트
			3. 포지션리스트
		 */
		
		List<SkillVo> skillList = service.getSkillLsit();
		List<PositionVo> positionList = service.getPositionList();
		List<P_FieldVo> fieldList =  service.getFieldList();
		
		m.addAttribute("skillList",skillList);
		m.addAttribute("positionList",positionList);
		m.addAttribute("fieldList",fieldList);
		
		return "Admin/SiteManage";
	}
}
