package com.cyco.project.controller;

import java.util.ArrayList;
import java.util.List;

import javax.mail.Session;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.cyco.common.vo.AdrVo;
import com.cyco.common.vo.MemberVo;
import com.cyco.common.vo.P_FieldVo;
import com.cyco.common.vo.PointVo;
import com.cyco.common.vo.PositionVo;
import com.cyco.common.vo.SkillVo;
import com.cyco.member.service.MemberService;
import com.cyco.member.vo.V_MlistVo;
import com.cyco.project.service.ProjectService;
import com.cyco.project.vo.P_DetailVo;
import com.cyco.project.vo.P_DurationVO;
import com.cyco.project.vo.P_MemberVo;
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
	public String ProjectAdd(Model model, Authentication auth) {
		
		MemberVo member = memberService.getMember(auth.getName());
		
		if(member.getHAVE_POINT() < 50) {
			model.addAttribute("errorMsg", "포인트부족");
			
		}else {
			
			List<AdrVo> AdrList = service.getAdrList();
			List<P_FieldVo> FieldList = service.getFieldList();
			List<SkillVo> SkillList = service.getSkillList();
			List<PositionVo> PositionList = service.getPositionList();
			List<P_DurationVO> DurationList = service.getDurationList();
			
			model.addAttribute("AdrList", AdrList);
			model.addAttribute("FieldList", FieldList);
			model.addAttribute("SkillList", SkillList);
			model.addAttribute("PositionList", PositionList);
			model.addAttribute("DurationList", DurationList);
			
			
		}
		
		model.addAttribute("MemberVo", member);
		return "Project/ProjectCreate";
	}
	
	
	@Transactional
	@RequestMapping(value="create",method = RequestMethod.POST) 
	public String ProjectAdd(P_DetailVo detail, ProjectVo projectvo,
			@RequestParam("skil_code") String[] skil_code,
			@RequestParam("position_code") String[] position_code, 
			@RequestParam("field_selectCount") int[] field_selectCount,
			@RequestParam("uploadFile") MultipartFile uploadFile, 
			MultipartHttpServletRequest request,
			Authentication auth,
			Model model) {
		
		MemberVo member = memberService.getMember(auth.getName());
		
		if(member.getHAVE_POINT() < 50) {
			model.addAttribute("msg", "false");
		}else {
			// 파일 유틸 생성
			UtilFile utilFile = new UtilFile();
			
			// 받아오는 파일 받아오기
			String UploadFile = utilFile.FileUpload(request, uploadFile);
			String UploadFilename = utilFile.getFilename();
			detail.setP_image(UploadFilename);

			List<P_MemberVo> MemberList = new ArrayList<>();
			List<P_SkillVo> SkillList = new ArrayList<>();
			
			
			// 프로젝트 insert  // insert 한 프로젝트 ID값 가져옴
			String ProjectId = service.setProjectInsert(projectvo);
			
			// 가져온 ID 값 디테일 VO에 넣어주기
			detail.setProject_id(ProjectId);
			
			// 프로젝트 디테일 insert
			service.setProjectDetail(detail);
			
			// 포지션VO 받아온대로  List에 add 
			for(int i = 0 ; i < position_code.length; i++) {
				for(int j = 0; j < field_selectCount[i]; j++) {
					MemberList.add(new P_MemberVo(null, ProjectId, position_code[i]));
				}
				
			}	
			
			// 스킬VO 받아온대로 List에 add
			for(String skill : skil_code) {
				SkillList.add(new P_SkillVo(ProjectId,skill));
			}
			
			// 포지션 insert
			service.setProjectMemberList(MemberList);
			// 스킬 insert
			service.setProjectSkillList(SkillList);
			
			
			int memberID = member.getMEMBER_ID();
			int have_Point = member.getHAVE_POINT();
			int use_Point = member.getUSE_POINT();
			
			// 포인트 처리
			PointVo point = new PointVo(memberID, have_Point -= 50, use_Point += 50);
			
			memberService.updatePoint(point);
			
			model.addAttribute("msg", "true");
			model.addAttribute("projectId",ProjectId);
		}
		
		
		return "redirect:/project/projectCreateok";
	}
	
	@RequestMapping(value="projectCreateok",method = RequestMethod.GET) 
	public String ProjectAdd(String msg, String projectId, Model model, Authentication auth) {
		
		
		
		//기본회원목록넘기기
		List<V_MlistVo> memberList = memberService.memberList();
		
		model.addAttribute("memberList", memberList);
		model.addAttribute("msg", msg);
		model.addAttribute("id", projectId);
		
		
		
		return "Project/ProjectCreateOk";
	}
	
	
	//해당 프로젝트로 링크 변경해야됨
	@RequestMapping(value="detail",method = RequestMethod.GET)
	public String ProjectDetail() {
		
		System.out.println("프로젝트 상세페이지");
		
		return "Project/ProjectDetail";
	}

	
}
