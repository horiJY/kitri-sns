package com.kitri.sns.header.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kitri.sns.header.dao.SearchUserDAO;
import com.kitri.sns.login.vo.MemberVO;

@Service
public class SearchUserServiceImpl implements SearchUserService{

	@Autowired
	private SearchUserDAO searchUserDAO;
	
	@Override
	public List<MemberVO> searchUserList() {
		return searchUserDAO.searchUser();
	}

}
