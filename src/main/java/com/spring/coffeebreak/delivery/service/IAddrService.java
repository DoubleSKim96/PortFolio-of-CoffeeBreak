package com.spring.coffeebreak.delivery.service;

import java.util.List;

import com.spring.coffeebreak.common.PageVO;
import com.spring.coffeebreak.delivery.model.AddressVO;
import com.spring.coffeebreak.takeout.model.MarketVO;

public interface IAddrService {
	
	
	//주소 전체 조회(페이징 포함)
	List<AddressVO> selectAllAddr(String account);
	
	//테스트를 위해 주소넣으려고..
		void insert(AddressVO vo);
		
		//게시물 수 세기
		Integer countAddr(PageVO paging);
		
		//게시 주소 삭제
		void deleteAddr(Integer regNo);
		
		//게시글 번호 정리
		void liningNumber();
		
		
		
		
}
