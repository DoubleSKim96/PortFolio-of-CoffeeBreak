package com.spring.coffeebreak.notice.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.coffeebreak.notice.commons.PageVO;
import com.spring.coffeebreak.notice.commons.SearchVO;
import com.spring.coffeebreak.notice.model.BoardVO;
import com.spring.coffeebreak.notice.repository.IBoardMapper;

@Service
public class BoardService implements IBoardService {

	@Autowired
	private IBoardMapper mapper;
	
	@Override
	public void insert(BoardVO article) {
		mapper.insert(article);
	}

	@Override
	public List<BoardVO> getArticleListBytitle(SearchVO search) {
		
		return mapper.getArticleListBytitle(search);
	}
	
//	@Override
//	public Integer countArticleListBytitle(SearchVO search) {
//
//		return mapper.countArticleListBytitle(search);
//	}
	
	@Override
	public List<BoardVO> getArticleList(PageVO paging) {
	
		// Integer page = paging.getPage();
		// paging.setPage(page-1 * paging.getCountPerPage());
		
		return mapper.getArticleList(paging);
	}
	
	@Override
	public Integer countArticles(SearchVO search) {

		return mapper.countArticles(search);
	}
	
	@Override
	public BoardVO getArticle(Integer boardNo) {
		mapper.updateViewCnt(boardNo); // 조건문을 걸어서 자기가 자기 게시글 눌렀을때 안오르게 하기 등등하면됨.
		return mapper.getArticle(boardNo);
	}

	@Override
	public void update(BoardVO article) {
		
		mapper.update(article);
	}

	@Override
	public void delete(Integer boardNo) {
		
		mapper.delete(boardNo);
	}



}
