package com.cyco.project.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cyco.project.dao.ProjectDao;
import com.cyco.project.vo.ProjectVO;

@Service
public class ProjectService {
	//필터링 포함
	//지역 , 분야 , 상태 , 스킬
	
	@Autowired
	private SqlSession sqlsession;
	
	
//	public List<ProjectVO> getProjectList(String adr_code, String field_name, String p_state, String skill_code){
	public List<ProjectVO> getProjectList(){
		ProjectDao dao = sqlsession.getMapper(ProjectDao.class);
		
		List<ProjectVO> list = dao.getProjectList();
		
		return list;
	}
}
