package com.kitri.sns.controller;

import java.io.File;
import java.io.IOException;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;


import com.kitri.sns.post.service.PostImgService;
import com.kitri.sns.post.service.PostImgService;
import com.kitri.sns.post.vo.PostImgVO;

@Controller
public class FeedController {

//	@Autowired
//	private PostImgService postService;
	
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

//	@RequestMapping("/header")
//	public String header() {
//		
//		return  "header";
//	}


//	@RequestMapping(value = "/fileupload", method = RequestMethod.POST)
//	public String upload(MultipartFile uploadfile, HttpServletRequest req) {
//		String uploadPath = req.getRealPath("uploadfolder"); // 서버 실제 경로
//		System.out.println(uploadPath);
//		String saveName = uploadfile.getOriginalFilename();
//		File saveFile = new File(uploadPath, saveName); // 저장할 폴더 이름, 저장할 파일 이름
//		try {
//			uploadfile.transferTo(saveFile);
//		} catch (IOException e) {
//			e.printStackTrace();
//		}
//		
//		PostImgVO pvo = new PostImgVO();
//		
//		
//		
//		postService.registImgBoard(pvo);
//		
//		
//		return "header";
//	}
//	@RequestMapping("/fileupload")
//	public String fileupload(MultipartFile uploadfile, 
//										String content, 
//										HttpServletRequest req, 
//										HttpSession session ) {
//		
//		String id = (String)session.getAttribute("id");
//		String uploadPath = req.getRealPath("uploadfolder");
//		String saveName = uploadfile.getOriginalFilename();
//		String uploadUniquePath = uploadPath+File.separator+id;
//								//c:..../uploadfolder/admin
//		boolean uploadConfirm = false;
//		boolean registFlag = false;
//		
//		String path;
//		
//		try {
//			File idFile = new File(uploadUniquePath);
//			System.out.println("idFile : "+ idFile.exists());
//			if(!idFile.exists()) {
//				idFile.mkdir();
//			}
//			File saveFile = new File(idFile, saveName );
//			//             ploadfolder/id+"/"+saveName
//			uploadfile.transferTo(saveFile);
//			uploadConfirm = true;
//		} catch (IllegalStateException e) {
//			e.printStackTrace();
//			uploadConfirm = false;
//		} catch (IOException e) {
//			e.printStackTrace();
//			uploadConfirm= false;
//		}
//		
//		if(uploadConfirm) {
//			PostImgVO pvo = new PostImgVO();
//			pvo.setFeed_id(0);
//			
//			
//			String insertImgPath = File.separator+"upload"+File.separator // /upload/
//									+id 			// admin
//									+File.separator //  
//									+saveName;      //  a.jpg
//									// /upload/admin/a.jpg
//			pvo.setImage_url(insertImgPath);			
//		    registFlag = postService.registImgBoard(pvo);
//			
//		}
//		
//		if(registFlag) {
//			path = "redirect:/main";
//		} else {
//			path = "redirect:/imgboard-regist-page";
//		}
//		
//		return path;
//		
//	}
	
}
