package com.spring.coffeebreak.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;

import com.spring.coffeebreak.signup.model.SignUpVO;

public class MenuInterceptor implements HandlerInterceptor {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		HttpSession session = request.getSession();
		
		SignUpVO mvo = (SignUpVO)session.getAttribute("user");
		
		if(mvo == null) {
			response.sendRedirect("/coffeebreak");
			return false;
		} else {
			return true;
		}
		
	}
}
