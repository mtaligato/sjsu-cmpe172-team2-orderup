package com.cmpe172.orderup.model;

public enum OrderStatus {
	placed,
	preparing,
	waiting,
	completed;
	
	private static OrderStatus[] vals = values();
	
	public OrderStatus next() {
		return vals[(this.ordinal()+1) % vals.length];
	}
}