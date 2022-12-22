package com.quiz.lesson02;

import java.util.List;

import org.apache.catalina.Store;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.quiz.lesson02.bo.StoreBO;

@RestController
public class Lesson02Quiz01RestController {
	
	@Autowired
	private StoreBO storeBO;
	
	@RequestMapping("/lesson02/quiz01")
	public List<Store> quiz01() {
		List<Store> storeList = storeBO.getStoreList();
		return storeList;
	}
	
	
}
