package com.cyco.member.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.cyco.common.vo.MemberVo;
import com.cyco.common.vo.PointVo;
import com.cyco.common.vo.PositionVo;
import com.cyco.common.vo.SkillVo;
import com.cyco.member.vo.M_ExperienceVo;
import com.cyco.member.vo.MemberDetailPageVo;
import com.cyco.member.vo.ReviewVo;
import com.cyco.member.vo.V_Duration;
import com.cyco.member.vo.V_MlistVo;


@Repository
public interface MemberDao {
	
	//멤버 정보 가져오기
	public MemberVo getMember(String email);
	//멤버리스트 출력
	
	public List<V_MlistVo> getMemberList();
	//포지션리스트 출력(셀렉트태그용)
	public List<PositionVo> getPositionList();
	//포지션필터링
	public List<V_MlistVo> getMemberPosition(String position);
	//닉네임 검색
	public List<V_MlistVo> getMemberNickname(String nickname);
	
	//기술스택 중복 제거
	//public List<V_MlistVo> getFilterMemberSkill(List<V_MlistVo> list);
	
	/////////////////////////////////////////////////////////////////////////
	//회원가입용
	public Integer checkEmail(String email);
	
	public Integer checkNickName(String nickName);
	
	public Integer checkPhone(String phone);
	
	public int registMember(MemberVo member);
	/////////////////////////////////////////////////////////////////////////
	
	//로그인시 탈퇴날짜 체크
	public Integer checkDeleteDate(String memberid);
	
	//로그인시 닉네임, 아이디값 메인으로 가져오기
	public HashMap<String, String> getLoginedName(String memberemail);
	
	//마이페이지 개인정보 가져오기
	public MemberVo getMyDetail(String useremail);
	
	//마이페이지 프로필 이미지 수정
	public Integer editProfile(String id, String filename);
	
	//마이페이지 개인정보 수정
	public Integer editPersnalInfo(String column, String info, int userid);
	//마이페이지 개인정보 수정 시 닉네임 중복체크
	
	
	//마이페이지+회원상세 기술 가져오기
	public List<SkillVo> getSkills();
	
	//마이페이지+회원상세 보유 기술 가져오기
	public List<MemberDetailPageVo> getPreferSkills(String userid);
	
	//마이페이지+회원상세 포지션 가져오기
	public List<PositionVo> getPositions();
	
	//마이페이지+회원상세 선호 포지션 가져오기
	public List<MemberDetailPageVo> getPreferPosition(String userid);
	
	//마이페이지+회원상세 기간 가져오기
	public List<V_Duration> getDurations();
	
	//마이페이지+회원상세 선호 기간 가져오기
	public List<MemberDetailPageVo> getPreferDurations(String userid);
	
	//마이페이지+회원상세 프로젝트 경험 가져오기
	public List<M_ExperienceVo> getExperiences(String userid);
	
	//마이페이지에서 프로젝트 경험 없음이 없음이라고 입력한건지 확인
	public String haveExperience(String userid);
	
	//마이페이지+회원상세 기술, 기간, 포지션 수정 시 삭제 및 재등록
	public Integer deleteSkills(String memberid);
	
	public Integer insertSkills(String memberid, String stat);
	
	public Integer updatePosition(String memberid, String stats);
	
	public Integer deleteDurations(String memberid);
	
	public Integer insertDurations(String memberid, String stat);
	
	//마이페이지 프로젝트 경험 있/없 업데이트
	public Integer updateExperience(String memberid, int answer);
	
	//마이페이지 프로젝트 경험 있는 사람은 기입하기^^
	public Integer insertExperiences(List<M_ExperienceVo> mex);
	
	//마이페이지 회원 탈퇴시 탈퇴날짜 업데이트
	public Integer updateDeleteDate(String quit_id);
	
	//회원 상세 페이지 이메일 가져오기
	public MemberVo getMemberDetail(String memberid);
	
	// 포인트 관리 쿼리
	public int updatePoint(PointVo point);
	
	//회원 상세 페이지 리뷰목록 가져오기
	public List<ReviewVo> getReviewList(String userid);
}
