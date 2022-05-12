package com.spring.coffeebreak.dbTest;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.spring.coffeebreak.signup.model.SignUpVO;
import com.spring.coffeebreak.signup.repository.ISignUpMapper;

@RunWith(SpringJUnit4ClassRunner.class)//pom.xml���� �쇱�대��щ━ 異�媛�
@ContextConfiguration(locations= {"file:src/main/webapp/WEB-INF/spring/mvc-config.xml"})
public class regTest {

	@Autowired
	private ISignUpMapper mapper;
	
	@Test
	public void registerTest() {
		

		SignUpVO user = new SignUpVO();
		user.setAccount("aaa123");
		user.setName("김덕배");
		user.setPassword("aaa123");
		user.setPhoneNum("01055555555");
		user.setEmail("over@naver.com");
		
		mapper.register(user);
		System.out.println("회원 가입 성공 !");

	
	}

}
