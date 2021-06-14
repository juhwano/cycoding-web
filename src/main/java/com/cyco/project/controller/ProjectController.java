package com.cyco.project.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.cyco.common.vo.AdrVo;
import com.cyco.common.vo.MemberVo;
import com.cyco.common.vo.P_FieldVo;
import com.cyco.common.vo.PositionVo;
import com.cyco.common.vo.SkillVo;
import com.cyco.member.service.MemberService;
import com.cyco.project.service.ProjectService;
import com.cyco.project.vo.P_DetailVo;
import com.cyco.project.vo.P_DurationVO;
import com.cyco.project.vo.P_SkillVo;
import com.cyco.project.vo.PmemberCountVo;
import com.cyco.project.vo.ProjectVo;
import com.cyco.project.vo.V_PjAdrField_Join_V_PDetail;
import com.cyco.project.vo.V_PjSk;
import com.cyco.project.vo.V_PmPosition;
import com.cyco.project.vo.V_PmPostion_Count;
import com.cyco.utils.UtilFile;

import net.sf.json.JSONArray;

@Controller
@RequestMapping(value="project")
public class ProjectController {
	
	@Autowired
	private ProjectService service;
	
	@Autowired
	private MemberService memberService;
	
	
	@RequestMapping(value="list")
	public String getProjectList(Model m) {
		System.out.println("this is /list");
		// 프로젝트 리스트 첫 페이지
		// 모든 프로젝트 리스트 바로 뿌려주기.
		List<V_PjAdrField_Join_V_PDetail> project_list = service.getProjectList("");
		JSONArray json_project_list = JSONArray.fromObject(project_list);
		
		//각 프로젝트의 기술스택 리스트
		List<V_PjSk> pjsk_list = service.getPjSkList();
		JSONArray json_pjsk_list = JSONArray.fromObject(pjsk_list);
		
		//지역 리스트
		List<AdrVo> adr_list = service.getAdrList();
		
		//분야 리스트
		List<P_FieldVo> field_list = service.getFieldList();
		
		//기술스택 리스트
		List<SkillVo> skill_list =service.getSkillList();
		
		//프로젝트 멤버 자리 개수 리스트
		List<PmemberCountVo> membercount_list = service.getPmemberCountList();
		JSONArray json_membercout_list = JSONArray.fromObject(membercount_list);
		
		
		
		m.addAttribute("project_list",json_project_list);
		m.addAttribute("pjsk_list",json_pjsk_list);
		
		m.addAttribute("adr_list",adr_list);
		m.addAttribute("field_list",field_list);
		m.addAttribute("skill_list",skill_list);
		
		m.addAttribute("membercount_list",json_membercout_list);
		
		
		
		
		System.out.println(project_list);
		System.out.println(adr_list);
		System.out.println(field_list);
		System.out.println(skill_list);
		
		return "Project/ProjectList";
	}
	
	
	@RequestMapping(value="create",method = RequestMethod.GET)
	public String ProjectAdd(Model model, @RequestParam("userId") String userId) {
		
		
		List<AdrVo> AdrList = service.getAdrList();
		List<P_FieldVo> FieldList = service.getFieldList();
		List<SkillVo> SkillList = service.getSkillList();
		List<PositionVo> PositionList = service.getPositionList();
		List<P_DurationVO> DurationList = service.getDurationList();
		MemberVo member = memberService.getMember(userId);
		
		
		
		model.addAttribute("AdrList", AdrList);
		model.addAttribute("FieldList", FieldList);
		model.addAttribute("SkillList", SkillList);
		model.addAttribute("PositionList", PositionList);
		model.addAttribute("DurationList", DurationList);
		model.addAttribute("MemberVo", member);
		
		
		return "Project/ProjectCreate";
	}
	
	
	@RequestMapping(value="create",method = RequestMethod.POST) 
	public String ProjectAdd(P_DetailVo detail, ProjectVo projectvo, P_SkillVo skillvo, P_FieldVo fieldvo, P_DurationVO duration,
			@RequestParam("uploadFile") MultipartFile uploadFile, MultipartHttpServletRequest request) {
		
		// 파일 유틸 생성
		UtilFile utilFile = new UtilFile();
		
		// 받아오는 파일 받아오기
		String UploadFile = utilFile.FileUpload(request, uploadFile);
		String UploadFilename = utilFile.getFilename();
		
		detail.setP_image(UploadFilename);
		
		System.out.println("프로젝트 생성 하기");
		
		System.out.println(detail);
		System.out.println(projectvo);
		System.out.println(skillvo);
		System.out.println(fieldvo);
		System.out.println(duration);
		
		
		return "Main/CycoMain";
	}
	
	//해당 프로젝트로 링크 변경해야됨
	@RequestMapping(value="detail",method = RequestMethod.GET)
	public String ProjectDetail(@RequestParam("project_id") String project_id, Model m) {
		System.out.println("/project/detail");
	/*
	 	필요한 데이터
	 	1. 모집현황 - 모집 포지션 , 구인 인원, 현재 확정인원 --> 포지션별로 group.
	 		--> select count(member_id) as curr,count(*) as max,position_name ,position_id 
				from v_pm_position
				where project_id=1
				group by position_name,position_id
				;
	 	
	 	7. 확정된 팀원 목록 - 프로필사진, member_id, 닉네임
	 		--> getPmemberCountLIst(project_id)
	 	
	 	밑에는 V_PjAdrField_Join_V_PDetail에서 가져오면 될듯.
	 	2. 프로젝트 모집분야 - PROJECT테이블 : field_code
	 	3. 프로젝트 모집상태 - P_DETAILE 테이블 : p_state
	 	4. 프로젝트 제목 --> P_DETAILE 테이블 : p_title
	 	5. 프로젝트 본문 --> p_content
	 	6. 프로젝트 기간 - P_DETAILE 테이블 : duration_id
	 	7. 프로젝트 생성자 정보 - 프로필사진, member_id, 닉네임
	 	
	 */
		//프로젝트 멤버 검색
		 List<V_PmPosition> pmlist = service.getProjectMemberList(project_id);
		
		//프로젝트 상세의 포지션별 자리수
		List<V_PmPostion_Count> pmcountlist = service.getPmemberCount(project_id);
		
		//프로젝트 상세 내용을 담은 객체
		V_PjAdrField_Join_V_PDetail project = service.getOneProject(project_id);
		
		
		m.addAttribute("project",project);
		m.addAttribute("pmcountlist",pmcountlist);
		m.addAttribute("pmlist",pmlist);
		System.out.println(project);
		System.out.println(pmcountlist);
		System.out.println(pmlist);
		
		return "Project/ProjectDetail";
	}

	
}
