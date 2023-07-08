package com.project.fin.orders.model.service;

import java.util.List;

import com.project.fin.orders.model.vo.Orders;

public interface OrdersService {

	List<Orders> selectOrdersList();

}
