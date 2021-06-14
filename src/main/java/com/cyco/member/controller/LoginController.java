package com.cyco.member.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.tomcat.jni.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.cyco.member.service.MemberService;

@Controller
public class LoginController {
		
	
	MemberService memberservice;
	
	@Autowired
	public void setMemberService(MemberService memberservice) {
		this.memberservice = memberservice;
	}
	
	
	  @RequestMapping(value="login", method = RequestMethod.GET)
	  public String login() {
		  
		  System.out.println("This is login by get");
		  
	  
	  return "Member/Login";
	  
	  }
	  
	  
	  @RequestMapping(value="checkLogin", method = RequestMethod.POST)
	  public ModelAndView checkInfo(String username, HttpSession session) {
		  
		  
		  HashMap<String, String> map = memberservice.getLoginedName(username);
		  
		  memberservice.checkDeleteDate(String.valueOf(map.get("MEMBER_ID")));
		  
		  ModelMap mmp = new ModelMap();
		  session.setAttribute("nickname", map.get("MEMBER_NICKNAME"));
	  
	  return new ModelAndView("Main/CycoMain",mmp);
	  
	  }
	
	  
	  
	  
	  
		/*
		 * @RequestMapping(value="kakaologin.cy") public String
		 * kakaoLogin(@RequestParam(value="code", required=false) String code) {
		 * System.out.println("code : " + code);
		 * 
		 * return "Main/CycoMain"; }
		 */

}
