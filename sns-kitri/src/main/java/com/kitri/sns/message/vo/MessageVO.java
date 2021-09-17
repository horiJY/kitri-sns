package com.kitri.sns.message.vo;

public class MessageVO {
	private String id1;
	private String id2;
	private String day;
	private String path;
	private String lastMsg;
	
	
	
	@Override
	public String toString() {
		return "MessageVO [id1=" + id1 + ", id2=" + id2 + ", day=" + day + ", path=" + path + ", lastMsg=" + lastMsg
				+ "]";
	}
	public String getId1() {
		return id1;
	}
	public void setId1(String id1) {
		this.id1 = id1;
	}
	public String getId2() {
		return id2;
	}
	public void setId2(String id2) {
		this.id2 = id2;
	}
	public String getDay() {
		return day;
	}
	public void setDay(String day) {
		this.day = day;
	}
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	public String getLastMsg() {
		return lastMsg;
	}
	public void setLastMsg(String lastMsg) {
		this.lastMsg = lastMsg;
	}
}
