package com.kitri.sns.message.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kitri.sns.message.dao.MessageDAO;
import com.kitri.sns.message.vo.FollowVO;
import com.kitri.sns.message.vo.MemberVO;
import com.kitri.sns.message.vo.MessageVO;

@Service
public class MessageServiceImpl implements MessageService{
   
   @Autowired
   private MessageDAO messageDAO;
   
   @Override
   public List<MessageVO> selectMsgList(String senderId) {
      return messageDAO.selectMsgList(senderId);
   }

   @Override
   public List<MessageVO> selectMessageDetail(Map<String, String> map) {
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

   @Override
   public List<MemberVO> selectFollowList(String memberId) {
      return messageDAO.selectFollowList(memberId);
   }
}

