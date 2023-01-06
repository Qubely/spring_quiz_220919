package com.quiz.lesson06;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.quiz.lesson06.bo.BookingBO;
import com.quiz.lesson06.model.Booking;

@RequestMapping("/booking")
@Controller
public class BookingController {
	
	@Autowired
	private BookingBO bookingBO;
	
	// http://localhost:8080/booking/main_view
	@GetMapping("/main_view")
	public String mainView() {
		return "lesson06/booking/main";
	}
	
	// http://localhost:8080/booking/booking_list_view
	@GetMapping("/booking_list_view")
	public String bookingListView(Model model) {
		List<Booking> bookingList = bookingBO.getBookingList();
		model.addAttribute("bookingList", bookingList);
		
		return "lesson06/booking/bookingList";
	}
	
	
	
}
