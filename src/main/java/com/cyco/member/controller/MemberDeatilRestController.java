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
import com.cyco.member.vo.MemberDetailPageVo;
import com.cyco.member.vo.V_Duration;

@RequestMapping("memberdetail/")
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

		System.out.println(memberdetailservice.getPositions().toString());
			
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
	
	@RequestMapping(value="deletestat.ajax")
	public String deleteStat(String memberid, String type) {
		
		System.out.println("deleteStat");
		System.out.println(memberid);
		System.err.println("delete " + type);
		
		String result = "fail";
		
		if(type.equals("skill")) {
			
			result = memberdetailservice.deleteSkills(memberid);
			
		}  else if(type.equals("duration")) {
			
			result = memberdetailservice.deleteDurations(memberid);
		}
		
		
		return result;
	}
	
	//변경한 기술 스탯 디비에 반영하기
	@RequestMapping(value="editskills.ajax")
	public String editSkills(String memberid, String stat) {
		
		System.out.println("기술 비동기 변경");
		System.out.println(memberid);
		System.out.println(stat);
		
		String result = memberdetailservice.editSkills(memberid, stat);		
		
		return result;
	}
	
	//변경할 포지션 디비 반영
	@RequestMapping(value="updateposition.ajax")
	public String updatePosition(String memberid, String stat) {
		
		System.out.println("포지션 비동기 변경");
		System.out.println(memberid);
		System.out.println(stat);
		
		String result = memberdetailservice.updatePosition(memberid, stat);		
		
		return result;
	}
	
	//변경한 선호기간 스탯 디비에 반영하기
	@RequestMapping(value="editdurations.ajax")
	public String editDurations(String memberid, String stat) {
		
		System.out.println("기간 비동기 변경");
		System.out.println(memberid);
		System.out.println(stat);
		
		String result = memberdetailservice.editDurations(memberid, stat);		
		
		return result;
	}
	
	
	//디비에서 변경된 스탯 뷰단에 반영(공통)
	@RequestMapping(value="modifystatview.ajax")
	public List<MemberDetailPageVo> modifyStatView(String userid, String type) {
		
		
		System.out.println("변경한 기술 비동기로 상세페이지에 반영");

		
		List<MemberDetailPageVo> list = new ArrayList<MemberDetailPageVo>();
		
		if( type.equals("skill")) {
			
			System.out.println("modifyStatView skill");
			
			list = memberdetailservice.getPreferSkills(userid);
			
		} else if( type.equals("position")) {
			
			System.out.println("modifyStatView position");
			
			list = memberdetailservice.getPreferPosition(userid);
			
		} else if( type.equals("duration")) {
			
			System.out.println("modifyStatView duration");
			
			list = memberdetailservice.getPreferDurations(userid);
			
		}
		
		
		return list;
	}
	

}
