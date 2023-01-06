package com.quiz.lesson06.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.quiz.lesson06.model.Bookmark;

@Repository
public interface BookmarkDAO {
	
	public void insertBookmark(
			@Param("name") String name, 
			@Param("url") String url);
	
	public List<Bookmark> selectBookmarkList();
	
	public boolean existBookmarkByUrl(String url);
	
//	public boolean deleteBookMarkById(int id);
	
	public int deleteBookMarkById(int id);
	
}
