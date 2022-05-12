<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/certi.css' />">

<div class=certi_all>
	<div class="certi_content">
		<section id="content_certi">
			<div class="sub_type">
				<div class="cert_inner">
					<div class="certi_title_wrap">
						<h2 class="certi_title">회원가입</h2>
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
							<div class="info-text-wrap">
								<a href="#" class="notice-text">본인인증 안내</a>
								<strong>반갑습니다.</strong>
								<p>
									"회원가입을 위해서는 본인인증이 필요합니다."
									<br>
									"회원가입은 아동의 개인정보 보호를 위해 만 14세 이상만 가능합니다."
								</p>
								<div class="btn-wrap">
								<a href="<c:url value='/signups/signup'/>" class="btn-type v4">휴대전화 인증 </a>
								<a href="<c:url value='/signups/signup'/>" class="btn-type v4">아이핀 인증</a>
								</div>	
							</div>
						</div>
					</article>
				</div>
			</div>	
		</section>
		<hr size=3 color="black">
		
	</div>	
</div>


<%@ include file="../include/footer.jsp"%>