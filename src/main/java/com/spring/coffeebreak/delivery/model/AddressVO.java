package com.spring.coffeebreak.delivery.model;

import java.util.Date;

public class AddressVO {

	
	private Integer regNo;//등록번호
	private String postcode;//우편번호
	private String roadAddress;//도로명 주소
	private String jibunAddress;//지번 주소
	private String detailAddress;//상세주소
	private String extraAddress;//참고항목
	private Double resultX;//X좌표
	private Double resultY;//Y좌표
	private Date regDate;
	private String account;//계정

	
	
	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	public Integer getRegNo() {
		return regNo;
	}

	public void setRegNo(Integer regNo) {
		this.regNo = regNo;
	}

	public Double getResultX() {
		return resultX;
	}

	public void setResultX(Double resultX) {
		this.resultX = resultX;
	}

	public Double getResultY() {
		return resultY;
	}

	public void setResultY(Double resultY) {
		this.resultY = resultY;
	}

	public String getPostcode() {
		return postcode;
	}

	public void setPostcode(String postcode) {
		this.postcode = postcode;
	}

	public String getRoadAddress() {
		return roadAddress;
	}

	public void setRoadAddress(String roadAddress) {
		this.roadAddress = roadAddress;
	}

	public String getJibunAddress() {
		return jibunAddress;
	}

	public void setJibunAddress(String jibunAddress) {
		this.jibunAddress = jibunAddress;
	}

	public String getDetailAddress() {
		return detailAddress;
	}

	public void setDetailAddress(String detailAddress) {
		this.detailAddress = detailAddress;
	}

	public String getExtraAddress() {
		return extraAddress;
	}

	public void setExtraAddress(String extraAddress) {
		this.extraAddress = extraAddress;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	
	
	
	
}