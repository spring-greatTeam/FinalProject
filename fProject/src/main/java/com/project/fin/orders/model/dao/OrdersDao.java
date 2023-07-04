package com.project.fin.orders.model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.project.fin.orders.model.vo.Orders;

@Mapper
public interface OrdersDao {

	List<Orders> selectOrdersList();

}
