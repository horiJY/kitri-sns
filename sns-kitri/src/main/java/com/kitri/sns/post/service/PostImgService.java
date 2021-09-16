package com.kitri.sns.post.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kitri.sns.post.dao.PostImgDAO;
import com.kitri.sns.post.vo.PostImgVO;

@Service
public class PostImgService {

	@Autowired
	private PostImgDAO postDao;
	

	public String registPostImg(Map<String,String> map) {
		if(postDao.insertPostImg(map) != 0)
			return postDao.selectPostId(map);
		
		return "업로드실패";
	}
}
