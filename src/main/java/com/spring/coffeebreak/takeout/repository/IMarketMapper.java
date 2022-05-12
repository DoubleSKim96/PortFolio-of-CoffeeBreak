package com.spring.coffeebreak.takeout.repository;

import java.util.List;

import com.spring.coffeebreak.common.SearchVO;
import com.spring.coffeebreak.takeout.model.MarketVO;

public interface IMarketMapper {

	//매장 전체조회(페이징 포함)
	List<MarketVO> selectAllMar(SearchVO search);
	
	//주소 삽입
	void insertMar(MarketVO mar);
	
	//게시물 수 세기
	Integer countMar(SearchVO search);
	
	//삭제
	void deleteMar(Integer marketRegNo);
	
	//번호 재정렬
	void alignMarNum();
	
	//매장 상세조회
	MarketVO selectOneMar(Integer marketRegNo);
	
	//정보수정
	void updateMar(MarketVO mar);
}
