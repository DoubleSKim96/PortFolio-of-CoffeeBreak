package com.spring.coffeebreak.signup.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.coffeebreak.signup.model.SignUpVO;
import com.spring.coffeebreak.signup.service.ISignUpService;

@RestController
@RequestMapping(value="/signups", method = {RequestMethod.GET, RequestMethod.POST})
public class SignUpController {
	
	@Autowired
	private ISignUpService service;

	// 인증페이지 이동
	@GetMapping("/certi")
	public ModelAndView certi() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("signups/certi");
		System.out.println("signups/certi : 인증페이지 이동");
		return mav ;
	}
	
	// 회원가입 페이지
	@GetMapping("/signup")
	public ModelAndView signup() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("signups/signup");
		System.out.println("signups/signup : 회원가입 페이지 이동"); 
		return mav ;
	};

	// 회원가입
	@PostMapping("/")
	public String idCheck(@RequestBody SignUpVO user){

		System.out.println("/signups/POST 요청 발생 !");
		System.out.println("param : " + user);
		
		service.register(user);
		
		return "joinSuccess";
	}

	// 아이디 중복 체크
	@PostMapping("/checkId")
	public String checkId(@RequestBody String account) {
		
		System.out.println("checkId: GET요청 !");
		System.out.println("parameter: " + account);
		String result = null;
		
		Integer checkNum = service.checkId(account);
		
		if(checkNum == 1) {
			System.out.println("아이디가 중복 ! ");
			result= "NO";
		} else {
			System.out.println("아이디 사용가능 !");
			result = "OK";
		}
		return result;
	}
	
	// 이메일 중복 체크
	@PostMapping("/checkEmail")
	public String checkEmail(@RequestBody String email) {
		
		System.out.println("checkId: GET요청 !");
		System.out.println("parameter: " + email);
		String result = null;
		
		Integer checkNum = service.checkEmail(email);
		
		if(checkNum == 1) {
			System.out.println("아이디가 중복 ! ");
			result= "NO";
		} else {
			System.out.println("아이디 사용가능 !");
			result = "OK";
		}
		return result;
	}
	
	// 전화번호 중복 체크
		@PostMapping("/checkPhone")
		public String checkPhone(@RequestBody String phoneNum) {
			
			System.out.println("checkId: GET요청 !");
			System.out.println("parameter: " + phoneNum);
			String result = null;
			
			Integer checkNum = service.checkPhone(phoneNum);
			
			if(checkNum == 1) {
				System.out.println("아이디가 중복 ! ");
				result= "NO";
			} else {
				System.out.println("아이디 사용가능 !");
				result = "OK";
			}
			return result;
		}
		

		
	// 회원탈퇴 요청 처리
	@DeleteMapping("/{account}") // PathVariable 경로에서 데이터를 읽어서 account에 저장하겠다.
	public String delete(@PathVariable String account) {
		System.out.println("/signups/ " + account + ": DELETE 요청 발생 !");
		
		service.delete(account);
		
		return "delSuccess";
	}
	
	//로그인페이지 이동
	@GetMapping("/login")
	public ModelAndView login() {
		System.out.println("로그인 페이지 이동");	
		ModelAndView mav = new ModelAndView();
		mav.setViewName("signups/login");
		return mav;
	}

	//로그인 요청
	@PostMapping("/login.do")
	public ModelAndView loginPOST(HttpServletRequest request, SignUpVO user, RedirectAttributes ra) throws Exception {
		
		ModelAndView mv = new ModelAndView();
		
		System.out.println("login 메서드 진입");
		System.out.println("전달된 데이터 : " + user);
		
		HttpSession session = request.getSession();
		SignUpVO vo = service.memberLogin(user);
		
		if(vo != null) {
			if(user.getPassword().equals(vo.getPassword())) {
				System.out.println("로그인 성공");
				session.setAttribute("user", vo);
				mv.setViewName("redirect:/");
				return mv;
			} else {
				ra.addFlashAttribute("result", 0);
				mv.setViewName("redirect:/signups/login");
				System.out.println("비밀번호가 일치하지 않습니다. 비밀번호를 확인해 주세요.");
				return mv;
			}
		} else {
			System.out.println("계정이 존재하지 않습니다. 회원가입을 해주세요");
			ra.addFlashAttribute("result", 0);
			mv.setViewName("redirect:/signups/login");
			return mv;
		}
	}
	
	//로그아웃 요청
	@GetMapping("/logout.do")
	public void logoutMainGET(HttpServletRequest request) throws Exception {
		
		System.out.println("로그아웃 메서드 진입");
		HttpSession session = request.getSession();
		session.invalidate();
	}
	
}
