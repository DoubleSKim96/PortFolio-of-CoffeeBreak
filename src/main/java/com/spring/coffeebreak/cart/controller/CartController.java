package com.spring.coffeebreak.cart.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.coffeebreak.cart.model.CartVO;
import com.spring.coffeebreak.cart.service.ICartService;
import com.spring.coffeebreak.signup.model.SignUpVO;

@Controller
@RequestMapping("/cart")
public class CartController {

	@Autowired
	private ICartService service;
	
	@PostMapping("/add")
	@ResponseBody
	public String addCartPOST(CartVO cart, HttpServletRequest request) {
		
		//로그인 체크
		HttpSession session = request.getSession();
		SignUpVO vo = (SignUpVO)session.getAttribute("user");
		if(vo == null) {
			return "5";
		}
		
		//카트 등록
		int result = service.addCart(cart);
		
		return result + "";
	}
	
	@GetMapping("/cart/{account}")
	public String cartPageGET(@PathVariable("account") String account, Model model) {
		System.out.println("cart페이지 요청");
		List<CartVO> cartInfo = service.getCartList(account);
		model.addAttribute("cartInfo", cartInfo);
		System.out.println(cartInfo);
		return "cart/cart";
	}
	
	//장바구니 수량 수정
	@PostMapping("/update")
	public String updateCartPOST(CartVO cart) {
		service.modifyCount(cart);
		return "redirect:/cart/cart/" + cart.getAccount();
	}
	
	//장바구니 항목 삭제
	@PostMapping("/delete")
	public String deleteCartPOST(CartVO cart) {
		service.deleteCart(cart.getCartId());
		return "redirect:/cart/cart/" + cart.getAccount();
	}
}
