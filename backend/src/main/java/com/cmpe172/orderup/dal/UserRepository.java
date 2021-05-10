package com.cmpe172.orderup.dal;

import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.stereotype.Repository;

import com.cmpe172.orderup.model.User;

@Repository
public interface UserRepository extends MongoRepository<User, String> {
}
