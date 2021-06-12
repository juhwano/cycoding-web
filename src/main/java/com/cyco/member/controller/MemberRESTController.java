package com.cyco.member.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.cyco.member.service.MemberService;
import com.cyco.member.vo.V_MlistVo;

@RestController

@RequestMapping("member")
public class MemberRESTController {
	MemberService memberservice;

	@Autowired
	public void setMemberService(MemberService memberservice) {
		this.memberservice = memberservice;
	}


	// 포지션 select
	@RequestMapping(value = "memberPosition/{position}", method = RequestMethod.GET)
	public List<V_MlistVo> getMemberPosition(@PathVariable("position") String position) {
		System.out.println("RESTController, position: " + position);

		if(position.equals("전체")) {
			position = "";
		}

		List<V_MlistVo> memberPosition = memberservice.memberPosition(position);
		
		return memberPosition;
	}
	
	//회원 검색
	@RequestMapping(value = "memberSearch/{memberNickname}", method = RequestMethod.GET)
	public List<V_MlistVo> getMemberNickname(@PathVariable("memberNickname") String memberNickname) {
		System.out.println("RESTController, memberNickname: " + memberNickname);
		List<V_MlistVo> memberNicknameList = memberservice.memberNickname(memberNickname);
		
		return memberNicknameList;
	}
	
	//더보기
	@RequestMapping(value = "memberMore", method = RequestMethod.GET)
	public List<V_MlistVo> moreBtn() {
		System.out.println("더보기버튼 restcontroller");
		List<V_MlistVo> memberList = memberservice.memberList();
		return memberList;
	}
}
