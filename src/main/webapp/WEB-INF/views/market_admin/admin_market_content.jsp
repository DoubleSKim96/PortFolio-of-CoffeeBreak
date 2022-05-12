<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="../include/header.jsp"/>

<style>
	.list-btn{
	padding: 9.8px 10.75px 9.8px 10.75px; width:50px;height: 40px; color: black; border: 1px solid #388E3C; opacity: 0.8"
	}
	.wrap_left_right{
	display:flex;
	width:1100px;
	height:650px;
	}
	.wrap_left_box{
	flex:5;
	border:1px solid black;
	
	}

	.wrap_left_box>div>label{
	font-size:20px;
	font-weight:bold;
	
	padding:10px 0 10px 10px;
	}
	
	.wrap_left_box>div>input{
	margin:10px 0 10px 0;
	}

	.wrap_right_box{
	flex:7;
	border:1px solid black;
	}
	.market-control{
		
	}
</style>

<div class="wrap_all">
	
	<div class="wrap_title">
 		<section>
 			<span class="select_way1">매장 주소관리</span>
 		</section>
 	</div>
 	<div class="wrap_left_right">
 	<div class="wrap_left_box">
 	
	<input type="hidden" id="marketResultX" value="${mar.marketResultX}" />
	<input type="hidden" id="marketResultY" value="${mar.marketResultY}" />
	
	<div>
		<label>매장명</label>
		<input type="text" class="market-control" name="marketDetailAddress" value="${mar.marketDetailAddress}" readonly/>
	</div>
	
	<div>
		<label>전화번호</label>
		<div class="tel-num-area" style="display:flex;line-height:45px;">
		<input type="text" class="market-control" name="marketTel1" value="${mar.marketTel1}" readonly/><h3>-</h3>
		<input type="text" class="market-control" name="marketTel2" value="${mar.marketTel2}" readonly/><h3>-</h3>
		<input type="text" class="market-control" name="marketTel3" value="${mar.marketTel3}" readonly/>
		</div>
	</div>
	
	<div>
		<label>지번주소</label>
		<input type="text" class="market-control" name="marketJibunAddress" value="${mar.marketJibunAddress}" readonly/>
	</div>
	
	<div>
		<label>도로명주소</label>
		<input type="text" class="market-control" name="marketRoadAddress" value="${mar.marketRoadAddress}" readonly/>
	</div>
	
	<div>
		<label>상세정보</label>
		<input type="text" class="market-control" name="marketDetailInfo" value="${mar.marketDetailInfo}" readonly/>
	</div>

	<div>
		<label>영업시간</label>
		<input type="text" class="market-control" name="marketRunningTime" value="${mar.marketRunningTime}" readonly/>
	</div>
	
	<div>
		<label>위치정보</label>
		<input type="text" class="market-control" name="marketLocationInfo" value="${mar.marketLocationInfo}" readonly/>
	</div>
	
	<div class="btn_area" >
	 <button id="modal-open" class="modify-btn" 
			style="background-color: orange; margin: 10px 10px 0px 5px; width:50px;height: 40px; color: white; border: 0px solid #388E3C; opacity: 0.8">수정</button>
	 
	<span>
	<a class="list-btn" id="list-btn" href="<c:url value='/market_admin/admin_market'/>">목록</a>
	</span>		
	</div>
	
	</div>
	
	
	<div class="wrap_right_box">
		<!-- 우측 창(지도) -->
		<div class="store_map" id="store_map" style="z-index: 1;width:100%;height:100%"></div>
		<script
			src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
		<script
			src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f59103990999e5ef23964c4f2517a1a4&libraries=services"></script>


		<script>
 		
 		//DB의 좌표들
 		var dbResultX=$('#marketResultX').val();
 		var dbResultY=$('#marketResultY').val();
 		
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
</div>

<!-- 수정을 위한 우편번호 모달 -->
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
		width:100%;
		height:1600px;
		z-index:1;
	}

	.modal{
		position:absolute;
		left:35%;top:10%;
		width:500px;
		height:500px;
		background:#fff;
		border-radius: 10px;
	}

	.closing-btn{
		background-color: red;
		float: right;
		padding:10px 10px 10px 10px;
	}
	
	.tel_num{
	display:flex;
	line-height:30px;
	}
	
</style>

<!-- 주소입력 Modal -->
 			<div class="modal-wrap">
                   <div  class="modal">
                    <div class="modal-title">
                        <div class="pop-top">
                            <div class="pop-title">
                                <button class="closing-btn"><h3>X</h3></button>
                                <h3>정보 수정</h3>
                            </div>
                        </div>
                    </div>

                    <div class="modal-content">
                    <form action="<c:url value='/market_admin/modify'/>" method="post">
                        <div class="type-addr">
                        	<div>
                            <input type="text" name="marketPostcode" id="postcode" placeholder="우편번호" value="${mar.marketPostcode}" readonly>
							<input type="button" onclick="sample_for_execDaumPostcode()" value="우편번호 찾기">
							<input type="text" id="roadAddress" name="marketRoadAddress" placeholder="도로명주소" value="${mar.marketRoadAddress}" readonly>
							<input type="text" id="jibunAddress" name="marketJibunAddress" placeholder="지번주소" value="${mar.marketJibunAddress}" readonly>
							<span id="guide" style="color:#999;display:none"></span>
							<input type="text" id="detailAddress" name="marketDetailAddress" placeholder="매장명" value="${mar.marketDetailAddress}">
							<input type="text" id="extraAddress" name="marketExtraAddress" placeholder="참고항목" value="${mar.marketExtraAddress}" readonly>
							<input type="hidden" id="resultX" name="marketResultX" value="${mar.marketResultX}">
							<input type="hidden" id="resultY" name="marketResultY" value="${mar.marketResultY}">
							<input type="hidden" name="marketRegNo" value="${mar.marketRegNo}"/>
							</div>
							<div class="tel_num">
							<input type="text" id="marketTel1" name="marketTel1" value="${mar.marketTel1}"><h1>-</h1>
							<input type="text" id="marketTel2" name="marketTel2" value="${mar.marketTel2}"><h1>-</h1>
							<input type="text" id="marketTel3" name="marketTel3" value="${mar.marketTel3}">
							</div>
							<input type="text" id="marketDetailInfo" name="marketDetailInfo" placeholder="상세정보" value="${mar.marketDetailInfo}"/>
							<input type="text" id="marketRunningTime" name="marketRunningTime" placeholder="영업시간" value="${mar.marketRunningTime}"/>
							<input type="text" id="marketLocationInfo" name="marketLocationInfo" placeholder="위치정보" value="${mar.marketLocationInfo}"/>
                            <input type="submit" value="확인">
                        </div>
                        </form>

                    </div>
                    		<div id="map" style="width:0px;height:0px;margin-top:10px;display:none"></div>
                </div>
               </div>

     <!-- 다음 주소 script -->       
<script>
    var mapContainer = document.getElementById('map'), // 지도를 표시할 div
        mapOption = {
            center: new daum.maps.LatLng(37.537187, 127.005476), //지도 중심좌표
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


    function sample_for_execDaumPostcode() {
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
                $("#modal-open").click(function(){
                    $(".modal-wrap").fadeIn();
					                  
                });
                $(".closing-btn").click(function(){
                    $(".modal-wrap").fadeOut();
                    
                });

                 </script>






<jsp:include page="../include/footer.jsp"/>