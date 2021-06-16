package com.cyco.member.vo;

import java.util.Date;

import lombok.Data;

@Data
public class ReviewVo {

	private int review_id;
	private String review_content;
	private Date review_date;
	private int review_grade;
	private int writer_id;
	private int review_member;
	private int project_id;
	
	private String member_nickname;
}
