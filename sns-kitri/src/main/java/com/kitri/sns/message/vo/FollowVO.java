package com.kitri.sns.message.vo;

public class FollowVO {
   private String memberId;
   private String followId;
   private String followDate;
   
   public String getMemberId() {
      return memberId;
   }
   public void setMemberId(String memberId) {
      this.memberId = memberId;
   }
   public String getFollowId() {
      return followId;
   }
   public void setFollowId(String followId) {
      this.followId = followId;
   }
   public String getFollowDate() {
      return followDate;
   }
   public void setFollowDate(String followDate) {
      this.followDate = followDate;
   }
}
