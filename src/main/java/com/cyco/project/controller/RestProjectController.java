package com.cyco.project.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.cyco.project.service.ProjectService;
import com.cyco.project.vo.ApplyVo;
import com.cyco.project.vo.P_DetailVo;
import com.cyco.project.vo.P_SkillVo;
import com.cyco.project.vo.ProjectNameVo;
import com.cyco.project.vo.ProjectVo;
import com.cyco.project.vo.V_PjAdrField_Join_V_PDetail;
import com.cyco.utils.UtilFile;

import net.sf.json.JSONArray;

@RestController
@RequestMapping("ajaxproject")
public class RestProjectController {

	@Autowired
	private ProjectService service;
	
	@RequestMapping(value="filter", method = RequestMethod.GET)
	public List<V_PjAdrField_Join_V_PDetail> getFiltedProjectList(@RequestParam Map<String, String> data){
		//리턴할 List객체 초기화
		List<V_PjAdrField_Join_V_PDetail> list =new ArrayList<V_PjAdrField_Join_V_PDetail>();

		//3개필터링(분야, 지역, 상태)
		List<String> Flist= service.getFilteredProjectList(data);
			
			//기술 필터링
			//위에서받은 Flist도 같이 넣어준다.
//		Flist = service.getFilteredProjectSkillList(data,Flist);
		Flist = service.getFilteredProjectSkillList(data,Flist);
		
//		Flist : 3개를 필터링 한 값이 있고
//		skill을 필터링 한 값이 있으면
		if(Flist!=null) {
			//3개필터링과 skill필터링의 중복되는 결과값이 있을때
			if(Flist.size()>0) {
				 list =service.getProjectList(Flist,data.get("p_state"));
			}
			//중복되는 결과값이 없을때
			else {
				//비어있는 list return
			}
		}
		//input값이 아무것도 없을떄 null => 전체검색
		else if(Flist == null) {
			list = service.getProjectList(data.get("p_state"));
		}
		return list;
	}
	
	@RequestMapping(value = "search", method=RequestMethod.GET)
	public List<V_PjAdrField_Join_V_PDetail> getSearchedProjectList(@RequestParam Map<String,String> projectname){
		//리턴할 List객체 초기화
		List<V_PjAdrField_Join_V_PDetail> searched_list =null;
		searched_list = service.getSearchedProjectList(projectname);
		
		return searched_list;
		
	}
	
	@RequestMapping(value="projectCheckApply", method=RequestMethod.GET)
	public String CheckProjectApply(ApplyVo apply) {
		String returnUrl = null;
		
		int projectState = service.CheckProject(apply.getMember_id());
		
		int checkProjectApply = service.CheckProjectApply(apply);
		
		// 자신이 만든 프로젝트가 완료가 아닌것들 가져오기
		if(projectState > 1) {
			returnUrl = "is_project";
			return returnUrl;
		}else if(checkProjectApply > 1) {
			returnUrl = "ProjectApply";
			return returnUrl;
		}else {
			returnUrl = "true";
		}
		
		
		return returnUrl;
	}
	
	
	@RequestMapping(value="projectapply", method=RequestMethod.GET)
	public String setProjectApply(ApplyVo apply) {
		String returnUrl = "false";
		
		int check = service.CheckProjectApply(apply);
		if(check > 0) {
			return returnUrl;
		}else {
			int result = service.setProjectApply(apply);
			
			if(result > 0) {
				returnUrl = "true";
			}
		}
		
		
		
		return returnUrl;
	}
	
	@RequestMapping(value="editAjax",method = RequestMethod.POST)
	public String ProjectEditAjax(P_DetailVo detail, ProjectVo projectvo,
			@RequestParam(value = "skill_code")List<String> skill_code,
			@RequestParam("uploadFile") MultipartFile uploadFile, 
			MultipartHttpServletRequest request){
			
		// 파일 유틸 생성
		UtilFile utilFile = new UtilFile();
		
		// 받아오는 파일 받아오기
		utilFile.FileUpload(request, uploadFile);
		String UploadFilename = utilFile.getFilename();
		// 받아온 파일 디테일에 set
		detail.setP_image(UploadFilename);
	
		
		List<P_SkillVo> SkillList = new ArrayList<P_SkillVo>();
		
		
		// 스킬VO 받아온대로 List에 add
		for(String skill : skill_code) {
			SkillList.add(new P_SkillVo(projectvo.getProject_id(),skill));
		}
		
	
		System.out.println(projectvo);
		System.out.println(detail);
		System.out.println(SkillList);
		
		// 프로젝트 업데이트 
		String ajax = null;
		int result = service.updateProject(projectvo,detail,SkillList);
		if(result > 0) {
			ajax = "true";
		}else {
			ajax = "false";
		}
		
		
		return ajax;
	}
}
