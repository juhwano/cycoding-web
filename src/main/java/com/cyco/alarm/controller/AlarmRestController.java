package com.cyco.alarm.controller;


import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.cyco.alarm.service.AlarmService;

@RestController
@RequestMapping(value="/alram/")
public class AlarmRestController {
	
	@Autowired
	AlarmService alarmservice;
	
	//회원 프로젝트에 초대하기
	@RequestMapping(value="inviteproject", method= {RequestMethod.GET, RequestMethod.POST})
	public Boolean inviteMember(@RequestBody HashMap<String, String> data) {

		System.out.println(data.toString());
		
		Boolean bo = alarmservice.insertAlarm(data);
		
		return bo;
	}
	
	//
	
	
	
	
}
