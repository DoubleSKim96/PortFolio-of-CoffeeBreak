<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ include file="../include/header.jsp"%>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/signup.css' />">
<style>
.body_main{
	margin-top: 250px;
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<div class=signup_all>
	<div class="signup_content">
		<section id="content_signup">
			<div class="sub_type">
				<div class="signup_inner">
					<div class="signup_title_wrap">
						<h2 class="signup_title">회원가입</h2>
						<div class="depth-area">
							<ol>
								<li>
									<a href="/coffeebreak">홈 </a>
								</li>
								<li>
									<strong> > 회원가입</strong>
								</li>	
							</ol>
						</div>
					</div>
					<article class="join-area">
						<div class="join-step1">
							<div class="step-list">
								<li>
								01 본인인증
								</li>
								<li>
								02 개인정보입력
								</li>
								<li>
								03 가입완료
								</li>
							</div>
							</div>
							</article>
							</div>
							</div>
							</section>
							</div>
							
							
<form action="#" name="sign-in" method="post" id="writerForm">		
	<div class="signUp_body">
		<div class="signup_div">
			<label for="name">이름</label> 
			<span id="nameChk"></span>
			<input class="signup_in" type="text" name="name" id="name" maxlength="14" 
			required="required" aria-required="true" placeholder="이름을 입력하세요" autocomplete="off"/>
		</div>
		
		<div class="signup_div">
			<label for="id">아이디</label> 
			<span id="idcheck"></span>
			<input class="signup_in" type="text" name="account" id="id" maxlength="14" 
			required="required" aria-required="true" placeholder="아이디를 입력하세요"
			autocomplete="off"/>
			<input type="hidden"  onclick="id_check();" /><br/>
			
		</div>
		<div class="signup_div">
			<label for="pw">비밀번호</label>
			<span id="pwChk"></span>
			<input class="signup_in" type="password" size="17" maxlength="20" id="pw" 
						name="password" maxlength="20" required="required" aria-required="true" placeholder="8~16자 영문대소문자, 숫자, 특수문자 사용가능" />
		</div>
		
		<div class="signup_div">
			<label for="pw2">비밀번호 확인</label> 
			<span id="pwChk2"></span>
			<input class="signup_in" type="password" size="17" maxlength="20" id="pw2" 
						name="pw2" maxlength="20" required="required" aria-required="true" placeholder="비밀번호가 일치해야합니다." />
		</div>
		
		<div class="signup_div">
			<label for="phoneNum">휴대전화</label>
			<span id="phoneChk"></span>
			<input class="signup_in" id="phoneNum" size="17"name="phoneNum" maxlength="11" size="17" aria-required="true" placeholder="연락처 입력" />
		</div>
		
		<div class="signup_div">
			<label for="email">이메일</label>
			<span id="emailChk"></span>
			<input class="signup_in" type="email" name="email" id="email" size="17" aria-required="true" required="required" aria-required="true"
						placeholder="ex) XXX@XXXX.XXX"/> 
		</div>
		
		<div class="signup_div">
			<label>약관 및 광고성 <br><br> 정보 수신 전체동의</label>
			<input class="signup_agree" type="checkbox">
			<span style="margin-bottom: 30px">동의하기</span> 
				<div>
					<p style="margin-left: 200px; font-size: 15px;"  >- 위 항목에는 필수 및 선택정보에 대한 동의를 모두 포함하고 있으며, 개별적으로도 동의 여부를 선택하실 수 있습니다.</p><br>
					<p style="margin-left: 200px; font-size: 15px;">- 선택항목에 대한 동의를 거부하시는 경우에도 서비스 이용이 가능합니다.</p><br>
					<p style="margin-left: 200px; font-size: 15px; color: red">이메일, 문자(SMS 등) 모두 수신 동의 시 피자 방문포장 40% 할인 쿠폰을 드립니다.</p>
				</div>
		</div>
		
		<div class="signup_div">
			<label>약관 전체동의</label>
				<div id="checkWrap">
			 		<label for="check01"><input type="checkbox" id="check01" />전체 동의하기</label>
			 		<div id="checkWrap2">
						<label for="check02"><input type="checkbox" id="check02" style="width: 20px; height: 20px;"/>개인정보 수집 및 이용 동의(필수) 보기</label>
						<label for="check03"><input type="checkbox" id="check03" />이용약관 동의(필수) 보기</label>
					 	<label for="check04"><input type="checkbox" id="check04" />위치기반 서비스 약관 동의(필수) 보기</label>
					 	</div>
				 </div>
		</div> 	
		</div>
		
		<div class="signup_div2">
			<button class="btn" id="signup-btn" type="button">등록</button>
			<button class="btn "type="reset">새로입력</button>
			<button class="btn cancelBtn" type="button">취소</button>
		</div>
		
</form>
</div>
	
<script type="text/javascript">
			
// 취소 버튼 처리 -> 이전 페이지 이동
	$(".cancelBtn").click(function(){
		 history.back(); 
	});

// 회원가입 전 처리 - 유효성 검사
	//$("#writerForm").submit(function(){
		  
		//  alert("회원 등록 처리");
		  
		 // submit을 무시 시킨다. 
		// return false; 
//	});
/*
// 회원가입 아이디 보내지는지 검사
	$("#signup-btn").click(function(){
		
		//아이디 정보
		const name= $("#name").val();
		console.log("name: " + name);
		
		const id= $("#id").val();
		console.log("id: " + id);
		
		const pw= $("#pw").val();
		console.log("pw: " + pw);
		
		const email= $("#email").val();
		console.log("email: " + email);
		
		const phoneNum= $("#phoneNum").val();
		console.log("phoneNum: " + phoneNum);
		
		const user = {
				name: name,
				account: id,
				password: pw,	
				phoneNum: phoneNum,
				email: email
		};
		
		$.ajax({
			type: "POST",
			url: "/coffeebreak/signups/",
			headers: {
				"Content-Type": "application/json"
			},
			dataType: "text",
			data: JSON.stringify(user),
			success: function(result){
				console.log("통신 성공 !" + result);
				if(result === "joinSuccess"){
					alert("회원가입에 성공했습니다 !");
					location.href="/coffeebreak";
				} else{
					alert("회원가입에 실패하셨습니다 !");
				}
			},
			error: function(){
				console.log("통신 실패 !");
			}
		}); // ajax - end
		
	});// ".signup-btn" end
function id_check(){
		
		const id = $("#id").val();
		console.log("id: " + id);
	
		$("#idcheck").hide();
		
		$id=$.trim($("#id").val()); 
		// alert($id);
	// 입력글자 길이 체크
	if($id.length < 4){
			$newtext='<font color="red" size="3"><b>아이디는 4글자 이상입력하세요.</b></font>';
			$("#idcheck").text('');
			// idcheck 아이디 영역 문자열을 초기화
			$("#idcheck").show();
			// idcheck 아이디 영역을 보이게 함
			$("#idcheck").append($newtext);
			// idcheck 영역에 문자열 추가
			$("#id").val('').focus();
		return false;
	}; 
	
	if($id.length > 13){
			$newtext='<font color="red" size="3"><b>아이디는13자 이하이어야 합니다.</b></font>';
			$("#idcheck").text('');
		//idcheck 아이디 영역 문자열을 초기화
			$("#idcheck").show();
		//idcheck 아이디 영역을 보이게 함.
			$("#idcheck").append($newtext);
		//idcheck영역에 문자열을 추가
			$("#id").val('').focus();
	return false;
	};
	
	// 입력글자 확인
	if(!(validate_userid($id))){
		$newtext='<font color="red" size="3"><b>아이디는 영문소문자,숫자,_조합만 가능합니다.</b></font>';
		$("#idcheck").text('');
		$("#idcheck").show();
		$("#idcheck").append($newtext);
		$("#id").val('').foucs();
	return false;
	};
	
	// 아이디 중복 확인
	$.ajax({
	type: "POST",
	url: "/coffeebreak/signups/",
	headers: {
			"Content-Type": "application/json"
		},
	data: "int",
	datatype:JSON.stringify(id),
	success: function(data){
		if(data==1){
			$newtext='<font color="red" size="3"><b>중복 아이디입니다.</b></font>';
			$("#idcheck").text('');
			$("#idcheck").show();
			$("#idcheck").append($newtext);
			$("id").val('').focus();
			return false;
		} else{ // 중복 아이디가 아니라면 
			$newtext='<font color="blue" size="3"><b>사용가능한 아이디입니다.</b></font>';
			$("#idcheck").text('');
			$("#idcheck").show();
			$("#idcheck").append($newtext);
			$("pw").focus();
		}
	},
	error:function(){
		// 비동기식 아작스로 서버 DB 데이터를 가져오지 못할 경우 에러 발생할 때 호출되는 함수
		alert("data error")
	}
	});
	}	
	

//정규표현식
function validate_userid($id){
	var pattern= new RegExp(/^[a-z0-9_]+$/);//아이디를 영문소문
	//자와 숫자 와 _조합으로 처리
	return pattern.test($id);
};
*/
</script>
<script>
$(function(){
	
	const getIdCheck= RegExp(/^[a-zA-Z0-9]{4,14}$/);
	const getPwCheck= RegExp(/([a-zA-Z0-9].*[!,@,#,$,%,^,&,*,?,_,~])|([!,@,#,$,%,^,&,*,?,_,~].*[a-zA-Z0-9])/);
	const getName= RegExp(/^[가-힣]+$/);
	const getMail = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/);
	const getPhone = /^\d{3}\d{4}\d{4}$/;
	let chk1 = false, chk2 = false, chk3 = false, chk4 = false, chk5 = false, chk6 = false;



	// 회원가입 검증
	// ID 입력값 검증
	$('#id').on('keyup', function(){
		if($("#id").val()===""){
			$('#id').css("background-color", "pink");
			$('#idcheck').html('<b style="font-size:14px;color:red;">[아이디는 필수 정보에요!]</b>');
			chk1 = false;
		}
		
		// 아이디 유효성 검사
		else if(!getIdCheck.test($("#id").val())){
			$('#id').css("background-color","pink");
			$('#idcheck').html('<b style="font-size:14px;color:red;">[영문자,숫자 4-14자]</b>');
			chk1 = false;
		}
		
		// ID 중복확인 비동기 처리
		else {
			// ID 중복확인 비동기 통신
			const id = $(this).val();
			console.log(id);
			
			$.ajax({
				type: "POST",
				url: "/coffeebreak/signups/checkId/",
				headers: {
					"Content-Type": "application/json"
				},
				dataType: "text",
				data: id,
				success: function(result){
					if(result === "OK"){
						$("#id").css("background-color", "aqua");
						$("#idcheck").html("<b style='font-size:14px; color:green;'>[아이디는 사용 가능!]</b>");
						chk1 = true;
					} else{
						$("#id").css("background-color", "pink");
						$("#idcheck").html("<b style='font-size:14px; color:red;'>[아이디가 중복됨!]</b>");
						chk1 = false;
					}
				},
				error : function(){
					console.log("통신 실패!");
				}
			});
		}
	});
	
	// 패스워드 입력값 검증 
	$('#pw').on('keyup',function(){
		// 비밀번호 공백 확인
		const pw = $(this).val();
			console.log(pw);
		
			
		if($("#pw").val() === ""){
			$('#pw').css("background-color", "pink");
			$('#pwChk').html('<b style="font-size:14px;color:red;">[패스워드는 필수정보!]</b>');
			chk2 = false;
		}
		// 비밀번호 유효성 검사
		else if(!getPwCheck.test($("#pw").val()) || $("#pw").val().length < 8){
			$('#pw').css("background-color", "pink");
			$('#pwChk').html('<b style="font-size:14px;color:red;">[특수문자 포함 8자이상]</b>');
			chk2 = false;
		} else{
			$('#pw').css("background-color", "aqua");
			$('#pwChk').html('<b style="font-size:14px;color:green;">[사용 가능 !]</b>');
			chk2 = true;
		}
	});
	
	// 패스워드 확인란 입력값 검증
	$('#pw2').on('keyup', function(){
		const pw2 = $(this).val();
		console.log(pw2);
		// 비밀번호 확인란 공백 확인
		if($("#pw2").val() === ""){
			$('#pw2').css("background-color", "pink");
			$('#pwChk2').html('<b style="font-size:14px;color:red;">[특수문자 포함 8자이상]</b>');
			chk3 = false;
		}
		// 비밀번호 확인란 유효성 검사
		else if($("#pw").val() != $("#pw2").val()){
			$('#pw2').css("background-color", "pink");
			$('#pwChk2').html('<b style="font-size:14px;color:green;">[비밀번호는 동일해야합니다. !]</b>');
			chk3 = false;
		} else {
			$('#pw2').css("background-color", "aqua");
			$('#pwChk2').html('<b style="font-size:14px;color:green;">[사용 가능 !]</b>');
			chk3 = true;
		}
	});
	
	// 이름 입력값 검증
	$('#name').on('keyup', function(){
		// 이름 값 공백 확인
		if($("#name").val() === ""){
			$("#name").css("background-color", "pink");
			$("#nameChk").html('<b style="font-size:14px;color:green;">[이름은 필수값입니다.]</b>')
			chk4 = false;
		} 
		// 이름값 유효성 검사
		else if(!getName.test($('#name').val())){
			$("#name").css("background-color", "pink");
			$("#nameChk").html('<b style="font-size:14px;color:green;">[잘못된 형태입니다.]</b>')
			chk4 = false;
		} else {
			$('#name').css("background-color", "aqua");
			$('#nameChk').html('<b style="font-size:14px;color:green;">[사용 가능 !]</b>');
			chk4 = true;
		}
	});
	
	// 이메일 입력값 검증
	$('#email').on('keyup', function(){
		// 이메일 값 공백 확인
		if($("#email").val() === ""){
			$("#email").css("background-color", "pink");
			$("#emailChk").html('<b style="font-size:14px;color:green;">[공백이 존재합니다.]</b>');
			chk5 = false;
		} 
		// 이메일 유효성 검사
		else if(!getMail.test($('#email').val())){
			$("#email").css("background-color", "pink");
			$('#emailChk').html('<b style="font-size:14px;color:red;">[이메일 형식이 아닙니다.]</b>');
			chk5 = false;
		} 
		// email 중복확인 비동기 처리
		else {
			// email 중복확인 비동기 통신
			const email = $(this).val();
			console.log(email);
			
			$.ajax({
				type: "POST",
				url: "/coffeebreak/signups/checkEmail/",
				headers: {
					"Content-Type": "application/json"
				},
				dataType: "text",
				data: email,
				success: function(result){
					if(result === "OK"){
						$("#email").css("background-color", "aqua");
						$("#emailChk").html("<b style='font-size:14px; color:green;'>[사용 가능]</b>");
						chk5 = true;
					} else{
						$("#email").css("background-color", "pink");
						$("#emailChk").html("<b style='font-size:14px; color:red;'>[중복된 이메일입니다.]</b>");
						chk5 = false;
					}
				},
				error : function(){
					console.log("통신 실패!");
				}
			});
		}
	});
	
	// 전화번호 넣기
	$('#phoneNum').on('keyup',function(){
		// 전화번호 값 공백 확인
		if($("#phoneNum").val() === ""){
			$("#phoneNum").css("background-color", "pink");
			$("#phoneChk").html('<b style="font-size:14px;color:green;">[공백이 존재합니다.]</b>');
			chk6 = false;
		} else if(!getPhone.test($('#phoneNum').val())){
			$("#phoneNum").css("background-color", "pink");
			$('#phoneChk').html('<b style="font-size:14px;color:green;">[옳바른 형식이 아닙니다.]</b>');
			chk6 = false;
		} 
		// 전화번호 중복확인 비동기 처리
		else {
			// 전화번호 중복확인 비동기 통신
			const phoneNum = $(this).val();
			console.log(phoneNum);
			
			$.ajax({
				type: "POST",
				url: "/coffeebreak/signups/checkPhone/",
				headers: {
					"Content-Type": "application/json"
				},
				dataType: "text",
				data: phoneNum,
				success: function(result){
					if(result === "OK"){
						$("#phoneNum").css("background-color", "aqua");
						$("#phoneChk").html("<b style='font-size:14px; color:green;'>[사용 가능]</b>");
						chk6 = true;
					} else{
						$("#phoneNum").css("background-color", "pink");
						$("#phoneChk").html("<b style='font-size:14px; color:red;'>[중복된 전화번호]</b>");
						chk6 = false;
					}
				},
				error : function(){
					console.log("통신 실패!");
				}
			});
		}
	});
	
	// 회원가입 정보 넘기기
	$("#signup-btn").click(function(){
		
		//아이디 정보
		const name= $("#name").val();
		console.log("name: " + name);
		
		const id= $("#id").val();
		console.log("id: " + id);
		
		const pw= $("#pw").val();
		console.log("pw: " + pw);
		
		const email= $("#email").val();
		console.log("email: " + email);
		
		const phoneNum= $("#phoneNum").val();
		console.log("phoneNum: " + phoneNum);
		
		const user = {
				name: name,
				account: id,
				password: pw,	
				phoneNum: phoneNum,
				email: email
		};
		
		$.ajax({
			type: "POST",
			url: "/coffeebreak/signups/",
			headers: {
				"Content-Type": "application/json"
			},
			dataType: "text",
			data: JSON.stringify(user),
			success: function(result){
				console.log("통신 성공 !" + result);
				if(result === "joinSuccess"){
					alert("회원가입에 성공했습니다 !");
					location.href="/coffeebreak";
				} else{
					alert("회원가입에 실패하셨습니다 !");
				}
			},
			error: function(){
				console.log("통신 실패 !");
			}
		}); // ajax - end
		
	});// ".signup-btn" end
	
});

// 체크박스 
window.onload = function(){
	var checkWrap = document.getElementById('checkWrap'),
        check = checkWrap.getElementsByTagName('input');
    	checkWrap.addEventListener('click', function(e){
        var target = e.target,
            checkNum = 0;
        if(target === check[0]){
            if(target.checked){
                for(var i = 1;i < check.length;i++){
                    check[i].checked = true;
                };
            }else{
                for(var i = 1;i < check.length;i++){
                    check[i].checked = false;
                };
            };
        }else{
            for(var i = 1;i < check.length;i++){
                if(check[i].checked){
                    checkNum++;
                };
            };
            if(checkNum >= check.length - 1){
                check[0].checked = true;
            }else{
                check[0].checked = false;
            };
        };
    });
};

</script>

<%@ include file="../include/footer.jsp"%>