package com.kitri.sns.feed.dao;

import java.util.List;
import java.util.Map;
import com.kitri.sns.feed.vo.FeedVO;
import com.kitri.sns.feed.vo.ReplyVO;

public interface FeedDAO {

  public int selectFollowingNum(Map<String, String> map);

  public List<FeedVO> selectFollowFeeds(Map<String, String> map);

  public List<FeedVO> selectRandomFeeds(Map<String, String> map);

  public List<FeedVO> selectMoreFeeds(Map<String, String> map);

  public int updateFeedLike(Map<String, String> map);

  public List<FeedVO> selectMemberFeeds(Map<String, String> map);

  public List<ReplyVO> selectFeedReplys(int feedId);

  public List<FeedVO> selectMemberDetailFeeds(Map<String, String> map);
}
