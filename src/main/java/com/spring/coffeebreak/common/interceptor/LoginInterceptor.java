package com.spring.coffeebreak.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.spring.coffeebreak.signup.model.SignUpVO;
import com.spring.coffeebreak.signup.service.ISignUpService;

public class LoginInterceptor extends HandlerInterceptorAdapter {

	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
	
		HttpSession session=request.getSession();
		SignUpVO mvo=(SignUpVO)session.getAttribute("user");
		
		if(mvo==null) {
			request.getSession().setAttribute("msg", "RequireLogin");
			response.sendRedirect("/coffeebreak/signups/login");
			return false;
		}else {
			return true;
		}
	}
}
