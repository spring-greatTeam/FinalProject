package com.project.fin.cart.model.service.impl;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.fin.cart.model.dao.CartDao;
import com.project.fin.cart.model.service.CartService;
import com.project.fin.cart.model.vo.Cart;

@Service
public class CartImpl implements CartService {

	@Autowired
	private CartDao cartdao;

	@Override
	public int insertCart(Cart cart) {
		return cartdao.insertCart(cart);
	}

	@Override
	public ArrayList<Cart> selectCatList(String memberId) {
		return cartdao.selectCatList(memberId);
	}

	@Override
	public int deleteCart(String userName) {
		return cartdao.deleteCart(userName);
	}

	@Override
	public int updateCart(int newQuantity, int nowCartNo) {
		return cartdao.updateCart(newQuantity, nowCartNo);
	}




}
