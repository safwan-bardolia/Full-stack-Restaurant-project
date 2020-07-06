package com.Restaurant.Entity;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

@Entity
@Table(name = "users")
public class Users {

	@Id
	@NotNull(message = "username cannot be empty")
	@Size(min = 4, message = "! username must be greater than or equal to 4")
	private String username; 
	
	@NotNull(message = "password cannot be empty")
	@Size(min = 6, message = "! password length must be greater than or equal to 6")
	private String password;
	
	private int enabled=1;

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public int getEnabled() {
		return enabled;
	}

	public void setEnabled(int enabled) {
		this.enabled = enabled;
	}

	@Override
	public String toString() {
		return "User [username=" + username + ", password=" + password + ", enabled=" + enabled + "]";
	}
	
	
}
