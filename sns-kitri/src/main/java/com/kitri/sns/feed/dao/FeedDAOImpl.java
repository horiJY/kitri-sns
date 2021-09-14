package com.kitri.sns.feed.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kitri.sns.feed.vo.FeedVO;

@Repository
public class FeedDAOImpl implements FeedDAO {
	@Autowired
	private SqlSession sqlSession;
	
	
  @Override
  public int getFollowingNum(Map<String,String> map) {
    return sqlSession.selectOne("feed.selectFollowingNum",map);
  }

  @Override
  public List<FeedVO> getFollowFeeds(Map<String,String> map) {
	  return sqlSession.selectList("feed.selectFollowingFeeds",map);
  }

  @Override
  public List<FeedVO> getRandomFeeds(Map<String,String> map) {
	  return sqlSession.selectList("feed.selectRandomFeeds",map);
  }

  @Override
  public List<FeedVO> getMoreFeeds(Map<String,String> map) {
	  return sqlSession.selectList("feed.selectFollowingMoreFeeds",map);
  }

}
