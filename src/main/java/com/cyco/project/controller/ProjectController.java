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
	public String ProjectDetail() {
		
		System.out.println("프로젝트 상세페이지");
		
		return "Project/ProjectDetail";
	}

	
}
