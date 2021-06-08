package com.cyco.member.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.cyco.member.vo.MemberVo;
import com.cyco.member.vo.PositionVo;

@Repository
public interface MemberDao {
	
	public List<MemberVo> getMemberList();
	
	
	public List<PositionVo> getPositionList();
	
	
	public List<MemberVo> getMemberPosition(String position);
	
	
	public List<MemberVo> getMemberNickname(String nickname);
	
	public Integer checkEmail(String email);
	
	public Integer checkNickName(String nickName);
	
	public Integer checkPhone(String phone);
	
	public int registMember(MemberVo member);
}
