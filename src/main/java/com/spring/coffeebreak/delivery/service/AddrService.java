package com.spring.coffeebreak.delivery.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.spring.coffeebreak.common.PageVO;
import com.spring.coffeebreak.delivery.model.AddressVO;
import com.spring.coffeebreak.delivery.repository.IAddrMapper;
import com.spring.coffeebreak.takeout.model.MarketVO;
import com.spring.coffeebreak.takeout.repository.IMarketMapper;

@Service
public class AddrService implements IAddrService {
	
	@Autowired
	private IAddrMapper mapper;
	
	
	@Override
	public List<AddressVO> selectAllAddr(String account) {
		
		return mapper.selectAllAddr(account);
	}

	@Override
	public void insert(AddressVO vo) {
		
		mapper.insert(vo);
	}
	
	@Override
	public Integer countAddr(PageVO paging) {
	
		return mapper.countAddr(paging);
	}
	
	@Override
	public void deleteAddr(Integer regNo) {
		mapper.deleteAddr(regNo);	
	}
	
	@Override
	public void liningNumber() {
		mapper.liningNumber();
		
	}

	
	
}
