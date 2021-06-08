package com.cyco.member.dao;

import java.util.List;

import com.cyco.member.vo.MemberVo;
import com.cyco.member.vo.PositionVo;

public interface MemberDao {
	//회원목록
	public List<MemberVo> getMemberList();
	
	//포지션목록
	public List<PositionVo> getPositionList();
	
	//포지션기반 필터링
	public List<MemberVo> getMemberPosition(String position);
	
	//닉네임 검색
	public List<MemberVo> getMemberNickname(String nickname);
}
