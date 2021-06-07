package com.cyco.member.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cyco.member.service.MemberService;
import com.cyco.member.vo.MemberVo;
import com.cyco.member.vo.PositionVo;

@Controller
public class MemberController {
	MemberService memberservice;
	
	@Autowired
	public void setMemberService(MemberService memberservice) {
		this.memberservice = memberservice;
	}
	/*
	@RequestMapping("memberlist.cy")
	public ModelAndView memberList() {
		
		ModelAndView mv = memberservice.memberList();
		
		return mv; 
	}
	*/
	
	@RequestMapping("memberlist.cy")
	public String memberList(Model m) {
		//회원목록
		List<MemberVo> memberList = memberservice.memberList();
		//포지션목록(셀렉트박스용)
		List<PositionVo> positionList = memberservice.positionList();
		
		m.addAttribute("memberList", memberList);
		m.addAttribute("positionList", positionList);
		
		return "Member/MemberList"; 
	}
}
