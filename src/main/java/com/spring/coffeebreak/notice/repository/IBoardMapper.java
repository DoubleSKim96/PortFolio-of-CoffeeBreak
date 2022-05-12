package com.spring.coffeebreak.notice.repository;

import java.util.List;

import com.spring.coffeebreak.notice.commons.PageVO;
import com.spring.coffeebreak.notice.commons.SearchVO;
import com.spring.coffeebreak.notice.model.BoardVO;

public interface IBoardMapper {
	
	// 게시글 등록 기능
	void insert(BoardVO article);
	
	//게시글 목록 조회기능
	List<BoardVO> getArticleList(PageVO paging);
	
	// 제목으로 검색기능
	List<BoardVO> getArticleListBytitle(SearchVO search);
	// 검색 이후의 게시글 목록
	
	// 총 게시물의 수 조회기능
	Integer countArticles(SearchVO search);
	
	//게시글 상세 조회기능
	BoardVO getArticle(Integer boardNo);
	
	// 게시물 조회수 상승 처리
	void updateViewCnt(Integer boardNo);
	
	//게시글 수정 기능
	void update(BoardVO article);
	
	//게시글 삭제 기능
	void delete(Integer boardNo);
}
