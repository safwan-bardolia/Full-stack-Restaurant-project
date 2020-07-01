package com.Restaurant.Entity;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import com.Restaurant.Annotation.Phone;

@Entity
@Table(name = "booking")
public class Booking {

	@Id
	private int id;
	
	@NotNull(message = "!name should not be empty")
	@Size(min = 3, message = "!name is too small")
	@Size(max = 30, message = "!name is too large")
	private String name; 

	@NotNull(message = "!email should not be empty")
	@Size(min = 6, message = "!not a valid email")
	@Size(max = 30, message = "!email is too large")
	private String email;

	@NotNull(message = "!phone no should not be empty")
	@Phone(message = "!Invalid phone number")				// custome annotation
	private String phone;
	
	@NotNull(message = "!date should not be empty")
	@Size(min = 6, message = "!not a valid date")
	@Size(max = 15, message = "!Invalid date")
	private String date;

	@NotNull(message = "!time should not be empty")
	@Size(min = 6, message = "!not a valid time")
	@Size(max = 15, message = "!Invalid time")
	private String time;
	
	@NotNull(message = "!person should not be empty")
	private String person;

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

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public String getPerson() {
		return person;
	}

	public void setPerson(String person) {
		this.person = person;
	}

	

	
	
}
