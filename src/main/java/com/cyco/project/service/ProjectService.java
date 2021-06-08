package com.cyco.project.service;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

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
//	오버로딩 함수
	public List<ProjectVO> getProjectList(List<String> filterlist){
		ProjectDao dao = sqlsession.getMapper(ProjectDao.class);
		
		String where =null;
		if(filterlist.size()>0) {
			where = "where p.project_id in (";
			where +=filterlist.get(0);
			for(int i=1; i<filterlist.size(); i++) {
				where +=","+filterlist.get(i);
			}
			where += ")";
		}
		else {
			where ="";
		}
		
		System.out.println(where);
		List<ProjectVO> list = dao.getProjectList(where);
		System.out.println(list);
		
		return list;
	}
	
//	필터링으로 선택된 field_code , adr_code , p_state을 가진 Map객체로 
//	필터링된 Project_id 뽑아오기
	public List<String> getFilteredProjectList(Map<String, String> data){
		List<String> list = new ArrayList<String>();
		if(data.get("field_code").equals("") && data.get("adr_code").equals("") && data.get("p_state").equals("")) {
			return list;
		}
		
		ProjectDao dao = sqlsession.getMapper(ProjectDao.class);
		list = dao.getFilteredProjectList(data);
		System.out.println(list.toString());
		return list;
	}
	
//	Filtered Project_id List
//	P_Skill테이블에서 Project_id 뽑아오기
	public List<String> getFilteredProjectSkillList(Map<String, String> data,List<String> Flist){
		ProjectDao dao = sqlsession.getMapper(ProjectDao.class);
		
		String skill_code = data.get("skill_code");
		
		//skill_code로 필터링된 리스트 뽑기
		List<String> list = dao.getFilteredProjectSkillList(skill_code);
		System.out.println("skill filtering list : " + list);
		
		//기존 Flist에 위에서 필터링된 값 넣기
		list.addAll(Flist);
		
		//리스트에서 중복값 제거
		Set<String> temp = new HashSet<String>(list);
		List<String> list2 = new ArrayList<String>(temp);
		
		//중복제거된 리스트 리턴
		return list2;
	}
}
