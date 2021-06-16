package com.cyco.project.dao;

import java.util.List;
import java.util.Map;


import com.cyco.common.vo.AdrVo;
import com.cyco.common.vo.M_DetailVo;
import com.cyco.common.vo.M_DurationVo;
import com.cyco.common.vo.M_SkillVo;
import com.cyco.common.vo.P_FieldVo;
import com.cyco.common.vo.PositionVo;
import com.cyco.common.vo.SkillVo;
import com.cyco.project.vo.P_DetailVo;
import com.cyco.project.vo.P_DurationVO;
import com.cyco.project.vo.P_MemberVo;
import com.cyco.project.vo.P_SkillVo;
import com.cyco.project.vo.PmemberCountVo;
import com.cyco.project.vo.ProjectVo;
import com.cyco.project.vo.V_PjAdrField_Join_V_PDetail;
import com.cyco.project.vo.V_PjSk;
import com.cyco.project.vo.V_PmPosition;
import com.cyco.project.vo.V_PmPostion_Count;


public interface ProjectDao {
	
	//프로젝트 리스트 가져오기
	public List<V_PjAdrField_Join_V_PDetail> getProjectList(Map<String, String> data);
	
	//프로젝트 하나만 가져오기(상세)
	public V_PjAdrField_Join_V_PDetail getOneProject(String project_id);
	
	//지역, 분야, 상태로 필터링된 project_id리스트 가져오기
	public List<String> getFilteredProjectList(Map<String, String> data);
	
	//기술스택으로 필터링된 project_id리스트 가져오기
	public List<String> getFilteredProjectSkillList(String skill_code);
	
	//프로젝트 멤버 검색. project_id를 통한 조건검색 가능
	public List<V_PmPosition> getProjectMemberList(String project_id);
	
	//각 프로젝트의 기술스택 리스트 가져오기
	public List<V_PjSk> getPjSkList();
	
	//프로젝트 멤버의 남은 자리 개수를 담은 리스트 가져오기
	public List<PmemberCountVo> getPmemberCountList(String project_id);
	
	//프로젝트 상세에서 전체 자리수와 남은 자리수를 가져옴
	public List<V_PmPostion_Count> getPmemberCount(String project_id);
	
	//지역리스트
	public List<AdrVo> getAdrList();
	
	//분야리스트
	public List<P_FieldVo> getFieldList();
	
	//기술스택리스트
	public List<SkillVo> getSkillList();
	
	//포지션리스트
	public List<PositionVo> getPositionList();

	//포지션리스트
	public List<P_DurationVO> getDurationList();
	
	
	// --------- 트랜잭션 처리  --------------
	//프로젝트 insert
	public void setProjectInsert(ProjectVo p);
	
	// 프로젝트상세정보 insert
	public void setProjectDetail(P_DetailVo p);
	
	// 프로젝트 맴버 insert
	public void setProjectMemberList(List<P_MemberVo> m);
	
	// 프로젝트 스킬 insert
	public void setProjectSkillList(List<P_SkillVo> s);
	// -----------------------------------------
	
	// ------------- 추천 리스트 -------------------
	public List<M_DetailVo> getMDetail(String member_id);
	public List<M_SkillVo> getMSkill(String member_id);
	public List<M_DurationVo> getMDuration(String member_id);
	
}
