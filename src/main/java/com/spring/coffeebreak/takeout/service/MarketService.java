package com.spring.coffeebreak.takeout.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.coffeebreak.common.SearchVO;
import com.spring.coffeebreak.takeout.model.MarketVO;
import com.spring.coffeebreak.takeout.repository.IMarketMapper;

@Service
public class MarketService implements IMarketService {

	@Autowired
	private IMarketMapper mapper;
	
	@Override
	public List<MarketVO> selectAllMar(SearchVO search) {
		
		return mapper.selectAllMar(search);
	}

	@Override
	public void insertMar(MarketVO mar) {
		
		mapper.insertMar(mar);

	}

	@Override
	public Integer countMar(SearchVO search) {

		return mapper.countMar(search);
	}

	@Override
	public void deleteMar(Integer marketRegNo) {
		mapper.deleteMar(marketRegNo);

	}

	@Override
	public void alignMarNum() {

		mapper.alignMarNum();
	}

	@Override
	public MarketVO selectOneMar(Integer marketRegNo) {
	
		return mapper.selectOneMar(marketRegNo);
	}
	
	@Override
	public void updateMar(MarketVO mar) {
		
		mapper.updateMar(mar);
		
	}
	
}
