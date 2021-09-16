package com.kitri.sns.login.service;

import java.security.MessageDigest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kitri.sns.login.dao.MemberDAO;
import com.kitri.sns.login.vo.MemberVO;

@Service
public class MemberServiceImpl implements MemberService{

	@Autowired
	private MemberDAO memberDAO;
	
	@Override
	public boolean loginCheckMember(MemberVO mvo) {
		
		MemberVO vo = memberDAO.selectMember(mvo);
		boolean loginFlag = false;
		if(vo!=null) {
			loginFlag = true;
		}
		
		return loginFlag;
	}

	@Override
	public boolean idCheck(String id) {
		
		int result = memberDAO.selectIdCheck(id);
		boolean idCheckFlag = false;
		if(result!=0) {
			//중복된 id 존재
			idCheckFlag = false;
		} else {
			//id 사용가능
			idCheckFlag = true;
		}
		return idCheckFlag;
	}

	@Override
	public boolean registMember(MemberVO mvo) {
		
		int result = memberDAO.insertMember(mvo);
		boolean regstCheckFlag = false;
		if(result !=0) {
			regstCheckFlag = true;
		}
		
		return regstCheckFlag;
	}

	@Override
	public String sha256(String pw) {
		try{

			MessageDigest digest = MessageDigest.getInstance("SHA-256");
			byte[] hash = digest.digest(pw.getBytes("UTF-8"));
			StringBuffer hexString = new StringBuffer();

			for (int i = 0; i < hash.length; i++) {
				String hex = Integer.toHexString(0xff & hash[i]);
				if(hex.length() == 1) hexString.append('0');
				hexString.append(hex);
			}

			//출력
			return hexString.toString();
			
		} catch(Exception ex){
			throw new RuntimeException(ex);
		}
	}
	
}
