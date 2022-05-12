package com.spring.coffeebreak.menu.service;

import java.util.List;

import com.spring.coffeebreak.menu.model.MenuVO;

public interface IMenuService {

	//메뉴 등록
	public void insertMenu(MenuVO menu);
	
	//전체 메뉴 목록 불러오기
	List<MenuVO> getMenuListAll();
		
	//단일 카테고리 목록 불러오기
	List<MenuVO> getMenuListOne(Integer menuCateCode);
	
	//단일 메뉴 불러오기
	MenuVO getMenuOne(Integer menuCode);
	
	//메뉴 수정
	void updateMenu(MenuVO menu);
	
}
