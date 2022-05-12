package com.spring.coffeebreak.signup.service;

import java.util.List;

import com.spring.coffeebreak.signup.model.SignUpVO;

public interface ISignUpService {

	// 회원가입 기능
	void register(SignUpVO user);

	// 아이디 중복 체크 기능
	Integer checkId(String id);

	// 회원 탈퇴 기능
	void delete(String account);

	// 이메일 중복 체크 기능
	Integer checkEmail(String email);

	// 비밀번호 중복 체크 기능
	Integer checkPhone(String phoneNum);

	// 회원정보 조회기능
	SignUpVO selectOne(String account);

	// 회원정보 전체 조회 기능
	List<SignUpVO> selectAll();

	// 세션아이디를 통한 회원정보 조회 기능
	SignUpVO getUserWithSessionId(String sessionId);

	// 로그인
	public SignUpVO memberLogin(SignUpVO user) throws Exception;
}
