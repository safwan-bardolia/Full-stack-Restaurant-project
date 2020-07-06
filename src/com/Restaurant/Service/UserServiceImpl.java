package com.Restaurant.Service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.Restaurant.DAO.UserDAO;
import com.Restaurant.Entity.Users;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserDAO userDAO;
	
	@Transactional
	@Override
	public int chechUser(Users user) {
		return userDAO.checkUser(user);
	}
	
	@Transactional
	@Override
	public void saveUser(Users user) {
		userDAO.saveUser(user);
	}



}
