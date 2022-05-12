package com.spring.coffeebreak.common;

public class SearchVO extends PageVO{
	//	private Integer page;
	//	private Integer countPerPage;

	private String keyword;
	private String condition;
	//	private PageVO paging;

	//기본값 공백설정
	public SearchVO() {
		this.keyword="";
		this.condition="";
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

