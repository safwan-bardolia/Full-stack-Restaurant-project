package com.Restaurant.DAO;

import java.util.List;

import com.Restaurant.Entity.Booking;

public interface BookingDAO {

	public void saveBooking(Booking booking);
	
	public List<Booking> getBookings();
}
