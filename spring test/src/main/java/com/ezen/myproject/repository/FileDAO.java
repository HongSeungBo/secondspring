package com.ezen.myproject.repository;

import java.util.List;

import com.ezen.myproject.domain.BoardDTO;
import com.ezen.myproject.domain.FileVO;

public interface FileDAO {

	int insertFile(FileVO fvo);

	int getCount(int bno);

	List<FileVO> getFileList(int bno);

	int deleteFile(String uuid);

	
}
