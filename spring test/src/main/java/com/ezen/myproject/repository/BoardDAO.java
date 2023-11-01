package com.ezen.myproject.repository;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.security.access.method.P;

import com.ezen.myproject.domain.BoardDTO;
import com.ezen.myproject.domain.BoardVO;
import com.ezen.myproject.domain.CommentVO;
import com.ezen.myproject.domain.PagingVO;

public interface BoardDAO {

	int insert(BoardVO bvo);

	List<BoardVO> getList(PagingVO pgvo);

	BoardVO getDetail(int bno);

	void readCount(@Param("bno")int bno, @Param("cnt")int cnt);

	int update(BoardVO bvo);

	int remove(int bno);

	int totalCount(PagingVO pgvo);

	int selectBno();

	void updateCount(@Param("count")int count, @Param("bno")int bno);

	void updatefc(@Param("count")int count, @Param("bno")int bno);


}
