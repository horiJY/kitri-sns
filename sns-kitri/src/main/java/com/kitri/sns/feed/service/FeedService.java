package com.kitri.sns.feed.service;

import java.util.List;

public interface FeedService {
  // 팔로잉체크
  public int checkFollowing();

  // 팔로잉이1명이상: 팔로잉피드가져오기(최근 3일)
  public List getFollowFeeds();

  // 팔로잉이0명: 인기많은 사람의 피드 가져오기(최근 3일의 피드 중 like수가 높은 것)
  public List getRandomFeeds();

  // getFollowFeeds 이 후
  public List getMoreFollowFeeds();
}
