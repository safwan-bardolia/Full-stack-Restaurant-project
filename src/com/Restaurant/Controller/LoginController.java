package com.Restaurant.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class LoginController {

	@GetMapping("/loginPage")
	public String loginPage() {
		
		return "login-page";
	}
	
	@GetMapping("/403")
	public String accessDeniedPage() {
		return "403";
	} 
	
}
