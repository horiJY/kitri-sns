package com.kitri.sns.feed.dao;

import java.util.List;
import java.util.Map;
import com.kitri.sns.feed.vo.FeedVO;

public interface FeedDAO {

  public int getFollowingNum(Map<String, String> map);

  public List<FeedVO> getFollowFeeds(Map<String, String> map);

  public List<FeedVO> getRandomFeeds(Map<String, String> map);

  public List<FeedVO> getMoreFeeds(Map<String, String> map);

  public int updateFeedLike(Map<String, String> map);
  
  public List<FeedVO> getMemberFeeds(Map<String, String>map);
}
