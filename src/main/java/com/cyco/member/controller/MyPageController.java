package com.cyco.member.controller;


import java.io.IOException;
import java.io.PrintWriter;

import java.util.HashMap;
import java.util.List;
import java.util.Map;



import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;


import com.cyco.alarm.service.AlarmService;
import com.cyco.alarm.vo.AlarmVo;

import com.cyco.common.vo.Apply_Join_P_datailVo;
import com.cyco.common.vo.BookMark_Join_P_detailVo;

import com.cyco.common.vo.MemberVo;
import com.cyco.member.service.MemberDetailService;
import com.cyco.utils.UtilFile;


@RequestMapping("mypage/")
@Controller
public class MyPageController {
	
	MemberDetailService memberdetailservice;
	AlarmService alarmservice;
	
	@Autowired
	public void setMemberDetailService(MemberDetailService memberdetailservice, AlarmService alarmservice) {
		this.memberdetailservice = memberdetailservice;
		this.alarmservice = alarmservice;
	}
	
	//마이페이지 진입시 비밀번호 체크 페이지
	@RequestMapping(value="mypageCheck")
	public String MypageCheck() {
		return "/Member/MypageCheck";
	}
	
	/*
	@RequestMapping(value = "mypageCheck", method = RequestMethod.POST)
    public void MypageCheck(String useremail, String userPwd, Model model, HttpServletResponse response) {
		System.out.println("컨트롤러 오니..?");
		System.out.println("useremail " + useremail);
		System.out.println("userPwd " + userPwd);
		
		if(memberdetailservice.checkPwd(useremail, userPwd)) {
			try {
				response.sendRedirect("mypage?useremail="+useremail);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out;
			try {
				out = response.getWriter();
				out.println("<script>alert('비밀번호를 잘못 입력하셨습니다.'); history.go(-1);</script>");
				out.flush();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
	}
	*/
	
	//마이페이지 정보 불러오기
	@RequestMapping(value="mypage")
	//public ModelAndView getMyDetail(@RequestParam("useremail") String useremail, HttpSession session){
	public ModelAndView getMyDetail(Authentication auth){
		
		String useremail = auth.getName();

		System.out.println("클라이언트에서 로그인 한 이메일 : " + useremail);
		
		ModelMap mmp = new ModelMap();
		
		mmp.addAttribute("aboutmember", memberdetailservice.getMyDetail(useremail));
		mmp.addAttribute("skills",memberdetailservice.getPreferSkills(useremail));
		mmp.addAttribute("position",memberdetailservice.getPreferPosition(useremail));
		mmp.addAttribute("durations",memberdetailservice.getPreferDurations(useremail));
	
		//프로젝트 경험 없는 경우
		//빈 배열은 null이 아니라 []로 리턴되므로 배열 길이로 비교해야 한다
		if(memberdetailservice.getExperiences(useremail).size() == 0) {
			
			//입력 자체를 안 한건지, 프로젝트 경험 없을이라고 입력한건지 확인해야 한다
			String result = memberdetailservice.haveExperience(useremail);
			System.out.println(result);
			
			if(result==null) {
			
				//경험 아예 체크 안 한 경우 mmp에 experiences를 비워서 보낸다
				
			}else if(result.equals("0")) {
				//경험 없음이라고 체크한 경우
				mmp.addAttribute("experiences", "none");
			} 		
			
		} else {
			
			mmp.addAttribute("experiences", memberdetailservice.getExperiences(useremail));
			
		}
		
		return new ModelAndView("/Member/Mypage",mmp) ;
	}
	
	//회원 프로필 이미지 바꾸기
	@RequestMapping(value="editprofile",method = {RequestMethod.POST,RequestMethod.GET})
	public void changeProfile(@RequestParam(value="id",required=false)String id, @RequestParam(value="uploadFile",required=false) MultipartFile uploadFile,
			MultipartHttpServletRequest request, HttpServletResponse res) throws IOException {
	//public String changeProfile(String id, MultipartFile uploadFile, MultipartHttpServletRequest request) {	
		System.out.println("프로필 이미지 변경 changeProfile");
		
		// 파일 유틸 생성
		UtilFile utilFile = new UtilFile();
		
		// 받아오는 파일 받아오기
		String UploadFile = utilFile.FileUpload(request, uploadFile);
		String UploadFilename = utilFile.getFilename();
			
		
		int row = memberdetailservice.editProfile(id, UploadFilename);
		String result = "fail";
		//String icon = "error";
		
		if(row > 0) {
			result = "success";
			//icon ="success";
			
		}
		
		System.out.println("업로드 후 리다이렉트");
		
		res.sendRedirect("mypage");
	}
	
	//충전 페이지 이동
	@RequestMapping(value="charge",method=RequestMethod.GET)
	public ModelAndView goToCharge(HttpSession session) {
		
		ModelMap mmp = new ModelMap();
		mmp.addAttribute("member_id",session.getAttribute("member_id"));
		
		return new ModelAndView("/Member/Charge",mmp);
		
	}
	

	@RequestMapping(value="myalarm",method=RequestMethod.GET)
	public ModelAndView myAlarm(Authentication auth) {
		
		String useremail = auth.getName();
		ModelMap mmp = new ModelMap();
		
		List<AlarmVo> list = alarmservice.getAllAlarms(useremail);	
		mmp.addAttribute("alarmlist", list);

		return new ModelAndView("/Member/MyAlarm",mmp);
}
	//북마크 페이지 이동
	@RequestMapping(value="wishProject")
	public String wishProject(Model m, HttpSession session) {
		
		//북마크리스트 불러오기
		List<BookMark_Join_P_detailVo> bookmark_list = null;
		bookmark_list = memberdetailservice.getBookmarkList(String.valueOf(session.getAttribute("member_id")));
		
		m.addAttribute("bookmark_list",bookmark_list);
		
		//지원목록리스트 불러오기
		List<Apply_Join_P_datailVo> apply_list = null;
		apply_list = memberdetailservice.getApplyList(String.valueOf(session.getAttribute("member_id")));
		m.addAttribute("apply_list",apply_list);
		System.out.println("apply_list: " + apply_list);
		return "/Member/wishProject";

	}

}
