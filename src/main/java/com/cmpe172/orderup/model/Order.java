package com.cmpe172.orderup.model;

import java.util.List;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

@Document
public class Order {
	@Id
	private String uuid;
	private List<CartItem> items;
	private int timestamp;
	private String name;
	private String phoneNumber;
	private OrderStatus status;
	
	public Order() {
		super();
	}

	public Order(String uuid, List<CartItem> items, int timestamp, String name, String phoneNumber,
			OrderStatus status) {
		super();
		this.uuid = uuid;
		this.items = items;
		this.timestamp = timestamp;
		this.name = name;
		this.phoneNumber = phoneNumber;
		this.status = status;
	}

	public String getUuid() {
		return uuid;
	}

	public void setUuid(String uuid) {
		this.uuid = uuid;
	}

	public List<CartItem> getItems() {
		return items;
	}

	public void setItems(List<CartItem> items) {
		this.items = items;
	}

	public int getTimestamp() {
		return timestamp;
	}

	public void setTimestamp(int timestamp) {
		this.timestamp = timestamp;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public OrderStatus getStatus() {
		return status;
	}

	public void setStatus(OrderStatus status) {
		this.status = status;
	}
}