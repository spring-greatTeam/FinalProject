package com.project.fin.cart.model.dao;

import org.apache.ibatis.annotations.Mapper;

import com.project.fin.cart.model.vo.Cart;


@Mapper
public interface CartDao {

	int insertCart(Cart cart);



}
