package com.cyco.member.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.cyco.member.service.MemberDetailService;
import com.cyco.member.service.MemberService;


@Controller
public class MemberDetailContoller {
	
	MemberDetailService memberdetailservice;
	
	@Autowired
	public void setMemberDetailService(MemberDetailService memberdetailservice) {
		this.memberdetailservice = memberdetailservice;
	}
	
	//마이페이지 정보 불러오기
	@RequestMapping(value="mypage.cy")
	public ModelAndView getMyDetail(@RequestParam("useremail") String useremail){
		
		System.out.println("클라이언트에서 로그인 한 이메일 : " + useremail);
		
		ModelMap mmp = new ModelMap();
		
		mmp.addAttribute("aboutmember", memberdetailservice.getMyDetail(useremail));
		mmp.addAttribute("skills",memberdetailservice.getPreferSkills(useremail));
		mmp.addAttribute("position",memberdetailservice.getPreferPosition(useremail));
		mmp.addAttribute("durations",memberdetailservice.getPreferDurations(useremail));
		
		System.out.println(memberdetailservice.getPreferSkills(useremail));
		System.out.println(memberdetailservice.getPreferDurations(useremail));
		
		return new ModelAndView("/Member/Mypage",mmp) ;
	}
	


	
}
