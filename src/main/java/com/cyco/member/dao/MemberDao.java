package com.cyco.member.dao;

import com.cyco.main.vo.MemberVo;

public interface MemberDao {
	
	int join(MemberVo member);
	
	int login(String email, String pwd);

}
