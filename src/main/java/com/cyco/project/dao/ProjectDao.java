package com.cyco.project.dao;

import java.util.List;
import java.util.Map;


import com.cyco.common.vo.AdrVo;
import com.cyco.common.vo.P_FieldVo;
import com.cyco.common.vo.SkillVo;
import com.cyco.project.vo.PmemberCountVo;
import com.cyco.project.vo.V_PjAdrField_Join_V_PDetail;
import com.cyco.project.vo.V_PjSk;
import com.cyco.project.vo.V_PmPosition;


public interface ProjectDao {
	//프로젝트 리스트 가져오기
	public List<V_PjAdrField_Join_V_PDetail> getProjectList(Map<String, String> data);
	
	//지역, 분야, 상태로 필터링된 project_id리스트 가져오기
	public List<String> getFilteredProjectList(Map<String, String> data);
	
	//기술스택으로 필터링된 project_id리스트 가져오기
	public List<String> getFilteredProjectSkillList(String skill_code);
	
	
	public List<V_PmPosition> getProjectMemberList();
	
	//각 프로젝트의 기술스택 리스트 가져오기
	public List<V_PjSk> getPjSkList();
	
	//프로젝트 멤버의 남은 자리 개수를 담은 리스트 가져오기
	public List<PmemberCountVo> getPmemberCountList();
	
	//지역리스트
	public List<AdrVo> getAdrList();
	
	//분야리스트
	public List<P_FieldVo> getFieldList();
	
	//기술스택리스트
	public List<SkillVo> getSkillList();
	

}