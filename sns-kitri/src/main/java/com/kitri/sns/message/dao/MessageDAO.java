package com.kitri.sns.message.dao;

import java.util.List;
import java.util.Map;

import com.kitri.sns.message.vo.FollowVO;
import com.kitri.sns.message.vo.MemberVO;
import com.kitri.sns.message.vo.MessageVO;

public interface MessageDAO {

   public List<MessageVO> selectMsgList(String senderId);
   public List<MessageVO> selectMsgDetail(Map<String, String> map);
   public int updateMsg(Map<String, String> map);
   public int insertMsg(MessageVO mvo);
   public List<MemberVO> selectFollowList(String memberId);
}
