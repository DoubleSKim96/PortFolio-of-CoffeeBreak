package com.spring.coffeebreak.notice.commons;

public class PageVO {

	private Integer page; // 사용자가 요청한 페이지 번호를 갖는 필드
	private Integer countPerPage; // 한 페이지당 들어갈 게시물 수

	// pageVO 객체가 생성될 때 페이지 번호를 1로 생성해라.
	public PageVO() {
		this.page = 1;
		this.countPerPage = 10;
	}
	// 클라이언트가 전달한 페이지번호를 데이터베이스의 LIMIT절에 맞는 숫자로 변환.
	public Integer getPageStart() {
		return (this.page -1) * this.countPerPage;
	}
	// getter 메서드가 꼭 필드에 연관될 필요가 없다.
	
	public Integer getPage() {
		return page;
	}

	public void setPage(Integer page) {
		
		if(page <= 0) {
			this.page = 1;
			return;
		}
		this.page = page;
	}

	public Integer getCountPerPage() {
		return countPerPage;
	}

	public void setCountPerPage(Integer countPerPage) {
		
		if(countPerPage <= 0 || countPerPage > 50) {
			this.countPerPage = 10;
			return;
		}
		this.countPerPage = countPerPage;
	}
	@Override
	public String toString() {
		return "PageVO [page=" + page + ", countPerPage=" + countPerPage + "]";
	}

}
