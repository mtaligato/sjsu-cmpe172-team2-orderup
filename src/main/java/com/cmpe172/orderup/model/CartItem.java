package com.cmpe172.orderup.model;

public class CartItem {
	private String name;
	private double price;
	private String uuid;
	
	public CartItem() {
		super();
	}

	public CartItem(String name, double price, String uuid) {
		super();
		this.name = name;
		this.price = price;
		this.uuid = uuid;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public String getUuid() {
		return uuid;
	}

	public void setUuid(String uuid) {
		this.uuid = uuid;
	}
}