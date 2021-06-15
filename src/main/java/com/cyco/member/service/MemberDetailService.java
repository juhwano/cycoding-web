package com.cyco.member.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.cyco.common.vo.MemberVo;
import com.cyco.common.vo.PositionVo;
import com.cyco.common.vo.SkillVo;
import com.cyco.member.dao.MemberDao;
import com.cyco.member.vo.M_ExperienceVo;
import com.cyco.member.vo.MemberDetailPageVo;
import com.cyco.member.vo.V_Duration;

@Service
public class MemberDetailService {
	
	private SqlSession sqlsession;
	
	@Autowired
	public void setSqlsession(SqlSession sqlsession) {
		this.sqlsession = sqlsession;
	}
	
	@Autowired
	PasswordEncoder pwdEncoder;
	
	//마이페이지 진입시 비밀번호 체크
	
	public boolean checkPwd(Map<String, String> data) {
		MemberDao memberdao = sqlsession.getMapper(MemberDao.class);
		MemberVo member = memberdao.getMyDetail(data.get("useremail"));

		boolean checkpassword = pwdEncoder.matches(data.get("userPwd"), member.getMEMBER_PWD());
		System.out.println("테스트중: " + checkpassword);
		
		return checkpassword;
	}
	

	//마이페이지 정보 불러오기
	public MemberVo getMyDetail(String useremail) {
		
		MemberDao memberdao = sqlsession.getMapper(MemberDao.class);
		MemberVo member = memberdao.getMyDetail(useremail);
		
		System.out.println("테스트중: " + member);
		
		return member;
	}
	
	//프로필 이미지 변경
	public int editProfile(String id, String filename) {
		
		MemberDao memberdao = sqlsession.getMapper(MemberDao.class);
		int row = memberdao.editProfile(id, filename);
		
		return row;
		
	}
	
	//개인정보 수정
	public int editInfo(String column, String info, int userid) {
		
		MemberDao memberdao = sqlsession.getMapper(MemberDao.class);
		int row = memberdao.editPersnalInfo(column, info, userid);
		
		return row;
	}
	
	//암호화된 비밀번호 수정
	public int editPwd(String column, String info, int userid) {
		
		//클라이언트에서 회원이 변경한 비밀번호를 암호화한다
		info = pwdEncoder.encode(info);
		
		MemberDao memberdao = sqlsession.getMapper(MemberDao.class);
		int row = memberdao.editPersnalInfo(column, info, userid);
		
		return row;
	}
	
	//보유 기술 스택 리스트 뽑기
	public List<MemberDetailPageVo> getPreferSkills(String userid){
		
		MemberDao memberdao = sqlsession.getMapper(MemberDao.class);
		List<MemberDetailPageVo> list = new ArrayList<MemberDetailPageVo>();
		
		list = memberdao.getPreferSkills(userid);
		
		return list;
		
	}
	
	//포지션 리스트 뽑기
	public List<MemberDetailPageVo> getPreferPosition(String userid){
		
		MemberDao memberdao = sqlsession.getMapper(MemberDao.class);
		List<MemberDetailPageVo> list = new ArrayList<MemberDetailPageVo>();
		
		list = memberdao.getPreferPosition(userid);
		
		return list;
		
	}

	
	//선호 기간 리스트 뽑기
	public List<MemberDetailPageVo> getPreferDurations(String userid){
		
		MemberDao memberdao = sqlsession.getMapper(MemberDao.class);
		List<MemberDetailPageVo> list = new ArrayList<MemberDetailPageVo>();
		
		list = memberdao.getPreferDurations(userid);
		
		return list;
		
	}
	
	//프로젝트 경험 리스트 뽑기
	public List<M_ExperienceVo> getExperiences(String userid){
		
		MemberDao memberdao = sqlsession.getMapper(MemberDao.class);
		List<M_ExperienceVo> list = new ArrayList<M_ExperienceVo>();
		
		list = memberdao.getExperiences(userid);
		
		return list;
		
	}
	
	//마이페이지에서 프로젝트 경험 없음이 없음이라고 입력한건지 확인
	public String haveExperience(String userid) {
		
		MemberDao memberdao = sqlsession.getMapper(MemberDao.class);
		
		String result = memberdao.haveExperience(userid);
		
		
		return result;
	}
	
	//모달 안에 기술 스택 리스트 뽑기
	public List<SkillVo> getSkills(){
		
		MemberDao memberdao = sqlsession.getMapper(MemberDao.class);
		List<SkillVo> list = new ArrayList<SkillVo>();
		
		list = memberdao.getSkills();
		
		return list;
		
	}

	//모달 안에 포지션 리스트 뽑기
	public List<PositionVo> getPositions(){
		
		MemberDao memberdao = sqlsession.getMapper(MemberDao.class);
		List<PositionVo> list = new ArrayList<PositionVo>();
		
		list = memberdao.getPositions();
		
		return list;
		
	}
	
	//모달 안에 기간 리스트 뽑기
	public List<V_Duration> getDurations(){
		
		MemberDao memberdao = sqlsession.getMapper(MemberDao.class);
		List<V_Duration> list = new ArrayList<V_Duration>();
		
		list = memberdao.getDurations();
		
		return list;
		
	}
	
	//기존에 선택했던 기술 삭제
	public String deleteSkills(String memberid) {
		
		MemberDao memberdao = sqlsession.getMapper(MemberDao.class);
		
		int row = memberdao.deleteSkills(memberid);
		String result = "fail";
		if(row > 0) {
			result = "success";
		}
		return result;
	}
	
	
	//뷰단에서 변경한 기술 스탯 디비에 반영하기
	public String editSkills(String memberid, String stat) {
		
		System.out.println("스탯 비동기 변경하기 editSkills");
		System.out.println(memberid);
		System.out.println(stat);
		
		String result = "fail";

		MemberDao memberdao = sqlsession.getMapper(MemberDao.class);
		int row =  memberdao.insertSkills(memberid, stat);
			
		System.out.println("기술 변경하기 왜 세 번 찍히지 editSkills");	
		
		if(row > 0 ) {
			result = "success";
		}
		
		System.out.println("반영 결과 : " + result);
		
		return result;
		
	}
	
	//프로젝트 경험 있/없 디비에 반영하기
	public String updateExperience(String memberid, int answer) {
		
		String result = "fail";
		MemberDao memberdao = sqlsession.getMapper(MemberDao.class);
		
		int row = memberdao.updateExperience(memberid, answer);
		
		if(row > 0 ) {
			result = "success";
		}
		return result;
	}
	
	//뷰단에서 변경한 포지션 업데이트
	public String updatePosition(String memberid, String stat) {
		
		MemberDao memberdao = sqlsession.getMapper(MemberDao.class);
		
		int row = memberdao.updatePosition(memberid, stat);
		
		String result = "fail";
		if(row > 0) {
			result = "success";
		}
		return result;
	}
	
	
	//기존에 선택했던 선호기간 삭제
	public String deleteDurations(String memberid) {
		
		MemberDao memberdao = sqlsession.getMapper(MemberDao.class);
		
		int row = memberdao.deleteDurations(memberid);
		
		String result = "fail";
		if(row > 0) {
			result = "success";
		}
		return result;
	}
	
	
	//뷰단에서 변경한 스탯 디비에 반영하기
	public String editDurations(String memberid, String stat) {
		
		System.out.println("스탯 비동기 변경하기 editDurations");
		System.out.println(memberid);
		System.out.println(stat);
		
		String result = "fail";

		MemberDao memberdao = sqlsession.getMapper(MemberDao.class);
		int row =  memberdao.insertDurations(memberid, stat);
			
		System.out.println("선호 기간 데이터 변경하기");	
		
		if(row > 0 ) {
			result = "success";
		}
		
		System.out.println("반영 결과 : " + result);
		
		return result;
		
	}
	
	// 마이페이지에서 기입한 프로젝트 경험들 디비에 insert
	public String insertExperiences(List<M_ExperienceVo> mex) {
		
		String result = "fail";
		
		MemberDao memberdao = sqlsession.getMapper(MemberDao.class);
		int row = memberdao.insertExperiences(mex);
		
		if(row > 0){
			result = "success";
		}
		
		return result;
	}
	
	//마이페이지에서 회원 탈퇴날짜 업데이트
	public Integer updateDeleteDate(String quit_id) {
		
		MemberDao memberdao = sqlsession.getMapper(MemberDao.class);
		int result = memberdao.updateDeleteDate(quit_id);
		
		return result;
	}
	
	
	//회원상세 기본정보 가져오기
	public MemberVo getMemberDetail(String memberid) {
		
		MemberDao memberdao = sqlsession.getMapper(MemberDao.class);
		MemberVo member = memberdao.getMemberDetail(memberid);
		
		return member;
	}


}
