package com.Restaurant.DAO;


import com.Restaurant.Entity.Users;

public interface UserDAO {
	public int checkUser(Users user);
	public void saveUser(Users user);
}
