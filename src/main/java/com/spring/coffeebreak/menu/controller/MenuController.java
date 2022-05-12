package com.spring.coffeebreak.menu.controller;

import java.io.File;
import java.util.List;
import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FilenameUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.coffeebreak.menu.model.MenuVO;
import com.spring.coffeebreak.menu.service.IMenuService;

@Controller
@RequestMapping("/menu")
public class MenuController {

	@Inject
	private IMenuService service;
	
	//메뉴 등록 화면
	@GetMapping("/insertMenu")
	public String insertMenu() {
		return "menu/insert_menu";
	}
	
	//메뉴 등록
	@PostMapping("/insertMenu")
	public String insertMenu(MenuVO menu, HttpServletRequest request) throws Exception {
		
		// 파일 업로드
		String fileName = null;
		MultipartFile uploadFile = menu.getUploadFile();
		
		if(!uploadFile.isEmpty()) {
			String originalFileName = uploadFile.getOriginalFilename();		// 업로드된 파일 이름
			String ext = FilenameUtils.getExtension(originalFileName);		// 파일 확장자
			String absolutePath = request.getSession().getServletContext().getRealPath("/resources/images/upload/");	// 업로드된 파일의 상대경로
			System.out.println(absolutePath);
			
			UUID uuid = UUID.randomUUID();
			fileName = uuid + "." + ext;	// 업로드될 파일명을 변경
			uploadFile.transferTo(new File(absolutePath + fileName));	// 상대경로와 파일명을 전달하여 업로드
			menu.setMenuImage(fileName);	// 업로드된 파일을 menu객체에 저장
		}
		
		service.insertMenu(menu);	// mapper를 통해 다른 데이터들을 menu객체에 저장
		return "redirect:/menu/insertMenu";
	}
	
	//전체 메뉴 화면, 기본 메뉴화면
	@GetMapping("/all")
	public String all(Model model) {
		List<MenuVO> menu = service.getMenuListAll();
		model.addAttribute("menu", menu);
		return "menu/menu_index";
	}
	
	//커피 메뉴
	@GetMapping("/coffee")
	public String coffee(Model model) {
		List<MenuVO> menu = service.getMenuListOne(100);
		model.addAttribute("menu", menu);
		return "menu/menu_coffee_index";
	}
	
	//음료 메뉴
	@GetMapping("/beverage")
	public String beverage(Model model) {
		List<MenuVO> menu = service.getMenuListOne(200);
		model.addAttribute("menu", menu);
		return "menu/menu_beverage_index";
	}
	
	//디저트 메뉴
	@GetMapping("/dessert")
	public String dessert(Model model) {
		List<MenuVO> menu = service.getMenuListOne(300);
		model.addAttribute("menu", menu);
		return "menu/menu_dessert_index";
	}
	
	//메뉴 정보 페이지
	@GetMapping("/content")
	public String menuSelectOne(Integer menuCode, Model model) {
		MenuVO menu = service.getMenuOne(menuCode);
		model.addAttribute("menu", menu);
		System.out.println(menu);
		return "menu/menu_info";
	}
	
	//메뉴 수정 페이지 요청
	@GetMapping("/modifyMenu")
	public String modify(Integer menuCode, Model model) {
		System.out.println("게시글 수정 번호 : " + menuCode);
		MenuVO menu = service.getMenuOne(menuCode);
		System.out.println(menu);
		model.addAttribute("menu", menu);
		return "menu/modify_menu";
	}
	
	//메뉴 수정 요청
	@PostMapping("/modifyMenu")
	public String modify(MenuVO menu, HttpServletRequest request, RedirectAttributes ra) throws Exception {
		
		/*파일 업로드 수정 부분*/
		MultipartFile uploadFile = menu.getUploadFile();
		String absolutePath = request.getSession().getServletContext().getRealPath("/resources/images/upload/");
		String fileName = null;
		MenuVO oldMenu = service.getMenuOne(menu.getMenuCode());	// 기존 파일 객체 생성
		
		// 새로운 파일을 업로드 하지 않고 기존 이미지 사용할 경우
		if(uploadFile.isEmpty()) {
			System.out.println("기존 이미지 사용");
			menu.setMenuImage(oldMenu.getMenuImage());
		// 새로운 파일을 업로드할 경우
		} else {
			// 기존 파일 삭제
			if(oldMenu.getMenuImage() != null) {
				System.out.println("기존 이미지 삭제");
				File oldFile = new File(absolutePath + oldMenu.getMenuImage());
				if(oldFile.exists()) {
					oldFile.delete();
				}
			}
			
			// 새로운 파일 업로드
			String originalFileName = uploadFile.getOriginalFilename();
			String ext = FilenameUtils.getExtension(originalFileName);
			UUID uuid = UUID.randomUUID();
			fileName = uuid + "." + ext;
			uploadFile.transferTo(new File(absolutePath + fileName));
			menu.setMenuImage(fileName);
		}
		
		service.updateMenu(menu);
		ra.addFlashAttribute("msg", "modify_success");
		return "redirect:/menu/content?menuCode=" + menu.getMenuCode();
	}
}
