package com.Restaurant.Service;

import java.util.List;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.Restaurant.DAO.EmployeeDAO;
import com.Restaurant.Entity.Employee;

@Service
public class EmployeeServiceImpl implements EmployeeService {
	
	@Autowired
	private EmployeeDAO employeeDAO;

	@Transactional
	@Override
	public List<Employee> getEmployees() {
		
		return employeeDAO.getEmployees();
	}

	@Transactional
	@Override
	public void saveOrEdit(Employee employee) {
		employeeDAO.saveOrEdit(employee);
	}

	@Transactional
	@Override
	public Employee getEmployee(int empId) {
		return employeeDAO.getEmployee(empId);
	}

	@Transactional
	@Override
	public void deleteEmployee(int empId) {
		employeeDAO.deleteEmployee(empId);
	}

}
