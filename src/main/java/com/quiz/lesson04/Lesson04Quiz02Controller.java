package com.quiz.lesson04;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.quiz.lesson04.bo.RealtorBO;
import com.quiz.lesson04.model.Realtor;

@RequestMapping("/lesson04/quiz02")
@Controller
public class Lesson04Quiz02Controller {

	@Autowired
	private RealtorBO realtorBO;
	
	// http://localhost:8080/lesson04/quiz02/add_realtor_view
	@RequestMapping("/add_realtor_view")
	public String quiz02_1() {
		return "lesson04/addRealtor";
	}
	
	@RequestMapping("/add_realtor")
	public String addRealtor(
			@ModelAttribute Realtor realtor,
			Model model) {
		
		realtorBO.insertRealtor(realtor);
		Realtor newRealtor = realtorBO.getRealtorById(realtor.getId());
		model.addAttribute("realtor", newRealtor);
		return "lesson04/afterAddRealtor";
	}
	
}
