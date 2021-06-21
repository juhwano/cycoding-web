package com.cyco.alarm.controller;


import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.cyco.alarm.service.AlarmService;
import com.cyco.alarm.vo.AlarmVo;
import com.cyco.member.service.MemberService;

@RestController
@RequestMapping(value="/alarm/")
public class AlarmRestController {
	
	@Autowired
	AlarmService alarmservice;
	
	@Autowired
	MemberService memberservice;
	
	//페이지 이동할 때마다 알림 종모양 체크해서 유지하기
	@RequestMapping(value="checkbell", method= RequestMethod.POST)
	public Boolean checkbell(String id) {
		System.out.println(id);
		Boolean bo = false;
		int row = memberservice.getOldAlarm(id);
		if(row > 0) {
			bo = true;
		}
		return bo;
		
	}
	
	//알림 오면/페이지 이동시 리스트 업데이트
	@RequestMapping(value="updatealarmlist", method= {RequestMethod.GET, RequestMethod.POST})
	public List<AlarmVo> updateAlarm(String id) {
		
		List<AlarmVo> list = alarmservice.getNewAlarms(id);
	
		return list;
	}
	
	//알림 발생시 디비에 반영하기
	@RequestMapping(value="insertalarm", method= {RequestMethod.GET, RequestMethod.POST})
	public Boolean insertAlarm(@RequestBody HashMap<String, String> data) {

		System.out.println("data : " + data.toString());
		
		Boolean bo = alarmservice.insertAlarm(data);
		
		System.out.println(bo);
		
		return bo;
	}
	
	//알림 확인한 것 디비에 상태 반영
	@RequestMapping(value="checkalarm", method= {RequestMethod.GET, RequestMethod.POST})
	public Boolean chekcAlarm(String alarm_id) {
		System.out.println("상태 변경 :"+alarm_id);
		Boolean bo = false;
		int row = alarmservice.checkAlarm(alarm_id);
		
		if(row > 0) {
			bo = true;
		}
		
		return bo;
	}
	
	//알림 삭제 디비 반영
	@RequestMapping(value="deletealarm", method= {RequestMethod.GET, RequestMethod.POST})
	public Boolean deleteAlarm(String alarm_id) {
		System.out.println("삭제 : " + alarm_id);
		Boolean bo = false;
		int row = alarmservice.deleteAlarm(alarm_id);
		
		if(row > 0) {
			bo = true;
		}
		
		return bo;
	}
	
	
}
