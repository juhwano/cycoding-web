package com.cyco.member.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.cyco.member.service.MemberService;
import com.cyco.member.vo.MemberVo;

@RestController
public class MemberRESTController {
	MemberService memberservice;

	@Autowired
	public void setMemberService(MemberService memberservice) {
		this.memberservice = memberservice;
	}

	/*
	 * // 포지션 select
	 * 
	 * @RequestMapping(value = "memberPosition/{position}", method =
	 * RequestMethod.GET) public MemberVo viewEmp(@PathVariable("position") String
	 * position) { MemberVo member = null; try { // member = service.readEmp(empno);
	 * } catch (Exception e) { e.printStackTrace(); }
	 * 
	 * return member; }
	 */

	// 포지션 select
	@RequestMapping(value = "memberPosition/{position}.cy", method = RequestMethod.GET)
	public List<MemberVo> getMemberPosition(@PathVariable("position") String position) {
		System.out.println("RESTController, position: " + position);
		//포지션별 멤버 목록
		List<MemberVo> memberPosition = memberservice.memberPosition(position);
		
		return memberPosition;
	}
	
	//닉네임 search
	@RequestMapping(value = "memberSearch/{memberNickname}.cy", method = RequestMethod.GET)
	public List<MemberVo> getMemberNickname(@PathVariable("memberNickname") String memberNickname) {
		System.out.println("RESTController, memberNickname: " + memberNickname);
		//포지션별 멤버 목록
		List<MemberVo> memberNicknameList = memberservice.memberNickname(memberNickname);
		
		return memberNicknameList;
	}
}
