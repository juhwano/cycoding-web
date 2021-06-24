package com.cyco.admin.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.cyco.admin.vo.MemberListVo;
import com.cyco.common.vo.P_FieldVo;
import com.cyco.common.vo.PositionVo;
import com.cyco.common.vo.SkillVo;
import com.cyco.member.vo.V_MlistVo;

public interface AdminDao {

	//Site manage
	public List<SkillVo> getSkillList();
	public List<PositionVo> getPositionList();
	public List<P_FieldVo> getFieldList();

	//Member manage
	public List<MemberListVo> getMemberList(String nickname);
	
	
	
	//ajax
	public int getSkillNameCheck(String name);
	public int insertSite(@Param("list") List<Object> list, @Param("code") String code);
	public int updateSite(@Param("obj") Object obj, @Param("code") String code);
	
	public List<V_MlistVo> getMemberSearch(String nickname);
	
	public int updateMemberEnabled(@Param("data") Map<String, String> data);
}
