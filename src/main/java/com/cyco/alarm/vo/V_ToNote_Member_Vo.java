package com.cyco.alarm.vo;


import java.util.Date;

import lombok.Data;

@Data
public class V_ToNote_Member_Vo {
	
	private String NOTE_ID;
	private String MEMBER_FROM;
	private String MEMBER_TO;
	private String MEMBER_NICKNAME; //내가 받은 쪽지를 보낸 사람의 닉네임
	private String NOTE_CONTENT;
	private Date NOTE_DATE;
	private String NOTE_OK;
}
