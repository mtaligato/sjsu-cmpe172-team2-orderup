package com.cmpe172.orderup.dal;

import java.util.List;

import com.cmpe172.orderup.model.MenuItem;

public interface MenuDAL {
	List<MenuItem> getMenuItems();
	MenuItem addMenuItem(MenuItem menuItem);
}