package com.cyco.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class LoginController {
	
	  @RequestMapping(value="login.cy", method = RequestMethod.GET)
	  public String login() {
		  
		  System.out.println("This is login by get");
	  
	  return "Member/Login";
	  
	  }
	
	  
	  
	  
	  
		/*
		 * @RequestMapping(value="kakaologin.cy") public String
		 * kakaoLogin(@RequestParam(value="code", required=false) String code) {
		 * System.out.println("code : " + code);
		 * 
		 * return "Main/CycoMain"; }
		 */

}
