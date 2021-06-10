package com.cyco.common.vo;

import lombok.Data;

@Data
public class SkillVo {
	//select * from skill;
	private String skill_code;
	private String skill_name;
	private String skill_enabled;

}