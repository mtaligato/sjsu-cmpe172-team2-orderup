package com.cmpe172.orderup.dal;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Repository;

import com.cmpe172.orderup.model.Order;

@Repository
public class OrderDALImpl implements OrderDAL {
	@Autowired
	private MongoTemplate mongoTemplate;
	
	@Override
	public List<Order> getAllOrders() {
		return mongoTemplate.findAll(Order.class);
	}
	
	@Override
	public Order getOrderById(String uuid) {
		Query query = new Query();
		query.addCriteria(Criteria.where("uuid").is(uuid));
		return mongoTemplate.findOne(query, Order.class);
	}
	
	@Override
	public Order placeOrder(Order order) {
		mongoTemplate.save(order);
		return order;
	}
}