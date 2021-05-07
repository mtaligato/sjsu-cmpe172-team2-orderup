package com.cmpe172.orderup.dal;

import org.springframework.data.mongodb.repository.MongoRepository;

import org.springframework.stereotype.Repository;

import com.cmpe172.orderup.model.Order;

@Repository
public interface OrderRepository extends MongoRepository<Order, String>{

}
