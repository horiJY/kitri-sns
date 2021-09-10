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
		//session.id 없으면 login페이지로 이동
		
		//로그인 후 피드 가져오기
		return "feedboard";
	}
}
