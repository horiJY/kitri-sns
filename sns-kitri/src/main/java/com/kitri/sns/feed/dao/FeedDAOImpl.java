package com.kitri.sns.feed.dao;

import java.util.List;
import java.util.Map;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.kitri.sns.feed.vo.FeedVO;
import com.kitri.sns.feed.vo.ReplyVO;

@Repository
public class FeedDAOImpl implements FeedDAO {
  @Autowired
  private SqlSession sqlSession;

  @Override
  public int selectFollowingNum(Map<String, String> map) {
    return sqlSession.selectOne("feed.selectFollowingNum", map);
  }

  @Override
  public List<FeedVO> selectFollowFeeds(Map<String, String> map) {
    return sqlSession.selectList("feed.selectFollowingFeeds", map);
  }

  @Override
  public List<FeedVO> selectRandomFeeds(Map<String, String> map) {
    return sqlSession.selectList("feed.selectRandomFeeds", map);
  }

  @Override
  public List<FeedVO> selectMoreFeeds(Map<String, String> map) {
    return sqlSession.selectList("feed.selectFollowingMoreFeeds", map);
  }

  @Override
  public int updateFeedLike(Map<String, String> map) {
    int check = sqlSession.update("feed.updateFeedLike", map);
    return sqlSession.selectOne("feed.selectFeedLikes", map);
  }

  @Override
  public List<FeedVO> selectMemberFeeds(Map<String, String> map) {
    return sqlSession.selectList("feed.selectMemberFeeds", map);
  }

  @Override
  public List<ReplyVO> selectFeedReplys(int feedId) {
    return sqlSession.selectList("feed.selectFeedReplys", feedId);
  }

  @Override
  public List<FeedVO> selectMemberDetailFeeds(Map<String, String> map) {
    return sqlSession.selectList("feed.selectMemberDetailFeeds", map);
  }
}
