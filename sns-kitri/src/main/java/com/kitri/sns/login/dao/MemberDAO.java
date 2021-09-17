package com.kitri.sns.login.dao;

import com.kitri.sns.login.vo.MemberVO;

public interface MemberDAO {
	
	public MemberVO selectMember(MemberVO mvo);
	public int selectIdCheck(String id);
	public int insertMember(MemberVO mvo);
}
