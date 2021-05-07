package com.cmpe172.orderup.dal;

import java.util.List;

import com.cmpe172.orderup.model.Order;

public interface OrderDAL {
	List<Order> getAllOrders();
	Order getOrderById(String uuid);
	Order placeOrder(Order order);
}