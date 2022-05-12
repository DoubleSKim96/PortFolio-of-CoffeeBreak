<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Document</title>
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/menu.css'/>">
</head>
<%@ include file="../include/header.jsp" %>
        <div id="container">
            <section id="content">
                <div class="inner-box">
                    <div class="title-wrap">
                        <h2 class="title-menu">메뉴</h2>	
                        <div class="depth-area">
                            <ol>
                                <li>
                                    <a href="<c:url value='/'/>">홈</a>
                                </li>
                                <li>
                                    <span> > </span>
                                    <a href="<c:url value='/menu/all'/>">
                                    	메뉴
                                    </a>
                                </li>
                                <li>
                                    <span> > </span>
                                    <strong>디저트</strong>
                                </li>
                            </ol>
                        </div>
                        <article class="menu-area">
                        	<div class="menu-nav-wrap">
                        		<div class="menu-nav">
	                        	     <ul>
	                        	     	<li>
	                        	     		<a href="<c:url value='/menu/all'/>">전체</a>
	                        	     	</li>
	                                    <li>
	                                        <a href="<c:url value='/menu/coffee'/>">커피</a>
	                                    </li>
	                                    <li>
	                                        <a href="<c:url value='/menu/beverage'/>">음료</a>
	                                    </li>
	                                    <li class="active">
	                                        <a href="<c:url value='/menu/dessert'/>">디저트</a>
	                                    </li>
	                                    <c:if test="${user.account == 'admin' && user != null}">
	                                    	<li class="insert-menu">
	                                    		<a id="insert-menu" href="<c:url value='/menu/insertMenu'/>">메뉴 등록</a>
	                                    	</li>
	                                    </c:if>
	                                </ul>
                                </div>
                            </div>
                            <%-- 메뉴화면 불러오기 --%>
                            <%@ include file="../menu/menu_dessert_list.jsp" %>
                           
                        </article>
                    </div>
                </div>
            </section>
        </div>
<%@ include file="../include/footer.jsp" %>