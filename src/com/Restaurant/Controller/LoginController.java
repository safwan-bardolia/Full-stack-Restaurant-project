package com.Restaurant.Controller;

import org.springframework.web.bind.annotation.GetMapping;

public class LoginController {

	@GetMapping("/loginPage")
	public String loginPage() {
		
		return "login-page";
	}
}
