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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.request.WebRequest;

import com.Restaurant.DAO.OnlineOrderingDAO;
import com.Restaurant.Entity.Order;
import com.Restaurant.Service.OnlineOrderingService;

@Controller
@RequestMapping("/online")
public class OnlineOrderingController {
	
	@Autowired
	private OnlineOrderingService onlineOrderingService; 

	@InitBinder
	public void initBinder(WebDataBinder binder) {
		StringTrimmerEditor editor = new StringTrimmerEditor(true);
		binder.registerCustomEditor(String.class, editor);
	}
	
	@GetMapping("/onlineOrdering")
	public String onlineOrdering(Model model) {
		
		return "online-ordering";
	}
	
	@GetMapping("/cart")
	public String cart(Model model) {
		Order order =new Order();
		model.addAttribute("order", order);
		return "order-cart";
	}
	
	@PostMapping("/validateOrder")
	public String validateOrder(@Valid @ModelAttribute("order") Order order, BindingResult bindingResult, WebRequest request) {
		System.out.println(bindingResult);
		if(bindingResult.hasErrors()) {
			return "order-cart";
		}

		order.setUser(request.getRemoteUser());
		System.out.println(order.toString());
		onlineOrderingService.saveOrder(order);
		
		return "online-ordering";
	}
}
