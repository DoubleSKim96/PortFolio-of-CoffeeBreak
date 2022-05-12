package com.spring.coffeebreak.cart.model;

public class CartVO {

	// menu_cart 테이블 속성
	private Integer cartId;
	private String account;
	private Integer menuId;
	private Integer menuCount;
	private Integer checkedSizePrice;
	private String checkedSize;
	
	// menu 테이블 속성
	private Integer menuCode;
	private String menuName;
	private String menuImage;
	private String menuDescription;
	
	public Integer getCartId() {
		return cartId;
	}
	public void setCartId(Integer cartId) {
		this.cartId = cartId;
	}
	public String getAccount() {
		return account;
	}
	public void setAccount(String account) {
		this.account = account;
	}
	public Integer getMenuId() {
		return menuId;
	}
	public void setMenuId(Integer menuId) {
		this.menuId = menuId;
	}
	public Integer getMenuCount() {
		return menuCount;
	}
	public void setMenuCount(Integer menuCount) {
		this.menuCount = menuCount;
	}
	public Integer getMenuCode() {
		return menuCode;
	}
	public void setMenuCode(Integer menuCode) {
		this.menuCode = menuCode;
	}
	public String getMenuName() {
		return menuName;
	}
	public void setMenuName(String menuName) {
		this.menuName = menuName;
	}
	public Integer getCheckedSizePrice() {
		return checkedSizePrice;
	}
	public void setCheckedSizePrice(Integer checkedSizePrice) {
		this.checkedSizePrice = checkedSizePrice;
	}
	public String getMenuImage() {
		return menuImage;
	}
	public void setMenuImage(String menuImage) {
		this.menuImage = menuImage;
	}
	public String getMenuDescription() {
		return menuDescription;
	}
	public void setMenuDescription(String menuDescription) {
		this.menuDescription = menuDescription;
	}
	public String getCheckedSize() {
		return checkedSize;
	}
	public void setCheckedSize(String checkedSize) {
		this.checkedSize = checkedSize;
	}
	@Override
	public String toString() {
		return "CartVO [cartId=" + cartId + ", account=" + account + ", menuId=" + menuId + ", menuCount=" + menuCount
				+ ", checkedSizePrice=" + checkedSizePrice + ", checkedSize=" + checkedSize + ", menuCode=" + menuCode
				+ ", menuName=" + menuName + ", menuImage=" + menuImage + ", menuDescription=" + menuDescription + "]";
	}
}
