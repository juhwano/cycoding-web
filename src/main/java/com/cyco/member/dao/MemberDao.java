package com.cyco.member.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.cyco.common.vo.PositionVo;
import com.cyco.member.vo.MemberVo;
import com.cyco.member.vo.V_MlistVo;

@Repository
public interface MemberDao {
	
	public List<V_MlistVo> getMemberList();
	
	
	public List<PositionVo> getPositionList();
	
	
	public List<V_MlistVo> getMemberPosition(String position);
	
	
	public List<V_MlistVo> getMemberNickname(String nickname);
	
	public Integer checkEmail(String email);
	
	public Integer checkNickName(String nickName);
	
	public Integer checkPhone(String phone);
	
	public int registMember(MemberVo member);
}
