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

import com.Restaurant.Entity.Users;
import com.Restaurant.Service.UserService;

@Controller

public class LoginController {

	@Autowired
	private UserService userService;
	
	@InitBinder
	public void initBinder(WebDataBinder binder) {
		StringTrimmerEditor editor =new StringTrimmerEditor(true);
		binder.registerCustomEditor(String.class, editor);
	}
	
	@GetMapping("/loginPage")
	public String loginPage() {
		
		return "login-page";
	}
	
	@GetMapping("/403")
	public String accessDeniedPage() {
		return "403";
	} 
	
	@GetMapping("/signup")
	public String signup(Model model) {
		
		Users user = new Users();
		
		model.addAttribute("user", user);
		
		return "signup-page";
	}
	
	@PostMapping("/validateSignup")
	public String validateSignup(@Valid @ModelAttribute("user") Users user, BindingResult bindingResult)  {
		
		System.out.println(bindingResult);
		System.out.println(user);
		
		if(bindingResult.hasErrors()) {
			return "signup-page";
		}
		
		int check = userService.chechUser(user);
		System.out.println(check);
		if(check == 1) {
			//means username already exist
			return "redirect:/signup?duplicate";
		}
		
		// means check==0 (i.e username does not exist)		
		userService.saveUser(user);
		
		return "redirect:/loginPage?user";
		
	}
	
	
}
