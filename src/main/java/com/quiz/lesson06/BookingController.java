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
		return "lesson06/booking/mainView";
	}
	
	// http://localhost:8080/booking/booking_list_view
	@GetMapping("/booking_list_view")
	public String bookingListView(Model model) {
		List<Booking> bookingList = bookingBO.getBookingList();
		model.addAttribute("bookingList", bookingList);
		
		return "lesson06/booking/bookingList";
	}
	
	@ResponseBody
	@DeleteMapping("/is_deleted")
	public Map<String, Object> isDeleted(
			@RequestParam("id") int id
			) {
		
		Map<String, Object> result = new HashMap<>();
		int row = bookingBO.deleteBookingById(id);
		if (row > 0) {
			result.put("code", 1);
			result.put("result", "삭제 성공");
		} else {
			result.put("code", 500);
			result.put("result", "실패");
			result.put("error_message", "삭제된 행이 없습니다.");
		}
		
		return result;
	}
	
	
	// http://localhost:8080/booking/add_reservation_view
	@GetMapping("/add_reservation_view")
	public String reservationView() {
		return "lesson06/booking/addReservationView";
	}
	
	@ResponseBody
	@PostMapping("/add_booking")
	public Map<String, Object> addBooking(
			@RequestParam("name") String name
			, @RequestParam("date") String date
			, @RequestParam("day") int day
			, @RequestParam("headcount") int headcount
			, @RequestParam("phoneNumber") String phoneNumber
			) {
		int row = bookingBO.addBooking(name, date, day, headcount, phoneNumber);
//		bookingBO.addBooking(name, date, day, headcount, phoneNumber, state);
		
		Map<String, Object> result = new HashMap<>();
//		result.put("code", 1);
//		result.put("result", "예약이 완료되었습니다.");
		if (row > 0) {
			result.put("code", 1);
			result.put("result", "예약 되었습니다.");
		} else {
			result.put("code", 501);
			result.put("result", "실패");
			result.put("error_message", "추가된 행이 없습니다.");
	}
		
		return result;
	}
	
	
	@ResponseBody
	@PostMapping("/reservation_check")
	public Map<String, Object> getBookingByNamePhoneNumber(
			@RequestParam("name") String name
			, @RequestParam("phoneNumber") String phoneNumber) {
		
		Booking booking = bookingBO.getLatestBookingByNamePhoneNumber(name, phoneNumber);
		
		Map<String, Object> result = new HashMap<>();
		if (booking != null) {
			result.put("code", 1);
			result.put("result", booking);
		} else {
			result.put("code", 502);
			result.put("result", "실패");
			result.put("error_message", "일치하는 내역이 없습니다.");
		}
		
		return result;
	}
	
	
}
