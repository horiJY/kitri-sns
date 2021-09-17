package com.kitri.sns.header.dao;

import java.util.List;

import com.kitri.sns.login.vo.MemberVO;

public interface SearchUserDAO {
	public List<MemberVO> searchUser();
}
