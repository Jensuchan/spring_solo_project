package com.myweb.www.service;

import java.util.List;

import com.myweb.www.security.MemberVO;

public interface MemberService {

	MemberVO confirm(String email);

	int register(MemberVO mvo);

	boolean updateLastLogin(String authEmail);

	List<MemberVO> getList();

	String getPwd(String email);

	int modify(MemberVO mvo);

	int remove(String email);

}
