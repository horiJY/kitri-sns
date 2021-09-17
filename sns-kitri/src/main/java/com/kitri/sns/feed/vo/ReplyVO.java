package com.kitri.sns.feed.vo;

public class ReplyVO {
  private int feed_id;
  private int seq_no;
  private String member_Id;
  private String reply;
  private String reg_date;



  @Override
  public String toString() {
    return "[seq_no=" + seq_no + ", member_Id=" + member_Id + ", reply=" + reply + ", reg_date="
        + reg_date + "]";
  }

  public int getFeed_id() {
    return feed_id;
  }

  public void setFeed_id(int feed_id) {
    this.feed_id = feed_id;
  }

  public String getMember_Id() {
    return member_Id;
  }

  public void setMember_Id(String member_Id) {
    this.member_Id = member_Id;
  }

  public int getSeq_no() {
    return seq_no;
  }

  public void setSeq_no(int seq_no) {
    this.seq_no = seq_no;
  }

  public String getReply() {
    return reply;
  }

  public void setReply(String reply) {
    this.reply = reply;
  }

  public String getReg_date() {
    return reg_date;
  }

  public void setReg_date(String reg_date) {
    this.reg_date = reg_date;
  }

}
