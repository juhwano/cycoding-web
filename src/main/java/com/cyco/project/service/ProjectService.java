package com.cyco.project.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cyco.project.dao.ProjectDao;
import com.cyco.project.vo.ProjectVO;

@Service
public class ProjectService {

	
	@Autowired
	private SqlSession sqlsession;
	
	
//	public List<ProjectVO> getProjectList(String adr_code, String field_name, String p_state, String skill_code){
	public List<ProjectVO> getProjectList(){
		ProjectDao dao = sqlsession.getMapper(ProjectDao.class);
		
		String where = "";
		List<ProjectVO> list = dao.getProjectList(where);
		
		return list;
	}
//	ProjectList with Filter
	public List<ProjectVO> getProjectList(List<String> filterlist){
		ProjectDao dao = sqlsession.getMapper(ProjectDao.class);
		
		String where = "where p.project_id in (";
		where +=filterlist.get(0);
		for(int i=1; i<filterlist.size(); i++) {
			where +=","+filterlist.get(i);
		}
		where += ")";
		
		System.out.println(where);
		List<ProjectVO> list = dao.getProjectList(where);
		System.out.println(list);
		
		return list;
	}
	
//	필터링으로 선택된 field_code , adr_code , p_state을 가진 Map객체로 
//	필터링된 Project_id 뽑아오기
	public List<String> getFilteredProjectList(Map<String, String> data){
		ProjectDao dao = sqlsession.getMapper(ProjectDao.class);
		List<String> list = dao.getFilteredProjectList(data);
		System.out.println(list.toString());
		return list;
	}
	
//	Filtered Project_id List
//	P_Skill테이블에서 Project_id 뽑아오기
	public List<String> getFilteredProjectSkillList(String skill_code){
		ProjectDao dao = sqlsession.getMapper(ProjectDao.class);
		List<String> list = dao.getFilteredProjectSkillList(skill_code);
		System.out.println("P_Skill list : " +list.toString());
		return list;
	}
}
