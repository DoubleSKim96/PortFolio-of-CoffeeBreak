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
	
<div class="body_main">

				<input type="hidden" class="" name='writer' value="${article.writer}" readonly>
				</div>
		
				<div class="board_title">				
						<input type="text" class="board_content" name='title' value="${article.title }" readonly>
						<p><hr></p>	
					<span style="margin-left: 1050px;">
						<fmt:formatDate value="${article.regDate}" pattern="yyyy-MM-dd" />
						 | 조회 ${article.viewCnt }
					</span>
				</div>
			 		

		<div class="board_text">
			<textarea rows="5" name='content' readonly>${article.content }</textarea>
		</div>
		
        <form id="formObj" role="form" action="<c:url value='/notices/delete'/>" method="post">  
        
			<input type="hidden" name="boardNo" value="${article.boardNo}">
	        <input type="hidden" name="page" value="${p.page}">
	        <input type="hidden" name="countPerPage" value="${p.countPerPage}">
          
			<input class="list-button" value="목록" onClick="location.href='/coffeebreak/notices/list'" readonly>
		<c:if test="${user.account eq 'admin'}">
			<input class="list-button" id ="modBtn" type="submit" value="수정">
			<input class="list-button" type="submit" value="삭제" onclick="return confirm('정말로 삭제하시겠습니까?')">&nbsp;&nbsp;
		</c:if>
		</form>
</div>
</article>
</div>


<script>
//수정 완료 알림창 처리
const msg = "${msg}";
	if(msg === "modSuccess") {
		alert("게시물 수정 완료!");
	}
	
// 제이쿼리
$(function(){
	
	const formElement = $("#formObj");

	// 목록버튼 클릭이벤트 처리
	$("#list-btn").click(function () {
		console.log("목록 버튼이 클릭됨!");
		location.href= '/coffeebreak/notices/list?page=${p.page}' 
						+ '&countPerPage=${p.countPerPage}'
						+ '&keyword=${p.keyword}'
						+ '&condition=${p.condition}';
	});

	// 수정버튼 클릭이벤트 처리
	var modifyBtn = $("#modBtn"); // jQuery
	
	modifyBtn.click(function(){
		console.log("수정 버튼이 클릭 !");
		formElement.attr("action", "/coffeebreak/notices/modify");
		formElement.attr("method", "get");
		formElement.submit();
	});
});
</script>
<%@ include file="../include/footer.jsp"%>