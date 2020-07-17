package com.Restaurant.DAO;


import javax.persistence.Query;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Repository;

import com.Restaurant.Entity.Authorities;
import com.Restaurant.Entity.Users;

@Repository
public class UserDAOImpl implements UserDAO {

	@Autowired
	private SessionFactory sessionFactory;
	

	@Override
	public int checkUser(Users user) {
		Session session = sessionFactory.getCurrentSession();
		
		Query query = session.createQuery("select username from Users where username='"+user.getUsername()+"'");
		//System.out.println(query.getResultList().isEmpty());
		//System.out.println(query.getResultList().size());
		
		// if we use 'query.getSingleResult()' then it throws noResultException if user is not found in DB
		// so we use getResultList().size() 
		return query.getResultList().size();
	}
	
	@Override
	public void saveUser(Users user) {
	
		Session session = sessionFactory.getCurrentSession();

		// add prefix (i.e id of encoded algorithm) to the password		
	    // user.setPassword("{noop}"+user.getPassword());
		
		// encode the password & save to the object		
		user.setPassword("{bcrypt}"+ BCrypt.hashpw(user.getPassword(), BCrypt.gensalt()));
		
		// save in users table
		session.save(user);
		
		Authorities authorities = new Authorities();
		authorities.setUsername(user.getUsername());
		System.out.println(authorities);
		
		// save in authorities table 
		session.save(authorities);
	}

}
