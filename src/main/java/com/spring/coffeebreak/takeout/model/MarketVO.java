package com.spring.coffeebreak.takeout.model;

import java.util.Date;

public class MarketVO {

	private String marketTel1;//전화번호 1
	private String marketTel2;//전화번호 2
	private String marketTel3;//전화번호 3
	
	private Integer marketRegNo;
	private String marketPostcode;//우편번호
	private String marketRoadAddress;//도로명 주소
	private String marketJibunAddress;//지번 주소
	private String marketDetailAddress;//상세주소
	private String marketExtraAddress;//참고항목
	private Double marketResultX;//X좌표
	private Double MarketResultY;//Y좌표
	private Date MarketRegDate;
	private String marketDetailInfo;//상세정보
	private String marketRunningTime;//영업시간
	private String marketLocationInfo;//위치정보
	
	
	
	
	public String getMarketRunningTime() {
		return marketRunningTime;
	}
	public void setMarketRunningTime(String marketRunningTime) {
		this.marketRunningTime = marketRunningTime;
	}
	public String getMarketLocationInfo() {
		return marketLocationInfo;
	}
	public void setMarketLocationInfo(String marketLocationInfo) {
		this.marketLocationInfo = marketLocationInfo;
	}
	public String getMarketDetailInfo() {
		return marketDetailInfo;
	}
	public void setMarketDetailInfo(String marketDetailInfo) {
		this.marketDetailInfo = marketDetailInfo;
	}
	public String getMarketTel1() {
		return marketTel1;
	}
	public void setMarketTel1(String marketTel1) {
		this.marketTel1 = marketTel1;
	}
	public String getMarketTel2() {
		return marketTel2;
	}
	public void setMarketTel2(String marketTel2) {
		this.marketTel2 = marketTel2;
	}
	public String getMarketTel3() {
		return marketTel3;
	}
	public void setMarketTel3(String marketTel3) {
		this.marketTel3 = marketTel3;
	}
	public Integer getMarketRegNo() {
		return marketRegNo;
	}
	public void setMarketRegNo(Integer marketRegNo) {
		this.marketRegNo = marketRegNo;
	}
	public String getMarketPostcode() {
		return marketPostcode;
	}
	public void setMarketPostcode(String marketPostcode) {
		this.marketPostcode = marketPostcode;
	}
	public String getMarketRoadAddress() {
		return marketRoadAddress;
	}
	public void setMarketRoadAddress(String marketRoadAddress) {
		this.marketRoadAddress = marketRoadAddress;
	}
	public String getMarketJibunAddress() {
		return marketJibunAddress;
	}
	public void setMarketJibunAddress(String marketJibunAddress) {
		this.marketJibunAddress = marketJibunAddress;
	}
	public String getMarketDetailAddress() {
		return marketDetailAddress;
	}
	public void setMarketDetailAddress(String marketDetailAddress) {
		this.marketDetailAddress = marketDetailAddress;
	}
	public String getMarketExtraAddress() {
		return marketExtraAddress;
	}
	public void setMarketExtraAddress(String marketExtraAddress) {
		this.marketExtraAddress = marketExtraAddress;
	}
	public Double getMarketResultX() {
		return marketResultX;
	}
	public void setMarketResultX(Double marketResultX) {
		this.marketResultX = marketResultX;
	}
	public Double getMarketResultY() {
		return MarketResultY;
	}
	public void setMarketResultY(Double marketResultY) {
		MarketResultY = marketResultY;
	}
	public Date getMarketRegDate() {
		return MarketRegDate;
	}
	public void setMarketRegDate(Date marketRegDate) {
		MarketRegDate = marketRegDate;
	}

	
	
		
}
