package com.project.fin.orders.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.fin.orders.model.dao.OrdersDao;
import com.project.fin.orders.model.vo.Orders;

@Service
public class OrdersServiceImpl implements OrdersService{
	
	@Autowired
	private OrdersDao ordersDao;

	@Override
	public List<Orders> selectOrdersList() {
		
		return ordersDao.selectOrdersList();
	}
}
