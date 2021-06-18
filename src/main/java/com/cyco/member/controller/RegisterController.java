package com.cyco.member.controller;



import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.cyco.common.vo.MemberVo;
import com.cyco.member.service.MemberService;



@Controller
public class RegisterController {
	
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;
	
	@Autowired
	private MemberService service;

	@RequestMapping(value = "register", method = RequestMethod.GET)
	public String join() {

		System.out.println("This is join by get");

		return "Member/Register";

	}

	
	@RequestMapping(value = "register", method = RequestMethod.POST)
    public String joinOK(MemberVo member, HttpServletResponse res) throws IOException {
		
		System.out.println("This is joinOK");
		member.setMEMBER_PWD(this.bCryptPasswordEncoder.encode(member.getMEMBER_PWD()));
		
		int result = 0;
		
		result = service.regist(member);
		
		
		res.setContentType("text/html; charset=euc-kr");
		PrintWriter out = res.getWriter();
		String msg ="";
		
		if (result > 0) {
			System.out.println("삽입 성공");
			
			msg += "<script>";
			msg += "swal('가입이 완료되었습니다','','success')";
			msg += "<script>";
			
			out.print(msg);
			
			return "Member/Login";
		} else {
			System.out.println("삽입 실패");
			
			msg += "<script>";
			msg += "swal('가입을 실패했습니다','','error')";
			msg += "<script>";
			
			return "Member/Register";
		}
        
    }
	  

}
