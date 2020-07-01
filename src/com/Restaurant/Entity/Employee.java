package com.Restaurant.Entity;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;





@Entity
@Table(name = "employee")
public class Employee {

	@Id
	private int id;
	
	@NotNull(message = "Name should not be empty")	//NotNull will interact with initBinder, without initBinder this msg is not shown 
	@Size(min = 3, message = "Name must be greater than 6 character")
	@Size(max = 255, message = "!too large")		//always use this this validation to avoid sql exception at run time
	private String name;

	@NotNull(message = "email should not be empty")	
	@Size(min = 6, message = "email must be greater than 6 character")
	@Size(max = 50, message = "!too large")
	private String email;
	
	@NotNull(message = "required")
	@Min(value = 14, message = "age must be greater that 14 for this job")
	@Max(value = 40, message = "sorry you are not applicable for this job")
	private Integer age;
	
	@NotNull(message = "Location should not be empty")
	@Size(min = 6, message = "Location must be greater than 6 character")
	@Size(max = 50, message = "!too large")
	private String city;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Integer getAge() {
		return age;
	}

	public void setAge(Integer age) {
		this.age = age;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String location) {
		this.city = location;
	}
	
	
}
