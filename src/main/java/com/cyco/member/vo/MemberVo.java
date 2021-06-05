package com.cyco.member.vo;

import lombok.Data;

@Data
public class MemberVo {
	
	private int MEMBER_ID;
	private String MEMBER_EMAIL;
	private String MEMBER_PWD;
	private String MEMBER_NAME;
	private String MEMBER_NICKNAME;
	private String MEMBER_PHONE;
	private String MEMBER_IMAGE;
	private Boolean ENABLED;
	

}
