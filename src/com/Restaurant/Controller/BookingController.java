package com.Restaurant.Controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.StringTrimmerEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.Restaurant.Entity.Booking;
import com.Restaurant.Service.BookingService;

@Controller
@RequestMapping("/booking")
public class BookingController {

	@Autowired
	private BookingService bookingService;
	
	@InitBinder
	public void initBinder(WebDataBinder binder) {
		StringTrimmerEditor editor = new StringTrimmerEditor(true);
		binder.registerCustomEditor(String.class, editor);
	}
	
	@GetMapping("/tableBooking")
	public String tableBooking(Model model) {
		
		Booking booking = new Booking();
		
		// empty booking object is pass for automatic binding object to the user input 
		model.addAttribute("booking", booking);
		
		return "booking";
	}
	
	@PostMapping("/validateBooking")
	public String validateBooking(@Valid @ModelAttribute Booking booking, BindingResult bindingResult) {
		
		System.out.println(bindingResult);
		
		if(bindingResult.hasErrors()) {
			return "booking";
		}
		
		bookingService.saveBooking(booking);
		
		return "redirect:/";
	}
}
