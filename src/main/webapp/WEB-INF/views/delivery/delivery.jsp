<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ page import="com.spring.coffeebreak.signup.model.SignUpVO" %>
<%
	SignUpVO user=(SignUpVO)session.getAttribute("user");
	String account=user.getAccount();//input type hidden에 넣으려고함
%>
<style>
	.pop-top{
		width:100%;
		height: 70px;
		background-color: skyblue;
		line-height: 70px;
	}

	.pop-top .pop-title{
		text-align: center;
		}


	.modal-wrap{
		position: absolute;
		background:rgba(0,0,0,0.5);
		left:0; right:0; top:0;bottom:0;
		display:flex;
		
	}

	.modal{
	 	position:absolute;
		left:35%;top:20%;
		width:400px;
		height:350px;
		background:#fff;
		border-radius: 10px;
	}

	.closing-btn{
		background-color: red;
		float: right;
		padding:10px 10px 10px 10px;
	}
	
</style>

<jsp:include page="../include/header.jsp" />

<div class="wrap_all">
	 <div class="wrap_title">
 		<section>
 			<span class="select_way1">주문방법 선택</span>
 			<c:if test="${addr.size()<5}">
 			<span class="select_way2"><button id="add-popup">주소 등록</button></span>
 			</c:if>
 			
 			<c:if test="${addr.size()>=5}">
 			<div class="optional_ment">
                       *배달주소 등록 불가(최대 5개).
                </div>	
 			</c:if>
 		</section>
 	</div>
 
 
 	<div class="order_way">
 		<div><a href="<c:url value='/delivery/delivery'/>">배달 주문</a></div>
 		<div><a href="<c:url value='/takeout/take_out'/>">포장 주문</a></div>
 	</div>

	<div class="text_link_area">
		<span class="delivery_up">
		<i class="coffee_cup"></i>밖에서 커피먹고 싶을 땐?
		</span>
		
		<span style="font-weight:800">COFFEE SPOT 배달</span>
	</div>
	
		
	<div class="address_list">
	<!-- 등록된 주소가 없을 때-->
		<ul>
			<c:if test="${addr.size()<=0}">
			<li>
				<div class="no_store">
					<p class="enter_address">
						<i></i>배달주소를 등록해주세요
					</p>				
				<button class="add_link" id="add-modal" >+&nbsp;배달주소 등록</button>
				</div> 
			</li>
			</c:if>
			
			<!-- 등록된 주소가 있을 때 -->
			<c:if test="${addr.size()>0}">
			<c:forEach var="addr" items="${addr}">
			<li>
				<div class="no_store">
				<form action="<c:url value='/delivery/delAddr'/>" method="post">
					<table class="enter_address">
					<!-- 표로 바꿀예정 -->
						<tr>
						<!-- 주소정보 및 회원정보 보내야함 -->
						<td>${addr.regNo}&nbsp;&nbsp;</td>
						<td style="padding-left:100px; text-align:left;font-weight:normal;font-size:17px;">
						<a href="<c:url value='/menu/all'/>"> ${addr.jibunAddress} / ${addr.roadAddress}</a>
						</td>
						<td> &nbsp;</td>
						<!-- 그저 삭제를 위한 것 -->
						<td><input type="hidden" name="regNo" value="${addr.regNo}"/></td>
						<td><input type="submit" class="del_address_btn" id="del-address-btn" value="삭제" onclick="return confirm('삭제하시겠습니까?')"></td>
						</tr>
					</table>
					</form>
				</div> 
				
			</li>
			</c:forEach>
			
			</c:if>
			
		</ul>	
		 <div class="wrap_for_paging">
                    <div class="optional_ment">
                       *배달주소는 최대 5개까지 등록 가능합니다.
                    </div>	
         </div>
	</div>
</div>


<!-- 주소입력 Modal -->
 			<div class="modal-wrap">
                   <div  class="modal">
                    <div class="modal-title">
                        <div class="pop-top">
                            <div class="pop-title">
                                <button class="closing-btn"><h3>X</h3></button>
                                 <h3>주소 입력</h3>
                            </div>
                        </div>
                    </div>

                    <div class="modal-content">
                    <form action="<c:url value='/delivery/addrSub'/>" method="post">
                        <div class="type-addr">
                            <div class="type-addr">
                            <input type="text" name="postcode" id="postcode" placeholder="우편번호" readonly>
							<input type="button" onclick="sample5_execDaumPostcode()" value="우편번호 찾기"><br>
							<input type="text" id="roadAddress" name="roadAddress" placeholder="도로명주소" readonly>
							<input type="text" id="jibunAddress" name="jibunAddress" placeholder="지번주소" readonly>
							<span id="guide" style="color:#999;display:none"></span>
							<input type="text" id="detailAddress" name="detailAddress" placeholder="상세주소">
							<input type="text" id="extraAddress" name="extraAddress" placeholder="참고항목" readonly>
							<input type="hidden" id="resultX" name="resultX">
							<input type="hidden" id="resultY" name="resultY">
							<input type="hidden" id="account" name="account" value="<%=account%>"/>
                            <input type="submit" value="확인">
                        </div>
                        </div>
                        </form>

                    </div>
                    		<div id="map" style="width:0px;height:0px;margin-top:10px;display:none"></div>
                </div>
               </div>
        <!-- 다음 주소 script -->       
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f59103990999e5ef23964c4f2517a1a4&libraries=services"></script>
<script>
    var mapContainer = document.getElementById('map'), // 지도를 표시할 div
        mapOption = {
            center: new daum.maps.LatLng(37.537187, 127.005476), // 지도의 중심좌표
            level: 5 // 지도의 확대 레벨
        };

    //지도를 미리 생성
    var map = new daum.maps.Map(mapContainer, mapOption);
    //주소-좌표 변환 객체를 생성
    var geocoder = new daum.maps.services.Geocoder();
    //마커를 미리 생성
    var marker = new daum.maps.Marker({
        position: new daum.maps.LatLng(37.537187, 127.005476),
        map: map
    });


    function sample5_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {

                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('postcode').value = data.zonecode;
                document.getElementById("roadAddress").value = roadAddr;
                document.getElementById("jibunAddress").value = data.jibunAddress;
               
                
                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                if(roadAddr !== ''){
                    document.getElementById("extraAddress").value = extraRoadAddr;
                } else {
                    document.getElementById("extraAddress").value = '';
                }

                var guideTextBox = document.getElementById("guide");
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                    guideTextBox.style.display = 'block';
                } else {
                    guideTextBox.innerHTML = '';
                    guideTextBox.style.display = 'none';
                }
                // 주소로 상세 정보를 검색
                geocoder.addressSearch(data.address, function(results, status) {
                    // 정상적으로 검색이 완료됐으면
                    if (status === daum.maps.services.Status.OK) {

                        var result = results[0]; //첫번째 결과의 값을 활용

                        // 해당 주소에 대한 좌표를 받아서
                        var coords = new daum.maps.LatLng(result.y, result.x);
                        // 지도를 보여준다.
                        mapContainer.style.display = "block";
                        map.relayout();
                        
                        //해당 주소에 대한 좌표를 input hidden에다 넣겠다!
                        document.getElementById("resultX").value = result.x
                		document.getElementById("resultY").value = result.y
                        
                        // 지도 중심을 변경한다.
                        map.setCenter(coords);
                        // 마커를 결과값으로 받은 위치로 옮긴다.
                        marker.setPosition(coords)
                    }
                });
            }
        }).open();
    }
</script>
         <!-- 다음 주소 script 끝 -->      
               
               
               
               <script>
               
               //모달
                $(".modal-wrap").hide();
                $("#add-popup").click(function(){
                    $(".modal-wrap").fadeIn();
                });
                $(".closing-btn").click(function(){
                    $(".modal-wrap").fadeOut();
                });
                
                //모달 하나더
                 $(".modal-wrap").hide();
                $("#add-modal").click(function(){
                    $(".modal-wrap").fadeIn();
                });
                $(".closing-btn").click(function(){
                    $(".modal-wrap").fadeOut();
                });
                
                
                //주소 등록성공시
                const result="${msg}";
                if(result==="insertSuccess"){
                	alert("주소 등록이 완료되었습니다.");
                }else if(result==="delSuccess"){//삭제성공시
                	alert("삭제 성공하였습니다.");
                }
				
               
                
                 </script>

<jsp:include page="../include/footer.jsp" />
