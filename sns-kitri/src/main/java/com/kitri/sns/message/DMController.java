package com.kitri.sns.message;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kitri.sns.message.service.MessageService;
import com.kitri.sns.message.vo.MessageVO;


@Controller
@RequestMapping("/message")
public class DMController {
	@Autowired
	private MessageService msgService;
	
//	String id = "bn_sj2013";
	
	//dmboard
	@RequestMapping("/list")
//	public String DMList(Model model, String id) {
	public String DMList() {		
		
		//접속중인 아이디 받아서 list 넘겨주기
//		List<MessageVO> dmList = msgService.getMessageList(id);
//		model.addAttribute("dmList", dmList);
		return "dmboard";
	}
	
}

