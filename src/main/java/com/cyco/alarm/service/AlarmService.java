package com.cyco.alarm.service;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cyco.alarm.dao.AlarmDao;
import com.cyco.common.vo.AlarmVo;

@Service
public class AlarmService {
	
	private SqlSession sqlsession;
	
	@Autowired
	public void setSqlsession(SqlSession sqlsession) {
		this.sqlsession = sqlsession;
	}
	
	//알림이 일어나면 테이블에 인서트
	public boolean insertAlarm(AlarmVo alarm) {
		
		Boolean bo = false;
		
		AlarmDao alarmdao = sqlsession.getMapper(AlarmDao.class);
		
		int row = alarmdao.insertAlarm(alarm);
		
		if(row > 0) {
			bo = true;
		}
		
		return bo;
		
	}

}
