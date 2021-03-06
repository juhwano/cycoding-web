package com.cyco.project.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.session.SessionInformation;
import org.springframework.security.core.session.SessionRegistry;
import org.springframework.security.core.userdetails.User;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.cyco.alarm.vo.AlarmVo;
import com.cyco.common.vo.BookmarkVo;
import com.cyco.common.vo.M_AuthVo;
import com.cyco.common.vo.PositionVo;
import com.cyco.member.security.ChangeAuth;
import com.cyco.member.service.MemberService;
import com.cyco.project.service.ProjectService;
import com.cyco.project.vo.ApplyVo;
import com.cyco.project.vo.P_DetailVo;
import com.cyco.project.vo.P_FeedVo;
import com.cyco.project.vo.P_MemberVo;
import com.cyco.project.vo.P_QnaVo;
import com.cyco.project.vo.P_SkillVo;
import com.cyco.project.vo.ProjectVo;
import com.cyco.project.vo.V_ApplyMemberList;
import com.cyco.project.vo.V_PjAdrField_Join_V_PDetail;
import com.cyco.project.vo.V_PmPosition;
import com.cyco.project.vo.V_PmPostion_Count;
import com.cyco.utils.UtilFile;
import com.fasterxml.jackson.databind.ObjectMapper;

@RestController
@RequestMapping("ajaxproject")
public class RestProjectController {

	@Autowired
	SessionRegistry sessionRegistry;

	@Autowired
	MemberService memberservice;

	@Autowired
	private ProjectService service;

	@RequestMapping(value = "filter", method = RequestMethod.GET)
	public List<V_PjAdrField_Join_V_PDetail> getFiltedProjectList(@RequestParam Map<String, String> data) {
		// ????????? List?????? ?????????
		List<V_PjAdrField_Join_V_PDetail> list = new ArrayList<V_PjAdrField_Join_V_PDetail>();

		// 3????????????(??????, ??????, ??????)
		List<String> Flist = service.getFilteredProjectList(data);

		// ?????? ?????????
		// ??????????????? Flist??? ?????? ????????????.
//		Flist = service.getFilteredProjectSkillList(data,Flist);
		Flist = service.getFilteredProjectSkillList(data, Flist);

//		Flist : 3?????? ????????? ??? ?????? ??????
//		skill??? ????????? ??? ?????? ?????????
		if (Flist != null) {
			// 3??????????????? skill???????????? ???????????? ???????????? ?????????
			if (Flist.size() > 0) {
				list = service.getProjectList(Flist, data.get("p_state"));
			}
			// ???????????? ???????????? ?????????
			else {
				// ???????????? list return
			}
		}
		// input?????? ???????????? ????????? null => ????????????
		else if (Flist == null) {
			list = service.getProjectList(data.get("p_state"));
		}
		return list;
	}

	@RequestMapping(value = "search", method = RequestMethod.GET)
	public List<V_PjAdrField_Join_V_PDetail> getSearchedProjectList(@RequestParam Map<String, String> projectname) {
		// ????????? List?????? ?????????
		List<V_PjAdrField_Join_V_PDetail> searched_list = null;
		searched_list = service.getSearchedProjectList(projectname);

		return searched_list;

	}

	@RequestMapping(value = "projectCheckApply", method = RequestMethod.GET)
	public String CheckProjectApply(ApplyVo apply) {
		String returnUrl = "true";

		int projectState = service.CheckProject(apply.getMember_id());

		int checkProjectApply = service.CheckProjectApply(apply);

		// ????????? ?????? ??????????????? ????????? ???????????? ????????????
		if (projectState > 0) {
			returnUrl = "is_project";
			return returnUrl;
		}

		if (checkProjectApply > 0) {
			returnUrl = "ProjectApply";
			return returnUrl;
		}

		return returnUrl;
	}

	// ???????????? ??????
	@RequestMapping(value = "projectapply", method = { RequestMethod.POST, RequestMethod.GET })
	public String setProjectApply(@RequestBody HashMap<String, Object> Applydata) {
		String returnUrl = "false";

		ObjectMapper objectMapper = new ObjectMapper();

		ApplyVo apply = objectMapper.convertValue(Applydata.get("apply"), ApplyVo.class);
		AlarmVo alarm = objectMapper.convertValue(Applydata.get("alarm"), AlarmVo.class);

		int check = service.CheckProjectApply(apply);
		int project = service.Ismember(apply.getMember_id());
		
		System.out.println("check: " + check);
		System.out.println("project: " + project);

		if (check > 0 || project > 0) {
			returnUrl = "isProject";
			return returnUrl;
		} else {
			int result = service.setProjectApply(apply, alarm);

			if (result > 0) {
				returnUrl = "true";
			}
		}
		return returnUrl;
	}

	@RequestMapping(value = "editAjax", method = RequestMethod.POST)
	public String ProjectEditAjax(P_DetailVo detail, ProjectVo projectvo,
			@RequestParam(value = "skill_code") List<String> skill_code,
			@RequestParam("uploadFile") MultipartFile uploadFile, MultipartHttpServletRequest request) {

		// ?????? ?????? ??????
		UtilFile utilFile = new UtilFile();

		// ???????????? ?????? ????????????
		utilFile.FileUpload(request, uploadFile);
		String UploadFilename = utilFile.getFilename();
		// ????????? ?????? ???????????? set
		detail.setP_image(UploadFilename);

		List<P_SkillVo> SkillList = new ArrayList<P_SkillVo>();

		// ??????VO ??????????????? List??? add
		for (String skill : skill_code) {
			SkillList.add(new P_SkillVo(projectvo.getProject_id(), skill));
		}

		System.out.println(projectvo);
		System.out.println(detail);
		System.out.println(SkillList);

		// ???????????? ????????????
		String ajax = null;
		int result = service.updateProject(projectvo, detail, SkillList);
		if (result > 0) {
			ajax = "true";
		} else {
			ajax = "false";
		}

		return ajax;

	}

	@RequestMapping(value = "bookmark", method = RequestMethod.GET)
	public String bookMarking(@RequestParam String project_id, HttpSession session) {
		String member_id = String.valueOf(session.getAttribute("member_id"));

		String text = null;

		// ????????? ???????????? ?????? ????????? ?????? ??????????????? ???????????? ???????????? ????????? ??????
		int checkNum = service.checkBookMark(project_id, member_id);

		if (checkNum == 0) {
			BookmarkVo bookmark = new BookmarkVo(0, project_id, member_id);
			service.setBookMark(bookmark);
			text = "insert";
		} else {
			service.deleteBookMark(project_id, member_id);
			text = "delete";
		}

		return text;
	}

	@RequestMapping(value = "applyList", method = RequestMethod.GET)
	public List<V_ApplyMemberList> ApplyMember_List(String project_id, String Applycode) {

		V_ApplyMemberList v = new V_ApplyMemberList();
		v.setApply_position_id(Applycode);
		v.setProject_id(project_id);

		List<V_ApplyMemberList> member = service.getApplyMemberList(v);

		return member;
	}

	@RequestMapping(value = "applyMemberOk", method = { RequestMethod.POST, RequestMethod.GET })
	public String ApplyMember_Ok(@RequestBody HashMap<String, Object> data) {
		String returnUrl = null;

		ObjectMapper objectMapper = new ObjectMapper();

		ApplyVo apply = objectMapper.convertValue(data.get("apply"), ApplyVo.class);
		AlarmVo alarm = objectMapper.convertValue(data.get("alarm"), AlarmVo.class);

		
		int IsMember = service.Ismember(apply.getMember_id());
		int IsProject = service.CheckProject(apply.getMember_id());
		
		if(IsMember > 0 || IsProject > 0) {

			returnUrl = "isProject";

		} else {
			// ???????????? ?????? ????????? ???????????? ?????? ?????? ????????????
			int result = service.ApplyMember_Ok(apply, alarm);

			if (result == -1) {
				returnUrl = "checkd";
			} else if (result > 0) {
				returnUrl = "true";

			} else {
				returnUrl = "false";
			}
		}

		return returnUrl;
	}

	@RequestMapping(value = "applyMemberNo", method = { RequestMethod.POST, RequestMethod.GET })
	public String ApplyMember_No(@RequestBody HashMap<String, Object> data) {
		String returnUrl = null;

		ObjectMapper objectMapper = new ObjectMapper();

		ApplyVo apply = objectMapper.convertValue(data.get("apply"), ApplyVo.class);
		AlarmVo alarm = objectMapper.convertValue(data.get("alarm"), AlarmVo.class);

		int result = service.ApplyMember_No(apply, alarm);

		if (result > 0) {
			returnUrl = "true";
		} else {
			returnUrl = "false";
		}

		return returnUrl;
	}

	@RequestMapping(value = "getOutmember", method = { RequestMethod.POST, RequestMethod.GET })
	public String getOutMember(@RequestBody HashMap<String, Object> data) {
		String returnUrl = null;

		ObjectMapper objectMapper = new ObjectMapper();

		P_MemberVo p_member = objectMapper.convertValue(data.get("expel"), P_MemberVo.class);
		AlarmVo alarm = objectMapper.convertValue(data.get("alarm"), AlarmVo.class);

		int result = service.getOutMember(p_member, alarm);

		if (result > 0) {
			returnUrl = "true";
		} else {
			returnUrl = "false";
		}

		return returnUrl;
	}

	@RequestMapping(value = "toHandauth", method = { RequestMethod.POST, RequestMethod.GET })
	public String ToHandOverAuth(@RequestBody HashMap<String, Object> data) {
		String returnUrl = null;
		
		ObjectMapper objectMapper = new ObjectMapper();

		ApplyVo apply = objectMapper.convertValue(data.get("handover"), ApplyVo.class);
		AlarmVo alarm = objectMapper.convertValue(data.get("alarm"), AlarmVo.class);
		String NewMember_id = objectMapper.convertValue(data.get("NewMember_id"), String.class);

		P_MemberVo NewMember = new P_MemberVo(NewMember_id, apply.getProject_id(), apply.getPosition_id());

		int result = service.ToHandOverAuth(apply, NewMember, alarm);

		if (result > 0) {
			returnUrl = "true";
		} else {
			returnUrl = "false";
		}

		return returnUrl;
	}

	@RequestMapping(value = "PositionList", method = RequestMethod.GET)
	public List<PositionVo> getPositionList() {

		List<PositionVo> position = service.getPositionList();

		return position;
	}

	@RequestMapping(value = "getMemberEditBox", method = RequestMethod.GET)
	public Map<String, Object> getMemberEditBox(String project_id) {

		// ???????????? ?????? ??????
		List<V_PmPosition> pmlist = service.getProjectMemberList(project_id);

		// ???????????? ????????? ???????????? ?????????
		List<V_PmPostion_Count> pmcountlist = service.getPmemberCount(project_id);

		// ?????? ????????? ??????
		Map<String, Object> memberEditBoxList = new HashMap<String, Object>();

		memberEditBoxList.put("pmlist", pmlist);
		memberEditBoxList.put("pmcountlist", pmcountlist);

		return memberEditBoxList;
	}

	@RequestMapping(value = "projectinfo", method = RequestMethod.GET)
	public Map<String, Object> getProject_info(String project_id, HttpSession session) {

		// ???????????? ?????? ????????? ?????? ??????
		V_PjAdrField_Join_V_PDetail project = service.getOneProject(project_id);

		// ???????????? ????????? ???????????? ?????????
		List<V_PmPostion_Count> pmcountlist = service.getPmemberCount(project_id);

		// ????????? ????????? ????????????
		String member_id = String.valueOf(session.getAttribute("member_id"));

		ApplyVo apply = new ApplyVo();
		apply.setMember_id(member_id);
		apply.setProject_id(project_id);

		// ??????????????? ?????? ????????? ??????
		int checkProjectApply = service.CheckProjectApply(apply);

		// ??? ?????? ??????
		project.setP_content(project.getP_content().replace("\r\n", "<br>"));

		HashMap<String, Object> project_info = new HashMap<String, Object>();

		project_info.put("project", project);
		project_info.put("pmcountlist", pmcountlist);
		project_info.put("checkapply", checkProjectApply);

		return project_info;
	}

	@RequestMapping(value = "memberplus", method = RequestMethod.GET)
	public String MemberPlus(String project_id, int select_num, P_MemberVo member) {
		String returnURL = null;

		// ???????????? ????????? ???????????? ?????????
		List<V_PmPostion_Count> pmcountlist = service.getPmemberCount(project_id);
		List<P_MemberVo> updataList = new ArrayList<P_MemberVo>();

		if (select_num == 0) {
			returnURL = "NumZero";
			return returnURL;

		} else if (select_num > 0) {
			for (int i = 0; i < select_num; i++) {
				updataList.add(member);
			}
			// ?????? ????????????
			service.setProjectMemberList(updataList);
			returnURL = "Update";
			return returnURL;

		} else if (select_num < 0) {

			int AbsNum = Math.abs(select_num);

			service.CountMemberDel(project_id, member.getPosition_id(), AbsNum + "");
			// ?????? ????????????
			returnURL = "Delete";
			return returnURL;

		}

		return returnURL;
	}

	// ???????????? ??????
	@RequestMapping(value = "projectWithdrawal", method = RequestMethod.DELETE)
	public String ProjectWithdrawal(HttpSession session, String project_id, String state) {
		// ????????? ????????? ????????????
		String member_id = String.valueOf(session.getAttribute("member_id"));

		String returnURL = service.ProjectWithdrawal(member_id, project_id, state);
		
		// ?????? ???????????? ???????????? ?????????
		M_AuthVo mauth = new M_AuthVo("2", member_id);
		memberservice.UpdateAuth(mauth);

		// ???????????? ?????? ??????
		ChangeAuth chau = new ChangeAuth("ROLE_MEMBER");

		return returnURL;
	}

	// ???????????? qna ????????????
	@RequestMapping(value = "projectqna", method = RequestMethod.GET)
	public List<P_QnaVo> getProjectQna(String project_id) {

		List<P_QnaVo> qna = service.getProjectQna(project_id);

		return qna;
	}

	// ???????????? qna ?????? ????????????
	@RequestMapping(value = "ProjectQnaReply", method = RequestMethod.GET)
	public Map<String, Object> getProjectQna(String project_id, String REF, String member_id) {

		// ?????? ????????????
		List<P_QnaVo> qna = service.getProjectQnaReply(project_id, REF);

		// ???????????? ?????? ??????
		List<V_PmPosition> pmlist = service.getProjectMemberList(project_id);

		int Reader = service.ProjectReaderCheck(project_id, member_id);

		Map<String, Object> ReturnObj = new HashMap<String, Object>();

		ReturnObj.put("qna", qna);
		ReturnObj.put("pmlist", pmlist);
		ReturnObj.put("Reader", Reader);

		return ReturnObj;
	}

	// ???????????? qna ??????
	@RequestMapping(value = "projectqna", method = RequestMethod.POST)
	public String writeQna(P_QnaVo qnavo) {

		String returnURL = "false";

		int result = service.writeQna(qnavo);
		if (result > 0) {
			returnURL = "true";
		}

		return returnURL;
	}

	// ???????????? qna ?????? ??????
	@RequestMapping(value = "ProjectQnaReply", method = RequestMethod.POST)
	public String writeQnaReply(P_QnaVo qnavo) {

		String returnURL = "false";

		int result = service.writeQnaReply(qnavo);
		if (result > 0) {
			returnURL = "true";
		}

		return returnURL;
	}

	// ???????????? qna ??????
	@RequestMapping(value = "projectqna", method = RequestMethod.PUT)
	public String EditQna(P_QnaVo qnavo) {
		String returnURL = "false";

		int result = service.EditQna(qnavo);
		if (result > 0) {
			returnURL = "true";
		}

		return returnURL;
	}

	// ?????? qna ??????
	@RequestMapping(value = "projectqna", method = RequestMethod.DELETE)
	public String DeleteQna(P_QnaVo qnavo) {
		String returnURL = "false";

		int result = service.DeleteQna(qnavo);
		if (result > 0) {
			returnURL = "true";
		}

		return returnURL;
	}

	// ?????? ??????
	@RequestMapping(value = "projectcomplete", method = RequestMethod.POST)
	public String projectComplete(HttpSession session, P_DetailVo p_detail) {
		String returnURL = "false";

		String member_id = String.valueOf(session.getAttribute("member_id"));

		returnURL = service.projectComplete(member_id, p_detail);

		// ?????? ???????????? ???????????? ?????????
		M_AuthVo mauth = new M_AuthVo("2", member_id);
		Boolean bo = memberservice.UpdateAuth(mauth);

		// ???????????? ?????? ??????
		ChangeAuth chau = new ChangeAuth("ROLE_MEMBER");

		return returnURL;
	}

	// ???????????? ?????? ????????????
	@RequestMapping(value = "projectfeed", method = RequestMethod.GET)
	public Map<String, Object> getprojectpeed(String project_id, String member_id) {

		Map<String, Object> returnURL = new HashMap<String, Object>();

		int Reader = service.ProjectReaderCheck(project_id, member_id);

		List<P_FeedVo> F_list = service.getFeedList(project_id);

		returnURL.put("Reader", Reader);
		returnURL.put("F_list", F_list);

		return returnURL;

	}

	// ???????????? ?????? ????????????
	@RequestMapping(value = "projectfeed", method = RequestMethod.POST)
	public String WriteProjectFeed(P_FeedVo feed) {
		String returnURL = "false";

		int result = service.WriteProjectFeed(feed);
		if (result > 0) {
			returnURL = "true";
		}

		return returnURL;
	}

	// ???????????? ?????? ????????????
	@RequestMapping(value = "projectfeed", method = RequestMethod.PUT)
	public String EditProjectFeed(P_FeedVo feed) {
		String returnURL = "false";

		int result = service.EditProjectFeed(feed);
		if (result > 0) {
			returnURL = "true";
		}

		return returnURL;
	}

	// ???????????? ?????? ????????????
	@RequestMapping(value = "projectfeed", method = RequestMethod.DELETE)
	public String DeleteProjectFeed(P_FeedVo feed) {
		String returnURL = "false";

		int result = service.DeleteProjectFeed(feed);
		if (result > 0) {
			returnURL = "true";
		}

		return returnURL;
	}

}