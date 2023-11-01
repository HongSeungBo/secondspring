package com.ezen.myproject.repository;

import com.ezen.myproject.domain.MemberVO;

public interface MemberDAO {

	MemberVO getUser(String id);

	int insert(MemberVO mvo);

	MemberVO login(MemberVO mvo);

	int update(MemberVO mvo);

}
