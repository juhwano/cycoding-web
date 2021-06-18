package com.cyco.project.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.cyco.common.vo.AdrVo;
import com.cyco.common.vo.BookmarkVo;
import com.cyco.common.vo.P_FieldVo;
import com.cyco.common.vo.PositionVo;
import com.cyco.common.vo.SkillVo;
import com.cyco.project.vo.ApplyVo;
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
import com.cyco.project.vo.V_p_pd_Join_NameVo;


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
	
	//조건 프로젝트의 기술스택 리스트 가져오기
	public List<V_PjSk> getIfPjSkList(String project_id);
	
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

	//북마크리스트
	public List<BookmarkVo> getBookmarkList(String memberid);
	
	//북마크 내역 확인
	public int checkBookMark(String projectid, String memberid); 
	
	//북마크 추가
	public void setBookMark(BookmarkVo bookmark);
	
	//북마크 삭제
	public void deletBookMark(String projectid, String memberid);
	
	
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
	
  //완료가 아닌 프로젝트가 있는지 확인
	public int CheckProject(String member_id);
  
	// 프로젝트 지원체크  맴버아이디랑, 프로젝트 아이디 넣어야함
	public int CheckProjectApply(ApplyVo apply);
	
	// 프로젝트를 만들었고 모집중인 것이 있는지 확인하는 쿼리
	public int CheckProjectState(String member_id);
	
	// 프로젝트 지원내역
	public int setProjectApply(ApplyVo apply);
	
	// 프로젝트 정보 가져오는데 코드로 말고 이름으로 변경해서 가져오기.
	public V_p_pd_Join_NameVo getProjectJoinName(V_p_pd_Join_NameVo project);
	
	// 생성된 프로젝트 기술 스텍 가져오기
	public List<SkillVo> getCreateProjectSkill(String project_id);
	
	// 생성된 프로젝트에서 없는 기술 스텍 가져오기
	public List<SkillVo> getCreateNotInProjectSkill(String project_id);
	
	// --------- 트랜잭션 처리 ---------------------
	// 프로젝트 update
	public int updateProject(ProjectVo project);
	
	// 프로젝트 상세정보 update 
	public int updateP_detail(P_DetailVo p_detail);
	
	// 프로젝트 스킬 삭제 
	public int deleteP_skill(String project_id);
	
	// 위에 프로젝트 스킬 insert 도 같이 실행
	// -------------------------------------------

	// ------------- 추천 리스트 -------------------
	public List<String> getFilteredMPosition(String member_id);
	public List<String> getFilteredMSkill(String member_id);
	public List<String> getFilteredMDuration(String member_id);
	public List<String> getFilteredRecruting(String member_id);
	public List<String> getOrderedSkill(@Param("filtered_list") List<String> filtered_list, @Param("member_id") String member_id);
	public List<String> getOrderedViews(@Param("filtered_list") List<String> filtered_list);
	public List<V_PjAdrField_Join_V_PDetail> getRecommList(@Param("filtered_list") List<String> filtered_list);

	
}
