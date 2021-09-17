package com.kitri.sns.message.service;

import java.util.List;
import java.util.Map;

import com.kitri.sns.message.vo.FollowVO;
import com.kitri.sns.message.vo.MemberVO;
import com.kitri.sns.message.vo.MessageVO;

public interface MessageService {

   public List<MessageVO> selectMsgList(String senderId);
   public List<MessageVO> selectMessageDetail(Map<String, String> map);
   public int updateMessage(Map<String, String> map);
   public int insertMessage(MessageVO mvo);
   public List<MemberVO> selectFollowList(String memberId);
}
