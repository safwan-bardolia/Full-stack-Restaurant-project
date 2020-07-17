package com.Restaurant.DAO;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.Restaurant.Entity.Order;

@Repository
public class OnlineOrderingDAOImpl implements OnlineOrderingDAO {

	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public void saveOrder(Order order) {
		Session session = sessionFactory.getCurrentSession();
		session.save(order);
	}
}
