package com.ezen.myproject.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.ezen.myproject.domain.CommentVO;
import com.ezen.myproject.repository.BoardDAO;
import com.ezen.myproject.repository.CommentDAO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class CommentServiceImpl implements CommentService{

	@Inject
	private CommentDAO cdao;
	
	@Inject
	private BoardDAO bdao;

	@Override
	public int post(CommentVO cvo) {
		return cdao.insert(cvo);
	}

	@Override
	public List<CommentVO> getlist(int bno) {
		return cdao.getlist(bno);
	}

	@Override
	public int modi(CommentVO cvo) {
		return cdao.modi(cvo);
	}

	@Override
	public int remove(int cno) {
		return cdao.remove(cno);
	}

	@Override
	public int Count(int bno) {
		return cdao.Count(bno);
	}

	@Override
	public void updateCount(int count, int bno) {
		bdao.updateCount(count, bno);
	}

}
