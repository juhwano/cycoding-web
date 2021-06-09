package com.cyco.member.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cyco.common.vo.MemberVo;
import com.cyco.member.dao.MemberDao;



@Service
public class MemberService {
	private SqlSession sqlsession;
	
	@Autowired
	public void setSqlsession(SqlSession sqlsession) {
		this.sqlsession = sqlsession;
	}
	
	
	
	//회원가입
	public int regist(MemberVo member) {
	      
	      int result =0;
	      
	      MemberDao memberdao = sqlsession.getMapper(MemberDao.class);
	      result = memberdao.registMember(member);
	      
	      return result;
	      
	}
	
	//회원상세(+마이페이지)////////////////////////////////////////////////////////////////////
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
	
}