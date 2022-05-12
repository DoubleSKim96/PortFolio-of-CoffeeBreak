<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="../include/header.jsp" />

<link rel="stylesheet" type="text/css" href="<c:url value='/css/notice.css' />">

<style>
.body_main{
	margin-top: 240px;
}
</style>

<div class="notice_all">
	<div class="notice">
		<h2 class="page_title">공지사항 및 이벤트</h2>
		<div class="depth_area">
			<ol>
				<li>
					<strong>
						<a href="/coffeebreak">홈</a>
					</strong>
				</li>
			</ol>
		</div>
	</div>
	
	<article class="notice_area">
		<div class="menu_wrap">
			<div class="menu_nav">
				<ul>
					<li class="active">
						<a href="/coffeebreak/notices/list">공지사항 및 이벤트</a>
					</li>
				</ul>
			</div>
		</div>
	<hr>
	<article class="notice_area">
		
<div class="body_main">
	<form role="form" method="post" style="text-align: left; margin-left:400px; margin-top: -200px;">
		<div>
			<input type="hidden" class="" name='writer' value="${user.account}">
		</div>
		
		<div >
			<label>제목</label>
			<input type="text" id="write_title" class="board_content" name='title' style="border: none; resize: none;" placeholder="제목을 입력하세요">
		</div>
		
		<div class="board_text2">
			<label>내용</label>
			<textarea class="" rows="5" name='content' placeholder="게시글 내용을 입력하세요"></textarea>
		</div>
		
		<input class="list-button" type="submit" value="등록" class="">
		<input class="list-button" value="취소" onClick="location.href='/coffeebreak/notices/list'" readonly >
		
		</form>
</div>
</article>
</div>

<%@ include file="../include/footer.jsp"%>