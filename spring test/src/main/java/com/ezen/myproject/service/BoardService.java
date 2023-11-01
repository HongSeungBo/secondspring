 package com.ezen.myproject.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ezen.myproject.domain.BoardDTO;
import com.ezen.myproject.domain.BoardVO;
import com.ezen.myproject.domain.CommentVO;
import com.ezen.myproject.domain.PagingVO;

public interface BoardService {

	int register(BoardDTO bdto);

	BoardVO getDetail(int bno);

	int modify(BoardVO bvo);

	int remove(int bno);

	List<BoardVO> getList(PagingVO pgvo);

	int getTotalCount(PagingVO pgvo);

	BoardDTO getDetailFile(int bno);

	int deleteFile(@Param("uuid")String uuid,@Param("bno")int bno);

	int modifyFile(BoardDTO bdto);



}
