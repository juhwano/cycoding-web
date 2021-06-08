package com.cyco.project.dao;

import java.util.List;
import java.util.Map;

import com.cyco.project.vo.AdrVO;
import com.cyco.project.vo.FieldVO;
import com.cyco.project.vo.P_MemberVO;
import com.cyco.project.vo.P_SkillVO;
import com.cyco.project.vo.ProjectVO;
import com.cyco.project.vo.SkillVO;

public interface ProjectDao {
	//p.project_id, p.member_id, p.adr_name, p.field_name,vpd.p_title, vpd.p_image, vpd.duration_date, vpd.p_content, vpd.p_state, vpd.p_views, vpd.p_date
	//select project_id, member_id, position_name  from view_pm_position;
	//select project_id, skill_name from view_psk_sk;
	
	//select adr_code, adr_name from adr;
	//select skill_code, skill_name, skill_enable from skill;
	//select field_code, field_name,field_enable from p_field;
	
	//public List<ProjectVO> getProjectList();
	public List<ProjectVO> getProjectList(String where);
	public List<String> getFilteredProjectList(Map<String, String> data);
	public List<String> getFilteredProjectSkillList(String skill_code);
	public List<P_MemberVO> getProjectMemberList();
	
	public List<AdrVO> getAdrList();
	public List<FieldVO> getFieldList();
	public List<SkillVO> getSkillList();
	
	

}
