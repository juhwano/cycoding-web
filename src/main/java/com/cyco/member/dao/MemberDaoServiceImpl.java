package com.cyco.member.dao;

import java.util.Map;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cyco.member.vo.MemberDetailVo;
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

	@Override
	public Integer login(String MEMBER_EMAIL, String MEMBER_PWD) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Map<String, Object> selectUser(String username) {
		// TODO Auto-generated method stub
		return null;
	}

}
