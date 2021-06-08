package com.cyco.member.controller;

import javax.websocket.server.PathParam;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class LoginRestController {
	
		@RequestMapping(value="kakaologinajax.cy/{email}", method=RequestMethod.POST)
		public String checkKakaoMail(@PathParam("email")String email) {
		
		System.out.println("This is checkKakaoMail restcontroller");
		
		System.out.println("카카로 계정으로 로그인하는 이메일 : " + email);
		
		//로그인 작업
		
		String idChk = "true";
		
		
		return idChk;
		}
		
		@RequestMapping(value="kakaologin.cy/{email}", method=RequestMethod.POST)
		public String kakaoLogin(@PathParam("email")String email) {
			
			System.out.println("This is kakaologin restcontroller");
			
			System.out.println("카카로 계정으로 로그인하는 이메일 : " + email);
			
			//로그인 작업
			
			
			return "Main/CycoMain";
		}
}
