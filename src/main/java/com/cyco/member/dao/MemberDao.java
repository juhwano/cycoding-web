package com.cyco.member.dao;


import java.util.Map;

import org.springframework.stereotype.Repository;

import com.cyco.main.vo.MemberVo;

@Repository
public interface MemberDao {
	
	public Integer checkEmail(String email);
	
	public int join(MemberVo member);
	
	public Integer login(String MEMBER_EMAIL, String MEMBER_PWD);
	
	public Map<String, Object> selectUser(String username);

}
