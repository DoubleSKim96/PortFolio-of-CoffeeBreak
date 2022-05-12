package com.spring.coffeebreak.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.spring.coffeebreak.signup.model.SignUpVO;

public class MarketAdminInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session=request.getSession();
		SignUpVO mvo=(SignUpVO)session.getAttribute("user");
		
		if(mvo==null) {
			request.getSession().setAttribute("msg", "RequireAdminLogin");
			response.sendRedirect("/coffeebreak/signups/login");
			return false;
		}else if(mvo.getAccount().equals("admin")&&mvo.getPassword().equals("admin!1234")){
			return true;
		}else {
			response.sendRedirect("/coffeebreak/signups/login");
			
			return false;
		}
	}

}
