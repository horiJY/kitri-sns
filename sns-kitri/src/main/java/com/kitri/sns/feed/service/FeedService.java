package com.kitri.sns.feed.service;

import java.util.List;
import java.util.Map;

public interface FeedService {
  // 팔로잉체크
  public int checkFollowing(Map<String,String> map);

  // 팔로잉이1명이상: 팔로잉피드가져오기(최근 3일)
  public List getFollowFeeds(Map<String,String> map);

  // getFollowFeeds 이 후 추가 내용이 없을 때 내 팔로잉 공통 팔로잉 수 상위 3명의 피드가져오기(최근 3일)  
  public List moreFollowFeeds(Map<String,String> map);

  // 팔로잉이0명: 인기많은 사람의 피드 가져오기(최근 3일의 피드 중 like수가 높은 것)
  public List getRandomFeeds(Map<String,String> map);

}
