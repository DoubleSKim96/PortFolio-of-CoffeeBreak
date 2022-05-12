package com.spring.coffeebreak.dbTest;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.spring.coffeebreak.notice.model.BoardVO;
import com.spring.coffeebreak.notice.repository.IBoardMapper;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations= {"file:src/main/webapp/WEB-INF/spring/mvc-config.xml"})
public class BoardTest {

	@Autowired
	private IBoardMapper mapper;
	
	@Test
	public void insertTest() {
		
		for(int i=1 ; i <= 10 ; i++) {
			BoardVO article = new BoardVO();
			article.setTitle("테스트 제목123" + i);
			article.setWriter("창식이123" + i);
			article.setContent("마 테스트 중이다아123" + i);
			mapper.insert(article);
		}
		System.out.println("게시글 등록 성공 ! ");
	}
}
