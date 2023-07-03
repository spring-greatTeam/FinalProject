package com.project.fin.cart.model.service;

import java.util.ArrayList;

import com.project.fin.cart.model.vo.Cart;

public interface CartService {

	int insertCart(Cart cart);

	ArrayList<Cart> selectCatList(String memberId);

	int deleteCart(String userName);

	int updateCart(int newQuantity, int nowCartNo);






}
