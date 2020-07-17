package com.Restaurant.Service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.Restaurant.DAO.OnlineOrderingDAO;
import com.Restaurant.Entity.Order;

@Service
public class OnlineOrderingServiceImpl implements OnlineOrderingService {

	@Autowired
	private OnlineOrderingDAO onlineOrderingDAO; 
	
	@Transactional
	@Override
	public void saveOrder(Order order) {
		onlineOrderingDAO.saveOrder(order);
	}

}
