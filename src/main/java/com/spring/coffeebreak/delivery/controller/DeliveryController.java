package com.spring.coffeebreak.delivery.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.coffeebreak.common.PageCreator;
import com.spring.coffeebreak.common.PageVO;
import com.spring.coffeebreak.delivery.model.AddressVO;
import com.spring.coffeebreak.delivery.service.IAddrService;
import com.spring.coffeebreak.signup.model.SignUpVO;
import com.spring.coffeebreak.takeout.model.MarketVO;

@Controller
@RequestMapping("/delivery")
public class DeliveryController {
	
	@Autowired
	private IAddrService service;
	
	
	
	//배달 주문 시작
	
	//배달 주문페이지
	@GetMapping("/delivery")
	public String delivery(SignUpVO vo,Model model,HttpSession session) {
		vo=(SignUpVO) session.getAttribute("user");
		System.out.println(vo.getAccount());
		service.liningNumber();//게시글 번호 정리
		List<AddressVO> addr=service.selectAllAddr(vo.getAccount());
		
		model.addAttribute("addr",addr);
		return "delivery/delivery";
	}
	
	
	//모달을 통해 주소등록
	@PostMapping("/addrSub")
	public String addrSub(AddressVO addr,RedirectAttributes ra) {
		service.insert(addr);
		ra.addFlashAttribute("msg","insertSuccess");
		return "redirect:/delivery/delivery";
	}
	
	//주소 삭제
	@PostMapping("/delAddr")
	public String delAddr(Integer regNo,RedirectAttributes ra) {
		System.out.println("regNo="+regNo);
		service.deleteAddr(regNo);//게시글 삭제
		ra.addFlashAttribute("msg","delSuccess");
		return "redirect:/delivery/delivery";
	}
	
	
	
	//배달 주문 끝
	////////////////////////////////////////////////////////////////////
	
	//주문내역
	@GetMapping("/ordered_list")
	public String orderedList() {
		
		
		return "delivery/ordered_list";
	}
	
	
	
	
	
	
}
