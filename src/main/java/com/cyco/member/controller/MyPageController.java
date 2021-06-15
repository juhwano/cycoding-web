package com.cyco.member.controller;


import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.cyco.member.service.MemberDetailService;
import com.cyco.utils.UtilFile;


@RequestMapping("mypage/")
@Controller
public class MyPageController {
	
	MemberDetailService memberdetailservice;
	
	@Autowired
	public void setMemberDetailService(MemberDetailService memberdetailservice) {
		this.memberdetailservice = memberdetailservice;
	}
	
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
		
		System.out.println("경험 있는지? " + memberdetailservice.getExperiences(useremail).size());
		
		//프로젝트 경험 없는 경우
		//빈 배열은 null이 아니라 []로 리턴되므로 배열 길이로 비교해야 한다
		if(memberdetailservice.getExperiences(useremail).size() == 0) {
			
			//입력 자체를 안 한건지, 프로젝트 경험 없을이라고 입력한건지 확인해야 한다
			System.out.println("프로젝트 경험 테이블에 데이터 없음");
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


		System.out.println("경험 : " + mmp.get("experiences"));
		
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
		
		/*
		 * ModelMap mmp = new ModelMap(); mmp.addAttribute("result", result);
		 * mmp.addAttribute("icon", icon); mmp.addAttribute("url", "main.cy");
		 */
		
		System.out.println("업로드 후 리다이렉트");
		//System.out.println(mmp.toString());
		
		//return new ModelAndView("Redirect/Redirect", mmp);
		//return "Redirect/Redirect";
		
		res.sendRedirect("mypage");
	}

}
