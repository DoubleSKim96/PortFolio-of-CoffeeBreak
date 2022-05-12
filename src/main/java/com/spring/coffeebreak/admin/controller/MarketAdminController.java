package com.spring.coffeebreak.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.coffeebreak.common.PageCreator;
import com.spring.coffeebreak.common.PageVO;
import com.spring.coffeebreak.common.SearchVO;
import com.spring.coffeebreak.takeout.model.MarketVO;
import com.spring.coffeebreak.takeout.service.IMarketService;

@Controller
@RequestMapping("/market_admin")
public class MarketAdminController {

	@Autowired
	private IMarketService service;
	
	//매장 관리자 페이지
	@GetMapping("admin_market")
	public String admin_market(SearchVO search,Model model) {
		List<MarketVO> addr=service.selectAllMar(search);
		service.alignMarNum();//게시글 번호 정리
		PageCreator pc=new PageCreator();
		pc.setPaging(search);
		pc.setTotalCount(service.countMar(search));
		model.addAttribute("addr",addr);
		model.addAttribute("pc",pc);
		return "market_admin/admin_market";
	}
	

	//모달을 통한 매장주소입력
	@PostMapping("/insertMarket")
	public String insertMarket(MarketVO mar,RedirectAttributes ra) {
		service.insertMar(mar);
		ra.addFlashAttribute("msg","insertSuccess");
		return "redirect:/market_admin/admin_market";
	}
	
	//주소상세조회
	@GetMapping("/content/{marketRegNo}")
	public String marContent(@PathVariable Integer marketRegNo,Model model) {
		MarketVO market=service.selectOneMar(marketRegNo);
		model.addAttribute("mar",market);
		
		return "market_admin/admin_market_content";
	}
	
	//주소수정뷰페이지
	@GetMapping("/modify")
	public String modify(Integer marketRegNo,MarketVO mar,Model model) {
		
		MarketVO market=service.selectOneMar(marketRegNo);
		model.addAttribute("addr",market);
		
		return "market_admin/admin_market_modify";
	}
	
	//주소수정
	@PostMapping("/modify")
	public String modify(MarketVO mar,RedirectAttributes ra) {
		service.updateMar(mar);
		ra.addFlashAttribute("msg","modifySuccess");
		return "redirect:/market_admin/admin_market";
	}
	
	@PostMapping("/deleteMarket")
	public String deleteMarket(Integer marketRegNo, PageVO paging,RedirectAttributes ra) {
		service.deleteMar(marketRegNo);
		service.alignMarNum();//게시글 번호 정리
		ra.addFlashAttribute("msg","delSuccess")
		.addAttribute("page",paging.getPage())
		.addAttribute("countPerPage",paging.getCountPerPage());//자동으로 페이지 붙음
		
		return "redirect:/market_admin/admin_market";
	}
	
}
