package com.cyco.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.cyco.member.service.MemberService;

@RestController
public class MemberDeatilRestController {
	
	MemberService memberservice;
	
	@Autowired
	public void setMemberService(MemberService memberservice) {
		this.memberservice = memberservice;
	}
	
	//회원 개인정보 수정
	@RequestMapping(value="editmydetail.ajax")
	public String editInfo(String code, String info, String userid) {
		
		System.out.println("This is editInfo ajax");
		System.out.println("userid : " + userid);
		int id = 0;
		
		try {
			
			System.out.println("userid : " + userid);
			id = Integer.parseInt(userid);
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("오류 : " + e.getMessage());

		}
		
		System.out.println("현재 회원번호 : " + id);
		
		String result = "fail";
		int row = 0;
		
		String column ="";

		if(code.equals("비밀번호")) {
			
			column="MEMBER_PWD";
			
			row = memberservice.editInfo(column, info, id);
			
			//중복검사 해야 함
		} else if(code.equals("닉네임")) {

			column="MEMBER_NICKNAME";
			row = memberservice.editInfo(column, info, id);
			
		} else if(code.equals("이름")) {

			column="MEMBER_NAME";
			row = memberservice.editInfo(column, info, id);
			
			//중복검사 해야 함
		} else if(code.equals("휴대폰")) {
			
			column="MEMBER_PHONE";
			row = memberservice.editInfo(column, info, id);
		}
		
		if(row > 0) {
			result = "success";
		}
		
		return result;
	}

}
