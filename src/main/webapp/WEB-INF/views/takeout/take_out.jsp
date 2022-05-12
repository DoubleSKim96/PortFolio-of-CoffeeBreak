<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../include/header.jsp" />

<style>
.page-active {
	background-color: black;
	color: #fff;
}

.detail-btn {
	display: inline-block;
	width: 80px;
	height: 32px;
	font-size: 14px;
	margin-top: 15px;
	line-height: 32px;
	text-align: center;
	color: #fff;
	background-color: #888888;
	margin-right: 10px;
}

.ordered_detail_wrap {
	position: absolute;
	z-index: 1;
	left: 50%;
	top: 40%;
	width: 600px;
	height: 300px;
	background-color: white;
}

.detail_header {
	text-align: center;
	font-size: 40px;
	border-bottom: 1px solid black;
	padding: 20px 0 20px 0;
}

.detail_body {
	display: flex;
}

.detail_body>div:not(:last-child) {
	border-right: 1px solid gray;
}

.left_wrap, .right_wrap {
	padding-left: 40px;
	padding-top: 20px;
	flex: 1;
}

.market_name {
	padding-bottom: 10px;
	font-weight: bold;
	font-size: 30px;
}

.market_event {
	color: red;
	font-size: 15px;
	padding-bottom: 10px;
}

#takeout-btn {
	width: 200px;
	height: 70px;
	background-color: red;
	color: white;
	font-size: 15px;
}

.right_wrap>div {
	font-size: 15px;
	padding-bottom: 10px;
}

.right_wrap>div>span:first-child {
	padding-right: 20px;
}

.market_addr_info {
	padding-left: 29px
}

.exit-btn {
	position: absolute;
	right: 0%;
	top: 0%;
	width: 20px;
	height: 20px;
	background-color: red;
}

</style>



<div class="wrap_all">
	<div class="wrap_title">
		<section>
			<span class="select_way1">매장검색</span> 
		</section>
	</div>

	
	<div class="store_map_area">
		<!--좌측 창 -->
		<!-- 일단 지역검색탭 구현 -->
		<div class="store_search_wrap">
			<div class="select_tab">
				<ul>
					<li>매장 검색</li>
				</ul>
			</div>

			<!-- api 이용해야 할 듯 -->
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

			<c:if test="${list.size()<=0}">
				<span style="font-weight: bold; font-size: 30px;">검색결과가 없습니다.</span>
			</c:if>

			<ul class="store_list">
				<c:if test="${list.size()>0}">
					<c:forEach var="mar" items="${list}" varStatus="status">
						<li>
							<dl>
								<dt>
									<span id="market" style="font-weight: bold">${mar.marketDetailAddress}</span>
									<br> <br> <span class="tel">${mar.marketTel1}-${mar.marketTel2}-${mar.marketTel3}</span>
								</dt>

								<dd class="address">${mar.marketRoadAddress}</dd>

								<dd class="hash">
									<span>[고객감사]방문포장 1+1이벤트 </span>
								</dd>
							</dl>
							<div class="promotion_icon1"></div>
							<div class="promotion_icon2"></div> 
							<input type="hidden" id="marketResultX" value="${mar.marketResultX}" />
							<input type="hidden" id="marketResultY" value="${mar.marketResultY}" />
							<div class="btn_wrap">
								<button class="detail-btn" id="detail-btn_${mar.marketRegNo}">상세보기</button>
								<a href="<c:url value='/menu/all'/>">방문포장</a>
							</div>
						</li>
						
						
<!-- 여기부터 상세정보창 -->
<div class="ordered_detail_wrap" id="wrap_${mar.marketRegNo}">
	<div class="detail_header">매장 상세정보</div>
	<button class="exit-btn" id="exit-btn_${mar.marketRegNo}">X</button>
	<div class="detail_body">
		<div class="left_wrap">
			<div class="market_name">
				<h3>${mar.marketDetailAddress}</h3>
			</div>
			<div class="market_event">방문포장시 30%할인</div>
			<div class="order_btn">
				<button id="takeout-btn">포장주문</button>
			</div>
		</div>


		<div class="right_wrap">
			<div class="market_tel_wrap">
				<span class="market_tel">전화번호</span> <span class="market_tel_num">${mar.marketTel1}-${mar.marketTel2}-${mar.marketTel3}</span>
			</div>

			<div class="market_addr_wrap">
				<span class="market_addr">주소</span> <span class="market_addr_info">${mar.marketRoadAddress}</span>
			</div>

			<div class="market_running_time_wrap">
				<span class="market_running_time">영업시간</span> <span
					class="market_running_time_info">${mar.marketRunningTime}</span>
			</div>

			<div class="market_location_wrap">
				<span class="market_location">위치정보</span> <span
					class="market_location_info">${mar.marketLocationInfo}</span>
			</div>

			<div class="market_parkinglot_wrap">
				<span class="market_parkinglot">주차정보</span> <span
					class="market_parkinglot_info">불가능</span>
			</div>

			<div class="market_detail_info_wrap">
				<span class="market_detail">특이사항</span> <span
					class="market_detail_info">${mar.marketDetailInfo}</span>
			</div>
		</div>
	</div>
</div>
<script>
//상세정보 모달
$(function(){
$("#wrap_${mar.marketRegNo}").hide();
	var dbMarketRegNo=${mar.marketRegNo};

	$("#detail-btn_${mar.marketRegNo}").click(function() {
			$("#wrap_${mar.marketRegNo}").fadeIn();
				
			$("#exit-btn_${mar.marketRegNo}").click(function() {
				$("#wrap_${mar.marketRegNo}").fadeOut();

			});

			$("#takeout-btn").click(function() {
				location.href = "menu/all";
			});		
});
});
</script>
<!-- 상세정보창 끝 -->
					</c:forEach>
				</c:if>


			</ul>
			<!-- 페이징 처리 부분  -->
			<ul class="for_paging"
				style="position: absolute; bottom: 80px; display: flex">
				<!-- 이전버튼 -->
				<c:if test="${pc.prevBtn}">
					<li class="page-item"><a class="page-link"
						href="<c:url value='/takeout/take_out${pc.makeURI(pc.beginPage-1)}'/>"
						style="background-color: skyblue; margin-top: 0; height: 40px; color: white; border: 0px solid #f78f24; opacity: 0.8">이전</a>
					</li>
				</c:if>
				<!-- 페이지버튼 -->
				<c:forEach var="pageNum" begin="${pc.beginPage}" end="${pc.endPage}">
					<li class="page-item"><a
						href="<c:url value='/takeout/take_out${pc.makeURI(pageNum)}'/>"
						class="page-link ${(pc.paging.page==pageNum)?'page-active':''}"
						style="margin: 10px 0 0 10px; padding: 5px 10px 5px 10px; height: 40px; border: 1px solid skyblue; font-size: 15px;">${pageNum}</a>
					</li>
				</c:forEach>

				<!-- 다음버튼 -->
				<c:if test="${pc.nextBtn}">
					<li class="page-item"><a class="page-link"
						href="<c:url value='/takeout/take_out${pc.makeURI(pc.endPage+1)}'/>"
						style="background-color: #ff52a0; margin-top: 0; height: 40px; color: white; border: 0px solid #f78f24; opacity: 0.8">다음</a>
					</li>
				</c:if>
			</ul>

			<!-- 페이징 처리 끝 -->

		</div>
		<!-- 우측 창(지도) -->
		<div class="store_map" id="store_map" style="z-index: 0;"></div>
		<script
			src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
		<script
			src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f59103990999e5ef23964c4f2517a1a4&libraries=services"></script>


		<script>
 		
 		//DB의 좌표들
 		var dbResultX=$('#marketResultX').val();
 		var dbResultY=$('#marketResultY').val();
 		console.log(dbResultX);
 		console.log(dbResultY);
 		
 		var mapContainer = document.getElementById('store_map'), // 지도를 표시할 div 
 		  mapOption = { 
 		        center: new kakao.maps.LatLng(dbResultY, dbResultX), // 지도의 중심좌표
 		        level: 4 // 지도의 확대 레벨
 		    };

 		

 		var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

 	// 마커가 표시될 위치입니다 /DB좌표 투입
 	var markerPosition  = new kakao.maps.LatLng(dbResultY, dbResultX); 

 	// 마커를 생성합니다
 	var marker = new kakao.maps.Marker({
 	    position: markerPosition
 	});

 
 	// 마커가 지도 위에 표시되도록 설정합니다
 	marker.setMap(map);

 		
 		</script>

	</div>

</div>


<script>
//start jQuery
$(function(){
	
	//검색버튼 이벤트처리
	$(".search_img").click(function(){
		console.log("검색버튼 클릭됨");
		const keyword=$(".searching_box").val();
		console.log("검색어:"+keyword);
	
		const condition=$(".market_condition option:selected").val();//checkbox는 checked
		
		location.href="take_out?keyword="+keyword+"&condition="+condition;
	});
	
	//엔터키 입력 이벤트
	$(".searching_box").keydown(function (key){
		if(key.keyCode==13){//키가 13이면 실행(엔터는 13)
			$(".search_img").click();
		}
	});
	
	

	});//end jQuery
</script>
<jsp:include page="./modal_for_market.jsp" />
<jsp:include page="../include/footer.jsp" />