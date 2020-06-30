package com.Restaurant.Service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.Restaurant.DAO.BookingDAO;
import com.Restaurant.Entity.Booking;

@Service
public class BookingServiceImpl implements BookingService {

	@Autowired
	private BookingDAO bookingDAO;
	
	@Transactional
	@Override
	public void saveBooking(Booking booking) {
		bookingDAO.saveBooking(booking);
	}
}
