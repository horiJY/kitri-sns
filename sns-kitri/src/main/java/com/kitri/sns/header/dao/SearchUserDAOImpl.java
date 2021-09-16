package com.kitri.sns.header.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kitri.sns.login.vo.MemberVO;

@Repository
public class SearchUserDAOImpl implements SearchUserDAO{
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<MemberVO> searchUser() {
		return sqlSession.selectList("member.searchAllUser");
	}
}
