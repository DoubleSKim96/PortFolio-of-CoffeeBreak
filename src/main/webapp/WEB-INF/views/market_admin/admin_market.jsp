<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
.pop-top {
	width: 100%;
	height: 70px;
	background-color: skyblue;
	line-height: 70px;
}

.pop-top .pop-title {
	text-align: center;
}

.modal-wrap {
	position: absolute;
	background: rgba(0, 0, 0, 0.5);
	left: 0;
	right: 0;
	top: 0;
	bottom: 0;
	display: flex;
	width: 100%;
	height: 1600px;
}

.modal {
	position: absolute;
	left: 35%;
	top: 20%;
	width: 400px;
	height: 400px;
	background: #fff;
	border-radius: 10px;
}

.closing-btn {
	background-color: red;
	float: right;
	padding: 10px 10px 10px 10px;
}

.tel_num {
	display: flex;
	line-height: 30px;
}

.page-active {
	background-color: black;
	color: #fff;
}
</style>


<jsp:include page="../include/header.jsp" />

<div class="wrap_all">
	<div class="wrap_title">
		<section>
			<span class="select_way1">매장 주소관리</span>
			<button class="select_way2" id="modal-open">매장 등록하기</button>
		</section>
	</div>


	
			<div class="searching_area">

				<input type="text" class="searching_box" value="${param.keyword}" />

				<select id="condition" class="market_condition" name="condition">
					<option value="marketDetailAddress"
						${param.condition=='marketDetailAddress'?'selected':''}>매장명
						V</option>
					<option value="marketRoadAddress"
						${param.condition=='marketRoadAddress'?'selected':''}>도로명주소
						V</option>
					<option value="marketJibunAddress"
						${param.condition=='marketJibunAddress'?'selected':''}>지번주소
						V</option>
				</select> <i class="search_img"></i>
			</div>


	<div class="address_list">
		<!-- 등록된 주소가 없을 때-->
		<ul>
			<c:if test="${addr.size()<=0}">
				<li>
					<div class="no_store">
						<p class="enter_address">
							<i></i>등록된 매장이 없어요
						</p>
						<button class="add_link" id="modal-open">+&nbsp;매장 등록</button>
					</div>
				</li>
			</c:if>

			<!-- 등록된 주소가 있을 때 --><!-- modify content부분 수정해야겠다 -->
			<c:if test="${addr.size()>0}">
				<c:forEach var="addr" items="${addr}">
					<li>
						<div class="no_store">
							<form action="<c:url value='/market_admin/deleteMarket'/>" method="post"
								id="formObj">

								<table class="enter_address">
									<tr>
										<td>${addr.marketRegNo}&nbsp;&nbsp;</td>
										<td
											style="padding-left: 100px; text-align: left; font-weight: normal; font-size: 30px;">
											${addr.marketDetailAddress}</td>
										<td>&nbsp;</td>
										<!-- 그저 삭제를 위한 것 -->
										<td><input type="hidden" name="marketRegNo"
											value="${addr.marketRegNo}" /></td>
										<td><span id="detailBtn" class="modifyBtn" ><a href="<c:url value='/market_admin/content/${addr.marketRegNo}'/>">조회</a>&nbsp;&nbsp;</span> 
										<input type="submit" class="del_address_btn" id="del-address-btn"
											value="삭제" onclick="return confirm('삭제하시겠습니까?')"></td>
									</tr>
								</table>
							</form>
						</div>
					</li>
					
				</c:forEach>
			</c:if>
		</ul>

	</div>

	<div class="paging_part">
		<!-- 페이징 처리 부분  -->
		<ul class="for_paging"
			style="display: flex; padding: 0px 0 0px -100px">
			<!-- 이전버튼 -->
			<c:if test="${pc.prevBtn}">
				<li class="page-item"><a class="page-link"
					href="<c:url value='/market_admin/admin_market${pc.makeURI(pc.beginPage-1)}'/>"
					style="background-color: skyblue; margin-top: 0; height: 40px; color: white; border: 0px solid #f78f24; opacity: 0.8">이전</a>
				</li>
			</c:if>
			<!-- 페이지버튼 -->
			<c:forEach var="pageNum" begin="${pc.beginPage}" end="${pc.endPage}">
				<li class="page-item"><a
					href="<c:url value='/market_admin/admin_market${pc.makeURI(pageNum)}'/>"
					class="page-link ${(pc.paging.page==pageNum)?'page-active':''}"
					style="margin: 10px 0 0 10px; padding: 5px 10px 5px 10px; height: 40px; border: 1px solid skyblue; font-size: 15px;">${pageNum}</a>
				</li>
			</c:forEach>

			<!-- 다음버튼 -->
			<c:if test="${pc.nextBtn}">
				<li class="page-item"><a class="page-link"
					href="<c:url value='/market_admin/admin_market${pc.makeURI(pc.endPage+1)}'/>"
					style="background-color: #ff52a0; margin-top: 0; height: 40px; color: white; border: 0px solid #f78f24; opacity: 0.8">다음</a>
				</li>
			</c:if>
		</ul>

		<!-- 페이징 처리 끝 -->

	</div>

</div>
				<script>
						$(function() {
							 
			                //수정완료시
			                const result="${msg}";
			                if(result==="modifySuccess"){
			                	alert("수정이 완료되었습니다");
			                }
			                
			              //검색버튼 이벤트처리
			            	$(".search_img").click(function(){
			            		console.log("검색버튼 클릭됨");
			            		const keyword=$(".searching_box").val();
			            		console.log("검색어:"+keyword);
			            	
			            		const condition=$(".market_condition option:selected").val();//checkbox는 checked
			            		
			            		location.href="admin_market?keyword="+keyword+"&condition="+condition;
			            	});
			              
			            	//엔터키 입력 이벤트
			            	$(".searching_box").keydown(function (key){
			            		if(key.keyCode==13){//키가 13이면 실행(엔터는 13)
			            			$(".search_img").click();
			            		}
			            	});
						});
					</script>



<jsp:include page="../takeout/modal_for_market.jsp" />

<jsp:include page="../include/footer.jsp" />
