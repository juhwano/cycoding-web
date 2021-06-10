package com.cyco.project.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cyco.member.vo.PositionVo;
import com.cyco.project.dao.ProjectDao;
import com.cyco.project.vo.AdrVO;
import com.cyco.project.vo.FieldVO;
import com.cyco.project.vo.P_DurationVO;
import com.cyco.project.vo.ProjectVO;
import com.cyco.project.vo.SkillVO;

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
	public List<String> getFiltedProjectList(Map<String, String> data){
		ProjectDao dao = sqlsession.getMapper(ProjectDao.class);
		List<String> list = dao.getFiltedProjectList(data);
		System.out.println(list.toString());
		return list;
	}
	
	public List<FieldVO> getProjectField(){
		ProjectDao dao = sqlsession.getMapper(ProjectDao.class);
		List<FieldVO> list = dao.getFieldList();
		return list;
	}
	
	public List<AdrVO> getAdr(){
		ProjectDao dao = sqlsession.getMapper(ProjectDao.class);
		List<AdrVO> list = dao.getAdrList();
		return list;
	}
	
	public List<SkillVO> getSkill(){
		ProjectDao dao = sqlsession.getMapper(ProjectDao.class);
		List<SkillVO> list = dao.getSkillList();
		return list;
	}
	
	public List<PositionVo> getPosition(){
		ProjectDao dao = sqlsession.getMapper(ProjectDao.class);
		List<PositionVo> list = dao.getPostion();
		return list;
	}
	
	public List<P_DurationVO> getDuration(){
		ProjectDao dao = sqlsession.getMapper(ProjectDao.class);
		List<P_DurationVO> list = dao.getDuration();
		return list;
	}
	
	
}
