package com.kitri.sns.controller;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kitri.sns.login.service.MemberService;
import com.kitri.sns.login.vo.MemberVO;


@Controller
@RequestMapping("/login")
public class LoginController {
	
	@Autowired
	private MemberService memberService;

	@RequestMapping("")
	public String login() {
		return "login";
	}
	
	@RequestMapping("/logincheck")
	@ResponseBody
	public boolean logincheck(MemberVO mvo, HttpSession session) {
		boolean loginFlag = memberService.loginCheckMember(mvo);
		
		if(loginFlag) {
			session.setAttribute("id", mvo.getId());
		}		
		return loginFlag;
	}
	
	@RequestMapping("idcheck")
	@ResponseBody
	public boolean idCheck(String id) {
		//id가 있는지 조회
		boolean idCheckFlag = memberService.idCheck(id);
		
		//id 존재 : 결과값 false, id 사용가능 : 결과값 true
		return idCheckFlag;
	}
	
	@RequestMapping("/signup-regist")
	public String signupRegist(MemberVO mvo) {
		
		memberService.registMember(mvo);
		
		return "redirect:/login";
	}
	
}

