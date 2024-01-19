package com.myweb.www.repository;

import java.util.List;

import com.myweb.www.domain.FileVO;

public interface FileDAO {

	int insert(FileVO fvo);

	List<FileVO> selectList(long bno);

	int delete(String uuid);

}
