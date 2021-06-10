package com.cyco.project.dao;

import java.util.List;
import java.util.Map;

import com.cyco.project.vo.V_PmPosition;
import com.cyco.common.vo.AdrVo;
import com.cyco.common.vo.P_FieldVo;
import com.cyco.common.vo.SkillVo;
import com.cyco.project.vo.V_PjAdrField_Join_V_PDetail;
import com.cyco.project.vo.V_PjSk;


public interface ProjectDao {
	//p.project_id, p.member_id, p.adr_name, p.field_name,vpd.p_title, vpd.p_image, vpd.duration_date, vpd.p_content, vpd.p_state, vpd.p_views, vpd.p_date
	//select project_id, member_id, position_name  from view_pm_position;
	//select project_id, skill_name from view_psk_sk;
	
	//select adr_code, adr_name from adr;
	//select skill_code, skill_name, skill_enable from skill;
	//select field_code, field_name,field_enable from p_field;
	
	//public List<ProjectVO> getProjectList();
	public List<V_PjAdrField_Join_V_PDetail> getProjectList(Map<String, String> data);
	public List<String> getFilteredProjectList(Map<String, String> data);
	public List<String> getFilteredProjectSkillList(String skill_code);
	public List<V_PmPosition> getProjectMemberList();
	public List<V_PjSk> getPjSkList();
	
	public List<AdrVo> getAdrList();
	public List<P_FieldVo> getFieldList();
	public List<SkillVo> getSkillList();
	
	

}
