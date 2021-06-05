package com.cyco.member.controller;


import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class MemberController {

	private SqlSession sqlsession;

	@Autowired
	public void setSqlsession(SqlSession sqlsession) {
		this.sqlsession = sqlsession;
	}

	@RequestMapping(value = "register.cy", method = RequestMethod.GET)
	public String join() {

		System.out.println("This is join by get");

		return "Member/Register";

	}

	@RequestMapping(value = "register.cy", method = RequestMethod.POST)
	public String joinOK() {

		System.out.println("This is joinOK");

		return "Member/Login";

	}

	
	  @RequestMapping(value="login.cy", method = RequestMethod.GET)
	  public String login() {
		  
		  System.out.println("This is login by get");
	  
	  return "Member/Login";
	  
	  }
	  
	  @RequestMapping(value="admin.cy")
	  public String admintest() {
		  System.out.println("어드민 페이지 요청");
		  return "admin";
	  }
	 

	/*
	 * @RequestMapping(value="login.cy", method = RequestMethod.POST) public
	 * ModelAndView loginOK(@Param("eamil")String email, @Param("pwd")String pwd) {
	 * System.out.println("This is loginOK");
	 * 
	 * System.out.println("이메일 : " + email); System.out.println("비밀번호 : " + pwd);
	 * 
	 * MemberDao memberdao = sqlsession.getMapper(MemberDao.class); ModelMap mmp =
	 * new ModelMap();
	 * 
	 * String msg = "";
	 * 
	 * if(memberdao.login(email, pwd) != null) {
	 * 
	 * msg = "로그인 성공"; return new ModelAndView("Main/CycoMain",mmp);
	 * 
	 * } else {
	 * 
	 * msg = "로그인 실패"; return new ModelAndView("Member/Login",mmp);
	 * 
	 * }
	 * 
	 * 
	 * }
	 */

}
