package com.cyco.member.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cyco.member.dao.MemberDao;
import com.cyco.member.vo.MemberVo;
import com.cyco.member.vo.PositionVo;

@Service
public class MemberService {
	private SqlSession sqlsession;
	
	@Autowired
	public void setSqlsession(SqlSession sqlsession) {
		this.sqlsession = sqlsession;
	}
	
	//회원목록
	public List<MemberVo> memberList() {
		
		MemberDao memberdao = sqlsession.getMapper(MemberDao.class);
		
		List<MemberVo> memberList = memberdao.getMemberList();
		System.out.println("회원목록불러오기");
		/*
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("memberList", memberList);
		mv.setViewName("Member/MemberList");
		*/
		return memberList;
	}
	
	//포지션목록 불러오기
	public List<PositionVo> positionList() {
		
		MemberDao memberdao = sqlsession.getMapper(MemberDao.class);
		
		List<PositionVo> positionList = memberdao.getPositionList();
		System.out.println("포지션목록 불러오기");
		
		return positionList;
	}
	
	//포지션select 멤버목록
	public List<MemberVo> memberPosition(String position) {
		System.out.println("(memberservice)포지션필터링, position: " + position);
		
		MemberDao memberdao = sqlsession.getMapper(MemberDao.class);
		System.out.println("memberPosition 매퍼연결완료");
		
		List<MemberVo> memberPosition = memberdao.getMemberPosition(position);
		
		System.out.println("포지션불러오기: " + memberPosition);
		
		return memberPosition;
	}
	
	//닉네임Search 멤버목록
	public List<MemberVo> memberNickname(String nickname) {
		System.out.println("(memberservice)닉네임검색, nickname: " + nickname);
		
		MemberDao memberdao = sqlsession.getMapper(MemberDao.class);
		
		List<MemberVo> memberNickname = memberdao.getMemberNickname(nickname);
		
		return memberNickname;
	}
	
}
