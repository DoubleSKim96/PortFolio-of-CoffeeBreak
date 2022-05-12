package com.spring.coffeebreak.menu.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.spring.coffeebreak.menu.model.MenuVO;
import com.spring.coffeebreak.menu.repository.IMenuMapper;

@Service
public class MenuService implements IMenuService {

	@Inject
	private IMenuMapper mapper;

	@Override
	public void insertMenu(MenuVO menu) {
		mapper.insertMenu(menu);
	}
	
	@Override
	public List<MenuVO> getMenuListAll() {
		return mapper.getMenuListAll();
	}
	
	@Override
	public List<MenuVO> getMenuListOne(Integer menuCateCode) {
		return mapper.getMenuListOne(menuCateCode);
	}
	
	@Override
	public MenuVO getMenuOne(Integer menuCode) {
		return mapper.getMenuOne(menuCode);
	}
	
	@Override
	public void updateMenu(MenuVO menu) {
		mapper.updateMenu(menu);
	}
}
