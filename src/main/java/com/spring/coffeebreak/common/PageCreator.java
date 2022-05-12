package com.spring.coffeebreak.common;

import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

public class PageCreator {

	private PageVO paging;
	private Integer totalCount;//등록된 총 게시물 갯수
	private Integer beginPage; //시작페이지 번호
	private Integer endPage;//끝페이지 번호
	private boolean prevBtn;//이전버튼 활성화 여부
	private boolean nextBtn;//다음 버튼 활성화 여부
	
	//한 화면에 보여질 페이지 숫자의 수
	private final Integer displayPageNum=10;

	//페이징 알고리즘 수행메서드
	private void calcPage() {
		//보정전 끝페이지 구하기
		endPage=(int)Math.ceil(paging.getPage()/(double)displayPageNum)*displayPageNum;
		
		//시작페이지 번호 구하기
		beginPage=(endPage-displayPageNum)+1;
		
		//현재 시작페이지가 1이다? 이전버튼은 false
		prevBtn=(beginPage==1)? false:true;
		
		//마지막 페이지인지 확인 후 다음버튼
		nextBtn=(totalCount<=(endPage*paging.getCountPerPage()))?false:true;
		
		//재보정 해야해?
		if(!isNextBtn()) {
			//끝페이지 재보정
			endPage=(int)Math.ceil(totalCount/(double)paging.getCountPerPage());
		}
	}
	
	//URI 파라미터를 쉽게 만들어주는 유틸메서드 선언
		public String makeURI(Integer page) {
			UriComponents ucp = UriComponentsBuilder.newInstance()
								.queryParam("page", page)
								.queryParam("countPerPage", paging.getCountPerPage())
								.queryParam("keyword",((SearchVO)paging).getKeyword())//.이 형변환보다 우선순위
								.queryParam("condition",((SearchVO)paging).getCondition())
								.build();
			
			return ucp.toUriString();
		}
	
	
	public PageVO getPaging() {
		return paging;
	}

	public void setPaging(PageVO paging) {
		this.paging = paging;
	}

	public Integer getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(Integer totalCount) {
		this.totalCount = totalCount;
		//게시물 수 세팅하면서 동시DB처리
		calcPage();
	}

	public Integer getBeginPage() {
		return beginPage;
	}

	public void setBeginPage(Integer beginPage) {
		this.beginPage = beginPage;
	}

	public Integer getEndPage() {
		return endPage;
	}

	public void setEndPage(Integer endPage) {
		this.endPage = endPage;
	}

	public boolean isPrevBtn() {
		return prevBtn;
	}

	public void setPrevBtn(boolean prevBtn) {
		this.prevBtn = prevBtn;
	}

	public boolean isNextBtn() {
		return nextBtn;
	}

	public void setNextBtn(boolean nextBtn) {
		this.nextBtn = nextBtn;
	}

	public Integer getDisplayPageNum() {
		return displayPageNum;
	}
	
	
	
}
