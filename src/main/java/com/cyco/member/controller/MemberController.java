package com.cyco.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MemberController {
	
	@RequestMapping(value="/register.do", method = RequestMethod.GET)
	public String join() {
		
		return "register";
		
	}
	
	@RequestMapping(value="/login.do", method = RequestMethod.GET)
	public String login() {
		
		return "member/login";
		
	}
	
}
