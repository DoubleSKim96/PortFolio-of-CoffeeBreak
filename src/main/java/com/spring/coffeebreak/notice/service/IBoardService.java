package com.spring.coffeebreak.notice.service;

import java.util.List;

import com.spring.coffeebreak.notice.commons.PageVO;
import com.spring.coffeebreak.notice.commons.SearchVO;
import com.spring.coffeebreak.notice.model.BoardVO;

public interface IBoardService {
	
	// 게시글 등록 기능
	void insert(BoardVO article);
	
	//게시글 목록 조회기능
	List<BoardVO> getArticleList(PageVO paging);
	
	// 제목으로 검색기능
	List<BoardVO> getArticleListBytitle(SearchVO search);
	
	// 총 게시물의 수 조회기능
	Integer countArticles(SearchVO search);
	
	//게시글 상세 조회기능
	BoardVO getArticle(Integer boardNo);
	

	//게시글 수정 기능
	void update(BoardVO article);
	
	//게시글 삭제 기능
	void delete(Integer boardNo);
}
