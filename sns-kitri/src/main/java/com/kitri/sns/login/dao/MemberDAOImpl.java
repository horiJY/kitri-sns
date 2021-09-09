package com.kitri.sns.login.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kitri.sns.login.vo.MemberVO;

@Repository
public class MemberDAOImpl implements MemberDAO{

	@Autowired
	private SqlSession sqlSession;

	@Override
	public MemberVO selectMember(MemberVO mvo) {
		return sqlSession.selectOne("member.selectMember",mvo);
	}

	@Override
	public int selectIdCheck(String id) {
		return sqlSession.selectOne("member.selectIdCheck", id);
	}

	@Override
	public int insertMember(MemberVO mvo) {
		return sqlSession.insert("member.insertMember",mvo);
	}
	
	
	
	
}
