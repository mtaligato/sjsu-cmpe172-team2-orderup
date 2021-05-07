package com.cmpe172.orderup.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.cmpe172.orderup.dal.MenuRepository;
import com.cmpe172.orderup.model.MenuItem;

@RestController
@ComponentScan("com.cmpe172.orderup.orderup")
@RequestMapping(value = "/")
public class MenuController {
	private Logger LOG = LoggerFactory.getLogger(getClass());
	private MenuRepository menuRepository;
	
	public MenuController(MenuRepository menuRepository) {
		this.menuRepository = menuRepository;
	}
	
	@RequestMapping(value = "/menu", method = RequestMethod.GET)
	public List<MenuItem> getMenuItems() {
		LOG.info("Getting menu items");
		return menuRepository.findAll();
	}
	
	@RequestMapping(value = "/menu/add", method = RequestMethod.POST)
	public MenuItem addMenuItem(@RequestBody MenuItem menuItem) {
		LOG.info("Adding menu item");
		return menuRepository.save(menuItem);
	}
}