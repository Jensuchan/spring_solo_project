package com.myweb.www.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.myweb.www.repository.MemberDAO;
import com.myweb.www.security.AuthVO;
import com.myweb.www.security.MemberVO;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;


@RequiredArgsConstructor
@Slf4j
@Service
public class MemberServiceImpl implements MemberService {

	private final MemberDAO mdao;

	@Transactional
	@Override
	public MemberVO confirm(String email) {
		log.info("★★★★★★★★ member service confirm ★★★★★★★★");
		return mdao.selectId(email);
	}
	
	@Transactional
	@Override
	public int register(MemberVO mvo) {
		log.info("★★★★★★★★ member service register ★★★★★★★★");
		int isOk = mdao.insert(mvo);
		return mdao.insertAuthInit(mvo.getEmail());
	}

	@Override
	public boolean updateLastLogin(String authEmail) {
		return mdao.updateLastLogin(authEmail)>0? true : false;
	}

	@Override
	public List<MemberVO> getList() {
		List<MemberVO> list = mdao.selectList();
		for(MemberVO mvo : list) {
			String email = mvo.getEmail();
			List<AuthVO> authList = mdao.selectAuthList(email);
			mvo.setAuthList(authList);
		}
		return list;
	}

	@Override
	public String getPwd(String email) {
		return mdao.getPwd(email);
	}

	@Override
	public int modify(MemberVO mvo) {
		return mdao.update(mvo);
	}

	@Override
	public int remove(String email) {
		mdao.deleteAuth(email);
		return mdao.delete(email);
	}
}
