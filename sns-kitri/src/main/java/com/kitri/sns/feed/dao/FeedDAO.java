package com.kitri.sns.feed.dao;

import com.kitri.sns.feed.vo.FeedVO;

public interface FeedDAO {

  public int selectFollowingNum();

  public FeedVO selectFollowFeeds();

  public FeedVO selectRandomFeeds();

  public FeedVO selectMoreFeeds();

}
