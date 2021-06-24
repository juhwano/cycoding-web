package com.cyco.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.cyco.admin.service.AdminService;
import com.cyco.admin.vo.MemberListVo;
import com.cyco.common.vo.P_FieldVo;
import com.cyco.common.vo.PositionVo;
import com.cyco.common.vo.SkillVo;
import com.cyco.member.vo.V_MlistVo;

@RequestMapping("/admin")
@Controller
public class AdminController {
	
	@Autowired
	private AdminService service;
	
	@RequestMapping(value="/member", method=RequestMethod.GET)
	public String memberManage(Model m) {
		/*
		 	필요한 데이터들 : < 회원 >
		 	1. 회원번호 / 닉네임 / 포지션 / 대표기술
		 		private int m_id;
				private String m_nick;
				private String position;
				private String skill;
				
		 	2. 참여했었고 완료된 프로젝트 회수
		 
		 */
		List<MemberListVo> memberList = service.getMemberList();
		m.addAttribute("memberList",memberList);
		
		return "Admin/MemberManage";
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
