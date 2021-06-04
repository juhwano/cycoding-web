package com.cyco.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MemberController {
	
	@RequestMapping(value="/register.cy", method = RequestMethod.GET)
	public String join() {
		
		return "member/register";
		
	}
	
	@RequestMapping(value="/login.cy", method = RequestMethod.GET)
	public String login() {
		System.out.println("여기는 들어오나?");
		return "member/login";
		
	}
	
	
	
}
