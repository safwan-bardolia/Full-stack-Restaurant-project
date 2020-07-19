package com.Restaurant.Service;

import java.util.List;

import com.Restaurant.Entity.Booking;

public interface BookingService {
	
	public void saveBooking(Booking booking);
	
	public List<Booking> getBookings();
}
