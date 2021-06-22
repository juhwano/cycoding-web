package com.cyco.admin.dao;

import java.util.List;

import com.cyco.common.vo.P_FieldVo;
import com.cyco.common.vo.PositionVo;
import com.cyco.common.vo.SkillVo;

public interface AdminDao {

	public List<SkillVo> getSkillList();
	public List<PositionVo> getPositionList();
	public List<P_FieldVo> getFieldList();

	
	//ajax
	public int getSkillNameCheck(String name);
	public int insertSkill(List<SkillVo> list);
	public int updateSkill(SkillVo skill);
}
