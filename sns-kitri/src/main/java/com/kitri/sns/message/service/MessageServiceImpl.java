package com.kitri.sns.message.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kitri.sns.message.dao.MessageDAO;
import com.kitri.sns.message.vo.MessageVO;

@Service
public class MessageServiceImpl implements MessageService{
	
	@Autowired
	private MessageDAO messageDAO;
	
	@Override
	public List<MessageVO> getMessageList(String senderId) {
		return messageDAO.selectList(senderId);
	}

	@Override
	public List<MessageVO> getMessageDetail(Map<String, Object> map) {
		return messageDAO.selectMsgDetail(map);
	}

	@Override
	public int updateMessage(Map<String, String> map) {
		return messageDAO.updateMsg(map);
	}

	@Override
	public int insertMessage(MessageVO mvo) {
		return messageDAO.insertMsg(mvo);
	}
}
