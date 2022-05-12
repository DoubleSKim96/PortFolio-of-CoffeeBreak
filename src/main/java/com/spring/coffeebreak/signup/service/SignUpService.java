package com.spring.coffeebreak.signup.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.coffeebreak.signup.model.SignUpVO;
import com.spring.coffeebreak.signup.repository.ISignUpMapper;

@Service
public class SignUpService implements ISignUpService {

	@Autowired
	private ISignUpMapper mapper;
	
	@Override
	public void register(SignUpVO user) {
		
		mapper.register(user);

	}

	@Override
	public Integer checkId(String account) {

		return mapper.checkId(account);
	}

	@Override
	public void delete(String account) {
		mapper.delete(account);

	}

	@Override
	public SignUpVO selectOne(String account) {
		
		return mapper.selectOne(account);
	}

	@Override
	public List<SignUpVO> selectAll() {
		
		return mapper.selectAll();
	}

	@Override
	public SignUpVO getUserWithSessionId(String sessionId) {
		
		return null;
	}
	
	@Override
	public Integer checkEmail(String email) {
		
		return mapper.checkEmail(email);
	}
	
	@Override
	public Integer checkPhone(String phoneNum) {
		
		return mapper.checkPhone(phoneNum);
	}

	@Override
	public SignUpVO memberLogin(SignUpVO user) throws Exception {
		return mapper.memberLogin(user);
	}

}
