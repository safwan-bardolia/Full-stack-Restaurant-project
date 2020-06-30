package com.Restaurant.DAO;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.Restaurant.Entity.Booking;

@Repository
public class BookingDAOImpl implements BookingDAO {

	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public void saveBooking(Booking booking) {
		Session session = sessionFactory.getCurrentSession();
		session.save(booking);
	}

}
