<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="<c:url value='/jquery/jquery-3.6.0.js'/>"></script>
<script src="<c:url value='/js/index.js'/>"></script>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/insert_menu.css'/>">
<title>Insert title here</title>
</head>
<%@ include file="../include/header.jsp"%>
	<div id="container">
		<section id="content">
			<div class="inner-box">
				<div class="title-wrap">
					<h2>메뉴 등록</h2>
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
								<strong>메뉴 등록</strong>
							</li>
						</ol>
					</div>
				</div>
				<article class="menu-insert-wrap">
					<form action="<c:url value='/menu/insertMenu'/>" method="post" id="insertForm" enctype="multipart/form-data">
						<div class="menu-input-area">
							<dl>
								<dt class="parameter">메뉴 코드</dt>
								<dd>
									<div class="inputbox-v1">
										<input name="menuCode" />
									</div>
								</dd>
							</dl>
							<dl>
								<dt class="parameter">카테고리 코드</dt>
								<dd>
									<div class="inputbox-v1">
										<input name="menuCateCode" />
									</div>
								</dd>
							</dl>
							<dl>
								<dt class="parameter">카테고리 이름</dt>
								<dd>
									<div class="inputbox-v1">
										<input name="menuCateName" />
									</div>
								</dd>
							</dl>
							<dl>
								<dt class="parameter">메뉴 이름</dt>
								<dd>
									<div class="inputbox-v1">
										<input name="menuName" />
									</div>
								</dd>
							</dl>
							<dl>
								<dt class="parameter">메뉴 이름 (영문)</dt>
								<dd>
									<div class="inputbox-v1">
										<input name="menuNameEng" />
									</div>
								</dd>
							</dl>
							<dl>
								<dt class="parameter">가격 (S)</dt>
								<dd>
									<div class="inputbox-v1">
										<input name="menuPrice_S" />
									</div>
								</dd>
							</dl>
							<dl>
								<dt class="parameter">가격 (M)</dt>
								<dd>
									<div class="inputbox-v1">
										<input name="menuPrice_M" />
									</div>
								</dd>
							</dl>
							<dl>
								<dt class="parameter">가격 (L)</dt>
								<dd>
									<div class="inputbox-v1">
										<input name="menuPrice_L" />
									</div>
								</dd>
							</dl>
							<dl class="textarea">
								<dt class="parameter">메뉴 설명</dt>
								<dd>
									<div class="inputbox-v2">
										<textarea rows="3" name="menuDescription"></textarea>
									</div>
								</dd>
							</dl>
							<dl>
								<dt class="parameter">메뉴 용량</dt>
								<dd>
									<div class="inputbox-v1">
										<input name="menuVolume" />
									</div>
								</dd>
							</dl>
							<dl>
								<dt class="parameter">1회 제공량</dt>
								<dd>
									<div class="inputbox-v1">
										<input name="menuCal" />
									</div>
								</dd>
							</dl>
							<dl>
								<dt class="parameter">포화지방</dt>
								<dd>
									<div class="inputbox-v1">
										<input name="menuFat" />
									</div>
								</dd>
							</dl>
							<dl>
								<dt class="parameter">단백질</dt>
								<dd>
									<div class="inputbox-v1">
										<input name="menuPro" />
									</div>
								</dd>
							</dl>
							<dl>
								<dt class="parameter">나트륨</dt>
								<dd>
									<div class="inputbox-v1">
										<input name="menuNatrium" />
									</div>
								</dd>
							</dl>
							<dl>
								<dt class="parameter">당류</dt>
								<dd>
									<div class="inputbox-v1">
										<input name="menuSugar" />
									</div>
								</dd>
							</dl>
							<dl>
								<dt class="parameter">카페인</dt>
								<dd>
									<div class="inputbox-v1">
										<input name="menuCaffeine" />
									</div>
								</dd>
							</dl>
							<dl class="textarea">
								<dt class="parameter">비고</dt>
								<dd>
									<div class="inputbox-v2">
										<textarea rows="3" name="menuNote"></textarea>
									</div>
								</dd>
							</dl>
							<dl>
								<dt class="parameter">상품 이미지</dt>
								<dd>
									<div class="inputbox-v3">
										<input class="input-file" value="파일선택" disabled="disabled" />
										<label for="ex_filename">업로드</label>
										<input class="input-file-hidden" id="ex_filename" type="file" name='uploadFile' />
									</div>
								</dd>
							</dl>
							<div class="menu-inputbtn">
								<ul>
									<li>
										<button id="cancelBtn" class="btn">취소</button>
									</li>
									<li>
										<button id="insertBtn" class="btn insert_btn">등록</button>
									</li>
								</ul>
							</div>
						</div>
					</form>
				</article>
			</div>

		</section>
	</div>
<script>
	//업로드 버튼 디자인
	$(document).ready(function() {
		var fileTarget = $('.inputbox-v3 .input-file-hidden');
		
		fileTarget.on('change', function() {
			if(window.FileReader) {
				var filename = $(this)[0].files[0].name;
			}
			else {
				var filename = $(this).val().split('/').pop().split('\\').pop();
			}
			
			$(this).siblings('.input-file').val(filename);
		});
	});
	
</script>

<%@ include file="../include/footer.jsp"%>