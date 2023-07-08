package com.project.fin.cart.model.service.impl;

import java.util.ArrayList;
import java.util.List;

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
	public List<Cart> cartList(String memberId) {
		return cartdao.cartList(memberId);
	}


	@Override
	public int updateQuantity(int updatedQuantity, int storeNo, String menuName, String opTitle, String opName) {
		return cartdao.updateQuantity(updatedQuantity, storeNo, menuName, opTitle, opName);
	}


	@Override
	public int cartDelete(int cartNo) {
		return cartdao.cartDelete(cartNo);
	}


























	




}
