package com.Restaurant.Service;


import com.Restaurant.Entity.Users;

public interface UserService {
	public int chechUser(Users user);
	public void saveUser(Users user);
}
