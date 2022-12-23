package com.quiz.lesson03;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.quiz.lesson03.bo.RealEstateBO;
import com.quiz.lesson03.model.RealEstate;

@RestController
public class Lesson03quiz01RestController {
	
	@Autowired
	private RealEstateBO realEstateBO;
	
	@RequestMapping("/lesson03/quiz01/1")
	public RealEstate quiz01_1(
			@RequestParam(value="id", defaultValue="1") int id
			) {
		return realEstateBO.getRealEstate(id);
	}
	
	@RequestMapping("/lesson03/quiz02/2")
	public RealEstate quiz01_2(
			@RequestParam()
			) {
		return ;
	}
	
	
}
