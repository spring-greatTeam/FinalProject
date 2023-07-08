package com.project.fin.cart.model.service;

import java.util.ArrayList;
import java.util.List;

import com.project.fin.cart.model.vo.Cart;

public interface CartService {



	int insertCart(Cart cart);


	List<Cart> cartList(String memberId);


	int updateQuantity(int updatedQuantity, int storeNo, String menuName, String opTitle, String opName);



	int cartDelete(int cartNo);



























}
