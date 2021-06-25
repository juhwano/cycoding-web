package com.cyco.admin.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cyco.admin.dao.AdminDao;
import com.cyco.admin.vo.MemberListVo;
import com.cyco.common.vo.P_FieldVo;
import com.cyco.common.vo.PositionVo;
import com.cyco.common.vo.SkillVo;
import com.cyco.member.dao.MemberDao;
import com.cyco.member.vo.V_MlistVo;

@Service
public class AdminService {
	
	@Autowired
	private SqlSession sqlsession; 
	
	
	// ----------------------- Site Manage ------------------------------
	//Skill 리스트 가져오기
	public List<SkillVo> getSkillLsit() {
		AdminDao dao = sqlsession.getMapper(AdminDao.class);
		List<SkillVo> list = dao.getSkillList();
		
		return list;
	}
	//Position 리스트 가져오기
	public List<PositionVo> getPositionList() {
		AdminDao dao = sqlsession.getMapper(AdminDao.class);
		List<PositionVo> list = dao.getPositionList();
		return list;
	}
	//Field 리스트 가져오기
	public List<P_FieldVo> getFieldList() {
		AdminDao dao = sqlsession.getMapper(AdminDao.class);
		List<P_FieldVo> list = dao.getFieldList();
		return list;
	}
	// -------------------------------------------------------------------
	
	
	//----------------------- Member Manage ------------------------------
	// 전체 회원 리스트 가져오기
	public List<MemberListVo> getMemberList(){
		AdminDao dao = sqlsession.getMapper(AdminDao.class);
		List<MemberListVo> list = dao.getMemberList(""); //파라미터가 ""이면 전체검색
		return list;
	}

	//---------------------------------------------------------------------
	
	// ------------------------ ajax -------------------------------
	
	// 기술, 분야, 포지션 - 추가 및 상태수정
	public Map<String, String> updateSiteList(Map<String, Object> data) {
		AdminDao dao = sqlsession.getMapper(AdminDao.class);
		
		Map<String, String> map = new HashMap<String, String>();
		
		List<Object> newlist = (List<Object>) data.get("new"); // 추가될 객체 배열
		List<Object> updatelist=(List<Object>) data.get("update"); // 업데이트될 객체배열
		String code= (String) data.get("code"); // skill / field / position 구분자
		
		
		int addresult=0; // insert 결과 행수
		int upresult=0; // update 결과행수
		if(newlist.size()>0) {
			//여러개 한번에 insert 가능
			addresult+=dao.insertSite(newlist, code);
		}
		if(updatelist.size()>0) {
			//여러개 update불가능... 개수만큼 반복적으로 update
			for(Object obj : updatelist) {
				upresult+=dao.updateSite(obj, code);
			} 
			
		}
		// 두가지의 결과 행 수를 담은 map 반환
		map.put("add", Integer.toString(addresult));
		map.put("update", Integer.toString(upresult));
		
		return map;
	}
	// 회원 닉네임으로 검색하는 기능
	public List<MemberListVo> getSearchList(String nickname){
		AdminDao dao = sqlsession.getMapper(AdminDao.class);
		nickname = nickname.trim();// 공백제거
		List<MemberListVo> list = dao.getMemberList(nickname);
		return list;
	}
	
	// 회원의 영구정지 상태를 변경하는 기능
	public String updateMemberEnabled(Map<String,String> data) {
		AdminDao dao = sqlsession.getMapper(AdminDao.class);
		
		int result = dao.updateMemberEnabled(data);
		if(result>0) {
			return "true";
		}
		else {
			return "false";
		}
		
	}
	// ---------------------------------------------------------
}
