<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Document</title>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/menu_info.css'/>">
<link rel="stylesheet" type="text/css" href="<c:url value='/css/form.css'/>">
<link rel="stylesheet" type="text/css" href="<c:url value='/css/text.css'/>">
</head>
<%@ include file="../include/header.jsp"%>

<div id="container">
	<section id="content">
		<div class="inner-box">
			<div class="title-wrap">
				<h2 class="title-menu">${menu.menuCateName }</h2>
				<div class="depth-area">
					<ol>
						<li><a href="<c:url value='/'/>">홈</a></li>
						<li><span> > </span> <a href="<c:url value='/menu/all'/>">
								메뉴 </a></li>
						<li><span> > </span> <a href="<c:url value='/menu/all'/>">
								<strong>${menu.menuCateName }</strong>
						</a></li>
						<li><span> > </span> <strong>${menu.menuName }</strong></li>
					</ol>
				</div>

				<article class="menu-list-area menu-detail-area">
					<div class="inner-box">
						<div class="menu-nav-wrap">
							<div class="menu-nav">
								<ul>
									<li class="active">
										<a id="all" href="<c:url value='/menu/all'/>">
											전체
										</a>
									</li>
									<li>
										<a id="coffee" href="<c:url value='/menu/coffee'/>">
											커피
										</a>
									</li>
									<li>
										<a id="beverage" href="<c:url value='/menu/beverage'/>">
											음료
										</a>
									</li>
									<li>
										<a id="dessert" href="<c:url value='/menu/dessert'/>">
											디저트
										</a>
									</li>
								</ul>
							</div>
						</div>
					</div>
					<div class="menu-info inner-box">
						<div class="img-wrap">
							<div class="view-box">
								<img class="product-image" src="<c:url value='/images/upload/${menu.menuImage }'/>">
							</div>
						</div>
						<div class="detail-wrap">
							<div class="menu-box">
								<div class="title-box">
									<h3 class="title coffee">${menu.menuName }</h3>
									<div class="name-eng">
										<span>${menu.menuNameEng }</span>
									</div>
								</div>
								<div class="menu-decription">
									<div class="title-box">
										<p class="description">${menu.menuDescription }</p>
									</div>
								</div>
							</div>
							<div class="menu-info-box">
								<div class="menu-info-wrap menu-detail">
									<div class="menu-info-wrap1">
										<div class="menu-info-head">
											<p class="title-info">제품 영양 정보</p>
										</div>
										<c:if test="${menu.menuCateCode == 100 || menu.menuCateCode == 200 }">
											<div class="menu-volume coffee">
												<div class="info-text" id="menu-volume">Small /
													${menu.menuVolume }ml (12 fl oz)</div>
											</div>
										</c:if>
										<c:if test="${menu.menuCateCode == 300 }">
											<div class="menu-volume other">
												<div class="info-text" id="menu-volume">
													${menu.menuVolume }(g)</div>
											</div>
										</c:if>
									</div>
									<div class="menu-info-wrap2">
											<ul>
												<li class="kcal">
													<dl>
														<dt>1회 제공량 (kcal)</dt>
														<dd>${menu.menuCal }</dd>
													</dl>
												</li>
												<li class="fat">
													<dl>
														<dt>포화지방 (g)</dt>
														<dd>${menu.menuFat }</dd>
													</dl>
												</li>
												<li class="protein">
													<dl>
														<dt>단백질 (g)</dt>
														<dd>${menu.menuPro }</dd>
													</dl>
												</li>
											</ul>
											<ul>
												<li class="natrium">
													<dl>
														<dt>나트륨 (mg)</dt>
														<dd>${menu.menuNatrium }</dd>
													</dl>
												</li>
												<li class="sugar">
													<dl>
														<dt>당류 (g)</dt>
														<dd>${menu.menuSugar }</dd>
													</dl>
												</li>
												<li class="caffeine">
													<dl>
														<dt>카페인 (mg)</dt>
														<dd>${menu.menuCaffeine }</dd>
													</dl>
												</li>
											</ul>
										</div>
									<div class="menu-info-wrap3">
										<div class="menu-note">${menu.menuNote }</div>
									</div>
								</div>
							</div>
							<div class="select-box">
								<div class="step-wrap">
									<div class="title-wrap2">
										<div class="title-type2">사이즈 선택</div>
									</div>
									<c:if test="${menu.menuCateCode == 100 || menu.menuCateCode == 200}">
										<div class="size-box">
											<div id="box1"class="chk-box2 selected">
												<input type="radio" id="Large" name="size" value="${menu.menuPrice_L }" checked> 
												<label class="checkbox" for="Large"></label> 
												<label for="Large">L ${menu.menuPrice_L }원</label>
											</div>
											<div id="box2" class="chk-box2">
												<input type="radio" id="Medium" name="size" value="${menu.menuPrice_M }"> 
												<label class="checkbox" for="Medium"></label> 
												<label for="Medium">M ${menu.menuPrice_M }원</label>
											</div>
											<div id="box3" class="chk-box2">
												<input type="radio" id="Small" name="size" value="${menu.menuPrice_S }"> 
												<label class="checkbox" for="Small"></label> 
												<label for="Small">S ${menu.menuPrice_S }원</label>
											</div>
										</div>
									</c:if>
									<c:if test="${menu.menuCateCode == 300 }">
										<div class="size-box">
											<div id="box1"class="chk-box2 selected">
												<input type="radio" id="Large" name="size" value="${menu.menuPrice_S }" checked> 
												<label class="checkbox" for="Large"></label> 
												<label for="Large">${menu.menuPrice_S }원</label>
											</div>
										</div>
									</c:if>
								</div>
								<div class="step-wrap">
									<div class="title-wrap2">
										<div class="title-type2">수량 선택</div>
									</div>
									<div class="quantity-box">
										<button class="btn-minus goods"></button>
										<input type="number" class="opt_qty" value="1" id="qty" max="9" readonly />
										<button class="btn-plus goods"></button>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="step-wrap step-order" style="position: fixed; bottom: 0px;">
						<div class="order-wrap inner-box">
							<c:if test="${user.account == 'admin' && user != null}">
							<div class="modify-menu">
								<div id="modify-menu-btn">
									<div class="btn-wrap">
										<a id="btn-modify" class="btn-type" href="<c:url value='/menu/modifyMenu?menuCode=${menu.menuCode }'/>">
											메뉴 수정
										</a>
									</div>
								</div>
							</div>
							</c:if>
							<div class="add-menu">
								<div id="add-menu-btn">
									<div class="btn-wrap">
										<a id="btn-add" class="btn-type">
											메뉴 추가
										</a>
									</div>
								</div>
							</div>
							<div class="total-price">
								<div id="login-order-btn">
									<span>총 금액</span>
									<strong class="total-price-sum"></strong>
									<div class="btn-wrap">
										<a id="btn-basket" href="#" class="btn-type">
											주문하기
										</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</article>
			</div>
		</div>
	</section>
</div>
<script>
	
	const result = "${msg}";
	if (result === "modify_success") {
		alert("게시글 수정이 완료되었습니다.");
	}
	
	
	$(document).ready(function() {
		
		
		var price = $(":radio:checked").val();
		var totalPrice = price * quantity;
		console.log(price);
		console.log(quantity);
		
		// 사이즈 선택
		$("input[id='Large']").click(function() {
			$("div[id='box1']").attr({
				'class' : 'chk-box2 selected'
			});
			$(":radio[id='Large']").attr('checked', true);
			price = $(":radio:checked").val();
			$("div[id='box2']").attr({
				'class' : 'chk-box2'
			});
			$(":radio[id='Medium']").attr('checked', false);

			$("div[id='box3']").attr({
				'class' : 'chk-box2'
			});
			$(":radio[id='Small']").attr('checked', false);
			
			//사이즈 선택 시 총금액에 반영
			console.log("L Size" + price);
			price = $(":radio:checked").val();
			totalPrice = quantity * price;
			$(".total-price-sum").text(totalPrice.toLocaleString());
		});
		$("input[id='Medium']").click(function() {
			$("div[id='box2']").attr({
				'class' : 'chk-box2 selected'
			});
			$(":radio[id='Medium']").attr('checked', true);
			price = $(":radio:checked").val();
			$("div[id='box1']").attr({
				'class' : 'chk-box2'
			});
			$(":radio[id='Small']").attr('checked', false);

			$("div[id='box3']").attr({
				'class' : 'chk-box2'
			});
			$(":radio[id='Large']").attr('checked', false);
			
			console.log("M Size : " + price);
			price = $(":radio:checked").val();
			totalPrice = quantity * price;
			$(".total-price-sum").text(totalPrice.toLocaleString());
		});
		$("input[id='Small']").click(function() {
			$("div[id='box3']").attr({
				'class' : 'chk-box2 selected'
			});
			$(":radio[id='Small']").attr('checked', true);
			price = $(":radio:checked").val();
			$("div[id='box2']").attr({
				'class' : 'chk-box2'
			});
			$(":radio[id='Medium']").attr('checked', false);

			$("div[id='box1']").attr({
				'class' : 'chk-box2'
			});
			$(":radio[id='Large']").attr('checked', false);
			
			console.log("S Size : " + price);
			price = $(":radio:checked").val();
			totalPrice = quantity * price;
			$(".total-price-sum").text(totalPrice.toLocaleString());
		});
		$(".total-price-sum").text(totalPrice.toLocaleString());
	});
	
	//수량 변경
	let quantity = $(".opt_qty").val();
	$(".btn-plus").on("click", function() {
		$(".opt_qty").val(++quantity);
		
		//수량 변경 시 총금액에 반영
		price = $(":radio:checked").val();
		totalPrice = quantity * price;
		$(".total-price-sum").text(totalPrice.toLocaleString());
	});
	$(".btn-minus").on("click", function() {
		if(quantity > 1) {	// 최소 수량 설정
			$(".opt_qty").val(--quantity);
			
			price = $(":radio:checked").val();
			totalPrice = quantity * price;
			$(".total-price-sum").text(totalPrice.toLocaleString());
		}
	});
	
	//서버로 전송할 데이터
	const form = {
			account : '${user.account}', 
			menuId : '${menu.menuId}', 
			menuCount : '',
			checkedSizePrice : '',
			checkedSize : ''
	}

	//장바구니 추가 버튼
	$("#btn-add").on("click", function(e) {
		form.menuCount = $(".opt_qty").val();
		form.checkedSizePrice = $(":radio:checked").val();
		form.checkedSize = $(":radio:checked").attr("id");
		$.ajax({
			url : '<c:url value="/cart/add"/>',
			type : 'POST',
			data : form,
			success: function(result) {
				cartAlert(result);
			}
		});
	});
	function cartAlert(result) {
		if(result == '0') {
			alert("장바구니에 추가를 하지 못했습니다.");
		} else if(result === '1') {
			alert("장바구니에 추가되었습니다.");
		} else if(result === '2') {
			alert("장바구니에 이미 추가되어 있습니다.");
		} else if(result === '5') {
			alert("로그인이 필요합니다.");
		}
	}
</script>