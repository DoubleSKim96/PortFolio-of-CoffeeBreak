<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../include/header.jsp" />


<div class="wrap_all">
	 <div class="wrap_title">
 		<section>
 			<span class="select_way1">주문내역 조회</span> 			
 		</section>
 	</div>
 	

	<div class="text_link_area">
		<span class="delivery_up">
		<i class="coffee_cup"></i>주문하신 내역이에요
		</span>
		
		<span style="font-weight:800">COFFEE SPOT 배달</span>
	</div>
	
		
	<div class="address_list">
	<!-- 등록된 주소가 없을 때-->
		<ul>
			
			<li>
				<div class="no_store">
					<p class="enter_address">
						<i></i>주문하신 내역이 없어요
					</p>				
				</div> 
			</li>

		</ul>	
		 
	</div>
</div>



<jsp:include page="../include/footer.jsp" />