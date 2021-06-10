package com.cyco.member.service;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cyco.common.vo.MemberVo;
import com.cyco.common.vo.PositionVo;
import com.cyco.common.vo.SkillVo;
import com.cyco.member.dao.MemberDao;
import com.cyco.member.vo.MemberDetailPageVo;
import com.cyco.member.vo.V_Duration;

@Service
public class MemberDetailService {
	
private SqlSession sqlsession;
	
	@Autowired
	public void setSqlsession(SqlSession sqlsession) {
		this.sqlsession = sqlsession;
	}
	

	//마이페이지 정보 불러오기
	public MemberVo getMyDetail(String useremail) {
		
		MemberDao memberdao = sqlsession.getMapper(MemberDao.class);
		MemberVo memeber = memberdao.getMyDetail(useremail);
		
		return memeber;
	}
	
	//개인정보 수정
	public int editInfo(String column, String info, int userid) {
		
		MemberDao memberdao = sqlsession.getMapper(MemberDao.class);
		int row = memberdao.editPersnalInfo(column, info, userid);
		
		return row;
	}
	
	//보유 기술 스택 리스트 뽑기
	public List<MemberDetailPageVo> getPreferSkills(String userid){
		
		MemberDao memberdao = sqlsession.getMapper(MemberDao.class);
		List<MemberDetailPageVo> list = new ArrayList<MemberDetailPageVo>();
		
		list = memberdao.getPreferSkills(userid);
		
		return list;
		
	}
	
	//포지션 리스트 뽑기
	public List<MemberDetailPageVo> getPreferPosition(String userid){
		
		MemberDao memberdao = sqlsession.getMapper(MemberDao.class);
		List<MemberDetailPageVo> list = new ArrayList<MemberDetailPageVo>();
		
		list = memberdao.getPreferPosition(userid);
		
		return list;
		
	}

	
	//선호 기간 리스트 뽑기
	public List<V_Duration> getPreferDurations(String userid){
		
		MemberDao memberdao = sqlsession.getMapper(MemberDao.class);
		List<V_Duration> list = new ArrayList<V_Duration>();
		
		list = memberdao.getPreferDurations(userid);
		
		return list;
		
	}
	
	//모달 안에 기술 스택 리스트 뽑기
	public List<SkillVo> getSkills(){
		
		MemberDao memberdao = sqlsession.getMapper(MemberDao.class);
		List<SkillVo> list = new ArrayList<SkillVo>();
		
		list = memberdao.getSkills();
		
		return list;
		
	}

	//모달 안에 포지션 리스트 뽑기
	public List<PositionVo> getPositions(){
		
		MemberDao memberdao = sqlsession.getMapper(MemberDao.class);
		List<PositionVo> list = new ArrayList<PositionVo>();
		
		list = memberdao.getPositions();
		
		return list;
		
	}
	
	//모달 안에 기간 리스트 뽑기
	public List<V_Duration> getDurations(){
		
		MemberDao memberdao = sqlsession.getMapper(MemberDao.class);
		List<V_Duration> list = new ArrayList<V_Duration>();
		
		list = memberdao.getDurations();
		
		return list;
		
	}

}
