package com.spring.coffeebreak.takeout.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.coffeebreak.common.PageCreator;
import com.spring.coffeebreak.common.SearchVO;
import com.spring.coffeebreak.takeout.model.MarketVO;
import com.spring.coffeebreak.takeout.service.IMarketService;

@Controller
@RequestMapping("/takeout")
public class TakeOutController {

		@Autowired
		private IMarketService service;
	
		//포장 시작
	
			//포장주문페이지 오픈
			@GetMapping("/take_out")
			public String takeOutMainPage(SearchVO search,Model model) {
				List<MarketVO> list=service.selectAllMar(search);
				
				
				PageCreator pc=new PageCreator();
				pc.setPaging(search);
				pc.setTotalCount(service.countMar(search));
				
				model.addAttribute("pc",pc);
				model.addAttribute("list",list);
				
				return "takeout/take_out";
			}
			
			
			//포장주문 모달을 통한 주소입력
			@PostMapping("/insertMarket")
			public String insertMarket(MarketVO mar,RedirectAttributes ra) {
				service.insertMar(mar);
				ra.addFlashAttribute("msg","insertSuccess");
				return "redirect:/takeout/take_out";
			}
			
			
			
			
		
}
