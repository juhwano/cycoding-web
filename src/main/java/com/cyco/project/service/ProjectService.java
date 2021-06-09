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
		List<ProjectVO> list = dao.getProjectList(where);
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
		
		//skill_code로 필터링된 리스트 뽑기
		List<String> list = dao.getFilteredProjectSkillList(skill_code);
		System.out.println("skill filtering list : " + list);
		
		
		// list와 Flist에서 중복되는값 찾기
		// Flist의 값이 존재할 경우
		if(Flist.size()>0 && Flist!=null) {
			// list값도 존재할 경우
			if(list.size()>0)
			for(String l : list) {
				//contains()를 이용하여 Flist에 list의 l값이 있으면 중복.
				if(Flist.contains(l)) {
					System.out.println("중복값 발생!!! ");
					System.out.println("l : " + l);
					idlist.add(l);
				}
			}
			//list값이 없을경우
			else {
				idlist.addAll(Flist);
			}
		}
		// Flist에 값이 없다면 skill_code 필터링한 list만 넣어준다.
		else {
			idlist.addAll(list);
		}
		System.out.println("idlist : " + idlist);
		//중복제거된 리스트 리턴
		return idlist;
	}
}
