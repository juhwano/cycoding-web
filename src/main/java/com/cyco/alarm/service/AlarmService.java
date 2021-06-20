package com.cyco.alarm.service;

import java.util.HashMap;

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

		alarm.setALARM_CODE(data.get("code"));
        alarm.setMEMBER_ID(data.get("receiver"));
        alarm.setURL(data.get("url"));
		int row = alarmdao.insertAlarm(alarm);
		
		if(row > 0) {
			bo = true;
		}
		
		return bo;
		
	}

}
