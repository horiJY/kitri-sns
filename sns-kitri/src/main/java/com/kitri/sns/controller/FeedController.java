package com.kitri.sns.controller;

import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class FeedController {

//	@RequestMapping("")
//	public String feedboard(Model model, Map<String,String> map) {
//
//		return "feedboard";
//	}
	
	@GetMapping("")
	public String feedboard() {
			
		return "feedboard";
	}
}
