<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div id="container">
	<section id="content">
		<div class="main">
			<article class="visual-area">
				<div class="visual-slider">
					<div class="slide-list">
						<!-- <i class="cafe"></i> -->
						<div class="inner">
							<a href="#"> 
								<i class="slide1"></i>
							</a>
						</div>
						<div class="inner">
							<a href="#"> 
								<i class="slide2"></i>
							</a>
						</div>
						<div class="inner">
							<a href="#"> 
								<i class="slide3"></i>
							</a>
						</div>
					</div>
				</div>
				<%--
				<button type="button" data-role="none" class="slick-prev"
					aria-label="Previous" role="button">"Previous"</button>
				<button type="button" data-role="none" class="slick-next"
					aria-label="Next" role="button">"Next"</button>
					 --%>
			</article>

			<article class="delivery-area">
				<div class="inner-box">
					<div class="item-wrap">
						<div class="item">
							<a href="<c:url value='/delivery/delivery'/>"> 
								<i class="icon-delievery"></i> 
								<span class="text">배달 주문</span> 
								<span class="arrow"></span>
							</a>
						</div>
						<div class="item">
							<a href="<c:url value='/takeout/take_out'/>"> 
								<i class="icon-takeout"></i> 
								<span class="text">포장 주문</span> 
								<span class="arrow"></span>
							</a>
						</div>
						<div class="item">
							<a href="<c:url value='/delivery/ordered_list'/>"> 
								<i class="icon-quick"></i> 
								<span class="text">주문 내역</span> 
								<span class="arrow"></span>
							</a>
						</div>
					</div>
				</div>
			</article>
			<article class="product-area">
				<div class="inner-box">
					<section class="section-row1">
						<a href="<c:url value='/menu/coffee' />">
							<img class="pc_ver" src="<c:url value='/images/product/coffee3.jpg'/>">
							<span class="inner-text">
								<h1>COFFEE</h1> <br><h2>신선한 원두를 사용하는 커피</h2>
							</span>
						</a>
					</section>
					<section class="section-row2">
						<div class="grid-wrap">
							<div class="beverage">
								<a href="<c:url value='/menu/beverage' />">
									<img class="pc_ver" src="<c:url value='/images/product/beverage2.jpg'/>">
									<span class="inner-text">
										<h1>VARIOUS BEVERAGE</h1> <br><h2>티, 에이드, 주스 등 다양한 메뉴</h2>
									</span>
								</a>
							</div>
							<div class="dessert">
								<a href="<c:url value='/menu/dessert' />">
									<img class="pc_ver" src="<c:url value='/images/product/icecream3.jpg'/>">
									<span class="inner-text">
										<h1>ICE CREAM / DESSERT</h1> <br><h2>달콤한 디저트</h2>
									</span>
								</a>
							</div>
						</div>
					</section>
				</div>
			</article>
		</div>
	</section>
</div>

<script src="<c:url value='/js/slidebanner.js'/>"></script>