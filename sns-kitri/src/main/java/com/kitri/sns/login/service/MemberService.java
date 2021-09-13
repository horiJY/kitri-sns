package com.kitri.sns.login.service;

import com.kitri.sns.login.vo.MemberVO;

public interface MemberService {
	public boolean loginCheckMember(MemberVO mvo);
	public boolean idCheck(String id);
	public boolean registMember(MemberVO mvo);
	public String sha256(String pw);
}
