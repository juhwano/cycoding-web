package com.cyco.admin.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cyco.admin.dao.AdminDao;
import com.cyco.common.vo.P_FieldVo;
import com.cyco.common.vo.PositionVo;
import com.cyco.common.vo.SkillVo;

@Service
public class AdminService {
	
	@Autowired
	private SqlSession sqlsession; 
	
	
	
	public List<SkillVo> getSkillLsit() {
		AdminDao dao = sqlsession.getMapper(AdminDao.class);
		List<SkillVo> list = dao.getSkillList();
		
		return list;
	}
	public List<PositionVo> getPositionList() {
		AdminDao dao = sqlsession.getMapper(AdminDao.class);
		List<PositionVo> list = dao.getPositionList();
		return list;
	}
	public List<P_FieldVo> getFieldList() {
		AdminDao dao = sqlsession.getMapper(AdminDao.class);
		List<P_FieldVo> list = dao.getFieldList();
		return list;
	}
	
	//ajax
	public int getSkillNameCheck(String name) {
		AdminDao dao = sqlsession.getMapper(AdminDao.class);
		int result = dao.getSkillNameCheck(name);
		return result;
	}
	public Map<String, String> updateSkillList(Map<String, List<SkillVo>> data) {
		AdminDao dao = sqlsession.getMapper(AdminDao.class);
		
		Map<String, String> map = new HashMap<String, String>();
		
		List<SkillVo> newlist =  data.get("new");
		List<SkillVo> updatelist = data.get("update");
		int addresult=0;
		int upresult=0;
		if(newlist.size()>0) {
			addresult+=dao.insertSkill(newlist);
		}
		if(updatelist.size()>0) {
			for(SkillVo skill : updatelist) {
				System.out.println(skill);
				upresult+=dao.updateSkill(skill);
			} 
			
		}
		System.out.println("insert : " + addresult);
		System.out.println("update : " + upresult);
		map.put("add", Integer.toString(addresult));
		map.put("update", Integer.toString(upresult));
		
		return map;
	}
}
