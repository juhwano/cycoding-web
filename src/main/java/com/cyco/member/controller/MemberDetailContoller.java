package com.cyco.member.controller;


import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.cyco.common.vo.MemberVo;
import com.cyco.member.service.MemberDetailService;
import com.cyco.utils.UtilFile;


@RequestMapping("memberdetail/")
@Controller
public class MemberDetailContoller {
	
	MemberDetailService memberdetailservice;
	
	@Autowired
	public void setMemberDetailService(MemberDetailService memberdetailservice) {
		this.memberdetailservice = memberdetailservice;
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
	public ModelAndView getMyDetail(@RequestParam("useremail") String useremail){
		
		
		System.out.println("클라이언트에서 로그인 한 이메일 : " + useremail);
		
		ModelMap mmp = new ModelMap();
		
		mmp.addAttribute("aboutmember", memberdetailservice.getMyDetail(useremail));
		mmp.addAttribute("skills",memberdetailservice.getPreferSkills(useremail));
		mmp.addAttribute("position",memberdetailservice.getPreferPosition(useremail));
		mmp.addAttribute("durations",memberdetailservice.getPreferDurations(useremail));
		System.out.println(memberdetailservice.getMyDetail(useremail));
		System.out.println(memberdetailservice.getPreferSkills(useremail));
		System.out.println(memberdetailservice.getPreferDurations(useremail));
		
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
		String icon = "error";
		if(row > 0) {
			result = "success";
			icon ="success";
		}
		
		/*
		 * ModelMap mmp = new ModelMap(); mmp.addAttribute("result", result);
		 * mmp.addAttribute("icon", icon); mmp.addAttribute("url", "main.cy");
		 */
		
		System.out.println("업로드 후 리다이렉트");
		//System.out.println(mmp.toString());
		
		//return new ModelAndView("Redirect/Redirect", mmp);
		//return "Redirect/Redirect";
		
		res.sendRedirect("mypage?useremail="+id);
	}

}
