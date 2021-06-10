package com.cyco.member.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.cyco.common.vo.PositionVo;
import com.cyco.member.vo.MemberVo;
import com.cyco.member.vo.V_MlistVo;

@Repository
public interface MemberDao {
	
	
	public MemberVo getMember();
	//멤버리스트 출력
	public List<V_MlistVo> getMemberList();
	//포지션리스트 출력(셀렉트태그용)
	public List<PositionVo> getPositionList();
	//포지션필터링
	public List<V_MlistVo> getMemberPosition(String position);
	//닉네임 검색
	public List<V_MlistVo> getMemberNickname(String nickname);
	
	//기술스택 중복 제거
	//public List<V_MlistVo> getFilterMemberSkill(List<V_MlistVo> list);
	
	
	public Integer checkEmail(String email);
	
	public Integer checkNickName(String nickName);
	
	public Integer checkPhone(String phone);
	
	public int registMember(MemberVo member);
}
