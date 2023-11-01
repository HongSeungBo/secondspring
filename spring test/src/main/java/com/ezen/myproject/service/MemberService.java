package com.ezen.myproject.service;

import com.ezen.myproject.domain.MemberVO;

public interface MemberService {

	int insert(MemberVO mvo);

	MemberVO login(MemberVO mvo);

	int modify(MemberVO mvo);

}
