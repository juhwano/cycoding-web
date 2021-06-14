package com.cyco.project.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.apache.commons.collections.map.HashedMap;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.cyco.common.vo.AdrVo;
import com.cyco.common.vo.P_FieldVo;
import com.cyco.common.vo.PositionVo;
import com.cyco.common.vo.SkillVo;
import com.cyco.project.dao.ProjectDao;
import com.cyco.project.vo.P_DetailVo;
import com.cyco.project.vo.P_DurationVO;
import com.cyco.project.vo.P_MemberVo;
import com.cyco.project.vo.P_SkillVo;
import com.cyco.project.vo.PmemberCountVo;
import com.cyco.project.vo.ProjectVo;
import com.cyco.project.vo.V_PjAdrField_Join_V_PDetail;
import com.cyco.project.vo.V_PjSk;

@Service
public class ProjectService {
	
	@Autowired
	private SqlSession sqlsession;
	
	
//	public List<ProjectVO> getProjectList(String adr_code, String field_name, String p_state, String skill_code){
//	첫 프로젝트 리스트 화면 출력.
//	넘길 리스트
//	project_list
//	adr_list
//	skill_list
//	field_list
	public List<V_PjAdrField_Join_V_PDetail> getProjectList(String p_state){
		ProjectDao dao = sqlsession.getMapper(ProjectDao.class);
		String where = "";
		Map<String, String> map = new HashMap<String, String>();
		map.put("where","");
		map.put("p_state", p_state);
		
		List<V_PjAdrField_Join_V_PDetail> project_list = dao.getProjectList(map);
		System.out.println("dao : " + project_list);
		return project_list;
	}
//	ProjectList with Filter
//	오버로딩 함수
	public List<V_PjAdrField_Join_V_PDetail> getProjectList(List<String> filterlist, String p_state){
		ProjectDao dao = sqlsession.getMapper(ProjectDao.class);
		
		String where =null;
		//넘어온 id리스트가 있을경우
		if(filterlist.size()>0) {
			where = "where p.project_id in (";
			where +=filterlist.get(0);
			for(int i=1; i<filterlist.size(); i++) {
				where +=","+filterlist.get(i);
			}
			where += ")";
		}
		//넘어온 리스트가 없을경우
		else {
			return null;
		}
		
		System.out.println(where);
		Map<String, String> map = new HashMap<String, String>();
		map.put("where",where);
		map.put("p_state", p_state);
		List<V_PjAdrField_Join_V_PDetail> list = dao.getProjectList(map);
		System.out.println(list);
		
		return list;
	}
	
//	필터링으로 선택된 field_code , adr_code , p_state을 가진 Map객체로 
//	필터링된 Project_id 뽑아오기
	public List<String> getFilteredProjectList(Map<String, String> data){
		List<String> list = new ArrayList<String>();
		if(data.get("field_code").equals("") && data.get("adr_code").equals("") && data.get("p_state").equals("")) {
			return null;
		}
		
		ProjectDao dao = sqlsession.getMapper(ProjectDao.class);
		list = dao.getFilteredProjectList(data);
		System.out.println("3개 필터링 : "+list.toString());
		return list;
	}

//	Filtered Project_id List
//	P_Skill테이블에서 Project_id 뽑아오기
	public List<String> getFilteredProjectSkillList(Map<String, String> data,List<String> Flist){
		ProjectDao dao = sqlsession.getMapper(ProjectDao.class);
		
		String skill_code = data.get("skill_code");
		List<String> idlist = new ArrayList<String>();
		System.out.println("service Flist : " + Flist);
		
		//input값이 아무것도 없을떄 return null
		if(skill_code.equals("") && Flist==null) {
			System.out.println("아무 input도없을때 return null입니당");
			return null;
		}
		//skill_code inpupt값이 없다면 Flist를 다시 return
		else if(skill_code.equals("") && Flist!=null) {
			return Flist;
		}
		
		
		//skill_code input값이 하나라도 있다면 밑에 코드 실행
		
		//skill_code로 필터링된 리스트 뽑기
		List<String> list = dao.getFilteredProjectSkillList(skill_code);
		System.out.println("skill filtering list : " + list);
		
		
		// list와 Flist에서 중복되는값 찾기
		// Flist의 값이 존재할 경우(3개 필터링 결과값이 있다.)
		if(Flist!=null) {
			System.out.println("Flist 값이 존재");
			
			//list값이 하나라도 있으면
			if(list.size()>0) {
				for(String l : list) {
					//contains()를 이용하여 Flist에 list의 l값이 있으면 중복.
					if(Flist.contains(l)) {
						System.out.println("중복값 발생!!! ");
						System.out.println("l : " + l);
						idlist.add(l);
					}
				}
				//for문을 다 돌았지만 중복되는 값이 없을때 처리 필요
			}
			//list값이 하나도 없을때 => 중복검사할 필요도 없이 비어있는 list return
			else {
				idlist.addAll(list);
			}
		}
		// Flist에 값이 없다(3개 필터링 값이 없다)면 skill_code 필터링한 list만 넣어준다.
		else {
			//list값이 하나라도 존재한다면
			if(list.size()>0) {
				System.out.println("Flist 존재x   size>0" );
				idlist.addAll(list);
			}
//			skill_code 필터링 list도 없다면 비어있는 list return
			else {
				System.out.println("Flist 존재x   size<0" );
				idlist.addAll(list);
			}
		}
		System.out.println("idlist : " + idlist);
		//중복제거된 리스트 리턴
		return idlist;
	}
	
	public List<AdrVo> getAdrList(){
		ProjectDao dao = sqlsession.getMapper(ProjectDao.class);
		List<AdrVo> adr_list = dao.getAdrList();
		
		return adr_list;
	}
	public List<P_FieldVo> getFieldList(){
		ProjectDao dao = sqlsession.getMapper(ProjectDao.class);
		List<P_FieldVo> field_list = dao.getFieldList();
		
		return field_list;
	}
	public List<SkillVo> getSkillList(){
		ProjectDao dao = sqlsession.getMapper(ProjectDao.class);
		List<SkillVo> skill_list = dao.getSkillList();
		
		return skill_list;
	}
	public List<V_PjSk> getPjSkList(){
		ProjectDao dao = sqlsession.getMapper(ProjectDao.class);
		List<V_PjSk> pjsk_list = dao.getPjSkList();
		
		return pjsk_list;
	}
	
	public List<PositionVo> getPositionList(){
		ProjectDao dao = sqlsession.getMapper(ProjectDao.class);
		List<PositionVo> position_list = dao.getPositionList();
		
		return position_list;
	}
	
	public List<P_DurationVO> getDurationList(){
		ProjectDao dao = sqlsession.getMapper(ProjectDao.class);
		List<P_DurationVO> duration_list = dao.getDurationList();
		
		return duration_list;
	}
	
	//프로젝트 검색 - 제목으로만 검색
	public List<V_PjAdrField_Join_V_PDetail> getSearchedProjectList(Map<String, String> projectname){
		ProjectDao dao = sqlsession.getMapper(ProjectDao.class);
		Map<String, String> map = new HashMap<String, String>();
		
		//검색 where절
		String where= "where vpd.p_title like '%" + projectname.get("projectname") + "%'";
		
		//map에 whrer절과 이미 위에서 사용된 dao를 사용하기 위해 파라미터로 사용되는 p_state도 같이 넣어준다.
		//p_state는 '완료'가 아니어야 하기 때문에 다른 문자열을 넣어주낟.
		map.put("where", where);
		map.put("p_state", "검색");
		
		List<V_PjAdrField_Join_V_PDetail> searched_list = dao.getProjectList(map);
		
		return searched_list;
	}
	
	//프로젝트 멤버의 남은 자리 개수를 담은 리스트 가져오기
	public List<PmemberCountVo> getPmemberCountList(){
		ProjectDao dao = sqlsession.getMapper(ProjectDao.class);
		
		List<PmemberCountVo> membercount_list = dao.getPmemberCountList();
		
		return membercount_list;
	}
	
	// ----------------------------------------------------------
	// 프로젝트 생성
	public String setProjectInsert(ProjectVo p) {
		ProjectDao dao = sqlsession.getMapper(ProjectDao.class);
		
		dao.setProjectInsert(p);
		
		return p.getProject_id();
		
	}
	
	// 프로젝트 상세정보
	public void setProjectDetail(P_DetailVo p) {
		ProjectDao dao = sqlsession.getMapper(ProjectDao.class);
		
		dao.setProjectDetail(p);;
		
	}
	
	// 프로젝트 + 기술
	public void setProjectSkillList(List<P_SkillVo> p) {
		ProjectDao dao = sqlsession.getMapper(ProjectDao.class);
		
		dao.setProjectSkillList(p);;
		
	}
	
	// 프로젝트 맴버
		public void setProjectMemberList(List<P_MemberVo> m) {
			ProjectDao dao = sqlsession.getMapper(ProjectDao.class);
			
			dao.setProjectMemberList(m);;
			
		}
	// ---------------------------------------------------------
}
