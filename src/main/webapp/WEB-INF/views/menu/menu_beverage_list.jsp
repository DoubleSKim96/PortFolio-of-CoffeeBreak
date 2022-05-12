<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="title-wrap-center">
	<h3 class="title-type">음료</h3>
</div>
<div class="menu-list">
	<ul>
		<c:forEach var="c" items="${menu }">
			<c:if test="${c.menuCateCode == 200}">
				<li>
					<div class="product-image">
						<a href="<c:url value='/menu/content?menuCode=${c.menuCode }'/>"> <img class="imageLoad"
							src="<c:url value='/images/upload/${c.menuImage }'/>">
						</a>
					</div>
					<div class="product-content">
						<div class="product-name">${c.menuName }</div>
					</div>
					<div class="price">
						<div class="price-box">
							<span class="price"> <span class="size_s">S</span>
								${c.menuPrice_S }원
							</span> <span class="price"> <span class="size_m">M</span>
								${c.menuPrice_M }원
							</span> <span class="price"> <span class="size_l">L</span>
								${c.menuPrice_L }원
							</span>
						</div>
					</div>
				</li>
			</c:if>
		</c:forEach>
	</ul>
</div>