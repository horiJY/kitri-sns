package com.kitri.sns.feed.service;

import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.kitri.sns.feed.dao.FeedDAO;

@Service
public class FeedServiceImpl implements FeedService {
  @Autowired
  private FeedDAO feedDao;

  @Override
  public int checkFollowing(Map<String, String> map) {
    return feedDao.getFollowingNum(map);
  }

  @Override
  public List getFollowFeeds(Map<String, String> map) {
    return feedDao.getFollowFeeds(map);
  }

  @Override
  public List moreFollowFeeds(Map<String, String> map) {
    return feedDao.getMoreFeeds(map);
  }

  @Override
  public List getRandomFeeds(Map<String, String> map) {
    return feedDao.getRandomFeeds(map);
  }

  @Override
  public int putFeedLike(Map<String, String> map) {
    return feedDao.updateFeedLike(map);
  }

	@Override
	public List getMemberFeeds(Map<String, String> map) {
		return feedDao.getMemberFeeds(map);
	}
}
