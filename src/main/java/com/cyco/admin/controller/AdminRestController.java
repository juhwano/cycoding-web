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
	
	//사이트 관리
	@RequestMapping(value="/site", method=RequestMethod.POST)
	public Map<String, String> getSkillUpdate(@RequestBody Map<String, Object> data) {
		//
		Map<String, String> map= service.updateSiteList(data);
		
		return map;
	}

}
