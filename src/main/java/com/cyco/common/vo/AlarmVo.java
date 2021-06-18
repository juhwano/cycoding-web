package com.cyco.common.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class AlarmVo {
	
	private int alarm_id;
	private int member_id;
	private String alarm_code;
	private Date alarm_date;
	private String alarm_ok;
	private int url;
	
}
