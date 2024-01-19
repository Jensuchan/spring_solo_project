package com.myweb.www.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.myweb.www.domain.CommentVO;
import com.myweb.www.domain.PagingVO;
import com.myweb.www.handler.PagingHandler;
import com.myweb.www.repository.CommentDAO;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;


@RequiredArgsConstructor
@Slf4j
@Service
public class CommentServiceImpl implements CommentService {
	
	private final CommentDAO cdao;

	@Override
	public int post(CommentVO cvo) {
		log.info("★★★★ comment service post ★★★★");
		return cdao.insert(cvo);
	}

	@Override
	public PagingHandler getList(long bno, PagingVO pgvo) {
		log.info("★★★★ comment service list ★★★★");
		int totalCount = cdao.getTotalCount(bno);
		List<CommentVO> cmtList = cdao.selectList(bno, pgvo);
		PagingHandler ph = new PagingHandler(pgvo, totalCount, cmtList);
		return ph;
	}

	@Override
	public int modify(CommentVO cvo) {
		log.info("★★★★ comment service modify ★★★★");
		return cdao.update(cvo);
	}

	@Override
	public int remove(long cno) {
		log.info("★★★★ comment service remove ★★★★");
		return cdao.delete(cno);
	}
	
	
}
