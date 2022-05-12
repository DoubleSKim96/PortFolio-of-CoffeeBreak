package com.spring.coffeebreak.menu.model;

import org.springframework.web.multipart.MultipartFile;

public class MenuVO {
	
	private Integer menuId;
	private Integer menuCode;
	private Integer menuCateCode;
	private String menuCateName;
	private String menuName;
	private String menuNameEng;
	private Integer menuPrice_S;
	private Integer menuPrice_M;
	private Integer menuPrice_L;
	private String menuImage;
	private MultipartFile uploadFile;
	
	//메뉴 상세 정보 추가
	private String menuVolume;
	private String menuDescription;
	private String menuCal;
	private String menuFat;
	private String menuPro;
	private String menuNatrium;
	private String menuSugar;
	private String menuCaffeine;
	private String menuNote;
	
	
	public Integer getMenuId() {
		return menuId;
	}
	public void setMenuId(Integer menuId) {
		this.menuId = menuId;
	}
	public Integer getMenuCode() {
		return menuCode;
	}
	public void setMenuCode(Integer menuCode) {
		this.menuCode = menuCode;
	}
	public Integer getMenuCateCode() {
		return menuCateCode;
	}
	public void setMenuCateCode(Integer menuCateCode) {
		this.menuCateCode = menuCateCode;
	}
	public String getMenuCateName() {
		return menuCateName;
	}
	public void setMenuCateName(String menuCateName) {
		this.menuCateName = menuCateName;
	}
	public String getMenuName() {
		return menuName;
	}
	public void setMenuName(String menuName) {
		this.menuName = menuName;
	}
	public String getMenuNameEng() {
		return menuNameEng;
	}
	public void setMenuNameEng(String menuNameEng) {
		this.menuNameEng = menuNameEng;
	}
	public Integer getMenuPrice_S() {
		return menuPrice_S;
	}
	public void setMenuPrice_S(Integer menuPrice_S) {
		this.menuPrice_S = menuPrice_S;
	}
	public Integer getMenuPrice_M() {
		return menuPrice_M;
	}
	public void setMenuPrice_M(Integer menuPrice_M) {
		this.menuPrice_M = menuPrice_M;
	}
	public Integer getMenuPrice_L() {
		return menuPrice_L;
	}
	public void setMenuPrice_L(Integer menuPrice_L) {
		this.menuPrice_L = menuPrice_L;
	}
	public String getMenuImage() {
		return menuImage;
	}
	public void setMenuImage(String menuImage) {
		this.menuImage = menuImage;
	}
	public MultipartFile getUploadFile() {
		return uploadFile;
	}
	public void setUploadFile(MultipartFile uploadFile) {
		this.uploadFile = uploadFile;
	}
	public String getMenuVolume() {
		return menuVolume;
	}
	public void setMenuVolume(String menuVolume) {
		this.menuVolume = menuVolume;
	}
	public String getMenuDescription() {
		return menuDescription;
	}
	public void setMenuDescription(String menuDescription) {
		this.menuDescription = menuDescription;
	}
	public String getMenuCal() {
		return menuCal;
	}
	public void setMenuCal(String menuCal) {
		this.menuCal = menuCal;
	}
	public String getMenuFat() {
		return menuFat;
	}
	public void setMenuFat(String menuFat) {
		this.menuFat = menuFat;
	}
	public String getMenuPro() {
		return menuPro;
	}
	public void setMenuPro(String menuPro) {
		this.menuPro = menuPro;
	}
	public String getMenuNatrium() {
		return menuNatrium;
	}
	public void setMenuNatrium(String menuNatrium) {
		this.menuNatrium = menuNatrium;
	}
	public String getMenuSugar() {
		return menuSugar;
	}
	public void setMenuSugar(String menuSugar) {
		this.menuSugar = menuSugar;
	}
	public String getMenuCaffeine() {
		return menuCaffeine;
	}
	public void setMenuCaffeine(String menuCaffeine) {
		this.menuCaffeine = menuCaffeine;
	}
	public String getMenuNote() {
		return menuNote;
	}
	public void setMenuNote(String menuNote) {
		this.menuNote = menuNote;
	}
	@Override
	public String toString() {
		return "MenuVO [menuId=" + menuId + ", menuCode=" + menuCode + ", menuCateCode=" + menuCateCode
				+ ", menuCateName=" + menuCateName + ", menuName=" + menuName + ", menuNameEng=" + menuNameEng
				+ ", menuPrice_S=" + menuPrice_S + ", menuPrice_M=" + menuPrice_M + ", menuPrice_L=" + menuPrice_L
				+ ", menuImage=" + menuImage + ", uploadFile=" + uploadFile + ", menuVolume=" + menuVolume
				+ ", menuDescription=" + menuDescription + ", menuCal=" + menuCal + ", menuFat=" + menuFat
				+ ", menuPro=" + menuPro + ", menuNatrium=" + menuNatrium + ", menuSugar=" + menuSugar
				+ ", menuCaffeine=" + menuCaffeine + ", menuNote=" + menuNote + "]";
	}	
}
