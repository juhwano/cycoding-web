package com.cyco.alarm.dao;

import com.cyco.alarm.vo.AlarmVo;

public interface AlarmDao {
	
	//모든 알림 이벤트가 일어나면 알림 게시판에 인서트가 일어난다
	public Integer insertAlarm(AlarmVo alarm);

}
