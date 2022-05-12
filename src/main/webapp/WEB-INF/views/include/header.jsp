<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Document</title>   
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/index.css'/>">
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/base.css'/>">
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/order.css'/>">
    
   	<script src="<c:url value='/jquery/jquery-3.6.0.js'/>"></script>
    <script src="<c:url value='/js/index.js'/>"></script>
</head>
<body>

    <div id="wrap">
        <header id="header" style="transform: translateY();">
            <div class="top-wrap">
                <div class="inner-box" id="top-box">
                    <a href="<c:url value='/'/>" class="btn-logo">
                        <i class="icon-logo"></i>
                    </a>
                    <c:if test="${user.account == 'admin' }">
	                    <div class="visual-admin">
	                    	<span>관리자 계정입니다</span>
	                    </div>
                    </c:if>
					<div class="login">
                    	<c:if test="${user == null }">
                    		<a href="<c:url value='/signups/login'/>">로그인</a>
                    		<a href="<c:url value='/signups/certi'/>">회원가입</a>
                    	</c:if>
                        <c:if test="${user != null }">
                        	<a href="#">마이페이지</a>
                        	<a href="<c:url value='/cart/cart/${user.account }'/>">장바구니</a>
                        	<a id="logout-button">로그아웃</a>
                        </c:if>
                    </div>
				</div>
            </div>
            <div id="gnb" class="gnb-wrap">
                <div class="gnb-inner">
                    <ul>
                        <li>
                            <a href="<c:url value='/menu/all'/>">
                                <span>메뉴</span>
                            </a>
                        </li>
                        <li>
                            <a href="<c:url value='/takeout/take_out'/>">
                                <span>주문</span>
                            </a>
                        </li>
                        <li>
                            <a href="<c:url value='/notices/list'/>">
                                <span>소식</span>
                            </a>
                        </li>
                        <li>
                            <a href="<c:url value='/customers/customer_center'/>">
                                <span>고객센터</span>
                            </a>
                        </li>
                        <c:if test="${user.account eq 'admin'}">
                        <li>
                            <a href="<c:url value='/market_admin/admin_market'/>">
                                <span>매장관리</span>
                            </a>
                        </li>
                        </c:if>
                    </ul>
                </div>
            </div>
        </header>
	</div>
 <script>
 	// 로그아웃 버튼 작동
 	$("#logout-button").click(function() {
 		$.ajax({
 			type: "POST",
 			url: "<c:url value='/signups/logout.do' />",
 			success: function(data) {
 				alert("로그아웃 되었습니다");
 				document.location.reload();
 			}
 		});
 	});
 </script>