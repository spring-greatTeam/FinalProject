package com.project.fin.cart.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.project.fin.cart.model.vo.Cart;


@Mapper
public interface CartDao {

	int insertCart(Cart cart);

	ArrayList<Cart> selectCatList(String memberId);

	int deleteCart(String userName);

	int updateCart(int newQuantity, int nowCartNo);




}
