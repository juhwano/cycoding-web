package com.cyco.admin.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.cyco.admin.service.AdminService;
import com.cyco.common.vo.SkillVo;

@RequestMapping("/ajaxadmin")
@RestController
public class AdminRestController {
	
	@Autowired
	private AdminService service;
	
	@RequestMapping(value="/skill", method=RequestMethod.GET)
	public String getSkillNameCheck(@RequestParam("name") String name) {
		int result = service.getSkillNameCheck(name);
		if(result>0) {
			System.out.println("중복발생");
			return "true";
		}
		else {
			System.out.println("중복값 없음");
			return "false";
		}
	}
	@RequestMapping(value="/skill", method=RequestMethod.POST)
	public Map<String, String> getSkillUpdate(@RequestBody Map<String, List<SkillVo>> data) {
		
		System.out.println(data);
		Map<String, String> map= service.updateSkillList(data);
		
		return map;
	}

}
