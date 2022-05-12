package com.spring.coffeebreak.signup.model;

import java.util.Date;

public class SignUpVO {
	
	private String name;
	private String account;
	private String password;
	private String phoneNum;
	private String email;
	private String sessionId;
	private Date limitTime;
	
	public String getSessionId() {
		return sessionId;
	}
	public void setSessionId(String sessionId) {
		this.sessionId = sessionId;
	}
	public Date getLimitTime() {
		return limitTime;
	}
	public void setLimitTime(Date limitTime) {
		this.limitTime = limitTime;
	}

	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAccount() {
		return account;
	}
	public void setAccount(String account) {
		this.account = account;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}

	public String getPhoneNum() {
		return phoneNum;
	}
	public void setPhoneNum(String phoneNum) {
		this.phoneNum = phoneNum;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	@Override
	public String toString() {
		return "SignUpVO [name=" + name + ", account=" + account + ", password=" + password + ", phoneNum=" + phoneNum
				+ ", email=" + email + ", sessionId=" + sessionId + ", limitTime=" + limitTime + "]";
	}

	


	
	
	
}