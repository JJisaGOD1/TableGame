package com.tablegame.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomePageController {
	
	@GetMapping("/")
	public String choose() {
		return "homepage";
	}
	
	@GetMapping("/backController")
	public String back() {
		return "index";
	}
	
	
}
