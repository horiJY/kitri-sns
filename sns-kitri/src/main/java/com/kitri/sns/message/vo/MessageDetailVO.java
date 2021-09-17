package com.kitri.sns.message.vo;

public class MessageDetailVO {
	private String sender;
	private String receiver;
	private String time;
	private String msg;
	
	@Override
	public String toString() {
		return "MessageDetailVO [sender=" + sender + ", receiver=" + receiver + ", time=" + time + ", msg=" + msg + "]";
	}
	public String getSender() {
		return sender;
	}
	public void setSender(String sender) {
		this.sender = sender;
	}
	public String getReceiver() {
		return receiver;
	}
	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
}
