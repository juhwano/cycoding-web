package com.cyco.member.dao;


import java.util.Map;

import org.springframework.stereotype.Repository;

import com.cyco.member.vo.MemberDetailVo;
import com.cyco.member.vo.MemberVo;


@Repository
public interface MemberDao {
	
	public Integer checkEmail(String email);
	
	public Integer checkNickName(String nickName);
	
	public Integer checkPhone(String phone);
	
	public int registMember(MemberVo member);
	
	public Integer login(String MEMBER_EMAIL, String MEMBER_PWD);
	
	public Map<String, Object> selectUser(String username);

}
