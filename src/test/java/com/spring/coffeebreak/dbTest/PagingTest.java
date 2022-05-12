package com.spring.coffeebreak.dbTest;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.spring.coffeebreak.notice.commons.PageVO;
import com.spring.coffeebreak.notice.commons.SearchVO;
import com.spring.coffeebreak.notice.repository.IBoardMapper;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations= {"file:src/main/webapp/WEB-INF/spring/mvc-config.xml"})
public class PagingTest {

	@Autowired
	private IBoardMapper mapper;
	
	@Test
	public void PagingTest() {
		// System.out.println(mapper.countArticles()+"개");
		
		// 끝 페이지 번호 계산 테스트
				PageVO paging = new PageVO();
				paging.setPage(2);
				int displayPage = 10;
				
				int endPage = (int)Math.ceil(paging.getPage() / (double)displayPage) * displayPage ;
				
				System.out.println("끝 페이지 번호 : " + endPage + "번");
				
				// 시작 페이지 번호 계산 테스트
				int beginPage = (endPage - displayPage) + 1 ;
				System.out.println("시작 페이지 번호 : " + beginPage + "번");
				
				boolean isPrev = (beginPage == 1) ? false : true;
				System.out.println("이전 버튼 활성화 여부 : " + isPrev);
				
				// 끝 페이지 보정
				// int temp = (int)Math.ceil(mapper.countArticles() / (double)paging.getCountPerPage());
			
				// 재보정 여부 판단하기
				//if(endPage > temp) {
				//	endPage = temp ;
				//}
				
				System.out.println("보정 후 끝 페이지 번호 : " + endPage + "번");
				
				// boolean isNext = (mapper.countArticles() <= (endPage + paging.getCountPerPage())) ? false : true;
				// System.out.println("다음 버튼 활성화 여부 : "+ isNext);
				
				
				System.out.println("=====================================");
	}
			@Test
			public void searchTest() {
				
				SearchVO search = new SearchVO();
				search.setPage(1);
				search.setKeyword("3");
				
				System.out.println("====================");
				mapper.getArticleListBytitle(search).forEach(vo -> System.out.println(vo));
				System.out.println("====================");
			
				
	}
	
}
