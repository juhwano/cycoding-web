package com.cyco.member.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.cyco.common.vo.PositionVo;
import com.cyco.common.vo.SkillVo;
import com.cyco.member.service.MemberDetailService;
import com.cyco.member.service.MemberService;
import com.cyco.member.vo.V_Duration;

@RestController
public class MemberDeatilRestController {
	
	MemberService memberservice;
	MemberDetailService memberdetailservice;
	
	@Autowired
	public void setMemberDetailService(MemberDetailService memberdetailservice) {
		this.memberdetailservice = memberdetailservice;
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
			
			row = memberdetailservice.editInfo(column, info, id);
			
			//중복검사 해야 함
		} else if(code.equals("닉네임")) {

			column="MEMBER_NICKNAME";
			row = memberdetailservice.editInfo(column, info, id);
			
		} else if(code.equals("이름")) {

			column="MEMBER_NAME";
			row = memberdetailservice.editInfo(column, info, id);
			
			//중복검사 해야 함
		} else if(code.equals("휴대폰")) {
			
			column="MEMBER_PHONE";
			row = memberdetailservice.editInfo(column, info, id);
		}
		
		if(row > 0) {
			result = "success";
		}
		
		return result;
	}
	
	
	//모달창에 기술 태그 뿌리기
	@RequestMapping(value="getskills.ajax")
	public List<SkillVo> getSkills(){
		
		List<SkillVo> list = new ArrayList<SkillVo>();

		System.out.println(memberdetailservice.getSkills().toString());
			
		list = memberdetailservice.getSkills();
			
		return list;

	}
	
	//모달창에 포지션 태그 뿌리기
	@RequestMapping(value="getposition.ajax")
	public List<PositionVo> getSPositions(){
		
		List<PositionVo> list = new ArrayList<PositionVo>();

		System.out.println(memberdetailservice.getSkills().toString());
			
		list = memberdetailservice.getPositions();
			
		return list;

	}
	
	
	//모달창에 선호 기간 태그 뿌리기
	@RequestMapping(value="getdurations.ajax")
	public List<V_Duration> getDurations(){
		
		List<V_Duration> list = new ArrayList<V_Duration>();

		System.out.println(memberdetailservice.getDurations().toString());
			
		list = memberdetailservice.getDurations();
			
		return list;

	}
	

}
