package com.spring.coffeebreak.notice.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.coffeebreak.notice.commons.PageCreator;
import com.spring.coffeebreak.notice.commons.PageVO;
import com.spring.coffeebreak.notice.commons.SearchVO;
import com.spring.coffeebreak.notice.model.BoardVO;
import com.spring.coffeebreak.notice.service.IBoardService;

@Controller
@RequestMapping("/notices")
public class NoticeController {

	@Autowired
	private IBoardService service;
	
	// 검색 처리 이후 게시물 이동 및 게시글 목록 불러오기 
	@GetMapping("/list")
	public String list(Model model, SearchVO search) {
	
		
		//System.out.println("URL: /notices/list GET -> result: "+ list.size());
		System.out.println("parameter(페이지번호): " + search.getPage() + "번");
		
		PageCreator pc = new PageCreator();
		pc.setPaging(search);
		
		List<BoardVO> list = service.getArticleListBytitle(search);
		pc.setArticleTotalCount(service.countArticles(search));
		
		model.addAttribute("articles", list);
		model.addAttribute("pc", pc);	
		
		return "notices/list" ;
	}
	
	/*
	// 이벤트 페이지 이동
	@GetMapping("/event")
	public String event() {
		System.out.println("notices/event : 이벤트 이동");
		return "notices/event" ;
	}
	*/
	
	// 글쓰기 페이지 이동
	@GetMapping("/write")
	public void write() {
		
		System.out.println("URL: /notices/write => GET ");
		
	}
	
	// 게시글 DB등록 요청
	@PostMapping("/write")
	public String write(BoardVO article, RedirectAttributes ra) {
		service.insert(article);
		ra.addFlashAttribute("msg", "regSuccess");
		return "redirect:/notices/list";
	}
	
	// 게시물 상세 조회 요청
	@GetMapping("/content/{boardNo}")
	public String content(@PathVariable Integer boardNo, Model model
			, @ModelAttribute("p") SearchVO paging) {
		// p 라는 이름으로 paging이 셋팅 됨.
		
		BoardVO vo = service.getArticle(boardNo);
		System.out.println("parameter(글 번호) : " + boardNo);
		System.out.println("Result Data: " + vo);
		
		model.addAttribute("article" , vo);
		
		return "notices/content";
	}
	
	// 게시물 삭제 처리 요청
	@PostMapping("/delete")
	public String remove(Integer boardNo, PageVO paging, 
			RedirectAttributes ra) {
		
		System.out.println("URL: /notices/delete => POST");
		System.out.println("parameter(글 번호): " + boardNo);
		service.delete(boardNo);
		ra.addFlashAttribute("msg", "delSuccess")
			.addAttribute("page", paging.getPage())
			.addAttribute("countPerPage", paging.getCountPerPage());
		
		return "redirect:/notices/list";
	}
	
	//게시물 수정 페이지 요청
		@GetMapping("/modify")
		public String modify(Integer boardNo, Model model
				, @ModelAttribute("p") PageVO paging) {
			System.out.println("URL: /board/modify => GET");
			System.out.println("parameter(글 번호): " + boardNo);
			
			BoardVO vo = service.getArticle(boardNo);
			System.out.println("Result Data: " + vo);
			model.addAttribute("article", vo);
			
			return "notices/modify";
		}
	
	// 게시물 수정 요청
		@PostMapping("/modify")
		public String modify(BoardVO article, RedirectAttributes ra) {
			
			service.update(article);
			
			ra.addFlashAttribute("msg","modSuccess");
			
			return "redirect:/notices/content/" + article.getBoardNo();
			
		}
		
}	
