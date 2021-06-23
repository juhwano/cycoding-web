package com.cyco.alarm.vo;
import lombok.Data;

@Data
public class V_FromNote_Member_Vo {
	
	private String NOTE_ID;
	private String MEMBER_FROM;
	private String MEMBER_TO;
	private String MEMBER_NICKNAME; //내가 보낸 쪽지를 받는 사람의 닉네임
	private String NOTE_CONTENT;
	private String NOTE_DATE;
}
