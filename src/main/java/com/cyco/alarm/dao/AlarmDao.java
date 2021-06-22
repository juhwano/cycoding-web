package com.cyco.alarm.dao;

import java.util.List;

import com.cyco.alarm.vo.AlarmVo;

public interface AlarmDao {
	
	//모든 알림 이벤트가 일어나면 알림 게시판에 인서트가 일어난다
	public Integer insertAlarm(AlarmVo alarm);
	
	//알림 헤더 메뉴에서 보여줄 것들
	public List<AlarmVo> getNewAlarms(String memberid);

	//알림페이지에서 전체 알림
	public List<AlarmVo> getAllAlarms(String useremail);
	
	//알림 확인하면 상태 변경
	public Integer checkAlarm(String alarm_id);
	
	//알림 삭제
	public Integer deleteAlarm(String alarm_id);

}
