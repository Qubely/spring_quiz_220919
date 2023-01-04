package com.quiz.lesson06;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.quiz.lesson06.bo.BookmarkBO;
import com.quiz.lesson06.model.Bookmark;

@RequestMapping("/lesson06")
@Controller
public class Lesson06QuizController {
	
	@Autowired
	private BookmarkBO bookmarkBO;
	
	// http://localhost:8080/lesson06/quiz01/add_bookmark_view
	@GetMapping("/quiz01/add_bookmark_view")
	public String addBookmarkView() {
		return "/lesson06/quiz01/addBookmark";
	}
	
	@ResponseBody
	@PostMapping("/quiz01/add_bookmark")
	public String addBookmark(
			@RequestParam("name") String name,
			@RequestParam("url") String url
			) {
		
		// db insert
		bookmarkBO.addBookmark(name, url);
		
		return "성공";
	}
	
	@GetMapping("/quiz01/after_add_bookmark")
	public String afterAddBookmark(Model model) {
		List<Bookmark> bookmarkList = bookmarkBO.getBookmarkList();
		model.addAttribute("bookmarkList", bookmarkList);
		return "lesson06/afterAddBookmark";
	}
	
}
