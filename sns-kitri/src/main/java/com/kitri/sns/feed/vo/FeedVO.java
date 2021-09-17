package com.kitri.sns.feed.vo;

import java.util.List;

public class FeedVO {
  private int feedId;
  private String memberId;
  private String imageURL;
  private String content;
  private String regdate;
  private int likes;
  private List<ReplyVO> replys;


  @Override
  public String toString() {
    return "feedId=" + feedId + ", memberId=" + memberId + ", imageURL=" + imageURL + ", content="
        + content + ", regString=" + regdate + ", likes=" + likes + ", replys=" + replys;
  }


  public int getFeedId() {
    return feedId;
  }


  public void setFeedId(int feedId) {
    this.feedId = feedId;
  }


  public String getMemberId() {
    return memberId;
  }


  public void setMemberId(String memberId) {
    this.memberId = memberId;
  }


  public String getImageURL() {
    return imageURL;
  }


  public void setImageURL(String imageURL) {
    this.imageURL = imageURL;
  }


  public String getContent() {
    return content;
  }


  public void setContent(String content) {
    this.content = content;
  }


  public String getRegdate() {
    return regdate;
  }


  public void setRegdate(String regdate) {
    this.regdate = regdate;
  }


  public int getLikes() {
    return likes;
  }


  public void setLikes(int likes) {
    this.likes = likes;
  }


  public List<ReplyVO> getReplys() {
    return replys;
  }


  public void setReplys(List<ReplyVO> replys) {
    this.replys = replys;
  }



}
