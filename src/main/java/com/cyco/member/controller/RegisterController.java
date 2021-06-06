package com.cyco.member.controller;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.cyco.member.service.MemberService;
import com.cyco.member.vo.MemberVo;


@Controller
public class RegisterController {
	
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;
	
	@Autowired
	private MemberService service;

	@RequestMapping(value = "register.cy", method = RequestMethod.GET)
	public String join() {

		System.out.println("This is join by get");

		return "Member/Register";

	}

	
	@RequestMapping(value = "register.cy", method = RequestMethod.POST)
    public String joinOK(MemberVo member) {
		
		System.out.println("This is joinOK");
		member.setMEMBER_PWD(this.bCryptPasswordEncoder.encode(member.getMEMBER_PWD()));
		
		int result = 0;
		
		result = service.regist(member);
		
		if (result > 0) {
			System.out.println("삽입 성공");
			return "Member/Login";
		} else {
			System.out.println("삽입 실패");
			return "Member/Register";
		}
        
    }

	  
	  @RequestMapping(value="admin.cy")
	  public String admintest() {
		  System.out.println("어드민 페이지 요청");
		  return "admin";
	  }
	 



}
