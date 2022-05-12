package com.spring.coffeebreak.notice.commons;

public class SearchVO extends PageVO {

	/* page , countPerPage는 PageVO가 가지고 있다 따라서 상속(extends PageVO)을 사용해서 하위구조로 만들면 된다.
	private Integer page;
	private Integer countPerPage;
	*/
	private String keyword;
	private String condition;
	
	public SearchVO() {
		this.keyword = "";
		this.condition = "";
		// 기본값은 검색을 하지 않을 수도 있기 때문에 공백으로 둔다.
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public String getCondition() {
		return condition;
	}
	public void setCondition(String condition) {
		this.condition = condition;
	}
	
	
}
