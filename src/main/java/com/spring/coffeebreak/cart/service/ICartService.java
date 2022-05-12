package com.spring.coffeebreak.cart.service;

import java.util.List;

import com.spring.coffeebreak.cart.model.CartVO;

public interface ICartService {

	//카트 추가
	public int addCart(CartVO cart);

	//장바구니 정보 리스트
	public List<CartVO> getCartList(String account);
	
	//카트 수량 수정
	public int modifyCount(CartVO cart);
	
	//카트 삭제
	public int deleteCart(int cartId);
	
}
