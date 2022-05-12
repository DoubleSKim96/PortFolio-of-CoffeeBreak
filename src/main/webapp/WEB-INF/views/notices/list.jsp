<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="../include/header.jsp" />

<link rel="stylesheet" type="text/css" href="<c:url value='/css/notice.css' />">
<style>
	.page-active{
		font-weight: bold;
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
		<div class="notice_wrap">
				<input type="hidden" id="type" name="type" value="N">
				<input type="hidden" id="pageNo" name="pageNo" value="1">
				<div class="form_group">
					<div class="form_item">
						<div class="select_type2">
						<select id="condition" name="condition">
							<option value="title">제목</option>
							<option value="content">내용</option>
					<!-- <option value="writer">작성자</option> -->
							<option value="titleContent">제목+내용</option>
						</select>
						</div>
					</div>
					<div class="form_item" style="width: 428px; margin-left: 5px;">
						<input type="text" id="conditionTemp" name="conditionTemp" value="${param.keyword }">
						<input type="hidden" id="condition" name="condition" class="i_text">
					</div>
					<div class="form_item">
						<button type="button" id="searchBtn" class="btn_search">
						"검색"
						</button>
					</div>
					<div style="margin-left: 300px;margin-top: 14px;">
						<span id="count-per-page" style="float: right;" >
							<input class="btn btn-page" type="button" value="10">
							<input class="btn btn-page" type="button" value="20">
							<input class="btn btn-page" type="button" value="30">
						</span>
					</div>
				</div>
				<div class="table_type3">
						<p class="side">총 ${pc.articleTotalCount } 건</p>
					<table>
						<caption>news</caption>
						<colgroup>
							<col style="width:106px">
							<col>
							<col style="width:333px">
							<col style="width:110px">
						</colgroup>
						<thead>
							<tr>
								<th>번호</th>
							<!--<th>작성자</th>  -->	
								<th>제목</th>
								<th>등록일</th>
								<th>조회수</th>
							</tr>
						</thead>
						
						<!-- 게시물이 들어갈 공간 -->
						<c:forEach var="b" items="${articles}">
							<tr>
							<!-- 번호 -->
							<td>${b.boardNo }</td>
							<!-- 작성자 -->
								<!--<td>${b.writer }</td>  -->
								<!-- 제목 -->
								<td>
									<a style="margin-top: 250px; height: 40px; color: orange;" href="<c:url value='/notices/content/${b.boardNo}' />">
										${b.title}
									</a>	
								</td>
								<!-- 등록일 -->
								<td>
									<fmt:formatDate value="${b.regDate}" pattern="yyyy-MM-dd" />
								</td>
								<!-- 조회수 -->
								<td>${b.viewCnt }</td>
						</tr>
						</c:forEach>
					</table>
				</div>
				<!-- 페이징 처리 -->
				<div class="pagination">
					<a href="/coffeebreak/notices/list?page=1" class="pager-first">처음</a>
					<!-- 이전 버튼 -->
					<c:if test="${pc.prev }">
						<a href="/coffeebreak/notices/list?page=${pc.beginPage -10 }" class="pager-prev">이전</a>
					</c:if>
					
					<!-- 페이지 버튼 -->
					<c:forEach var="pageNum" begin="${pc.beginPage}" end="${pc.endPage }">
						<a href="<c:url value='/notices/list?page=${pageNum}'/>" class="${pc.paging.page == pageNum ? 'page-active' :  ''}">${pageNum }</a>
					</c:forEach>
						
					<c:if test="${pc.next }">
						<a href="/coffeebreak/notices/list?page=${pc.endPage +1}" class="pager-next">다음</a>
					</c:if>
					
					<!-- 
					<c:forEach var="b" items="pc" >	
						<a href="/coffeebreak/notices/list?page=${Math.floor(pc.articleTotalCount/10) }" class="pager-last">마지막</a>
					</c:forEach>
					 -->
					<c:if test="${user.account eq 'admin' }">
						<a href="<c:url value='/notices/write'/>" class="btn">글쓰기</a>
					</c:if>
				</div>

		</div>
	</article>
</div>

<script>
 // 글쓰기 완료시
 const result = "${msg}";
 
 if(result === "regSuccess"){
	 alert("게시물 등록이 완료되었습니다.");
 } else if(result === "delSuccess"){
	 alert("게시글 삭제가 완료되었습니다.");
 }
 
 // start JQuery
 $(function() {
	 
	 
	 // 목록 개수가 변동하는 이벤트 처리
	 $("#count-per-page .btn-page").click(function(){
		 // console.log("목록 버튼이 클릭됨 !");
		 // console.log($(this).val()); // 여기의 this는 click의 주체가 되는 객체
		 let count = $(this).val();
			const keyword = "${param.keyword}";
			const condition = "${param.condition}";
			location.href="/coffeebreak/notices/list?page=1&countPerPage=" + count 
							+ "&keyword=" + keyword
							+ "&condition=" + condition;
	 });
	 
	 // 검색 버튼 
	 $("#searchBtn").click(function(){
		console.log("검색 버튼 클릭"); 
		const keyword = $("#conditionTemp").val();
		console.log("검색어 : " + keyword);
		
		location.href="/coffeebreak/notices/list?keyword="+keyword;
	 });
	 
	 // 엔터키 입력 이벤트
	 $("#conditionTemp").keydown(function (key) {
		 
	        if(key.keyCode == 13){//키가 13이면 실행 (엔터는 13)
	        	$("#searchBtn").click();
	        }
	 
	    });
	
 }); // end JQery
</script>
<%@ include file="../include/footer.jsp"%>