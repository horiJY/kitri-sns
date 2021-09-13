package com.kitri.sns.message.service;

import java.util.List;
import java.util.Map;

import com.kitri.sns.message.vo.MessageVO;

public interface MessageService {
	public List<MessageVO> getMessageList(String senderId);
	public List<MessageVO> getMessageDetail(Map<String, Object> map);
	public int updateMessage(Map<String, String> map);
	public int insertMessage(MessageVO mvo);
}
