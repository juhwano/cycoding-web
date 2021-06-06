package com.cyco.member.dao;

import org.springframework.stereotype.Repository;

import com.cyco.member.vo.MemberVo;


@Repository
public interface MemberDao {
	
	public Integer checkEmail(String email);
	
	public Integer checkNickName(String nickName);
	
	public Integer checkPhone(String phone);
	
	public int registMember(MemberVo member);


}
