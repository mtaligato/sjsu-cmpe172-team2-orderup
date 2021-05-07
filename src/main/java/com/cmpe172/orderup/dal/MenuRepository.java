package com.cmpe172.orderup.dal;

import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.stereotype.Repository;

import com.cmpe172.orderup.model.MenuItem;

@Repository
public interface MenuRepository extends MongoRepository<MenuItem, String>{

}
