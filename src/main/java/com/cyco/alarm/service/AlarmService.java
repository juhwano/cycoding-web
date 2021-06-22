package com.cyco.alarm.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


import com.cyco.alarm.dao.AlarmDao;
import com.cyco.alarm.vo.AlarmVo;

@Repository
public class AlarmService {
	
	private SqlSession sqlsession;
	
	
	@Autowired
	public void setSqlsession(SqlSession sqlsession) {
		this.sqlsession = sqlsession;
	}
	
	//알림이 일어나면 테이블에 인서트
	public boolean insertAlarm(HashMap<String, String> data) {
		
		Boolean bo = false;
		
		AlarmDao alarmdao = sqlsession.getMapper(AlarmDao.class);
		AlarmVo alarm = new AlarmVo();
		
		alarm.setALARM_CONTENT(data.get("content"));
		alarm.setALARM_CODE(data.get("code"));
        alarm.setMEMBER_ID(data.get("member_id"));
        alarm.setURL(data.get("url"));
		int row = alarmdao.insertAlarm(alarm);
		
		if(row > 0) {
			bo = true;
		}	
		return bo;
		
	}
	
	//헤더 알림 메뉴에 최신 알림만 뿌려주기
	public List<AlarmVo> getNewAlarms(String memberid){
		
		AlarmDao alarmdao = sqlsession.getMapper(AlarmDao.class);
		List<AlarmVo> alarms = alarmdao.getNewAlarms(memberid);	
		
		return alarms;
	}
	
	//알림페이지 초기 진입시 전체 알림 뿌려주기
	public List<AlarmVo> getAllAlarms(String useremail){
		
		AlarmDao alarmdao = sqlsession.getMapper(AlarmDao.class);
		List<AlarmVo> alarms = alarmdao.getAllAlarms(useremail);	
		
		return alarms;
	}
	
	//알림 확인시 상태 업데이트
	public Integer checkAlarm(String alarm_id) {
		
		AlarmDao alarmdao = sqlsession.getMapper(AlarmDao.class);
		int row = alarmdao.checkAlarm(alarm_id);
		
		return row;
		
	}
	
	//알림 삭제
	public Integer deleteAlarm(String alarm_id) {
		
		AlarmDao alarmdao = sqlsession.getMapper(AlarmDao.class);
		int row = alarmdao.deleteAlarm(alarm_id);
		
		return row;
		
	}

}
