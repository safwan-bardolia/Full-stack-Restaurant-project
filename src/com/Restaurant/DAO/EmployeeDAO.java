package com.Restaurant.DAO;

import java.util.List;

import com.Restaurant.Entity.Employee;

public interface EmployeeDAO {

	public List<Employee> getEmployees();
	
	public void saveOrEdit(Employee employee);
	
	public Employee getEmployee(int empId);

	public void deleteEmployee(int empId);
}

