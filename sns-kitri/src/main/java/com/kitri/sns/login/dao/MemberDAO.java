package com.kitri.sns.login.dao;

import java.util.List;

import com.kitri.sns.login.vo.MemberVO;

public interface MemberDAO {
	
	public MemberVO selectMember(MemberVO mvo);
	public int selectIdCheck(String id);
	public int insertMember(MemberVO mvo);
	
	public List<MemberVO> selectMemberInfo(String id);
}
