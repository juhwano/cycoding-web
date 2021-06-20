package com.cyco.alarm.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class AlarmVo {
	
	private String ALARM_ID;
	private String MEMBER_ID;
	private String ALARM_CODE;
	private Date ALARM_DATE;
	private String ALARM_OK;
	private String URL;
	
}
