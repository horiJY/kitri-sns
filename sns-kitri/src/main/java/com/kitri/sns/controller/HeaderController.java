package com.kitri.sns.controller;

import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.kitri.sns.header.service.SearchUserService;

@Controller
public class HeaderController {
	@Autowired
	private SearchUserService searchUserService;
	
	@RequestMapping(value="/searchuser",method = RequestMethod.GET, produces="text/plain;charset=UTF-8")
	@ResponseBody
	public String searchlist(Locale locale, Model model){
		Gson gson = new Gson();
		return gson.toJson(searchUserService.searchUserList());
	}
}
