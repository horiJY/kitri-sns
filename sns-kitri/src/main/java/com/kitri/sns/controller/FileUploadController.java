package com.kitri.sns.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.kitri.sns.post.service.PostImgService;
import com.kitri.sns.post.vo.PostImgVO;

@Controller
@RequestMapping("/header")
public class FileUploadController {

	@Autowired
	private PostImgService postService;

	@RequestMapping("")
	public String main(Model model, Map<String, String> map) {

		return "header";

	}

//1.파일 개수 이름 확인
//	2. 파일 경로 확인(없으면 생성) > 2개이상 시 file List를 다 돌아야지 전체경로를 가져올 수 있음
//	3. db insert 전 feed id 가져와서 폴더 생성 > insert 전에 id값을 가져올 수 없음.
//	4. 파일 업로드, 

	@ResponseBody
	@RequestMapping(value = "/fileupload", method = RequestMethod.POST)
	public String upload(MultipartHttpServletRequest multiPart, String content, HttpServletRequest req, PostImgVO pvo,
			Map<String, String> map, HttpSession session) {
		List<MultipartFile> fileList = multiPart.getFiles("uploadfile");
		String imgUploadFiles = "";
		int cnt = 0;
		for (MultipartFile mf : fileList) { // file 경로 가져오기
			if ((cnt++) != 0)
				imgUploadFiles += ",";
			imgUploadFiles += System.currentTimeMillis() + "_" + mf.getOriginalFilename(); // DB에 들어갈 파일 경로들
		}
//		map.put("loginid", session.getAttribute("id").toString());
		map.put("loginid", "luxy");
		map.put("uploadfilepaths", imgUploadFiles);
		map.put("content", content);
		String feedid = postService.registPostImg(map);
		System.out.println(feedid);
		if (!feedid.equals("업로드실패")) {

			File checkDirectory = new File("../Documents/kitri-sns/sns-kitri/src/main/webapp/image/members/"
					+ map.get("loginid") + "/" + feedid);
			String uploadPath = checkDirectory.getAbsolutePath(); // 서버 실제 폴더받아온 피드 번호 추가(업로드 디렉터리)
			if (!checkDirectory.exists()) {
				checkDirectory.mkdirs();

				for (MultipartFile mf : fileList) {
					String originalFileName = mf.getOriginalFilename(); // 원본 파일명
					File saveFile = new File(uploadPath, System.currentTimeMillis() + "_" + originalFileName);
					try {

						mf.transferTo(saveFile);
					} catch (IllegalStateException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					} catch (IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}

				}
			}
		}
		return "redirect:${path}/";
	}
}
