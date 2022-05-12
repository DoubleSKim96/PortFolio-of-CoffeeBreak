package com.spring.coffeebreak.customer.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("customers")
public class CustomerController {

	@GetMapping("/customer_center")
	public String customer_center() {
		System.out.println("customers/customer_center : 고객센터 이동");
		return "customers/customer_center";
	}
}
