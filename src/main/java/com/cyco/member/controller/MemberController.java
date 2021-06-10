package com.cyco.member.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cyco.common.vo.PositionVo;
import com.cyco.member.service.MemberService;
import com.cyco.member.vo.V_MlistVo;

@Controller
@RequestMapping("member")
public class MemberController {
	MemberService memberservice;
	
	@Autowired
	public void setMemberService(MemberService memberservice) {
		this.memberservice = memberservice;
	}
	
	@RequestMapping("list")
	public String memberList(Model m) {
		//기본회원목록넘기기
		List<V_MlistVo> memberList = memberservice.memberList();
		//포지션목록 넘기기
		List<PositionVo> positionList = memberservice.positionList();
		
		System.out.println("기본회원리스트 controller");
		System.out.println("memberlist"+memberList);
		
		m.addAttribute("memberList", memberList);
		m.addAttribute("positionList", positionList);
		
		return "Member/MemberList"; 
	}
}
