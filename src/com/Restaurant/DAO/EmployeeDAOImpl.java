package com.Restaurant.DAO;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.Restaurant.Entity.Employee;


@Repository
public class EmployeeDAOImpl implements EmployeeDAO {

	@Autowired
	private SessionFactory sessionFactory;
	
	
	@Override
	public List<Employee> getEmployees() {
		
		Session session=sessionFactory.getCurrentSession();
		
		Query<Employee> query = session.createQuery("from Employee",Employee.class);
		
		List<Employee> employees = query.getResultList(); 

		return employees;
	}


	@Override
	public void saveOrEdit(Employee employee) {

		Session session = sessionFactory.getCurrentSession();
		
		session.saveOrUpdate(employee);
	}


	@Override
	public Employee getEmployee(int empId) {
		
		Session session = sessionFactory.getCurrentSession();
		
		Employee employee = session.get(Employee.class, empId);
		
		return employee;
	}


	@Override
	public void deleteEmployee(int empId) {
		
		Session session = sessionFactory.getCurrentSession();
		
		// first fetch the record from DB		
		Employee employee = session.get(Employee.class, empId);
				
		/* after get() object goes into persistance state & 
		   in persistence state there is direct linking between object & DB*/  		
		session.remove(employee);		
	}
	
		
}
