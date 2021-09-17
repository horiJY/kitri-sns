package com.kitri.sns.post.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kitri.sns.post.vo.PostImgVO;

@Repository
public class PostImgDAO{

	@Autowired
	private SqlSession sqlSession;

	public int insertPostImg(Map<String,String> map) {
		return sqlSession.insert("postupload.insertPost",map);
	}

	public String selectPostId(Map<String,String> map) {
		return sqlSession.selectOne("postupload.selectPostId",map);
	}
	
	public int memberFeedsCnt(String id) {
		return sqlSession.selectOne("postupload.selectFeedCnt", id);
	}
}
