package com.cyco.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
public class MemberDetail {
	
	@RequestMapping(value="memberdetail.cy")
	public String getMemberDetail(){
		
		return "/Member/MemberDetail";
	}

	
}
