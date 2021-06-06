package com.cyco.member.dao;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cyco.member.vo.MemberVo;



@Service("MemberDao")
public class MemberDaoServiceImpl extends SqlSessionDaoSupport implements MemberDao {
	
	@Autowired(required =false)
	@Override

	public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {

	super.setSqlSessionFactory(sqlSessionFactory);

	}

	@Override
	public Integer checkEmail(String email) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Integer checkNickName(String nickName) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Integer checkPhone(String phone) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int registMember(MemberVo member) {
		// TODO Auto-generated method stub
		return 0;
	}

}
