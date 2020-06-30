package com.Restaurant.Service;

import java.util.List;

import com.Restaurant.Entity.Employee;

public interface EmployeeService {

	public List<Employee> getEmployees();
	
	public void saveOrEdit(Employee employee);
	
	public Employee getEmployee(int empId);
	
	public void deleteEmployee(int empId);
}
