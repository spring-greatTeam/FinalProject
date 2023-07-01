package com.project.fin.cart.model.service.impl;

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


}
