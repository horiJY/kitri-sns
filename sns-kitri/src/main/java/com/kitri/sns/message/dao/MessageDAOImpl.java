package com.kitri.sns.message.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kitri.sns.message.vo.FollowVO;
import com.kitri.sns.message.vo.MemberVO;
import com.kitri.sns.message.vo.MessageVO;

@Repository
public class MessageDAOImpl implements MessageDAO{
   @Autowired
   private SqlSession sqlSession;
   
   @Override
   public List<MessageVO> selectMsgList(String senderId) {
      return sqlSession.selectList("dm.selectList", senderId);
   }

   @Override
   public List<MessageVO> selectMsgDetail(Map<String, String> map) {
      return sqlSession.selectList("dm.selectMsgDetail", map);
   }

   @Override
   public int updateMsg(Map<String, String> map) {
      return sqlSession.update("dm.updateMsg", map);
   }

   @Override
   public int insertMsg(MessageVO mvo) {
      return sqlSession.insert("dm.insertMsg", mvo);
   }

   @Override
   public List<MemberVO> selectFollowList(String memberId) {
      return sqlSession.selectList("dmsearch.selectFollowList", memberId);
   }

}