package com.spring.coffeebreak.cart.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.coffeebreak.cart.model.CartVO;
import com.spring.coffeebreak.cart.repository.ICartMapper;
import com.spring.coffeebreak.menu.model.MenuVO;
import com.spring.coffeebreak.menu.repository.IMenuMapper;

@Service
public class CartService implements ICartService{

	@Autowired
	private ICartMapper mapper;
	
	@Override
	public int addCart(CartVO cart) {
		
		// 장바구니 데이터 체크
		CartVO checkCart = mapper.checkCart(cart);
		if(checkCart != null) {
			return 2;
		}
		
		// 장바구니 등록 & 에러시 0 반환
		try {
			return mapper.addCart(cart);
		} catch(Exception e) {
			e.printStackTrace();
			return 0;
		}	
	}

	@Override
	public List<CartVO> getCartList(String account) {
		List<CartVO> cart = mapper.getCart(account);
		
		return cart;
	}

	@Override
	public int modifyCount(CartVO cart) {
		return mapper.modifyCount(cart);
	}

	@Override
	public int deleteCart(int cartId) {
		return mapper.deleteCart(cartId);
	}

	
}
