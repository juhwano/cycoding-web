package com.cyco.member.vo;

import lombok.Data;

@Data
public class MemberVo {
	private int m_id;
	private String m_nick;
	private String m_image;
	private String position;
	private String skill;
	private String p_enable;
	private String s_enable;
	
	//페이징처리용 rownum
	private int rownum;
}
