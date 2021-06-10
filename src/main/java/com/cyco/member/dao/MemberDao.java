package com.cyco.member.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.cyco.common.vo.MemberVo;
import com.cyco.common.vo.PositionVo;
import com.cyco.common.vo.SkillVo;
import com.cyco.member.vo.MemberDetailPageVo;
import com.cyco.member.vo.V_Duration;
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
	
	public MemberVo getMyDetail(String useremail);
	
	//public MemberVo getMemberInfo(String useremail);
	
	public Integer editPersnalInfo(String column, String info, int userid);
	
	public List<SkillVo> getSkills();
	
	public List<MemberDetailPageVo> getPreferSkills(String userid);
	
	public List<PositionVo> getPositions();
	
	public List<MemberDetailPageVo> getPreferPosition(String userid);
	
	public List<V_Duration> getDurations();
	
	public List<V_Duration> getPreferDurations(String userid);
	
}
