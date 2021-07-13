package com.cyco.member.controller;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.cyco.common.vo.Apply_Join_P_datailVo;
import com.cyco.common.vo.BookMark_Join_P_detailVo;
import com.cyco.common.vo.M_AuthVo;
import com.cyco.common.vo.PositionVo;
import com.cyco.common.vo.SkillVo;
import com.cyco.member.dao.MemberDao;
import com.cyco.member.security.ChangeAuth;
import com.cyco.member.service.MemberDetailService;
import com.cyco.member.service.MemberService;
import com.cyco.member.vo.M_ExperienceVo;
import com.cyco.member.vo.MemberDetailPageVo;
import com.cyco.member.vo.MyProject_Join_Member;
import com.cyco.member.vo.MyReviewVo;
import com.cyco.project.vo.P_DurationVO;

@RequestMapping("mypage/ajax/")
@RestController
public class MyPageRestController {
	
	@Autowired
	MemberService memberservice;
	MemberDetailService memberdetailservice;
	// MemberVo member;

	@Autowired
	public void setMemberDetailService(MemberDetailService memberdetailservice) {
		this.memberdetailservice = memberdetailservice;
		// this.member = member;
	}
	
	//닉네임, 휴대폰 번호 중복체크는 서비스 없이 바로 사용함
	private SqlSession sqlsession;
	@Autowired
	public void setSqlsession(SqlSession sqlsession) {
		this.sqlsession = sqlsession;
	}

	// 회원 개인정보 수정
	@RequestMapping(value = "editmydetail")
	public String editInfo(String code, String info, String userid) {

		System.out.println("This is editInfo ajax");
		System.out.println("userid : " + userid);
		int id = 0;

		try {

			System.out.println("userid : " + userid);
			id = Integer.parseInt(userid);
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("오류 : " + e.getMessage());

		}

		System.out.println("현재 회원번호 : " + id);

		String result = "fail";
		int row = 0;

		String column = "";

		if (code.equals("비밀번호")) {

			column = "MEMBER_PWD";

			row = memberdetailservice.editPwd(column, info, id);

			// 중복검사 해야 함
		} else if (code.equals("닉네임")) {

			column = "MEMBER_NICKNAME";
			row = memberdetailservice.editInfo(column, info, id);

		} else if (code.equals("이름")) {

			column = "MEMBER_NAME";
			row = memberdetailservice.editInfo(column, info, id);

			// 중복검사 해야 함
		} else if (code.equals("휴대폰")) {

			column = "MEMBER_PHONE";
			row = memberdetailservice.editInfo(column, info, id);
		}

		if (row > 0) {
			result = "success";
		}

		return result;
	}
	
	//개인정보 수정시 닉네임 중복체크
	@RequestMapping(value="nicknamecheck",method=RequestMethod.GET)
	public String checkNickNameMyPage(String nickName) {
		
		MemberDao memberdao = sqlsession.getMapper(MemberDao.class);
		
		String result = "able";
		
		if(memberdao.checkNickName(nickName) != null) {
			
			result = "disable";
		} else {
			result = "able";
		}
		
		return result;
	}
	
	//개인정보 수정시 휴대폰번호 중복체크
	@RequestMapping(value="phonecheck",method=RequestMethod.GET)
	public String checkPhoneNameMyPage(String phone) {
		
		System.out.println("현재 phone" + phone);
		
		MemberDao memberdao = sqlsession.getMapper(MemberDao.class);
		String result = "able";
		
		if(memberdao.checkPhone(phone) != null) {
			result = "disable";
		} else {
			result = "able";
		}
		
		return result;
	}
	
	// 모달창에 기술 태그 뿌리기
	@RequestMapping(value = "getskills")
	public List<SkillVo> getSkills() {

		List<SkillVo> list = new ArrayList<SkillVo>();

		System.out.println(memberdetailservice.getSkills().toString());

		list = memberdetailservice.getSkills();

		return list;

	}

	// 모달창에 포지션 태그 뿌리기
	@RequestMapping(value = "getposition")
	public List<PositionVo> getSPositions() {

		List<PositionVo> list = new ArrayList<PositionVo>();

		System.out.println(memberdetailservice.getPositions().toString());

		list = memberdetailservice.getPositions();

		return list;

	}

	// 모달창에 선호 기간 태그 뿌리기
	@RequestMapping(value = "getdurations")
	public List<P_DurationVO> getDurations() {

		List<P_DurationVO> list = new ArrayList<P_DurationVO>();

		System.out.println(memberdetailservice.getDurations().toString());

		list = memberdetailservice.getDurations();

		return list;

	}
	
	//스탯 삭제하기(기술, 기간)
	@RequestMapping(value = "deletestat")
	public String deleteStat(String memberid, String type) {

		System.out.println("deleteStat");
		System.out.println(memberid);
		System.err.println("delete " + type);

		String result = "fail";

		if (type.equals("skill")) {

			result = memberdetailservice.deleteSkills(memberid);

		} else if (type.equals("duration")) {

			result = memberdetailservice.deleteDurations(memberid);
		}

		return result;
	}

	// 변경한 기술 스탯 디비에 반영하기
	@RequestMapping(value = "editskills")
	public String editSkills(String memberid, String stat) {

		System.out.println("기술 비동기 변경");
		System.out.println(memberid);
		System.out.println(stat);

		String result = memberdetailservice.editSkills(memberid, stat);

		return result;
	}

	// 변경할 포지션 디비 반영
	@RequestMapping(value = "updateposition")
	public String updatePosition(String memberid, String stat) {

		System.out.println("포지션 비동기 변경");
		System.out.println(memberid);
		System.out.println(stat);

		String result = memberdetailservice.updatePosition(memberid, stat);

		return result;
	}

	// 변경한 선호기간 스탯 디비에 반영하기
	@RequestMapping(value = "editdurations")
	public String editDurations(String memberid, String stat) {

		System.out.println("기간 비동기 변경");
		System.out.println(memberid);
		System.out.println(stat);

		String result = memberdetailservice.editDurations(memberid, stat);

		return result;
	}

	// 프로젝트 경험 있/없 디비에 반영하기
	@RequestMapping(value = "updateexperience")
	public String updateExperience(String memberid, String answer) {
		String result = "fail";

		if (answer.equals("never")) {

			result = memberdetailservice.updateExperience(memberid, 0);

		} else {

			result = memberdetailservice.updateExperience(memberid, 1);

		}

		return result;
	}

	// 프로젝트 경험 기입한 내용 폼 태그로 날린 거 받아서 인서트하기
	//post 방식으로 보내는데 자꾸 get을 허용할 수 없다는 에러 발생해서 method 추가함
	@RequestMapping(value = "insertexperiences", method = {RequestMethod.GET, RequestMethod.POST})
	public String insertExperiences(@RequestParam String ID ,@RequestParam String EXP_TITLE,@RequestParam String EX_POSITION,
	@RequestParam String EX_SKILL, @RequestParam String EX_CONTENT,@RequestParam String EX_DURATION) {
		 
		 M_ExperienceVo mex = new M_ExperienceVo();
 
		 mex.setMEMBER_ID(ID); 
		 mex.setEXP_TITLE(EXP_TITLE);
		 mex.setEX_POSITION(EX_POSITION);
		 mex.setEX_SKILL(EX_SKILL);
		 mex.setEX_CONTENT(EX_CONTENT);
		 mex.setEX_DURATION(EX_DURATION);

		System.out.println(mex.toString());
		String result =	memberdetailservice.insertExperiences(mex);

		return result;
	}
	
	//프로젝트 경험 추가된 것 뷰단에 반영하기
	@RequestMapping(value = "getnewexperiences", method = RequestMethod.POST)
	public List<M_ExperienceVo> getNewExperiences(String useremail){
		
		return memberdetailservice.getExperiences(useremail);
		
	}
	
	//프로젝트 경험 삭제 디비 반영
	@RequestMapping(value="deleteexperience",method=RequestMethod.POST)
	public String deleteExperience(String ex_id, String memberid) {
		
		String result = memberdetailservice.deleteExperience(ex_id, memberid);
		
		return result;
	}
	
	//프로젝트 경험 업데이트 디비 반영
	//post 방식으로 보내는데 자꾸 get을 허용할 수 없다는 에러 발생해서 method 추가함
	@RequestMapping(value="updateexperiences", method= {RequestMethod.GET, RequestMethod.POST})
	public String updateExperiences(@RequestParam String member_id_input, @RequestParam String ex_count_input ,@RequestParam String exp_title_input,
			@RequestParam String ex_position_input, @RequestParam String ex_skill_input, @RequestParam String ex_content_input,@RequestParam String ex_duration_input) {

		 System.out.println("프로젝트 경험 수정하기");
		 M_ExperienceVo mex = new M_ExperienceVo();

		 mex.setMEMBER_ID(member_id_input);
		 mex.setEx_count(ex_count_input);
		 mex.setEXP_TITLE(exp_title_input);

		 mex.setEX_POSITION(ex_position_input);
		 mex.setEX_SKILL(ex_skill_input); 
		 mex.setEX_CONTENT(ex_skill_input);
		 mex.setEX_DURATION(ex_duration_input); 


		System.out.println(mex.toString());
		String result =	memberdetailservice.updateExperiences(mex);
		return result;
	}

	// 디비에서 변경된 스탯 뷰단에 반영(공통)
	@RequestMapping(value = "modifystatview")
	public List<MemberDetailPageVo> modifyStatView(String userid, String type) {

		System.out.println("변경한 기술 비동기로 상세페이지에 반영");

		List<MemberDetailPageVo> list = new ArrayList<MemberDetailPageVo>();

		if (type.equals("skill")) {

			System.out.println("modifyStatView skill");

			list = memberdetailservice.getPreferSkills(userid);

		} else if (type.equals("position")) {

			System.out.println("modifyStatView position");

			list = memberdetailservice.getPreferPosition(userid);

		} else if (type.equals("duration")) {

			System.out.println("modifyStatView duration");

			list = memberdetailservice.getPreferDurations(userid);

		}

		return list;
	}
	
	//모든 정보 입력시 포인트 최초 지급
	@RequestMapping(value="givepoint",method=RequestMethod.POST)
	public String givePointFirstTime(String member_id) {	
		System.out.println("포인트 지급");
		String result = memberdetailservice.givePointFirstTime(member_id);
		 
		return result;
	}

	// 회원이 탈퇴 누르면 DB에 있는 탈퇴날짜 업데이트
	@RequestMapping(value = "updatedeletecount", method = RequestMethod.POST)
	public String submitQuit(String quit_id) {
		
		String msg = "fail";
		
		//프로젝트 팀장인지 확인
		int isTeamManager = memberdetailservice.isTeamManager(quit_id);
		
		if(isTeamManager > 0) {
			//작성한 프로젝트가 있으면 탈퇴 반려
			msg = "teammanager";
		} else {
			int result = memberdetailservice.updateDeleteDate(quit_id);
			if (result > 0) {
				msg = "success";
			}
		}
		return msg;

	}

	// 마이페이지 진입 전 비밀번호체크
	@RequestMapping(value = "mypageCheck", method = RequestMethod.POST)
	public boolean pwdCheck(@RequestParam Map<String, String> data) {

		String useremail = data.get("useremail");
		String userPwd = data.get("userPwd");

		if (memberdetailservice.checkPwd(data)) {
			return true;
		}

		return false;
	}
	
	//컨트롤러
	//  결제
  @RequestMapping(value="chargePoint", method = RequestMethod.POST)
  public String chargePoint(@RequestParam Map<String, String> data) {
     
     System.out.println(data.toString());
     
     int result = memberdetailservice.chargePoint(data.get("memberid"), data.get("point"));
     
     String msg = "fail";
     
     if(result > 0) {
        msg = "success";
     }
        
     return msg;
     
  }
  
  
  //북마크, 지원목록 페이지
  
  //북마크 취소
  @RequestMapping(value="markCancle", method = RequestMethod.GET)
  public List<BookMark_Join_P_detailVo> markCancle(@RequestParam String project_id, HttpSession session) {
	  String member_id = String.valueOf(session.getAttribute("member_id"));
	  //DB에서 북마크 내역 삭제
	  memberdetailservice.deleteBookMark(project_id, member_id);
	  
	  //목록 재로딩
	  List<BookMark_Join_P_detailVo> bookmark_list = null;
	  bookmark_list = memberdetailservice.getBookmarkList(String.valueOf(session.getAttribute("member_id")));
	  
	  return bookmark_list;
  }
  
  //지원 취소
  @RequestMapping(value="applyCancle", method = RequestMethod.GET)
  public List<Apply_Join_P_datailVo> applyCancle(@RequestParam String apply_id, HttpSession session) {
	  //DB에서 북마크 내역 삭제
	  memberdetailservice.deleteApply(apply_id);
	  
	  //목록 재로딩
	  List<Apply_Join_P_datailVo> apply_list = null;
	  apply_list = memberdetailservice.getApplyList(String.valueOf(session.getAttribute("member_id")));
	  
	  return apply_list;
  }
  
  //리뷰 작성할 회원 목록 불러오기
  @RequestMapping(value="writeReviewMember", method = RequestMethod.GET)
  public List<MyProject_Join_Member> writeReviewMember(@RequestParam String projectid, HttpSession session) {
	  //팀장
	  MyProject_Join_Member teamLeader = memberdetailservice.writeReviewLeader(projectid, String.valueOf(session.getAttribute("member_id")));
	  //팀원
	  List<MyProject_Join_Member> writeReviewMember = memberdetailservice.writeReviewMember(projectid, String.valueOf(session.getAttribute("member_id")));
	  
	  //팀장 포지션에 '팀장'넣기
	  teamLeader.setPosition_name("팀장");
	  //배열에 팀장 넣기 
	  writeReviewMember.add(teamLeader);
	  
	  return writeReviewMember;
  }
  
  //로그인한 회원이 해당 프로젝트에 작성한 리뷰 조회
  @RequestMapping(value="myProjectReview", method = RequestMethod.GET)
  public List<MyReviewVo> myProjectReview(@RequestParam String projectid, HttpSession session) {
	  
	  List<MyReviewVo> myprojectReview = memberdetailservice.getMyProjectReview(projectid, String.valueOf(session.getAttribute("member_id")));
	  
	  return myprojectReview;
  }
  
  //모든 정보 작성했을 때 준회원에서 회원으로 권한 업데이트
  @RequestMapping(value="makememberauth", method = RequestMethod.GET)
  public Boolean makeMemberAuth(@RequestParam String member_id, @RequestParam String authority_id) {
	  
	  M_AuthVo mauth = new M_AuthVo(authority_id,member_id);
	  Boolean bo = memberservice.UpdateAuth(mauth);
	  
	  //시큐리티 권한 변경
	  ChangeAuth chau = new ChangeAuth("ROLE_MEMBER");
	  
	  System.out.println("newAuth " + chau.toString());
	  
	  return bo;
  }
  
  	//후기작성시 포인트 지급
	@RequestMapping(value="giveReviewpoint",method=RequestMethod.POST)
	public String giveReviewPoint(HttpSession session) {
		
		memberdetailservice.giveReviewPoint(String.valueOf(session.getAttribute("member_id")));
		
		return "givePoint";
	}
	
	//페이지 이동시마다 프로젝트 있는지 확인
	@RequestMapping(value="checkhasproject", method = RequestMethod.GET)
	public String checkHasProject(@RequestParam String id) {
		
		HashMap<String, String> project = memberservice.hasProject(id);
		
		return project.get("project_id");
		
	}

}
