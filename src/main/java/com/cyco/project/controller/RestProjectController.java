package com.cyco.project.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.cyco.common.vo.BookmarkVo;
import com.cyco.project.service.ProjectService;
import com.cyco.project.vo.ProjectNameVo;
import com.cyco.project.vo.V_PjAdrField_Join_V_PDetail;

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
	
	@RequestMapping(value = "bookmark", method=RequestMethod.GET)
	public String bookMarking(@RequestParam String project_id, HttpSession session) {
		String member_id = String.valueOf(session.getAttribute("member_id"));
		
		String text = null;
		
		//북마크 리스트에 해당 유저가 해당 프로젝트를 북마크한 데이터가 있는지 확인
		int checkNum = service.checkBookMark(project_id, member_id);
		System.out.println("projectRestController, checkBookMark: " + checkNum);
		
		if(checkNum == 0) {
			BookmarkVo bookmark = new BookmarkVo(0, project_id, member_id);
			service.setBookMark(bookmark);
			text = "insert";
		}else {
			service.deleteBookMark(project_id, member_id);
			text = "delete";
		}
		
		return text;
	}
}
