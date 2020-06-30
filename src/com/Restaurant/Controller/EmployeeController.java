package com.Restaurant.Controller;

import java.lang.ProcessBuilder.Redirect;
import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.StringTrimmerEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.Restaurant.Entity.Employee;
import com.Restaurant.Service.EmployeeService;

@Controller
@RequestMapping("/employee")
public class EmployeeController {
	
	@Autowired
	private EmployeeService employeeService;
	
	// for trimming white space	
	@InitBinder
	public void initBinder(WebDataBinder binder) {
		StringTrimmerEditor editor=new StringTrimmerEditor(true);
		binder.registerCustomEditor(String.class, editor);
	}
	
	
	@GetMapping("/list")
	public String listEmployee(Model model) {
			
		
		List<Employee> employees = employeeService.getEmployees();
		
		model.addAttribute("employees", employees);
		
		return "list-employee";
	}
	
	
	@GetMapping("/addEmployee")
	public String addEmployee(Model model) {
		
		Employee employee=new Employee();
		
		// empty object is passed for binding employee object to input field
		model.addAttribute("employee", employee);
		
		return "add-employee";
	}
	
	
	@PostMapping("/validateEmployee")
	public String validateEmployee(@Valid @ModelAttribute Employee employee, BindingResult bindingResult) {
		
		System.out.println(bindingResult);
		
		if(bindingResult.hasErrors()) {
			return "add-employee";
		}else {
			employeeService.saveOrEdit(employee);
			return "redirect:/employee/list";
		}
	}
	
	@GetMapping("/edit")
	public String editEmployee(@RequestParam("employeeId") int empId, Model model ) {
		
		Employee employee = employeeService.getEmployee(empId);
		
		// to prefill input field, which is done automatically by 'modelAttribute' & <form: form> tag		
		model.addAttribute("employee", employee);
		
		return "add-employee";
	}
	
	@GetMapping("/delete")
	public String deleteEmployee(@RequestParam("employeeId") int empId, Model model) {
		
		employeeService.deleteEmployee(empId);
		
		return "redirect:list";			// "redirect:list"  it is same as "redirect:/employee/list"
	}
	
}

