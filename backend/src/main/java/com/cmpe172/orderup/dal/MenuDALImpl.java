package com.cmpe172.orderup.dal;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.stereotype.Repository;

import com.cmpe172.orderup.model.MenuItem;

@Repository
public class MenuDALImpl implements MenuDAL {
	@Autowired
	private MongoTemplate mongoTemplate;

	@Override
	public List<MenuItem> getMenuItems() {
		return mongoTemplate.findAll(MenuItem.class);
	}

	@Override
	public MenuItem addMenuItem(MenuItem menuItem) {
		mongoTemplate.save(menuItem);
		return menuItem;
	}
}