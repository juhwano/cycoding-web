package com.cyco.main.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller

public class MainController {
	@RequestMapping(value="/main")
	public String login() {
		System.out.println("this is main");
		
		return "Main/CycoMain";
	
	}
	
	
}
