package com.Restaurant.Entity;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "authorities")
public class Authorities {

	@Id
	private String username;
	private String authority="ROLE_USER";
	
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getAuthority() {
		return authority;
	}
	public void setAuthority(String authority) {
		this.authority = authority;
	}
	
	@Override
	public String toString() {
		return "Authorities [username=" + username + ", authority=" + authority + "]";
	}
	
	
	
	
}
