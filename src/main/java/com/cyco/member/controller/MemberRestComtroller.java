package com.cyco.member.controller;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.cyco.member.dao.MemberDao;

@RestController
public class MemberRestComtroller {
	
	private SqlSession sqlsession;

	@Autowired
	public void setSqlsession(SqlSession sqlsession) {
		this.sqlsession = sqlsession;
	}
	
	@RequestMapping(value="emailcheckajax.cy")
	public String checkEmail(String email) {
		
		System.out.println("This is checkEmail");
		String mail = email.replace("email=","").replace("%40","@");
		
		System.out.println("중복체크할 메일 : " + mail );
		
		MemberDao memberdao = sqlsession.getMapper(MemberDao.class);
		
		String result = "able";
		
		if(memberdao.checkEmail(mail) != null) {
			result = "disable";
		} else {
			result = "able";
		}
		

		System.out.println("결과값 : " + result);
		
		return result;
	}
	
	@RequestMapping(value="nicknamecheckajax.cy")
	public String checkNickName(String nickName) {
		
		System.out.println("This is checkNickName");
		
		
		System.out.println("중복체크할 닉네임 : " + nickName );
		
		MemberDao memberdao = sqlsession.getMapper(MemberDao.class);
		
		String result = "able";
		
		if(memberdao.checkNickName(nickName) != null) {
			result = "disable";
		} else {
			result = "able";
		}
		

		System.out.println("결과값 : " + result);
		
		return result;
	}
	
	@RequestMapping(value="phonecheckajax.cy")
	public String checkPhone(String phone) {
		
		System.out.println("This is checkPhone");
		
		
		System.out.println("중복체크할 번호 : " + phone );
		
		MemberDao memberdao = sqlsession.getMapper(MemberDao.class);
		
		String result = "able";
		
		if(memberdao.checkPhone(phone) != null) {
			result = "disable";
		} else {
			result = "able";
		}
		

		System.out.println("결과값 : " + result);
		
		return result;
	}
	

}
