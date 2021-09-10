package com.kitri.sns.message.dao;

import java.util.List;
import java.util.Map;

import com.kitri.sns.message.vo.MessageVO;

public interface MessageDAO {
	public List<MessageVO> selectList(String senderId);
	public List<MessageVO> selectMsgDetail(Map<String, String> map);
	public int updateMsg(Map<String, String> map);
	public int insertMsg(MessageVO mvo);
}
