package com.cyco.member.service;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cyco.member.dao.MemberDao;
import com.cyco.member.vo.MemberVo;

@Service
public class MemberService {
	
	@Autowired
	private SqlSession sqlsession;
	
	public int regist(MemberVo member) {
		
		int result =0;
		
		MemberDao memberdao = sqlsession.getMapper(MemberDao.class);
		result = memberdao.registMember(member);
		
		return result;
		
	}

}
