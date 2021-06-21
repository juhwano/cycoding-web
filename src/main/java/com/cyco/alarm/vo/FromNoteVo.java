package com.cyco.alarm.vo;


import java.util.Date;

import lombok.Data;

@Data
public class FromNoteVo {
	
	private String NOTE_ID;
	private String MEMBER_FROM;
	private String MEMBER_TO;
	private String NOTE_CONTENT;
	private Date NOTE_DATE;
}
