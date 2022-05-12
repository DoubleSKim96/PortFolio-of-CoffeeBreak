<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="<c:url value='/jquery/jquery-3.6.0.js'/>"></script>
<script src="<c:url value='/js/index.js'/>"></script>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/cart.css'/>">
<link rel="stylesheet" type="text/css" href="<c:url value='/css/text.css'/>">
<title>Insert title here</title>
</head>
<%@ include file="../include/header.jsp"%>
	<div id="container">
		<section id="content">
			<div class="inner-box">
				<div class="title-wrap">
					<h2 class="title-cart">장바구니</h2>
					<div class="depth-area">
						<ol>
							<li>
								<a href="<c:url value='/'/>">홈</a>
							</li>
							<li>
								<span> > </span> 
								<a href="#">
									장바구니
								</a>
							</li>
						</ol>
					</div>
				</div>
				<article class="cart-wrap">
				<div class="cart-info-wrap">
					<div class="cart-info inner-box">
						<div class="cartlist-title-wrap">
							<div class="title-checkbox">
								<span class='title-checkbox-span'> 
									<input type="checkbox" class="title-input-checkbox" /> 
									<label class="checkbox check"></label>
								</span>
							</div>
							<div class="title-product-info">상품 정보</div>
							<div class="title-product-count">수량</div>
							<div class="title-product-price">주문 금액</div>
							<div class="title-delievery-price">배송비</div>
						</div>
						<div class="cart-table">
							<c:forEach items="${cartInfo }" var="ci">
								<div class="cart-table-list">
									<div class="hidden-info">
										<input type="checkbox" id="cart-check" class="indivisual_cart_checkbox_input" checked="checked" />
										<input type="hidden" class="indivisual_menuPrice_input" value="${ci.checkedSizePrice }" />
										<input type="hidden" class="indivisual_menuCount_input" value="${ci.menuCount }" />
										<input type="hidden" class="indivisual_totalPrice_input" value="${ci.checkedSizePrice * ci.menuCount }" />
									</div>
									<div class="cart-product-info-wrap">
										<div class="cart-product-info-wrap-innerbox">
											<a href="<c:url value='/menu/content?menuCode=${ci.menuCode }'/>"> 
												<img class="product-image" src="<c:url value='/images/upload/${ci.menuImage }'/>">
											</a>
											<div class="cart-product-subinfo">
												<a class="product-name" href="<c:url value='/menu/content?menuCode=${ci.menuCode }'/>">
													${ci.menuName }
												</a> 
												<a class="product-description" href="<c:url value='/menu/content?menuCode=${ci.menuCode }'/>">
													${ci.menuDescription }
												</a>
												<div class="product-price">
													<span class="product-price-span"> <fmt:formatNumber
															value="${ci.checkedSizePrice }" />원
													</span>
												</div>
												<div class="product-size">
													<span class="product-size-span"> 사이즈 : ${ci.checkedSize }</span>
												</div>
											</div>
										</div>
										<button class="delete-btn" data-cartid="${ci.cartId }">삭제</button>
									</div>

									<div class="cart-product-count-wrap">
										<div class="cart-product-count">
											<div class="quantity-box">
												<button class="btn-minus goods">-</button>
												<input type="number" class="opt_qty"
													value="${ci.menuCount }" id="qty" max="9" readonly />
												<button class="btn-plus goods">+</button>
											</div>
										</div>
										<%-- data- 속성의 뒤 value값은 소문자로만 작성해야한다 --%>
										<a class="quantity-modify-btn" data-cartid="${ci.cartId }">변경</a>
									</div>
									<div class="cart-product-subTotalPrice-wrap">
										<div>
											<span class="subTotalPrice"> <fmt:formatNumber
													value="${ci.checkedSizePrice * ci.menuCount }" />원
											</span>
										</div>
									</div>
									<div class="delievery-price">
										<p class="text">
											3,000원 
										</p>
										<p class="text">
											30,000원 이상 <br /> 
											구매시 무료
										</p>
									</div>
								</div>
							</c:forEach>
						</div>
					</div>
					<section class="total-wrap">
						<div class="total-wrap-innerbox">
							<div class="total-wrap-title">
								<div class="total-title-price">총 주문금액</div>
								<div class="total-title-delievery">배송비</div>
								<div class="total-title-finalPrice">총 결제금액</div>
							</div>
							<div class="total-wrap-content">
								<div class="total-content-price">
									<span class="subTotalPrice-span"></span>원
									<div>
										총
										<span class="totalCount-span"></span>
										개
									</div>
								</div>
								<div class="total-content-delievery">
									<span class="delieveryPrice-span"></span>원
								</div>
								<div class="total-content-finalPrice">
									<span class="finalTotalPrice-span"></span>원
								</div>
							</div>
						</div>
					</section>
					<div class="bottom-btn-wrap">
						<a class="return-menu-btn" href="<c:url value='/menu/all' />">메뉴 추가</a>
						<button class="order-btn">주문하기</button>
					</div>
						<!-- 수량 조정 form -->
						<form action="<c:url value='/cart/update'/>" method="post" class="quantity-update-form">
							<input type="hidden" name="cartId" class="update-cartId" /> 
							<input type="hidden" name="menuCount" class="update-menuCount" /> 
							<input type="hidden" name="account" value="${user.account }" />
						</form>

						<!-- 삭제 form -->
						<form action="<c:url value='/cart/delete' />" method="post" class="quantity-delete-form">
							<input type="hidden" name="cartId" class="delete-cartId" />
							<input type="hidden" name="account" value="${user.account }" />
						</form>
					</div>
				</article>
			</div>
		</section>
	</div>
<%@ include file="../include/footer.jsp"%>
<script>
	$(document).ready(function() {
		//수량 변경 버튼
		$(".btn-plus").on("click", function() {
			let quantity = $(this).parent("div").find("input").val();
			$(this).parent("div").find("input").val(++quantity);
		});
		$(".btn-minus").on("click", function() {
			let quantity = $(this).parent("div").find("input").val();
			if (quantity > 1) {
				$(this).parent("div").find("input").val(--quantity);
			}
		});

		//수량 수정 버튼
		$(".quantity-modify-btn").on("click", function() {
			let cartId = $(this).data("cartid");
			let menuCount = $(this).parent("div").find("input").val();
			$(".update-cartId").val(cartId);
			$(".update-menuCount").val(menuCount);
			$(".quantity-update-form").submit();
		});

		//종합 정보 섹션 정보 삽입
		setTotalInfo();
	});

	//체크 여부에 따른 종합 정보 변화
	$(".indivisual_cart_checkbox_input").on("change", function() {
		//총 주문 정보 세팅
		setTotalInfo($(".hidden-info"));
	});

	//총 주문 정보
	function setTotalInfo() {
		let checkedSizePrice = 0;	// 선택된 사이즈 가격
		let totalCount = 0;			// 수량
		let totalKind = 0;			// 총 수량
		let subTotalPrice = 0;		// 선택된 사이즈 가격 * 수량
		let delivertyPrice = 0;		// 배송비
		let finalTotalPrice = 0;	// 최종 주문 금액

		$(".hidden-info").each(	// hidden으로 받아온 값 설정
			function(index, element) {
				if ($(element).find(".indivisual_cart_checkbox_input").is(":checked") === true) {
					subTotalPrice += parseInt($(element).find(".indivisual_totalPrice_input").val());
					totalCount += parseInt($(element).find(".indivisual_menuCount_input").val());
					totalKind += 1;
				}
			});
		
		// 배송비 설정
		if (subTotalPrice >= 30000) {
			delieveryPrice = 0;
		} else if (subTotalPrice == 0) {
			delieveryPrice = 0;
		} else {
			delieveryPrice = 3000;
		}

		finalTotalPrice = subTotalPrice + delieveryPrice;	// 최종 주문 금액 설정

		//값 전달
		$(".subTotalPrice-span").text(subTotalPrice.toLocaleString());
		$(".totalCount-span").text(totalCount.toLocaleString());
		$(".delieveryPrice-span").text(delieveryPrice.toLocaleString());
		$(".finalTotalPrice-span").text(finalTotalPrice.toLocaleString());
	}

	//장바구니 삭제버튼
	$(".delete-btn").on("click", function(e) {
		e.preventDefault();
		const cartId = $(this).data("cartid");
		$(".delete-cartId").val(cartId);
		$(".quantity-delete-form").submit();
	});
</script>