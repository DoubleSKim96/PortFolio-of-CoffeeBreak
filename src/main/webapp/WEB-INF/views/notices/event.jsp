<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/notice.css' />">

<div class="notice_all">
	<div class="notice">
		<h2 class="page_title">공지사항</h2>
		<div class="depth_area">
			<ol>
				<li>
					<a href="/coffeebreak">홈</a>
				</li>
				<li>
					<a href="/coffeebreak/notices/notice">공지사항</a>
				</li>
				<li>
					<strong>
						<a href="/coffeebreak/notices/event">이벤트</a>
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
						<a href="/coffeebreak/notices/notice">공지사항</a>
					</li>
					<li>
						<a a href="/coffeebreak/notices/event">이벤트</a>
					</li>
				</ul>
			</div>
		</div>
		<div class="notice_wrap">
			<form id="searchForm" name="searchForm" action="notice.jsp" method="POST">
				<input type="hidden" id="type" name="type" value="N">
				<input type="hidden" id="pageNo" name="pageNo" value="1">
				<div class="form_group">
					<div class="form_item">
						<div class="select_type2">
						<select id="search" name="search">
							<option value="subject">제목</option>
							<option value="content">내용</option>
							<option value="all">제목+내용</option>
						</select>
						</div>
					</div>
					<div class="form_item" style="width: 428px; margin-left: 5px;">
						<input type="text" id="conditionTemp" name="conditionTemp" placeholder>
						<input type="hidden" id="condition" name="condition" class="i_text" value>
					</div>
					<div class="form_item">
						<button type="button" class="btn_search" onclick="fncSearch();">
						"검색"
						</button>
					</div>
				</div>
				<div class="table_type3">
					<p class="side">총 1건</p>
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
							<th>제목</th>
							<th>등록일</th>
							<th>조회수</th>
						</tr>
						</thead>
						<tbody>
							<tr>
							<td>1</td>
							<td>
								<a href="#none" onclick="#">
									<p>설날맞이 커피 1 + 3 이벤트 !</p>
								</a></td>
							<td>2022-02-04</td>
							<td>28</td>
						</tbody>
					</table>
				</div>
				<div class="pagination">
					<a href="#" class="pager-first">처음</a>
					<a href="#" class="pager-prev">이전</a>
					<ol>
						<li>
						<a href="javascript:;" onclick="javascript:paging(1); return false;">1</a>
						</li>
					</ol>
					<a href="#" class="pager-next">다음</a>
					<a href="#" class="pager-last" onclick="javascript:paging(41); return false;">마지막</a>
				</div>
			</form>
		</div>
	</article>
</div>

<%@ include file="../include/footer.jsp"%>