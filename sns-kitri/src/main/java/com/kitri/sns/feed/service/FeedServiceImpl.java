package com.kitri.sns.feed.service;

import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.kitri.sns.feed.dao.FeedDAO;
import com.kitri.sns.feed.vo.FeedVO;

@Service
public class FeedServiceImpl implements FeedService {
  @Autowired
  private FeedDAO feedDao;

  @Override
  public int checkFollowing(Map<String, String> map) {
    return feedDao.selectFollowingNum(map);
  }

  @Override
  public List getFollowFeeds(Map<String, String> map) {
    return feedDao.selectFollowFeeds(map);
  }

  @Override
  public List moreFollowFeeds(Map<String, String> map) {
    return feedDao.selectMoreFeeds(map);
  }

  @Override
  public List getRandomFeeds(Map<String, String> map) {
    return feedDao.selectRandomFeeds(map);
  }

  @Override
  public int putFeedLike(Map<String, String> map) {
    return feedDao.updateFeedLike(map);
  }

  @Override
  public List getMemberFeeds(Map<String, String> map) {
    return feedDao.selectMemberFeeds(map);
  }

  @Override
  public List getFeedReplys(int feedId) {
    return feedDao.selectFeedReplys(feedId);
  }

  @Override
  public List<FeedVO> getMemberDetailFeeds(Map<String, String> map) {
    return feedDao.selectMemberDetailFeeds(map);
  }

}
