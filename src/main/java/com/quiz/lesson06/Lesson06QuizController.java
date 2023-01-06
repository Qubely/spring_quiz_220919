package com.quiz.lesson06;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
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
	public Map<String, String> addBookmark(
			@RequestParam("name") String name,
			@RequestParam("url") String url
			) {
		
		// db insert
		bookmarkBO.addBookmark(name, url);
		
		// 성공 값 응답 값
		Map<String, String> result = new HashMap<>();
		result.put("result", "성공");
		
		return result;	// jackson => JSON String
	}
	
	// http://localhost:8080/lesson06/quiz01/after_add_bookmark
	@GetMapping("/quiz01/after_add_bookmark")
	public String afterAddBookmark(Model model) {
		List<Bookmark> bookmarkList = bookmarkBO.getBookmarkList();
		model.addAttribute("bookmarkList", bookmarkList);
		return "lesson06/quiz01/afterAddBookmark";
	}
	
	@ResponseBody
	@PostMapping("/quiz02/is_duplication")
	public Map<String, Boolean> isDuplication(
			@RequestParam("url") String url
			) {
		
		Map<String, Boolean> result = new HashMap<>();
		result.put("is_duplication", bookmarkBO.existBookmarkByUrl(url));
		return result;
		
	}
	
	@ResponseBody
	@DeleteMapping("quiz02/is_deleted")
	public Map<String, Object> isDeleted(
			@RequestParam("id") int id
			) {
		
		Map<String, Object> result = new HashMap<>();
		int row = bookmarkBO.deleteBookMarkById(id);
		if (row > 0) {
			result.put("code", 1);
			result.put("result", "성공");
		} else {
			result.put("code", 500);
			result.put("result", "실패");
			result.put("error_message", "삭제된 행이 없습니다.");
		}
		
		
//		result.put("is_deleted", bookmarkBO.deleteBookMarkById(id));
		return result;
		
	}
	
}
