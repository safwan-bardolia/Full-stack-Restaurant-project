package com.Restaurant.Entity;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import com.Restaurant.Annotation.Phone;

@Entity
@Table(name = "order_book")
public class Order {

	@Id
	private int id;
	private String user;
	private int totalCost;
	private int cartCount;
	private String cartItems;

	@NotNull(message = "!phone no should not be empty")
	@Phone(message = "!length of number must be 10 ( ignore initial zero)")				// custome annotation
	private Long phone;
	
	@NotNull(message = "address should not be empty")
	@Size(min = 15,message = "address length must be greater than 15")
	private String address;
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id=id;
	}
	public int getTotalCost() {
		return totalCost;
	}
	public void setTotalCost(int totalCost) {
		this.totalCost = totalCost;
	}
	public int getCartCount() {
		return cartCount;
	}
	public void setCartCount(int cartCount) {
		this.cartCount = cartCount;
	}
	public String getUser() {
		return user;
	}
	public void setUser(String user) {
		this.user = user;
	}
	public String getCartItems() {
		return cartItems;
	}
	public void setCartItems(String cartItems) {
		this.cartItems = cartItems;
	}
	
	public Long getPhone() {
		return phone;
	}
	public void setPhone(Long phone) {
		this.phone = phone;
	}
	
	
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	@Override
	public String toString() {
		return "Order [id=" + id + ", user=" + user + ", totalCost=" + totalCost + ", cartCount=" + cartCount
				+ ", cartItems=" + cartItems + ", phone=" + phone + ", address=" + address + "]";
	}
	
}
