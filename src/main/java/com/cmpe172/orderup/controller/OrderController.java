package com.cmpe172.orderup.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.cmpe172.orderup.dal.OrderDAL;
import com.cmpe172.orderup.dal.OrderRepository;
import com.cmpe172.orderup.model.Order;

@RestController
@RequestMapping(value = "/")
public class OrderController {
	private Logger LOG = LoggerFactory.getLogger(getClass());
	private OrderRepository orderRepository;
	private OrderDAL orderDAL;
	
	public OrderController(OrderRepository orderRepository, OrderDAL orderDAL) {
		this.orderRepository = orderRepository;
		this.orderDAL = orderDAL;
	}
	
	@RequestMapping(value = "/order", method = RequestMethod.GET)
	public List<Order> getAllOrders() {
		LOG.info("Getting all orders");
		return orderRepository.findAll();
	}
	
	@RequestMapping(value = "/order/{uuid}", method = RequestMethod.GET)
	public Order getOrder(@PathVariable String uuid) {
		LOG.info("Getting order #{}", uuid);
		return orderRepository.findOne(uuid);
	}
	
	@RequestMapping(value = "/order/place", method = RequestMethod.POST)
	public Order placeOrder(@RequestBody Order order) {
		LOG.info("Placing order");
		return orderRepository.save(order);
	}
}