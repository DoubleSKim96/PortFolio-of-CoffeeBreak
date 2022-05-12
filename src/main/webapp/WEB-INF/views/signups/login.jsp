<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Document</title>
    <script src="<c:url value='/jquery/jquery-3.6.0.js'/>"></script>
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/login.css'/>">
    <script src="<c:url value='/js/login.js'/>"></script>
</head>
	<%@ include file="../include/header.jsp" %>

       	<div id="container">
       		<section id="content">
       			<div class="inner-box">
       				<div class="title-wrap">
		     			<h2 class="title-login">로그인</h2>	
			     		<div class="depth-area">
			     			<ol>
			     				<li>
			     					<a href="<c:url value='/'/>">홈</a>
			     				</li>
			     				<li>
			     					<span> > </span>
			     					<strong>로그인</strong>
			     				</li>
			     			</ol>
			     		</div>
		     		</div>

		     		<div class="login-area">
		     		
		     		    <div class="login-tab5">
		     		    <%--
                            <ul>
                                <li class="active">
                                    <a href="#member">
                                    	회원로그인
                                    </a>
                                </li>
                                
                                <li class>
                                    <a href="#guest">
                                    	비회원 주문
                                    </a>
                                </li>
                                
                            </ul>
                             --%>
                         </div>
                         <div class="login-content active" id="member">
                            <form id="loginForm" name="loginForm" method="post">
                                <div class="form-item">
                                    <input type="text" name="account" id="id" maxlength="20" placeholder="아이디" >
                                </div>
                                <div class="form-item">
                                    <input type="password" name="password" id="pw" maxlength="20" placeholder="비밀번호">
                                </div>
                                <div class="check-item">
                                    <div class="check-box v1">
                                        <input type="checkbox" id="idcheck">
                                        <label class="checkbox" for="idcheck"></label>
                                        <label for="idcheck">아이디저장</label>
                                    </div>
                                    <div class="find-member">
                                        <span>
                                            <a href="#">아이디 찾기</a>
                                        </span>
                                        <span>
                                            <a href="#">비밀번호 찾기</a>
                                        </span>
                                    </div>
                                    <div class="button-wrap">
                                        <a id="login_btn" href="#" class="button-type v1">로그인</a>
                                    </div>
                                    <div class="button-wrap">
                                        <a href="<c:url value='/signups/certi'/>" class="button-type v2">회원가입</a>
                                    </div>
                                    <div class="sns-login">
                                        <div class="sns-title">
                                            <div class="title-type">
                                             	 소셜 간편 로그인
                                            </div>
                                        </div>
                                        <ul class="sns-button-list">
                                            <li class="sns-button-item button-kakao">
                                                <a href="#">카카오</a>
                                            </li>
                                            <li class="sns-button-item button-naver">
                                                <a href="#">네이버</a>
                                            </li>
                                            <li class="sns-button-item button-apple">
                                                <a href="#">애플</a>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </form>
                         </div>
                         <%--
                         <div class="login-content" id="guest">
                            <form id="nonmem" name="nonmem" method="post"action="">
                                <div class="sub-text">
                                    	아직 회원이 아니세요?
                                    <a href="<c:url value='/signups/certi'/>">회원가입</a>
                                </div>
                                <div class="form">
                                    <div class="form-item">
                                        <input type="text" name="id" id="id" maxlength="20" placeholder="이름" >
                                    </div>
                                    <div class="form-group">
                                        <div class="form-item tel">
                                            <div class="select-type">
                                                <select name="tel1" id="tel1">
                                                    <option value="010">010</option>
                                                    <option value="011">011</option>
                                                    <option value="016">016</option>
                                                    <option value="017">017</option>
                                                    <option value="018">018</option>
                                                    <option value="019">019</option>
                                                </select>
                                            </div>
                                            <input type="text" name="tel2" id="tel2" maxlength="4">
                                            <input type="text" name="tel3" id="tel3" maxlength="4">
                                        </div>
                                        <a href="#" class="button-type v7">인증번호</a>
                                    </div>
                                    
                                    <div class="form-group">
                                        <div class="form-item">
                                            <input type="text" name="auth-num" id="auth-num" maxlength="20" placeholder="인증번호" >
                                        </div>
                                    </div>
                                </div>
                                <div class="check-item">
                                    <div class="check-box v1">
                                        <input type="checkbox" id="agree1" name="agree" value="Y">
                                        <label class="checkbox" for="agree1"></label>
                                        <label for="agree1">개인정보 수집 및 이용 동의(필수)</label>
                                    </div>
                                    <a href="#" class="button-link side2">보기</a>
                                </div>
                                <div class="check-item">
                                    <div class="check-box v1">
                                        <input type="checkbox" id="agree2" name="agree" value="Y">
                                        <label class="checkbox" for="agree2"></label>
                                        <label for="agree2">위치기반 서비스 이용약관 동의(필수)</label>
                                    </div>
                                    <a href="#" class="button-link side2">보기</a>
                                </div>
                                <div class="button-wrap">
                                    <a href="#" class="button-type3">주문하기</a>
                                </div>
                                <p class="title-type2">
                                   	비회원 주문 시 매니아 및 제휴할인 혜택을 받을 수 없습니다.
                                </p>
                            </form>
                         </div>
                          --%>
		     		</div>
	     		</div>
     		</section>  	
        </div>
    	<%@ include file="../include/footer.jsp" %>
<script>
	//로그인 버튼 클릭 메서드
	$("#login_btn").click(function() {
		$("#loginForm").attr("action", "<c:url value='/signups/login.do'/>");
		$("#loginForm").submit();
	});
	
	// 엔터키 입력 이벤트
	$("#loginForm").keydown(function (key) {
	 	if(key.keyCode == 13){//키가 13이면 실행 (엔터는 13)
	    	$("#login_btn").click();
	    }
	});
	
	const result="<%=session.getAttribute("msg")%>";
	
	
	if(result==="RequireAdminLogin"){
		alert("관리자 로그인이 필요합니다.");
		<%session.invalidate(); %>
	}else if(result==="RequireLogin"){
		alert("로그인이 필요한 서비스입니다.");
	}
	
	
</script>
