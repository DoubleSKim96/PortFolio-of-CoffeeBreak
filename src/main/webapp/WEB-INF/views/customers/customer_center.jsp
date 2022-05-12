<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/customer.css'/>">
<div class="customer_all">
	<div class="customer_title">
		<section>
			<span class="cus_1">고객센터</span>
			<span class="cus_2">홈 > <a href="/coffeebreak">고객센터 </a>> 자주하는 질문</span>
		</section>
		<br>
		<br>
		<span class="cus_3">자주하는 질문</span> | 
		<span class="cus_4">온라인 신문고</span>
		<br>
		<br>
		<hr size=3 color="black">
		
		
		<div class="top">
		<p>커피에 대한 궁금증을 바로 확인하실 수 있습니다.</p>
		<p class="txt_faq">
		커피 고객만족센터 빵빵빵-빵빵빵-빵빵빵빵
		</p>
			<div class="customer_search">
				<div class="form-item">
					<div class="select-type2">
						<select id="ctgSelect" name="ctgSelect" class="selected">
							<option value="title">제목</option>
							<option value="contents">내용</option>
							<option value="all">제목+내용</option>
						</select>
					</div>
				</div>
				<div class="form-item">
					<input type="text" id="ctgText" name="ctgText" placeholder>
					<input type="hidden" id="condition" name="condition" class="i_text" value>
				</div>
				<div class="form-item">
					<button type="submit" class="btn-search" onclick="ctgSearch()">
					<img src="<c:url value='/images/icons/search.png'/>" width=50.8px height=40px>
					</button>
					
				</div>
			</div>
		<hr>
		
		</div>
		<div class="middle-table">
			<ul class="middle_list">
				<li class="active"><a href="#">피자 주문하기</a></li>
				<li><a href="#">주문확인</a></li>
				<li><a href="#">포장 주문</a></li>
				<li><a href="#">할인 / 쿠폰</a></li>
				<li><a href="#">상품권 / 선물</a></li>
				<li><a href="#">퀵오더</a></li>
				<li><a href="#">회원 / 로그인</a></li>
				<li><a href="#">기타</a></li>	
			</ul>
			<br>
			<br>
			<br>
			
			<hr size=3 color="black">

		</div>

		<div class="accordion">
			<input type="radio" name="accordion" id="answer01">
			<label for="answer01">결제수단에 현장결제를 선택할 수 없어요.<em></em></label>
			<div><p>피자선물하기, 비대면안전배달, DPS(드라이빙 픽업 서비스) 등 이용 시에는 도미노페이 또는 미리결제를 통해 결제를 해주셔야 하며 현장결제(현장카드결제, 현장현금결제)는 불가능합니다.</p>
			</div>
			<input type="radio" name="accordion" id="answer02">
			<label for="answer02">e쿠폰(쇼핑몰 쿠폰) 주문시 메뉴 변경은 불가능 한가요?<em></em></label>
			<div><p>e-쿠폰 이용 시 해당 메뉴 외 메뉴 구성 변경이 불가능 하며, 추가 메뉴를 주문할 수 없습니다.
					<br/>1회 주문시 쿠폰은 4개까지 이용 가능합니다. 
					<br/>쿠폰 번호 입력 후 조회하면, 메뉴 확인이 가능합니다.
					<br/>
					<br/>단종된 메뉴의 e쿠폰을 보유하신 경우 구매처를 통하여 환불해 주시기 바랍니다.
					<br/>
					<br/>
					</p>
			</div>
			<input type="radio" name="accordion" id="answer03">
			<label for="answer03">음료만 주문도 가능한가요?<em></em></label>
			<div><p>음료는 피자나 사이드디시와 함께 주문 시 도미노피자의 메뉴를 좀 더 맛있게 드실 수 있도록 제공하는 메뉴로, 음료만 단독 주문은 불가합니다. 
					<br/>피자 1판당 음료 2개, 사이드디시 1개당 음료 1개 구매 가능합니다.</p>
			</div>
			<input type="radio" name="accordion" id="answer04">
			<label for="answer04">예약주문만 가능한 경우는 왜 그런가요?<em></em></label>
			<div><p>배달사원부족, 주문폭주 등으로 부득이 하게 예약주문만 가능한 경우가 있습니다. 이 경우 매장이나 콜센터(1577-3082)로 전화하셔도 예약주문만 가능하기 때문에 고객님의 많은 양해 
					<br/>부탁 드립니다. 또한, 매장 오픈시간 전이나, 영업 종료 후에는 예약 주문만 가능합니다.
					<br/>
					<br/>또한, 매장 오픈시간 이전이나, 마감 이후에는 예약 주문만 이용 가능합니다.</p>
			</div>
			<input type="radio" name="accordion" id="answer05">
			<label for="answer05">결제수단에 현장결제를 선택할 수 없어요.<em></em></label>
			<div><p>피자선물하기, 비대면안전배달, DPS(드라이빙 픽업 서비스) 등 이용 시에는 도미노페이 또는 미리결제를 통해 결제를 해주셔야 하며 현장결제(현장카드결제, 현장현금결제)는 불가능합니다.</p>
			</div>
		</div>
	</div>
</div>


<%@ include file="../include/footer.jsp"%>