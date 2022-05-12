package com.spring.coffeebreak.common;

public class PageVO {
	private Integer page;//요청 페이지
	private Integer countPerPage;//페이지당 게시물의 수
	
	//초기 접속시 설정
	public PageVO() {
	this.page=1;
	this.countPerPage=3;
	}
	
	//전달받은 페이지 번호 DB의 Limit절에 맞는 숫자로 변환하기(페이지 시작점)
	public Integer getPageStart() {
		return (this.page-1)*this.countPerPage;
	}

	public Integer getPage() {
		return page;
	}

	public void setPage(Integer page) {
		this.page=page;
		//이상하게 세팅될것을 미리 차단
		if(page<=0) {
		this.page = 1;
		return;
		}
		
	}

	public Integer getCountPerPage() {
		return countPerPage;
	}

	public void setCountPerPage(Integer countPerPage) {
		if(countPerPage<=0 || countPerPage>3) {
			this.countPerPage=3;
			return;
		}		
		this.countPerPage = countPerPage;
	}
	
	
}
