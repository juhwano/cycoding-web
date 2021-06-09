package com.cyco.project.vo;

import lombok.Data;

@Data
public class V_PjAdrField_Join_V_PDetail { 
	//p.project_id, p.member_id, p.adr_name, p.field_name,vpd.p_title, vpd.p_image, vpd.duration_date, vpd.p_content, vpd.p_state, vpd.p_views, vpd.p_date
	private String project_id;
	private String member_id;
	private String adr_name;
	private String field_name;
	private String p_title;
	private String p_image;
	private String duration_date;
	private String p_content;
	private String p_state;
	private String p_views;
	private String p_date;
	
}
