package com.cyco.member.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.cyco.common.vo.PositionVo;
import com.cyco.member.service.MemberDetailService;
import com.cyco.member.service.MemberService;
import com.cyco.member.vo.ReviewVo;
import com.cyco.member.vo.V_MlistVo;

import net.sf.json.JSONArray;

@Controller
@RequestMapping("member")
public class MemberController {
	MemberService memberservice;
	MemberDetailService memberdetailservice;
	
	@Autowired
	public void setMemberService(MemberService memberservice, MemberDetailService memberdetailservice) {
		this.memberservice = memberservice;
		this.memberdetailservice = memberdetailservice;
	}
	
	@RequestMapping("list")
	public String memberList(Model m) {
		//기본회원목록넘기기
		List<V_MlistVo> memberList = memberservice.memberList();
		//포지션목록 넘기기
		List<PositionVo> positionList = memberservice.positionList();
		
		System.out.println("기본회원리스트 controller");
		System.out.println("memberlist"+memberList);
		
		m.addAttribute("memberList", memberList);
		m.addAttribute("positionList", positionList);
		
		return "Member/MemberList"; 
	}
	
	//임시 에러페이지 경로설정
	@RequestMapping("error")
	public String errorPage(Model m) {
		
		return "Main/ErrorPage"; 
	}
	
	//회원 상세 정보 불러오기
		@RequestMapping(value="memberdetailpage")
		public ModelAndView getMemberDetail(@RequestParam("memberid") String memberid){
			
			String useremail = memberdetailservice.getMemberDetail(memberid).getMEMBER_EMAIL();
			
			ModelMap mmp = new ModelMap();
			
			mmp.addAttribute("aboutmember",memberdetailservice.getMemberDetail(memberid));
			
			//리뷰목록
			List<ReviewVo> row_reviewList = memberdetailservice.getReviewList(memberid);
			
			System.out.println("리뷰목록: " + memberdetailservice.getReviewList(memberid));
			
			JSONArray reviewList = JSONArray.fromObject(row_reviewList);
			System.out.println("리뷰목록JSON: " + reviewList);
			mmp.addAttribute("reviewList", reviewList);
			
			mmp.addAttribute("skills",memberdetailservice.getPreferSkills(useremail));
			mmp.addAttribute("position",memberdetailservice.getPreferPosition(useremail));
			mmp.addAttribute("durations",memberdetailservice.getPreferDurations(useremail));
			
			return new ModelAndView("/Member/MemberDetail",mmp);
		}
}
