package com.cyco.admin.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.cyco.common.vo.P_FieldVo;
import com.cyco.common.vo.PositionVo;
import com.cyco.common.vo.SkillVo;

public interface AdminDao {

	public List<SkillVo> getSkillList();
	public List<PositionVo> getPositionList();
	public List<P_FieldVo> getFieldList();

	
	//ajax
	public int getSkillNameCheck(String name);
	public int insertSite(@Param("list") List<Object> list, @Param("code") String code);
	public int updateSite(@Param("obj") Object obj, @Param("code") String code);
}
