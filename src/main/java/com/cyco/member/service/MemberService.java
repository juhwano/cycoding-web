package com.cyco.member.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cyco.common.vo.PositionVo;
import com.cyco.member.dao.MemberDao;
import com.cyco.member.vo.MemberVo;
import com.cyco.member.vo.V_MlistVo;

@Service
public class MemberService {
	private SqlSession sqlsession;
	
	@Autowired
	public void setSqlsession(SqlSession sqlsession) {
		this.sqlsession = sqlsession;
	}
	
	//기본 회원리스트 호출
	public List<V_MlistVo> memberList() {
		
		MemberDao memberdao = sqlsession.getMapper(MemberDao.class);
		
		List<V_MlistVo> memberList = memberdao.getMemberList();
		System.out.println("기본 회원 리스트 호출");
		return memberList;
	}
	
	//포지션 리스트 호출(옵션용)
	public List<PositionVo> positionList() {
		
		MemberDao memberdao = sqlsession.getMapper(MemberDao.class);
		
		List<PositionVo> positionList = memberdao.getPositionList();
		System.out.println("포지션리스트 호출");
		
		return positionList;
	}
	
	//포지션 필터링
	public List<V_MlistVo> memberPosition(String position) {
		MemberDao memberdao = sqlsession.getMapper(MemberDao.class);
		List<V_MlistVo> memberPosition = memberdao.getMemberPosition(position);
		
		return memberPosition;
	}
	
	//회원검색
	public List<V_MlistVo> memberNickname(String nickname) {
		MemberDao memberdao = sqlsession.getMapper(MemberDao.class);
		List<V_MlistVo> memberNickname = memberdao.getMemberNickname(nickname);
		
		return memberNickname;
	}
	
   public int regist(MemberVo member) {
	      
	      int result =0;
	      
	      MemberDao memberdao = sqlsession.getMapper(MemberDao.class);
	      result = memberdao.registMember(member);
	      
	      return result;
	      
	   }
	
}