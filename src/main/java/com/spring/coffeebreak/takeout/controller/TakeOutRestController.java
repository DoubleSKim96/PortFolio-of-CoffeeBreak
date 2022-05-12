package com.spring.coffeebreak.takeout.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.spring.coffeebreak.common.SearchVO;
import com.spring.coffeebreak.takeout.service.IMarketService;

@RestController
@RequestMapping("/modal")
public class TakeOutRestController {
	
	@Autowired
	private IMarketService service;
	
	
	
}
